@interface OSLogSystemEnumerator
- (OSLogSystemEnumerator)initWithEventStream:(id)a3 options:(unint64_t)a4 position:(id)a5;
- (id)nextObject;
- (void)_handleEventProxy:(id)a3;
- (void)_handleInvalidation;
- (void)dealloc;
@end

@implementation OSLogSystemEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerDone, 0);
  objc_storeStrong((id *)&self->_pushDone, 0);
  objc_storeStrong((id *)&self->_next, 0);

  objc_storeStrong((id *)&self->_stream, 0);
}

- (void)_handleInvalidation
{
  self->_done = 1;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_pushDone);
  handlerDone = self->_handlerDone;

  dispatch_semaphore_signal(handlerDone);
}

- (void)_handleEventProxy:(id)a3
{
  convertEventProxyToEntry(a3);
  self->_next = (OSLogEntry *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

- (id)nextObject
{
  if (self->_done
    || (dispatch_semaphore_signal((dispatch_semaphore_t)self->_pushDone),
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_handlerDone, 0xFFFFFFFFFFFFFFFFLL),
        self->_done))
  {
    v3 = 0;
  }
  else
  {
    v3 = self->_next;
  }

  return v3;
}

- (void)dealloc
{
  [(OSLogEventStream *)self->_stream invalidate];
  v3.receiver = self;
  v3.super_class = (Class)OSLogSystemEnumerator;
  [(OSLogSystemEnumerator *)&v3 dealloc];
}

- (OSLogSystemEnumerator)initWithEventStream:(id)a3 options:(unint64_t)a4 position:(id)a5
{
  char v6 = a4;
  id v9 = a3;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)OSLogSystemEnumerator;
  v11 = [(OSLogSystemEnumerator *)&v31 init];
  v12 = v11;
  if (v11)
  {
    p_stream = (id *)&v11->_stream;
    objc_storeStrong((id *)&v11->_stream, a3);
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    pushDone = v12->_pushDone;
    v12->_pushDone = (OS_dispatch_semaphore *)v14;

    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    handlerDone = v12->_handlerDone;
    v12->_handlerDone = (OS_dispatch_semaphore *)v16;

    objc_initWeak(&location, v12);
    id v18 = *p_stream;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __62__OSLogSystemEnumerator_initWithEventStream_options_position___block_invoke;
    v28[3] = &unk_1E6CA1D88;
    objc_copyWeak(&v29, &location);
    [v18 setEventHandler:v28];
    id v19 = *p_stream;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __62__OSLogSystemEnumerator_initWithEventStream_options_position___block_invoke_2;
    v26[3] = &unk_1E6CA1DB0;
    objc_copyWeak(&v27, &location);
    [v19 setInvalidationHandler:v26];
    [*p_stream setFlags:39];
    if (v6) {
      objc_msgSend(*p_stream, "setFlags:", objc_msgSend(*p_stream, "flags") | 8);
    }
    if (v10)
    {
      if ([v10 precision] == 1)
      {
        id v20 = *p_stream;
        v21 = [v10 date];
        [v20 activateStreamFromDate:v21];
LABEL_10:

        goto LABEL_11;
      }
      if ([v10 precision] == 2)
      {
        id v22 = *p_stream;
        [v10 offset];
        objc_msgSend(v22, "_activateStreamFromTimeIntervalSinceLastBoot:");
LABEL_11:
        v24 = v12;
        objc_destroyWeak(&v27);
        objc_destroyWeak(&v29);
        objc_destroyWeak(&location);
        goto LABEL_12;
      }
    }
    id v23 = *p_stream;
    v21 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v23 activateStreamFromDate:v21];
    goto LABEL_10;
  }
LABEL_12:

  return v12;
}

void __62__OSLogSystemEnumerator_initWithEventStream_options_position___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  objc_super v3 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    id v6 = WeakRetained[4];
    v7 = WeakRetained[5];
    v8 = v6;

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    id v9 = objc_loadWeakRetained(v3);
    [v9 _handleEventProxy:v10];

    dispatch_semaphore_signal(v7);
  }
}

void __62__OSLogSystemEnumerator_initWithEventStream_options_position___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInvalidation];
}

@end
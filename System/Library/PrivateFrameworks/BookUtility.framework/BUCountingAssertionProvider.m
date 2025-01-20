@interface BUCountingAssertionProvider
- (BOOL)_endAssertion;
- (BUCountingAssertionProvider)initWithDelegate:(id)a3;
- (id)_newAssertion:(BOOL)a3;
- (id)newAssertion;
- (id)newExtendingAssertion;
@end

@implementation BUCountingAssertionProvider

- (BUCountingAssertionProvider)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BUCountingAssertionProvider;
  v5 = [(BUCountingAssertionProvider *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("BCCountingAssertionProvider.queue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;
  }
  return v6;
}

- (id)newAssertion
{
  return (id)MEMORY[0x270F9A6D0](self, sel__newAssertion_, 1);
}

- (id)newExtendingAssertion
{
  return (id)MEMORY[0x270F9A6D0](self, sel__newAssertion_, 0);
}

- (id)_newAssertion:(BOOL)a3
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1E1994;
  block[3] = &unk_26449E0A0;
  BOOL v15 = a3;
  block[4] = self;
  block[5] = &v20;
  block[6] = &v16;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v21 + 24))
  {
    v5 = [_BUCountingAssertion alloc];
    v6 = self->_queue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_21E1E1A30;
    v13[3] = &unk_26449D948;
    v13[4] = self;
    dispatch_queue_t v8 = objc_msgSend_initWithQueue_block_(v5, v7, (uint64_t)v6, v13);
  }
  else
  {
    dispatch_queue_t v8 = 0;
  }
  if (*((unsigned char *)v17 + 24))
  {
    v9 = BUAssertionLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_21E1F1A4C(v9);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_countingAssertProviderTransitionToNonZero_(WeakRetained, v11, (uint64_t)self);
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v8;
}

- (BOOL)_endAssertion
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t count = self->_count;
  p_unint64_t count = (uint64_t *)&self->_count;
  unint64_t v4 = count;
  if (count) {
    uint64_t *p_count = v4 - 1;
  }
  v6 = BUAssertionLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_21E1F1B54(p_count, v4 == 1, v6);
  }

  return v4 == 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end
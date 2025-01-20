@interface CMCaptureUserNotificationManager
- (BOOL)hasResponse;
- (BOOL)responseWasAlternate;
- (BOOL)responseWasCancelled;
- (BOOL)responseWasDefault;
- (BOOL)responseWasOther;
- (CMCaptureUserNotificationManager)init;
- (NSDictionary)notificationDictionary;
- (NSNumber)response;
- (id)cancelNotification;
- (id)showNotification;
- (id)waitForResponse;
- (id)waitForResponseUntilTimeout:(double)a3;
- (unint64_t)_beginNotification:(id)a3;
- (unint64_t)flags;
- (void)_endNotification;
- (void)asyncResponse:(id)a3 block:(id)a4;
- (void)dealloc;
- (void)setNotificationFlags:(unint64_t)a3 andDictionary:(id)a4;
- (void)setResponse:(id)a3;
@end

@implementation CMCaptureUserNotificationManager

- (CMCaptureUserNotificationManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMCaptureUserNotificationManager;
  v2 = [(CMCaptureUserNotificationManager *)&v4 init];
  if (v2)
  {
    v2->_notificationDictionary = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("CMCaptureUserNotificationManager", 0);
    v2->_responseGroup = (OS_dispatch_group *)dispatch_group_create();
  }
  return v2;
}

- (void)dealloc
{
  notification = self->_notification;
  if (notification)
  {
    [(CMCaptureUserNotification *)notification cancel];
    [(CMCaptureUserNotificationManager *)self _endNotification];
  }

  v4.receiver = self;
  v4.super_class = (Class)CMCaptureUserNotificationManager;
  [(CMCaptureUserNotificationManager *)&v4 dealloc];
}

- (unint64_t)flags
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__CMCaptureUserNotificationManager_flags__block_invoke;
  v5[3] = &unk_1E5C246B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__CMCaptureUserNotificationManager_flags__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8);
  return result;
}

- (NSDictionary)notificationDictionary
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__21;
  v10 = __Block_byref_object_dispose__21;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__CMCaptureUserNotificationManager_notificationDictionary__block_invoke;
  v5[3] = &unk_1E5C246B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = (NSDictionary *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __58__CMCaptureUserNotificationManager_notificationDictionary__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 16) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setNotificationFlags:(unint64_t)a3 andDictionary:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__CMCaptureUserNotificationManager_setNotificationFlags_andDictionary___block_invoke;
  block[3] = &unk_1E5C249A0;
  block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
}

void *__71__CMCaptureUserNotificationManager_setNotificationFlags_andDictionary___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = *(void *)(a1 + 48);
  id v2 = *(id *)(a1 + 40);

  *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(a1 + 40);
  unint64_t v3 = *(void **)(a1 + 32);
  id result = (void *)v3[6];
  if (result)
  {
    uint64_t v5 = v3[1];
    uint64_t v6 = v3[2];
    return (void *)[result updateWithTimeout:v5 flags:v6 dictionary:0.0];
  }
  return result;
}

- (NSNumber)response
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__21;
  v10 = __Block_byref_object_dispose__21;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__CMCaptureUserNotificationManager_response__block_invoke;
  v5[3] = &unk_1E5C246B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = (NSNumber *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__CMCaptureUserNotificationManager_response__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(result + 32) + 24);
  return result;
}

- (void)setResponse:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__CMCaptureUserNotificationManager_setResponse___block_invoke;
  v4[3] = &unk_1E5C24458;
  v4[4] = a3;
  v4[5] = self;
  dispatch_sync(queue, v4);
}

void __48__CMCaptureUserNotificationManager_setResponse___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);

  *(void *)(*(void *)(a1 + 40) + 24) = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(void *)(v3 + 24))
  {
    objc_super v4 = *(void **)(v3 + 48);
    if (v4)
    {
      [v4 cancel];
      uint64_t v5 = *(void **)(a1 + 40);
      [v5 _endNotification];
    }
  }
}

- (BOOL)hasResponse
{
  return [(CMCaptureUserNotificationManager *)self response] != 0;
}

- (BOOL)responseWasDefault
{
  id v2 = [(CMCaptureUserNotificationManager *)self response];
  if (v2) {
    LOBYTE(v2) = ([(NSNumber *)v2 unsignedLongValue] & 3) == 0;
  }
  return (char)v2;
}

- (BOOL)responseWasAlternate
{
  id v2 = [(CMCaptureUserNotificationManager *)self response];
  if (v2) {
    LOBYTE(v2) = ([(NSNumber *)v2 unsignedLongValue] & 3) == 1;
  }
  return (char)v2;
}

- (BOOL)responseWasOther
{
  id v2 = [(CMCaptureUserNotificationManager *)self response];
  if (v2) {
    LOBYTE(v2) = ([(NSNumber *)v2 unsignedLongValue] & 3) == 2;
  }
  return (char)v2;
}

- (BOOL)responseWasCancelled
{
  id v2 = [(CMCaptureUserNotificationManager *)self response];
  if (v2) {
    LOBYTE(v2) = (~[(NSNumber *)v2 unsignedLongValue] & 3) == 0;
  }
  return (char)v2;
}

- (id)showNotification
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__21;
  v13 = __Block_byref_object_dispose__21;
  uint64_t v14 = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__CMCaptureUserNotificationManager_showNotification__block_invoke;
  v6[3] = &unk_1E5C27D70;
  v6[4] = self;
  v6[5] = &v9;
  objc_copyWeak(&v7, &location);
  dispatch_sync(queue, v6);
  id v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);
  return v4;
}

id *__52__CMCaptureUserNotificationManager_showNotification__block_invoke(id *result)
{
  v1 = (id *)result[4];
  if (!v1[6])
  {
    id v2 = result;

    *((void *)v2[4] + 3) = 0;
    uint64_t v3 = +[CMCaptureUserNotification notificationWithTimeout:*((void *)v2[4] + 1) flags:*((void *)v2[4] + 2) dictionary:*((void *)v2[5] + 1) + 40 error:0.0];
    id v4 = v2[5];
    if (v3)
    {
      if (!*(void *)(v4[1] + 40))
      {
        uint64_t v5 = v3;
        uint64_t v6 = (void *)[v2[4] _beginNotification:v3];
        uint64_t v7 = *((void *)v2[4] + 4);
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __52__CMCaptureUserNotificationManager_showNotification__block_invoke_2;
        v8[3] = &unk_1E5C27D48;
        objc_copyWeak(v9, v2 + 6);
        v9[1] = v6;
        [(CMCaptureUserNotification *)v5 asyncResponse:v7 block:v8];
        objc_destroyWeak(v9);
        id v4 = v2[5];
      }
    }
    return (id *)*(id *)(v4[1] + 40);
  }
  return result;
}

id __52__CMCaptureUserNotificationManager_showNotification__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id result = objc_loadWeak((id *)(a1 + 32));
  if (result)
  {
    uint64_t v5 = result;
    if (*(void *)(a1 + 40) == *((void *)result + 7))
    {

      v5[3] = (id)[NSNumber numberWithUnsignedLong:a2];
      return (id)[v5 _endNotification];
    }
  }
  return result;
}

- (id)cancelNotification
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__21;
  v10 = __Block_byref_object_dispose__21;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__CMCaptureUserNotificationManager_cancelNotification__block_invoke;
  v5[3] = &unk_1E5C24F58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __54__CMCaptureUserNotificationManager_cancelNotification__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 48);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [result cancel];
    [*(id *)(a1 + 32) _endNotification];
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return v3;
  }
  return result;
}

- (unint64_t)_beginNotification:(id)a3
{
  if (a3 && !self->_notification)
  {
    self->_notification = (CMCaptureUserNotification *)a3;
    dispatch_group_enter((dispatch_group_t)self->_responseGroup);
  }
  return self->_notificationCount;
}

- (void)_endNotification
{
  notification = self->_notification;
  if (notification)
  {

    unint64_t v4 = self->_notificationCount + 1;
    self->_notification = 0;
    self->_notificationCount = v4;
    responseGroup = self->_responseGroup;
    dispatch_group_leave(responseGroup);
  }
}

- (id)waitForResponse
{
  return [(CMCaptureUserNotificationManager *)self waitForResponseUntilTimeout:0.0];
}

- (id)waitForResponseUntilTimeout:(double)a3
{
  if (a3 == 0.0) {
    dispatch_time_t v4 = -1;
  }
  else {
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  }
  dispatch_group_wait((dispatch_group_t)self->_responseGroup, v4);
  return [(CMCaptureUserNotificationManager *)self response];
}

- (void)asyncResponse:(id)a3 block:(id)a4
{
  queue = self->_queue;
  responseGroup = self->_responseGroup;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CMCaptureUserNotificationManager_asyncResponse_block___block_invoke;
  block[3] = &unk_1E5C27D98;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_group_notify(responseGroup, queue, block);
}

void __56__CMCaptureUserNotificationManager_asyncResponse_block___block_invoke(void *a1)
{
  id v2 = *(id *)(a1[4] + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__CMCaptureUserNotificationManager_asyncResponse_block___block_invoke_2;
  v5[3] = &unk_1E5C25238;
  id v3 = a1[5];
  uint64_t v4 = a1[6];
  v5[4] = v2;
  v5[5] = v4;
  dispatch_async(v3, v5);
}

void __56__CMCaptureUserNotificationManager_asyncResponse_block___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);
}

@end
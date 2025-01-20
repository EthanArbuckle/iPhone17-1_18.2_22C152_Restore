@interface DirectUserNotification
- (id)cancel;
- (id)initNotificationWithTimeout:(double)a3 flags:(unint64_t)a4 dictionary:(id)a5 error:(id *)a6;
- (id)updateWithTimeout:(double)a3 flags:(unint64_t)a4 dictionary:(id)a5;
- (unint64_t)receiveResponseWithTimeout:(double)a3 error:(id *)a4;
- (void)asyncResponse:(id)a3 block:(id)a4;
- (void)dealloc;
@end

@implementation DirectUserNotification

- (id)initNotificationWithTimeout:(double)a3 flags:(unint64_t)a4 dictionary:(id)a5 error:(id *)a6
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)DirectUserNotification;
  v10 = [(CMCaptureUserNotification *)&v18 initForSubclass];
  if (v10)
  {
    SInt32 error = 0;
    CFUserNotificationRef v11 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, a4, &error, (CFDictionaryRef)a5);
    v10[1] = v11;
    if (a6)
    {
      uint64_t v12 = error;
      if (error)
      {
        v13 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v14 = *MEMORY[0x1E4F28760];
        v19 = @"description";
        v20[0] = objc_msgSend(NSString, "stringWithFormat:", @"%s %s:%d", "-[DirectUserNotification initNotificationWithTimeout:flags:dictionary:error:]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/CMCapture/Sources/Common/CMCaptureUserNotification.m", 286);
        v15 = objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v12, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1));
      }
      else
      {
        v15 = 0;
      }
      *a6 = v15;
      CFUserNotificationRef v11 = (CFUserNotificationRef)v10[1];
    }
    if (!v11)
    {

      return 0;
    }
  }
  return v10;
}

- (void)dealloc
{
  notification = self->_notification;
  if (notification) {
    CFRelease(notification);
  }
  v4.receiver = self;
  v4.super_class = (Class)DirectUserNotification;
  [(DirectUserNotification *)&v4 dealloc];
}

- (unint64_t)receiveResponseWithTimeout:(double)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  CFOptionFlags responseFlags = 0;
  SInt32 v5 = CFUserNotificationReceiveResponse(self->_notification, a3, &responseFlags);
  if (a4)
  {
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = *MEMORY[0x1E4F28760];
      uint64_t v8 = v5;
      uint64_t v12 = @"description";
      v13[0] = objc_msgSend(NSString, "stringWithFormat:", @"%s %s:%d", "-[DirectUserNotification receiveResponseWithTimeout:error:]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/CMCapture/Sources/Common/CMCaptureUserNotification.m", 310);
      v9 = objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, v8, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1));
    }
    else
    {
      v9 = 0;
    }
    *a4 = v9;
  }
  return responseFlags;
}

- (void)asyncResponse:(id)a3 block:(id)a4
{
  v6 = self;
  global_queue = dispatch_get_global_queue(21, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__DirectUserNotification_asyncResponse_block___block_invoke;
  v8[3] = &unk_1E5C25238;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async(global_queue, v8);
}

void __46__DirectUserNotification_asyncResponse_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [*(id *)(a1 + 32) receiveResponseWithTimeout:0 error:0.0]);
  v2 = *(void **)(a1 + 32);
}

- (id)updateWithTimeout:(double)a3 flags:(unint64_t)a4 dictionary:(id)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  SInt32 v5 = CFUserNotificationUpdate(self->_notification, a3, a4, (CFDictionaryRef)a5);
  if (!v5) {
    return 0;
  }
  v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28760];
  uint64_t v8 = v5;
  v11[0] = objc_msgSend(NSString, "stringWithFormat:", @"%s %s:%d", "-[DirectUserNotification updateWithTimeout:flags:dictionary:]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/CMCapture/Sources/Common/CMCaptureUserNotification.m", 331, @"description");
  return (id)objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, v8, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
}

- (id)cancel
{
  v8[1] = *MEMORY[0x1E4F143B8];
  SInt32 v2 = CFUserNotificationCancel(self->_notification);
  if (!v2) {
    return 0;
  }
  v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F28760];
  uint64_t v5 = v2;
  v8[0] = objc_msgSend(NSString, "stringWithFormat:", @"%s %s:%d", "-[DirectUserNotification cancel]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/CMCapture/Sources/Common/CMCaptureUserNotification.m", 340, @"description");
  return (id)objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, v5, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
}

@end
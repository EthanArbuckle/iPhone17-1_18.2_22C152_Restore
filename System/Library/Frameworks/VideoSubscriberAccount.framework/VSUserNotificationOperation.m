@interface VSUserNotificationOperation
- (NSString)alternateButtonTitle;
- (NSString)defaultButtonTitle;
- (NSString)message;
- (NSString)title;
- (NSURL)iconURL;
- (VSUserNotificationOperation)init;
- (unint64_t)response;
- (void)cancel;
- (void)main;
- (void)setAlternateButtonTitle:(id)a3;
- (void)setDefaultButtonTitle:(id)a3;
- (void)setIconURL:(id)a3;
- (void)setMessage:(id)a3;
- (void)setResponse:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setUserNotificationCancelProc:(void *)a3;
- (void)setUserNotificationCreateProc:(void *)a3;
- (void)setUserNotificationReceiveResponseProc:(void *)a3;
- (void)userNotificationCancelProc;
- (void)userNotificationCreateProc;
- (void)userNotificationReceiveResponseProc;
@end

@implementation VSUserNotificationOperation

- (VSUserNotificationOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)VSUserNotificationOperation;
  result = [(VSUserNotificationOperation *)&v3 init];
  if (result)
  {
    result->_userNotificationCreateProc = (void *)MEMORY[0x1E4F1C2B8];
    result->_userNotificationReceiveResponseProc = (void *)MEMORY[0x1E4F1C2C0];
    result->_userNotificationCancelProc = (void *)MEMORY[0x1E4F1C2B0];
  }
  return result;
}

- (void)main
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[VSUserNotificationOperation main]";
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (([(VSUserNotificationOperation *)self isCancelled] & 1) == 0)
  {
    int v18 = 0;
    uint64_t v4 = *MEMORY[0x1E4F1CF80];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v6 = [(VSUserNotificationOperation *)self iconURL];
    if (v6) {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F1D9E8], v6);
    }
    v7 = [(VSUserNotificationOperation *)self title];
    if (v7) {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F1D990], v7);
    }
    v8 = [(VSUserNotificationOperation *)self message];
    if (v8) {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F1D9A8], v8);
    }
    v9 = [(VSUserNotificationOperation *)self defaultButtonTitle];
    if (v9) {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F1D9E0], v9);
    }
    v10 = [(VSUserNotificationOperation *)self alternateButtonTitle];
    if (v10) {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F1D9D0], v10);
    }
    v11 = VSDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA674000, v11, OS_LOG_TYPE_DEFAULT, "Will present user notification", buf, 2u);
    }

    self->_notification = (__CFUserNotification *)((uint64_t (*)(uint64_t, void, int *, __CFDictionary *, double))[(VSUserNotificationOperation *)self userNotificationCreateProc])(v4, 0, &v18, Mutable, 0.0);
    v12 = VSDefaultLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA674000, v12, OS_LOG_TYPE_DEFAULT, "Did present user notification", buf, 2u);
    }

    CFRelease(Mutable);
    v13 = VSDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA674000, v13, OS_LOG_TYPE_DEFAULT, "Will wait to receive user notification response", buf, 2u);
    }

    unint64_t v17 = 0;
    ((void (*)(__CFUserNotification *, unint64_t *, double))[(VSUserNotificationOperation *)self userNotificationReceiveResponseProc])(self->_notification, &v17, 0.0);
    v14 = VSDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA674000, v14, OS_LOG_TYPE_DEFAULT, "Did receive user notification response", buf, 2u);
    }

    if (v17 > 3) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = qword_1DA74D690[v17];
    }
    [(VSUserNotificationOperation *)self setResponse:v15];
    v16 = VSDefaultLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[VSUserNotificationOperation main]";
      _os_log_impl(&dword_1DA674000, v16, OS_LOG_TYPE_DEFAULT, "Will exit %s", buf, 0xCu);
    }
  }
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)VSUserNotificationOperation;
  [(VSUserNotificationOperation *)&v3 cancel];
  ((void (*)(__CFUserNotification *))[(VSUserNotificationOperation *)self userNotificationCancelProc])(self->_notification);
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (void)setDefaultButtonTitle:(id)a3
{
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (void)setAlternateButtonTitle:(id)a3
{
}

- (unint64_t)response
{
  return self->_response;
}

- (void)setResponse:(unint64_t)a3
{
  self->_response = a3;
}

- (void)userNotificationCreateProc
{
  return self->_userNotificationCreateProc;
}

- (void)setUserNotificationCreateProc:(void *)a3
{
  self->_userNotificationCreateProc = a3;
}

- (void)userNotificationReceiveResponseProc
{
  return self->_userNotificationReceiveResponseProc;
}

- (void)setUserNotificationReceiveResponseProc:(void *)a3
{
  self->_userNotificationReceiveResponseProc = a3;
}

- (void)userNotificationCancelProc
{
  return self->_userNotificationCancelProc;
}

- (void)setUserNotificationCancelProc:(void *)a3
{
  self->_userNotificationCancelProc = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_iconURL, 0);
}

@end
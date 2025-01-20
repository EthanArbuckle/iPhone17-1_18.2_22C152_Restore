@interface CMIOUserNotification
- (id)_createOrUpdate:(const char *)a3 withTimeout:(double)a4 flags:(unint64_t)a5 dictionary:(id)a6;
- (id)cancel;
- (id)initNotificationWithTimeout:(double)a3 flags:(unint64_t)a4 dictionary:(id)a5 error:(id *)a6;
- (id)updateWithTimeout:(double)a3 flags:(unint64_t)a4 dictionary:(id)a5;
- (unint64_t)receiveResponseWithTimeout:(double)a3 error:(id *)a4;
- (void)_closeConnection;
- (void)_handleXPCEvent:(id)a3;
- (void)asyncResponse:(id)a3 block:(id)a4;
- (void)dealloc;
@end

@implementation CMIOUserNotification

- (id)initNotificationWithTimeout:(double)a3 flags:(unint64_t)a4 dictionary:(id)a5 error:(id *)a6
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)CMIOUserNotification;
  id v10 = [(CMCaptureUserNotification *)&v24 initForSubclass];
  if (v10)
  {
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *((void *)v10 + 1) = dispatch_queue_create_with_target_V2("CMIOUserNotification", v11, 0);
    v12 = dispatch_group_create();
    *((void *)v10 + 2) = v12;
    dispatch_group_enter(v12);
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.cmio.registerassistantservice", 0, 2uLL);
    *((void *)v10 + 4) = mach_service;
    if (mach_service)
    {
      *((unsigned char *)v10 + 41) = 1;
      objc_initWeak(&location, v10);
      xpc_connection_set_target_queue(*((xpc_connection_t *)v10 + 4), *((dispatch_queue_t *)v10 + 1));
      v14 = (_xpc_connection_s *)*((void *)v10 + 4);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __75__CMIOUserNotification_initNotificationWithTimeout_flags_dictionary_error___block_invoke;
      handler[3] = &unk_1E5C24538;
      objc_copyWeak(&v22, &location);
      xpc_connection_set_event_handler(v14, handler);
      xpc_connection_resume(*((xpc_connection_t *)v10 + 4));
      xpc_object_t empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_BOOL(empty, "user-notification", 1);
      xpc_connection_send_message(*((xpc_connection_t *)v10 + 4), empty);
      xpc_release(empty);
      v16 = (void *)[v10 _createOrUpdate:"notifications-msgtype-create" withTimeout:a4 flags:a5 dictionary:a3];
      if (a6) {
        *a6 = v16;
      }
      if (v16)
      {

        id v10 = 0;
      }
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    else
    {

      if (a6)
      {
        v17 = (void *)MEMORY[0x1E4F28C58];
        v25 = @"description";
        v26[0] = objc_msgSend(NSString, "stringWithFormat:", @"%s %s:%d", "-[CMIOUserNotification initNotificationWithTimeout:flags:dictionary:error:]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/CMCapture/Sources/Common/CMCaptureUserNotification.m", 404);
        uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
        v19 = (void *)[v17 errorWithDomain:*MEMORY[0x1E4F28760] code:-12783 userInfo:v18];
        id v10 = 0;
        *a6 = v19;
      }
      else
      {
        return 0;
      }
    }
  }
  return v10;
}

uint64_t __75__CMIOUserNotification_initNotificationWithTimeout_flags_dictionary_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _handleXPCEvent:a2];
}

- (void)dealloc
{
  [(CMIOUserNotification *)self _closeConnection];

  dispatch_release((dispatch_object_t)self->_responseGroup);
  v3.receiver = self;
  v3.super_class = (Class)CMIOUserNotification;
  [(CMIOUserNotification *)&v3 dealloc];
}

- (void)_closeConnection
{
  userNotificationServiceConnection = self->_userNotificationServiceConnection;
  if (userNotificationServiceConnection)
  {
    if (self->_connectionIsValid) {
      xpc_connection_cancel(userNotificationServiceConnection);
    }
    self->_connectionIsValid = 0;
    xpc_release(self->_userNotificationServiceConnection);
    self->_userNotificationServiceConnection = 0;
    responseGroup = self->_responseGroup;
    dispatch_group_leave(responseGroup);
  }
}

- (void)_handleXPCEvent:(id)a3
{
  uint64_t v5 = MEMORY[0x1A62739E0](a3, a2);
  if (v5 == MEMORY[0x1E4F145A8])
  {
    if (a3 != (id)MEMORY[0x1E4F14528] || MEMORY[0x1E4F14520] == MEMORY[0x1E4F14528]) {
      goto LABEL_13;
    }
    char v7 = 0;
    v8 = &OBJC_IVAR___CMIOUserNotification__connectionIsValid;
  }
  else
  {
    if (v5 != MEMORY[0x1E4F14590]) {
      return;
    }
    string = xpc_dictionary_get_string(a3, "notifications-param-message-type");
    if (!string || strcmp(string, "notifications-msgtype-read-response")) {
      return;
    }
    self->_response = xpc_dictionary_get_int64(a3, "notifications-param-response");
    char v7 = 1;
    v8 = &OBJC_IVAR___CMIOUserNotification__responseIsValid;
  }
  *((unsigned char *)&self->super.super.isa + *v8) = v7;
LABEL_13:
  [(CMIOUserNotification *)self _closeConnection];
}

- (unint64_t)receiveResponseWithTimeout:(double)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 0.0) {
    dispatch_time_t v6 = -1;
  }
  else {
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  }
  intptr_t v7 = dispatch_group_wait((dispatch_group_t)self->_responseGroup, v6);
  if (v7)
  {
    if (a4)
    {
LABEL_6:
      v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F28760];
      v13[0] = objc_msgSend(NSString, "stringWithFormat:", @"%s %s:%d", "-[CMIOUserNotification receiveResponseWithTimeout:error:]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/CMCapture/Sources/Common/CMCaptureUserNotification.m", 477, @"description");
      id v10 = objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v7, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1));
LABEL_10:
      *a4 = v10;
    }
  }
  else if (self->_responseIsValid)
  {
    if (a4)
    {
      id v10 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    if (self->_connectionIsValid) {
      intptr_t v7 = -12783;
    }
    else {
      intptr_t v7 = -12785;
    }
    if (a4) {
      goto LABEL_6;
    }
  }
  return self->_response;
}

- (id)updateWithTimeout:(double)a3 flags:(unint64_t)a4 dictionary:(id)a5
{
  return [(CMIOUserNotification *)self _createOrUpdate:"notifications-msgtype-update" withTimeout:a4 flags:a5 dictionary:a3];
}

- (id)_createOrUpdate:(const char *)a3 withTimeout:(double)a4 flags:(unint64_t)a5 dictionary:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (!self->_connectionIsValid)
  {
    int int64 = -12785;
LABEL_13:
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28760];
    v21[0] = objc_msgSend(NSString, "stringWithFormat:", @"%s %s:%d", "-[CMIOUserNotification _createOrUpdate:withTimeout:flags:dictionary:]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/CMCapture/Sources/Common/CMCaptureUserNotification.m", 529, @"description");
    return (id)objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, int64, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1));
  }
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "notifications-param-message-type", a3);
  xpc_dictionary_set_double(empty, "notifications-param-timeout", a4);
  xpc_dictionary_set_int64(empty, "notifications-param-flags", a5);
  v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v11)
  {
    uint64_t v12 = v11;
    xpc_dictionary_set_value(empty, "notifications-param-dictionary", v11);
    xpc_release(v12);
    xpc_object_t v13 = xpc_connection_send_message_with_reply_sync(self->_userNotificationServiceConnection, empty);
    if (v13)
    {
      v14 = v13;
      uint64_t v15 = MEMORY[0x1A62739E0]();
      if (v15 == MEMORY[0x1E4F145A8])
      {
        int int64 = -12788;
      }
      else if (v15 == MEMORY[0x1E4F14590])
      {
        int int64 = xpc_dictionary_get_int64(v14, "errorReturn");
      }
      else
      {
        int int64 = -12780;
      }
      xpc_release(v14);
    }
    else
    {
      int int64 = -12783;
    }
  }
  else
  {
    int int64 = -12780;
  }
  if (empty) {
    xpc_release(empty);
  }
  if (int64) {
    goto LABEL_13;
  }
  return 0;
}

- (void)asyncResponse:(id)a3 block:(id)a4
{
  intptr_t v7 = self;
  responseGroup = self->_responseGroup;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__CMIOUserNotification_asyncResponse_block___block_invoke;
  v9[3] = &unk_1E5C24E50;
  v9[4] = self;
  v9[5] = a4;
  dispatch_group_notify(responseGroup, (dispatch_queue_t)a3, v9);
}

uint64_t __44__CMIOUserNotification_asyncResponse_block___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 40))
  {
    uint64_t v2 = a1;
    a1 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v1 = *(void *)(v2 + 32);
  }
  return MEMORY[0x1F41817F8](a1, v1);
}

- (id)cancel
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (!self->_connectionIsValid)
  {
    int int64 = -12785;
    goto LABEL_12;
  }
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "notifications-param-message-type", "notifications-msgtype-cancel");
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(self->_userNotificationServiceConnection, empty);
  if (v4)
  {
    uint64_t v5 = v4;
    if (MEMORY[0x1A62739E0]() != MEMORY[0x1E4F14590] || MEMORY[0x1E4F145A8] == MEMORY[0x1E4F14590]) {
      int int64 = -12788;
    }
    else {
      int int64 = xpc_dictionary_get_int64(v5, "errorReturn");
    }
    xpc_release(v5);
    if (empty) {
      goto LABEL_10;
    }
  }
  else
  {
    int int64 = -12788;
    if (empty) {
LABEL_10:
    }
      xpc_release(empty);
  }
  if (int64)
  {
LABEL_12:
    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28760];
    v12[0] = objc_msgSend(NSString, "stringWithFormat:", @"%s %s:%d", "-[CMIOUserNotification cancel]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/CMCapture/Sources/Common/CMCaptureUserNotification.m", 578, @"description");
    return (id)objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, int64, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  }
  return 0;
}

@end
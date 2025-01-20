@interface NEHelper
- (BOOL)isSynchronous;
- (NEHelper)initWithDelegateClassID:(int)a3 queue:(id)a4;
- (NEHelper)initWithDelegateClassID:(int)a3 queue:(id)a4 additionalProperties:(id)a5;
- (id)incomingMessageHandler;
- (void)dealloc;
- (void)sendRequest:(id)a3 responseHandler:(id)a4;
- (void)setIncomingMessageHandler:(id)a3;
- (void)setIsSynchronous:(BOOL)a3;
@end

@implementation NEHelper

- (NEHelper)initWithDelegateClassID:(int)a3 queue:(id)a4 additionalProperties:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NEHelper;
  v11 = [(NEHelper *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a4);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("NEHelper connection queue", v13);
    connectionQueue = v12->_connectionQueue;
    v12->_connectionQueue = (OS_dispatch_queue *)v14;

    v12->_lock._os_unfair_lock_opaque = 0;
    v12->_classID = a3;
    objc_storeStrong((id *)&v12->_additionalProperties, a5);
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalProperties, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong(&self->_incomingMessageHandler, 0);
}

- (void)setIsSynchronous:(BOOL)a3
{
  self->_isSynchronous = a3;
}

- (BOOL)isSynchronous
{
  return self->_isSynchronous;
}

- (void)setIncomingMessageHandler:(id)a3
{
}

- (id)incomingMessageHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)sendRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (self)
  {
    os_unfair_lock_assert_owner(&self->_lock);
    connection = self->_connection;
    if (connection)
    {
LABEL_3:
      id v10 = connection;
      goto LABEL_8;
    }
    Property = objc_getProperty(self, v8, 48, 1);
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.nehelper", Property, 2uLL);
    xpc_connection_t v13 = mach_service;
    if (mach_service && MEMORY[0x19F3B92C0](mach_service) == MEMORY[0x1E4F14578])
    {
      objc_initWeak(&location, self);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __25__NEHelper_getConnection__block_invoke;
      handler[3] = &unk_1E598FEF0;
      handler[4] = self;
      objc_copyWeak(&v33, &location);
      v21 = v13;
      v32 = v21;
      xpc_connection_set_event_handler(v21, handler);
      xpc_connection_resume(v21);
      additionalProperties = self->_additionalProperties;
      if (additionalProperties)
      {
        v23 = additionalProperties;
        v24 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      }
      else
      {
        v24 = xpc_dictionary_create(0, 0, 0);
      }
      xpc_dictionary_set_uint64(v24, "delegate-class-id", self->_classID);
      xpc_connection_send_message(v21, v24);
      v25 = self->_connection;
      self->_connection = v21;
      v26 = v21;

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
      connection = self->_connection;
      goto LABEL_3;
    }
  }
  id v10 = 0;
LABEL_8:
  os_unfair_lock_unlock(&self->_lock);
  if (v7)
  {
    if (v10)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __40__NEHelper_sendRequest_responseHandler___block_invoke_2;
      aBlock[3] = &unk_1E598FF18;
      aBlock[4] = self;
      id v28 = v7;
      dispatch_queue_t v14 = (void (**)(void *, xpc_object_t))_Block_copy(aBlock);
      if ([(NEHelper *)self isSynchronous])
      {
        xpc_object_t v16 = xpc_connection_send_message_with_reply_sync(v10, v6);
        v14[2](v14, v16);
      }
      else
      {
        if (self) {
          v19 = objc_getProperty(self, v15, 40, 1);
        }
        else {
          v19 = 0;
        }
        xpc_connection_send_message_with_reply(v10, v6, v19, v14);
      }

      v20 = v28;
LABEL_25:

      goto LABEL_26;
    }
    objc_super v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(handler[0]) = 0;
      _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, "Failed to send a message to nehelper: connection is nil", (uint8_t *)handler, 2u);
    }

    if (![(NEHelper *)self isSynchronous])
    {
      if (self) {
        self = (NEHelper *)objc_getProperty(self, v18, 40, 1);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__NEHelper_sendRequest_responseHandler___block_invoke;
      block[3] = &unk_1E5993770;
      id v30 = v7;
      dispatch_async(&self->super, block);
      v20 = v30;
      goto LABEL_25;
    }
    (*((void (**)(id, void, uint64_t, void))v7 + 2))(v7, 0, 5, 0);
  }
  else if (v10)
  {
    xpc_connection_send_message(v10, v6);
  }
LABEL_26:
}

uint64_t __40__NEHelper_sendRequest_responseHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __40__NEHelper_sendRequest_responseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (v3 && MEMORY[0x19F3B92C0](v3) == MEMORY[0x1E4F14590])
  {
    xpc_dictionary_get_int64(v4, "result-code");
    id v7 = xpc_dictionary_get_value(v4, "result-data");
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = (void *)MEMORY[0x19F3B90E0](v4);
    id v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      if (v8) {
        LODWORD(v8) = *(_DWORD *)(v8 + 16);
      }
      v9[0] = 67109378;
      v9[1] = v8;
      __int16 v10 = 2080;
      v11 = v5;
      _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "Failed to send a %d message to nehelper: %s", (uint8_t *)v9, 0x12u);
    }

    free(v5);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __25__NEHelper_getConnection__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v3, 40, 1);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__NEHelper_getConnection__block_invoke_2;
  block[3] = &unk_1E5990A30;
  id v6 = Property;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  id v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v11);
}

void __25__NEHelper_getConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    if (MEMORY[0x19F3B92C0]() == MEMORY[0x1E4F145A8])
    {
      v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), (const char *)*MEMORY[0x1E4F14530]);
        int v10 = 136315138;
        id v11 = string;
        _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEFAULT, "Lost connection to nehelper: %s", (uint8_t *)&v10, 0xCu);
      }

      os_unfair_lock_lock(WeakRetained + 2);
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
      id v7 = *(void **)&WeakRetained[8]._os_unfair_lock_opaque;
      *(void *)&WeakRetained[8]._os_unfair_lock_opaque = 0;

      os_unfair_lock_unlock(WeakRetained + 2);
    }
    else if (*(void *)(a1 + 32) && MEMORY[0x19F3B92C0]() == MEMORY[0x1E4F14590])
    {
      id v3 = [(os_unfair_lock_s *)WeakRetained incomingMessageHandler];

      if (v3)
      {
        id v4 = [(os_unfair_lock_s *)WeakRetained incomingMessageHandler];
        v4[2](v4, *(void *)(a1 + 32));
      }
      else
      {
        uint64_t v8 = (char *)MEMORY[0x19F3B90E0](*(void *)(a1 + 32));
        id v9 = ne_log_obj();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136315138;
          id v11 = v8;
          _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEFAULT, "Got an unexpected message on the nehelper connection: %s", (uint8_t *)&v10, 0xCu);
        }

        free(v8);
      }
    }
  }
}

- (void)dealloc
{
  if (self)
  {
    connection = self->_connection;
    if (connection)
    {
      xpc_connection_cancel(connection);
      objc_storeStrong((id *)&self->_connection, 0);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NEHelper;
  [(NEHelper *)&v4 dealloc];
}

- (NEHelper)initWithDelegateClassID:(int)a3 queue:(id)a4
{
  return [(NEHelper *)self initWithDelegateClassID:*(void *)&a3 queue:a4 additionalProperties:0];
}

@end
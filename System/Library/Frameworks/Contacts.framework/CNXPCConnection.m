@interface CNXPCConnection
- (CNXPCConnection)initWithConnection:(id)a3 interface:(id)a4 logger:(id)a5;
- (id)remoteResultForSelector:(SEL)a3 error:(id *)a4;
- (id)remoteResultForSelector:(SEL)a3 param1:(id)a4 error:(id *)a5;
- (id)remoteResultForSelector:(SEL)a3 param1:(id)a4 param2:(id)a5 error:(id *)a6;
- (id)remoteResultForSelector:(SEL)a3 parameters:(id)a4 error:(id *)a5;
- (id)serviceProxy;
- (void)dealloc;
@end

@implementation CNXPCConnection

- (id)remoteResultForSelector:(SEL)a3 error:(id *)a4
{
  return [(CNXPCConnection *)self remoteResultForSelector:a3 parameters:0 error:a4];
}

- (id)remoteResultForSelector:(SEL)a3 parameters:(id)a4 error:(id *)a5
{
  id v9 = a4;
  if (self && objc_getProperty(self, v8, 16, 1))
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__7;
    v42 = __Block_byref_object_dispose__7;
    id v43 = 0;
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__7;
    v36 = __Block_byref_object_dispose__7;
    id v37 = 0;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__CNXPCConnection_remoteResultForSelector_parameters_error___block_invoke;
    aBlock[3] = &unk_1E56B4C70;
    aBlock[4] = &v38;
    aBlock[5] = &v32;
    aBlock[6] = &v28;
    v10 = _Block_copy(aBlock);
    uint64_t v11 = [v9 count];
    v12 = [(CNXPCConnection *)self serviceProxy];
    v13 = v12;
    switch(v11)
    {
      case 0:
        objc_msgSend(v12, a3, v10);
        break;
      case 1:
        objc_msgSend(v12, a3, objc_msgSend(v9, "pointerAtIndex:", 0), v10);
        break;
      case 2:
        objc_msgSend(v12, a3, objc_msgSend(v9, "pointerAtIndex:", 0), objc_msgSend(v9, "pointerAtIndex:", 1), v10);
        break;
      case 3:
        objc_msgSend(v12, a3, objc_msgSend(v9, "pointerAtIndex:", 0), objc_msgSend(v9, "pointerAtIndex:", 1), objc_msgSend(v9, "pointerAtIndex:", 2), v10);
        break;
      case 4:
        objc_msgSend(v12, a3, objc_msgSend(v9, "pointerAtIndex:", 0), objc_msgSend(v9, "pointerAtIndex:", 1), objc_msgSend(v9, "pointerAtIndex:", 2), objc_msgSend(v9, "pointerAtIndex:", 3), v10);
        break;
      default:
        v14 = (void *)MEMORY[0x1E4F1CA00];
        v15 = NSString;
        v16 = NSStringFromSelector(a3);
        v17 = [v15 stringWithFormat:@"Too many arguments to %@", v16];
        id v18 = (id)[v14 exceptionWithName:@"CNXPCVariadicOverflow" reason:v17 userInfo:0];

        break;
    }
    if (!*((unsigned char *)v29 + 24))
    {
      uint64_t v19 = +[CNErrorFactory errorWithCode:1 userInfo:0];
      v20 = (void *)v33[5];
      v33[5] = v19;
    }
    v21 = (void *)v33[5];
    id v22 = (id)v39[5];
    v23 = v22;
    if (a5 && !v22) {
      *a5 = v21;
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);

    _Block_object_dispose(&v38, 8);
  }
  else
  {
    v24 = +[CNErrorFactory errorWithCode:100 userInfo:0];
    v25 = v24;
    if (a5) {
      *a5 = v24;
    }

    v23 = 0;
  }

  return v23;
}

- (id)serviceProxy
{
  return self->_serviceProxy;
}

- (CNXPCConnection)initWithConnection:(id)a3 interface:(id)a4 logger:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9
    && (v32.receiver = self,
        v32.super_class = (Class)CNXPCConnection,
        v12 = [(CNXPCConnection *)&v32 init],
        (self = v12) != 0))
  {
    objc_storeStrong((id *)&v12->_logger, a5);
    objc_storeStrong((id *)&self->_connection, a3);
    connection = self->_connection;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __55__CNXPCConnection_initWithConnection_interface_logger___block_invoke;
    v29[3] = &unk_1E56B3DC8;
    id v14 = v11;
    id v30 = v14;
    id v15 = v9;
    id v31 = v15;
    [(NSXPCConnection *)connection setInterruptionHandler:v29];
    v16 = self->_connection;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __55__CNXPCConnection_initWithConnection_interface_logger___block_invoke_2;
    v26[3] = &unk_1E56B3DC8;
    id v17 = v14;
    id v27 = v17;
    id v28 = v15;
    [(NSXPCConnection *)v16 setInvalidationHandler:v26];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v10];
    [(NSXPCConnection *)self->_connection resume];
    id Property = objc_getProperty(self, v18, 16, 1);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __55__CNXPCConnection_initWithConnection_interface_logger___block_invoke_3;
    v24[3] = &unk_1E56B49B0;
    id v25 = v17;
    v20 = [Property synchronousRemoteObjectProxyWithErrorHandler:v24];
    id serviceProxy = self->_serviceProxy;
    self->_id serviceProxy = v20;

    self = self;
    id v22 = self;
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

void __60__CNXPCConnection_remoteResultForSelector_parameters_error___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[4] + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[5] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
}

void __55__CNXPCConnection_initWithConnection_interface_logger___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) serviceName];
  [v1 XPCConnectionWasInterruptedForService:v2];
}

void __55__CNXPCConnection_initWithConnection_interface_logger___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) serviceName];
  [v1 XPCConnectionWasInvalidatedForService:v2];
}

uint64_t __55__CNXPCConnection_initWithConnection_interface_logger___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) serviceError:a2];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CNXPCConnection;
  [(CNXPCConnection *)&v3 dealloc];
}

- (id)remoteResultForSelector:(SEL)a3 param1:(id)a4 error:(id *)a5
{
  v8 = (void *)MEMORY[0x1E4F28F50];
  id v9 = a4;
  id v10 = [v8 weakObjectsPointerArray];
  [v10 addPointer:v9];

  id v11 = [(CNXPCConnection *)self remoteResultForSelector:a3 parameters:v10 error:a5];

  return v11;
}

- (id)remoteResultForSelector:(SEL)a3 param1:(id)a4 param2:(id)a5 error:(id *)a6
{
  id v10 = (void *)MEMORY[0x1E4F28F50];
  id v11 = a5;
  id v12 = a4;
  v13 = [v10 weakObjectsPointerArray];
  [v13 addPointer:v12];

  [v13 addPointer:v11];
  id v14 = [(CNXPCConnection *)self remoteResultForSelector:a3 parameters:v13 error:a6];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong(&self->_serviceProxy, 0);
}

@end
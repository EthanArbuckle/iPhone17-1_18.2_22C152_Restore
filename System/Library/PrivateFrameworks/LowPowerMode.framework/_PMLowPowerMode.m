@interface _PMLowPowerMode
+ (id)sharedInstance;
- (BOOL)setPowerMode:(int64_t)a3 fromSource:(id)a4;
- (BOOL)setPowerMode:(int64_t)a3 fromSource:(id)a4 withParams:(id)a5;
- (_PMLowPowerMode)init;
- (int64_t)getPowerMode;
- (void)dealloc;
- (void)setPowerMode:(int64_t)a3 fromSource:(id)a4 withCompletion:(id)a5;
- (void)setPowerMode:(int64_t)a3 fromSource:(id)a4 withParams:(id)a5 withCompletion:(id)a6;
@end

@implementation _PMLowPowerMode

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_saver;
  return v2;
}

- (_PMLowPowerMode)init
{
  v7.receiver = self;
  v7.super_class = (Class)_PMLowPowerMode;
  v2 = [(_PMLowPowerMode *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.powerd.lowpowermode" options:4096];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C5FBAF8];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_PMLowPowerMode;
  [(_PMLowPowerMode *)&v3 dealloc];
}

- (void)setPowerMode:(int64_t)a3 fromSource:(id)a4 withCompletion:(id)a5
{
}

- (void)setPowerMode:(int64_t)a3 fromSource:(id)a4 withParams:(id)a5 withCompletion:(id)a6
{
  id v10 = a6;
  connection = self->_connection;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69___PMLowPowerMode_setPowerMode_fromSource_withParams_withCompletion___block_invoke;
  v16[3] = &unk_264241370;
  id v17 = v10;
  id v12 = v10;
  id v13 = a5;
  id v14 = a4;
  v15 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v16];
  [v15 setPowerMode:a3 fromSource:v14 withParams:v13 withCompletion:v12];
}

- (BOOL)setPowerMode:(int64_t)a3 fromSource:(id)a4
{
  return [(_PMLowPowerMode *)self setPowerMode:a3 fromSource:a4 withParams:0];
}

- (BOOL)setPowerMode:(int64_t)a3 fromSource:(id)a4 withParams:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  connection = self->_connection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54___PMLowPowerMode_setPowerMode_fromSource_withParams___block_invoke;
  v14[3] = &unk_264241398;
  v14[4] = &v15;
  v11 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54___PMLowPowerMode_setPowerMode_fromSource_withParams___block_invoke_2;
  v13[3] = &unk_2642413C0;
  v13[4] = &v15;
  [v11 setPowerMode:a3 fromSource:v8 withParams:v9 withCompletion:v13];

  LOBYTE(a3) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return a3;
}

- (int64_t)getPowerMode
{
  v2 = [MEMORY[0x263F08AB0] processInfo];
  unsigned int v3 = [v2 isLowPowerModeEnabled];

  return v3;
}

- (void).cxx_destruct
{
}

@end
@interface Lt10zus2DOk3OfFf
+ (id)sharedInstance;
- (BOOL)l7UrdRfCzeduYqtA:(id)a3;
- (Lt10zus2DOk3OfFf)initWithServiceName:(id)a3;
- (id)BFzukpKGO3cStNGp:(id)a3;
- (void)JI0A3nkqsab9cUj8:(id)a3 completion:(id)a4;
- (void)QeMnG23X94qgz7jT:(id)a3 hostChallenge:(id)a4 challengeResponse:(id)a5 seid:(id)a6 nonce:(id)a7 completion:(id)a8;
- (void)Z8aAH7stm0EYhyxg:(id)a3 xz5EHXEN4FjlhJbi:(id)a4 uhVTXyAfCFn7u0Ue:(id)a5 EQUjQp7JcQbqcPcD:(id)a6 A5wDLa5TFdFZlz3A:(id)a7 TJKMyOe6zn5PdGIr:(id)a8 eCqgGM0WcnHOslnr:(unint64_t)a9 eCszfxdv3kUXvhgV:(unint64_t)a10 uWp4aZpP2vLhc04Q:(id)a11 QZYtNpvp0hKd248p:(id)a12 oCwPYmtRv8s31KUH:(id)a13 completion:(id)a14;
- (void)ZfE6lVphNUVrZcKx:(id)a3 completion:(id)a4;
- (void)dKsJLlNX54lzKt5n:(id)a3 eqF2XJh3hHBJQf2K:(id)a4;
- (void)evrtH713YbFfEOzk:(id)a3 completion:(id)a4;
- (void)fetchConfigThrowingWithCompletion:(id)a3;
- (void)fetchConfigWithCompletion:(id)a3;
- (void)fetchGeoCodingsForAddresses:(id)a3 completion:(id)a4;
- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 pregeneration:(BOOL)a5 workflowID:(id)a6 completion:(id)a7;
- (void)ofLBc0SV56ddaijH:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5;
- (void)registerICloudLoginWithCompletion:(id)a3;
- (void)uTtwJoGUgL3N0GVz;
- (void)unregisterICloudLoginWithCompletion:(id)a3;
- (void)updateGeoCodingsForAddresses:(id)a3 locations:(id)a4;
- (void)updateRavioliWithCompletion:(id)a3;
- (void)vffg4lwI2HftPvpO:(id)a3;
@end

@implementation Lt10zus2DOk3OfFf

+ (id)sharedInstance
{
  if (qword_1DCD8 != -1) {
    dispatch_once(&qword_1DCD8, &stru_185E0);
  }
  v2 = (void *)qword_1DCD0;
  return v2;
}

- (Lt10zus2DOk3OfFf)initWithServiceName:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)Lt10zus2DOk3OfFf;
  v5 = [(Lt10zus2DOk3OfFf *)&v20 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    disconnectionCallbacks = v5->_disconnectionCallbacks;
    v5->_disconnectionCallbacks = v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.asd.interrupt", 0);
    syncQueue = v5->_syncQueue;
    v5->_syncQueue = (OS_dispatch_queue *)v8;

    v10 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:v4 options:4096];
    connection = v5->_connection;
    v5->_connection = v10;

    v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NNHzG8lq6aMxZpXq];
    [(NSXPCConnection *)v5->_connection setRemoteObjectInterface:v12];

    objc_initWeak(&location, v5);
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_46F4;
    v17 = &unk_18608;
    objc_copyWeak(&v18, &location);
    [(NSXPCConnection *)v5->_connection setInterruptionHandler:&v14];
    [(NSXPCConnection *)v5->_connection resume];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)JI0A3nkqsab9cUj8:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_18648];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_4918;
  v21[3] = &unk_18670;
  id v9 = v7;
  id v22 = v9;
  v10 = objc_retainBlock(v21);
  v11 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v10];
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_4934;
  v16[3] = &unk_18698;
  objc_copyWeak(&v19, &location);
  id v12 = v11;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  v14 = objc_retainBlock(v16);
  uint64_t v15 = [v6 toDictionary];
  [v8 k0p7Rchr49btq6wB:v15 HY6FXG20397zwmVg:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)QeMnG23X94qgz7jT:(id)a3 hostChallenge:(id)a4 challengeResponse:(id)a5 seid:(id)a6 nonce:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v26 = a4;
  id v15 = a5;
  id v25 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_186B8];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_4C1C;
  v32[3] = &unk_18670;
  id v19 = v17;
  id v33 = v19;
  objc_super v20 = objc_retainBlock(v32);
  v21 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v20];
  objc_initWeak(&location, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_4C34;
  v27[3] = &unk_186E0;
  objc_copyWeak(&v30, &location);
  id v22 = v21;
  id v28 = v22;
  id v23 = v19;
  id v29 = v23;
  v24 = objc_retainBlock(v27);
  [v18 VE7BAlWGDSKrO5xc:v14 hostChallenge:v26 challengeResponse:v15 seid:v25 nonce:v16 HY6FXG20397zwmVg:v24];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (void)ZfE6lVphNUVrZcKx:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_18700];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_4E94;
  v20[3] = &unk_18670;
  id v9 = v7;
  id v21 = v9;
  v10 = objc_retainBlock(v20);
  v11 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v10];
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_4EB0;
  v15[3] = &unk_18728;
  objc_copyWeak(&v18, &location);
  id v12 = v11;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  id v14 = objc_retainBlock(v15);
  [v8 f9MGfLOgnHPuKTrU:v6 HY6FXG20397zwmVg:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)vffg4lwI2HftPvpO:(id)a3
{
  id v4 = a3;
  v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_18748];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_50FC;
  v17[3] = &unk_18670;
  id v6 = v4;
  id v18 = v6;
  id v7 = objc_retainBlock(v17);
  dispatch_queue_t v8 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v7];
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_5114;
  v12[3] = &unk_186E0;
  objc_copyWeak(&v15, &location);
  id v9 = v8;
  id v13 = v9;
  id v10 = v6;
  id v14 = v10;
  v11 = objc_retainBlock(v12);
  [v5 xs00laTiKIpDUzDP:v11];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)Z8aAH7stm0EYhyxg:(id)a3 xz5EHXEN4FjlhJbi:(id)a4 uhVTXyAfCFn7u0Ue:(id)a5 EQUjQp7JcQbqcPcD:(id)a6 A5wDLa5TFdFZlz3A:(id)a7 TJKMyOe6zn5PdGIr:(id)a8 eCqgGM0WcnHOslnr:(unint64_t)a9 eCszfxdv3kUXvhgV:(unint64_t)a10 uWp4aZpP2vLhc04Q:(id)a11 QZYtNpvp0hKd248p:(id)a12 oCwPYmtRv8s31KUH:(id)a13 completion:(id)a14
{
  id v36 = a3;
  id v35 = a4;
  id v32 = a5;
  id v34 = a6;
  id v33 = a7;
  id v31 = a8;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  v24 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_18768];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_5448;
  v42[3] = &unk_18670;
  id v25 = v23;
  id v43 = v25;
  id v26 = objc_retainBlock(v42);
  v27 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v26];
  objc_initWeak(&location, self);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_546C;
  v37[3] = &unk_18790;
  objc_copyWeak(&v40, &location);
  id v28 = v27;
  id v38 = v28;
  id v29 = v25;
  id v39 = v29;
  id v30 = objc_retainBlock(v37);
  objc_msgSend(v24, "SOUWv5VjPwXYslMm:noUfOiGjp1iQmKZX:pPGyXmlDbN3mzzHm:iSOZt67ioKsVcqQZ:hjCrdFOLMJN0Cc5Q:lE40aye8U2u533Ka:JRuZv6Feh9qwrGmN:Wn0aIR2B54NCtGQc:B3l3lS18BITy5E4L:UywAszL6AB8Y6LTJ:uNao9X8A82jVmQkK:completion:", v36, v35, v32, v34, v33, a9, a10, v20, v21, v22, v30);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
}

- (void)updateRavioliWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_187B0];
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_56E0;
  v15[3] = &unk_18670;
  id v6 = v4;
  id v16 = v6;
  id v7 = objc_retainBlock(v15);
  dispatch_queue_t v8 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v7];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_56F0;
  v11[3] = &unk_187D8;
  objc_copyWeak(&v14, &location);
  id v9 = v8;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [v5 k4eQYhyzyebbQqys:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)fetchConfigThrowingWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_5A38;
  v27 = sub_5A48;
  id v28 = 0;
  connection = self->_connection;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_5A50;
  v22[3] = &unk_18800;
  v22[4] = &v23;
  uint64_t v6 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v22];
  uint64_t v7 = v24[5];
  if (!(v7 | v6))
  {
    dispatch_queue_t v8 = +[NSString stringWithUTF8String:kCoreASErrorDomainCA];
    uint64_t v9 = +[NSError errorWithDomain:v8 code:-32 userInfo:0];
    id v10 = (void *)v24[5];
    v24[5] = v9;

    uint64_t v7 = v24[5];
  }
  if (v7)
  {
    v4[2](v4, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_5A60;
    v19[3] = &unk_18670;
    v11 = v4;
    id v20 = v11;
    id v12 = objc_retainBlock(v19);
    id v13 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v12];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_5A78;
    v15[3] = &unk_18828;
    objc_copyWeak(&v18, &location);
    id v14 = v13;
    id v16 = v14;
    id v17 = v11;
    [(id)v6 fetchConfigWithCompletionXPC:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  _Block_object_dispose(&v23, 8);
}

- (void)fetchConfigWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_18848];
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_5C9C;
  v15[3] = &unk_18670;
  id v6 = v4;
  id v16 = v6;
  uint64_t v7 = objc_retainBlock(v15);
  dispatch_queue_t v8 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v7];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_5CB0;
  v11[3] = &unk_18828;
  objc_copyWeak(&v14, &location);
  id v9 = v8;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [v5 fetchConfigWithCompletionXPC:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)updateGeoCodingsForAddresses:(id)a3 locations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_18868];
  if (v6 && v7)
  {
    v12[0] = @"addresses";
    v12[1] = @"locations";
    v13[0] = v6;
    v13[1] = v7;
    id v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    uint64_t v11 = 0;
    id v10 = +[NSKeyedArchiver archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v11];

    [v8 updateGeoCodingsXPC:v10 completion:&stru_18888];
  }
}

- (void)fetchGeoCodingsForAddresses:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_188A8];
  objc_initWeak(&location, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_6050;
  v21[3] = &unk_18670;
  id v9 = v7;
  id v22 = v9;
  id v10 = objc_retainBlock(v21);
  uint64_t v11 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v10];
  id v20 = 0;
  id v12 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v20];
  id v13 = v20;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_6064;
  v16[3] = &unk_186E0;
  objc_copyWeak(&v19, &location);
  id v14 = v11;
  id v17 = v14;
  id v15 = v9;
  id v18 = v15;
  [v8 fetchGeoCodingsForAddressesXPC:v12 completion:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 pregeneration:(BOOL)a5 workflowID:(id)a6 completion:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v12 = a6;
  id v13 = a7;
  id v14 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_188C8];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_6460;
  v25[3] = &unk_18670;
  id v15 = v13;
  id v26 = v15;
  id v16 = objc_retainBlock(v25);
  id v17 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v16];
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_6474;
  v20[3] = &unk_187D8;
  objc_copyWeak(&v23, &location);
  id v18 = v17;
  id v21 = v18;
  id v19 = v15;
  id v22 = v19;
  [v14 llNEghuIdfPH7O8I:v10 all:v9 pregeneration:v8 workflowID:v12 completion:v20];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)dKsJLlNX54lzKt5n:(id)a3 eqF2XJh3hHBJQf2K:(id)a4
{
  connection = self->_connection;
  id v7 = a4;
  id v8 = a3;
  id v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&stru_188E8];
  BOOL v9 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:&stru_18908];
  [v10 djoNSwl5j57W5mfl:v8 eqF2XJh3hHBJQf2K:v7];

  [(Lt10zus2DOk3OfFf *)self l7UrdRfCzeduYqtA:v9];
}

- (void)evrtH713YbFfEOzk:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_18928];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_6764;
  v19[3] = &unk_18670;
  id v9 = v7;
  id v20 = v9;
  id v10 = objc_retainBlock(v19);
  uint64_t v11 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v10];
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_6784;
  v14[3] = &unk_18950;
  objc_copyWeak(&v17, &location);
  id v12 = v11;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  [v8 rGvculjlqIwBJaoX:v6 completion:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)registerICloudLoginWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_18970];
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_69A8;
  v15[3] = &unk_18670;
  id v6 = v4;
  id v16 = v6;
  id v7 = objc_retainBlock(v15);
  id v8 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v7];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_69B8;
  v11[3] = &unk_187D8;
  objc_copyWeak(&v14, &location);
  id v9 = v8;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [v5 registerICloudLoginWithCompletionXPC:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)unregisterICloudLoginWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_18990];
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_6BD8;
  v15[3] = &unk_18670;
  id v6 = v4;
  id v16 = v6;
  id v7 = objc_retainBlock(v15);
  id v8 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v7];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_6BE8;
  v11[3] = &unk_187D8;
  objc_copyWeak(&v14, &location);
  id v9 = v8;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [v5 unregisterICloudLoginWithCompletionXPC:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)ofLBc0SV56ddaijH:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_189B0];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_6E30;
  v22[3] = &unk_18670;
  id v12 = v10;
  id v23 = v12;
  id v13 = objc_retainBlock(v22);
  id v14 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v13];
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_6E50;
  v17[3] = &unk_186E0;
  objc_copyWeak(&v20, &location);
  id v15 = v14;
  id v18 = v15;
  id v16 = v12;
  id v19 = v16;
  [v11 pRo6qBDnfEL0sBNs:v8 i7D0Lridvo8oYoNd:v9 completion:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (id)BFzukpKGO3cStNGp:(id)a3
{
  id v4 = a3;
  v5 = +[NSUUID UUID];
  id v6 = [v5 UUIDString];

  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6FD4;
  block[3] = &unk_189D8;
  block[4] = self;
  id v15 = v4;
  id v8 = v6;
  id v14 = v8;
  id v9 = v4;
  dispatch_sync(syncQueue, block);
  id v10 = v14;
  id v11 = v8;

  return v11;
}

- (BOOL)l7UrdRfCzeduYqtA:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7100;
  block[3] = &unk_18A00;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(syncQueue, block);
  LOBYTE(syncQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)syncQueue;
}

- (void)uTtwJoGUgL3N0GVz
{
  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_71D4;
  block[3] = &unk_18A28;
  block[4] = self;
  dispatch_sync(syncQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_disconnectionCallbacks, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
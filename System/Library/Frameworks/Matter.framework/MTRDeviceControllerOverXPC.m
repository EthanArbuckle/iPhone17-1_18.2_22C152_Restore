@interface MTRDeviceControllerOverXPC
+ (id)sharedControllerWithID:(id)a3 xpcConnectBlock:(id)a4;
- (BOOL)cancelCommissioningForNodeID:(id)a3 error:(id *)a4;
- (BOOL)commissionDevice:(unint64_t)a3 commissioningParams:(id)a4 error:(id *)a5;
- (BOOL)commissionNodeWithID:(id)a3 commissioningParams:(id)a4 error:(id *)a5;
- (BOOL)getBaseDevice:(unint64_t)a3 queue:(id)a4 completionHandler:(id)a5;
- (BOOL)openPairingWindow:(unint64_t)a3 duration:(unint64_t)a4 error:(id *)a5;
- (BOOL)pairDevice:(unint64_t)a3 address:(id)a4 port:(unsigned __int16)a5 discriminator:(unsigned __int16)a6 setupPINCode:(unsigned int)a7 error:(id *)a8;
- (BOOL)pairDevice:(unint64_t)a3 discriminator:(unsigned __int16)a4 setupPINCode:(unsigned int)a5 error:(id *)a6;
- (BOOL)pairDevice:(unint64_t)a3 onboardingPayload:(id)a4 error:(id *)a5;
- (BOOL)setupCommissioningSessionWithPayload:(id)a3 newNodeID:(id)a4 error:(id *)a5;
- (BOOL)stopDevicePairing:(unint64_t)a3 error:(id *)a4;
- (MTRDeviceControllerOverXPC)initWithControllerID:(id)a3 workQueue:(id)a4 connectBlock:(id)a5;
- (MTRDeviceControllerOverXPC)initWithControllerID:(id)a3 workQueue:(id)a4 xpcConnection:(id)a5;
- (MTRDeviceControllerXPCConnection)xpcConnection;
- (NSCopying)controllerXPCID;
- (OS_dispatch_queue)workQueue;
- (id)baseDeviceForNodeID:(id)a3;
- (id)deviceBeingCommissionedWithNodeID:(id)a3 error:(id *)a4;
- (id)getDeviceBeingCommissioned:(unint64_t)a3 error:(id *)a4;
- (id)openPairingWindowWithPIN:(unint64_t)a3 duration:(unint64_t)a4 discriminator:(unint64_t)a5 setupPIN:(unint64_t)a6 error:(id *)a7;
- (void)fetchControllerIdWithQueue:(id)a3 completion:(id)a4;
- (void)setControllerXPCID:(id)a3;
@end

@implementation MTRDeviceControllerOverXPC

+ (id)sharedControllerWithID:(id)a3 xpcConnectBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_268EBE990 != -1) {
    dispatch_once(&qword_268EBE990, &unk_26F9525D0);
  }
  v7 = [MTRDeviceControllerOverXPC alloc];
  v9 = objc_msgSend_initWithControllerID_workQueue_connectBlock_(v7, v8, (uint64_t)v5, qword_268EBE988, v6);

  return v9;
}

- (BOOL)setupCommissioningSessionWithPayload:(id)a3 newNodeID:(id)a4 error:(id *)a5
{
  id v6 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_ERROR, "MTRDeviceController doesn't support setupCommissioningSessionWithPayload over XPC", v9, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0, 1);
  }
  if (a5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v7, @"MTRErrorDomain", 6, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)pairDevice:(unint64_t)a3 discriminator:(unsigned __int16)a4 setupPINCode:(unsigned int)a5 error:(id *)a6
{
  v7 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_ERROR, "MTRDevice doesn't support pairDevice over XPC", v10, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0, 1);
  }
  if (a6)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v8, @"MTRErrorDomain", 6, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)pairDevice:(unint64_t)a3 address:(id)a4 port:(unsigned __int16)a5 discriminator:(unsigned __int16)a6 setupPINCode:(unsigned int)a7 error:(id *)a8
{
  v9 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_ERROR, "MTRDevice doesn't support pairDevice over XPC", v12, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0, 1);
  }
  if (a8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v10, @"MTRErrorDomain", 6, 0);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)pairDevice:(unint64_t)a3 onboardingPayload:(id)a4 error:(id *)a5
{
  id v6 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_ERROR, "MTRDevice doesn't support pairDevice over XPC", v9, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0, 1);
  }
  if (a5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v7, @"MTRErrorDomain", 6, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)commissionDevice:(unint64_t)a3 commissioningParams:(id)a4 error:(id *)a5
{
  id v6 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_ERROR, "MTRDevice doesn't support commissionDevice over XPC", v9, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0, 1);
  }
  if (a5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v7, @"MTRErrorDomain", 6, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)stopDevicePairing:(unint64_t)a3 error:(id *)a4
{
  id v5 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_ERROR, "MTRDevice doesn't support stopDevicePairing over XPC", v8, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0, 1);
  }
  if (a4)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v6, @"MTRErrorDomain", 6, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)getDeviceBeingCommissioned:(unint64_t)a3 error:(id *)a4
{
  id v5 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_ERROR, "MTRDevice doesn't support getDeviceBeingCommissioned over XPC", v8, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0, 1);
  }
  if (a4)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v6, @"MTRErrorDomain", 6, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)commissionNodeWithID:(id)a3 commissioningParams:(id)a4 error:(id *)a5
{
  id v6 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_ERROR, "MTRDeviceController doesn't support commissionNodeWithID over XPC", v9, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0, 1);
  }
  if (a5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v7, @"MTRErrorDomain", 6, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)cancelCommissioningForNodeID:(id)a3 error:(id *)a4
{
  id v5 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_ERROR, "MTRDeviceController doesn't support cancelCommissioningForNodeID over XPC", v8, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0, 1);
  }
  if (a4)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v6, @"MTRErrorDomain", 6, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)deviceBeingCommissionedWithNodeID:(id)a3 error:(id *)a4
{
  id v5 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_ERROR, "MTRDeviceController doesn't support deviceBeingCommissionedWithNodeID over XPC", v8, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0, 1);
  }
  if (a4)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v6, @"MTRErrorDomain", 6, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)getBaseDevice:(unint64_t)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_244BCA1E4;
  v12[3] = &unk_26519AD88;
  v12[4] = self;
  id v13 = v8;
  unint64_t v14 = a3;
  id v9 = v8;
  objc_msgSend_fetchControllerIdWithQueue_completion_(self, v10, (uint64_t)a4, v12);

  return 1;
}

- (void)fetchControllerIdWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_244BCA3EC;
  v15[4] = sub_244BCA3FC;
  id v16 = 0;
  workQueue = self->_workQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_244BCA404;
  v11[3] = &unk_26519AE28;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  unint64_t v14 = v15;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, v11);

  _Block_object_dispose(v15, 8);
}

- (id)baseDeviceForNodeID:(id)a3
{
  id v4 = a3;
  id v5 = [MTRDeviceOverXPC alloc];
  id v8 = objc_msgSend_xpcConnection(self, v6, v7);
  id v10 = objc_msgSend_initWithControllerOverXPC_deviceID_xpcConnection_(v5, v9, (uint64_t)self, v4, v8);

  return v10;
}

- (BOOL)openPairingWindow:(unint64_t)a3 duration:(unint64_t)a4 error:(id *)a5
{
  id v5 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_ERROR, "MTRDevice doesn't support openPairingWindow over XPC", v7, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0, 1);
  }
  return 0;
}

- (id)openPairingWindowWithPIN:(unint64_t)a3 duration:(unint64_t)a4 discriminator:(unint64_t)a5 setupPIN:(unint64_t)a6 error:(id *)a7
{
  uint64_t v7 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_ERROR, "MTRDevice doesn't support openPairingWindow over XPC", v9, 2u);
  }

  if (sub_244CC4E58(1u)) {
    sub_244CC4DE0(0, 1);
  }
  return 0;
}

- (MTRDeviceControllerOverXPC)initWithControllerID:(id)a3 workQueue:(id)a4 xpcConnection:(id)a5
{
  id v8 = (NSCopying *)a3;
  id v9 = (OS_dispatch_queue *)a4;
  id v10 = (MTRDeviceControllerXPCConnection *)a5;
  controllerXPCID = self->_controllerXPCID;
  self->_controllerXPCID = v8;
  id v12 = v8;

  workQueue = self->_workQueue;
  self->_workQueue = v9;
  unint64_t v14 = v9;

  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v10;

  return self;
}

- (MTRDeviceControllerOverXPC)initWithControllerID:(id)a3 workQueue:(id)a4 connectBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = objc_msgSend_connectionWithWorkQueue_connectBlock_(MTRDeviceControllerXPCConnection, v10, (uint64_t)v9, a5);
  id v13 = (MTRDeviceControllerOverXPC *)objc_msgSend_initWithControllerID_workQueue_xpcConnection_(self, v12, (uint64_t)v8, v9, v11);

  return v13;
}

- (NSCopying)controllerXPCID
{
  return self->_controllerXPCID;
}

- (void)setControllerXPCID:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (MTRDeviceControllerXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_controllerXPCID, 0);
}

@end
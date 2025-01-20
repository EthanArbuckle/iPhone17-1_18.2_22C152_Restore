@interface HMDMTSXPCServer
- (HMDMTSAuthorizationServer)authorizationServer;
- (HMDMTSDeviceSetupServer)deviceSetupServer;
- (HMDMTSPairingServer)pairingServer;
- (HMDMTSXPCServer)initWithPairingServer:(id)a3 deviceSetupServer:(id)a4 authorizationServer:(id)a5;
- (HMDMTSXPCServer)initWithPairingServer:(id)a3 deviceSetupServer:(id)a4 authorizationServer:(id)a5 xpcServer:(id)a6;
- (MTSXPCServer)xpcServer;
- (void)start;
@end

@implementation HMDMTSXPCServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcServer, 0);
  objc_storeStrong((id *)&self->_authorizationServer, 0);
  objc_storeStrong((id *)&self->_deviceSetupServer, 0);
  objc_storeStrong((id *)&self->_pairingServer, 0);
}

- (MTSXPCServer)xpcServer
{
  return (MTSXPCServer *)objc_getProperty(self, a2, 32, 1);
}

- (HMDMTSAuthorizationServer)authorizationServer
{
  return (HMDMTSAuthorizationServer *)objc_getProperty(self, a2, 24, 1);
}

- (HMDMTSDeviceSetupServer)deviceSetupServer
{
  return (HMDMTSDeviceSetupServer *)objc_getProperty(self, a2, 16, 1);
}

- (HMDMTSPairingServer)pairingServer
{
  return (HMDMTSPairingServer *)objc_getProperty(self, a2, 8, 1);
}

- (void)start
{
  v3 = [(HMDMTSXPCServer *)self pairingServer];
  v4 = [(HMDMTSXPCServer *)self xpcServer];
  [v4 setDevicePairingServer:v3];

  v5 = [(HMDMTSXPCServer *)self deviceSetupServer];
  v6 = [(HMDMTSXPCServer *)self xpcServer];
  [v6 setDeviceSetupServer:v5];

  v7 = [(HMDMTSXPCServer *)self pairingServer];
  v8 = [(HMDMTSXPCServer *)self xpcServer];
  [v8 setSystemCommissionerPairingServer:v7];

  v9 = [(HMDMTSXPCServer *)self authorizationServer];
  v10 = [(HMDMTSXPCServer *)self xpcServer];
  [v10 setAuthorizationServer:v9];

  id v11 = [(HMDMTSXPCServer *)self xpcServer];
  [v11 start];
}

- (HMDMTSXPCServer)initWithPairingServer:(id)a3 deviceSetupServer:(id)a4 authorizationServer:(id)a5 xpcServer:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v15 = v14;
  if (!v14)
  {
LABEL_11:
    v19 = (HMDMTSXPCServer *)_HMFPreconditionFailure();
    return [(HMDMTSXPCServer *)v19 initWithPairingServer:v21 deviceSetupServer:v22 authorizationServer:v23];
  }
  v24.receiver = self;
  v24.super_class = (Class)HMDMTSXPCServer;
  v16 = [(HMDMTSXPCServer *)&v24 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_pairingServer, a3);
    objc_storeStrong((id *)&v17->_deviceSetupServer, a4);
    objc_storeStrong((id *)&v17->_authorizationServer, a5);
    objc_storeStrong((id *)&v17->_xpcServer, a6);
  }

  return v17;
}

- (HMDMTSXPCServer)initWithPairingServer:(id)a3 deviceSetupServer:(id)a4 authorizationServer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_6;
  }
  if (!v9)
  {
LABEL_6:
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v11 = v10;
  if (v10)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F11090]);
    id v13 = [(HMDMTSXPCServer *)self initWithPairingServer:v8 deviceSetupServer:v9 authorizationServer:v11 xpcServer:v12];

    return v13;
  }
LABEL_7:
  v15 = (HMDUserPresenceFeedRetryTimer *)_HMFPreconditionFailure();
  [(HMDUserPresenceFeedRetryTimer *)v15 .cxx_destruct];
  return result;
}

@end
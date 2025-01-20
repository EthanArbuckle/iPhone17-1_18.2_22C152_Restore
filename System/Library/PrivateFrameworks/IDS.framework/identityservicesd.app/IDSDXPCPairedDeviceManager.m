@interface IDSDXPCPairedDeviceManager
- (IDSDXPCPairedDeviceManager)initWithPairingManager:(id)a3;
- (IDSPairingManager)pairingManager;
- (void)getLocalDeviceInfoWithCompletion:(id)a3;
- (void)getPairedDeviceInfoWithCompletion:(id)a3;
- (void)setPairingManager:(id)a3;
@end

@implementation IDSDXPCPairedDeviceManager

- (IDSDXPCPairedDeviceManager)initWithPairingManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSDXPCPairedDeviceManager;
  v6 = [(IDSDXPCPairedDeviceManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pairingManager, a3);
  }

  return v7;
}

- (void)getLocalDeviceInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Processing local device info query...", buf, 2u);
  }

  v6 = [(IDSDXPCPairedDeviceManager *)self pairingManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002E8DE8;
  v8[3] = &unk_1009883A0;
  id v9 = v4;
  id v7 = v4;
  [v6 gatherLocalDeviceInfoWithCompletionBlock:v8];
}

- (void)getPairedDeviceInfoWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = [(IDSDXPCPairedDeviceManager *)self pairingManager];
  v6 = [v5 pairedDevice];

  id v7 = +[IMRGLog registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Responding to paired device info query: %@", buf, 0xCu);
  }

  v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Responding to paired device info query: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  v4[2](v4, v6, 0);
}

- (IDSPairingManager)pairingManager
{
  return self->_pairingManager;
}

- (void)setPairingManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
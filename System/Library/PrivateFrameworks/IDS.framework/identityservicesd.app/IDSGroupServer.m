@interface IDSGroupServer
- (FTMessageDeliveryProtocol)messageDelivery;
- (IDSGroupServer)init;
- (IDSGroupServer)initWithMessageDelivery:(id)a3;
- (IDSGroupServerPushHandler)pushHandler;
- (id)_getMessageCompletionCurrentEntries:(id)a3 withCompletion:(id)a4;
- (id)_putMessageCompletionWithCompletion:(id)a3;
- (void)_queryGroupServerENID:(id)a3 withPreviousEntries:(id)a4 completion:(id)a5;
- (void)publishGroupForKey:(id)a3 data:(id)a4 signature:(id)a5 forwardingSig:(id)a6 ENID:(id)a7 version:(id)a8 completion:(id)a9;
- (void)queryGroupServerForENID:(id)a3 withCompletion:(id)a4;
- (void)setMessageDelivery:(id)a3;
- (void)setPushHandler:(id)a3;
@end

@implementation IDSGroupServer

- (IDSGroupServer)init
{
  id v3 = [objc_alloc((Class)FTMessageDelivery_DualMode) initWithPreferedType:2];
  v4 = [(IDSGroupServer *)self initWithMessageDelivery:v3];

  return v4;
}

- (IDSGroupServer)initWithMessageDelivery:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSGroupServer;
  v6 = [(IDSGroupServer *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_messageDelivery, a3);
    uint64_t v8 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
    pushHandler = v7->_pushHandler;
    v7->_pushHandler = (IDSGroupServerPushHandler *)v8;
  }
  return v7;
}

- (id)_getMessageCompletionCurrentEntries:(id)a3 withCompletion:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001B7FB4;
  v10[3] = &unk_100984D48;
  id v11 = a3;
  v12 = self;
  id v13 = a4;
  id v6 = v13;
  id v7 = v11;
  uint64_t v8 = objc_retainBlock(v10);

  return v8;
}

- (id)_putMessageCompletionWithCompletion:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001B81A8;
  v6[3] = &unk_100984D98;
  v6[4] = self;
  id v7 = a3;
  id v3 = v7;
  v4 = objc_retainBlock(v6);

  return v4;
}

- (void)publishGroupForKey:(id)a3 data:(id)a4 signature:(id)a5 forwardingSig:(id)a6 ENID:(id)a7 version:(id)a8 completion:(id)a9
{
  id v34 = a9;
  id v33 = a8;
  id v31 = a7;
  id v32 = a6;
  id v30 = a5;
  id v16 = a4;
  id v17 = a3;
  id v35 = [objc_alloc((Class)FTMessageDelivery_DualMode) initWithPreferedType:2];
  v18 = objc_alloc_init(IDSGroupPutMessage);
  v19 = +[FTDeviceSupport sharedInstance];
  v20 = [v19 model];

  v21 = +[FTDeviceSupport sharedInstance];
  v22 = [v21 productOSVersion];

  v23 = +[FTDeviceSupport sharedInstance];
  v24 = [v23 productBuildVersion];

  v25 = +[FTDeviceSupport sharedInstance];
  v26 = [v25 deviceName];

  v27 = [(IDSGroupServer *)self pushHandler];
  v28 = [v27 pushToken];
  [(IDSGroupPutMessage *)v18 setPushToken:v28];

  IDSAssignPushIdentityToMessage();
  [(IDSGroupPutMessage *)v18 setHardwareVersion:v20];
  [(IDSGroupPutMessage *)v18 setOsVersion:v22];
  [(IDSGroupPutMessage *)v18 setSoftwareVersion:v24];
  [(IDSGroupPutMessage *)v18 setDeviceName:v26];
  [(IDSGroupPutMessage *)v18 setSigAlgorithm:@"SHA256withECDSA"];
  [(IDSGroupPutMessage *)v18 setForwardingSigAlgorithm:@"SHA256withECDSA"];
  [(IDSGroupPutMessage *)v18 setKey:v17];

  [(IDSGroupPutMessage *)v18 setData:v16];
  [(IDSGroupPutMessage *)v18 setSignature:v30];

  [(IDSGroupPutMessage *)v18 setEngramID:v31];
  [(IDSGroupPutMessage *)v18 setVersion:v33];

  [(IDSGroupPutMessage *)v18 setForwardingSig:v32];
  v29 = [(IDSGroupServer *)self _putMessageCompletionWithCompletion:v34];

  [(IDSGroupPutMessage *)v18 setCompletionBlock:v29];
  [v35 sendMessage:v18];
}

- (void)queryGroupServerForENID:(id)a3 withCompletion:(id)a4
{
}

- (void)_queryGroupServerENID:(id)a3 withPreviousEntries:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v23 = objc_alloc_init(IDSGroupGetMessage);
  id v11 = +[FTDeviceSupport sharedInstance];
  v12 = [v11 model];

  id v13 = +[FTDeviceSupport sharedInstance];
  v14 = [v13 productOSVersion];

  v15 = +[FTDeviceSupport sharedInstance];
  id v16 = [v15 productBuildVersion];

  id v17 = +[FTDeviceSupport sharedInstance];
  v18 = [v17 deviceName];

  v19 = [(IDSGroupServer *)self pushHandler];
  v20 = [v19 pushToken];
  [(IDSGroupGetMessage *)v23 setPushToken:v20];

  IDSAssignPushIdentityToMessage();
  [(IDSGroupGetMessage *)v23 setHardwareVersion:v12];
  [(IDSGroupGetMessage *)v23 setOsVersion:v14];
  [(IDSGroupGetMessage *)v23 setSoftwareVersion:v16];
  [(IDSGroupGetMessage *)v23 setDeviceName:v18];
  [(IDSGroupGetMessage *)v23 setEngramID:v10];

  [(IDSGroupGetMessage *)v23 setVersion:&off_1009D17D0];
  v21 = [(IDSGroupServer *)self _getMessageCompletionCurrentEntries:v9 withCompletion:v8];

  [(IDSGroupGetMessage *)v23 setCompletionBlock:v21];
  v22 = [(IDSGroupServer *)self messageDelivery];
  [v22 sendMessage:v23];
}

- (FTMessageDeliveryProtocol)messageDelivery
{
  return self->_messageDelivery;
}

- (void)setMessageDelivery:(id)a3
{
}

- (IDSGroupServerPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushHandler, 0);

  objc_storeStrong((id *)&self->_messageDelivery, 0);
}

@end
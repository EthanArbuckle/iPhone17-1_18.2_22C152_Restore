@interface CKCompanionIDSService
- (CKCompanionIDSService)init;
- (void)requestDynamicDictionariesRemoval;
- (void)sendDeviceSalt:(id)a3;
- (void)sendResponseKitData:(id)a3;
@end

@implementation CKCompanionIDSService

- (CKCompanionIDSService)init
{
  v7.receiver = self;
  v7.super_class = (Class)CKCompanionIDSService;
  v2 = [(CKIDSService *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(CKIDSService *)v2 classCService];
    v5 = [(CKIDSService *)v3 queue];
    [v4 addDelegate:v3 queue:v5];
  }
  return v3;
}

- (void)sendDeviceSalt:(id)a3
{
  id v4 = a3;
  objc_super v7 = objc_alloc_init(NanoMessagesProtoSyncDeviceSalt);
  [(NanoMessagesProtoSyncDeviceSalt *)v7 setDeviceSalt:v4];

  v5 = [(NanoMessagesProtoSyncDeviceSalt *)v7 data];
  v6 = [(CKIDSService *)self classAService];
  [(CKIDSService *)self sendProtobufData:v5 type:0 service:v6 fireAndForget:1 includeInactiveDevices:0];
}

- (void)sendResponseKitData:(id)a3
{
  id v4 = a3;
  id v5 = [(CKIDSService *)self classCService];
  [(CKIDSService *)self sendFile:v4 onService:v5];
}

- (void)requestDynamicDictionariesRemoval
{
  id v5 = objc_alloc_init(NanoMessagesProtoRemoveDynamicDictionaries);
  v3 = [(NanoMessagesProtoRemoveDynamicDictionaries *)v5 data];
  id v4 = [(CKIDSService *)self classCService];
  [(CKIDSService *)self sendProtobufData:v3 type:3 service:v4 fireAndForget:0 includeInactiveDevices:1];
}

@end
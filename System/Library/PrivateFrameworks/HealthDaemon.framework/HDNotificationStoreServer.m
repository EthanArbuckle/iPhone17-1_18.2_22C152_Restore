@interface HDNotificationStoreServer
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_fetchBadgeForDomain:(int64_t)a3 completion:(id)a4;
- (void)remote_postCompanionUserNotificationOfType:(int64_t)a3 completion:(id)a4;
- (void)remote_postNotificationWithRequest:(id)a3 completion:(id)a4;
- (void)remote_setBadge:(id)a3 forDomain:(int64_t)a4 completion:(id)a5;
@end

@implementation HDNotificationStoreServer

- (void)remote_fetchBadgeForDomain:(int64_t)a3 completion:(id)a4
{
}

- (void)remote_setBadge:(id)a3 forDomain:(int64_t)a4 completion:(id)a5
{
}

- (void)remote_postCompanionUserNotificationOfType:(int64_t)a3 completion:(id)a4
{
}

- (void)remote_postNotificationWithRequest:(id)a3 completion:(id)a4
{
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v13 profile];
  v16 = [v15 notificationManager];

  if (v16)
  {
    v17 = [(HDStandardTaskServer *)[HDNotificationStoreServer alloc] initWithUUID:v11 configuration:v12 client:v13 delegate:v14];
    v18 = v16;
    notificationManager = v17->_notificationManager;
    v17->_notificationManager = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_featureUnavailableForProfileError");
    notificationManager = (HDNotificationManager *)(id)objc_claimAutoreleasedReturnValue();
    if (notificationManager)
    {
      if (a7) {
        *a7 = notificationManager;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v17 = 0;
  }

  return v17;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E7E68](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7E60](self, a2);
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2B280] taskIdentifier];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (void).cxx_destruct
{
}

@end
@interface HDNotificationSyncStoreServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDNotificationSyncStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_fakeReceivedNotificationInstruction:(id)a3 sendingDeviceInfo:(id)a4 completion:(id)a5;
- (void)remote_notificationHoldInstructionsWithCompletion:(id)a3;
- (void)remote_obliterateNotificationInstructionsWithCompletion:(id)a3;
- (void)remote_sendNewDeviceNotificationWithMessageKind:(int64_t)a3 completion:(id)a4;
- (void)remote_sendNotificationInstruction:(id)a3 completion:(id)a4;
- (void)remote_sendNotificationInstruction:(id)a3 savingObjectAsExistsCriteria:(id)a4 completion:(id)a5;
@end

@implementation HDNotificationSyncStoreServer

- (HDNotificationSyncStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HDNotificationSyncStoreServer;
  v12 = [(HDStandardTaskServer *)&v22 initWithUUID:a3 configuration:v10 client:v11 delegate:a6];
  if (v12)
  {
    v13 = [(id)objc_opt_class() description];
    uint64_t v14 = HKCreateSerialDispatchQueue();
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v14;

    v16 = [HDNotificationSyncClient alloc];
    v17 = [v11 profile];
    v18 = [v10 clientIdentifier];
    uint64_t v19 = [(HDNotificationSyncClient *)v16 initWithProfile:v17 clientIdentifier:v18 queue:v12->_queue];
    syncClient = v12->_syncClient;
    v12->_syncClient = (HDNotificationSyncClient *)v19;
  }
  return v12;
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v7 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:invalidArgument:class:selector:", a5, @"Configuration must be HKNotificationSyncStoreServerConfiguration", objc_opt_class(), a2);
  }
  return isKindOfClass & 1;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E7E78](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7E70](self, a2);
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2B288] taskIdentifier];
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F2A270];
  v5[0] = *MEMORY[0x1E4F29E48];
  v5[1] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  return v3;
}

- (void)remote_sendNotificationInstruction:(id)a3 completion:(id)a4
{
  syncClient = self->_syncClient;
  id v9 = 0;
  v6 = (void (**)(id, uint64_t, id))a4;
  uint64_t v7 = [(HDNotificationSyncClient *)syncClient sendNotificationInstruction:a3 criteria:0 error:&v9];
  id v8 = v9;
  v6[2](v6, v7, v8);
}

- (void)remote_sendNotificationInstruction:(id)a3 savingObjectAsExistsCriteria:(id)a4 completion:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, id))a5;
  id v11 = [(HDStandardTaskServer *)self client];
  v12 = [v11 profile];
  v13 = [v12 dataManager];
  v24[0] = v9;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  id v23 = 0;
  char v15 = [v13 insertDataObjects:v14 error:&v23];
  id v16 = v23;

  if (v15)
  {
    v17 = [HDNotificationInstructionObjectNotInDatabaseCriteria alloc];
    v18 = [v9 UUID];
    uint64_t v19 = [(HDNotificationInstructionUUIDCriteria *)v17 initWithUUID:v18];

    syncClient = self->_syncClient;
    id v22 = 0;
    uint64_t v21 = [(HDNotificationSyncClient *)syncClient sendNotificationInstruction:v8 criteria:v19 error:&v22];
    id v16 = v22;
    v10[2](v10, v21, v16);
  }
  else
  {
    v10[2](v10, 0, v16);
  }
}

- (void)remote_notificationHoldInstructionsWithCompletion:(id)a3
{
  syncClient = self->_syncClient;
  id v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDNotificationSyncClient *)syncClient notificationHoldInstructionsWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (void)remote_fakeReceivedNotificationInstruction:(id)a3 sendingDeviceInfo:(id)a4 completion:(id)a5
{
}

- (void)remote_obliterateNotificationInstructionsWithCompletion:(id)a3
{
  syncClient = self->_syncClient;
  id v7 = 0;
  v4 = (void (**)(id, uint64_t, id))a3;
  uint64_t v5 = [(HDNotificationSyncClient *)syncClient obliterateNotificationInstructionsWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (void)remote_sendNewDeviceNotificationWithMessageKind:(int64_t)a3 completion:(id)a4
{
  syncClient = self->_syncClient;
  id v9 = 0;
  id v6 = (void (**)(id, uint64_t, id))a4;
  uint64_t v7 = [(HDNotificationSyncClient *)syncClient sendNewDeviceNotificationWithMessageKind:a3 error:&v9];
  id v8 = v9;
  v6[2](v6, v7, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncClient, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end
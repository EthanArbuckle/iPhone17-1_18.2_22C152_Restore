@interface HDNanoSyncControlServer
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_fetchNanoSyncPairedDevicesWithCompletion:(id)a3;
- (void)remote_forceNanoSyncWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)remote_resetNanoSyncWithCompletion:(id)a3;
- (void)remote_waitForLastChanceSyncWithDevicePairingID:(id)a3 timeout:(double)a4 completion:(id)a5;
@end

@implementation HDNanoSyncControlServer

- (void)remote_fetchNanoSyncPairedDevicesWithCompletion:(id)a3
{
  nanoSyncManager = self->_nanoSyncManager;
  id v5 = a3;
  id v6 = [(HDNanoSyncManager *)nanoSyncManager pairedDevicesSnapshot];
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
}

- (void)remote_forceNanoSyncWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = NSString;
  id v7 = a4;
  v8 = [(HDStandardTaskServer *)self client];
  v9 = [v8 process];
  v10 = [v9 name];
  id v11 = [v6 stringWithFormat:@"External request from %@", v10];

  [(HDNanoSyncManager *)self->_nanoSyncManager syncHealthDataWithOptions:a3 reason:v11 completion:v7];
}

- (void)remote_resetNanoSyncWithCompletion:(id)a3
{
}

- (void)remote_waitForLastChanceSyncWithDevicePairingID:(id)a3 timeout:(double)a4 completion:(id)a5
{
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v13 profile];
  v16 = [v15 nanoSyncManager];

  if (v16)
  {
    v17 = [(HDStandardTaskServer *)[HDNanoSyncControlServer alloc] initWithUUID:v11 configuration:v12 client:v13 delegate:v14];
    v18 = v16;
    nanoSyncManager = v17->_nanoSyncManager;
    v17->_nanoSyncManager = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_featureUnavailableForProfileError");
    nanoSyncManager = (HDNanoSyncManager *)(id)objc_claimAutoreleasedReturnValue();
    if (nanoSyncManager)
    {
      if (a7) {
        *a7 = nanoSyncManager;
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
  return (id)MEMORY[0x1F40E7E50](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7E48](self, a2);
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2B250] taskIdentifier];
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
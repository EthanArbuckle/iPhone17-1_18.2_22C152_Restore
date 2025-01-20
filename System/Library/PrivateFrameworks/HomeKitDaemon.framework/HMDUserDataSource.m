@interface HMDUserDataSource
- (BOOL)isCurrentUser:(id)a3;
- (id)userDataBackingStoreControllerWithDelegate:(id)a3 queue:(id)a4 zoneName:(id)a5 shareMessenger:(id)a6;
- (id)userDataControllerWithDelegate:(id)a3 dataSource:(id)a4 queue:(id)a5 userID:(id)a6 homeID:(id)a7 sharedSettingsController:(id)a8 privateSettingsController:(id)a9 isCurrentUser:(BOOL)a10;
@end

@implementation HMDUserDataSource

- (BOOL)isCurrentUser:(id)a3
{
  id v3 = a3;
  if (!+[HMDHomeManager areWeAllowingHomeKitToRunWithoutCloudKitForHH2])
  {
    v5 = [v3 account];
    v6 = v5;
    if (v5 && ([v5 isCurrentAccount] & 1) != 0) {
      goto LABEL_7;
    }
    v7 = [v3 home];
    if ([v7 isOwnerUser])
    {
      char v8 = [v3 isOwner];

      if (v8)
      {
LABEL_7:
        BOOL v4 = 1;
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
    }
    BOOL v4 = 0;
    goto LABEL_10;
  }
  BOOL v4 = 1;
LABEL_11:

  return v4;
}

- (id)userDataBackingStoreControllerWithDelegate:(id)a3 queue:(id)a4 zoneName:(id)a5 shareMessenger:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [HMDUserSettingsBackingStoreController alloc];
  v14 = +[HMDDatabase defaultDatabase];
  v15 = [(HMDUserSettingsBackingStoreController *)v13 initWithDelegate:v12 queue:v11 zoneName:v10 database:v14 shareMessenger:v9];

  return v15;
}

- (id)userDataControllerWithDelegate:(id)a3 dataSource:(id)a4 queue:(id)a5 userID:(id)a6 homeID:(id)a7 sharedSettingsController:(id)a8 privateSettingsController:(id)a9 isCurrentUser:(BOOL)a10
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  LOBYTE(v25) = a10;
  v23 = [[HMDUserDataController alloc] initWithDelegate:v22 dataSource:v21 queue:v20 userID:v19 homeID:v18 sharedSettingsController:v17 privateSettingsController:v16 isCurrentUser:v25];

  return v23;
}

@end
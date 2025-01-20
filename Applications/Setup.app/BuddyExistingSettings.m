@interface BuddyExistingSettings
- (BuddyExistingSettings)init;
- (NSData)walletData;
- (OS_dispatch_queue)metadataQueue;
- (SASExpressSettings)expressSettings;
- (id)backupMetadata;
- (void)setBackupMetadata:(id)a3;
- (void)setBackupMetadataWithProviderBlock:(id)a3;
- (void)setExpressSettings:(id)a3;
- (void)setMetadataQueue:(id)a3;
@end

@implementation BuddyExistingSettings

- (BuddyExistingSettings)init
{
  SEL v8 = a2;
  id location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyExistingSettings;
  id location = [(BuddyExistingSettings *)&v7 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v3 = dispatch_queue_create("Backup Metadata Queue", v2);
    v4 = (void *)*((void *)location + 3);
    *((void *)location + 3) = v3;
  }
  v5 = (BuddyExistingSettings *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

- (NSData)walletData
{
  v10 = self;
  v9[1] = (id)a2;
  v9[0] = [(BuddyExistingSettings *)self backupMetadata];
  if (!v9[0]
    || ((id location = [v9[0] expressSettings],
         ([location hasWalletData] & 1) == 0)
      ? (([v9[0] hasWalletData] & 1) == 0
       ? (int v7 = 0)
       : (v11 = [v9[0] walletData], int v7 = 1))
      : (v11 = [location walletData], int v7 = 1),
        objc_storeStrong(&location, 0),
        !v7))
  {
    v2 = [(BuddyExistingSettings *)v10 expressSettings];
    unsigned __int8 v3 = [(SASExpressSettings *)v2 hasWalletData];

    if (v3)
    {
      v4 = [(BuddyExistingSettings *)v10 expressSettings];
      id v11 = [(SASExpressSettings *)v4 walletData];
    }
    else
    {
      id v11 = 0;
    }
  }
  objc_storeStrong(v9, 0);
  v5 = v11;

  return (NSData *)v5;
}

- (void)setBackupMetadataWithProviderBlock:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = [(BuddyExistingSettings *)v12 metadataQueue];
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = sub_100156854;
  SEL v8 = &unk_1002B0CD0;
  v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)setBackupMetadata:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = [(BuddyExistingSettings *)v12 metadataQueue];
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = sub_1001569BC;
  SEL v8 = &unk_1002B12F0;
  v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)backupMetadata
{
  v18 = self;
  v17[1] = (id)a2;
  uint64_t v11 = 0;
  v12 = &v11;
  int v13 = 838860800;
  int v14 = 48;
  v15 = sub_100156B5C;
  v16 = sub_100156BA0;
  v17[0] = 0;
  v2 = [(BuddyExistingSettings *)self metadataQueue];
  int v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  SEL v8 = sub_100156BAC;
  v9 = &unk_1002B1D70;
  v10[1] = &v11;
  v10[0] = v18;
  dispatch_sync((dispatch_queue_t)v2, &v5);

  id v3 = (id)v12[5];
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  objc_storeStrong(v17, 0);

  return v3;
}

- (SASExpressSettings)expressSettings
{
  return self->_expressSettings;
}

- (void)setExpressSettings:(id)a3
{
}

- (OS_dispatch_queue)metadataQueue
{
  return self->_metadataQueue;
}

- (void)setMetadataQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
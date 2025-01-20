@interface HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation
- (HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation)initWithDeviceCredentialKey:(id)a3 accessories:(id)a4 user:(id)a5;
- (HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation)initWithDeviceCredentialKey:(id)a3 accessoriesUUIDs:(id)a4 user:(id)a5;
- (HMDUser)user;
- (NSData)deviceCredentialKey;
- (NSSet)accessoriesUUIDs;
- (id)attributeDescriptions;
- (id)operationByMergingWithOperation:(id)a3;
@end

@implementation HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_user);
  objc_storeStrong((id *)&self->_accessoriesUUIDs, 0);
  objc_storeStrong((id *)&self->_deviceCredentialKey, 0);
}

- (HMDUser)user
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_user);
  return (HMDUser *)WeakRetained;
}

- (NSSet)accessoriesUUIDs
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)deviceCredentialKey
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *)self deviceCredentialKey];
  v5 = (void *)[v3 initWithName:@"Device Credential Key" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *)self accessoriesUUIDs];
  v8 = (void *)[v6 initWithName:@"Accessories UUIDs" value:v7];
  v15[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *)self user];
  v11 = [v10 uuid];
  v12 = (void *)[v9 initWithName:@"User UUID" value:v11];
  v15[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];

  return v13;
}

- (id)operationByMergingWithOperation:(id)a3
{
  id v4 = a3;
  v5 = [v4 accessoriesUUIDs];
  id v6 = (void *)[v5 mutableCopy];

  v7 = [(HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *)self accessoriesUUIDs];
  v8 = [v7 allObjects];
  [v6 addObjectsFromArray:v8];

  id v9 = [HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation alloc];
  v10 = [v4 deviceCredentialKey];
  v11 = [v4 user];

  v12 = [(HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *)v9 initWithDeviceCredentialKey:v10 accessoriesUUIDs:v6 user:v11];
  return v12;
}

- (HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation)initWithDeviceCredentialKey:(id)a3 accessories:(id)a4 user:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F1CA80] set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v16), "uuid", (void)v20);
        [v11 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  v18 = [(HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *)self initWithDeviceCredentialKey:v8 accessoriesUUIDs:v11 user:v10];
  return v18;
}

- (HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation)initWithDeviceCredentialKey:(id)a3 accessoriesUUIDs:(id)a4 user:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation;
  v11 = [(HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    deviceCredentialKey = v11->_deviceCredentialKey;
    v11->_deviceCredentialKey = (NSData *)v12;

    uint64_t v14 = [v9 copy];
    accessoriesUUIDs = v11->_accessoriesUUIDs;
    v11->_accessoriesUUIDs = (NSSet *)v14;

    objc_storeWeak((id *)&v11->_user, v10);
  }

  return v11;
}

@end
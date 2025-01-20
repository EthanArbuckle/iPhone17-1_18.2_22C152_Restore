@interface HDCloudSyncProfileManagementShim
- (HDCloudSyncProfileManagementShim)initWithProfile:(id)a3;
- (void)createProfileForIdentifier:(id)a3 firstName:(id)a4 lastName:(id)a5 configuration:(id)a6 completion:(id)a7;
- (void)deleteAllProfilesOfType:(int64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)deleteProfile:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)profileExistsForProfileIdentifier:(id)a3 configuration:(id)a4 completion:(id)a5;
@end

@implementation HDCloudSyncProfileManagementShim

- (HDCloudSyncProfileManagementShim)initWithProfile:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDCloudSyncProfileManagementShim;
  v6 = [(HDCloudSyncProfileManagementShim *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    uint64_t v8 = HKCreateSerialDispatchQueue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (void)deleteAllProfilesOfType:(int64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v9 = [a4 repository];
  v10 = [v9 profileManager];
  id v19 = 0;
  LOBYTE(a3) = [v10 deleteAllProfilesOfType:a3 error:&v19];
  id v11 = v19;

  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__HDCloudSyncProfileManagementShim_deleteAllProfilesOfType_configuration_completion___block_invoke;
  v15[3] = &unk_1E62F61A8;
  char v18 = a3;
  id v16 = v11;
  id v17 = v8;
  id v13 = v11;
  id v14 = v8;
  dispatch_async(queue, v15);
}

uint64_t __85__HDCloudSyncProfileManagementShim_deleteAllProfilesOfType_configuration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)deleteProfile:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [a4 repository];
  id v11 = [v10 profileManager];
  id v21 = 0;
  char v12 = [v11 deleteProfile:v9 error:&v21];

  id v13 = v21;
  queue = self->_queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__HDCloudSyncProfileManagementShim_deleteProfile_configuration_completion___block_invoke;
  v17[3] = &unk_1E62F61A8;
  char v20 = v12;
  id v18 = v13;
  id v19 = v8;
  id v15 = v13;
  id v16 = v8;
  dispatch_async(queue, v17);
}

uint64_t __75__HDCloudSyncProfileManagementShim_deleteProfile_configuration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)createProfileForIdentifier:(id)a3 firstName:(id)a4 lastName:(id)a5 configuration:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [a6 repository];
  id v17 = [v16 profileManager];
  id v28 = 0;
  id v18 = [v17 createProfileForIdentifier:v15 firstName:v14 lastName:v13 error:&v28];

  id v19 = v28;
  queue = self->_queue;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __107__HDCloudSyncProfileManagementShim_createProfileForIdentifier_firstName_lastName_configuration_completion___block_invoke;
  v24[3] = &unk_1E62F61D0;
  id v26 = v19;
  id v27 = v12;
  id v25 = v18;
  id v21 = v19;
  id v22 = v18;
  id v23 = v12;
  dispatch_async(queue, v24);
}

void __107__HDCloudSyncProfileManagementShim_createProfileForIdentifier_firstName_lastName_configuration_completion___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  v3 = (void *)a1[4];
  if (v3)
  {
    id v6 = [v3 profileIdentifier];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v6, a1[5]);
  }
  else
  {
    uint64_t v4 = a1[5];
    id v5 = *(void (**)(uint64_t, void, uint64_t))(v2 + 16);
    v5(v2, 0, v4);
  }
}

- (void)profileExistsForProfileIdentifier:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [a4 repository];
  id v11 = [v10 profileManager];
  id v21 = 0;
  char v12 = [v11 profileExistsForIdentifier:v9 error:&v21];

  id v13 = v21;
  queue = self->_queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __95__HDCloudSyncProfileManagementShim_profileExistsForProfileIdentifier_configuration_completion___block_invoke;
  v17[3] = &unk_1E62F61F8;
  char v20 = v12;
  id v18 = v13;
  id v19 = v8;
  id v15 = v8;
  id v16 = v13;
  dispatch_async(queue, v17);
}

uint64_t __95__HDCloudSyncProfileManagementShim_profileExistsForProfileIdentifier_configuration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end
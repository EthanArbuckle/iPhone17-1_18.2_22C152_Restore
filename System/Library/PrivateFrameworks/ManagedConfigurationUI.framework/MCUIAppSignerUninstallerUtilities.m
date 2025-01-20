@interface MCUIAppSignerUninstallerUtilities
+ (id)_provisioningProfileUUIDsForAppSigner:(id)a3;
+ (void)_asyncUninstallApplicationsForAppsigner:(id)a3 withUninstaller:(id)a4 dispatchGroup:(id)a5;
+ (void)_asyncUninstallProvisioningProfilesForAppSigner:(id)a3 withUninstaller:(id)a4 dispatchGroup:(id)a5;
+ (void)uninstallAppSigner:(id)a3 withUninstaller:(id)a4 dispatchGroup:(id)a5 completion:(id)a6;
@end

@implementation MCUIAppSignerUninstallerUtilities

+ (void)uninstallAppSigner:(id)a3 withUninstaller:(id)a4 dispatchGroup:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__MCUIAppSignerUninstallerUtilities_uninstallAppSigner_withUninstaller_dispatchGroup_completion___block_invoke;
  block[3] = &unk_1E6EAD720;
  id v22 = v13;
  id v23 = a1;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v14 = v13;
  v15 = v12;
  id v16 = v11;
  id v17 = v10;
  dispatch_group_notify(v15, MEMORY[0x1E4F14428], block);
}

void __97__MCUIAppSignerUninstallerUtilities_uninstallAppSigner_withUninstaller_dispatchGroup_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 64) _asyncUninstallProvisioningProfilesForAppSigner:*(void *)(a1 + 32) withUninstaller:*(void *)(a1 + 40) dispatchGroup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 64) _asyncUninstallApplicationsForAppsigner:*(void *)(a1 + 32) withUninstaller:*(void *)(a1 + 40) dispatchGroup:*(void *)(a1 + 48)];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__MCUIAppSignerUninstallerUtilities_uninstallAppSigner_withUninstaller_dispatchGroup_completion___block_invoke_2;
  block[3] = &unk_1E6EAD398;
  v2 = *(NSObject **)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  dispatch_group_notify(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __97__MCUIAppSignerUninstallerUtilities_uninstallAppSigner_withUninstaller_dispatchGroup_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_asyncUninstallProvisioningProfilesForAppSigner:(id)a3 withUninstaller:(id)a4 dispatchGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(25, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __115__MCUIAppSignerUninstallerUtilities__asyncUninstallProvisioningProfilesForAppSigner_withUninstaller_dispatchGroup___block_invoke;
  v15[3] = &unk_1E6EAD770;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v19 = a1;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __115__MCUIAppSignerUninstallerUtilities__asyncUninstallProvisioningProfilesForAppSigner_withUninstaller_dispatchGroup___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 56) _provisioningProfileUUIDsForAppSigner:*(void *)(a1 + 32)];
  NSLog(&cfstr_Mcuiappsigneru_3.isa, [v2 count]);
  if ([v2 count])
  {
    unint64_t v3 = 0;
    do
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      ++v3;
    }
    while ([v2 count] > v3);
  }
  size_t v4 = [v2 count];
  v5 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115__MCUIAppSignerUninstallerUtilities__asyncUninstallProvisioningProfilesForAppSigner_withUninstaller_dispatchGroup___block_invoke_2;
  block[3] = &unk_1E6EAD748;
  id v8 = *(id *)(a1 + 48);
  id v9 = v2;
  id v10 = *(id *)(a1 + 40);
  id v6 = v2;
  dispatch_apply(v4, v5, block);
}

void __115__MCUIAppSignerUninstallerUtilities__asyncUninstallProvisioningProfilesForAppSigner_withUninstaller_dispatchGroup___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  size_t v4 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  [v3 uninstallProvisioningProfileWithUUID:v4];

  v5 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v5);
}

+ (void)_asyncUninstallApplicationsForAppsigner:(id)a3 withUninstaller:(id)a4 dispatchGroup:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__MCUIAppSignerUninstallerUtilities__asyncUninstallApplicationsForAppsigner_withUninstaller_dispatchGroup___block_invoke;
  block[3] = &unk_1E6EAD610;
  id v15 = v7;
  id v16 = v9;
  id v17 = v8;
  id v11 = v8;
  id v12 = v9;
  id v13 = v7;
  dispatch_async(v10, block);
}

void __107__MCUIAppSignerUninstallerUtilities__asyncUninstallApplicationsForAppsigner_withUninstaller_dispatchGroup___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) applications];
  NSLog(&cfstr_Mcuiappsigneru_4.isa, [v2 count]);
  if ([v2 count])
  {
    unint64_t v3 = 0;
    do
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      ++v3;
    }
    while ([v2 count] > v3);
  }
  size_t v4 = [v2 count];
  v5 = dispatch_get_global_queue(-2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__MCUIAppSignerUninstallerUtilities__asyncUninstallApplicationsForAppsigner_withUninstaller_dispatchGroup___block_invoke_2;
  block[3] = &unk_1E6EAD798;
  id v8 = *(id *)(a1 + 48);
  id v9 = v2;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v6 = v2;
  dispatch_apply(v4, v5, block);
}

void __107__MCUIAppSignerUninstallerUtilities__asyncUninstallApplicationsForAppsigner_withUninstaller_dispatchGroup___block_invoke_2(uint64_t a1, uint64_t a2)
{
  size_t v4 = *(void **)(a1 + 32);
  v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  [v4 uninstallApplicationWithBundleID:v5];

  id v6 = *(void **)(a1 + 48);
  id v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  objc_msgSend(v6, "main_removeMCUIReferenceForBundleID:", v7);

  id v8 = *(NSObject **)(a1 + 56);
  dispatch_group_leave(v8);
}

+ (id)_provisioningProfileUUIDsForAppSigner:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  size_t v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = objc_msgSend(v3, "provisioningProfiles", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [v10 uuid];
        uint64_t v12 = [v11 length];

        if (v12)
        {
          id v13 = [v10 uuid];
          [v4 addObject:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

@end
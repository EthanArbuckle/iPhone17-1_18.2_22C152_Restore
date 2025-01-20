@interface BRLoadUbiquityEntitlements
@end

@implementation BRLoadUbiquityEntitlements

void ___BRLoadUbiquityEntitlements_block_invoke()
{
  v0 = (void *)MEMORY[0x19F3C4670]();
  v1 = (void *)BRCopyEntitlementsForSelf();
  uint64_t v2 = BREntitledContainerIdentifiers((uint64_t)v1);
  v3 = (void *)currentProcessUbiquityContainerEntitlements;
  currentProcessUbiquityContainerEntitlements = v2;

  v4 = [v1 objectForKeyedSubscript:@"com.apple.private.librarian.container-proxy"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    currentProcessIsContainerProxy = [v4 BOOLValue];
    if (currentProcessIsContainerProxy)
    {
      v5 = v4;
      goto LABEL_9;
    }
  }
  else
  {
    currentProcessIsContainerProxy = 0;
  }
  v5 = [v1 objectForKeyedSubscript:@"com.apple.private.clouddocs.automation"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = [v5 BOOLValue];
  }
  else {
    char v6 = 0;
  }
  currentProcessIsContainerProxy = v6;
LABEL_9:
  id v7 = v1;
  int v8 = FPIsCloudDocsWithFPFSEnabled();
  v9 = @"group.com.apple.CloudDocs";
  if (v8) {
    v9 = @"group.com.apple.iCloudDrive";
  }
  v10 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __BRIsCurrentProcessHasAccessToGroupContainers_block_invoke;
  v15[3] = &unk_1E59AE050;
  id v16 = v7;
  v17 = v10;
  id v11 = v7;
  v12 = v10;
  v13 = (uint64_t (**)(void, void))MEMORY[0x19F3C48D0](v15);
  if (((uint64_t (**)(void, __CFString *))v13)[2](v13, @"com.apple.security.application-groups")) {
    char v14 = 1;
  }
  else {
    char v14 = ((uint64_t (**)(void, __CFString *))v13)[2](v13, @"com.apple.private.security.restricted-application-groups");
  }

  currentProcessHasAccessToGroupContainers = v14;
}

@end
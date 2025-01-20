@interface AIDAAccountManager(DMCEnrollmentProvider)
- (id)dmc_remoteManagementAccount;
@end

@implementation AIDAAccountManager(DMCEnrollmentProvider)

- (id)dmc_remoteManagementAccount
{
  v2 = [a1 accounts];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  v4 = objc_msgSend(v3, "dmc_remoteManagingAccountIdentifier");

  if (v4)
  {
    v5 = [a1 accountStore];
    v6 = objc_msgSend(v3, "dmc_remoteManagingAccountIdentifier");
    v7 = objc_msgSend(v5, "dmc_remoteManagementAccountForIdentifier:", v6);
  }
  else
  {
    v8 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_221CC5000, v8, OS_LOG_TYPE_ERROR, "iCloud account does not have an RM account identifier", v10, 2u);
    }
    v7 = 0;
  }

  return v7;
}

@end
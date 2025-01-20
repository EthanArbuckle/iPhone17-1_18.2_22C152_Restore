@interface ACAccount(DMCEnrollment)
- (uint64_t)dmc_isUnremovableRemotelyManagedAccount;
@end

@implementation ACAccount(DMCEnrollment)

- (uint64_t)dmc_isUnremovableRemotelyManagedAccount
{
  v1 = objc_msgSend(a1, "dmc_remoteManagementAccount");
  v2 = v1;
  if (!v1) {
    goto LABEL_5;
  }
  v3 = objc_msgSend(v1, "dmc_managementProfileIdentifier");
  uint64_t v4 = [v3 length];

  if (!v4) {
    goto LABEL_5;
  }
  v5 = [MEMORY[0x263F52810] sharedConfiguration];
  int v6 = [v5 isProfileLocked];

  if (v6)
  {
    v7 = [MEMORY[0x263F52808] sharedConfiguration];
    uint64_t v8 = [v7 isProvisionallyEnrolled] ^ 1;
  }
  else
  {
LABEL_5:
    uint64_t v8 = 0;
  }

  return v8;
}

@end
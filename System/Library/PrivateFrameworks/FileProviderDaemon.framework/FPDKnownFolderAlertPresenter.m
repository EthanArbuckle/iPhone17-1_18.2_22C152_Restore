@interface FPDKnownFolderAlertPresenter
- (BOOL)isiCloudDriveProvider;
- (BOOL)presentAlertWithUserAprovalToContinue;
- (FPDKnownFolderAlertPresenter)initWithProviderDomain:(id)a3;
- (NSString)providerDisplayName;
- (id)getIconURLWithCautionBadge:(BOOL)a3;
@end

@implementation FPDKnownFolderAlertPresenter

- (FPDKnownFolderAlertPresenter)initWithProviderDomain:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPDKnownFolderAlertPresenter;
  v5 = [(FPDKnownFolderAlertPresenter *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 domainFullDisplayName];
    providerDisplayName = v5->_providerDisplayName;
    v5->_providerDisplayName = (NSString *)v6;

    uint64_t v8 = [v4 topLevelBundleIdentifier];
    providerBundleIdentifier = v5->_providerBundleIdentifier;
    v5->_providerBundleIdentifier = (NSString *)v8;

    v5->_isiCloudDriveProvider = [v4 isiCloudDriveProvider];
  }

  return v5;
}

- (id)getIconURLWithCautionBadge:(BOOL)a3
{
  return 0;
}

- (BOOL)presentAlertWithUserAprovalToContinue
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [NSString stringWithFormat:@"alert should be implemented by subclass"];
  v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 138543362;
    v5 = v2;
    _os_log_fault_impl(&dword_1D744C000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPDKnownFolderAlertPresenter presentAlertWithUserAprovalToContinue]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDKnownFolderAlertPresenter.m", 101, (const char *)[v2 UTF8String]);
}

- (NSString)providerDisplayName
{
  return self->_providerDisplayName;
}

- (BOOL)isiCloudDriveProvider
{
  return self->_isiCloudDriveProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerDisplayName, 0);
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
}

@end
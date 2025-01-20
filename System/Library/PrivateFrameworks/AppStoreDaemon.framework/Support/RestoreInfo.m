@interface RestoreInfo
@end

@implementation RestoreInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedRestoreInstallForAccounts, 0);
  objc_storeStrong((id *)&self->_nonOrderedRestoreInstallForAccounts, 0);
}

@end
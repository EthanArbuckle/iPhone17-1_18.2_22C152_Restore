@interface LSDatabaseGetMobileInstallSyncupGroup
@end

@implementation LSDatabaseGetMobileInstallSyncupGroup

void ___LSDatabaseGetMobileInstallSyncupGroup_block_invoke()
{
  dispatch_group_t v0 = dispatch_group_create();
  v1 = (void *)_LSDatabaseGetMobileInstallSyncupGroup::syncupGroup;
  _LSDatabaseGetMobileInstallSyncupGroup::syncupGroup = (uint64_t)v0;
}

@end
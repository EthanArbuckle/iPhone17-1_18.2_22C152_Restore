@interface LSDatabaseGetInstallingGroup
@end

@implementation LSDatabaseGetInstallingGroup

void ___LSDatabaseGetInstallingGroup_block_invoke()
{
  dispatch_group_t v0 = dispatch_group_create();
  v1 = (void *)_LSDatabaseGetInstallingGroup::installingGroup;
  _LSDatabaseGetInstallingGroup::installingGroup = (uint64_t)v0;
}

@end
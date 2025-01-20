@interface LSDatabaseGetSeedingGroup
@end

@implementation LSDatabaseGetSeedingGroup

void ___LSDatabaseGetSeedingGroup_block_invoke()
{
  dispatch_group_t v0 = dispatch_group_create();
  v1 = (void *)_LSDatabaseGetSeedingGroup::seedingGroup;
  _LSDatabaseGetSeedingGroup::seedingGroup = (uint64_t)v0;
}

@end
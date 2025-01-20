@interface DisabledCategories
@end

@implementation DisabledCategories

void __DisabledCategories_block_invoke(id a1)
{
  v1 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v1 arrayForKey:@"CRLLogCatNO"];

  if (v6)
  {
    v2 = [[CRLLogCatThreadSafeMutableSet alloc] initWithArray:v6];
    v3 = (void *)DisabledCategories_sNOCategories;
    DisabledCategories_sNOCategories = (uint64_t)v2;
  }
  if (!DisabledCategories_sNOCategories)
  {
    v4 = objc_alloc_init(CRLLogCatThreadSafeMutableSet);
    v5 = (void *)DisabledCategories_sNOCategories;
    DisabledCategories_sNOCategories = (uint64_t)v4;
  }
}

@end
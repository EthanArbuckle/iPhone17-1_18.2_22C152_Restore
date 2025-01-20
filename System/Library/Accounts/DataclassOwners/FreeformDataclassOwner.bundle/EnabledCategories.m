@interface EnabledCategories
@end

@implementation EnabledCategories

void __EnabledCategories_block_invoke(id a1)
{
  +[NSUserDefaults crl_registerDefaults];
  v1 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v1 arrayForKey:@"CRLLogCatYES"];

  if (v6)
  {
    v2 = [[CRLLogCatThreadSafeMutableSet alloc] initWithArray:v6];
    v3 = (void *)EnabledCategories_sYESCategories;
    EnabledCategories_sYESCategories = (uint64_t)v2;
  }
  if (!EnabledCategories_sYESCategories)
  {
    v4 = objc_alloc_init(CRLLogCatThreadSafeMutableSet);
    v5 = (void *)EnabledCategories_sYESCategories;
    EnabledCategories_sYESCategories = (uint64_t)v4;
  }
}

@end
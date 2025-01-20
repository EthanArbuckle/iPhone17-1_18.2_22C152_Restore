@interface PFCSSearchableIndexProvider
- (id)createPrivateSearchableIndexWithName:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5;
- (id)createPrivateSearchableIndexWithPath:(id)a3;
- (id)createSearchableIndexWithName:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5;
- (id)defaultPrivateSearchableIndex;
- (id)defaultSearchableIndex;
@end

@implementation PFCSSearchableIndexProvider

- (id)createPrivateSearchableIndexWithName:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = objc_alloc(getCoreSpotlightCSPrivateSearchableIndexClass());
  if (a3) {
    v9 = (__CFString *)a3;
  }
  else {
    v9 = &stru_1ED787880;
  }

  return (id)[v8 initWithName:v9 protectionClass:a4 bundleIdentifier:a5];
}

- (id)defaultSearchableIndex
{
  Class CoreSpotlightCSSearchableIndexClass = getCoreSpotlightCSSearchableIndexClass();

  return (id)[(objc_class *)CoreSpotlightCSSearchableIndexClass defaultSearchableIndex];
}

- (id)defaultPrivateSearchableIndex
{
  Class CoreSpotlightCSPrivateSearchableIndexClass = getCoreSpotlightCSPrivateSearchableIndexClass();

  return (id)[(objc_class *)CoreSpotlightCSPrivateSearchableIndexClass defaultSearchableIndex];
}

- (id)createSearchableIndexWithName:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = objc_alloc(getCoreSpotlightCSSearchableIndexClass());

  return (id)[v8 initWithName:a3 protectionClass:a4 bundleIdentifier:a5];
}

- (id)createPrivateSearchableIndexWithPath:(id)a3
{
  id v4 = objc_alloc(getCoreSpotlightCSPrivateSearchableIndexClass());

  return (id)[v4 initWithPath:a3];
}

@end
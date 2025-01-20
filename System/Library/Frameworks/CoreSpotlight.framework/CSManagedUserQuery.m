@interface CSManagedUserQuery
+ (void)preheat:(id)a3 path:(id)a4;
+ (void)prepareProtectionClasses:(id)a3 path:(id)a4;
- (id)initialConnection;
@end

@implementation CSManagedUserQuery

+ (void)prepareProtectionClasses:(id)a3 path:(id)a4
{
  +[CSManagedSearchQuery preheat:a3 path:a4];

  [a1 prepareLocalResources];
}

+ (void)preheat:(id)a3 path:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v6 = a4;
    +[CSManagedSearchQuery preheat:a3 path:v6];
  }
  else
  {
    uint64_t v9 = *MEMORY[0x1E4F28378];
    v7 = (void *)MEMORY[0x1E4F1C978];
    id v8 = a4;
    id v6 = [v7 arrayWithObjects:&v9 count:1];
    +[CSManagedSearchQuery preheat:path:](CSManagedSearchQuery, "preheat:path:", v6, v8, v9, v10);
  }
  [a1 prepareLocalResources];
}

- (id)initialConnection
{
  v2 = [(CSUnhousedUserQuery *)self resolvedIndexPath];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = [MEMORY[0x1E4F28B50] mainBundle];
    id v4 = [v5 bundleIdentifier];
  }
  id v6 = +[CSUnhousedSearchConnection connectionWithToken:v4];

  return v6;
}

@end
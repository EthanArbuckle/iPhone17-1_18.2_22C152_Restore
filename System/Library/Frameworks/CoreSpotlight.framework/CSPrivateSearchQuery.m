@interface CSPrivateSearchQuery
+ (void)preheat:(id)a3 path:(id)a4;
- (id)initialConnection;
@end

@implementation CSPrivateSearchQuery

+ (void)preheat:(id)a3 path:(id)a4
{
  id v5 = a3;
  id v6 = +[CSUnhousedSearchConnection connectionWithToken:a4];
  [v6 preheat:v5];
}

- (id)initialConnection
{
  v2 = [(CSUnhousedSearchQuery *)self resolvedIndexPath];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28B50] mainBundle];
    id v4 = [v5 bundleIdentifier];
  }
  id v6 = +[CSUnhousedSearchConnection connectionWithToken:v4];

  return v6;
}

@end
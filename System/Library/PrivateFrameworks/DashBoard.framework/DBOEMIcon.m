@interface DBOEMIcon
- (DBOEMIcon)initWithSessionConfiguration:(id)a3;
@end

@implementation DBOEMIcon

- (DBOEMIcon)initWithSessionConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F312A8];
  v9.receiver = self;
  v9.super_class = (Class)DBOEMIcon;
  v6 = [(SBLeafIcon *)&v9 initWithLeafIdentifier:v5 applicationBundleID:v5];
  if (v6)
  {
    v7 = +[DBLeafIconDataSource dataSourceForOEMIconWithSessionConfiguration:v4];
    [(SBLeafIcon *)v6 addIconDataSource:v7];
  }
  return v6;
}

@end
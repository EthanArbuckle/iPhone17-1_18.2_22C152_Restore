@interface DBDashboardOEMPunchthroughEntity
+ (id)oemPunchthroughEntityForIdentifier:(id)a3;
- (BOOL)isOEMPunchthroughEntity;
- (id)_initWithOEMPunchthroughIdentifier:(id)a3;
@end

@implementation DBDashboardOEMPunchthroughEntity

- (id)_initWithOEMPunchthroughIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DBDashboardOEMPunchthroughEntity;
  return [(DBDashboardEntity *)&v4 _initWithIdentifier:a3];
}

+ (id)oemPunchthroughEntityForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[DBDashboardOEMPunchthroughEntity alloc] _initWithOEMPunchthroughIdentifier:v3];

  return v4;
}

- (BOOL)isOEMPunchthroughEntity
{
  return 1;
}

@end
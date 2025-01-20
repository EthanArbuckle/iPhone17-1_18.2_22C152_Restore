@interface BMViewResourceMapper
- (id)databaseForViewName;
- (void)setDatabaseForViewName:(id)a3;
@end

@implementation BMViewResourceMapper

- (id)databaseForViewName
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setDatabaseForViewName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
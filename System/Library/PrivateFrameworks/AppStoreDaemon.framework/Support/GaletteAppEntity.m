@interface GaletteAppEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
@end

@implementation GaletteAppEntity

+ (id)databaseTable
{
  return @"galette";
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class();
}

@end
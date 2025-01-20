@interface ODRTagEntity
+ (id)databaseTable;
@end

@implementation ODRTagEntity

+ (id)databaseTable
{
  return @"odr_tag";
}

@end
@interface PHAlbum
+ (id)fetchType;
+ (id)managedEntityName;
@end

@implementation PHAlbum

+ (id)managedEntityName
{
  return @"Album";
}

+ (id)fetchType
{
  v2 = @"PHAlbum";
  return @"PHAlbum";
}

@end
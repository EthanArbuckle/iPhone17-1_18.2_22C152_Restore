@interface _DKBulletinBoardMetadataKey
+ (id)feed;
+ (id)hasDate;
+ (id)message;
+ (id)subtitle;
+ (id)title;
@end

@implementation _DKBulletinBoardMetadataKey

+ (id)title
{
  return @"_DKBulletinBoardMetadataKey-title";
}

+ (id)subtitle
{
  return @"_DKBulletinBoardMetadataKey-subtitle";
}

+ (id)message
{
  return @"_DKBulletinBoardMetadataKey-message";
}

+ (id)hasDate
{
  return @"_DKBulletinBoardMetadataKey-hasDate";
}

+ (id)feed
{
  return @"_DKBulletinBoardMetadataKey-feed";
}

@end
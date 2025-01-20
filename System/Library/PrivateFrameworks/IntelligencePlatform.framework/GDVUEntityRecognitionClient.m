@interface GDVUEntityRecognitionClient
+ (id)contacts;
+ (id)homekit;
+ (id)photos;
+ (id)reserved;
+ (id)syndication;
- (GDVUEntityRecognitionClient)init;
@end

@implementation GDVUEntityRecognitionClient

+ (id)photos
{
  id v2 = static GDVUEntityRecognitionClient.photos()();

  return v2;
}

+ (id)syndication
{
  id v2 = static GDVUEntityRecognitionClient.syndication()();

  return v2;
}

+ (id)homekit
{
  id v2 = static GDVUEntityRecognitionClient.homekit()();

  return v2;
}

+ (id)contacts
{
  id v2 = static GDVUEntityRecognitionClient.contacts()();

  return v2;
}

+ (id)reserved
{
  id v2 = static GDVUEntityRecognitionClient.reserved()();

  return v2;
}

- (GDVUEntityRecognitionClient)init
{
}

- (void).cxx_destruct
{
}

@end
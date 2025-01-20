@interface FeedItem
- (NSString)description;
- (_TtC14HealthPlatform8FeedItem)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation FeedItem

- (NSString)description
{
  v2 = self;
  FeedItem.description.getter();

  v3 = (void *)sub_1C277B820();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC14HealthPlatform8FeedItem)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FeedItem();
  return [(FeedItem *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end
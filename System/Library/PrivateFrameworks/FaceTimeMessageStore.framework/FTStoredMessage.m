@interface FTStoredMessage
- (FTStoredMessage)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (NSString)description;
@end

@implementation FTStoredMessage

- (NSString)description
{
  v2 = self;
  FTStoredMessage.description.getter();

  v3 = (void *)sub_24DF1ECA0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (FTStoredMessage)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (FTStoredMessage *)FTStoredMessage.init(entity:insertInto:)(v5, a4);
}

@end
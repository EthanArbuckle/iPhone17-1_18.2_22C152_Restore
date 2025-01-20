@interface FTLocalMessage
- (FTLocalMessage)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (NSString)description;
@end

@implementation FTLocalMessage

- (NSString)description
{
  v2 = self;
  FTLocalMessage.description.getter();

  v3 = (void *)sub_24DF1ECA0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (FTLocalMessage)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (FTLocalMessage *)FTLocalMessage.init(entity:insertInto:)(v5, a4);
}

@end
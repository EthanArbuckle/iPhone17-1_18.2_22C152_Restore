@interface CNContactEntityIdentifierProvider
+ (NSString)EntityTypeIdentifier;
- (_TtC8Contacts33CNContactEntityIdentifierProvider)init;
@end

@implementation CNContactEntityIdentifierProvider

+ (NSString)EntityTypeIdentifier
{
  if (qword_1E92A3C40 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  v2 = (void *)sub_190B77158();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC8Contacts33CNContactEntityIdentifierProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNContactEntityIdentifierProvider();
  return [(CNContactEntityIdentifierProvider *)&v3 init];
}

@end
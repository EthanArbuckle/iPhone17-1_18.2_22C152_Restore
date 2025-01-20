@interface AppStoreStyledFileSizeFormatter
+ (id)fileSize:(double)a3;
- (_TtC9appstored31AppStoreStyledFileSizeFormatter)init;
@end

@implementation AppStoreStyledFileSizeFormatter

+ (id)fileSize:(double)a3
{
  sub_1000D5A90(a3);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v3;
}

- (_TtC9appstored31AppStoreStyledFileSizeFormatter)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(AppStoreStyledFileSizeFormatter *)&v3 init];
}

@end
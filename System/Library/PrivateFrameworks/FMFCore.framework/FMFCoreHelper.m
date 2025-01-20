@interface FMFCoreHelper
+ (id)displayNameFor:(id)a3;
- (_TtC7FMFCore13FMFCoreHelper)init;
@end

@implementation FMFCoreHelper

+ (id)displayNameFor:(id)a3
{
  uint64_t v3 = qword_267C94980;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  sub_21CB075AC(v4, (uint64_t)v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = (void *)sub_21CB882C0();
  swift_bridgeObjectRelease();

  return v5;
}

- (_TtC7FMFCore13FMFCoreHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMFCoreHelper();
  return [(FMFCoreHelper *)&v3 init];
}

@end
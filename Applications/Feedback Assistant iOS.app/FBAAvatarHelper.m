@interface FBAAvatarHelper
+ (id)contactImageForEmailAddress:(id)a3;
+ (id)monogramAvatarImageForPreferredName:(id)a3 familyName:(id)a4;
+ (id)monogramBarButtonImageForPreferredName:(id)a3 familyName:(id)a4;
+ (id)monogramForPreferredName:(id)a3 familyName:(id)a4;
- (_TtC18Feedback_Assistant15FBAAvatarHelper)init;
@end

@implementation FBAAvatarHelper

+ (id)monogramForPreferredName:(id)a3 familyName:(id)a4
{
  return sub_10007E17C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10007E250);
}

- (_TtC18Feedback_Assistant15FBAAvatarHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBAAvatarHelper();
  return [(FBAAvatarHelper *)&v3 init];
}

+ (id)monogramBarButtonImageForPreferredName:(id)a3 familyName:(id)a4
{
  return sub_10007E17C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10007E6C0);
}

+ (id)monogramAvatarImageForPreferredName:(id)a3 familyName:(id)a4
{
  return sub_10007E17C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10007E8F0);
}

+ (id)contactImageForEmailAddress:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = sub_10007EBB0(v3, v4);
  swift_bridgeObjectRelease();

  return v5;
}

@end
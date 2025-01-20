@interface HPSSpatialProfileFeedback
+ (id)getDraftViewController;
- (_TtC16HeadphoneConfigs25HPSSpatialProfileFeedback)init;
@end

@implementation HPSSpatialProfileFeedback

+ (id)getDraftViewController
{
  uint64_t v2 = sub_1E4CBF130();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_allocWithZone((Class)sub_1E4CBF150());
  sub_1E4CBF120();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4F618D0], v2);
  sub_1E4CBF140();
  id v7 = objc_allocWithZone((Class)sub_1E4CBF170());
  v8 = (void *)sub_1E4CBF160();

  return v8;
}

- (_TtC16HeadphoneConfigs25HPSSpatialProfileFeedback)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HPSSpatialProfileFeedback();
  return [(HPSSpatialProfileFeedback *)&v3 init];
}

@end
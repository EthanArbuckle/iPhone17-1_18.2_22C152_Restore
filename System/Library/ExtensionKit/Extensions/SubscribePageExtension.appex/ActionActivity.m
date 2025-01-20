@interface ActionActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (_TtC22SubscribePageExtensionP33_932442DA714B10A6559014343396A9F814ActionActivity)init;
- (id)_systemImageName;
- (void)performActivity;
@end

@implementation ActionActivity

- (NSString)activityType
{
  v2 = self;
  sub_10075B0C0();
  NSString v3 = sub_1007675C0();

  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)activityTitle
{
  v2 = self;
  sub_10075B0D0();
  sub_100763910();
  swift_release();

  NSString v3 = sub_1007675C0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (UIImage)activityImage
{
  v2 = self;
  id v3 = sub_100125B98();

  return (UIImage *)v3;
}

- (id)_systemImageName
{
  v2 = self;
  sub_10075B0D0();
  uint64_t v3 = sub_100763920();
  swift_release();
  if (v3)
  {
    if (sub_100763E70())
    {
      sub_100763E90();
      uint64_t v5 = v4;
      swift_release();

      if (v5)
      {
        NSString v6 = sub_1007675C0();
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
    }
    else
    {

      swift_release();
    }
  }
  else
  {
  }
  NSString v6 = 0;
LABEL_8:

  return v6;
}

- (void)performActivity
{
  v2 = self;
  sub_100125D28();
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (_TtC22SubscribePageExtensionP33_932442DA714B10A6559014343396A9F814ActionActivity)init
{
  result = (_TtC22SubscribePageExtensionP33_932442DA714B10A6559014343396A9F814ActionActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtensionP33_932442DA714B10A6559014343396A9F814ActionActivity_activity;
  uint64_t v3 = sub_10075B0E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_unknownObjectWeakDestroy();

  swift_release();
}

@end
@interface ActionActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (_TtC18ASMessagesProviderP33_164D8B16753152EB39F79E4A0FCFB04314ActionActivity)init;
- (id)_systemImageName;
- (void)performActivity;
@end

@implementation ActionActivity

- (NSString)activityType
{
  v2 = self;
  sub_7710C0();
  NSString v3 = sub_77D640();

  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)activityTitle
{
  v2 = self;
  sub_7710D0();
  sub_779970();
  swift_release();

  NSString v3 = sub_77D640();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (UIImage)activityImage
{
  v2 = self;
  id v3 = sub_66D78();

  return (UIImage *)v3;
}

- (id)_systemImageName
{
  v2 = self;
  sub_7710D0();
  uint64_t v3 = sub_779980();
  swift_release();
  if (v3)
  {
    if (sub_779EE0())
    {
      sub_779F00();
      uint64_t v5 = v4;
      swift_release();

      if (v5)
      {
        NSString v6 = sub_77D640();
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
  sub_66F08();
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (_TtC18ASMessagesProviderP33_164D8B16753152EB39F79E4A0FCFB04314ActionActivity)init
{
  result = (_TtC18ASMessagesProviderP33_164D8B16753152EB39F79E4A0FCFB04314ActionActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC18ASMessagesProviderP33_164D8B16753152EB39F79E4A0FCFB04314ActionActivity_activity;
  uint64_t v3 = sub_7710E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_unknownObjectWeakDestroy();

  swift_release();
}

@end
@interface ActionActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (_TtC20ProductPageExtensionP33_FDFF98F3DEFBD62812CE468C53A31FA514ActionActivity)init;
- (id)_systemImageName;
- (void)performActivity;
@end

@implementation ActionActivity

- (NSString)activityType
{
  v2 = self;
  sub_10076F5C0();
  NSString v3 = sub_10077BC80();

  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)activityTitle
{
  v2 = self;
  sub_10076F5D0();
  sub_100777F50();
  swift_release();

  NSString v3 = sub_10077BC80();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (UIImage)activityImage
{
  v2 = self;
  id v3 = sub_10005BE14();

  return (UIImage *)v3;
}

- (id)_systemImageName
{
  v2 = self;
  sub_10076F5D0();
  uint64_t v3 = sub_100777F60();
  swift_release();
  if (v3)
  {
    if (sub_1007784B0())
    {
      sub_1007784D0();
      uint64_t v5 = v4;
      swift_release();

      if (v5)
      {
        NSString v6 = sub_10077BC80();
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
  sub_10005BFA4();
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (_TtC20ProductPageExtensionP33_FDFF98F3DEFBD62812CE468C53A31FA514ActionActivity)init
{
  result = (_TtC20ProductPageExtensionP33_FDFF98F3DEFBD62812CE468C53A31FA514ActionActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self
     + OBJC_IVAR____TtC20ProductPageExtensionP33_FDFF98F3DEFBD62812CE468C53A31FA514ActionActivity_activity;
  uint64_t v3 = sub_10076F5E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_unknownObjectWeakDestroy();

  swift_release();
}

@end
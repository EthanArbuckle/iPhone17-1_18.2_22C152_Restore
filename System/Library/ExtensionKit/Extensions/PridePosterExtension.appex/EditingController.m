@interface EditingController
- (BOOL)looksShareBaseAppearanceForEditor:(id)a3;
- (_TtC20PridePosterExtension17EditingController)init;
- (double)editor:(id)a3 luminanceForLook:(id)a4 inRect:(CGRect)a5;
- (id)initialLookIdentifierForEditor:(id)a3;
- (id)looksForEditor:(id)a3;
- (id)timeColorPickerConfigurationForEditor:(id)a3;
- (void)editor:(id)a3 didFinishTransitionToLook:(id)a4;
- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)editor:(id)a3 finalizeWithCompletion:(id)a4;
- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5;
- (void)editorDidInvalidate:(id)a3;
@end

@implementation EditingController

- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_10001D344(v6, a4);

  swift_unknownObjectRelease();
}

- (id)initialLookIdentifierForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001DFF8(v4);

  NSString v6 = sub_100024BE8();
  swift_bridgeObjectRelease();

  return v6;
}

- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  v8 = (uint64_t *)((char *)self + OBJC_IVAR____TtC20PridePosterExtension17EditingController_coordinators);
  swift_beginAccess();
  uint64_t v9 = *v8;
  id v10 = a3;
  swift_unknownObjectRetain();
  v11 = self;
  swift_bridgeObjectRetain();
  id v12 = a5;
  uint64_t v13 = sub_10001D260(v10, v9, (uint64_t (*)(void))sub_1000088B8, (void (*)(void))&type metadata accessor for WallpaperMetalCoordination.EditingCoordinator);
  swift_bridgeObjectRelease();
  if (v13)
  {
    v14 = (_TtC20PridePosterExtension17EditingController *)[v12 animationSettings];
    sub_100024A08();

    swift_release();
    v11 = v14;
  }
  else
  {
  }
  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 didFinishTransitionToLook:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10001E58C(v6, v7);
}

- (id)timeColorPickerConfigurationForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_100020AB0(v4);

  return v6;
}

- (id)looksForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100020498(v4);

  sub_100006164(0, &qword_100039D10);
  v6.super.isa = sub_100024CA8().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (BOOL)looksShareBaseAppearanceForEditor:(id)a3
{
  return 0;
}

- (double)editor:(id)a3 luminanceForLook:(id)a4 inRect:(CGRect)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  double v10 = sub_100020D00(v7);

  return v10;
}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  double v10 = self;
  sub_10001E860(v8, a4, v9);

  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 finalizeWithCompletion:(id)a4
{
  NSArray v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = self;
  sub_100020E28(v7, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)editorDidInvalidate:(id)a3
{
  swift_beginAccess();
  id v5 = a3;
  NSArray v6 = self;
  sub_10001EEDC(v5, (unint64_t)sub_1000088B8, (void (*)(void))sub_10000A2A0, sub_10001F710);
  swift_endAccess();

  swift_release();
  swift_beginAccess();
  id v7 = v5;
  sub_10001F050((uint64_t)v7, v8);
  swift_endAccess();

  sub_100020A28(v8);
}

- (_TtC20PridePosterExtension17EditingController)init
{
  uint64_t v3 = OBJC_IVAR____TtC20PridePosterExtension17EditingController_coordinators;
  id v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_100007964((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v5 = OBJC_IVAR____TtC20PridePosterExtension17EditingController_configurations;
  *(Class *)((char *)&v4->super.isa + v5) = (Class)sub_100007A9C((uint64_t)_swiftEmptyArrayStorage);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for EditingController();
  return [(EditingController *)&v7 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
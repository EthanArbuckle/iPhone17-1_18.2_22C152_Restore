@interface GradientPosterController
- (BOOL)looksShareBaseAppearanceForEditor:(id)a3;
- (_TtC23GradientPosterExtension24GradientPosterController)init;
- (double)editor:(id)a3 luminanceForLook:(id)a4 inRect:(CGRect)a5;
- (id)initialLookIdentifierForEditor:(id)a3;
- (id)looksForEditor:(id)a3;
- (id)solidColorHomeScreenColorPickerConfigurationForEditor:(id)a3;
- (id)trailingMenuElementsForEditor:(id)a3;
- (void)editor:(id)a3 didFinishTransitionToLook:(id)a4;
- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)editor:(id)a3 finalizeWithCompletion:(id)a4;
- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5;
- (void)editorDidFinishInitialLayout:(id)a3;
- (void)editorDidInvalidate:(id)a3;
- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)rendererDidInvalidate:(id)a3;
@end

@implementation GradientPosterController

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_10000AD24(v6, a4);

  swift_unknownObjectRelease();
}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
}

- (void)rendererDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000F1B0();
}

- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4
{
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_editor);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_editor) = (Class)a3;
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;

  swift_getObjectType();
  *(double *)((char *)&v7->super.isa + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_rotationAngle) = sub_10000EDAC();

  swift_unknownObjectRelease();
}

- (void)editorDidFinishInitialLayout:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000B1D0(v4);
}

- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
}

- (id)looksForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000F2DC();

  sub_100007CF4(0, &qword_100019598);
  v6.super.isa = sub_100010DA8().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (id)trailingMenuElementsForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_10000F754();

  if (v6)
  {
    sub_100007CF4(0, &qword_100019580);
    v7.super.isa = sub_100010DA8().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }

  return v7.super.isa;
}

- (id)initialLookIdentifierForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000B86C(v4);

  NSString v6 = sub_100010D38();
  swift_bridgeObjectRelease();

  return v6;
}

- (double)editor:(id)a3 luminanceForLook:(id)a4 inRect:(CGRect)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  double v10 = sub_10000FB40(v8);

  return v10;
}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  double v10 = self;
  sub_10000BD40(v8, a4, v9);

  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 finalizeWithCompletion:(id)a4
{
  NSString v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = self;
  sub_10001006C(v7, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)editorDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000A7D4();
  id v6 = *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_editor);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_editor) = 0;
}

- (void)editor:(id)a3 didFinishTransitionToLook:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1000106D8(v7);
}

- (BOOL)looksShareBaseAppearanceForEditor:(id)a3
{
  return 0;
}

- (id)solidColorHomeScreenColorPickerConfigurationForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (void *)sub_10000C6D0(v4);

  return v6;
}

- (_TtC23GradientPosterExtension24GradientPosterController)init
{
  return (_TtC23GradientPosterExtension24GradientPosterController *)sub_10000C9CC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_renderer));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_editor));
  v3 = (char *)self + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_gradientOptions;
  uint64_t v4 = sub_100010BB8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_colorPickerViewIdentifier));
  v5 = (char *)self + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_currentLookVariant;
  uint64_t v6 = sub_100010C18();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController____lazy_storage___bundle));
  swift_bridgeObjectRelease();
  id v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_sharedGradientView);
}

@end
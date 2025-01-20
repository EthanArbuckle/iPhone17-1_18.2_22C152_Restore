@interface AegirEditingController
- (BOOL)looksShareBaseAppearanceForEditor:(id)a3;
- (_TtC11AegirPoster22AegirEditingController)init;
- (id)initialLookIdentifierForEditor:(id)a3;
- (id)looksForEditor:(id)a3;
- (id)timeColorPickerConfigurationForEditor:(id)a3;
- (void)editor:(id)a3 didFinishTransitionToLook:(id)a4;
- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)editor:(id)a3 didTransitionToLook:(id)a4 progress:(double)a5;
- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)editor:(id)a3 finalizeWithCompletion:(id)a4;
- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5;
- (void)editorDidInvalidate:(id)a3;
@end

@implementation AegirEditingController

- (_TtC11AegirPoster22AegirEditingController)init
{
  return (_TtC11AegirPoster22AegirEditingController *)sub_100021038();
}

- (void).cxx_destruct
{
}

- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  id v8 = [a4 deviceOrientation];
  type metadata accessor for AegirEditingCoordinator();
  swift_allocObject();
  id v9 = v6;
  sub_100024D2C((uint64_t)v8, v9);
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC11AegirPoster22AegirEditingController_coordinator) = v10;

  swift_unknownObjectRelease();

  swift_release();
}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11AegirPoster22AegirEditingController_coordinator))
  {
    id v8 = a3;
    swift_unknownObjectRetain();
    id v9 = a5;
    v10 = self;
    swift_retain();
    sub_10002ACE8(a4);

    swift_unknownObjectRelease();
    swift_release();
  }
}

- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = a5;
  id v9 = self;
  sub_1000218DC();

  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 finalizeWithCompletion:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = self;
  sub_100021A48((uint64_t)v8, v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)editorDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100021BD4();
}

- (id)looksForEditor:(id)a3
{
  uint64_t v4 = qword_1000441E0;
  id v5 = a3;
  id v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_100020C9C(v7);

  swift_bridgeObjectRelease();
  sub_1000203F4(0, (unint64_t *)&unk_100045590);
  v8.super.isa = sub_100031D48().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

- (id)initialLookIdentifierForEditor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100021D28();

  NSString v6 = sub_100031C28();
  swift_bridgeObjectRelease();

  return v6;
}

- (BOOL)looksShareBaseAppearanceForEditor:(id)a3
{
  return 1;
}

- (void)editor:(id)a3 didTransitionToLook:(id)a4 progress:(double)a5
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11AegirPoster22AegirEditingController_coordinator))
  {
    id v8 = a3;
    id v9 = a4;
    v10 = self;
    swift_retain();
    sub_100025DDC(v9, a5);

    swift_release();
  }
}

- (void)editor:(id)a3 didFinishTransitionToLook:(id)a4
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11AegirPoster22AegirEditingController_coordinator))
  {
    id v6 = a3;
    id v7 = a4;
    id v8 = self;
    swift_retain();
    sub_10002727C(v7);

    swift_release();
  }
}

- (id)timeColorPickerConfigurationForEditor:(id)a3
{
  id v5 = objc_allocWithZone((Class)PREditorColorPickerConfiguration);
  id v6 = a3;
  id v7 = self;
  id v8 = [v5 init];
  id v9 = [self standardPalette];
  [v8 setColorPalette:v9];

  [v8 setColorWellDisplayMode:1];
  [v8 setShowsSlider:1];
  [v8 setShowsSuggestedColorItem:1];

  return v8;
}

@end
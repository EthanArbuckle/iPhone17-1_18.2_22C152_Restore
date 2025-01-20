@interface EditingController
- (BOOL)looksShareBaseAppearanceForEditor:(id)a3;
- (_TtC22MercuryPosterExtension17EditingController)init;
- (id)initialLookIdentifierForEditor:(id)a3;
- (id)leadingMenuElementsForEditor:(id)a3;
- (id)looksForEditor:(id)a3;
- (id)trailingMenuElementsForEditor:(id)a3;
- (int64_t)activeAppearanceMenuSelectionForEditor:(id)a3;
- (void)editor:(id)a3 appearanceMenuDidChangeSelectedStyle:(int64_t)a4;
- (void)editor:(id)a3 didFinishTransitionToLook:(id)a4;
- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)editor:(id)a3 didTransitionToLook:(id)a4 progress:(double)a5;
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
  sub_100004C80(v6, a4);

  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_1000054E8(v8, a4, a5);

  swift_unknownObjectRelease();
}

- (id)initialLookIdentifierForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000056A4(v4);

  NSString v6 = sub_10005DE38();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)looksForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100005C14(v4);

  sub_10000991C(0, &qword_100097D80);
  v6.super.isa = sub_10005DF98().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (id)leadingMenuElementsForEditor:(id)a3
{
  return sub_100006148(self, (uint64_t)a2, a3, (uint64_t (*)(id))sub_100005EF8);
}

- (id)trailingMenuElementsForEditor:(id)a3
{
  return sub_100006148(self, (uint64_t)a2, a3, (uint64_t (*)(id))sub_100005F24);
}

- (int64_t)activeAppearanceMenuSelectionForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_1000061EC(v4);

  return v6;
}

- (void)editor:(id)a3 appearanceMenuDidChangeSelectedStyle:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1000063E4(v6, a4);
}

- (void)editor:(id)a3 didTransitionToLook:(id)a4 progress:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_100006624(v8, v9, a5);
}

- (void)editor:(id)a3 didFinishTransitionToLook:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100006ABC(v6, v7);
}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_100006EB0(v8, a4, v9);

  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 finalizeWithCompletion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  id v9 = self;
  sub_1000073C8(v8, (uint64_t)sub_10000990C, v7);

  swift_release();
}

- (void)editorDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100007A20((uint64_t)v4);
}

- (BOOL)looksShareBaseAppearanceForEditor:(id)a3
{
  return 0;
}

- (_TtC22MercuryPosterExtension17EditingController)init
{
  uint64_t v3 = OBJC_IVAR____TtC22MercuryPosterExtension17EditingController_resources;
  id v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_10000A770((uint64_t)_swiftEmptyArrayStorage);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for EditingController();
  return [(EditingController *)&v6 init];
}

- (void).cxx_destruct
{
}

@end
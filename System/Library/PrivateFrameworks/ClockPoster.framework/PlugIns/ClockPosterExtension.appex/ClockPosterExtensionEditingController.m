@interface ClockPosterExtensionEditingController
- (_TtC20ClockPosterExtension37ClockPosterExtensionEditingController)init;
- (id)looksForEditor:(id)a3;
- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)editor:(id)a3 finalizeWithCompletion:(id)a4;
- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5;
- (void)editorDidInvalidate:(id)a3;
@end

@implementation ClockPosterExtensionEditingController

- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4
{
  swift_getObjectType();
  v7 = (objc_class *)a3;
  swift_unknownObjectRetain();
  v10 = self;
  sub_10000B1FC((uint64_t)a4, (uint64_t)v10);
  v8 = *(Class *)((char *)&v10->super.super.isa
                + OBJC_IVAR____TtC20ClockPosterExtension37ClockPosterExtensionEditingController_editor);
  *(Class *)((char *)&v10->super.super.isa
           + OBJC_IVAR____TtC20ClockPosterExtension37ClockPosterExtensionEditingController_editor) = v7;
  v9 = v7;

  sub_1000088A4();
  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  swift_getObjectType();
  id v9 = a3;
  swift_unknownObjectRetain();
  id v10 = a5;
  v11 = self;
  sub_10000B604((char *)a4, (char *)v11);

  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 finalizeWithCompletion:(id)a4
{
  uint64_t v7 = sub_10000CB18();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (void (**)(void))_Block_copy(a4);
  if (*(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20ClockPosterExtension30ClockPosterExtensionController_clockFaceController))
  {
    id v12 = a3;
    v13 = self;
    swift_retain();
    sub_10000C918();
    swift_release();
    sub_10000BC1C((uint64_t)v10, [v12 environment]);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v11[2](v11);
    _Block_release(v11);
  }
  else
  {
    id v14 = a3;
    v15 = self;
    _Block_release(v11);
    __break(1u);
  }
}

- (void)editorDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000C188(&OBJC_IVAR____TtC20ClockPosterExtension37ClockPosterExtensionEditingController_editor);
}

- (id)looksForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000C224();

  sub_10000C534(0, &qword_100016808);
  v6.super.isa = sub_10000CC88().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  id v10 = self;
  sub_10000C444(a4);

  swift_unknownObjectRelease();
}

- (_TtC20ClockPosterExtension37ClockPosterExtensionEditingController)init
{
  return (_TtC20ClockPosterExtension37ClockPosterExtensionEditingController *)sub_100009C40((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC20ClockPosterExtension37ClockPosterExtensionEditingController_editor, type metadata accessor for ClockPosterExtensionEditingController);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ClockPosterExtension37ClockPosterExtensionEditingController_editor));
}

@end
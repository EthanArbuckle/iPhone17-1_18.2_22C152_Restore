@interface MonogramPosterEditor
- (_TtC23MonogramPosterExtension20MonogramPosterEditor)init;
- (id)leadingMenuElementsForEditor:(id)a3;
- (id)looksForEditor:(id)a3;
- (id)trailingMenuElementsForEditor:(id)a3;
- (void)editor:(PREditor *)a3 finalizeWithCompletion:(id)a4;
- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)editor:(id)a3 didUpdateSelectedTimeFontConfiguration:(id)a4;
- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5;
- (void)editorDidInvalidate:(id)a3;
@end

@implementation MonogramPosterEditor

- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_10000BCE4(v6, a4);

  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 didUpdateSelectedTimeFontConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10000D394(v6, v7);
}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_1000123F8(v8, a4);

  swift_unknownObjectRelease();
}

- (void)editor:(PREditor *)a3 finalizeWithCompletion:(id)a4
{
  uint64_t v7 = sub_1000036B4(&qword_100029968);
  __chkstk_darwin(v7 - 8, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_100016470();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100029978;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100029988;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_100011D24((uint64_t)v10, (uint64_t)&unk_100029998, (uint64_t)v15);
  swift_release();
}

- (void)editorDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001278C();
}

- (id)looksForEditor:(id)a3
{
  sub_1000129A4();
  sub_10000582C(0, &qword_100029960);
  v3.super.isa = sub_100016400().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (id)leadingMenuElementsForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_10000E938();

  if (v6)
  {
    sub_10000582C(0, &qword_100029918);
    v7.super.isa = sub_100016400().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }

  return v7.super.isa;
}

- (id)trailingMenuElementsForEditor:(id)a3
{
  swift_beginAccess();
  id v5 = a3;
  uint64_t v6 = self;
  LOBYTE(self) = sub_100016160();
  swift_endAccess();
  if (self)
  {
    sub_1000036B4(&qword_100029910);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_100017930;
    sub_10000EC84();
    *(void *)(v7 + 32) = v8;
    sub_100016410();

    sub_10000582C(0, &qword_100029918);
    v9.super.isa = sub_100016400().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {

    v9.super.isa = 0;
  }

  return v9.super.isa;
}

- (_TtC23MonogramPosterExtension20MonogramPosterEditor)init
{
  return (_TtC23MonogramPosterExtension20MonogramPosterEditor *)sub_100011174();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__backgroundViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor__monogramViewController));

  NSArray v3 = (char *)self + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor_logger;
  uint64_t v4 = sub_100016290();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  id v5 = (char *)self + OBJC_IVAR____TtC23MonogramPosterExtension20MonogramPosterEditor_configuration;
  uint64_t v6 = sub_1000161D0();
  uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end
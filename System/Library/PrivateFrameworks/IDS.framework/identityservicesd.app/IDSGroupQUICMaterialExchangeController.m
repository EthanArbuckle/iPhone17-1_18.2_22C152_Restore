@interface IDSGroupQUICMaterialExchangeController
- (_TtC17identityservicesd38IDSGroupQUICMaterialExchangeController)init;
- (id)takeAllCurrentMaterials;
- (void)addHandler:(id)a3;
- (void)invalidate;
- (void)removeHandler:(id)a3;
- (void)sendDesiredMaterialsIfNeeded;
@end

@implementation IDSGroupQUICMaterialExchangeController

- (void)sendDesiredMaterialsIfNeeded
{
  v2 = self;
  sub_100463564();
}

- (void)addHandler:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1004670FC((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void)removeHandler:(id)a3
{
  v5 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_handlers);
  swift_beginAccess();
  swift_unknownObjectRetain();
  v6 = self;
  uint64_t v7 = sub_10046BEBC(v5, (uint64_t)a3);
  int64_t v8 = *(void *)(*v5 + 16);
  if (v8 < v7)
  {
    __break(1u);
  }
  else
  {
    sub_10046C154(v7, v8);
    swift_endAccess();
    swift_unknownObjectRelease();
  }
}

- (void)invalidate
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_currentlySent) = (Class)&_swiftEmptySetSingleton;
  swift_bridgeObjectRelease();
}

- (id)takeAllCurrentMaterials
{
  v2 = self;
  sub_10046744C();

  sub_100462C50(0, &qword_100A455C8);
  v3.super.isa = sub_100726560().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (_TtC17identityservicesd38IDSGroupQUICMaterialExchangeController)init
{
  result = (_TtC17identityservicesd38IDSGroupQUICMaterialExchangeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_q));
  sub_100461218((uint64_t)self + OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_delegate);
  NSArray v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_l;
  uint64_t v4 = sub_100725ED0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10044C6AC((uint64_t)self + OBJC_IVAR____TtC17identityservicesd38IDSGroupQUICMaterialExchangeController_cryptoHandler);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end
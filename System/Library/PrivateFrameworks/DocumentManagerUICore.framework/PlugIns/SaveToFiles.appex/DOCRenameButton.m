@interface DOCRenameButton
- (_TtC11SaveToFiles15DOCRenameButton)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)setTitle:(id)a3 forState:(unint64_t)a4;
@end

@implementation DOCRenameButton

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1004D1240();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  v8 = self;
  sub_10011C4C0(v5, v7);

  swift_bridgeObjectRelease();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCRenameButton();
  v2 = (char *)v5.receiver;
  [(DOCRenameButton *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC11SaveToFiles15DOCRenameButton_dimLayer];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
    objc_msgSend(v4, "setFrame:");

    v2 = v4;
  }
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  uint64_t v7 = sub_1004CFEE0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v12 = __chkstk_darwin(v11);
  v14 = (char *)&v20 - v13;
  *(uint64_t *)((char *)&v20 - v13) = 0x4024000000000000;
  (*(void (**)(char *, void, uint64_t, double))(v8 + 104))((char *)&v20 - v13, enum case for UIPointerShape.verticalBeam(_:), v7, v12);
  sub_100036804(0, (unint64_t *)&unk_10063E220);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v14, v7);
  id v15 = a3;
  id v16 = a4;
  v17 = self;
  v18 = (void *)sub_1004D1B00();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v7);

  return v18;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
}

- (_TtC11SaveToFiles15DOCRenameButton)initWithFrame:(CGRect)a3
{
  result = (_TtC11SaveToFiles15DOCRenameButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003BA48((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles15DOCRenameButton_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles15DOCRenameButton_dimLayer));
  swift_bridgeObjectRelease();
}

@end
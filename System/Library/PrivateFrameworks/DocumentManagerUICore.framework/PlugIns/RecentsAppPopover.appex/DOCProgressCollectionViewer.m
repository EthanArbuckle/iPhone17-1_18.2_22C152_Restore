@interface DOCProgressCollectionViewer
- (BOOL)isEditing;
- (CGSize)preferredContentSize;
- (_TtC17RecentsAppPopover27DOCProgressCollectionViewer)init;
- (_TtC17RecentsAppPopover27DOCProgressCollectionViewer)initWithRootViewController:(id)a3;
- (int64_t)modalPresentationStyle;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setEditing:(BOOL)a3;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)toggleEditTapped;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DOCProgressCollectionViewer

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10035AA64(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10035AD00((uint64_t)a3);
}

- (BOOL)isEditing
{
  return [*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC17RecentsAppPopover27DOCProgressCollectionViewer_listViewController) isEditing];
}

- (void)setEditing:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover27DOCProgressCollectionViewer_listViewController);
  v6 = self;
  v7 = self;
  objc_msgSend(v5, "setEditing:animated:", v3, objc_msgSend(v6, "areAnimationsEnabled"));
  sub_10035AEE4();
}

- (void)toggleEditTapped
{
  v2 = self;
  [(DOCProgressCollectionViewer *)v2 setEditing:[(DOCProgressCollectionViewer *)v2 isEditing] ^ 1];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_100067F20;
    v16[4] = sub_100067F20;
    v16[5] = v9;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 1107296256;
    v16[2] = sub_100429F8C;
    v16[3] = &unk_1005C02B8;
    v10 = _Block_copy(v16);
    id v11 = a3;
    v12 = self;
    swift_retain();
    swift_release();
  }
  else
  {
    id v13 = a3;
    v14 = self;
    v10 = 0;
  }
  v15 = (objc_class *)type metadata accessor for DOCProgressCollectionViewer();
  v17.receiver = self;
  v17.super_class = v15;
  [(DOCProgressCollectionViewer *)&v17 presentViewController:a3 animated:v5 completion:v10];
  _Block_release(v10);
  sub_100035EB4((uint64_t)v8);
}

- (int64_t)modalPresentationStyle
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCProgressCollectionViewer();
  return [(DOCProgressCollectionViewer *)&v3 modalPresentationStyle];
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCProgressCollectionViewer();
  [(DOCProgressCollectionViewer *)&v4 setModalPresentationStyle:a3];
}

- (CGSize)preferredContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCProgressCollectionViewer();
  [(DOCProgressCollectionViewer *)&v4 preferredContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC17RecentsAppPopover27DOCProgressCollectionViewer)init
{
  CGSize result = (_TtC17RecentsAppPopover27DOCProgressCollectionViewer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC17RecentsAppPopover27DOCProgressCollectionViewer)initWithRootViewController:(id)a3
{
  id v3 = a3;
  CGSize result = (_TtC17RecentsAppPopover27DOCProgressCollectionViewer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover27DOCProgressCollectionViewer_listViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover27DOCProgressCollectionViewer_adaptablePresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover27DOCProgressCollectionViewer____lazy_storage___dismissButtonItem));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover27DOCProgressCollectionViewer_listFittingHeightKVO);
}

@end
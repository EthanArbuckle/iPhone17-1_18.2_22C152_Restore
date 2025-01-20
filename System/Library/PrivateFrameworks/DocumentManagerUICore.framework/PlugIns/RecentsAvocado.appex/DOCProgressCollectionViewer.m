@interface DOCProgressCollectionViewer
- (BOOL)isEditing;
- (CGSize)preferredContentSize;
- (_TtC14RecentsAvocado27DOCProgressCollectionViewer)init;
- (_TtC14RecentsAvocado27DOCProgressCollectionViewer)initWithRootViewController:(id)a3;
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
  sub_1004560A8(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100456344((uint64_t)a3);
}

- (BOOL)isEditing
{
  return [*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC14RecentsAvocado27DOCProgressCollectionViewer_listViewController) isEditing];
}

- (void)setEditing:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC14RecentsAvocado27DOCProgressCollectionViewer_listViewController);
  v6 = self;
  v7 = self;
  objc_msgSend(v5, "setEditing:animated:", v3, objc_msgSend(v6, "areAnimationsEnabled"));
  sub_100456528();
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
    v8 = sub_100066488;
    v16[4] = sub_100066488;
    v16[5] = v9;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 1107296256;
    v16[2] = sub_1003A422C;
    v16[3] = &unk_1005D82B0;
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
  sub_1000388F0((uint64_t)v8);
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

- (_TtC14RecentsAvocado27DOCProgressCollectionViewer)init
{
  CGSize result = (_TtC14RecentsAvocado27DOCProgressCollectionViewer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC14RecentsAvocado27DOCProgressCollectionViewer)initWithRootViewController:(id)a3
{
  id v3 = a3;
  CGSize result = (_TtC14RecentsAvocado27DOCProgressCollectionViewer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado27DOCProgressCollectionViewer_listViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado27DOCProgressCollectionViewer_adaptablePresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado27DOCProgressCollectionViewer____lazy_storage___dismissButtonItem));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC14RecentsAvocado27DOCProgressCollectionViewer_listFittingHeightKVO);
}

@end
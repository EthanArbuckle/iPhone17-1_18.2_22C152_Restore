@interface DOCCreateFolderViewController
- (_TtC18DocumentAppIntents29DOCCreateFolderViewController)initWithCoder:(id)a3;
- (id)initForCreatingFolderInParentItem:(id)a3 suggestedName:(id)a4 transitionProxy:(id)a5;
@end

@implementation DOCCreateFolderViewController

- (id)initForCreatingFolderInParentItem:(id)a3 suggestedName:(id)a4 transitionProxy:(id)a5
{
  uint64_t v7 = sub_1004F4510();
  uint64_t v9 = v8;
  id v10 = a3;
  swift_unknownObjectRetain();
  return sub_10042F0D8(v10, v7, v9, (uint64_t)a5);
}

- (_TtC18DocumentAppIntents29DOCCreateFolderViewController)initWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents29DOCCreateFolderViewController_parentItem));
  v3 = (char *)self + OBJC_IVAR____TtC18DocumentAppIntents29DOCCreateFolderViewController_delegate;

  sub_100037E24((uint64_t)v3);
}

@end
@interface DOCCreateFolderViewController
- (_TtC17RecentsAppPopover29DOCCreateFolderViewController)initWithCoder:(id)a3;
- (id)initForCreatingFolderInParentItem:(id)a3 suggestedName:(id)a4 transitionProxy:(id)a5;
@end

@implementation DOCCreateFolderViewController

- (id)initForCreatingFolderInParentItem:(id)a3 suggestedName:(id)a4 transitionProxy:(id)a5
{
  uint64_t v7 = sub_1004BEB10();
  uint64_t v9 = v8;
  id v10 = a3;
  swift_unknownObjectRetain();
  return sub_1003C3940(v10, v7, v9, (uint64_t)a5);
}

- (_TtC17RecentsAppPopover29DOCCreateFolderViewController)initWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover29DOCCreateFolderViewController_parentItem));
  v3 = (char *)self + OBJC_IVAR____TtC17RecentsAppPopover29DOCCreateFolderViewController_delegate;
  sub_10003CC04((uint64_t)v3);
}

@end
@interface DOCCreateFolderViewController
- (_TtC33com_apple_DocumentManager_Service29DOCCreateFolderViewController)initWithCoder:(id)a3;
- (id)initForCreatingFolderInParentItem:(id)a3 suggestedName:(id)a4 transitionProxy:(id)a5;
@end

@implementation DOCCreateFolderViewController

- (id)initForCreatingFolderInParentItem:(id)a3 suggestedName:(id)a4 transitionProxy:(id)a5
{
  uint64_t v7 = sub_1004CD2F0();
  uint64_t v9 = v8;
  id v10 = a3;
  swift_unknownObjectRetain();
  return sub_10038C734(v10, v7, v9, (uint64_t)a5);
}

- (_TtC33com_apple_DocumentManager_Service29DOCCreateFolderViewController)initWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCCreateFolderViewController_parentItem));
  v3 = (char *)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service29DOCCreateFolderViewController_delegate;
  sub_10003EA7C((uint64_t)v3);
}

@end
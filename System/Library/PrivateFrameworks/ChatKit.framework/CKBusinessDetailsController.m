@interface CKBusinessDetailsController
- (BOOL)isShowingAddMemberPopover;
- (CKBusinessDetailsController)initWithCoder:(id)a3;
- (CKBusinessDetailsController)initWithConversation:(id)a3 detailsControllerDelegate:(id)a4;
- (CKBusinessDetailsController)initWithNibName:(id)a3 bundle:(id)a4;
- (CKConversation)conversation;
- (CKDetailsControllerDelegate)detailsControllerDelegate;
- (void)dismissDetailsController;
- (void)setConversation:(id)a3;
- (void)setDetailsControllerDelegate:(id)a3;
- (void)setIsShowingAddMemberPopover:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CKBusinessDetailsController

- (CKDetailsControllerDelegate)detailsControllerDelegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (CKDetailsControllerDelegate *)v2;
}

- (void)setDetailsControllerDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKBusinessDetailsController_detailsControllerDelegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (CKConversation)conversation
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKBusinessDetailsController_conversation);
  swift_beginAccess();
  return (CKConversation *)*v2;
}

- (void)setConversation:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___CKBusinessDetailsController_conversation);
  swift_beginAccess();
  v5 = *v4;
  id *v4 = a3;
  id v6 = a3;
}

- (BOOL)isShowingAddMemberPopover
{
  v2 = (BOOL *)self + OBJC_IVAR___CKBusinessDetailsController_isShowingAddMemberPopover;
  swift_beginAccess();
  return *v2;
}

- (void)setIsShowingAddMemberPopover:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKBusinessDetailsController_isShowingAddMemberPopover;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (CKBusinessDetailsController)initWithConversation:(id)a3 detailsControllerDelegate:(id)a4
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___CKBusinessDetailsController_isShowingAddMemberPopover) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKBusinessDetailsController_conversation) = (Class)a3;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKBusinessDetailsController_detailsControllerDelegate) = (Class)a4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BusinessDetailsController();
  id v5 = a3;
  swift_unknownObjectRetain();
  return [(CKBusinessDetailsController *)&v7 initWithNibName:0 bundle:0];
}

- (CKBusinessDetailsController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___CKBusinessDetailsController_isShowingAddMemberPopover) = 0;
  id v4 = a3;

  result = (CKBusinessDetailsController *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_18F666E34();
}

- (void)dismissDetailsController
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKBusinessDetailsController_detailsControllerDelegate);
  swift_beginAccess();
  objc_msgSend(*v2, sel_dismissDetailsNavigationController);
}

- (CKBusinessDetailsController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (CKBusinessDetailsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKBusinessDetailsController_conversation);
}

@end
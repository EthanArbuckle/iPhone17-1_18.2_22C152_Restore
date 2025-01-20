@interface CNAvatarPosterPairCollectionViewControllerWrapper
- (UIViewController)viewController;
- (_TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper)init;
- (_TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper)initWithConfiguration:(id)a3 contact:(id)a4 contactForSharedProfile:(id)a5 mode:(int64_t)a6 delegate:(id)a7;
- (void)setViewController:(id)a3;
@end

@implementation CNAvatarPosterPairCollectionViewControllerWrapper

- (UIViewController)viewController
{
  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper_viewController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)setViewController:(id)a3
{
  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper_viewController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper)initWithConfiguration:(id)a3 contact:(id)a4 contactForSharedProfile:(id)a5 mode:(int64_t)a6 delegate:(id)a7
{
  v22 = &unk_1ED9BC6A8;
  swift_unknownObjectRetain_n();
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  if (!swift_dynamicCastObjCProtocolConditional()) {
    swift_unknownObjectRelease();
  }
  objc_allocWithZone((Class)type metadata accessor for CNAvatarPosterPairCollectionViewController());
  id v16 = v12;
  id v17 = v13;
  id v18 = v14;
  *(Class *)((char *)&v15->super.isa
           + OBJC_IVAR____TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper_viewController) = (Class)sub_18B70D5E4(v16, v17, v18, a6);

  v21.receiver = v15;
  v21.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewControllerWrapper();
  v19 = [(CNAvatarPosterPairCollectionViewControllerWrapper *)&v21 init];

  swift_unknownObjectRelease();
  return v19;
}

- (_TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper)init
{
  result = (_TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper_viewController));
}

@end
@interface CKLinkIntentsManager
+ (CKLinkIntentsManager)sharedManager;
- (CKLinkIntentsManager)init;
- (void)purgeDependencies;
- (void)registerChatController:(id)a3;
- (void)registerDependencyWithDetailsController:(id)a3;
- (void)registerMessagesNavigator:(id)a3;
@end

@implementation CKLinkIntentsManager

+ (CKLinkIntentsManager)sharedManager
{
  if (qword_1E922AA28 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E922AE50;

  return (CKLinkIntentsManager *)v2;
}

- (CKLinkIntentsManager)init
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LinkIntentsManager();
  return [(CKLinkIntentsManager *)&v4 init];
}

- (void)registerMessagesNavigator:(id)a3
{
}

- (void)registerChatController:(id)a3
{
}

- (void)registerDependencyWithDetailsController:(id)a3
{
  sub_18F7B5390();
  id v5 = a3;
  v6 = self;
  sub_18F7B5380();
  sub_18F7BA3E0();
  *(void *)(swift_allocObject() + 16) = v5;
  sub_18F7A2874();
  id v7 = v5;
  sub_18F7B5370();
  swift_release();
  swift_release();
  sub_18F7A28B4((uint64_t)v8);
}

- (void)purgeDependencies
{
  sub_18F7B5390();
  v3 = self;
  sub_18F7B5380();
  sub_18F7BA3E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E922AAF8);
  sub_18F7B5370();
  swift_release();
  sub_18F7A28B4((uint64_t)v4);
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKLinkIntentsManager_messagesNavigator);

  swift_unknownObjectWeakDestroy();
}

@end
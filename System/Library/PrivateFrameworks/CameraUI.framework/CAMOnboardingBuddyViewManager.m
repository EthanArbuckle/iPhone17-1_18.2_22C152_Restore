@interface CAMOnboardingBuddyViewManager
- (CAMOnboardingBuddyViewManager)init;
- (id)createViewControllerWithDelegate:(id)a3;
- (int64_t)modelLoadingStatus;
- (void)createViewModel:(id)a3;
@end

@implementation CAMOnboardingBuddyViewManager

- (int64_t)modelLoadingStatus
{
  v2 = self;
  int64_t v3 = sub_209C15188();

  return v3;
}

- (void)createViewModel:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_209C179BC;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_209C15220((uint64_t (*)(uint64_t))v7, v6);
  sub_209C17974((uint64_t)v7);
}

- (id)createViewControllerWithDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  v5 = (void *)sub_209C1545C();
  swift_unknownObjectRelease();

  return v5;
}

- (CAMOnboardingBuddyViewManager)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CAMOnboardingBuddyViewManager_viewModel) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(CAMOnboardingBuddyViewManager *)&v5 init];
}

- (void).cxx_destruct
{
}

@end
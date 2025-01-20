@interface MRUSessionsContainerViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (MPMediaControlsConfiguration)configuration;
- (MRUSessionsContainerViewController)initWithCoder:(id)a3;
- (MRUSessionsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)customRowTappedBlock;
- (id)dismissalBlock;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setCustomRowTappedBlock:(id)a3;
- (void)setDismissalBlock:(id)a3;
- (void)transitionToVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation MRUSessionsContainerViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AE942538();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (MPMediaControlsConfiguration)configuration
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MRUSessionsContainerViewController_configuration);
  swift_beginAccess();
  return (MPMediaControlsConfiguration *)*v2;
}

- (void)setConfiguration:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___MRUSessionsContainerViewController_configuration);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (id)dismissalBlock
{
  v2 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MRUSessionsContainerViewController_dismissalBlock);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1AE9000BC;
    aBlock[3] = &block_descriptor_35;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDismissalBlock:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1AE943988;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR___MRUSessionsContainerViewController_dismissalBlock);
  swift_beginAccess();
  uint64_t v7 = *v6;
  *id v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1AE8F5874(v7);
}

- (id)customRowTappedBlock
{
  v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR___MRUSessionsContainerViewController_customRowTappedBlock);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1AE942D34;
    aBlock[3] = &block_descriptor_29;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setCustomRowTappedBlock:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1AE943930;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR___MRUSessionsContainerViewController_customRowTappedBlock);
  swift_beginAccess();
  uint64_t v7 = *v6;
  *id v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1AE8F5874(v7);
}

- (void)transitionToVisible:(BOOL)a3 animated:(BOOL)a4
{
  id v6 = self;
  sub_1AE942F24(a3, a4);
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4 = a3;
  v10 = self;
  uint64_t v5 = *sub_1AE8E463C();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = (Class *)((char *)&v10->super.super.super.isa
               + OBJC_IVAR___MRUSessionsContainerViewController_updatePopoverContentSize);
  uint64_t v8 = *(uint64_t *)((char *)&v10->super.super.super.isa
                  + OBJC_IVAR___MRUSessionsContainerViewController_updatePopoverContentSize);
  *uint64_t v7 = sub_1AE943264;
  v7[1] = v6;
  id v9 = v4;
  sub_1AE8F5874(v8);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  uint64_t v3 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR___MRUSessionsContainerViewController_updatePopoverContentSize);
  if (v3)
  {
    swift_unknownObjectRetain();
    uint64_t v6 = self;
    sub_1AE8F5864((uint64_t)v3);
    v3(objc_msgSend(a3, sel_preferredContentSize));
    sub_1AE8F5874((uint64_t)v3);
    swift_unknownObjectRelease();
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.isa) + 0xE8);
  id v5 = a3;
  uint64_t v8 = self;
  uint64_t v6 = (void (*)(void))v4();
  if (v6)
  {
    uint64_t v7 = (uint64_t)v6;
    v6();
    sub_1AE8F5874(v7);
  }
}

- (MRUSessionsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1AE947158();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (MRUSessionsContainerViewController *)sub_1AE9435A8(v5, v7, a4);
}

- (MRUSessionsContainerViewController)initWithCoder:(id)a3
{
  return (MRUSessionsContainerViewController *)sub_1AE9436EC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MRUSessionsContainerViewController____lazy_storage___popoverSourceView));
  sub_1AE8E765C(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR___MRUSessionsContainerViewController____lazy_storage___sessionsTransitioningDelegate));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MRUSessionsContainerViewController____lazy_storage___sessionsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MRUSessionsContainerViewController_configuration));
  sub_1AE8F5874(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___MRUSessionsContainerViewController_dismissalBlock));
  sub_1AE8F5874(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___MRUSessionsContainerViewController_customRowTappedBlock));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___MRUSessionsContainerViewController_updatePopoverContentSize);

  sub_1AE8F5874(v3);
}

@end
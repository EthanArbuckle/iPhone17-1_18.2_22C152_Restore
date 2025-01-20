@interface HUEmbeddedTriggerActionGridViewController
- (HUEmbeddedTriggerActionGridViewController)initWithTriggerBuilder:(id)a3;
- (HUEmbeddedTriggerActionGridViewControllerDelegate)triggerActionGridDelegate;
- (id)triggerBuilder;
- (void)reloadActions;
- (void)setTriggerActionGridDelegate:(id)a3;
- (void)setTriggerBuilder:(id)a3;
@end

@implementation HUEmbeddedTriggerActionGridViewController

- (id)triggerBuilder
{
  v2 = (id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa
            + OBJC_IVAR___HUEmbeddedTriggerActionGridViewController_triggerBuilder);
  swift_beginAccess();
  return *v2;
}

- (void)setTriggerBuilder:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.super.super.super.super.super.super.isa
               + OBJC_IVAR___HUEmbeddedTriggerActionGridViewController_triggerBuilder);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (HUEmbeddedTriggerActionGridViewControllerDelegate)triggerActionGridDelegate
{
  v2 = (char *)self + OBJC_IVAR___HUEmbeddedTriggerActionGridViewController_triggerActionGridDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1C1898E00](v2);

  return (HUEmbeddedTriggerActionGridViewControllerDelegate *)v3;
}

- (void)setTriggerActionGridDelegate:(id)a3
{
}

- (HUEmbeddedTriggerActionGridViewController)initWithTriggerBuilder:(id)a3
{
  return (HUEmbeddedTriggerActionGridViewController *)EmbeddedTriggerActionGridViewController.init(triggerBuilder:)(a3);
}

- (void)reloadActions
{
  v2 = self;
  v4 = [(HUItemCollectionViewController *)v2 itemManager];
  id v3 = [(HFItemManager *)v4 reloadAndUpdateAllItemsFromSenderSelector:sub_1BE9C1228()];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUEmbeddedTriggerActionGridViewController_triggerBuilder));
  id v3 = (char *)self + OBJC_IVAR___HUEmbeddedTriggerActionGridViewController_triggerActionGridDelegate;

  sub_1BE37E904((uint64_t)v3);
}

@end
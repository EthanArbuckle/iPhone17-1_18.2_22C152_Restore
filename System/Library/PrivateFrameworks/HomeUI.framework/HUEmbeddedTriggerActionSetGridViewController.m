@interface HUEmbeddedTriggerActionSetGridViewController
- (HUEmbeddedTriggerActionSetGridViewController)initWithTriggerBuilder:(id)a3;
- (HUEmbeddedTriggerActionSetGridViewControllerDelegate)delegate;
- (id)triggerBuilder;
- (void)reloadActions;
- (void)sceneEditor:(id)a3 removeActionSetBuilderFromTrigger:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setTriggerBuilder:(id)a3;
@end

@implementation HUEmbeddedTriggerActionSetGridViewController

- (id)triggerBuilder
{
  v2 = (id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa
            + OBJC_IVAR___HUEmbeddedTriggerActionSetGridViewController_triggerBuilder);
  swift_beginAccess();
  return *v2;
}

- (void)setTriggerBuilder:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.super.super.super.super.super.super.isa
               + OBJC_IVAR___HUEmbeddedTriggerActionSetGridViewController_triggerBuilder);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (HUEmbeddedTriggerActionSetGridViewControllerDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___HUEmbeddedTriggerActionSetGridViewController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1C1898E00](v2);

  return (HUEmbeddedTriggerActionSetGridViewControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (HUEmbeddedTriggerActionSetGridViewController)initWithTriggerBuilder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.super.isa
           + OBJC_IVAR___HUEmbeddedTriggerActionSetGridViewController_triggerBuilder) = (Class)a3;
  id v5 = a3;
  id v6 = (HUEmbeddedTriggerActionSetGridViewController *)sub_1BE3B5550((uint64_t)objc_msgSend(v5, sel_triggerActionSets), objc_msgSend(v5, sel_home), (char *)self);

  return v6;
}

- (void)reloadActions
{
  v2 = self;
  v4 = [(HUItemCollectionViewController *)v2 itemManager];
  id v3 = [(HFItemManager *)v4 reloadAndUpdateAllItemsFromSenderSelector:sub_1BE9C1228()];
}

- (void)sceneEditor:(id)a3 removeActionSetBuilderFromTrigger:(id)a4
{
  v7 = (char *)self + OBJC_IVAR___HUEmbeddedTriggerActionSetGridViewController_delegate;
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x1C1898E00](v7);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void **)((char *)&self->super.super.super.super.super.super.super.super.super.isa
                  + OBJC_IVAR___HUEmbeddedTriggerActionSetGridViewController_triggerBuilder);
    swift_beginAccess();
    v11 = *v10;
    id v12 = a3;
    id v13 = a4;
    v14 = self;
    id v15 = v11;
    objc_msgSend(v9, sel_triggerActionSetGridViewController_didUpdate_, v14, v15);

    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUEmbeddedTriggerActionSetGridViewController_triggerBuilder));
  id v3 = (char *)self + OBJC_IVAR___HUEmbeddedTriggerActionSetGridViewController_delegate;

  sub_1BE37E904((uint64_t)v3);
}

@end
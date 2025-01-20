@interface HUContainedSpeakersViewController
- (BOOL)requiresPresentingViewControllerDismissal;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUContainedSpeakersViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (HUContainedSpeakersViewController)initWithMediaItem:(id)a3;
- (HUPresentationDelegate)presentationDelegate;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)contentConfigurationForHeaderViewAtSectionIndex:(int64_t)a3;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (void)editWithSender:(id)a3;
- (void)itemManagerDidUpdate:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation HUContainedSpeakersViewController

- (BOOL)requiresPresentingViewControllerDismissal
{
  v2 = (BOOL *)self + OBJC_IVAR___HUContainedSpeakersViewController_requiresPresentingViewControllerDismissal;
  swift_beginAccess();
  return *v2;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HUContainedSpeakersViewController_requiresPresentingViewControllerDismissal;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (HUPresentationDelegate)presentationDelegate
{
  v2 = (char *)self + OBJC_IVAR___HUContainedSpeakersViewController_presentationDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1C1898E00](v2);

  return (HUPresentationDelegate *)v3;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (HUContainedSpeakersViewController)initWithMediaItem:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR___HUContainedSpeakersViewController_requiresPresentingViewControllerDismissal) = 0;
  swift_unknownObjectWeakInit();
  id v5 = objc_allocWithZone((Class)type metadata accessor for ContainedSpeakersItemManager());
  id v6 = a3;
  v7 = sub_1BE44CB9C(v6);
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ContainedSpeakersViewController();
  v8 = [(HUItemTableViewController *)&v10 initWithItemManager:v7 tableViewStyle:2];

  return v8;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE4B3338();
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v6 = sub_1BE9C1208();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  id v10 = a3;
  v11 = self;
  uint64_t v12 = sub_1BE4B3498(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (v12) {
    return (Class)swift_getObjCClassFromMetadata();
  }
  else {
    return 0;
  }
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  uint64_t v8 = sub_1BE9C1208();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  v15 = (void *)sub_1BE9C11A8();
  v16 = (objc_class *)type metadata accessor for ContainedSpeakersViewController();
  v17.receiver = v14;
  v17.super_class = v16;
  [(HUItemTableViewController *)&v17 setupCell:v12 forItem:v13 indexPath:v15];

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = (void *)sub_1BE4B3848(v4);

  return v6;
}

- (id)contentConfigurationForHeaderViewAtSectionIndex:(int64_t)a3
{
  id v4 = self;
  id v5 = sub_1BE4B3A74(a3);

  return v5;
}

- (void)itemManagerDidUpdate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ContainedSpeakersViewController();
  id v4 = a3;
  id v5 = v8.receiver;
  [(HUItemTableViewController *)&v8 itemManagerDidUpdate:v4];
  id v6 = objc_msgSend(v5, sel_itemManager, v8.receiver, v8.super_class);
  id v7 = objc_msgSend(v6, sel_home);

  objc_msgSend(v7, sel_hf_currentUserIsAdministrator);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1BE9C1208();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  id v10 = a3;
  v11 = self;
  sub_1BE4B3CBC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = sub_1BE4B3FD4(v6, a4);

  return v8;
}

- (HUContainedSpeakersViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  id v4 = a3;
  result = (HUContainedSpeakersViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)editWithSender:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1BE9C5638();
  swift_unknownObjectRelease();
  id v5 = [(HUItemTableViewController *)v4 itemManager];
  id v6 = [(HFItemManager *)v5 home];

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v7);
}

@end
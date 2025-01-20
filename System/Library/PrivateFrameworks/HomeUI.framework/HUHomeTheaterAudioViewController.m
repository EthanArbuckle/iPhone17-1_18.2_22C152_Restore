@interface HUHomeTheaterAudioViewController
- (HUHomeTheaterAudioViewController)initWithMediaAccessoryItem:(id)a3;
- (id)buildItemModuleControllerForModule:(id)a3;
- (void)homeTheaterItemModuleShouldPresentAlertController:(id)a3;
@end

@implementation HUHomeTheaterAudioViewController

- (HUHomeTheaterAudioViewController)initWithMediaAccessoryItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F69590]) initWithDelegate:self];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 setIdentifier:v7];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__HUHomeTheaterAudioViewController_initWithMediaAccessoryItem___block_invoke;
  v14[3] = &unk_1E63890F0;
  id v8 = v4;
  id v15 = v8;
  v9 = self;
  v16 = v9;
  [v5 setItemModuleCreator:v14];
  v13.receiver = v9;
  v13.super_class = (Class)HUHomeTheaterAudioViewController;
  v10 = [(HUItemTableViewController *)&v13 initWithItemManager:v5 tableViewStyle:1];
  if (v10)
  {
    v11 = _HULocalizedStringWithDefaultValue(@"HUHomeTheaterSettings_Title", @"HUHomeTheaterSettings_Title", 1);
    [(HUHomeTheaterAudioViewController *)v10 setTitle:v11];
  }
  return v10;
}

id __63__HUHomeTheaterAudioViewController_initWithMediaAccessoryItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [HUHomeTheaterAudioItemModule alloc];
  v6 = [*(id *)(a1 + 32) mediaProfileContainer];
  v7 = [(HUHomeTheaterAudioItemModule *)v5 initWithItemUpdater:v4 mediaProfileContainer:v6 includeLocalDestinations:1];

  [(HUHomeTheaterAudioItemModule *)v7 setAlertDelegate:*(void *)(a1 + 40)];
  v10[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  return v8;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    NSLog(&cfstr_UnexpectedModu.isa, v3);
  }
  id v4 = [(HUItemModuleController *)[HUHomeTheaterAudioItemModuleController alloc] initWithModule:v3];

  return v4;
}

- (void)homeTheaterItemModuleShouldPresentAlertController:(id)a3
{
}

@end
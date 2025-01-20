@interface DSRestrictionsController
- (DSNavigationDelegate)delegate;
- (DSRestrictionsController)init;
- (id)restrictionList;
- (void)learnMoreRestrictionsPressed;
- (void)setDelegate:(id)a3;
- (void)shouldShowWithCompletion:(id)a3;
- (void)viewDidLoad;
@end

@implementation DSRestrictionsController

- (DSRestrictionsController)init
{
  v3 = DSUILocStringForKey(@"RESTRICTIONS_TITLE");
  v6.receiver = self;
  v6.super_class = (Class)DSRestrictionsController;
  v4 = [(OBTextWelcomeController *)&v6 initWithTitle:v3];

  return v4;
}

- (void)shouldShowWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = sharedWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__DSRestrictionsController_shouldShowWithCompletion___block_invoke;
  block[3] = &unk_264C6EBA8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __53__DSRestrictionsController_shouldShowWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = [MEMORY[0x263F3A368] hasRestriction];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (id)restrictionList
{
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  if ([MEMORY[0x263F3A368] isSourceRestricted:*MEMORY[0x263F3A320]])
  {
    id v3 = DSUILocStringForKey(@"FIND_MY_RESTRICTIONS");
    [v2 addObject:v3];
  }
  if ([MEMORY[0x263F3A368] isSourceRestricted:*MEMORY[0x263F3A338]])
  {
    v4 = DSUILocStringForKey(@"SHARED_PHOTO_RESTRICTIONS");
    [v2 addObject:v4];
  }
  id v5 = [MEMORY[0x263EFF980] array];
  if ([MEMORY[0x263F3A368] isPermissionRestricted:@"location"])
  {
    objc_super v6 = [MEMORY[0x263F3A340] localizedNameForPermission:@"DSLocationAlways"];
    id v7 = DSLocStringForKey();
    [v5 addObject:v7];
  }
  if ([MEMORY[0x263F3A368] isPermissionRestricted:*MEMORY[0x263F7C4F8]])
  {
    v8 = [MEMORY[0x263F3A340] localizedNameForPermission:@"DSContacts"];
    v9 = DSLocStringForKey();
    [v5 addObject:v9];
  }
  v10 = (void *)MEMORY[0x263F7C508];
  if ([MEMORY[0x263F3A368] isPermissionRestricted:*MEMORY[0x263F7C508]])
  {
    v11 = [MEMORY[0x263F3A340] localizedNameForPermission:*v10];
    v12 = DSLocStringForKey();
    [v5 addObject:v12];
  }
  v13 = (void *)MEMORY[0x263F7C5C8];
  if ([MEMORY[0x263F3A368] isPermissionRestricted:*MEMORY[0x263F7C5C8]])
  {
    v14 = [MEMORY[0x263F3A340] localizedNameForPermission:*v13];
    v15 = DSLocStringForKey();
    [v5 addObject:v15];
  }
  v16 = (void *)MEMORY[0x263F7C5B8];
  if ([MEMORY[0x263F3A368] isPermissionRestricted:*MEMORY[0x263F7C5B8]])
  {
    v17 = [MEMORY[0x263F3A340] localizedNameForPermission:*v16];
    v18 = DSLocStringForKey();
    [v5 addObject:v18];
  }
  v19 = (void *)MEMORY[0x263F7C500];
  if ([MEMORY[0x263F3A368] isPermissionRestricted:*MEMORY[0x263F7C500]])
  {
    v20 = [MEMORY[0x263F3A340] localizedNameForPermission:*v19];
    v21 = DSLocStringForKey();
    [v5 addObject:v21];
  }
  v22 = (void *)MEMORY[0x263F7C598];
  if ([MEMORY[0x263F3A368] isPermissionRestricted:*MEMORY[0x263F7C598]])
  {
    v23 = [MEMORY[0x263F3A340] localizedNameForPermission:*v22];
    v24 = DSLocStringForKey();
    [v5 addObject:v24];
  }
  v25 = (void *)MEMORY[0x263F7C590];
  if ([MEMORY[0x263F3A368] isPermissionRestricted:*MEMORY[0x263F7C590]])
  {
    v26 = [MEMORY[0x263F3A340] localizedNameForPermission:*v25];
    v27 = DSLocStringForKey();
    [v5 addObject:v27];
  }
  v28 = [MEMORY[0x263F08950] localizedStringByJoiningStrings:v5];
  if ([v28 length])
  {
    v29 = NSString;
    v30 = DSUILocStringForKey(@"APP_RESTRICTIONS");
    v31 = objc_msgSend(v29, "stringWithFormat:", v30, v28);

    [v2 addObject:v31];
  }
  if ([MEMORY[0x263F3A368] isPasscodeModificationRestricted])
  {
    v32 = DSUILocStringForKey(@"PASSCODE_RESTRICTIONS");
    [v2 addObject:v32];
  }
  if ([MEMORY[0x263F3A368] isFingerprintModificationRestricted])
  {
    if (PSIsPearlAvailable())
    {
      v33 = DSUILocStringForKey(@"FACE_ID_RESTRICTIONS");
      [v2 addObject:v33];
    }
    if (PSSupportsMesa())
    {
      v34 = DSUILocStringForKey(@"TOUCH_ID_RESTRICTIONS");
      [v2 addObject:v34];
    }
  }
  if ([MEMORY[0x263F3A368] isAppRemovalRestricted])
  {
    v35 = DSUILocStringForKey(@"APP_DELETION_RESTRICTION");
    [v2 addObject:v35];
  }
  if ([MEMORY[0x263F3A368] isPrivateRelayRestricted])
  {
    v36 = DSUILocStringForKey(@"PRIVATE_RELAY_RESTRICTIONS");
    [v2 addObject:v36];
  }
  return v2;
}

- (void)learnMoreRestrictionsPressed
{
  id v4 = [(DSRestrictionsController *)self delegate];
  id v3 = DSUILocStringForKey(@"RESTRICTIONS_LEARN_MORE_URL");
  [v4 learnMorePressedForController:self withURL:v3];
}

- (void)viewDidLoad
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)DSRestrictionsController;
  [(OBBaseWelcomeController *)&v28 viewDidLoad];
  id v3 = [(DSRestrictionsController *)self headerView];
  id v4 = DSUILocStringForKey(@"RESTRICTIONS_DETAIL_1");
  [v3 setDetailText:v4];

  id v5 = (void *)MEMORY[0x263F82818];
  objc_super v6 = [MEMORY[0x263F825C8] systemBlueColor];
  id v7 = [v5 configurationWithHierarchicalColor:v6];

  v8 = [(DSRestrictionsController *)self headerView];
  v9 = (void *)MEMORY[0x263F827E8];
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v9 imageNamed:@"custom.nosign" inBundle:v10 withConfiguration:v7];
  [v8 setIcon:v11 accessibilityLabel:0];

  v12 = [MEMORY[0x263F5B8B8] accessoryButton];
  v13 = DSUILocStringForKey(@"RESTRICTIONS_LEARN_MORE");
  [v12 setTitle:v13 forState:0];

  [v12 addTarget:self action:sel_learnMoreRestrictionsPressed forControlEvents:64];
  v14 = [(DSRestrictionsController *)self headerView];
  [v14 addAccessoryButton:v12];

  v15 = DSUILocStringForKey(@"RESTRICTIONS_DETAIL_2");
  [(OBTextWelcomeController *)self addSectionWithHeader:0 content:v15];

  v16 = [(DSRestrictionsController *)self restrictionList];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        [(OBTextWelcomeController *)self addBulletedListItemWithTitle:*(void *)(*((void *)&v24 + 1) + 8 * v20++) description:0];
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v18);
  }
  v21 = DSUILocStringForKey(@"CONTINUE");
  v22 = [(DSRestrictionsController *)self delegate];
  id v23 = +[DSUIUtilities setUpBoldButtonForController:self title:v21 target:v22 selector:sel_pushNextPane];
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
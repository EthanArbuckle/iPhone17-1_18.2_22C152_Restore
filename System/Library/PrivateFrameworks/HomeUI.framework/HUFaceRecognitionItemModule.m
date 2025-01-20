@interface HUFaceRecognitionItemModule
- (HFStaticItem)faceRecognitionCellItem;
- (HFStaticItemProvider)staticItemProvider;
- (HMHome)home;
- (HUFaceRecognitionItemModule)initWithItemUpdater:(id)a3 home:(id)a4;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (void)setFaceRecognitionCellItem:(id)a3;
- (void)setHome:(id)a3;
- (void)setStaticItemProvider:(id)a3;
@end

@implementation HUFaceRecognitionItemModule

- (HUFaceRecognitionItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUFaceRecognitionItemModule;
  v8 = [(HFItemModule *)&v11 initWithItemUpdater:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_home, a4);
  }

  return v9;
}

- (id)itemProviders
{
  v3 = [(HUFaceRecognitionItemModule *)self home];
  v4 = [(HUFaceRecognitionItemModule *)self home];
  v5 = [v4 currentUser];
  v6 = [v3 homeAccessControlForUser:v5];

  BOOL v7 = [v6 camerasAccessLevel] == 2;
  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled]) {
    char v8 = 1;
  }
  else {
    char v8 = [MEMORY[0x1E4F69758] isRunningInStoreDemoMode];
  }
  v9 = [(HUFaceRecognitionItemModule *)self staticItemProvider];

  if (!v9)
  {
    objc_initWeak(&location, self);
    id v10 = objc_alloc(MEMORY[0x1E4F695C0]);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __44__HUFaceRecognitionItemModule_itemProviders__block_invoke;
    v24 = &unk_1E63866A0;
    objc_copyWeak(&v25, &location);
    char v26 = v8;
    BOOL v27 = v7;
    objc_super v11 = (void *)[v10 initWithResultsBlock:&v21];
    [(HUFaceRecognitionItemModule *)self setFaceRecognitionCellItem:v11];

    id v12 = objc_alloc(MEMORY[0x1E4F695C8]);
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    v14 = [(HUFaceRecognitionItemModule *)self faceRecognitionCellItem];
    v15 = objc_msgSend(v13, "setWithObjects:", v14, 0, v21, v22, v23, v24);
    v16 = (void *)[v12 initWithItems:v15];
    [(HUFaceRecognitionItemModule *)self setStaticItemProvider:v16];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  v17 = (void *)MEMORY[0x1E4F1CAD0];
  v18 = [(HUFaceRecognitionItemModule *)self staticItemProvider];
  v19 = objc_msgSend(v17, "setWithObjects:", v18, 0);

  return v19;
}

id __44__HUFaceRecognitionItemModule_itemProviders__block_invoke(uint64_t a1)
{
  v19[5] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained home];
  v4 = [v3 personManagerSettings];
  BOOL v5 = ([v4 isFaceClassificationEnabled] & 1) != 0 || *(unsigned char *)(a1 + 40) != 0;

  v6 = (void *)MEMORY[0x1E4F7A0D8];
  v18[0] = *MEMORY[0x1E4F68AB8];
  BOOL v7 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionModuleRecognitionCell", @"HUFaceRecognitionModuleRecognitionCell", 1);
  uint64_t v8 = *MEMORY[0x1E4F68A70];
  v19[0] = v7;
  v19[1] = MEMORY[0x1E4F1CC28];
  uint64_t v9 = *MEMORY[0x1E4F68A08];
  v18[1] = v8;
  v18[2] = v9;
  if (*(unsigned char *)(a1 + 41)) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = *(unsigned char *)(a1 + 40) == 0;
  }
  objc_super v11 = [NSNumber numberWithInt:v10];
  v19[2] = v11;
  v18[3] = *MEMORY[0x1E4F68980];
  if (v5) {
    id v12 = @"HUFaceRecognitionModuleRecognitionCellOn";
  }
  else {
    id v12 = @"HUFaceRecognitionModuleRecognitionCellOff";
  }
  v13 = _HULocalizedStringWithDefaultValue(v12, v12, 1);
  v19[3] = v13;
  v18[4] = *MEMORY[0x1E4F68900];
  v14 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v19[4] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
  v16 = [v6 futureWithResult:v15];

  return v16;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUFaceRecognitionItemModuleMainSectionIdentifier"];
  v6 = [(HUFaceRecognitionItemModule *)self faceRecognitionCellItem];
  v9[0] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v5 setItems:v7];

  [v4 addObject:v5];

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HFStaticItem)faceRecognitionCellItem
{
  return self->_faceRecognitionCellItem;
}

- (void)setFaceRecognitionCellItem:(id)a3
{
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_faceRecognitionCellItem, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end
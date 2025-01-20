@interface HUFaceRecognitionPersonEditorItemManager
+ (id)dateFormatter;
- (HFItem)addNameItem;
- (HFItem)deleteItem;
- (HFItem)faceCropItem;
- (HFItem)nameItem;
- (HFStaticItem)hideNotificationsItem;
- (HFStaticItemProvider)staticItemProvider;
- (HFUserNameFormatter)userNameFormatter;
- (HMHome)personHome;
- (HUFaceRecognitionPersonEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (void)setAddNameItem:(id)a3;
- (void)setDeleteItem:(id)a3;
- (void)setFaceCropItem:(id)a3;
- (void)setHideNotificationsItem:(id)a3;
- (void)setNameItem:(id)a3;
- (void)setPersonHome:(id)a3;
- (void)setStaticItemProvider:(id)a3;
- (void)setUserNameFormatter:(id)a3;
@end

@implementation HUFaceRecognitionPersonEditorItemManager

+ (id)dateFormatter
{
  if (qword_1EA12DF40 != -1) {
    dispatch_once(&qword_1EA12DF40, &__block_literal_global_14);
  }
  v2 = (void *)_MergedGlobals_3_0;

  return v2;
}

void __57__HUFaceRecognitionPersonEditorItemManager_dateFormatter__block_invoke()
{
  id v2 = [MEMORY[0x1E4F69160] sharedInstance];
  uint64_t v0 = [v2 relativeDateFormatter];
  v1 = (void *)_MergedGlobals_3_0;
  _MergedGlobals_3_0 = v0;
}

- (HUFaceRecognitionPersonEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 conformsToProtocol:&unk_1F1AD8FD0] & 1) == 0) {
    NSLog(&cfstr_SourceItemDoes.isa, v7);
  }
  v17.receiver = self;
  v17.super_class = (Class)HUFaceRecognitionPersonEditorItemManager;
  v8 = [(HFItemManager *)&v17 initWithDelegate:v6 sourceItem:v7];
  if (v8)
  {
    id v9 = v7;
    if ([v9 conformsToProtocol:&unk_1F1AD8FD0]) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    uint64_t v12 = [v11 home];

    personHome = v8->_personHome;
    v8->_personHome = (HMHome *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F69720]) initWithHome:v8->_personHome];
    userNameFormatter = v8->_userNameFormatter;
    v8->_userNameFormatter = (HFUserNameFormatter *)v14;

    [(HFUserNameFormatter *)v8->_userNameFormatter setStyle:0];
  }

  return v8;
}

- (id)_homeFuture
{
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  v3 = [(HUFaceRecognitionPersonEditorItemManager *)self personHome];
  v4 = [v2 futureWithResult:v3];

  return v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = a3;
  id v36 = [MEMORY[0x1E4F1CA48] array];
  v5 = [(HUFaceRecognitionPersonEditorItemManager *)self personItem];
  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled]) {
    char v6 = 1;
  }
  else {
    char v6 = [MEMORY[0x1E4F69758] isRunningInStoreDemoMode];
  }
  id v7 = objc_alloc(MEMORY[0x1E4F696A8]);
  v8 = (void *)[v5 copy];
  id v9 = (void *)[v7 initWithSourceItem:v8 transformationBlock:&__block_literal_global_74];
  [(HUFaceRecognitionPersonEditorItemManager *)self setFaceCropItem:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F696A8]);
  id v11 = (void *)[v5 copy];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_3;
  v48[3] = &__block_descriptor_33_e36___NSDictionary_16__0__NSDictionary_8l;
  char v49 = v6;
  uint64_t v12 = (void *)[v10 initWithSourceItem:v11 updateOptionsTransformBlock:&__block_literal_global_78 resultsTransformBlock:v48];
  [(HUFaceRecognitionPersonEditorItemManager *)self setNameItem:v12];

  objc_initWeak(&location, self);
  id v13 = objc_alloc(MEMORY[0x1E4F696A8]);
  uint64_t v14 = (void *)[v5 copy];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_5;
  v44[3] = &unk_1E6385D40;
  objc_copyWeak(&v45, &location);
  char v46 = v6;
  v15 = (void *)[v13 initWithSourceItem:v14 updateOptionsTransformBlock:&__block_literal_global_81 resultsTransformBlock:v44];
  [(HUFaceRecognitionPersonEditorItemManager *)self setAddNameItem:v15];

  v16 = [(HFItemManager *)self home];
  objc_super v17 = [v16 personSettingsManager];

  id v18 = objc_alloc(MEMORY[0x1E4F695C0]);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_6;
  v40[3] = &unk_1E6385DE0;
  id v19 = v5;
  id v41 = v19;
  id v35 = v17;
  id v42 = v35;
  char v43 = v6;
  v20 = (void *)[v18 initWithResultsBlock:v40];
  [(HUFaceRecognitionPersonEditorItemManager *)self setHideNotificationsItem:v20];

  id v21 = objc_alloc(MEMORY[0x1E4F696A8]);
  v22 = (void *)[v19 copy];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_10;
  v37[3] = &unk_1E6385D40;
  objc_copyWeak(&v38, &location);
  char v39 = v6;
  v23 = (void *)[v21 initWithSourceItem:v22 transformationBlock:v37];
  [(HUFaceRecognitionPersonEditorItemManager *)self setDeleteItem:v23];

  id v24 = objc_alloc(MEMORY[0x1E4F695C8]);
  v25 = (void *)MEMORY[0x1E4F1CAD0];
  v26 = [(HUFaceRecognitionPersonEditorItemManager *)self faceCropItem];
  v27 = [(HUFaceRecognitionPersonEditorItemManager *)self nameItem];
  v28 = [(HUFaceRecognitionPersonEditorItemManager *)self addNameItem];
  v29 = [(HUFaceRecognitionPersonEditorItemManager *)self hideNotificationsItem];
  v30 = [(HUFaceRecognitionPersonEditorItemManager *)self deleteItem];
  v31 = objc_msgSend(v25, "setWithObjects:", v26, v27, v28, v29, v30, 0);
  v32 = (void *)[v24 initWithItems:v31];
  [(HUFaceRecognitionPersonEditorItemManager *)self setStaticItemProvider:v32];

  v33 = [(HUFaceRecognitionPersonEditorItemManager *)self staticItemProvider];
  [v36 addObject:v33];

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v45);
  objc_destroyWeak(&location);

  return v36;
}

id __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *MEMORY[0x1E4F68860];
  v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F68860]];
  id v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v3, v2);
  v5 = [NSNumber numberWithInt:v3 == 0];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, *MEMORY[0x1E4F68B10]);

  return v4;
}

id __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = (void *)[v2 mutableCopy];
  id v4 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F68720]];

  LOBYTE(v2) = [v4 BOOLValue];
  if ((v2 & 1) == 0) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68728]];
  }

  return v3;
}

id __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  uint64_t v5 = *MEMORY[0x1E4F68AB8];
  char v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v4 setObject:v6 forKeyedSubscript:v5];
  id v7 = NSNumber;
  v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68868]];
  if ([v8 BOOLValue]) {
    uint64_t v9 = *(unsigned __int8 *)(a1 + 32);
  }
  else {
    uint64_t v9 = 1;
  }
  id v10 = [v7 numberWithInt:v9];
  [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
  id v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "length") == 0);
  [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  uint64_t v12 = *MEMORY[0x1E4F68908];
  id v13 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68908]];
  [v4 setObject:v13 forKeyedSubscript:v12];

  return v4;
}

id __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)[v2 mutableCopy];
  id v4 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F68720]];

  LOBYTE(v2) = [v4 BOOLValue];
  if ((v2 & 1) == 0) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68728]];
  }

  return v3;
}

id __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  char v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68868]];
  char v7 = [v6 BOOLValue];

  if (v7) {
    v8 = @"HUFaceRecognitionPersonEditorUnknownPersonNameButton";
  }
  else {
    v8 = @"HUFaceRecognitionPersonEditorUnknownPersonNameButtonPhotoLibrary";
  }
  uint64_t v9 = _HULocalizedStringWithDefaultValue(v8, v8, 1);
  uint64_t v10 = *MEMORY[0x1E4F68AB8];
  [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  id v11 = [WeakRetained home];
  int v12 = objc_msgSend(v11, "hf_currentUserIsAdministrator");

  id v13 = [v3 objectForKeyedSubscript:v10];
  uint64_t v14 = NSNumber;
  if ([v13 length]) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = v12 ^ 1u;
  }
  v16 = [v14 numberWithInt:v15];
  [v5 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
  objc_super v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v5 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  uint64_t v18 = *MEMORY[0x1E4F68908];
  id v19 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68908]];
  [v5 setObject:v19 forKeyedSubscript:v18];

  return v5;
}

id __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_6(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_7;
  v9[3] = &unk_1E6385D90;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v3 = [v2 futureWithBlock:v9];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_9;
  v6[3] = &unk_1E6385DB8;
  id v7 = *(id *)(a1 + 32);
  char v8 = *(unsigned char *)(a1 + 48);
  id v4 = [v3 flatMap:v6];

  return v4;
}

void __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) latestResults];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68BB8]];

  if (v5)
  {
    char v6 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_8;
    v7[3] = &unk_1E6385D68;
    id v8 = v3;
    [v6 fetchClassificationNotificationsEnabledForPersonWithUUID:v5 completion:v7];
  }
  else
  {
    [v3 finishWithNoResult];
  }
}

void __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_8(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithBool:a2];
  [v2 finishWithResult:v3];
}

id __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = 1;
  char v6 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionPersonEditorHideNotifications", @"HUFaceRecognitionPersonEditorHideNotifications", 1);
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  id v7 = NSNumber;
  id v8 = [*(id *)(a1 + 32) latestResults];
  uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68BB8]];
  if (v9) {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
  }
  id v10 = [v7 numberWithInt:v5];
  [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  objc_opt_class();
  id v11 = v3;
  if (objc_opt_isKindOfClass()) {
    int v12 = v11;
  }
  else {
    int v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    uint64_t v14 = NSNumber;
    [v13 BOOLValue];
    uint64_t v15 = [v14 numberWithInteger:HFPrimaryStateFromBOOL()];
    [v4 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];
  }
  v16 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v16;
}

id __71__HUFaceRecognitionPersonEditorItemManager__buildItemProvidersForHome___block_invoke_10(uint64_t a1, void *a2)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v15[0] = *MEMORY[0x1E4F68AB8];
  uint64_t v7 = 1;
  id v8 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionPersonEditorRemoveButton", @"HUFaceRecognitionPersonEditorRemoveButton", 1);
  v16[0] = v8;
  v15[1] = *MEMORY[0x1E4F68B10];
  uint64_t v9 = NSNumber;
  id v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68868]];

  int v11 = [v10 BOOLValue];
  if (v11)
  {
    id v2 = [WeakRetained home];
    if (objc_msgSend(v2, "hf_currentUserIsAdministrator")) {
      uint64_t v7 = *(unsigned __int8 *)(a1 + 40);
    }
  }
  int v12 = [v9 numberWithInt:v7];
  v16[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  if (v11) {

  }
  return v13;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v59[3] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  char v6 = [v4 array];
  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled]) {
    char v7 = 1;
  }
  else {
    char v7 = [MEMORY[0x1E4F69758] isRunningInStoreDemoMode];
  }
  unint64_t v8 = 0x1E4F69000uLL;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUFaceRecognitionPersonInformationSectionIdentifier"];
  id v10 = [(HUFaceRecognitionPersonEditorItemManager *)self faceCropItem];
  v59[0] = v10;
  int v11 = [(HUFaceRecognitionPersonEditorItemManager *)self nameItem];
  v59[1] = v11;
  int v12 = [(HUFaceRecognitionPersonEditorItemManager *)self addNameItem];
  v59[2] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:3];
  [v9 setItems:v13];

  uint64_t v14 = [(HUFaceRecognitionPersonEditorItemManager *)self personItem];
  uint64_t v15 = [v14 latestResults];
  v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F68868]];
  LOBYTE(v13) = [v16 BOOLValue];

  objc_super v17 = [(HUFaceRecognitionPersonEditorItemManager *)self personItem];
  uint64_t v18 = v17;
  if (v13 & 1) != 0 || (v7)
  {
    objc_opt_class();
    char v35 = objc_opt_isKindOfClass() | v7;

    if ((v35 & 1) == 0)
    {
      v34 = 0;
      unint64_t v46 = 0x1E4F1C000;
      goto LABEL_16;
    }
    id v36 = [(HUFaceRecognitionPersonEditorItemManager *)self personItem];
    v37 = [v36 latestResults];
    id v22 = [v37 objectForKeyedSubscript:*MEMORY[0x1E4F68850]];

    if (!v22)
    {
      v34 = 0;
      unint64_t v46 = 0x1E4F1C000;
      goto LABEL_15;
    }
    id v38 = [(id)objc_opt_class() dateFormatter];
    char v39 = [v38 stringFromDate:v22];
    v34 = HULocalizedStringWithFormat(@"HUFaceRecognitionPersonEditorLastVisitedFooterFormat", @"%@", v40, v41, v42, v43, v44, v45, (uint64_t)v39);

    unint64_t v46 = 0x1E4F1C000;
  }
  else
  {
    id v19 = [v17 personManager];

    v20 = [(HUFaceRecognitionPersonEditorItemManager *)self personHome];
    id v21 = objc_msgSend(v20, "hf_allUsersIncludingCurrentUser");
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __77__HUFaceRecognitionPersonEditorItemManager__buildSectionsWithDisplayedItems___block_invoke;
    v55[3] = &unk_1E63858F0;
    v56 = v19;
    id v22 = v19;
    v23 = objc_msgSend(v21, "na_firstObjectPassingTest:", v55);

    if (v23)
    {
      id v24 = [(HFItemManager *)self home];
      v25 = objc_msgSend(v24, "hf_handleForUser:", v23);

      v26 = [(HUFaceRecognitionPersonEditorItemManager *)self userNameFormatter];
      v27 = [v26 stringForObjectValue:v25];
      v34 = HULocalizedStringWithFormat(@"HUFaceRecognitionPersonEditorFromUserPhotoLibraryFormat", @"%@", v28, v29, v30, v31, v32, v33, (uint64_t)v27);

      unint64_t v8 = 0x1E4F69000;
    }
    else
    {
      v34 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionPersonEditorFromAPhotoLibrary", @"HUFaceRecognitionPersonEditorFromAPhotoLibrary", 1);
    }
    unint64_t v46 = 0x1E4F1C000uLL;

    id v38 = v56;
  }

LABEL_15:
LABEL_16:
  [v9 setFooterTitle:v34];
  [v6 addObject:v9];
  v47 = (void *)[objc_alloc(*(Class *)(v8 + 744)) initWithIdentifier:@"HUFaceRecognitionPersonNotificationSectionIdentifier"];
  v48 = [(HUFaceRecognitionPersonEditorItemManager *)self hideNotificationsItem];
  v58 = v48;
  char v49 = [*(id *)(v46 + 2424) arrayWithObjects:&v58 count:1];
  [v47 setItems:v49];

  [v6 addObject:v47];
  v50 = (void *)[objc_alloc(*(Class *)(v8 + 744)) initWithIdentifier:@"HUFaceRecognitionPersonDeletionSectionIdentifier"];
  v51 = [(HUFaceRecognitionPersonEditorItemManager *)self deleteItem];
  v57 = v51;
  v52 = [*(id *)(v46 + 2424) arrayWithObjects:&v57 count:1];
  [v50 setItems:v52];

  [v6 addObject:v50];
  v53 = [*(id *)(v8 + 744) filterSections:v6 toDisplayedItems:v5];

  return v53;
}

uint64_t __77__HUFaceRecognitionPersonEditorItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 photosPersonManager];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (HFItem)faceCropItem
{
  return self->_faceCropItem;
}

- (void)setFaceCropItem:(id)a3
{
}

- (HFItem)nameItem
{
  return self->_nameItem;
}

- (void)setNameItem:(id)a3
{
}

- (HFItem)addNameItem
{
  return self->_addNameItem;
}

- (void)setAddNameItem:(id)a3
{
}

- (HFStaticItem)hideNotificationsItem
{
  return self->_hideNotificationsItem;
}

- (void)setHideNotificationsItem:(id)a3
{
}

- (HFItem)deleteItem
{
  return self->_deleteItem;
}

- (void)setDeleteItem:(id)a3
{
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (HMHome)personHome
{
  return self->_personHome;
}

- (void)setPersonHome:(id)a3
{
}

- (HFUserNameFormatter)userNameFormatter
{
  return self->_userNameFormatter;
}

- (void)setUserNameFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNameFormatter, 0);
  objc_storeStrong((id *)&self->_personHome, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_deleteItem, 0);
  objc_storeStrong((id *)&self->_hideNotificationsItem, 0);
  objc_storeStrong((id *)&self->_addNameItem, 0);
  objc_storeStrong((id *)&self->_nameItem, 0);

  objc_storeStrong((id *)&self->_faceCropItem, 0);
}

@end
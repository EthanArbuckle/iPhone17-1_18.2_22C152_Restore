@interface HUFaceRecognitionUserPhotosLibrarySettingsModule
- (BOOL)shouldUseProxCardPresentationStyle;
- (HFItemProvider)allowPhotosLibraryAccessItemProvider;
- (HFStaticItem)photoLibraryAccessEveryoneInThisHome;
- (HFStaticItem)photoLibraryAccessNever;
- (HFStaticItem)photoLibraryAccessOnlyMe;
- (HMHome)home;
- (HUFaceRecognitionUserPhotosLibrarySettingsModule)initWithItemUpdater:(id)a3;
- (HUFaceRecognitionUserPhotosLibrarySettingsModule)initWithItemUpdater:(id)a3 home:(id)a4;
- (id)_updatePhotosLibrarySettingsForItem:(id)a3;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)didSelectItem:(id)a3;
- (id)itemProviders;
- (void)setAllowPhotosLibraryAccessItemProvider:(id)a3;
- (void)setHome:(id)a3;
- (void)setPhotoLibraryAccessEveryoneInThisHome:(id)a3;
- (void)setPhotoLibraryAccessNever:(id)a3;
- (void)setPhotoLibraryAccessOnlyMe:(id)a3;
- (void)setShouldUseProxCardPresentationStyle:(BOOL)a3;
@end

@implementation HUFaceRecognitionUserPhotosLibrarySettingsModule

- (HUFaceRecognitionUserPhotosLibrarySettingsModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsModule;
  v8 = [(HFItemModule *)&v11 initWithItemUpdater:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_home, a4);
  }

  return v9;
}

- (HUFaceRecognitionUserPhotosLibrarySettingsModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_home_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUFaceRecognitionUserPhotosLibrarySettingsModule.m", 42, @"%s is unavailable; use %@ instead",
    "-[HUFaceRecognitionUserPhotosLibrarySettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)didSelectItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUFaceRecognitionUserPhotosLibrarySettingsModule *)self allowPhotosLibraryAccessItemProvider];
  v6 = [v5 items];
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    v8 = [(HUFaceRecognitionUserPhotosLibrarySettingsModule *)self photoLibraryAccessNever];
    if ([v4 isEqual:v8])
    {

LABEL_5:
      uint64_t v10 = [(HUFaceRecognitionUserPhotosLibrarySettingsModule *)self _updatePhotosLibrarySettingsForItem:v4];
      goto LABEL_7;
    }
    char v9 = [MEMORY[0x1E4F69758] isCloudPhotosOn];

    if (v9) {
      goto LABEL_5;
    }
  }
  uint64_t v10 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
LABEL_7:
  objc_super v11 = (void *)v10;

  return v11;
}

- (id)itemProviders
{
  itemProviders = self->_itemProviders;
  if (itemProviders)
  {
    v3 = itemProviders;
  }
  else
  {
    v5 = [(HUFaceRecognitionUserPhotosLibrarySettingsModule *)self home];
    v6 = [v5 currentUser];

    int v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
    id v8 = objc_alloc(MEMORY[0x1E4F695C0]);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __65__HUFaceRecognitionUserPhotosLibrarySettingsModule_itemProviders__block_invoke;
    v41[3] = &unk_1E6386178;
    id v9 = v6;
    id v42 = v9;
    id v10 = v7;
    id v43 = v10;
    objc_super v11 = (void *)[v8 initWithResultsBlock:v41];
    [(HUFaceRecognitionUserPhotosLibrarySettingsModule *)self setPhotoLibraryAccessNever:v11];

    id v12 = objc_alloc(MEMORY[0x1E4F695C0]);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __65__HUFaceRecognitionUserPhotosLibrarySettingsModule_itemProviders__block_invoke_26;
    v38[3] = &unk_1E6386178;
    id v13 = v9;
    id v39 = v13;
    id v14 = v10;
    id v40 = v14;
    v15 = (void *)[v12 initWithResultsBlock:v38];
    [(HUFaceRecognitionUserPhotosLibrarySettingsModule *)self setPhotoLibraryAccessOnlyMe:v15];

    id v16 = objc_alloc(MEMORY[0x1E4F695C0]);
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __65__HUFaceRecognitionUserPhotosLibrarySettingsModule_itemProviders__block_invoke_34;
    v35 = &unk_1E6386178;
    id v36 = v13;
    id v37 = v14;
    id v17 = v14;
    id v18 = v13;
    v19 = (void *)[v16 initWithResultsBlock:&v32];
    [(HUFaceRecognitionUserPhotosLibrarySettingsModule *)self setPhotoLibraryAccessEveryoneInThisHome:v19];

    id v20 = objc_alloc(MEMORY[0x1E4F695C8]);
    v21 = (void *)MEMORY[0x1E4F1CAD0];
    v22 = [(HUFaceRecognitionUserPhotosLibrarySettingsModule *)self photoLibraryAccessNever];
    v23 = [(HUFaceRecognitionUserPhotosLibrarySettingsModule *)self photoLibraryAccessOnlyMe];
    v24 = [(HUFaceRecognitionUserPhotosLibrarySettingsModule *)self photoLibraryAccessEveryoneInThisHome];
    v25 = objc_msgSend(v21, "setWithObjects:", v22, v23, v24, 0, v32, v33, v34, v35);
    v26 = (void *)[v20 initWithItems:v25];
    [(HUFaceRecognitionUserPhotosLibrarySettingsModule *)self setAllowPhotosLibraryAccessItemProvider:v26];

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    v28 = [(HUFaceRecognitionUserPhotosLibrarySettingsModule *)self allowPhotosLibraryAccessItemProvider];
    objc_msgSend(v27, "setWithObjects:", v28, 0);
    v29 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v30 = self->_itemProviders;
    self->_itemProviders = v29;

    v3 = self->_itemProviders;
  }

  return v3;
}

id __65__HUFaceRecognitionUserPhotosLibrarySettingsModule_itemProviders__block_invoke(uint64_t a1)
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) photosPersonManagerSettings];
  if ([v2 isImportingFromPhotoLibraryEnabled])
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) photosPersonManagerSettings];
    uint64_t v3 = [v4 isSharingFaceClassificationsEnabled] ^ 1;
  }
  v13[0] = *MEMORY[0x1E4F68B40];
  v5 = [NSNumber numberWithBool:v3];
  v14[0] = v5;
  v14[1] = &unk_1F19B40D0;
  uint64_t v6 = *MEMORY[0x1E4F68AB8];
  v13[1] = @"faceRecognitionPhotosLibrarySettingsKey";
  v13[2] = v6;
  int v7 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionPhotosLibraryAccessNever", @"HUFaceRecognitionPhotosLibraryAccessNever", 1);
  uint64_t v8 = *MEMORY[0x1E4F68B48];
  v14[2] = v7;
  v14[3] = &unk_1F19B40E8;
  uint64_t v9 = *MEMORY[0x1E4F68908];
  v13[3] = v8;
  v13[4] = v9;
  v14[4] = *(void *)(a1 + 40);
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];

  objc_super v11 = [MEMORY[0x1E4F7A0D8] futureWithResult:v10];

  return v11;
}

id __65__HUFaceRecognitionUserPhotosLibrarySettingsModule_itemProviders__block_invoke_26(uint64_t a1)
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) photosPersonManagerSettings];
  if ([v2 isImportingFromPhotoLibraryEnabled])
  {
    uint64_t v3 = [*(id *)(a1 + 32) photosPersonManagerSettings];
    uint64_t v4 = [v3 isSharingFaceClassificationsEnabled] ^ 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  v13[0] = *MEMORY[0x1E4F68B40];
  v5 = [NSNumber numberWithBool:v4];
  v14[0] = v5;
  v14[1] = &unk_1F19B4100;
  uint64_t v6 = *MEMORY[0x1E4F68AB8];
  v13[1] = @"faceRecognitionPhotosLibrarySettingsKey";
  v13[2] = v6;
  int v7 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionPhotosLibraryAccessOnlyMe", @"HUFaceRecognitionPhotosLibraryAccessOnlyMe", 1);
  uint64_t v8 = *MEMORY[0x1E4F68B48];
  v14[2] = v7;
  v14[3] = &unk_1F19B4118;
  uint64_t v9 = *MEMORY[0x1E4F68908];
  v13[3] = v8;
  v13[4] = v9;
  v14[4] = *(void *)(a1 + 40);
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];

  objc_super v11 = [MEMORY[0x1E4F7A0D8] futureWithResult:v10];

  return v11;
}

id __65__HUFaceRecognitionUserPhotosLibrarySettingsModule_itemProviders__block_invoke_34(uint64_t a1)
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) photosPersonManagerSettings];
  if ([v2 isImportingFromPhotoLibraryEnabled])
  {
    uint64_t v3 = [*(id *)(a1 + 32) photosPersonManagerSettings];
    uint64_t v4 = [v3 isSharingFaceClassificationsEnabled];
  }
  else
  {
    uint64_t v4 = 0;
  }

  v13[0] = *MEMORY[0x1E4F68B40];
  v5 = [NSNumber numberWithBool:v4];
  v14[0] = v5;
  v14[1] = &unk_1F19B4130;
  uint64_t v6 = *MEMORY[0x1E4F68AB8];
  v13[1] = @"faceRecognitionPhotosLibrarySettingsKey";
  v13[2] = v6;
  int v7 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionPhotosLibraryAccessEveryoneInThisHome", @"HUFaceRecognitionPhotosLibraryAccessEveryoneInThisHome", 1);
  uint64_t v8 = *MEMORY[0x1E4F68B48];
  v14[2] = v7;
  v14[3] = &unk_1F19B4148;
  uint64_t v9 = *MEMORY[0x1E4F68908];
  v13[3] = v8;
  v13[4] = v9;
  v14[4] = *(void *)(a1 + 40);
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];

  objc_super v11 = [MEMORY[0x1E4F7A0D8] futureWithResult:v10];

  return v11;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v4 = objc_opt_new();
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUFaceRecognitionAllowPhotosLibraryAccessSectionIdentifier"];
  uint64_t v6 = [(HFItemModule *)self allItems];
  int v7 = [v6 allObjects];
  uint64_t v8 = [MEMORY[0x1E4F69220] itemResultManualSortComparator];
  uint64_t v9 = [v7 sortedArrayUsingComparator:v8];
  [v5 setItems:v9];

  if (![(HUFaceRecognitionUserPhotosLibrarySettingsModule *)self shouldUseProxCardPresentationStyle])
  {
    id v10 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionPhotosLibraryAccessHeader", @"HUFaceRecognitionPhotosLibraryAccessHeader", 1);
    [v5 setHeaderTitle:v10];

    objc_super v11 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionUsePhotosLibrarySectionFooterPhotosLink", @"HUFaceRecognitionUsePhotosLibrarySectionFooterPhotosLink", 1);
    id v12 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_photosLibraryPeopleAlbumURL");
    id v13 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionPhotosLibraryAccessFooter", @"HUFaceRecognitionPhotosLibraryAccessFooter", 1);
    if (([MEMORY[0x1E4F69758] isCloudPhotosOn] & 1) == 0)
    {
      id v14 = NSString;
      v15 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionPhotosLibraryiCloudOffFooter", @"HUFaceRecognitionPhotosLibraryiCloudOffFooter", 1);
      uint64_t v16 = [v14 stringWithFormat:@"%@\n%@", v13, v15];

      id v13 = (void *)v16;
    }
    id v17 = objc_msgSend(MEMORY[0x1E4F28B18], "hf_attributedLinkStringForString:linkString:linkURL:", v13, v11, v12);
    [v5 setAttributedFooterTitle:v17];
  }
  [v4 addObject:v5];

  return v4;
}

- (id)_updatePhotosLibrarySettingsForItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 latestResults];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    uint64_t v9 = [v4 latestResults];
    id v10 = [v9 objectForKeyedSubscript:@"faceRecognitionPhotosLibrarySettingsKey"];

    switch([v10 unsignedIntegerValue])
    {
      case 1:
        objc_super v11 = [(HUFaceRecognitionUserPhotosLibrarySettingsModule *)self home];
        id v12 = [(HUFaceRecognitionUserPhotosLibrarySettingsModule *)self home];
        id v13 = [v12 currentUser];
        id v14 = v11;
        v15 = v13;
        uint64_t v16 = 0;
        goto LABEL_7;
      case 2:
        objc_super v11 = [(HUFaceRecognitionUserPhotosLibrarySettingsModule *)self home];
        id v12 = [(HUFaceRecognitionUserPhotosLibrarySettingsModule *)self home];
        id v13 = [v12 currentUser];
        id v14 = v11;
        v15 = v13;
        uint64_t v16 = 1;
LABEL_7:
        uint64_t v17 = 0;
        goto LABEL_9;
      case 3:
        objc_super v11 = [(HUFaceRecognitionUserPhotosLibrarySettingsModule *)self home];
        id v12 = [(HUFaceRecognitionUserPhotosLibrarySettingsModule *)self home];
        id v13 = [v12 currentUser];
        id v14 = v11;
        v15 = v13;
        uint64_t v16 = 1;
        uint64_t v17 = 1;
LABEL_9:
        uint64_t v8 = objc_msgSend(v14, "hf_setPhotosLibrarySettingsForUser:importPhotosLibraryEnabled:shareFacesEnabled:", v15, v16, v17);

        break;
      default:
        uint64_t v8 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
        break;
    }
  }

  return v8;
}

- (BOOL)shouldUseProxCardPresentationStyle
{
  return self->_shouldUseProxCardPresentationStyle;
}

- (void)setShouldUseProxCardPresentationStyle:(BOOL)a3
{
  self->_shouldUseProxCardPresentationStyle = a3;
}

- (HFStaticItem)photoLibraryAccessNever
{
  return self->_photoLibraryAccessNever;
}

- (void)setPhotoLibraryAccessNever:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HFItemProvider)allowPhotosLibraryAccessItemProvider
{
  return self->_allowPhotosLibraryAccessItemProvider;
}

- (void)setAllowPhotosLibraryAccessItemProvider:(id)a3
{
}

- (HFStaticItem)photoLibraryAccessOnlyMe
{
  return self->_photoLibraryAccessOnlyMe;
}

- (void)setPhotoLibraryAccessOnlyMe:(id)a3
{
}

- (HFStaticItem)photoLibraryAccessEveryoneInThisHome
{
  return self->_photoLibraryAccessEveryoneInThisHome;
}

- (void)setPhotoLibraryAccessEveryoneInThisHome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryAccessEveryoneInThisHome, 0);
  objc_storeStrong((id *)&self->_photoLibraryAccessOnlyMe, 0);
  objc_storeStrong((id *)&self->_allowPhotosLibraryAccessItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_photoLibraryAccessNever, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
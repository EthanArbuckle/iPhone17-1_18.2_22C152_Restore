@interface HUCameraRecordingSettingsModule
- (BOOL)isItemHeader:(id)a3;
- (HUCameraPresenceRecordingSettingsModule)whenAwaySectionModule;
- (HUCameraPresenceRecordingSettingsModule)whenHomeSectionModule;
- (HUCameraRecordingOptionsItem)recordingOptionsItem;
- (HUCameraRecordingSettingsModule)initWithItemUpdater:(id)a3;
- (HUCameraRecordingSettingsModule)initWithItemUpdater:(id)a3 cameraProfiles:(id)a4 displayStyle:(unint64_t)a5;
- (HUCameraRecordingSettingsModuleDelegate)delegate;
- (HULocationDeviceManager)locationDeviceManager;
- (NSArray)cameraPresenceItems;
- (NSArray)presenceModules;
- (NSSet)cameraProfiles;
- (NSSet)itemProviders;
- (NSString)locationDeviceName;
- (NSString)longestCameraPresenceItemTitle;
- (NSString)longestCameraUsageOptionItemTitle;
- (id)_attributedFooterTitle;
- (id)_expandingSectionModuleForPresenceType:(unint64_t)a3;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)didSelectItem:(id)a3;
- (id)expandableModules;
- (unint64_t)awayAccessModeSetting;
- (unint64_t)displayStyle;
- (unint64_t)presentAccessModeSetting;
- (void)_buildItemProviders;
- (void)setDelegate:(id)a3;
- (void)setItemProviders:(id)a3;
- (void)setLocationDeviceManager:(id)a3;
- (void)setLocationDeviceName:(id)a3;
- (void)setWhenAwaySectionModule:(id)a3;
- (void)setWhenHomeSectionModule:(id)a3;
@end

@implementation HUCameraRecordingSettingsModule

- (HUCameraRecordingSettingsModule)initWithItemUpdater:(id)a3 cameraProfiles:(id)a4 displayStyle:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (![v10 count])
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HUCameraRecordingSettingsModule.m", 68, @"Invalid parameter not satisfying: %@", @"cameraProfiles.count > 0" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)HUCameraRecordingSettingsModule;
  v11 = [(HFItemModule *)&v18 initWithItemUpdater:v9];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    cameraProfiles = v11->_cameraProfiles;
    v11->_cameraProfiles = (NSSet *)v12;

    v11->_displayStyle = a5;
    uint64_t v14 = +[HULocationDeviceManager sharedInstance];
    locationDeviceManager = v11->_locationDeviceManager;
    v11->_locationDeviceManager = (HULocationDeviceManager *)v14;

    [(HUCameraRecordingSettingsModule *)v11 _buildItemProviders];
  }

  return v11;
}

- (HUCameraRecordingSettingsModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_cameraProfiles_displayStyle_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCameraRecordingSettingsModule.m", 82, @"%s is unavailable; use %@ instead",
    "-[HUCameraRecordingSettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (BOOL)isItemHeader:(id)a3
{
  return 0;
}

- (unint64_t)awayAccessModeSetting
{
  v2 = [(HUCameraRecordingSettingsModule *)self whenAwaySectionModule];
  unint64_t v3 = [v2 accessModeSetting];

  return v3;
}

- (unint64_t)presentAccessModeSetting
{
  v2 = [(HUCameraRecordingSettingsModule *)self whenHomeSectionModule];
  unint64_t v3 = [v2 accessModeSetting];

  return v3;
}

- (NSArray)presenceModules
{
  v7[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HUCameraRecordingSettingsModule *)self whenAwaySectionModule];
  v7[0] = v3;
  v4 = [(HUCameraRecordingSettingsModule *)self whenHomeSectionModule];
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return (NSArray *)v5;
}

- (void)_buildItemProviders
{
  v52[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v4 = [(HUCameraRecordingSettingsModule *)self locationDeviceManager];
  v5 = [v4 activeLocationDeviceFuture];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __54__HUCameraRecordingSettingsModule__buildItemProviders__block_invoke;
  v49[3] = &unk_1E638F3B8;
  objc_copyWeak(v50, &location);
  v50[1] = (id)a2;
  id v6 = (id)[v5 flatMap:v49];

  v7 = [HUCameraRecordingOptionsItem alloc];
  v8 = [(HUCameraRecordingSettingsModule *)self cameraProfiles];
  id v9 = [(HUCameraRecordingOptionsItem *)v7 initWithCameraProfiles:v8];
  recordingOptionsItem = self->_recordingOptionsItem;
  self->_recordingOptionsItem = v9;

  id v11 = objc_alloc(MEMORY[0x1E4F695C8]);
  uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
  v13 = [(HUCameraRecordingSettingsModule *)self recordingOptionsItem];
  uint64_t v14 = [v12 setWithObject:v13];
  v15 = (void *)[v11 initWithItems:v14];

  v16 = [HUCameraPresenceRecordingSettingsModule alloc];
  v17 = [(HFItemModule *)self itemUpdater];
  objc_super v18 = [(HUCameraRecordingSettingsModule *)self cameraProfiles];
  v19 = [(HUCameraPresenceRecordingSettingsModule *)v16 initWithItemUpdater:v17 cameraProfiles:v18 presenceEventType:3];
  [(HUCameraRecordingSettingsModule *)self setWhenHomeSectionModule:v19];

  v20 = [HUCameraPresenceRecordingSettingsModule alloc];
  v21 = [(HFItemModule *)self itemUpdater];
  v22 = [(HUCameraRecordingSettingsModule *)self cameraProfiles];
  v23 = [(HUCameraPresenceRecordingSettingsModule *)v20 initWithItemUpdater:v21 cameraProfiles:v22 presenceEventType:4];
  [(HUCameraRecordingSettingsModule *)self setWhenAwaySectionModule:v23];

  v24 = (void *)MEMORY[0x1E4F1CAD0];
  v25 = [(HUCameraRecordingSettingsModule *)self expandableModules];
  v26 = [v24 setWithArray:v25];
  v27 = objc_msgSend(v26, "na_flatMap:", &__block_literal_global_44_0);
  v52[0] = v15;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
  v29 = [v27 setByAddingObjectsFromArray:v28];
  [(HUCameraRecordingSettingsModule *)self setItemProviders:v29];

  v30 = (void *)MEMORY[0x1E4F69230];
  v31 = [(HUCameraRecordingSettingsModule *)self itemProviders];
  v32 = [v30 requestToReloadItemProviders:v31 senderSelector:a2];

  v33 = [(HFItemModule *)self itemUpdater];
  id v34 = (id)[v33 performItemUpdateRequest:v32];

  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__28;
  v47 = __Block_byref_object_dispose__28;
  v48 = &stru_1F18F92B8;
  v35 = [(HUCameraRecordingSettingsModule *)self presenceModules];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __54__HUCameraRecordingSettingsModule__buildItemProviders__block_invoke_48;
  v42[3] = &unk_1E638F3E0;
  v42[4] = &v43;
  objc_msgSend(v35, "na_map:", v42);
  v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
  cameraPresenceItems = self->_cameraPresenceItems;
  self->_cameraPresenceItems = v36;

  objc_storeStrong((id *)&self->_longestCameraPresenceItemTitle, (id)v44[5]);
  v38 = [(HUCameraRecordingSettingsModule *)self presenceModules];
  v39 = [v38 firstObject];
  v40 = [v39 longestCameraUsageOptionItemTitle];
  longestCameraUsageOptionItemTitle = self->_longestCameraUsageOptionItemTitle;
  self->_longestCameraUsageOptionItemTitle = v40;

  _Block_object_dispose(&v43, 8);
  objc_destroyWeak(v50);
  objc_destroyWeak(&location);
}

id __54__HUCameraRecordingSettingsModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = [v3 name];
    [WeakRetained setLocationDeviceName:v5];

    id v6 = (void *)MEMORY[0x1E4F69230];
    v7 = [WeakRetained itemProviders];
    v8 = [v6 requestToReloadItemProviders:v7 senderSelector:*(void *)(a1 + 40)];

    id v9 = [WeakRetained itemUpdater];
    id v10 = [v9 performItemUpdateRequest:v8];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F7A0D8];
    v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
    id v10 = [v11 futureWithError:v8];
  }

  return v10;
}

uint64_t __54__HUCameraRecordingSettingsModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 itemProviders];
}

id __54__HUCameraRecordingSettingsModule__buildItemProviders__block_invoke_48(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 showOptionsItem];
  v5 = [v4 latestResults];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  unint64_t v7 = [v6 length];
  if (v7 > [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) length]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6);
  }
  v8 = [v3 showOptionsItem];

  return v8;
}

- (id)_expandingSectionModuleForPresenceType:(unint64_t)a3
{
  if (a3 == 4)
  {
    id v3 = [(HUCameraRecordingSettingsModule *)self whenAwaySectionModule];
  }
  else if (a3 == 3)
  {
    id v3 = [(HUCameraRecordingSettingsModule *)self whenHomeSectionModule];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)expandableModules
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(HUCameraRecordingSettingsModule *)self whenHomeSectionModule];
  v7[0] = v3;
  v4 = [(HUCameraRecordingSettingsModule *)self whenAwaySectionModule];
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = [(HUCameraRecordingSettingsModule *)self expandableModules];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v21 + 1) + 8 * i) buildSectionsWithDisplayedItems:v4];
        uint64_t v12 = objc_msgSend(v11, "na_flatMap:", &__block_literal_global_53_0);
        [v5 addObjectsFromArray:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  if ([(HUCameraRecordingSettingsModule *)self displayStyle] == 3)
  {
    v13 = [(HUCameraRecordingSettingsModule *)self recordingOptionsItem];
    [v5 addObject:v13];
  }
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"RecordingSettings"];
  [v14 setItems:v5];
  v15 = _HULocalizedStringWithDefaultValue(@"HUCameraStreamingSettingsHeaderDisplayStyleServiceDetails_streaming-and-recording_Title", @"HUCameraStreamingSettingsHeaderDisplayStyleServiceDetails_streaming-and-recording_Title", 1);
  [v14 setHeaderTitle:v15];

  v16 = [(HUCameraRecordingSettingsModule *)self _attributedFooterTitle];
  [v14 setAttributedFooterTitle:v16];

  v17 = (void *)MEMORY[0x1E4F69220];
  v25 = v14;
  objc_super v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v19 = [v17 filterSections:v18 toDisplayedItems:v4];

  return v19;
}

uint64_t __67__HUCameraRecordingSettingsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 items];
}

- (id)_attributedFooterTitle
{
  id v3 = _HULocalizedStringWithDefaultValue(@"HUPresenceActiveLocationDeviceFooterSettingsLinkTitle", @"HUPresenceActiveLocationDeviceFooterSettingsLinkTitle", 1);
  id v4 = HFLocalizedString();
  if ([(HUCameraRecordingSettingsModule *)self displayStyle] == 2
    || [(HUCameraRecordingSettingsModule *)self displayStyle] == 1)
  {
    id v11 = [(HUCameraRecordingSettingsModule *)self locationDeviceName];
    if (v11)
    {
      uint64_t v12 = [(HUCameraRecordingSettingsModule *)self locationDeviceName];
      v19 = HULocalizedStringWithFormat(@"HUCameraRecordingSetup_Footer", @"%@%@", v13, v14, v15, v16, v17, v18, (uint64_t)v12);
    }
    else
    {
      v19 = HULocalizedStringWithFormat(@"HUCameraRecordingSetup_Footer_NoFMF", @"%@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
    }

    if (([MEMORY[0x1E4F69758] isAMac] & 1) != 0
      || [(HUCameraRecordingSettingsModule *)self displayStyle] != 1)
    {
      long long v22 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v19 attributes:0];
    }
    else
    {
      v20 = (void *)MEMORY[0x1E4F28B18];
      long long v21 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_locationDeviceSettingsURL");
      long long v22 = objc_msgSend(v20, "hf_attributedLinkStringForString:linkString:linkURL:", v19, v3, v21);
    }
  }
  else
  {
    v29 = [(HUCameraRecordingSettingsModule *)self locationDeviceName];
    if (v29)
    {
      v30 = [(HUCameraRecordingSettingsModule *)self locationDeviceName];
      v19 = HULocalizedStringWithFormat(@"HUCameraStreamingSettingsFooterDisplayStyleServiceDetails_footer_Title", @"%@%@%@", v31, v32, v33, v34, v35, v36, (uint64_t)v30);
    }
    else
    {
      v19 = HULocalizedStringWithFormat(@"HUCameraStreamingSettingsFooterDisplayStyleServiceDetails_footer_NoFMF_Title", @"%@%@", v23, v24, v25, v26, v27, v28, (uint64_t)v3);
    }

    if ([MEMORY[0x1E4F69758] isAMac])
    {
      v37 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v19 attributes:0];
    }
    else
    {
      v38 = (void *)MEMORY[0x1E4F28B18];
      v39 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_locationDeviceSettingsURL");
      v37 = objc_msgSend(v38, "hf_attributedLinkStringForString:linkString:linkURL:", v19, v3, v39);
    }
    v40 = (void *)MEMORY[0x1E4F28B18];
    v41 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_cameraRecordingURL");
    long long v22 = objc_msgSend(v40, "hf_attributedLinkStringForAttributedString:linkString:linkURL:", v37, v4, v41);
  }

  return v22;
}

- (id)didSelectItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  uint64_t v6 = [(HUExpandableItemContainerModule *)self expandableModuleForItem:v4];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v6 didSelectItem:v4];

    uint64_t v5 = (void *)v7;
  }
  objc_opt_class();
  id v8 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__HUCameraRecordingSettingsModule_didSelectItem___block_invoke;
    v13[3] = &unk_1E6386150;
    objc_copyWeak(&v15, &location);
    id v14 = v8;
    id v11 = (id)[v5 addCompletionBlock:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __49__HUCameraRecordingSettingsModule_didSelectItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [WeakRetained delegate];
    [v4 cameraRecordingSettingsModule:WeakRetained didUpdateItem:*(void *)(a1 + 32)];
  }
}

- (NSSet)itemProviders
{
  return self->_itemProviders;
}

- (void)setItemProviders:(id)a3
{
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (NSString)longestCameraUsageOptionItemTitle
{
  return self->_longestCameraUsageOptionItemTitle;
}

- (NSString)longestCameraPresenceItemTitle
{
  return self->_longestCameraPresenceItemTitle;
}

- (NSArray)cameraPresenceItems
{
  return self->_cameraPresenceItems;
}

- (HUCameraRecordingSettingsModuleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUCameraRecordingSettingsModuleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (HUCameraRecordingOptionsItem)recordingOptionsItem
{
  return self->_recordingOptionsItem;
}

- (HUCameraPresenceRecordingSettingsModule)whenHomeSectionModule
{
  return self->_whenHomeSectionModule;
}

- (void)setWhenHomeSectionModule:(id)a3
{
}

- (HUCameraPresenceRecordingSettingsModule)whenAwaySectionModule
{
  return self->_whenAwaySectionModule;
}

- (void)setWhenAwaySectionModule:(id)a3
{
}

- (HULocationDeviceManager)locationDeviceManager
{
  return self->_locationDeviceManager;
}

- (void)setLocationDeviceManager:(id)a3
{
}

- (NSString)locationDeviceName
{
  return self->_locationDeviceName;
}

- (void)setLocationDeviceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationDeviceName, 0);
  objc_storeStrong((id *)&self->_locationDeviceManager, 0);
  objc_storeStrong((id *)&self->_whenAwaySectionModule, 0);
  objc_storeStrong((id *)&self->_whenHomeSectionModule, 0);
  objc_storeStrong((id *)&self->_recordingOptionsItem, 0);
  objc_storeStrong((id *)&self->_cameraProfiles, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cameraPresenceItems, 0);
  objc_storeStrong((id *)&self->_longestCameraPresenceItemTitle, 0);
  objc_storeStrong((id *)&self->_longestCameraUsageOptionItemTitle, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
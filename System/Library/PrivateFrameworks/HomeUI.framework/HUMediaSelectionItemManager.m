@interface HUMediaSelectionItemManager
- (HFActionSetBuilder)actionSetBuilder;
- (HFMediaPlaybackActionBuilder)actionBuilder;
- (HFPlaybackArchive)lastSelectedArchive;
- (HFPlaybackArchive)pickedPlaybackArchive;
- (HFStaticItem)mediaPickerItem;
- (HFStaticItem)playbackStateAdjustVolumeOnlyItem;
- (HFStaticItem)playbackStatePauseItem;
- (HFStaticItem)playbackStatePlayItem;
- (HFStaticItem)playbackStateResumeItem;
- (HFStaticItem)repeatItem;
- (HFStaticItem)selectedPlaybackStateItem;
- (HFStaticItem)selectedVolumeItem;
- (HFStaticItem)shuffleItem;
- (HFStaticItem)useCurrentVolumeItem;
- (HFStaticItem)useCustomVolumeItem;
- (HFStaticItem)volumeSliderItem;
- (HUMediaItem)chosenMediaItem;
- (HUMediaSelectionItemManager)initWithDelegate:(id)a3 mediaPlaybackActionBuilder:(id)a4;
- (HUMediaSelectionItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (NSArray)customVolumeItems;
- (NSArray)mediaPickerRowItems;
- (NSArray)playbackOptionsItems;
- (NSArray)playbackStateItems;
- (NSArray)volumeSliderItems;
- (NSNumber)lastSelectedVolume;
- (SKCloudServiceController)cloudServiceController;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_itemsToHideInSet:(id)a3;
- (id)_volumeForMediaAction;
- (id)selectedPlaybackStateItemBasedOnActionBuilderState;
- (id)selectedVolumeItemBasedOnActionBuilderState;
- (void)mediaPlaybackOptionsItem:(id)a3 switchedOn:(BOOL)a4;
- (void)mediaVolumeValueChanged:(double)a3;
- (void)setActionBuilder:(id)a3;
- (void)setChosenMediaItem:(id)a3;
- (void)setCloudServiceController:(id)a3;
- (void)setCustomVolumeItems:(id)a3;
- (void)setLastSelectedArchive:(id)a3;
- (void)setLastSelectedVolume:(id)a3;
- (void)setMediaPickerItem:(id)a3;
- (void)setMediaPickerRowItems:(id)a3;
- (void)setPickedPlaybackArchive:(id)a3;
- (void)setPlaybackOptionsItems:(id)a3;
- (void)setPlaybackStateAdjustVolumeOnlyItem:(id)a3;
- (void)setPlaybackStateItems:(id)a3;
- (void)setPlaybackStatePauseItem:(id)a3;
- (void)setPlaybackStatePlayItem:(id)a3;
- (void)setPlaybackStateResumeItem:(id)a3;
- (void)setRepeatItem:(id)a3;
- (void)setSelectedPlaybackStateItem:(id)a3;
- (void)setSelectedVolumeItem:(id)a3;
- (void)setShuffleItem:(id)a3;
- (void)setUseCurrentVolumeItem:(id)a3;
- (void)setUseCustomVolumeItem:(id)a3;
- (void)setVolumeSliderItem:(id)a3;
- (void)setVolumeSliderItems:(id)a3;
@end

@implementation HUMediaSelectionItemManager

- (HUMediaSelectionItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDelegate_mediaPlaybackActionBuilder_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUMediaSelectionItemManager.m", 73, @"%s is unavailable; use %@ instead",
    "-[HUMediaSelectionItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUMediaSelectionItemManager)initWithDelegate:(id)a3 mediaPlaybackActionBuilder:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUMediaSelectionItemManager;
  v8 = [(HFItemManager *)&v12 initWithDelegate:a3 sourceItem:0];
  if (v8)
  {
    v9 = (SKCloudServiceController *)objc_alloc_init(MEMORY[0x1E4F3C2A8]);
    cloudServiceController = v8->_cloudServiceController;
    v8->_cloudServiceController = v9;

    objc_storeStrong((id *)&v8->_actionSetBuilder, a4);
  }

  return v8;
}

- (HFMediaPlaybackActionBuilder)actionBuilder
{
  v2 = [(HUMediaSelectionItemManager *)self actionSetBuilder];
  v3 = [v2 mediaAction];

  return (HFMediaPlaybackActionBuilder *)v3;
}

- (id)selectedPlaybackStateItemBasedOnActionBuilderState
{
  v3 = [(HUMediaSelectionItemManager *)self actionBuilder];
  uint64_t v4 = [v3 targetPlayState];

  if (v4 == 1)
  {
    v6 = [(HUMediaSelectionItemManager *)self actionBuilder];
    id v7 = [v6 playbackArchive];

    if (v7) {
      [(HUMediaSelectionItemManager *)self playbackStatePlayItem];
    }
    else {
      [(HUMediaSelectionItemManager *)self playbackStateResumeItem];
    }
  }
  else if (v4 == 2)
  {
    [(HUMediaSelectionItemManager *)self playbackStatePauseItem];
  }
  else
  {
    [(HUMediaSelectionItemManager *)self playbackStateAdjustVolumeOnlyItem];
  v5 = };

  return v5;
}

- (id)selectedVolumeItemBasedOnActionBuilderState
{
  v3 = [(HUMediaSelectionItemManager *)self actionBuilder];
  uint64_t v4 = [v3 targetVolume];

  if (v4) {
    [(HUMediaSelectionItemManager *)self useCustomVolumeItem];
  }
  else {
  v5 = [(HUMediaSelectionItemManager *)self useCurrentVolumeItem];
  }

  return v5;
}

- (void)setSelectedPlaybackStateItem:(id)a3
{
  v6 = (HFStaticItem *)a3;
  if (self->_selectedPlaybackStateItem != v6)
  {
    v26 = v6;
    objc_storeStrong((id *)&self->_selectedPlaybackStateItem, a3);
    id v7 = [(HFStaticItem *)v26 latestResults];

    if (v7)
    {
      v8 = [(HFStaticItem *)v26 latestResults];
      v9 = [v8 objectForKeyedSubscript:@"HOMediaSelectionPlayControlResultKey"];
      uint64_t v10 = [v9 integerValue];

      v11 = [(HUMediaSelectionItemManager *)self actionBuilder];
      [v11 setTargetPlayState:v10];
    }
    objc_super v12 = [(HUMediaSelectionItemManager *)self playbackStatePlayItem];
    if (v12 == v26)
    {
    }
    else
    {
      v13 = [(HUMediaSelectionItemManager *)self actionBuilder];
      v14 = [v13 playbackArchive];

      if (v14)
      {
        v15 = [(HUMediaSelectionItemManager *)self actionBuilder];
        v16 = [v15 playbackArchive];
        [(HUMediaSelectionItemManager *)self setLastSelectedArchive:v16];

        v17 = [(HUMediaSelectionItemManager *)self actionBuilder];
        [(HFStaticItem *)v17 setPlaybackArchive:0];
        goto LABEL_9;
      }
    }
    v17 = [(HUMediaSelectionItemManager *)self playbackStatePlayItem];
    if (v17 == v26)
    {
      v22 = [(HUMediaSelectionItemManager *)self actionBuilder];
      v23 = [v22 playbackArchive];

      if (v23) {
        goto LABEL_10;
      }
      v17 = [(HUMediaSelectionItemManager *)self lastSelectedArchive];
      v24 = v17;
      if (!v17) {
        v24 = (HFStaticItem *)[objc_alloc(MEMORY[0x1E4F693D8]) initWithMediaPlayerPlaybackArchive:0];
      }
      v25 = [(HUMediaSelectionItemManager *)self actionBuilder];
      [v25 setPlaybackArchive:v24];

      if (!v17) {
    }
      }
LABEL_9:

LABEL_10:
    v18 = [(HUMediaSelectionItemManager *)self actionSetBuilder];
    v19 = [(HUMediaSelectionItemManager *)self actionBuilder];
    [v18 updateAction:v19];

    v20 = [(HFItemManager *)self itemProviders];
    id v21 = [(HFItemManager *)self reloadAndUpdateItemsForProviders:v20 senderSelector:a2];

    v6 = v26;
  }
}

- (void)setSelectedVolumeItem:(id)a3
{
  v6 = (HFStaticItem *)a3;
  if (self->_selectedVolumeItem != v6)
  {
    v17 = v6;
    objc_storeStrong((id *)&self->_selectedVolumeItem, a3);
    id v7 = [(HUMediaSelectionItemManager *)self useCurrentVolumeItem];

    if (v7 == v17)
    {
      v11 = [(HUMediaSelectionItemManager *)self actionBuilder];
      objc_super v12 = [v11 targetVolume];
      [(HUMediaSelectionItemManager *)self setLastSelectedVolume:v12];

      v9 = [(HUMediaSelectionItemManager *)self actionBuilder];
      [v9 setTargetVolume:0];
    }
    else
    {
      v8 = [(HUMediaSelectionItemManager *)self useCustomVolumeItem];

      if (v8 != v17)
      {
LABEL_7:
        v13 = [(HUMediaSelectionItemManager *)self actionSetBuilder];
        v14 = [(HUMediaSelectionItemManager *)self actionBuilder];
        [v13 updateAction:v14];

        v15 = [(HFItemManager *)self itemProviders];
        id v16 = [(HFItemManager *)self reloadAndUpdateItemsForProviders:v15 senderSelector:a2];

        v6 = v17;
        goto LABEL_8;
      }
      v9 = [(HUMediaSelectionItemManager *)self _volumeForMediaAction];
      uint64_t v10 = [(HUMediaSelectionItemManager *)self actionBuilder];
      [v10 setTargetVolume:v9];
    }
    goto LABEL_7;
  }
LABEL_8:
}

- (HFPlaybackArchive)pickedPlaybackArchive
{
  v2 = [(HUMediaSelectionItemManager *)self actionBuilder];
  v3 = [v2 playbackArchive];

  return (HFPlaybackArchive *)v3;
}

- (void)setPickedPlaybackArchive:(id)a3
{
  id v5 = a3;
  v6 = [v5 mediaPlayerPlaybackArchive];
  id v7 = [v6 displayProperties];
  v8 = [(HUMediaSelectionItemManager *)self chosenMediaItem];
  [v8 setPlaybackArchiveDisplayProperties:v7];

  v9 = [(HUMediaSelectionItemManager *)self actionBuilder];
  [v9 setPlaybackArchive:v5];

  uint64_t v10 = [(HUMediaSelectionItemManager *)self actionSetBuilder];
  v11 = [(HUMediaSelectionItemManager *)self actionBuilder];
  [v10 updateAction:v11];

  id v13 = [(HFItemManager *)self itemProviders];
  id v12 = [(HFItemManager *)self reloadAndUpdateItemsForProviders:v13 senderSelector:a2];
}

- (void)mediaPlaybackOptionsItem:(id)a3 switchedOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  id v6 = [(HUMediaSelectionItemManager *)self shuffleItem];

  if (v6 == v12)
  {
    v8 = [(HUMediaSelectionItemManager *)self actionBuilder];
    v9 = [v8 playbackArchive];
    [v9 setShuffleEnabled:v4];
  }
  else
  {
    id v7 = [(HUMediaSelectionItemManager *)self repeatItem];

    if (v7 != v12) {
      goto LABEL_6;
    }
    v8 = [(HUMediaSelectionItemManager *)self actionBuilder];
    v9 = [v8 playbackArchive];
    [v9 setRepeatEnabled:v4];
  }

LABEL_6:
  uint64_t v10 = [(HUMediaSelectionItemManager *)self actionSetBuilder];
  v11 = [(HUMediaSelectionItemManager *)self actionBuilder];
  [v10 updateAction:v11];
}

- (void)mediaVolumeValueChanged:(double)a3
{
  BOOL v4 = [NSNumber numberWithDouble:a3];
  id v5 = [(HUMediaSelectionItemManager *)self actionBuilder];
  [v5 setTargetVolume:v4];

  id v7 = [(HUMediaSelectionItemManager *)self actionSetBuilder];
  id v6 = [(HUMediaSelectionItemManager *)self actionBuilder];
  [v7 updateAction:v6];
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v92[2] = *MEMORY[0x1E4F143B8];
  id v68 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F695C0]);
  v91[0] = *MEMORY[0x1E4F68AB8];
  uint64_t v6 = v91[0];
  id v7 = HFLocalizedString();
  v91[1] = @"HOMediaSelectionPlayControlResultKey";
  v92[0] = v7;
  v92[1] = &unk_1F19B4628;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:2];
  v9 = (void *)[v5 initWithResults:v8];
  [(HUMediaSelectionItemManager *)self setPlaybackStateAdjustVolumeOnlyItem:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F695C0]);
  v89[0] = v6;
  v11 = HFLocalizedString();
  v89[1] = @"HOMediaSelectionPlayControlResultKey";
  v90[0] = v11;
  v90[1] = &unk_1F19B4640;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:2];
  id v13 = (void *)[v10 initWithResults:v12];
  [(HUMediaSelectionItemManager *)self setPlaybackStatePauseItem:v13];

  id v14 = objc_alloc(MEMORY[0x1E4F695C0]);
  v87[0] = v6;
  v15 = HFLocalizedString();
  v87[1] = @"HOMediaSelectionPlayControlResultKey";
  v88[0] = v15;
  v88[1] = &unk_1F19B4658;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:2];
  v17 = (void *)[v14 initWithResults:v16];
  [(HUMediaSelectionItemManager *)self setPlaybackStateResumeItem:v17];

  id v18 = objc_alloc(MEMORY[0x1E4F695C0]);
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke;
  v78[3] = &unk_1E6385000;
  v78[4] = self;
  v19 = (void *)[v18 initWithResultsBlock:v78];
  [(HUMediaSelectionItemManager *)self setPlaybackStatePlayItem:v19];

  v20 = [(HUMediaSelectionItemManager *)self playbackStatePlayItem];
  v86[0] = v20;
  id v21 = [(HUMediaSelectionItemManager *)self playbackStatePauseItem];
  v86[1] = v21;
  v22 = [(HUMediaSelectionItemManager *)self playbackStateResumeItem];
  v86[2] = v22;
  v23 = [(HUMediaSelectionItemManager *)self playbackStateAdjustVolumeOnlyItem];
  v86[3] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:4];
  [(HUMediaSelectionItemManager *)self setPlaybackStateItems:v24];

  v25 = [(HUMediaSelectionItemManager *)self selectedPlaybackStateItemBasedOnActionBuilderState];
  [(HUMediaSelectionItemManager *)self setSelectedPlaybackStateItem:v25];

  objc_initWeak(&location, self);
  id v26 = objc_alloc(MEMORY[0x1E4F695C0]);
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_2;
  v76[3] = &unk_1E638B820;
  v76[4] = self;
  v76[5] = a2;
  v27 = (void *)[v26 initWithResultsBlock:v76];
  [(HUMediaSelectionItemManager *)self setMediaPickerItem:v27];

  v28 = [HUMediaItem alloc];
  v29 = [(HUMediaSelectionItemManager *)self actionBuilder];
  v30 = [v29 playbackArchive];
  v31 = [v30 mediaPlayerPlaybackArchive];
  v32 = [v31 displayProperties];
  v33 = [(HUMediaItem *)v28 initWithPlaybackArchiveDisplayProperties:v32];
  [(HUMediaSelectionItemManager *)self setChosenMediaItem:v33];

  v34 = [(HUMediaSelectionItemManager *)self chosenMediaItem];
  v85[0] = v34;
  v35 = [(HUMediaSelectionItemManager *)self mediaPickerItem];
  v85[1] = v35;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:2];
  [(HUMediaSelectionItemManager *)self setMediaPickerRowItems:v36];

  id v37 = objc_alloc(MEMORY[0x1E4F695C0]);
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_73;
  v74[3] = &unk_1E6384FD0;
  objc_copyWeak(&v75, &location);
  v38 = (void *)[v37 initWithResultsBlock:v74];
  [(HUMediaSelectionItemManager *)self setRepeatItem:v38];

  id v39 = objc_alloc(MEMORY[0x1E4F695C0]);
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_2_77;
  v72[3] = &unk_1E6384FD0;
  objc_copyWeak(&v73, &location);
  v40 = (void *)[v39 initWithResultsBlock:v72];
  [(HUMediaSelectionItemManager *)self setShuffleItem:v40];

  v41 = [(HUMediaSelectionItemManager *)self repeatItem];
  v84[0] = v41;
  v42 = [(HUMediaSelectionItemManager *)self shuffleItem];
  v84[1] = v42;
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:2];
  [(HUMediaSelectionItemManager *)self setPlaybackOptionsItems:v43];

  id v44 = objc_alloc(MEMORY[0x1E4F695C0]);
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_3_81;
  v71[3] = &unk_1E6385000;
  v71[4] = self;
  v45 = (void *)[v44 initWithResultsBlock:v71];
  [(HUMediaSelectionItemManager *)self setUseCurrentVolumeItem:v45];

  id v46 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v82 = v6;
  v47 = HFLocalizedString();
  v83 = v47;
  v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
  v49 = (void *)[v46 initWithResults:v48];
  [(HUMediaSelectionItemManager *)self setUseCustomVolumeItem:v49];

  v50 = [(HUMediaSelectionItemManager *)self selectedVolumeItemBasedOnActionBuilderState];
  [(HUMediaSelectionItemManager *)self setSelectedVolumeItem:v50];

  id v51 = objc_alloc(MEMORY[0x1E4F695C0]);
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_4_88;
  v69[3] = &unk_1E6384FD0;
  objc_copyWeak(&v70, &location);
  v52 = (void *)[v51 initWithResultsBlock:v69];
  [(HUMediaSelectionItemManager *)self setVolumeSliderItem:v52];

  v53 = [(HUMediaSelectionItemManager *)self useCurrentVolumeItem];
  v81[0] = v53;
  v54 = [(HUMediaSelectionItemManager *)self useCustomVolumeItem];
  v81[1] = v54;
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
  [(HUMediaSelectionItemManager *)self setCustomVolumeItems:v55];

  v56 = [(HUMediaSelectionItemManager *)self volumeSliderItem];
  v80 = v56;
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
  [(HUMediaSelectionItemManager *)self setVolumeSliderItems:v57];

  v58 = (void *)MEMORY[0x1E4F1CA80];
  v59 = [(HUMediaSelectionItemManager *)self playbackStateItems];
  v60 = [v58 setWithArray:v59];

  v61 = [(HUMediaSelectionItemManager *)self mediaPickerRowItems];
  [v60 addObjectsFromArray:v61];

  v62 = [(HUMediaSelectionItemManager *)self customVolumeItems];
  [v60 addObjectsFromArray:v62];

  v63 = [(HUMediaSelectionItemManager *)self volumeSliderItems];
  [v60 addObjectsFromArray:v63];

  v64 = [(HUMediaSelectionItemManager *)self playbackOptionsItems];
  [v60 addObjectsFromArray:v64];

  v65 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v60];
  v79 = v65;
  v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];

  objc_destroyWeak(&v70);
  objc_destroyWeak(&v73);
  objc_destroyWeak(&v75);
  objc_destroyWeak(&location);

  return v66;
}

id __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke(id *a1)
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F7A0D8];
  v16[0] = *MEMORY[0x1E4F68AB8];
  uint64_t v6 = HFLocalizedString();
  v17[0] = v6;
  v17[1] = &unk_1F19B4658;
  uint64_t v7 = *MEMORY[0x1E4F68A08];
  v16[1] = @"HOMediaSelectionPlayControlResultKey";
  v16[2] = v7;
  v8 = NSNumber;
  char v9 = [MEMORY[0x1E4F69758] supportsMediaPicker];
  if (v9)
  {
    int v10 = 0;
    BOOL v11 = 0;
  }
  else
  {
    v1 = [a1[4] lastSelectedArchive];
    if (v1)
    {
      int v10 = 0;
      BOOL v11 = 0;
    }
    else
    {
      a1 = [a1[4] actionBuilder];
      v2 = [a1 playbackArchive];
      v3 = [v2 mediaPlayerPlaybackArchive];
      BOOL v11 = v3 == 0;
      int v10 = 1;
    }
  }
  id v12 = [v8 numberWithInt:v11];
  v17[2] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  id v14 = [v5 futureWithResult:v13];

  if (v10)
  {
  }
  if ((v9 & 1) == 0) {

  }
  return v14;
}

id __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  v63[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = _HULocalizedStringWithDefaultValue(@"HUMediaSelectionPickerButton", @"HUMediaSelectionPickerButton", 1);
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  if (+[HUMediaAccountUtilities isMusicAppInstalled])
  {
    v41 = +[HUMediaAccountUtilities isAppleMusicSubscriptionAvailable];
    BOOL v4 = [*(id *)(a1 + 32) actionSetBuilder];
    id v5 = [v4 mediaAction];
    uint64_t v6 = [v5 mediaProfiles];

    uint64_t v7 = objc_msgSend(v6, "hf_appleTVMediaProfiles");
    v40 = v6;
    v8 = objc_msgSend(v6, "hf_homePodMediaProfiles");
    char v9 = [v7 setByAddingObjectsFromSet:v8];
    int v10 = (void *)MEMORY[0x1E4F7A0D8];
    v62 = @"HOMediaSelectionPickingForExternalPlayerKey";
    BOOL v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    v63[0] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:&v62 count:1];
    id v39 = [v10 futureWithResult:v12];

    if (![v9 count])
    {
      id v13 = (void *)MEMORY[0x1E4F1CAD0];
      v38 = [*(id *)(a1 + 32) actionSetBuilder];
      id v14 = [v38 home];
      v15 = objc_msgSend(v14, "hf_primaryResidentDevice");
      id v16 = objc_msgSend(v15, "hf_linkedAccessory");
      v17 = [v16 mediaProfile];
      id v18 = objc_msgSend(v13, "na_setWithSafeObject:", v17);

      uint64_t v19 = objc_msgSend(v18, "hf_appleTVMediaProfiles");

      uint64_t v20 = objc_msgSend(v18, "hf_homePodMediaProfiles");

      char v9 = v18;
      v8 = (void *)v20;
      uint64_t v7 = (void *)v19;
    }
    id v21 = HFLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      v23 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138413314;
      uint64_t v53 = v22;
      __int16 v54 = 2112;
      v55 = v23;
      __int16 v56 = 2112;
      v57 = v9;
      __int16 v58 = 2112;
      v59 = v7;
      __int16 v60 = 2112;
      v61 = v8;
      _os_log_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@ appleMediaProfiles [%@] appleTVMediaProfiles [%@] homePodMediaProfiles [%@]", buf, 0x34u);
    }
    v24 = (void *)MEMORY[0x1E4F7A0D8];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_59;
    v45[3] = &unk_1E638B7F8;
    uint64_t v25 = *(void *)(a1 + 32);
    uint64_t v26 = *(void *)(a1 + 40);
    id v46 = v9;
    uint64_t v47 = v25;
    id v49 = v8;
    uint64_t v50 = v26;
    id v48 = v7;
    id v27 = v8;
    id v28 = v7;
    id v29 = v9;
    v30 = [v24 futureWithBlock:v45];
    v31 = (void *)MEMORY[0x1E4F7A0D8];
    v51[0] = v41;
    v51[1] = v39;
    v51[2] = v30;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:3];
    v33 = [v31 combineAllFutures:v32];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_7;
    v42[3] = &unk_1E63858A0;
    id v34 = v2;
    uint64_t v35 = *(void *)(a1 + 40);
    id v43 = v34;
    uint64_t v44 = v35;
    v36 = [v33 flatMap:v42];
  }
  else
  {
    [v2 setObject:&unk_1F19B4628 forKeyedSubscript:@"HOMediaPickerUnavailableReasonKey"];
    v36 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];
  }

  return v36;
}

void __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_59(uint64_t a1, void *a2)
{
  v78[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  uint64_t v5 = objc_msgSend(v4, "ams_activeiTunesAccount");

  id v48 = (void *)v5;
  if (v5 && [*(id *)(a1 + 32) count])
  {
    id v43 = v3;
    uint64_t v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      v8 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412802;
      uint64_t v66 = v7;
      __int16 v67 = 2112;
      id v68 = v8;
      __int16 v69 = 2112;
      id v70 = v48;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ iTunes Account [%@]", buf, 0x20u);
    }
    char v9 = [*(id *)(a1 + 40) home];
    int v10 = [v9 isMultiUserEnabled];

    BOOL v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      id v13 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412802;
      uint64_t v66 = v12;
      __int16 v67 = 2112;
      id v68 = v13;
      __int16 v69 = 1024;
      LODWORD(v70) = v10;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ isMultiUserEnabled [%d]", buf, 0x1Cu);
    }
    char v46 = v10;
    if (v10)
    {
      id v14 = [*(id *)(a1 + 40) home];
      v15 = [v14 currentUser];
      id v16 = [*(id *)(a1 + 40) home];
      v17 = [v15 mediaContentProfileAccessControlForHome:v16];
      id v18 = [v17 accessories];

      id v19 = objc_alloc(MEMORY[0x1E4F69710]);
      uint64_t v20 = [*(id *)(a1 + 40) home];
      id v21 = [*(id *)(a1 + 40) home];
      uint64_t v22 = [v21 currentUser];
      v23 = (void *)[v19 initWithHome:v20 user:v22 nameStyle:0];
      int v47 = [v23 isIdentifyVoiceEnabled];
    }
    else
    {
      int v47 = 0;
      id v18 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v24 = HFLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void *)(a1 + 40);
      uint64_t v26 = NSStringFromSelector(*(SEL *)(a1 + 64));
      id obja = [*(id *)(a1 + 40) home];
      id v27 = objc_msgSend(obja, "hf_displayName");
      id v28 = [*(id *)(a1 + 40) home];
      id v29 = [v28 currentUser];
      v30 = [v29 name];
      *(_DWORD *)buf = 138413570;
      uint64_t v66 = v25;
      __int16 v67 = 2112;
      id v68 = v26;
      __int16 v69 = 2112;
      id v70 = v27;
      __int16 v71 = 2112;
      v72 = v30;
      __int16 v73 = 2112;
      v74 = v18;
      __int16 v75 = 1024;
      int v76 = v47;
      _os_log_impl(&dword_1BE345000, v24, OS_LOG_TYPE_DEFAULT, "%@:%@ home [%@] currentUser [%@] appleTVsWithTVProfiles [%@] vrEnabled [%d]", buf, 0x3Au);
    }
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v32 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v61 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v36 = *(void *)(*((void *)&v60 + 1) + 8 * i);
          id v37 = (void *)MEMORY[0x1E4F7A0D8];
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_63;
          void v51[3] = &unk_1E638B7D0;
          id v52 = *(id *)(a1 + 48);
          uint64_t v53 = v36;
          id v54 = *(id *)(a1 + 56);
          char v58 = v46;
          id v38 = v18;
          char v59 = v47;
          uint64_t v39 = *(void *)(a1 + 40);
          id v55 = v38;
          uint64_t v56 = v39;
          id v57 = v48;
          v40 = [v37 futureWithBlock:v51];
          [v31 addObject:v40];
        }
        uint64_t v33 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
      }
      while (v33);
    }

    v41 = [MEMORY[0x1E4F7A0D8] combineAllFutures:v31];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_5;
    v49[3] = &unk_1E63851B0;
    id v3 = v43;
    id v50 = v43;
    id v42 = (id)[v41 addCompletionBlock:v49];
  }
  else
  {
    v77 = @"HOMediaSelectionShowLibraryContentKey";
    v78[0] = MEMORY[0x1E4F1CC28];
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:&v77 count:1];
    [v3 finishWithResult:v18];
  }
}

void __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_63(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) containsObject:*(void *)(a1 + 40)];
  int v5 = [*(id *)(a1 + 48) containsObject:*(void *)(a1 + 40)];
  int v6 = v5;
  if ((v4 & 1) == 0 && (v5 & 1) == 0) {
    [v3 finishWithResult:MEMORY[0x1E4F1CC28]];
  }
  if (!*(unsigned char *)(a1 + 80)) {
    goto LABEL_11;
  }
  if (v4)
  {
    uint64_t v7 = [*(id *)(a1 + 40) accessories];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_2_64;
    v18[3] = &unk_1E63869C8;
    id v19 = *(id *)(a1 + 56);
    char v8 = objc_msgSend(v7, "na_any:", v18);

    if ((v8 & 1) == 0)
    {
LABEL_11:
      uint64_t v12 = NSNumber;
      id v13 = *(void **)(a1 + 72);
      BOOL v11 = objc_msgSend(*(id *)(a1 + 40), "hf_appleMusicCurrentLoggedInAccount");
      id v14 = objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "hasSameAppleMusicServiceAltDSID:", v11));
      [v3 finishWithResult:v14];

      goto LABEL_12;
    }
  }
  else if (!v6 || !*(unsigned char *)(a1 + 81))
  {
    goto LABEL_11;
  }
  char v9 = [MEMORY[0x1E4F68F00] sharedInstance];
  int v10 = [*(id *)(a1 + 64) home];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_4;
  v15[3] = &unk_1E6385808;
  id v16 = v3;
  id v17 = *(id *)(a1 + 72);
  [v9 getHomeMediaAccountForHome:v10 withCompletion:v15];

  BOOL v11 = v16;
LABEL_12:
}

uint64_t __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_2_64(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_3;
  v8[3] = &unk_1E63869C8;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  int v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

void __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "hasSameAppleMusicServiceAltDSID:", a2));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 finishWithResult:v3];
}

void __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_5(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a2, "na_all:", &__block_literal_global_124);
  int v4 = *(void **)(a1 + 32);
  uint64_t v7 = @"HOMediaSelectionShowLibraryContentKey";
  uint64_t v5 = [NSNumber numberWithBool:v3];
  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 finishWithResult:v6];
}

uint64_t __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 BOOLValue];
  return v6;
}

id __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        id v9 = v8;
        if (objc_opt_isKindOfClass()) {
          int v10 = v9;
        }
        else {
          int v10 = 0;
        }
        id v11 = v10;

        if (v11) {
          [*(id *)(a1 + 32) addEntriesFromDictionary:v11];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v5);
  }
  uint64_t v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v22 = v13;
    __int16 v23 = 2112;
    uint64_t v24 = v14;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@ mediaPicker result [%@]", buf, 0x16u);
  }
  v15 = [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];

  return v15;
}

id __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_73(uint64_t a1)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained actionBuilder];
  id v3 = [v2 playbackArchive];
  [v3 isRepeatEnabled];

  uint64_t v4 = (void *)MEMORY[0x1E4F7A0D8];
  v10[0] = *MEMORY[0x1E4F68AB8];
  uint64_t v5 = _HULocalizedStringWithDefaultValue(@"HUMediaSelectionQueueModifierRepeat", @"HUMediaSelectionQueueModifierRepeat", 1);
  v11[0] = v5;
  v10[1] = *MEMORY[0x1E4F68BC0];
  uint64_t v6 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
  v11[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  char v8 = [v4 futureWithResult:v7];

  return v8;
}

id __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_2_77(uint64_t a1)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained actionBuilder];
  id v3 = [v2 playbackArchive];
  [v3 isShuffleEnabled];

  uint64_t v4 = (void *)MEMORY[0x1E4F7A0D8];
  v10[0] = *MEMORY[0x1E4F68AB8];
  uint64_t v5 = _HULocalizedStringWithDefaultValue(@"HUMediaSelectionQueueModifierShuffle", @"HUMediaSelectionQueueModifierShuffle", 1);
  v11[0] = v5;
  v10[1] = *MEMORY[0x1E4F68BC0];
  uint64_t v6 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
  v11[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  char v8 = [v4 futureWithResult:v7];

  return v8;
}

id __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_3_81(uint64_t a1)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  v11[0] = *MEMORY[0x1E4F68AB8];
  id v3 = HFLocalizedString();
  v11[1] = *MEMORY[0x1E4F68A08];
  v12[0] = v3;
  uint64_t v4 = NSNumber;
  uint64_t v5 = [*(id *)(a1 + 32) selectedPlaybackStateItem];
  uint64_t v6 = [*(id *)(a1 + 32) playbackStateAdjustVolumeOnlyItem];
  uint64_t v7 = [v4 numberWithInt:v5 == v6];
  v12[1] = v7;
  char v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v9 = [v2 futureWithResult:v8];

  return v9;
}

id __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_4_88(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained actionBuilder];
  uint64_t v5 = [v4 targetVolume];

  [v2 setObject:v5 forKeyedSubscript:@"HOMediaVolumeResultKey"];
  uint64_t v6 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = [(HUMediaSelectionItemManager *)self playbackStateItems];
  char v8 = [v6 setWithArray:v7];
  int v9 = [v4 intersectsSet:v8];

  if (v9)
  {
    int v10 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HOMediaSelectionActionSectionIdentifier"];
    id v11 = [(HUMediaSelectionItemManager *)self playbackStateItems];
    [v10 setItems:v11];

    [v5 addObject:v10];
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
  id v13 = [(HUMediaSelectionItemManager *)self mediaPickerRowItems];
  uint64_t v14 = [v12 setWithArray:v13];
  int v15 = [v4 intersectsSet:v14];

  if (v15)
  {
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HOMediaSelectionPickerSectionIdentifier"];
    long long v17 = [(HUMediaSelectionItemManager *)self mediaPickerRowItems];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __64__HUMediaSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke;
    v45[3] = &unk_1E638B848;
    id v46 = v4;
    long long v18 = objc_msgSend(v17, "na_filter:", v45);
    [v16 setItems:v18];

    [v5 addObject:v16];
  }
  long long v19 = (void *)MEMORY[0x1E4F1CAD0];
  long long v20 = [(HUMediaSelectionItemManager *)self playbackOptionsItems];
  id v21 = [v19 setWithArray:v20];
  int v22 = [v4 intersectsSet:v21];

  if (v22)
  {
    __int16 v23 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HOMediaSelectionOptionsSectionIdentifier"];
    uint64_t v24 = [(HUMediaSelectionItemManager *)self playbackOptionsItems];
    [v23 setItems:v24];

    [v5 addObject:v23];
  }
  uint64_t v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v26 = [(HUMediaSelectionItemManager *)self customVolumeItems];
  id v27 = [v25 setWithArray:v26];
  int v28 = [v4 intersectsSet:v27];

  if (v28)
  {
    id v29 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HOMediaSelectionVolumeSelectionSectionIdentifier"];
    v30 = [(HUMediaSelectionItemManager *)self customVolumeItems];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __64__HUMediaSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke_2;
    v43[3] = &unk_1E638B848;
    id v44 = v4;
    v31 = objc_msgSend(v30, "na_filter:", v43);
    [v29 setItems:v31];

    uint64_t v32 = _HULocalizedStringWithDefaultValue(@"HUMediaSelectionVolumeSectionTitle", @"HUMediaSelectionVolumeSectionTitle", 1);
    [v29 setHeaderTitle:v32];

    [v5 addObject:v29];
  }
  uint64_t v33 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v34 = [(HUMediaSelectionItemManager *)self volumeSliderItems];
  uint64_t v35 = [v33 setWithArray:v34];
  int v36 = [v4 intersectsSet:v35];

  if (v36)
  {
    id v37 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HOMediaSelectionVolumeSliderSectionIdentifier"];
    id v38 = [(HUMediaSelectionItemManager *)self volumeSliderItems];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __64__HUMediaSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke_3;
    v41[3] = &unk_1E638B848;
    id v42 = v4;
    uint64_t v39 = objc_msgSend(v38, "na_filter:", v41);
    [v37 setItems:v39];

    [v5 addObject:v37];
  }

  return v5;
}

uint64_t __64__HUMediaSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __64__HUMediaSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __64__HUMediaSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (id)_itemsToHideInSet:(id)a3
{
  v27.receiver = self;
  v27.super_class = (Class)HUMediaSelectionItemManager;
  id v4 = [(HFItemManager *)&v27 _itemsToHideInSet:a3];
  uint64_t v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [(HUMediaSelectionItemManager *)self selectedPlaybackStateItem];
  uint64_t v7 = [(HUMediaSelectionItemManager *)self playbackStatePlayItem];

  if (v6 != v7)
  {
    char v8 = [(HUMediaSelectionItemManager *)self mediaPickerRowItems];
    [v5 addObjectsFromArray:v8];

    int v9 = [(HUMediaSelectionItemManager *)self playbackOptionsItems];
    [v5 addObjectsFromArray:v9];
LABEL_9:

    goto LABEL_10;
  }
  int v10 = [(HUMediaSelectionItemManager *)self pickedPlaybackArchive];
  id v11 = [v10 mediaPlayerPlaybackArchive];

  if (!v11)
  {
    uint64_t v12 = [(HUMediaSelectionItemManager *)self chosenMediaItem];
    [v5 addObject:v12];

    id v13 = [(HUMediaSelectionItemManager *)self playbackOptionsItems];
    [v5 addObjectsFromArray:v13];
  }
  uint64_t v14 = [(HUMediaSelectionItemManager *)self pickedPlaybackArchive];
  char v15 = [v14 isRepeatSupported];

  if ((v15 & 1) == 0)
  {
    id v16 = [(HUMediaSelectionItemManager *)self repeatItem];
    [v5 addObject:v16];
  }
  long long v17 = [(HUMediaSelectionItemManager *)self pickedPlaybackArchive];
  char v18 = [v17 isShuffleSupported];

  if ((v18 & 1) == 0)
  {
    int v9 = [(HUMediaSelectionItemManager *)self shuffleItem];
    [v5 addObject:v9];
    goto LABEL_9;
  }
LABEL_10:
  long long v19 = [(HUMediaSelectionItemManager *)self selectedPlaybackStateItem];
  long long v20 = [(HUMediaSelectionItemManager *)self playbackStatePauseItem];

  if (v19 == v20)
  {
    id v21 = [(HUMediaSelectionItemManager *)self customVolumeItems];
    [v5 addObjectsFromArray:v21];

    int v22 = [(HUMediaSelectionItemManager *)self volumeSliderItems];
    [v5 addObjectsFromArray:v22];
  }
  __int16 v23 = [(HUMediaSelectionItemManager *)self selectedVolumeItem];
  uint64_t v24 = [(HUMediaSelectionItemManager *)self useCurrentVolumeItem];

  if (v23 == v24)
  {
    uint64_t v25 = [(HUMediaSelectionItemManager *)self volumeSliderItems];
    [v5 addObjectsFromArray:v25];
  }

  return v5;
}

- (id)_volumeForMediaAction
{
  id v3 = [(HUMediaSelectionItemManager *)self actionBuilder];
  id v4 = [v3 targetVolume];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(HUMediaSelectionItemManager *)self lastSelectedVolume];
    char v8 = v7;
    if (v7)
    {
      id v6 = v7;
    }
    else
    {
      int v9 = [(HUMediaSelectionItemManager *)self actionBuilder];
      int v10 = [v9 mediaProfiles];
      id v6 = +[HUMediaAccountUtilities defaultCurrentVolumeForMediaProfiles:v10];
    }
  }

  return v6;
}

- (HFStaticItem)selectedPlaybackStateItem
{
  return self->_selectedPlaybackStateItem;
}

- (HFActionSetBuilder)actionSetBuilder
{
  return self->_actionSetBuilder;
}

- (HFStaticItem)playbackStateAdjustVolumeOnlyItem
{
  return self->_playbackStateAdjustVolumeOnlyItem;
}

- (void)setPlaybackStateAdjustVolumeOnlyItem:(id)a3
{
}

- (HFStaticItem)playbackStatePauseItem
{
  return self->_playbackStatePauseItem;
}

- (void)setPlaybackStatePauseItem:(id)a3
{
}

- (HFStaticItem)playbackStateResumeItem
{
  return self->_playbackStateResumeItem;
}

- (void)setPlaybackStateResumeItem:(id)a3
{
}

- (HFStaticItem)playbackStatePlayItem
{
  return self->_playbackStatePlayItem;
}

- (void)setPlaybackStatePlayItem:(id)a3
{
}

- (NSArray)playbackStateItems
{
  return self->_playbackStateItems;
}

- (void)setPlaybackStateItems:(id)a3
{
}

- (HFStaticItem)mediaPickerItem
{
  return self->_mediaPickerItem;
}

- (void)setMediaPickerItem:(id)a3
{
}

- (HUMediaItem)chosenMediaItem
{
  return self->_chosenMediaItem;
}

- (void)setChosenMediaItem:(id)a3
{
}

- (NSArray)playbackOptionsItems
{
  return self->_playbackOptionsItems;
}

- (void)setPlaybackOptionsItems:(id)a3
{
}

- (HFStaticItem)useCurrentVolumeItem
{
  return self->_useCurrentVolumeItem;
}

- (void)setUseCurrentVolumeItem:(id)a3
{
}

- (HFStaticItem)useCustomVolumeItem
{
  return self->_useCustomVolumeItem;
}

- (void)setUseCustomVolumeItem:(id)a3
{
}

- (HFStaticItem)selectedVolumeItem
{
  return self->_selectedVolumeItem;
}

- (HFStaticItem)volumeSliderItem
{
  return self->_volumeSliderItem;
}

- (void)setVolumeSliderItem:(id)a3
{
}

- (void)setActionBuilder:(id)a3
{
}

- (NSArray)mediaPickerRowItems
{
  return self->_mediaPickerRowItems;
}

- (void)setMediaPickerRowItems:(id)a3
{
}

- (HFStaticItem)repeatItem
{
  return self->_repeatItem;
}

- (void)setRepeatItem:(id)a3
{
}

- (HFStaticItem)shuffleItem
{
  return self->_shuffleItem;
}

- (void)setShuffleItem:(id)a3
{
}

- (NSArray)customVolumeItems
{
  return self->_customVolumeItems;
}

- (void)setCustomVolumeItems:(id)a3
{
}

- (NSArray)volumeSliderItems
{
  return self->_volumeSliderItems;
}

- (void)setVolumeSliderItems:(id)a3
{
}

- (SKCloudServiceController)cloudServiceController
{
  return self->_cloudServiceController;
}

- (void)setCloudServiceController:(id)a3
{
}

- (HFPlaybackArchive)lastSelectedArchive
{
  return self->_lastSelectedArchive;
}

- (void)setLastSelectedArchive:(id)a3
{
}

- (NSNumber)lastSelectedVolume
{
  return self->_lastSelectedVolume;
}

- (void)setLastSelectedVolume:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSelectedVolume, 0);
  objc_storeStrong((id *)&self->_lastSelectedArchive, 0);
  objc_storeStrong((id *)&self->_cloudServiceController, 0);
  objc_storeStrong((id *)&self->_volumeSliderItems, 0);
  objc_storeStrong((id *)&self->_customVolumeItems, 0);
  objc_storeStrong((id *)&self->_shuffleItem, 0);
  objc_storeStrong((id *)&self->_repeatItem, 0);
  objc_storeStrong((id *)&self->_mediaPickerRowItems, 0);
  objc_storeStrong((id *)&self->_actionBuilder, 0);
  objc_storeStrong((id *)&self->_volumeSliderItem, 0);
  objc_storeStrong((id *)&self->_selectedVolumeItem, 0);
  objc_storeStrong((id *)&self->_useCustomVolumeItem, 0);
  objc_storeStrong((id *)&self->_useCurrentVolumeItem, 0);
  objc_storeStrong((id *)&self->_playbackOptionsItems, 0);
  objc_storeStrong((id *)&self->_chosenMediaItem, 0);
  objc_storeStrong((id *)&self->_mediaPickerItem, 0);
  objc_storeStrong((id *)&self->_playbackStateItems, 0);
  objc_storeStrong((id *)&self->_playbackStatePlayItem, 0);
  objc_storeStrong((id *)&self->_playbackStateResumeItem, 0);
  objc_storeStrong((id *)&self->_playbackStatePauseItem, 0);
  objc_storeStrong((id *)&self->_playbackStateAdjustVolumeOnlyItem, 0);
  objc_storeStrong((id *)&self->_actionSetBuilder, 0);

  objc_storeStrong((id *)&self->_selectedPlaybackStateItem, 0);
}

@end
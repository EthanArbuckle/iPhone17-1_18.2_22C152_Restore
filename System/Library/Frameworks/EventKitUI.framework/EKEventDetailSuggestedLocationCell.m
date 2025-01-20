@interface EKEventDetailSuggestedLocationCell
- (BOOL)inlineStyle;
- (CGRect)bannerPopoverSourceRect;
- (EKEventDetailSuggestedLocationCell)initWithFrame:(CGRect)a3;
- (EKEventDetailSuggestedLocationCell)initWithInlineStyle:(BOOL)a3;
- (EKEventDetailSuggestedLocationCellDelegate)delegate;
- (SGBannerProtocol)banner;
- (void)_disambiguateIfNeeded;
- (void)_setIcon;
- (void)commonInit;
- (void)dismissAction;
- (void)setBanner:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEvent:(id)a3;
- (void)setInlineStyle:(BOOL)a3;
@end

@implementation EKEventDetailSuggestedLocationCell

- (EKEventDetailSuggestedLocationCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKEventDetailSuggestedLocationCell;
  v3 = -[EKEventDetailSuggestedLocationCell initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v4 = v3;
  if (v3) {
    [(EKEventDetailSuggestedLocationCell *)v3 commonInit];
  }
  return v4;
}

- (EKEventDetailSuggestedLocationCell)initWithInlineStyle:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)EKEventDetailSuggestedLocationCell;
  v4 = -[EKEventDetailSuggestedLocationCell initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_inlineStyle = a3;
    [(EKEventDetailSuggestedLocationCell *)v4 commonInit];
  }
  return v5;
}

- (void)commonInit
{
  EKWeakLinkClass();
  v3 = (objc_class *)EKWeakLinkClass();
  v4 = (void *)EKWeakLinkClass();
  v5 = objc_opt_new();
  objc_super v6 = EventKitUIBundle();
  objc_super v7 = [v6 localizedStringForKey:@"Suggested Location" value:&stru_1F0CC2140 table:0];
  [v5 setTitle:v7];

  [v5 setAccessoryType:1];
  [v5 setActionButtonType:0];
  v8 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  if (self->_inlineStyle)
  {
    uint64_t v9 = EKHalfSystemGroupedBackgroundColor();

    uint64_t v10 = 0;
    v8 = (void *)v9;
  }
  else
  {
    uint64_t v10 = 3;
  }
  +[EKUIClearButton trailingOffsetToMarginForTextFieldClearButtonAlignment];
  if (self->_inlineStyle) {
    objc_msgSend(v5, "setCloseButtonXAnchorOffset:");
  }
  [v5 setBackgroundColor:v8];
  id v11 = [v3 alloc];
  v12 = [MEMORY[0x1E4FB1618] separatorColor];
  v13 = (void *)[v11 initWithPosition:v10 color:v12];
  [v5 setBannerDivider:v13];

  v14 = EventKitUIBundle();
  v15 = [v14 localizedStringForKey:@"Title for suggested location banner primary action button" value:@"Add" table:0];

  [v5 setActionTitle:v15];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __48__EKEventDetailSuggestedLocationCell_commonInit__block_invoke;
  v27[3] = &unk_1E6088240;
  v27[4] = self;
  v16 = [v4 actionWithTitle:v15 handler:v27];
  [v5 setPrimaryAction:v16];
  v17 = EventKitUIBundle();
  v18 = [v17 localizedStringForKey:@"Dismiss" value:&stru_1F0CC2140 table:0];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __48__EKEventDetailSuggestedLocationCell_commonInit__block_invoke_2;
  v26[3] = &unk_1E6088240;
  v26[4] = self;
  v19 = [v4 actionWithTitle:v18 handler:v26];
  [v5 setDismissAction:v19];
  [(EKEventDetailSuggestedLocationCell *)self setBanner:v5];
  v20 = [(EKEventDetailSuggestedLocationCell *)self contentView];
  [v20 addSubview:v5];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = _NSDictionaryOfVariableBindings(&cfstr_Bannerview.isa, v5, 0);
  v22 = (void *)MEMORY[0x1E4F28DC8];
  v23 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[bannerView]|" options:0 metrics:0 views:v21];
  [v22 activateConstraints:v23];

  v24 = (void *)MEMORY[0x1E4F28DC8];
  v25 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[bannerView]|" options:0 metrics:0 views:v21];
  [v24 activateConstraints:v25];

  [v5 reload];
}

uint64_t __48__EKEventDetailSuggestedLocationCell_commonInit__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addAction];
}

uint64_t __48__EKEventDetailSuggestedLocationCell_commonInit__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissAction];
}

- (CGRect)bannerPopoverSourceRect
{
  v2 = [(EKEventDetailSuggestedLocationCell *)self banner];
  [v2 popoverSourceRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
  id v5 = a3;
  double v6 = [v5 preferredLocation];
  location = self->_location;
  self->_location = v6;

  [(EKEventDetailSuggestedLocationCell *)self _setIcon];
  id v10 = [MEMORY[0x1E4F57BA0] locationStringForEvent:v5 options:25];

  double v8 = [v10 string];
  double v9 = [(EKEventDetailSuggestedLocationCell *)self banner];
  [v9 setSubtitle:v8];
}

- (void)_setIcon
{
  v10[1] = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"mappin.and.ellipse"];
  double v4 = [v3 imageWithRenderingMode:2];

  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", 0.0, 0.0, 28.0, 28.0);
  [v5 setImage:v4];
  [v5 setContentMode:1];
  double v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v5 setTintColor:v6];

  v10[0] = v5;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  double v8 = [(EKEventDetailSuggestedLocationCell *)self banner];
  [v8 setImageSGViews:v7];

  double v9 = [(EKEventDetailSuggestedLocationCell *)self banner];
  [v9 reload];
}

- (void)_disambiguateIfNeeded
{
  v71[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(EKEventDetailSuggestedLocationCell *)self window];
  double v4 = [v3 rootViewController];

  id v5 = [v4 presentedViewController];

  if (v5)
  {
    do
    {
      double v6 = [v4 presentedViewController];

      double v7 = [v6 presentedViewController];

      double v4 = v6;
    }
    while (v7);
  }
  else
  {
    double v6 = v4;
  }
  double v8 = [(EKStructuredLocation *)self->_location geoLocation];
  [v8 coordinate];
  double v10 = v9;
  double v12 = v11;

  [(EKStructuredLocation *)self->_location radius];
  double v14 = v13;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x2020000000;
  char v70 = 0;
  v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  v16 = objc_opt_new();
  uint64_t v17 = EKWeakLinkClass();
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64A60]), "initWithCoordinate:radius:categories:", 0, v10, v12, fmax(v14 * 1.5, 25.0));
  v19 = [MEMORY[0x1E4F64710] sharedService];
  v71[0] = v18;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
  v21 = [v19 ticketForSpatialLookupParameters:v20 traits:0];

  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke;
  v62[3] = &unk_1E60882E0;
  v67 = v69;
  v22 = v15;
  v63 = v22;
  id v64 = v21;
  id v38 = v18;
  id v65 = v38;
  uint64_t v68 = v17;
  id v23 = v16;
  id v66 = v23;
  id v39 = v64;
  [v64 submitWithHandler:v62 networkActivity:0];
  dispatch_group_enter(v22);
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = __Block_byref_object_copy__1;
  v60[4] = __Block_byref_object_dispose__1;
  id v61 = 0;
  v24 = (void *)MEMORY[0x1E4F57740];
  v25 = [(EKStructuredLocation *)self->_location title];
  v26 = [(EKStructuredLocation *)self->_location address];
  v27 = [v24 fullDisplayStringWithTitle:v25 address:v26];

  v28 = (void *)MEMORY[0x1E4F57718];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_67;
  v54[3] = &unk_1E6088330;
  dispatch_group_t group = v22;
  dispatch_group_t v55 = group;
  v58 = v69;
  id v29 = v27;
  id v56 = v29;
  v59 = v60;
  id v30 = v23;
  id v57 = v30;
  [v28 geocodeLocationString:v29 withCompletionBlock:v54];
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  char v53 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_70;
  aBlock[3] = &unk_1E6087548;
  aBlock[4] = self;
  id v50 = v30;
  id v51 = v6;
  id v37 = v6;
  id v36 = v30;
  v31 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_4;
  block[3] = &unk_1E60883A8;
  v47 = v69;
  v48 = v52;
  id v32 = v31;
  id v46 = v32;
  v33 = MEMORY[0x1E4F14428];
  dispatch_group_notify(group, MEMORY[0x1E4F14428], block);
  dispatch_time_t v34 = dispatch_time(0, 1000000000);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_5;
  v41[3] = &unk_1E60883A8;
  v43 = v52;
  v44 = v69;
  id v42 = v32;
  id v35 = v32;
  dispatch_after(v34, v33, v41);

  _Block_object_dispose(v52, 8);
  _Block_object_dispose(v60, 8);

  _Block_object_dispose(v69, 8);
}

void __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_2;
  block[3] = &unk_1E60882B8;
  uint64_t v13 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  id v10 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 72);
  id v11 = v4;
  uint64_t v14 = v5;
  id v12 = *(id *)(a1 + 56);
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    v2 = *(NSObject **)(a1 + 32);
    dispatch_group_leave(v2);
  }
  else if (*(void *)(a1 + 40))
  {
    id v3 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      id v4 = *(void **)(a1 + 40);
      uint64_t v5 = v3;
      id v6 = [v4 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v32 = v6;
      _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_ERROR, "Failed to run spacial lookup for suggested location disambiguation: %@", buf, 0xCu);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    double v7 = [*(id *)(a1 + 48) mapItemsForParameters:*(void *)(a1 + 56)];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      id v9 = objc_opt_new();
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v10 = [*(id *)(a1 + 48) mapItemsForParameters:*(void *)(a1 + 56)];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v27 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = [*(id *)(*((void *)&v26 + 1) + 8 * i) _identifier];
            [v9 addObject:v15];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v12);
      }

      v16 = [MEMORY[0x1E4F64710] sharedService];
      uint64_t v17 = [v16 ticketForIdentifiers:v9 traits:0];

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_56;
      v22[3] = &unk_1E6088290;
      id v18 = *(id *)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 80);
      id v23 = v18;
      uint64_t v25 = v19;
      long long v21 = *(_OWORD *)(a1 + 64);
      id v20 = (id)v21;
      long long v24 = v21;
      [v17 submitWithHandler:v22 networkActivity:0];
    }
  }
}

void __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_2_57;
  block[3] = &unk_1E6088268;
  id v13 = *(id *)(a1 + 32);
  id v14 = v6;
  uint64_t v7 = *(void *)(a1 + 56);
  id v15 = v5;
  uint64_t v17 = v7;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v16 = v11;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_2_57(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (*(void *)(a1 + 40))
    {
      v2 = (void *)kEKUILogHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR)) {
        return;
      }
      id v3 = *(void **)(a1 + 40);
      id v4 = v2;
      id v5 = [v3 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v20 = v5;
      _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_ERROR, "Failed to run place lookup for suggested location disambiguation: %@", buf, 0xCu);
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v4 = *(id *)(a1 + 48);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v15;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v4);
            }
            uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
            id v11 = objc_alloc(*(Class *)(a1 + 72));
            uint64_t v12 = objc_msgSend(v11, "initWithGeoMapItem:isPlaceHolderPlace:", v10, 0, (void)v14);
            id v13 = [MEMORY[0x1E4F25630] locationWithMapItem:v12];
            [*(id *)(a1 + 56) addObject:v13];

            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v7);
      }
    }
  }
}

void __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_2_68;
  block[3] = &unk_1E6088308;
  id v7 = *(id *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 56);
  id v11 = v7;
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v14 = v5;
  uint64_t v17 = *(void *)(a1 + 64);
  id v15 = *(id *)(a1 + 48);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_2_68(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    if (*(void *)(a1 + 40))
    {
      v2 = (void *)kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        id v3 = *(void **)(a1 + 40);
        uint64_t v4 = *(void *)(a1 + 48);
        id v5 = v2;
        id v6 = [v3 localizedDescription];
        int v10 = 138412546;
        uint64_t v11 = v4;
        __int16 v12 = 2112;
        id v13 = v6;
        _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_ERROR, "Error geocoding %@: %@", (uint8_t *)&v10, 0x16u);
      }
    }
    if (*(void *)(a1 + 56))
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F25630], "locationWithMapItem:");
      uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      [*(id *)(a1 + 64) addObject:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
    }
  }
}

void __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_70(uint64_t a1)
{
  v2 = [EKEventDetailLocationDisambiguationViewController alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 1024);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  int v10 = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_2_72;
  uint64_t v11 = &unk_1E6088380;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v6;
  uint64_t v7 = [(EKEventDetailLocationDisambiguationViewController *)v2 initWithLocation:v4 pois:v3 completionBlock:&v8];
  objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v7, 1, 0, v8, v9, v10, v11);
}

void __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_2_72(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_3;
  v8[3] = &unk_1E6088358;
  char v10 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  v8[4] = *(void *)(a1 + 40);
  id v9 = v5;
  id v7 = v5;
  [v6 dismissViewControllerAnimated:1 completion:v8];
}

void __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) delegate];
    [v2 didTapAddSuggestedLocationCell:*(void *)(a1 + 32) disambiguatedLocation:*(void *)(a1 + 40)];
  }
}

void *__59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_4(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[5] + 8) + 24))
  {
    *(unsigned char *)(*(void *)(result[6] + 8) + 24) = 1;
    return (void *)(*(uint64_t (**)(void))(result[4] + 16))();
  }
  return result;
}

uint64_t __59__EKEventDetailSuggestedLocationCell__disambiguateIfNeeded__block_invoke_5(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24) = 1;
    id v2 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1B3F4C000, v2, OS_LOG_TYPE_ERROR, "Timed out fetching POIs for location disambiguation", v3, 2u);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

- (void)dismissAction
{
  id v3 = [(EKEventDetailSuggestedLocationCell *)self delegate];
  [v3 didTapDismissSuggestedLocationCell:self];
}

- (EKEventDetailSuggestedLocationCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKEventDetailSuggestedLocationCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SGBannerProtocol)banner
{
  return self->_banner;
}

- (void)setBanner:(id)a3
{
}

- (BOOL)inlineStyle
{
  return self->_inlineStyle;
}

- (void)setInlineStyle:(BOOL)a3
{
  self->_inlineStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_banner, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

@end
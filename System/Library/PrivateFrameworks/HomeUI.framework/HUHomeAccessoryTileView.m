@interface HUHomeAccessoryTileView
- (BOOL)iconOnlyTile;
- (HFServiceLikeItem)item;
- (HUGridServiceCell)tileView;
- (HUHomeAccessoryTileView)initWithFrame:(CGRect)a3 categoryType:(id)a4;
- (HUHomeAccessoryTileView)initWithFrame:(CGRect)a3 item:(id)a4 iconOnlyTile:(BOOL)a5;
- (UIImageView)homeView;
- (double)aspectRatio;
- (void)layoutSubviews;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUHomeAccessoryTileView

- (HUHomeAccessoryTileView)initWithFrame:(CGRect)a3 item:(id)a4 iconOnlyTile:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  v45.receiver = self;
  v45.super_class = (Class)HUHomeAccessoryTileView;
  v12 = -[HUHomeAccessoryTileView initWithFrame:](&v45, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    v12->_iconOnlyTile = v5;
    id v14 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v15 = HUImageNamed(@"home");
    uint64_t v16 = [v14 initWithImage:v15];
    homeView = v13->_homeView;
    v13->_homeView = (UIImageView *)v16;

    [(UIImageView *)v13->_homeView setContentMode:1];
    [(UIImageView *)v13->_homeView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUHomeAccessoryTileView *)v13 addSubview:v13->_homeView];
    v18 = objc_alloc_init(HUGridServiceCell);
    tileView = v13->_tileView;
    v13->_tileView = v18;

    id v20 = v11;
    v21 = &unk_1F1A3D558;
    if ([v20 conformsToProtocol:v21]) {
      v22 = v20;
    }
    else {
      v22 = 0;
    }
    id v23 = v22;

    if (v23)
    {
      id v24 = objc_alloc(MEMORY[0x1E4F696A8]);
      uint64_t v39 = MEMORY[0x1E4F143A8];
      uint64_t v40 = 3221225472;
      v41 = __59__HUHomeAccessoryTileView_initWithFrame_item_iconOnlyTile___block_invoke;
      v42 = &unk_1E6386A18;
      id v43 = v23;
      id v44 = v20;
      v25 = (void *)[v24 initWithSourceItem:v44 transformationBlock:&v39];
      -[HUGridServiceCell setItem:](v13->_tileView, "setItem:", v25, v39, v40, v41, v42);
    }
    else
    {
      [(HUGridServiceCell *)v13->_tileView setItem:v20];
    }
    v26 = +[HUGridServiceCellLayoutOptions defaultOptionsForCellSizeSubclass:1];
    [v26 setContentColorStyle:1];
    [v26 setShowIconOnly:v5];
    [v26 setShowDescription:0];
    if (v5) {
      [v26 setCellCornerRadius:6.0];
    }
    [(HUGridCell *)v13->_tileView setLayoutOptions:v26];
    [(HUGridServiceCell *)v13->_tileView setShouldShowRoomName:0];
    [(HUGridServiceCell *)v13->_tileView setShouldColorDescription:0];
    v27 = [MEMORY[0x1E4F428B8] systemBlackColor];
    [(HUGridServiceCell *)v13->_tileView setDefaultDescriptionColor:v27];

    id v28 = [MEMORY[0x1E4F428B8] blackColor];
    uint64_t v29 = [v28 CGColor];
    v30 = [(HUGridServiceCell *)v13->_tileView layer];
    [v30 setShadowColor:v29];

    double v31 = *MEMORY[0x1E4F1DB30];
    double v32 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    v33 = [(HUGridServiceCell *)v13->_tileView layer];
    objc_msgSend(v33, "setShadowOffset:", v31, v32);

    v34 = [(HUGridServiceCell *)v13->_tileView layer];
    LODWORD(v35) = 0.25;
    [v34 setShadowOpacity:v35];

    v36 = [(HUGridServiceCell *)v13->_tileView layer];
    [v36 setShadowRadius:10.0];

    v37 = [(HUGridServiceCell *)v13->_tileView layer];
    [v37 setMasksToBounds:0];

    [(HUHomeAccessoryTileView *)v13 updateUIWithAnimation:0];
    [(HUHomeAccessoryTileView *)v13 addSubview:v13->_tileView];
  }
  return v13;
}

id __59__HUHomeAccessoryTileView_initWithFrame_item_iconOnlyTile___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  id v4 = objc_alloc(MEMORY[0x1E4F69568]);
  id v5 = [*(id *)(a1 + 32) homeKitObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v5;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
      v9 = v7;
      if (v8) {
        goto LABEL_9;
      }
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      id v11 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v6, objc_opt_class() file lineNumber description];
    }
    v9 = 0;
LABEL_9:

    v12 = objc_msgSend(v9, "hf_userFriendlyLocalizedCapitalizedDescription");
LABEL_19:

    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = objc_opt_class();
    id v14 = v5;
    if (v14)
    {
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }
      v9 = v14;
      if (v15) {
        goto LABEL_18;
      }
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v16 handleFailureInFunction:v17, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v13, objc_opt_class() file lineNumber description];
    }
    v9 = 0;
LABEL_18:

    v18 = (void *)MEMORY[0x1E4F2E4F8];
    v19 = [v9 category];
    id v20 = [v19 categoryType];
    v12 = objc_msgSend(v18, "hf_userFriendlyLocalizedCapitalizedDescription:", v20);

    goto LABEL_19;
  }
  v12 = 0;
LABEL_21:

  v21 = (void *)[v4 initWithRawServiceName:v12 rawRoomName:0];
  objc_msgSend(v3, "na_safeSetObject:forKey:", v21, *MEMORY[0x1E4F68A60]);
  [v3 setObject:&unk_1F19B4C28 forKey:*MEMORY[0x1E4F68BC0]];
  objc_opt_class();
  id v22 = *(id *)(a1 + 40);
  if (objc_opt_isKindOfClass()) {
    id v23 = v22;
  }
  else {
    id v23 = 0;
  }
  id v24 = v23;

  if (v24)
  {
    v25 = [v24 accessory];
    v26 = [MEMORY[0x1E4F69548] iconDescriptorForAccessory:v25];
    [v3 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F689E8]];
  }

  return v3;
}

- (HUHomeAccessoryTileView)initWithFrame:(CGRect)a3 categoryType:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v18[2] = *MEMORY[0x1E4F143B8];
  v9 = (objc_class *)MEMORY[0x1E4F695C0];
  id v10 = a4;
  id v11 = [v9 alloc];
  v17[0] = *MEMORY[0x1E4F689E8];
  v12 = [MEMORY[0x1E4F69548] iconDescriptorForAccessoryCategoryOrServiceType:v10];

  v17[1] = *MEMORY[0x1E4F68BC0];
  v18[0] = v12;
  v18[1] = &unk_1F19B4C28;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  id v14 = (void *)[v11 initWithResults:v13];

  v15 = -[HUHomeAccessoryTileView initWithFrame:item:iconOnlyTile:](self, "initWithFrame:item:iconOnlyTile:", v14, 1, x, y, width, height);
  return v15;
}

- (HFServiceLikeItem)item
{
  v2 = [(HUHomeAccessoryTileView *)self tileView];
  v3 = [v2 item];
  if ([v3 conformsToProtocol:&unk_1F1A3D558]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (double)aspectRatio
{
  return 0.9;
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  objc_initWeak(&location, self);
  id v5 = [(HUHomeAccessoryTileView *)self tileView];
  uint64_t v6 = [v5 item];
  id v7 = [v6 updateWithOptions:MEMORY[0x1E4F1CC08]];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__HUHomeAccessoryTileView_updateUIWithAnimation___block_invoke;
  v9[3] = &unk_1E638F650;
  objc_copyWeak(&v10, &location);
  BOOL v11 = a3;
  id v8 = (id)[v7 addCompletionBlock:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __49__HUHomeAccessoryTileView_updateUIWithAnimation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained tileView];
  [v2 updateUIWithAnimation:*(unsigned __int8 *)(a1 + 40)];
}

- (void)layoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)HUHomeAccessoryTileView;
  [(HUHomeAccessoryTileView *)&v39 layoutSubviews];
  [(HUHomeAccessoryTileView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(HUHomeAccessoryTileView *)self iconOnlyTile])
  {
    double v11 = HURoundToScreenScale(v10 * 0.9);
    double v12 = v10;
  }
  else
  {
    double v12 = HURoundToScreenScale(v8 / 0.9);
    double v11 = v8;
  }
  v40.origin.double x = v4;
  v40.origin.double y = v6;
  v40.size.double width = v8;
  v40.size.double height = v10;
  CGFloat MidX = CGRectGetMidX(v40);
  double v38 = HURoundToScreenScale(MidX - v11 * 0.5);
  v41.origin.double x = v4;
  v41.origin.double y = v6;
  v41.size.double width = v8;
  v41.size.double height = v10;
  CGFloat MidY = CGRectGetMidY(v41);
  double v37 = HURoundToScreenScale(MidY - v12 * 0.5);
  [(HUHomeAccessoryTileView *)self iconOnlyTile];
  double v15 = HURoundToScreenScale(v11);
  double v16 = HURoundToScreenScale(v15 / 1.08);
  v17 = [(HUHomeAccessoryTileView *)self homeView];
  objc_msgSend(v17, "setFrame:", v38, v37, v15, v16);

  v18 = [(HUHomeAccessoryTileView *)self homeView];
  [v18 frame];
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  BOOL v27 = [(HUHomeAccessoryTileView *)self iconOnlyTile];
  double v28 = 2.7;
  if (v27) {
    double v28 = 2.48;
  }
  CGFloat v29 = v12;
  double v30 = HURoundToScreenScale(v11 / v28);
  double v31 = HURoundToScreenScale(v30);
  v42.origin.double x = v20;
  v42.origin.double y = v22;
  v42.size.double width = v24;
  v42.size.double height = v26;
  CGFloat v32 = CGRectGetMidX(v42);
  double v33 = HURoundToScreenScale(v32 - v30 * 0.5);
  v43.origin.double y = v37;
  v43.origin.double x = v38;
  v43.size.double width = v11;
  v43.size.double height = v29;
  CGFloat MaxY = CGRectGetMaxY(v43);
  double v35 = HURoundToScreenScale(MaxY - v31);
  v36 = [(HUHomeAccessoryTileView *)self tileView];
  objc_msgSend(v36, "setFrame:", v33, v35, v30, v31);
}

- (UIImageView)homeView
{
  return self->_homeView;
}

- (HUGridServiceCell)tileView
{
  return self->_tileView;
}

- (BOOL)iconOnlyTile
{
  return self->_iconOnlyTile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileView, 0);

  objc_storeStrong((id *)&self->_homeView, 0);
}

@end
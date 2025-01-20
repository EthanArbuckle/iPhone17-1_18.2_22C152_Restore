@interface CCUIMenuModuleViewController
+ (id)checkmarkImageForPreferredContentSizeCategory:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_forceLimitContentSizeCategoryFromContentHeightIfNecessary:(double)a3 expanded:(BOOL)a4;
- (BOOL)_setForceLimitContentSizeCategory:(BOOL)a3;
- (BOOL)_shouldHideGlyphForLimitedContentSizeCategory;
- (BOOL)_shouldLimitContentSizeCategory;
- (BOOL)_shouldShowFooterChin;
- (BOOL)_shouldShowFooterSeparator;
- (BOOL)_toggleSelectionForMenuItem:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasFooterButton;
- (BOOL)hasGlyph;
- (BOOL)hideGlyphInHeader;
- (BOOL)isAlwaysExpanded;
- (BOOL)isBusy;
- (BOOL)prefersContextMenuDisplayStyle;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (BOOL)shouldPerformClickInteraction;
- (BOOL)shouldProvideOwnPlatter;
- (BOOL)showsMenuAsPrimaryAction;
- (BOOL)useTallLayout;
- (BOOL)useTrailingCheckmarkLayout;
- (BOOL)useTrailingInset;
- (CCUIContentModuleContext)contentModuleContext;
- (CCUIMenuItemsUpdating)menuUpdatingDelegate;
- (CCUIMenuModuleViewController)initWithContentModuleContext:(id)a3;
- (CCUIMenuModuleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSString)menuDisplayName;
- (NSString)subtitle;
- (UIMenu)contextMenu;
- (UIView)contentView;
- (double)_aggregateModuleHeight;
- (double)_contentScaleForSize:(CGSize)a3;
- (double)_defaultMenuItemHeight;
- (double)_desiredExpandedHeight;
- (double)_footerHeight;
- (double)_maximumHeight;
- (double)_menuItemsHeightForWidth:(double)a3;
- (double)_separatorHeight;
- (double)_titleWidthForContainerWidth:(double)a3;
- (double)headerHeight;
- (double)headerHeightForWidth:(double)a3;
- (double)preferredExpandedContentHeight;
- (double)preferredExpandedContentHeightWithWidth:(double)a3;
- (double)scrollViewContentHeightForWidth:(double)a3;
- (double)visibleMenuItems;
- (id)_busyIndicatorView;
- (id)_leadingViewForMenuItem:(id)a3;
- (id)_menuItemFromPlaceholderIndex:(unint64_t)a3;
- (id)_preferredFontForTextStyle:(id)a3 hiFontStyle:(int64_t)a4;
- (id)_subtitleFont;
- (id)_titleFont;
- (id)_trailingViewForMenuItem:(id)a3;
- (id)contextMenuItems;
- (id)leadingImageForMenuItem:(id)a3;
- (id)leadingViewForMenuItem:(id)a3;
- (id)menuItemForIdentifier:(id)a3;
- (id)mostRecentMenuItems;
- (id)trailingImageForMenuItem:(id)a3;
- (id)trailingViewForMenuItem:(id)a3;
- (unint64_t)actionsCount;
- (unint64_t)indentation;
- (unint64_t)menuItemCount;
- (unint64_t)minimumMenuItems;
- (void)_contentSizeCategoryDidChange;
- (void)_fadeViewsForExpandedState:(BOOL)a3;
- (void)_handleActionTapped:(id)a3;
- (void)_handlePressGesture:(id)a3;
- (void)_layoutBusyIndicatorForSize:(CGSize)a3;
- (void)_layoutContentViewForSize:(CGSize)a3;
- (void)_layoutFooterButtonForSize:(CGSize)a3;
- (void)_layoutFooterSeparatorForSize:(CGSize)a3;
- (void)_layoutGlyphViewForSize:(CGSize)a3;
- (void)_layoutHeaderSeparatorForSize:(CGSize)a3;
- (void)_layoutSubtitleLabelForSize:(CGSize)a3;
- (void)_layoutTitleLabelForSize:(CGSize)a3;
- (void)_layoutTransformViewForSize:(CGSize)a3;
- (void)_layoutViewSubviews;
- (void)_setMenuItems:(id)a3;
- (void)_setRootViewClipsToBounds:(BOOL)a3;
- (void)_setTransformViewClipsToBounds:(BOOL)a3;
- (void)_setView:(id)a3 clipsToBounds:(BOOL)a4;
- (void)_setupSubtitleLabel;
- (void)_setupTitleLabel;
- (void)_updateLeadingAndTrailingViews;
- (void)_updateMenuItemsSeparatorVisiblity;
- (void)_updatePreferredContentSize;
- (void)_updateSubtitleFont;
- (void)_updateTitleFont;
- (void)addActionWithTitle:(id)a3 glyph:(id)a4 handler:(id)a5;
- (void)addActionWithTitle:(id)a3 subtitle:(id)a4 glyph:(id)a5 handler:(id)a6;
- (void)contentModuleWillTransitionToExpandedContentMode:(BOOL)a3;
- (void)didTransitionToExpandedContentMode:(BOOL)a3;
- (void)removeAllActions;
- (void)removeFooterButton;
- (void)scrollToTop:(BOOL)a3;
- (void)setAlwaysExpanded:(BOOL)a3;
- (void)setBusy:(BOOL)a3;
- (void)setContentModuleContext:(id)a3;
- (void)setCustomContentView:(id)a3;
- (void)setFooterButtonTitle:(id)a3 handler:(id)a4;
- (void)setGlyphImage:(id)a3;
- (void)setGlyphPackageDescription:(id)a3;
- (void)setHideGlyphInHeader:(BOOL)a3;
- (void)setIndentation:(unint64_t)a3;
- (void)setMenuItems:(id)a3;
- (void)setMenuUpdatingDelegate:(id)a3;
- (void)setMinimumMenuItems:(unint64_t)a3;
- (void)setShouldProvideOwnPlatter:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUseIndentedLayout:(BOOL)a3;
- (void)setUseTallLayout:(BOOL)a3;
- (void)setUseTrailingCheckmarkLayout:(BOOL)a3;
- (void)setUseTrailingInset:(BOOL)a3;
- (void)setVisibleMenuItems:(double)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation CCUIMenuModuleViewController

+ (id)checkmarkImageForPreferredContentSizeCategory:(id)a3
{
  id v4 = a3;
  v5 = (void *)checkmarkImageForPreferredContentSizeCategory__checkmarkImage;
  if (checkmarkImageForPreferredContentSizeCategory__checkmarkImage) {
    BOOL v6 = checkmarkImageForPreferredContentSizeCategory__checkmarkImageContentSizeCategory == (void)v4;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    objc_storeStrong((id *)&checkmarkImageForPreferredContentSizeCategory__checkmarkImageContentSizeCategory, a3);
    v7 = (void *)*MEMORY[0x1E4FB2788];
    if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x1E4FB2788]) == NSOrderedDescending)
    {
      id v8 = v7;

      id v4 = v8;
    }
    v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", *MEMORY[0x1E4FB28C8], 4, v4);
    v10 = (void *)MEMORY[0x1E4FB1830];
    [v9 pointSize];
    v11 = objc_msgSend(v10, "configurationWithPointSize:weight:scale:", 6, 2);
    uint64_t v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark" withConfiguration:v11];
    v13 = (void *)checkmarkImageForPreferredContentSizeCategory__checkmarkImage;
    checkmarkImageForPreferredContentSizeCategory__checkmarkImage = v12;

    v14 = (void *)checkmarkImageForPreferredContentSizeCategory__checkmarkImage;
    v15 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v16 = [v14 _flatImageWithColor:v15];
    v17 = (void *)checkmarkImageForPreferredContentSizeCategory__checkmarkImage;
    checkmarkImageForPreferredContentSizeCategory__checkmarkImage = v16;

    v5 = (void *)checkmarkImageForPreferredContentSizeCategory__checkmarkImage;
  }
  id v18 = v5;

  return v18;
}

- (CCUIMenuModuleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CCUIMenuModuleViewController;
  id v4 = [(CCUIButtonModuleViewController *)&v10 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    menuItems = v4->_menuItems;
    v4->_menuItems = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    identiferToActivityIndicatorView = v4->_identiferToActivityIndicatorView;
    v4->_identiferToActivityIndicatorView = v7;
  }
  return v4;
}

- (CCUIMenuModuleViewController)initWithContentModuleContext:(id)a3
{
  id v4 = a3;
  v5 = [(CCUIMenuModuleViewController *)self initWithNibName:0 bundle:0];
  BOOL v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_contentModuleContext, v4);
  }

  return v6;
}

- (void)setAlwaysExpanded:(BOOL)a3
{
  self->_alwaysExpanded = a3;
  if (a3) {
    [(CCUIButtonModuleViewController *)self setExpanded:1];
  }
}

- (id)_busyIndicatorView
{
  busyIndicatorView = self->_busyIndicatorView;
  if (!busyIndicatorView)
  {
    id v4 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:1];
    v5 = self->_busyIndicatorView;
    self->_busyIndicatorView = v4;

    [(UIView *)self->_transformView addSubview:self->_busyIndicatorView];
    [(UIActivityIndicatorView *)self->_busyIndicatorView setHidesWhenStopped:0];
    [(UIActivityIndicatorView *)self->_busyIndicatorView setAlpha:0.0];
    busyIndicatorView = self->_busyIndicatorView;
  }
  return busyIndicatorView;
}

- (void)setBusy:(BOOL)a3
{
  if (self->_busy != a3)
  {
    BOOL v3 = a3;
    self->_busy = a3;
    v5 = [(CCUIMenuModuleViewController *)self _busyIndicatorView];
    BOOL v6 = v5;
    if (v3) {
      [v5 startAnimating];
    }
    else {
      [v5 stopAnimating];
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __40__CCUIMenuModuleViewController_setBusy___block_invoke;
    v16[3] = &unk_1E6AD41E8;
    v16[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v16];
    v7 = (void *)MEMORY[0x1E4FB1EB0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __40__CCUIMenuModuleViewController_setBusy___block_invoke_2;
    v13[3] = &unk_1E6AD42F0;
    id v14 = v6;
    BOOL v15 = v3;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__CCUIMenuModuleViewController_setBusy___block_invoke_3;
    v9[3] = &unk_1E6AD4318;
    BOOL v12 = v3;
    id v10 = v14;
    v11 = self;
    id v8 = v14;
    [v7 animateWithDuration:v13 animations:v9 completion:0.3];
  }
}

void __40__CCUIMenuModuleViewController_setBusy___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) viewIfLoaded];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) viewIfLoaded];
  [v3 layoutIfNeeded];
}

uint64_t __40__CCUIMenuModuleViewController_setBusy___block_invoke_2(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

void __40__CCUIMenuModuleViewController_setBusy___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    if (!*(unsigned char *)(a1 + 48))
    {
      [*(id *)(a1 + 32) removeFromSuperview];
      id v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      if (v3 == *(void **)(v4 + 1120))
      {
        *(void *)(v4 + 1120) = 0;
      }
    }
  }
}

- (void)addActionWithTitle:(id)a3 glyph:(id)a4 handler:(id)a5
{
}

- (void)addActionWithTitle:(id)a3 subtitle:(id)a4 glyph:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (a5)
  {
    v13 = (objc_class *)MEMORY[0x1E4FB1838];
    id v14 = a5;
    a5 = (id)[[v13 alloc] initWithImage:v14];
  }
  [a5 setContentMode:4];
  BOOL v15 = [CCUIMenuModuleItem alloc];
  uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
  v17 = [v16 UUIDString];
  id v18 = [(CCUIMenuModuleItem *)v15 initWithTitle:v10 identifier:v17 handler:v12];

  [(CCUIMenuModuleItem *)v18 setSubtitle:v11];
  [(NSMutableArray *)self->_menuItems addObject:v18];
  v19 = [[CCUIMenuModuleItemView alloc] initWithMenuItem:v18];
  [(CCUIMenuModuleItemView *)v19 setLeadingView:a5];
  [(CCUIMenuModuleViewController *)self preferredExpandedContentWidth];
  [(CCUIMenuModuleItemView *)v19 setPreferredMaxLayoutWidth:"setPreferredMaxLayoutWidth:"];
  [(CCUIMenuModuleItemView *)v19 setIndentation:self->_indentation];
  [(CCUIMenuModuleItemView *)v19 setUseTrailingCheckmarkLayout:self->_useTrailingCheckmarkLayout];
  [(CCUIMenuModuleItemView *)v19 setUseTrailingInset:self->_useTrailingInset];
  v20 = (void *)MEMORY[0x1E4FB1EB0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __74__CCUIMenuModuleViewController_addActionWithTitle_subtitle_glyph_handler___block_invoke;
  v22[3] = &unk_1E6AD4340;
  v22[4] = self;
  v23 = v19;
  v21 = v19;
  [v20 performWithoutAnimation:v22];
}

void __74__CCUIMenuModuleViewController_addActionWithTitle_subtitle_glyph_handler___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1080) addArrangedSubview:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateMenuItemsSeparatorVisiblity];
  id v2 = [*(id *)(a1 + 32) viewIfLoaded];
  [v2 setNeedsLayout];
}

- (void)setMenuItems:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ([v4 count] >= self->_minimumMenuItems)
  {
    id v7 = v4;
  }
  else
  {
    id v8 = (id)[v4 mutableCopy];
    if ([v8 count] < self->_minimumMenuItems)
    {
      uint64_t v5 = 0;
      do
      {
        BOOL v6 = [(CCUIMenuModuleViewController *)self _menuItemFromPlaceholderIndex:v5];
        [v8 addObject:v6];

        ++v5;
      }
      while ([v8 count] < self->_minimumMenuItems);
    }

    id v7 = v8;
  }
  id v9 = v7;
  [(CCUIMenuModuleViewController *)self _setMenuItems:v7];
}

- (id)mostRecentMenuItems
{
  return self->_menuItems;
}

- (id)_menuItemFromPlaceholderIndex:(unint64_t)a3
{
  id v4 = [CCUIMenuModuleItem alloc];
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"PLACEHOLDER #%ld", a3 + 1);
  BOOL v6 = [(CCUIMenuModuleItem *)v4 initWithTitle:@" " identifier:v5 handler:0];

  [(CCUIMenuModuleItem *)v6 setPlaceholder:1];
  return v6;
}

- (void)_setMenuItems:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)CCUILogUserInterface;
  if (os_log_type_enabled((os_log_t)CCUILogUserInterface, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = v5;
    *(_DWORD *)buf = 134218498;
    *(void *)&buf[4] = [v4 count];
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = objc_opt_class();
    *(_WORD *)&buf[22] = 2112;
    v53 = (uint64_t (*)(uint64_t, uint64_t))v4;
    id v7 = *(id *)&buf[14];
    _os_log_impl(&dword_1D834A000, v6, OS_LOG_TYPE_DEFAULT, "Setting %ld menu items for %{public}@: %@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v53 = __Block_byref_object_copy_;
  v54 = __Block_byref_object_dispose_;
  id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = (NSMutableArray *)[v4 mutableCopy];
  menuItems = self->_menuItems;
  self->_menuItems = v8;

  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v51 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        BOOL v15 = [v14 identifier];
        [(id)v34[5] setObject:v14 forKey:v15];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v51 count:16];
    }
    while (v11);
  }

  uint64_t v16 = (void *)MEMORY[0x1E4FB1EB0];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __46__CCUIMenuModuleViewController__setMenuItems___block_invoke;
  v23[3] = &unk_1E6AD4368;
  v23[4] = self;
  v25 = &v33;
  v26 = buf;
  id v17 = v10;
  id v24 = v17;
  v27 = &v39;
  v28 = &v45;
  [v16 performWithoutAnimation:v23];
  if ([(id)v46[5] count]
    || [(id)v40[5] count]
    || [*(id *)(*(void *)&buf[8] + 40) count])
  {
    if ([(CCUIButtonModuleViewController *)self isExpanded])
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __46__CCUIMenuModuleViewController__setMenuItems___block_invoke_21;
      v22[3] = &unk_1E6AD41E8;
      v22[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v22];
    }
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = __Block_byref_object_copy_;
    v20[4] = __Block_byref_object_dispose_;
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __46__CCUIMenuModuleViewController__setMenuItems___block_invoke_2;
    v19[3] = &unk_1E6AD43B8;
    v19[4] = self;
    v19[5] = &v39;
    v19[6] = &v33;
    v19[7] = v20;
    v19[8] = &v45;
    v19[9] = buf;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __46__CCUIMenuModuleViewController__setMenuItems___block_invoke_4;
    v18[3] = &unk_1E6AD4408;
    v18[5] = v20;
    v18[6] = buf;
    v18[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v19 animations:v18 completion:0.3];
    [(CCUIMenuModuleViewController *)self _updatePreferredContentSize];
    _Block_object_dispose(v20, 8);
  }
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(buf, 8);
}

void __46__CCUIMenuModuleViewController__setMenuItems___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) loadViewIfNeeded];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1080) arrangedSubviews];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v45 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v9 = [v8 menuItem];
        id v10 = [v9 identifier];
        uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKey:v10];

        if (!v11) {
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v8];
        }
        [v3 setObject:v8 forKey:v10];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
    }
    while (v5);
  }

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v38 = *(id *)(a1 + 40);
  uint64_t v13 = [v38 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v38);
        }
        id v17 = *(void **)(*((void *)&v40 + 1) + 8 * j);
        id v18 = [v17 identifier];
        v19 = [v3 objectForKey:v18];
        if (v19)
        {
          v20 = v19;
          id v21 = [(CCUIMenuModuleItemView *)v19 menuItem];
          if (([v21 isEqual:v17] & 1) == 0) {
            [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v20];
          }
        }
        else
        {
          v20 = [[CCUIMenuModuleItemView alloc] initWithMenuItem:v17];
          [(CCUIMenuModuleItemView *)v20 setIndentation:*(void *)(*(void *)(a1 + 32) + 1240)];
          [(CCUIMenuModuleItemView *)v20 setUseTrailingCheckmarkLayout:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1196)];
          [(CCUIMenuModuleItemView *)v20 setUseTrailingInset:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1197)];
          v22 = [*(id *)(a1 + 32) _leadingViewForMenuItem:v17];
          [(CCUIMenuModuleItemView *)v20 setLeadingView:v22];

          v23 = [*(id *)(a1 + 32) _trailingViewForMenuItem:v17];
          [(CCUIMenuModuleItemView *)v20 setTrailingView:v23];

          [*(id *)(a1 + 32) preferredExpandedContentWidth];
          [(CCUIMenuModuleItemView *)v20 setPreferredMaxLayoutWidth:"setPreferredMaxLayoutWidth:"];
          [(CCUIMenuModuleItemView *)v20 setHidden:1];
          [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v20];
          [(CCUIMenuModuleItemView *)v20 updateSubviewsAlpha:0.0];
        }
        [v12 addObject:v20];
      }
      uint64_t v14 = [v38 countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v14);
  }

  id v24 = v12;
  if ([v12 count])
  {
    unint64_t v25 = 0;
    unint64_t v26 = 0;
    while (1)
    {
      v27 = [v24 objectAtIndex:v25];
      v28 = [*(id *)(*(void *)(a1 + 32) + 1080) arrangedSubviews];
      if (v26 >= [v28 count]) {
        break;
      }
      long long v29 = [*(id *)(*(void *)(a1 + 32) + 1080) arrangedSubviews];
      long long v30 = [v29 objectAtIndex:v26];

      if (!v30) {
        goto LABEL_31;
      }
      v28 = [v30 menuItem];
      if ([v28 isPlaceholder]) {
        goto LABEL_30;
      }
      char v31 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) containsObject:v30];

      if ((v31 & 1) == 0) {
        goto LABEL_31;
      }
LABEL_37:
      ++v26;

      if (v25 >= [v24 count]) {
        goto LABEL_38;
      }
    }
    long long v30 = 0;
LABEL_30:

LABEL_31:
    if (v30 != v27)
    {
      long long v32 = [*(id *)(*(void *)(a1 + 32) + 1080) arrangedSubviews];
      unint64_t v33 = [v32 count];

      if (v26 > v33)
      {
        v34 = [*(id *)(*(void *)(a1 + 32) + 1080) arrangedSubviews];
        unint64_t v26 = [v34 count];

        uint64_t v35 = CCUILogUserInterface;
        if (os_log_type_enabled((os_log_t)CCUILogUserInterface, OS_LOG_TYPE_FAULT))
        {
          uint64_t v36 = *(void *)(*(void *)(a1 + 32) + 1080);
          *(_DWORD *)buf = 134218498;
          unint64_t v49 = v26;
          __int16 v50 = 2112;
          uint64_t v51 = v36;
          __int16 v52 = 2048;
          unint64_t v53 = v33;
          _os_log_fault_impl(&dword_1D834A000, v35, OS_LOG_TYPE_FAULT, "Incoming menu item view is inserted at index %lul which is out of bounds for container: %@, count: %lul.", buf, 0x20u);
        }
      }
      [*(id *)(*(void *)(a1 + 32) + 1080) insertArrangedSubview:v27 atIndex:v26];
    }
    ++v25;
    goto LABEL_37;
  }
LABEL_38:
  v37 = [*(id *)(a1 + 32) viewIfLoaded];
  [v37 layoutIfNeeded];
}

uint64_t __46__CCUIMenuModuleViewController__setMenuItems___block_invoke_21(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePreferredContentSize];
}

void __46__CCUIMenuModuleViewController__setMenuItems___block_invoke_2(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  obuint64_t j = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v43 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v59 != v42) {
          objc_enumerationMutation(obj);
        }
        id v3 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v4 = [v3 menuItem];
        uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        uint64_t v6 = [v4 identifier];
        id v7 = [v5 objectForKey:v6];

        [v3 setMenuItem:v7];
        id v8 = [v3 leadingView];
        id v9 = [*(id *)(a1 + 32) _leadingViewForMenuItem:v7];
        id v10 = [v3 trailingView];
        uint64_t v11 = [*(id *)(a1 + 32) _trailingViewForMenuItem:v7];
        id v12 = (void *)MEMORY[0x1E4FB1EB0];
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __46__CCUIMenuModuleViewController__setMenuItems___block_invoke_3;
        v52[3] = &unk_1E6AD4390;
        v52[4] = v3;
        id v13 = v9;
        id v53 = v13;
        id v54 = v8;
        uint64_t v57 = *(void *)(a1 + 56);
        id v14 = v11;
        id v55 = v14;
        id v15 = v10;
        id v56 = v15;
        id v16 = v8;
        [v12 performWithoutAnimation:v52];
        if (v13) {
          BOOL v17 = v16 == 0;
        }
        else {
          BOOL v17 = 0;
        }
        if (v17)
        {
          double v19 = 1.0;
          v20 = v13;
          goto LABEL_16;
        }
        if (v13) {
          BOOL v18 = 1;
        }
        else {
          BOOL v18 = v16 == 0;
        }
        if (!v18)
        {
          double v19 = 0.0;
          v20 = v15;
LABEL_16:
          [v20 setAlpha:v19];
        }
        if (v14) {
          BOOL v21 = v15 == 0;
        }
        else {
          BOOL v21 = 0;
        }
        if (v21)
        {
          double v23 = 1.0;
          id v24 = v14;
          goto LABEL_27;
        }
        if (v14) {
          BOOL v22 = 1;
        }
        else {
          BOOL v22 = v15 == 0;
        }
        if (!v22)
        {
          double v23 = 0.0;
          id v24 = v15;
LABEL_27:
          [v24 setAlpha:v23];
        }
        unint64_t v25 = [*(id *)(a1 + 32) viewIfLoaded];
        [v25 setNeedsLayout];
      }
      uint64_t v43 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v43);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v26 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v48 objects:v63 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v49 != v29) {
          objc_enumerationMutation(v26);
        }
        char v31 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        [v31 updateSubviewsAlpha:1.0];
        [v31 setHidden:0];
        long long v32 = [*(id *)(a1 + 32) viewIfLoaded];
        [v32 setNeedsLayout];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v48 objects:v63 count:16];
    }
    while (v28);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v33 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v34 = [v33 countByEnumeratingWithState:&v44 objects:v62 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v45;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v45 != v36) {
          objc_enumerationMutation(v33);
        }
        id v38 = *(void **)(*((void *)&v44 + 1) + 8 * k);
        [v38 updateSubviewsAlpha:0.0];
        [v38 setHidden:1];
        uint64_t v39 = [*(id *)(a1 + 32) viewIfLoaded];
        [v39 setNeedsLayout];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v44 objects:v62 count:16];
    }
    while (v35);
  }

  [*(id *)(a1 + 32) _updateMenuItemsSeparatorVisiblity];
  long long v40 = [*(id *)(a1 + 32) viewIfLoaded];
  [v40 layoutIfNeeded];
}

void *__46__CCUIMenuModuleViewController__setMenuItems___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setLeadingView:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  if (v2)
  {
    if (!v3) {
      [v2 setAlpha:0.0];
    }
  }
  else if (v3)
  {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "addObject:");
  }
  [*(id *)(a1 + 32) setTrailingView:*(void *)(a1 + 56)];
  result = *(void **)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  if (result)
  {
    if (!v5)
    {
      return (void *)[result setAlpha:0.0];
    }
  }
  else if (v5)
  {
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    return objc_msgSend(v6, "addObject:");
  }
  return result;
}

uint64_t __46__CCUIMenuModuleViewController__setMenuItems___block_invoke_4(uint64_t result, int a2)
{
  if (a2)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __46__CCUIMenuModuleViewController__setMenuItems___block_invoke_5;
    v2[3] = &unk_1E6AD43E0;
    uint64_t v4 = *(void *)(result + 48);
    long long v3 = *(_OWORD *)(result + 32);
    return [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
  }
  return result;
}

void __46__CCUIMenuModuleViewController__setMenuItems___block_invoke_5(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v2 = *(id *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v4);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = *(id *)(*(void *)(a1[6] + 8) + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1[4] + 1080), "removeArrangedSubview:", v12, (void)v16);
        [v12 removeFromSuperview];
        id v13 = *(void **)(a1[4] + 1096);
        id v14 = [v12 menuItem];
        id v15 = [v14 identifier];
        [v13 removeObjectForKey:v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v9);
  }
}

- (id)menuItemForIdentifier:(id)a3
{
  id v4 = a3;
  menuItems = self->_menuItems;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__CCUIMenuModuleViewController_menuItemForIdentifier___block_invoke;
  v9[3] = &unk_1E6AD4430;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSMutableArray *)menuItems bs_firstObjectPassingTest:v9];

  return v7;
}

uint64_t __54__CCUIMenuModuleViewController_menuItemForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (void)setUseIndentedLayout:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  [(CCUIMenuModuleViewController *)self setIndentation:v3];
}

- (id)leadingImageForMenuItem:(id)a3
{
  id v4 = a3;
  if ([(CCUIMenuModuleViewController *)self useTrailingCheckmarkLayout]
    || ![v4 isSelected])
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    id v6 = [(CCUIMenuModuleViewController *)self traitCollection];
    id v7 = [v6 preferredContentSizeCategory];
    uint64_t v8 = [v5 checkmarkImageForPreferredContentSizeCategory:v7];
  }
  return v8;
}

- (id)leadingViewForMenuItem:(id)a3
{
  uint64_t v3 = [(CCUIMenuModuleViewController *)self leadingImageForMenuItem:a3];
  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v3];
    [v4 setContentMode:4];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_leadingViewForMenuItem:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  if (([v4 isPlaceholder] & 1) == 0)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB1EB0];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__CCUIMenuModuleViewController__leadingViewForMenuItem___block_invoke;
    v8[3] = &unk_1E6AD4458;
    id v10 = &v11;
    v8[4] = self;
    id v9 = v4;
    [v5 performWithoutAnimation:v8];
  }
  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __56__CCUIMenuModuleViewController__leadingViewForMenuItem___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) leadingViewForMenuItem:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (id)trailingImageForMenuItem:(id)a3
{
  id v4 = a3;
  if ([(CCUIMenuModuleViewController *)self useTrailingCheckmarkLayout]
    && [v4 isSelected])
  {
    uint64_t v5 = objc_opt_class();
    id v6 = [(CCUIMenuModuleViewController *)self traitCollection];
    id v7 = [v6 preferredContentSizeCategory];
    uint64_t v8 = [v5 checkmarkImageForPreferredContentSizeCategory:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)trailingViewForMenuItem:(id)a3
{
  id v4 = a3;
  if ([v4 isBusy])
  {
    identiferToActivityIndicatorView = self->_identiferToActivityIndicatorView;
    id v6 = [v4 identifier];
    id v7 = [(NSMutableDictionary *)identiferToActivityIndicatorView objectForKey:v6];

    if (!v7)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:1];
      [v7 startAnimating];
      uint64_t v8 = self->_identiferToActivityIndicatorView;
      id v9 = [v4 identifier];
      [(NSMutableDictionary *)v8 setObject:v7 forKey:v9];
    }
    id v10 = self->_identiferToActivityIndicatorView;
    uint64_t v11 = [v4 identifier];
    id v12 = [(NSMutableDictionary *)v10 objectForKey:v11];
  }
  else
  {
    id v7 = [(CCUIMenuModuleViewController *)self trailingImageForMenuItem:v4];
    if (v7)
    {
      id v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v7];
      [v12 setContentMode:4];
    }
    else
    {
      id v12 = 0;
    }
  }

  return v12;
}

- (id)_trailingViewForMenuItem:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  if (([v4 isPlaceholder] & 1) == 0)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB1EB0];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__CCUIMenuModuleViewController__trailingViewForMenuItem___block_invoke;
    v8[3] = &unk_1E6AD4458;
    id v10 = &v11;
    v8[4] = self;
    id v9 = v4;
    [v5 performWithoutAnimation:v8];
  }
  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __57__CCUIMenuModuleViewController__trailingViewForMenuItem___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) trailingViewForMenuItem:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (unint64_t)menuItemCount
{
  return [(NSMutableArray *)self->_menuItems count];
}

- (unint64_t)actionsCount
{
  return [(NSMutableArray *)self->_menuItems count];
}

- (void)removeAllActions
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__CCUIMenuModuleViewController_removeAllActions__block_invoke;
  v2[3] = &unk_1E6AD41E8;
  void v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

uint64_t __48__CCUIMenuModuleViewController_removeAllActions__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1080), "arrangedSubviews", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v6) removeFromSuperview];
        id v7 = [*(id *)(a1 + 32) viewIfLoaded];
        [v7 setNeedsLayout];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  return [*(id *)(*(void *)(a1 + 32) + 1088) removeAllObjects];
}

- (void)_updatePreferredContentSize
{
  if ([(CCUIButtonModuleViewController *)self isExpanded])
  {
    [(CCUIMenuModuleViewController *)self preferredExpandedContentWidth];
    double v4 = v3;
    -[CCUIMenuModuleViewController preferredExpandedContentHeightWithWidth:](self, "preferredExpandedContentHeightWithWidth:");
    double v6 = v5;
    id v7 = [(CCUIMenuModuleViewController *)self viewIfLoaded];
    [v7 setNeedsLayout];

    -[CCUIMenuModuleViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v6);
  }
}

- (void)setFooterButtonTitle:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v8 = [CCUIMenuModuleItem alloc];
  long long v9 = [MEMORY[0x1E4F29128] UUID];
  long long v10 = [v9 UUIDString];
  long long v11 = [(CCUIMenuModuleItem *)v8 initWithTitle:v6 identifier:v10 handler:v7];

  footerButtonView = self->_footerButtonView;
  if (!footerButtonView)
  {
    long long v18 = (void *)MEMORY[0x1E4FB1EB0];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __61__CCUIMenuModuleViewController_setFooterButtonTitle_handler___block_invoke;
    v26[3] = &unk_1E6AD4340;
    v26[4] = self;
    long long v17 = (id *)&v27;
    uint64_t v27 = v11;
    [v18 performWithoutAnimation:v26];
    long long v19 = (void *)MEMORY[0x1E4FB1EB0];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __61__CCUIMenuModuleViewController_setFooterButtonTitle_handler___block_invoke_2;
    v25[3] = &unk_1E6AD41E8;
    v25[4] = self;
    long long v20 = v25;
LABEL_6:
    [v19 animateWithDuration:v20 animations:0.3];
    goto LABEL_7;
  }
  uint64_t v13 = [(CCUIMenuModuleItemView *)footerButtonView menuItem];
  uint64_t v14 = [v13 title];
  int v15 = BSEqualStrings();

  id v16 = (void *)MEMORY[0x1E4FB1EB0];
  if (!v15)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __61__CCUIMenuModuleViewController_setFooterButtonTitle_handler___block_invoke_4;
    v21[3] = &unk_1E6AD4340;
    v21[4] = self;
    long long v17 = (id *)&v22;
    long long v22 = v11;
    long long v20 = v21;
    long long v19 = v16;
    goto LABEL_6;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __61__CCUIMenuModuleViewController_setFooterButtonTitle_handler___block_invoke_3;
  v23[3] = &unk_1E6AD4340;
  v23[4] = self;
  long long v17 = (id *)&v24;
  id v24 = v11;
  [v16 performWithoutAnimation:v23];
LABEL_7:

  [(CCUIMenuModuleViewController *)self _updatePreferredContentSize];
}

void __61__CCUIMenuModuleViewController_setFooterButtonTitle_handler___block_invoke(uint64_t a1)
{
  id v2 = [[CCUIMenuModuleItemView alloc] initWithMenuItem:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(v3 + 1168);
  *(void *)(v3 + 1168) = v2;

  [*(id *)(*(void *)(a1 + 32) + 1168) setSeparatorVisible:0];
  double v5 = *(void **)(a1 + 32);
  id v6 = (void *)v5[146];
  [v5 preferredExpandedContentWidth];
  objc_msgSend(v6, "setPreferredMaxLayoutWidth:");
  [*(id *)(*(void *)(a1 + 32) + 1040) addSubview:*(void *)(*(void *)(a1 + 32) + 1168)];
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(void *)(v7 + 1184))
  {
    uint64_t v8 = [*(id *)(v7 + 1112) superview];
    long long v9 = *(void **)(*(void *)(a1 + 32) + 1208);

    uint64_t v7 = *(void *)(a1 + 32);
    if (v8 != v9)
    {
      [*(id *)(v7 + 1208) insertSubview:*(void *)(v7 + 1112) belowSubview:*(void *)(v7 + 1104)];
      uint64_t v7 = *(void *)(a1 + 32);
    }
  }
  long long v10 = [(id)v7 viewIfLoaded];
  [v10 setNeedsLayout];

  id v11 = [*(id *)(a1 + 32) viewIfLoaded];
  [v11 layoutIfNeeded];
}

void __61__CCUIMenuModuleViewController_setFooterButtonTitle_handler___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1176) = 1;
  id v2 = [*(id *)(a1 + 32) viewIfLoaded];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) viewIfLoaded];
  [v3 layoutIfNeeded];
}

uint64_t __61__CCUIMenuModuleViewController_setFooterButtonTitle_handler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1168) setMenuItem:*(void *)(a1 + 40)];
}

void __61__CCUIMenuModuleViewController_setFooterButtonTitle_handler___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1168) setMenuItem:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) viewIfLoaded];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) viewIfLoaded];
  [v3 layoutIfNeeded];
}

- (void)removeFooterButton
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_footerButtonView)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __50__CCUIMenuModuleViewController_removeFooterButton__block_invoke;
    v4[3] = &unk_1E6AD41E8;
    v4[4] = self;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __50__CCUIMenuModuleViewController_removeFooterButton__block_invoke_2;
    v3[3] = &unk_1E6AD4480;
    v3[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:v3 completion:0.3];
  }
  if (self->_customContentView)
  {
    if (!self->_customContentViewScrolls) {
      [(UIView *)self->_darkeningBackgroundView removeFromSuperview];
    }
  }
}

void __50__CCUIMenuModuleViewController_removeFooterButton__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1176) = 0;
  id v2 = [*(id *)(a1 + 32) viewIfLoaded];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) viewIfLoaded];
  [v3 layoutIfNeeded];
}

uint64_t __50__CCUIMenuModuleViewController_removeFooterButton__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1168) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1168);
  *(void *)(v2 + 1168) = 0;

  double v4 = *(void **)(a1 + 32);
  return [v4 _updatePreferredContentSize];
}

- (double)headerHeight
{
  id v3 = [(CCUIMenuModuleViewController *)self view];
  [v3 bounds];
  double Width = CGRectGetWidth(v8);

  [(CCUIMenuModuleViewController *)self preferredExpandedContentWidth];
  if (Width >= v5) {
    double v5 = Width;
  }
  [(CCUIMenuModuleViewController *)self headerHeightForWidth:v5];
  return result;
}

- (double)headerHeightForWidth:(double)a3
{
  [(UILabel *)self->_titleLabel frame];
  if (CGRectIsEmpty(v21)) {
    [(CCUIMenuModuleViewController *)self _setupTitleLabel];
  }
  titleLabel = self->_titleLabel;
  [(CCUIMenuModuleViewController *)self _titleWidthForContainerWidth:a3];
  -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:");
  double v7 = v6;
  [(UILabel *)self->_titleLabel _firstLineBaselineOffsetFromBoundsTop];
  double v9 = v7 - v8;
  [(UILabel *)self->_titleLabel _baselineOffsetFromBottom];
  double v11 = v9 - v10;
  if ([(CCUIMenuModuleViewController *)self hasGlyph])
  {
    [(CCUIMenuModuleViewController *)self _shouldHideGlyphForLimitedContentSizeCategory];
    long long v12 = [(UILabel *)self->_titleLabel font];
    [v12 _scaledValueForValue:18.0];
    UIRoundToScale();
    double v14 = v13;
  }
  else
  {
    long long v12 = [(UILabel *)self->_titleLabel font];
    [v12 _scaledValueForValue:66.0];
    double v14 = v11 + v15;
  }

  id v16 = [(UILabel *)self->_subtitleLabel text];

  if (v16)
  {
    [(UILabel *)self->_subtitleLabel frame];
    if (CGRectIsEmpty(v22)) {
      [(CCUIMenuModuleViewController *)self _setupSubtitleLabel];
    }
    long long v17 = [(UILabel *)self->_subtitleLabel font];
    [v17 _scaledValueForValue:5.0];
    double v19 = v18;
    [(UILabel *)self->_subtitleLabel frame];
    double v14 = v14 + v19 + CGRectGetHeight(v23);
  }
  return v14;
}

- (UIView)contentView
{
  [(CCUIMenuModuleViewController *)self loadViewIfNeeded];
  contentView = self->_contentView;
  return contentView;
}

- (BOOL)hasFooterButton
{
  return self->_footerButtonView != 0;
}

- (BOOL)hasGlyph
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIMenuModuleViewController;
  BOOL v3 = [(CCUIButtonModuleViewController *)&v5 hasGlyph];
  if (v3) {
    LOBYTE(v3) = ![(CCUIMenuModuleViewController *)self hideGlyphInHeader];
  }
  return v3;
}

- (void)setCustomContentView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  p_customContentView = &self->_customContentView;
  customContentView = self->_customContentView;
  if (customContentView != v5)
  {
    long long v17 = v5;
    if (customContentView)
    {
      [(UIView *)customContentView removeFromSuperview];
      double v8 = *p_customContentView;
      *p_customContentView = 0;

      objc_super v5 = v17;
      self->_customContentViewScrolls = 0;
    }
    if (v5)
    {
      [(UIStackView *)self->_menuItemsContainer removeFromSuperview];
      [(UIScrollView *)self->_contentScrollView addSubview:v17];
      objc_storeStrong((id *)&self->_customContentView, a3);
      [(CCUIMenuModuleViewController *)self preferredExpandedContentWidth];
      -[CCUIMenuModuleViewController scrollViewContentHeightForWidth:](self, "scrollViewContentHeightForWidth:");
      double v10 = v9;
      [(CCUIMenuModuleViewController *)self preferredExpandedContentHeight];
      double v12 = v11;
      [(CCUIMenuModuleViewController *)self headerHeight];
      double v14 = v12 - v13;
      self->_customContentViewScrolls = v10 > v14;
      if (v10 > v14 || self->_shouldShowFooterButton)
      {
        double v15 = [(UIView *)self->_darkeningBackgroundView superview];
        contentView = self->_contentView;

        objc_super v5 = v17;
        if (v15 == contentView) {
          goto LABEL_12;
        }
        customContentView = (UIView *)[(UIView *)self->_contentView insertSubview:self->_darkeningBackgroundView belowSubview:self->_contentScrollView];
      }
      else
      {
        customContentView = (UIView *)[(UIView *)self->_darkeningBackgroundView removeFromSuperview];
      }
      objc_super v5 = v17;
    }
    else
    {
      [(UIScrollView *)self->_contentScrollView addSubview:self->_menuItemsContainer];
      customContentView = (UIView *)[(UIView *)self->_contentView insertSubview:self->_darkeningBackgroundView belowSubview:self->_contentScrollView];
      objc_super v5 = v17;
      self->_customContentViewScrolls = 0;
    }
  }
LABEL_12:
  MEMORY[0x1F41817F8](customContentView, v5);
}

- (BOOL)prefersContextMenuDisplayStyle
{
  return 0;
}

- (void)viewDidLoad
{
  v55[1] = *MEMORY[0x1E4F143B8];
  v54.receiver = self;
  v54.super_class = (Class)CCUIMenuModuleViewController;
  [(CCUIButtonModuleViewController *)&v54 viewDidLoad];
  BOOL v3 = [(CCUIMenuModuleViewController *)self view];
  double v4 = [(CCUIButtonModuleViewController *)self _templateView];
  if ([(CCUIMenuModuleViewController *)self prefersContextMenuDisplayStyle])
  {
    [v4 setContextMenuDelegate:self];
    objc_super v5 = +[CCUIControlCenterMaterialView controlCenterModuleBackgroundMaterial];
    [v4 setBackgroundView:v5];

    [(CCUIMenuModuleViewController *)self setShouldProvideOwnPlatter:0];
  }
  if (self->_shouldProvideOwnPlatter)
  {
    double v6 = +[CCUIControlCenterMaterialView _darkMaterialView];
    platterMaterialView = self->_platterMaterialView;
    self->_platterMaterialView = v6;

    [(MTMaterialView *)self->_platterMaterialView _setContinuousCornerRadius:CCUIExpandedModuleContinuousCornerRadius()];
    [v3 insertSubview:self->_platterMaterialView atIndex:0];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__CCUIMenuModuleViewController_viewDidLoad__block_invoke;
    aBlock[3] = &unk_1E6AD44A8;
    aBlock[4] = self;
    double v8 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    v8[2](v8, 1);
    v8[2](v8, 2);
  }
  id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [v3 bounds];
  double v10 = (UIView *)objc_msgSend(v9, "initWithFrame:");
  transformView = self->_transformView;
  self->_transformView = v10;

  [v3 insertSubview:self->_transformView belowSubview:v4];
  double v12 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&unk_1F301EE88];
  id v13 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v14 = *MEMORY[0x1E4F1DB28];
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v18 = (UILabel *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], v15, v16, v17);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v18;

  [(UIView *)self->_transformView addSubview:self->_titleLabel];
  [(UILabel *)self->_titleLabel setTextAlignment:1];
  long long v20 = self->_titleLabel;
  CGRect v21 = [(CCUIMenuModuleViewController *)self title];
  [(UILabel *)v20 setText:v21];

  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [v12 automaticallyUpdateView:self->_titleLabel withStyle:0];
  CGRect v22 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v14, v15, v16, v17);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v22;

  [(UIView *)self->_transformView addSubview:self->_subtitleLabel];
  [(UILabel *)self->_subtitleLabel setTextAlignment:1];
  id v24 = self->_subtitleLabel;
  unint64_t v25 = [(CCUIMenuModuleViewController *)self subtitle];
  [(UILabel *)v24 setText:v25];

  [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
  [v12 automaticallyUpdateView:self->_subtitleLabel withStyle:1];
  uint64_t v26 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  headerSeparatorView = self->_headerSeparatorView;
  self->_headerSeparatorView = v26;

  [(UIView *)self->_transformView addSubview:self->_headerSeparatorView];
  [v12 automaticallyUpdateView:self->_headerSeparatorView withStyle:5];
  uint64_t v28 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  footerSeparatorView = self->_footerSeparatorView;
  self->_footerSeparatorView = v28;

  [(UIView *)self->_transformView addSubview:self->_footerSeparatorView];
  [v12 automaticallyUpdateView:self->_footerSeparatorView withStyle:5];
  long long v30 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v14, v15, v16, v17);
  contentView = self->_contentView;
  self->_contentView = v30;

  [(UIView *)self->_transformView insertSubview:self->_contentView belowSubview:self->_footerSeparatorView];
  id v32 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(UIView *)self->_contentView bounds];
  id v33 = (UIView *)objc_msgSend(v32, "initWithFrame:");
  darkeningBackgroundView = self->_darkeningBackgroundView;
  self->_darkeningBackgroundView = v33;

  [(UIView *)self->_contentView addSubview:self->_darkeningBackgroundView];
  [(UIView *)self->_darkeningBackgroundView setAutoresizingMask:18];
  uint64_t v35 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&unk_1F301EEA0];
  [v35 _automaticallyUpdateView:self->_darkeningBackgroundView withStyleNamed:@"moduleListTint" andObserverBlock:0];

  id v36 = objc_alloc(MEMORY[0x1E4FB1BE0]);
  [(UIView *)self->_contentView bounds];
  v37 = (UIScrollView *)objc_msgSend(v36, "initWithFrame:");
  contentScrollView = self->_contentScrollView;
  self->_contentScrollView = v37;

  [(UIScrollView *)self->_contentScrollView setAutoresizingMask:18];
  [(UIScrollView *)self->_contentScrollView setShowsVerticalScrollIndicator:0];
  [(UIView *)self->_contentView addSubview:self->_contentScrollView];
  id v39 = objc_alloc(MEMORY[0x1E4FB1C60]);
  [(UIView *)self->_contentView bounds];
  long long v40 = (UIStackView *)objc_msgSend(v39, "initWithFrame:");
  menuItemsContainer = self->_menuItemsContainer;
  self->_menuItemsContainer = v40;

  [(UIStackView *)self->_menuItemsContainer setAxis:1];
  [(UIScrollView *)self->_contentScrollView addSubview:self->_menuItemsContainer];
  uint64_t v42 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__handlePressGesture_];
  pressGestureRecognizer = self->_pressGestureRecognizer;
  self->_pressGestureRecognizer = v42;

  [(UILongPressGestureRecognizer *)self->_pressGestureRecognizer setDelegate:self];
  [(UILongPressGestureRecognizer *)self->_pressGestureRecognizer setCancelsTouchesInView:0];
  [(UILongPressGestureRecognizer *)self->_pressGestureRecognizer setDelaysTouchesEnded:0];
  [(UILongPressGestureRecognizer *)self->_pressGestureRecognizer setMinimumPressDuration:0.0];
  [(UILongPressGestureRecognizer *)self->_pressGestureRecognizer _setKeepTouchesOnContinuation:1];
  long long v44 = self->_pressGestureRecognizer;
  long long v45 = [(UIScrollView *)self->_contentScrollView panGestureRecognizer];
  [(UILongPressGestureRecognizer *)v44 requireGestureRecognizerToFail:v45];

  [v3 addGestureRecognizer:self->_pressGestureRecognizer];
  id v46 = objc_alloc(MEMORY[0x1E4FB1C18]);
  long long v47 = [MEMORY[0x1E4FB2290] lightConfiguration];
  long long v48 = (UISelectionFeedbackGenerator *)[v46 initWithConfiguration:v47 view:v3];
  feedbackGenerator = self->_feedbackGenerator;
  self->_feedbackGenerator = v48;

  long long v50 = self;
  v55[0] = v50;
  long long v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
  id v52 = (id)[(CCUIMenuModuleViewController *)self registerForTraitChanges:v51 withAction:sel__contentSizeCategoryDidChange];

  [(CCUIMenuModuleViewController *)self _contentSizeCategoryDidChange];
  [(CCUIMenuModuleViewController *)self _fadeViewsForExpandedState:[(CCUIButtonModuleViewController *)self isExpanded]];
}

void __43__CCUIMenuModuleViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2)
{
  double v4 = [*(id *)(*(void *)(a1 + 32) + 1064) visualStylingProviderForCategory:a2];
  if (v4)
  {
    id v10 = v4;
    objc_super v5 = *(void **)(*(void *)(a1 + 32) + 1072);
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v7 = *(void *)(a1 + 32);
      double v8 = *(void **)(v7 + 1072);
      *(void *)(v7 + 1072) = v6;

      objc_super v5 = *(void **)(*(void *)(a1 + 32) + 1072);
    }
    id v9 = [NSNumber numberWithInteger:a2];
    [v5 setObject:v10 forKey:v9];

    double v4 = v10;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIMenuModuleViewController;
  [(CCUIMenuModuleViewController *)&v4 viewWillAppear:a3];
  if ([(CCUIMenuModuleViewController *)self isAlwaysExpanded]) {
    [(CCUIMenuModuleViewController *)self willTransitionToExpandedContentMode:1];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIMenuModuleViewController;
  [(CCUIMenuModuleViewController *)&v4 viewDidAppear:a3];
  if ([(CCUIMenuModuleViewController *)self isAlwaysExpanded]) {
    [(CCUIMenuModuleViewController *)self didTransitionToExpandedContentMode:1];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIMenuModuleViewController;
  [(CCUIMenuModuleViewController *)&v4 viewWillDisappear:a3];
  if ([(CCUIMenuModuleViewController *)self isAlwaysExpanded]) {
    [(CCUIMenuModuleViewController *)self willTransitionToExpandedContentMode:0];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIMenuModuleViewController;
  [(CCUIMenuModuleViewController *)&v4 viewDidDisappear:a3];
  if ([(CCUIMenuModuleViewController *)self isAlwaysExpanded]) {
    [(CCUIMenuModuleViewController *)self didTransitionToExpandedContentMode:0];
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CCUIMenuModuleViewController;
  [(CCUIButtonModuleViewController *)&v3 viewWillLayoutSubviews];
  [(CCUIMenuModuleViewController *)self _setupTitleLabel];
  [(CCUIMenuModuleViewController *)self _setupSubtitleLabel];
  [(CCUIMenuModuleViewController *)self _layoutViewSubviews];
}

- (void)_layoutViewSubviews
{
  objc_super v3 = [(CCUIMenuModuleViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[CCUIMenuModuleViewController _layoutGlyphViewForSize:](self, "_layoutGlyphViewForSize:", v9, v11);
  -[MTMaterialView setFrame:](self->_platterMaterialView, "setFrame:", v5, v7, v9, v11);
  [(CCUIMenuModuleViewController *)self preferredExpandedContentWidth];
  double v13 = v12;
  [(CCUIMenuModuleViewController *)self preferredExpandedContentHeight];
  double v15 = v14;
  [(CCUIMenuModuleViewController *)self _forceLimitContentSizeCategoryFromContentHeightIfNecessary:[(CCUIButtonModuleViewController *)self isExpanded] expanded:v14];
  -[CCUIMenuModuleViewController _layoutTransformViewForSize:](self, "_layoutTransformViewForSize:", v13, v15);
  -[CCUIMenuModuleViewController _layoutTitleLabelForSize:](self, "_layoutTitleLabelForSize:", v13, v15);
  -[CCUIMenuModuleViewController _layoutSubtitleLabelForSize:](self, "_layoutSubtitleLabelForSize:", v13, v15);
  -[CCUIMenuModuleViewController _layoutBusyIndicatorForSize:](self, "_layoutBusyIndicatorForSize:", v13, v15);
  -[CCUIMenuModuleViewController _layoutHeaderSeparatorForSize:](self, "_layoutHeaderSeparatorForSize:", v13, v15);
  -[CCUIMenuModuleViewController _layoutContentViewForSize:](self, "_layoutContentViewForSize:", v13, v15);
  -[CCUIMenuModuleViewController _layoutFooterSeparatorForSize:](self, "_layoutFooterSeparatorForSize:", v13, v15);
  -[CCUIMenuModuleViewController _layoutFooterButtonForSize:](self, "_layoutFooterButtonForSize:", v13, v15);
  BOOL v16 = [(CCUIButtonModuleViewController *)self isExpanded];
  [(CCUIMenuModuleViewController *)self _fadeViewsForExpandedState:v16];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CCUIMenuModuleViewController;
  id v7 = a4;
  -[CCUIMenuModuleViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__CCUIMenuModuleViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6AD44D0;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

uint64_t __83__CCUIMenuModuleViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutViewSubviews];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v15.receiver = self;
  v15.super_class = (Class)CCUIMenuModuleViewController;
  [(CCUIMenuModuleViewController *)&v15 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3 && !self->_shouldProvideOwnPlatter)
  {
    double v6 = [(CCUIMenuModuleViewController *)self view];
    id v7 = [v6 visualStylingProviderForCategory:1];

    double v8 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&unk_1F301EE88];
    objc_super v9 = v8;
    if (v8 != v7)
    {
      [v8 stopAutomaticallyUpdatingView:self->_titleLabel];
      [v9 stopAutomaticallyUpdatingView:self->_subtitleLabel];
      [v9 stopAutomaticallyUpdatingView:self->_headerSeparatorView];
      [v9 stopAutomaticallyUpdatingView:self->_footerSeparatorView];
      if (v7)
      {
        [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders setObject:v7 forKey:&unk_1F301EE88];
        [v7 automaticallyUpdateView:self->_titleLabel withStyle:0];
        [v7 automaticallyUpdateView:self->_subtitleLabel withStyle:1];
        [v7 automaticallyUpdateView:self->_headerSeparatorView withStyle:5];
        [v7 automaticallyUpdateView:self->_footerSeparatorView withStyle:5];
      }
    }
    double v10 = [(CCUIMenuModuleViewController *)self view];
    double v11 = [v10 visualStylingProviderForCategory:2];

    double v12 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders objectForKey:&unk_1F301EEA0];
    double v13 = v12;
    if (v12 != v11)
    {
      [v12 stopAutomaticallyUpdatingView:self->_darkeningBackgroundView];
      if (v11)
      {
        [(NSMutableDictionary *)self->_categoriesToVisualStylingProviders setObject:v11 forKey:&unk_1F301EEA0];
        [v11 _automaticallyUpdateView:self->_darkeningBackgroundView withStyleNamed:@"moduleListTint" andObserverBlock:0];
      }
    }
    double v14 = [(CCUIMenuModuleViewController *)self view];
    [v14 setNeedsLayout];
  }
}

- (BOOL)_canShowWhileLocked
{
  uint64_t v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (void)setTitle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIMenuModuleViewController;
  id v4 = a3;
  [(CCUIButtonModuleViewController *)&v5 setTitle:v4];
  -[UILabel setText:](self->_titleLabel, "setText:", v4, v5.receiver, v5.super_class);
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
  id v5 = a3;
  [(UILabel *)self->_subtitleLabel setText:v5];
}

- (void)scrollToTop:(BOOL)a3
{
}

- (double)_maximumHeight
{
  double v2 = CCUIExpandedModuleEdgeInsets();
  double v4 = v3;
  v6.origin.x = CCUIScreenBounds();
  return CGRectGetHeight(v6) - v2 - v4;
}

- (double)_desiredExpandedHeight
{
  [(CCUIMenuModuleViewController *)self preferredExpandedContentWidth];
  -[CCUIMenuModuleViewController preferredExpandedContentHeightWithWidth:](self, "preferredExpandedContentHeightWithWidth:");
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)contentModuleWillTransitionToExpandedContentMode:(BOOL)a3
{
  feedbackGenerator = self->_feedbackGenerator;
  if (a3) {
    [(UISelectionFeedbackGenerator *)feedbackGenerator userInteractionStarted];
  }
  else {
    [(UISelectionFeedbackGenerator *)feedbackGenerator userInteractionEnded];
  }
}

- (double)preferredExpandedContentHeight
{
  [(CCUIMenuModuleViewController *)self _maximumHeight];
  double v4 = v3;
  [(CCUIMenuModuleViewController *)self _desiredExpandedHeight];
  if (v4 < result) {
    return v4;
  }
  return result;
}

- (double)preferredExpandedContentHeightWithWidth:(double)a3
{
  -[CCUIMenuModuleViewController headerHeightForWidth:](self, "headerHeightForWidth:");
  [(CCUIMenuModuleViewController *)self scrollViewContentHeightForWidth:a3];
  [(CCUIMenuModuleViewController *)self _footerHeight];
  id v5 = [(CCUIMenuModuleViewController *)self view];
  UIRoundToViewScale();
  double v7 = v6;

  return v7;
}

- (BOOL)shouldPerformClickInteraction
{
  return ![(CCUIMenuModuleViewController *)self prefersContextMenuDisplayStyle];
}

- (BOOL)_forceLimitContentSizeCategoryFromContentHeightIfNecessary:(double)a3 expanded:(BOOL)a4
{
  if (self->_forceLimitContentSizeCategory || !a4) {
    return 0;
  }
  [(CCUIMenuModuleViewController *)self _aggregateModuleHeight];
  if (v7 <= a3) {
    return 0;
  }
  return [(CCUIMenuModuleViewController *)self _setForceLimitContentSizeCategory:1];
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CCUIMenuModuleViewController;
  -[CCUIButtonModuleViewController willTransitionToExpandedContentMode:](&v7, sel_willTransitionToExpandedContentMode_);
  if (!v3) {
    self->_allowsMenuInteraction = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__CCUIMenuModuleViewController_willTransitionToExpandedContentMode___block_invoke;
  v5[3] = &unk_1E6AD42F0;
  v5[4] = self;
  BOOL v6 = v3;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v5];
  [(CCUIMenuModuleViewController *)self preferredExpandedContentHeight];
  if (-[CCUIMenuModuleViewController _forceLimitContentSizeCategoryFromContentHeightIfNecessary:expanded:](self, "_forceLimitContentSizeCategoryFromContentHeightIfNecessary:expanded:", v3))
  {
    [(CCUIMenuModuleItemView *)self->_footerButtonView layoutIfNeeded];
  }
  [(CCUIMenuModuleViewController *)self _setRootViewClipsToBounds:v3];
  [(CCUIMenuModuleViewController *)self _setTransformViewClipsToBounds:0];
}

uint64_t __68__CCUIMenuModuleViewController_willTransitionToExpandedContentMode___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) buttonView];
  [v2 setHighlighted:0];

  BOOL v3 = [*(id *)(a1 + 32) buttonView];
  [v3 setUserInteractionEnabled:*(unsigned char *)(a1 + 40) == 0];

  double v4 = *(void **)(*(void *)(a1 + 32) + 1104);
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  return objc_msgSend(v4, "setContentOffset:", v5, v6);
}

- (void)didTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CCUIMenuModuleViewController;
  -[CCUIButtonModuleViewController didTransitionToExpandedContentMode:](&v6, sel_didTransitionToExpandedContentMode_);
  if (v3)
  {
    self->_allowsMenuInteraction = 1;
    [(CCUIMenuModuleViewController *)self _setRootViewClipsToBounds:0];
    [(CCUIMenuModuleViewController *)self _setTransformViewClipsToBounds:1];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __67__CCUIMenuModuleViewController_didTransitionToExpandedContentMode___block_invoke;
    v5[3] = &unk_1E6AD41E8;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v5];
  }
}

uint64_t __67__CCUIMenuModuleViewController_didTransitionToExpandedContentMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMenuItems:MEMORY[0x1E4F1CBF0]];
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return [(CCUIMenuModuleViewController *)self menuItemCount] || self->_customContentView != 0;
}

- (void)setGlyphImage:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIMenuModuleViewController;
  [(CCUIButtonModuleViewController *)&v4 setGlyphImage:a3];
  [(CCUIMenuModuleViewController *)self _updateTitleFont];
  [(CCUIMenuModuleViewController *)self _updateSubtitleFont];
}

- (void)setGlyphPackageDescription:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIMenuModuleViewController;
  [(CCUIButtonModuleViewController *)&v4 setGlyphPackageDescription:a3];
  [(CCUIMenuModuleViewController *)self _updateTitleFont];
  [(CCUIMenuModuleViewController *)self _updateSubtitleFont];
}

- (BOOL)showsMenuAsPrimaryAction
{
  return 0;
}

- (NSString)menuDisplayName
{
  return (NSString *)&stru_1F3016698;
}

- (id)contextMenuItems
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v2 = [(CCUIMenuModuleViewController *)self mostRecentMenuItems];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v9 = [v8 isSelected];
        double v10 = (void *)MEMORY[0x1E4FB13F0];
        double v11 = [v8 title];
        double v12 = [v8 image];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __48__CCUIMenuModuleViewController_contextMenuItems__block_invoke;
        v19[3] = &unk_1E6AD44F8;
        v19[4] = v8;
        double v13 = [v10 actionWithTitle:v11 image:v12 identifier:0 handler:v19];

        [v13 setState:v9];
        double v14 = [v8 subtitle];

        if (v14)
        {
          objc_super v15 = [v8 subtitle];
          [v13 setSubtitle:v15];
        }
        BOOL v16 = [[CCUIContextMenuItem alloc] initWithMenuElement:v13];
        [v3 addObject:v16];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }

  return v3;
}

uint64_t __48__CCUIMenuModuleViewController_contextMenuItems__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAction];
}

- (UIMenu)contextMenu
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v2 = [(CCUIMenuModuleViewController *)self mostRecentMenuItems];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v9 = [v8 isSelected];
        double v10 = (void *)MEMORY[0x1E4FB13F0];
        double v11 = [v8 title];
        double v12 = [v8 image];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __43__CCUIMenuModuleViewController_contextMenu__block_invoke;
        v19[3] = &unk_1E6AD44F8;
        v19[4] = v8;
        double v13 = [v10 actionWithTitle:v11 image:v12 identifier:0 handler:v19];

        [v13 setState:v9];
        double v14 = [v8 subtitle];

        if (v14)
        {
          objc_super v15 = [v8 subtitle];
          [v13 setSubtitle:v15];
        }
        [v3 addObject:v13];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }

  if ([v3 count])
  {
    BOOL v16 = [MEMORY[0x1E4FB1970] menuWithChildren:v3];
  }
  else
  {
    BOOL v16 = 0;
  }

  return (UIMenu *)v16;
}

uint64_t __43__CCUIMenuModuleViewController_contextMenu__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAction];
}

- (void)_handleActionTapped:(id)a3
{
  id v4 = a3;
  if (self->_allowsMenuInteraction)
  {
    id v9 = v4;
    uint64_t v5 = [v4 menuItem];
    int v6 = [v5 performAction];

    id v4 = v9;
    if (v6)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_contentModuleContext);

      if (WeakRetained)
      {
        id v8 = objc_loadWeakRetained((id *)&self->_contentModuleContext);
        [v8 dismissModule];
      }
      else
      {
        [(CCUIMenuModuleViewController *)self dismissViewControllerAnimated:1 completion:0];
      }
      id v4 = v9;
    }
  }
}

- (void)_fadeViewsForExpandedState:(BOOL)a3
{
  titleLabel = self->_titleLabel;
  if (a3)
  {
    double v5 = 1.0;
    [(UILabel *)titleLabel setAlpha:1.0];
    [(UILabel *)self->_subtitleLabel setAlpha:1.0];
    headerSeparatorView = self->_headerSeparatorView;
    p_contentView = (void **)&self->_contentView;
    [(UIView *)self->_contentView bounds];
    [(UIView *)headerSeparatorView setAlpha:(double)!CGRectIsEmpty(v11)];
    [(UIView *)self->_footerSeparatorView setAlpha:(double)[(CCUIMenuModuleViewController *)self _shouldShowFooterSeparator]];
    LOBYTE(v8) = self->_shouldShowFooterButton;
    [(CCUIMenuModuleItemView *)self->_footerButtonView setAlpha:(double)v8];
  }
  else
  {
    double v5 = 0.0;
    [(UILabel *)titleLabel setAlpha:0.0];
    [(UILabel *)self->_subtitleLabel setAlpha:0.0];
    [(UIView *)self->_headerSeparatorView setAlpha:0.0];
    [(UIView *)self->_footerSeparatorView setAlpha:0.0];
    [(CCUIMenuModuleItemView *)self->_footerButtonView setAlpha:0.0];
    [(UIView *)self->_contentView setAlpha:0.0];
    p_contentView = (void **)&self->_busyIndicatorView;
  }
  id v9 = *p_contentView;
  [v9 setAlpha:v5];
}

- (void)_layoutTransformViewForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int v6 = [(CCUIMenuModuleViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  if ([(CCUIButtonModuleViewController *)self isExpanded])
  {
    transformView = self->_transformView;
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v21 = *MEMORY[0x1E4F1DAB8];
    long long v22 = v16;
    long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v17 = (CGAffineTransform *)&v21;
  }
  else
  {
    v25.origin.x = v8;
    v25.origin.y = v10;
    v25.size.double width = v12;
    v25.size.double height = v14;
    CGFloat v18 = CGRectGetWidth(v25) / width;
    v26.origin.x = v8;
    v26.origin.y = v10;
    v26.size.double width = v12;
    v26.size.double height = v14;
    CGFloat v19 = CGRectGetHeight(v26);
    long long v20 = self->_transformView;
    CGAffineTransformMakeScale(&v24, v18, v19 / height);
    double v17 = &v24;
    transformView = v20;
  }
  -[UIView setTransform:](transformView, "setTransform:", v17, v21, v22, v23);
  -[UIView setFrame:](self->_transformView, "setFrame:", v8, v10, v12, v14);
}

- (void)_layoutGlyphViewForSize:(CGSize)a3
{
  id v4 = [(CCUIButtonModuleViewController *)self buttonView];
  BOOL v5 = [(CCUIButtonModuleViewController *)self isExpanded];
  double v6 = 1.0;
  if (v5)
  {
    BOOL v7 = [(CCUIMenuModuleViewController *)self _shouldHideGlyphForLimitedContentSizeCategory];
    double v6 = 0.0;
    if (!v7) {
      double v6 = (double)([(CCUIMenuModuleViewController *)self hideGlyphInHeader] ^ 1);
    }
  }
  [v4 setAlpha:v6];

  if ([(CCUIButtonModuleViewController *)self isExpanded])
  {
    double v8 = [(CCUIMenuModuleViewController *)self view];
    [v8 bounds];
    CGRectGetWidth(v20);

    UIRectIntegralWithScale();
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    id v18 = [(CCUIButtonModuleViewController *)self buttonView];
    objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);
  }
  else
  {
    id v18 = [(CCUIButtonModuleViewController *)self buttonView];
    double v17 = [(CCUIMenuModuleViewController *)self view];
    [v17 bounds];
    objc_msgSend(v18, "setFrame:");
  }
}

- (void)_layoutTitleLabelForSize:(CGSize)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__CCUIMenuModuleViewController__layoutTitleLabelForSize___block_invoke;
  v3[3] = &unk_1E6AD4520;
  v3[4] = self;
  CGSize v4 = a3;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

uint64_t __57__CCUIMenuModuleViewController__layoutTitleLabelForSize___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1024) frame];
  double v3 = v2;
  int v4 = [*(id *)(a1 + 32) hasGlyph];
  BOOL v5 = *(id **)(a1 + 32);
  if (v4)
  {
    double v6 = [v5 buttonView];
    [v6 alpha];
    BSFloatIsZero();
    BOOL v7 = [*(id *)(*(void *)(a1 + 32) + 1024) font];
    [v7 _scaledValueForValue:18.0];
    [*(id *)(*(void *)(a1 + 32) + 1024) _firstLineBaselineOffsetFromBoundsTop];
    UIRoundToScale();
    double v9 = v8;
  }
  else
  {
    double v6 = [v5[128] font];
    [v6 _scaledValueForValue:40.0];
    double v11 = v10;
    [*(id *)(*(void *)(a1 + 32) + 1024) _firstLineBaselineOffsetFromBoundsTop];
    double v9 = v11 - v12;
  }

  double v13 = *(void **)(*(void *)(a1 + 32) + 1024);
  double v14 = *(double *)(a1 + 40);
  return objc_msgSend(v13, "setFrame:", 0.0, v9, v14, v3);
}

- (void)_layoutSubtitleLabelForSize:(CGSize)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__CCUIMenuModuleViewController__layoutSubtitleLabelForSize___block_invoke;
  v3[3] = &unk_1E6AD4520;
  v3[4] = self;
  CGSize v4 = a3;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

uint64_t __60__CCUIMenuModuleViewController__layoutSubtitleLabelForSize___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1032) frame];
  double v3 = v2;
  [*(id *)(*(void *)(a1 + 32) + 1024) frame];
  double MaxY = CGRectGetMaxY(v12);
  BOOL v5 = [*(id *)(*(void *)(a1 + 32) + 1032) font];
  [v5 _scaledValueForValue:5.0];
  double v7 = MaxY + v6;

  double v8 = *(void **)(*(void *)(a1 + 32) + 1032);
  double v9 = *(double *)(a1 + 40);
  return objc_msgSend(v8, "setFrame:", 0.0, v7, v9, v3);
}

- (void)_layoutFooterButtonForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self->_shouldShowFooterButton)
  {
    [(CCUIMenuModuleItemView *)self->_footerButtonView intrinsicContentSize];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }
  footerButtonView = self->_footerButtonView;
  -[CCUIMenuModuleItemView setFrame:](footerButtonView, "setFrame:", 0.0, height - v7, width);
}

- (void)_layoutBusyIndicatorForSize:(CGSize)a3
{
  if (self->_busyIndicatorView)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __60__CCUIMenuModuleViewController__layoutBusyIndicatorForSize___block_invoke;
    v3[3] = &unk_1E6AD4520;
    v3[4] = self;
    CGSize v4 = a3;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
  }
}

uint64_t __60__CCUIMenuModuleViewController__layoutBusyIndicatorForSize___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) buttonView];
  [v2 frame];

  double v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v3 userInterfaceLayoutDirection];

  UIRectIntegralWithScale();
  CGSize v4 = *(void **)(*(void *)(a1 + 32) + 1120);
  return objc_msgSend(v4, "setFrame:");
}

- (void)_layoutHeaderSeparatorForSize:(CGSize)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__CCUIMenuModuleViewController__layoutHeaderSeparatorForSize___block_invoke;
  v3[3] = &unk_1E6AD4520;
  CGSize v4 = a3;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

uint64_t __62__CCUIMenuModuleViewController__layoutHeaderSeparatorForSize___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  [*(id *)(a1 + 32) headerHeightForWidth:*(double *)(a1 + 40)];
  if (v2 >= v3) {
    double v2 = v3;
  }
  double v4 = *(double *)(a1 + 40);
  [*(id *)(a1 + 32) _separatorHeight];
  double v6 = *(void **)(*(void *)(a1 + 32) + 1048);
  return objc_msgSend(v6, "setFrame:", 0.0, v2, v4, v5);
}

- (void)_layoutFooterSeparatorForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CCUIMenuModuleViewController *)self _footerHeight];
  double v7 = height - v6;
  [(CCUIMenuModuleViewController *)self _separatorHeight];
  footerSeparatorView = self->_footerSeparatorView;
  -[UIView setFrame:](footerSeparatorView, "setFrame:", 0.0, v7, width, v8);
}

- (double)_titleWidthForContainerWidth:(double)a3
{
  return a3 + -20.0;
}

- (double)_contentScaleForSize:(CGSize)a3
{
  double width = a3.width;
  double v5 = 1.0;
  if (![(CCUIButtonModuleViewController *)self isExpanded])
  {
    [(UIView *)self->_contentView bounds];
    if (!CGRectIsEmpty(v8))
    {
      double v6 = [(CCUIMenuModuleViewController *)self view];
      [v6 bounds];
      double v5 = width / CGRectGetWidth(v9);
    }
  }
  return v5;
}

- (void)_setView:(id)a3 clipsToBounds:(BOOL)a4
{
  id v5 = a3;
  double v6 = (void *)MEMORY[0x1E4FB1EB0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__CCUIMenuModuleViewController__setView_clipsToBounds___block_invoke;
  v8[3] = &unk_1E6AD42F0;
  id v9 = v5;
  BOOL v10 = a4;
  id v7 = v5;
  [v6 performWithoutAnimation:v8];
}

void __55__CCUIMenuModuleViewController__setView_clipsToBounds___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setClipsToBounds:*(unsigned __int8 *)(a1 + 40)];
  double v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = CCUIExpandedModuleContinuousCornerRadius();
  }
  else {
    double v3 = 0.0;
  }
  [v2 _setContinuousCornerRadius:v3];
  double v4 = [*(id *)(a1 + 32) layer];
  id v6 = v4;
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v5 = 12;
  }
  else {
    uint64_t v5 = 0;
  }
  [v4 setMaskedCorners:v5];
}

- (void)_setRootViewClipsToBounds:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CCUIMenuModuleViewController *)self view];
  [(CCUIMenuModuleViewController *)self _setView:v5 clipsToBounds:v3];
}

- (void)_setTransformViewClipsToBounds:(BOOL)a3
{
}

- (void)_layoutContentViewForSize:(CGSize)a3
{
  double width = a3.width;
  [(CCUIMenuModuleViewController *)self headerHeight];
  [(CCUIMenuModuleViewController *)self _footerHeight];
  [(CCUIMenuModuleViewController *)self _menuItemsHeightForWidth:width];
  double v6 = v5;
  UIRectIntegralWithScale();
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  -[UIView setFrame:](self->_contentView, "setFrame:");
  -[UIStackView setFrame:](self->_menuItemsContainer, "setFrame:", 0.0, 0.0, width, v6);
  if (self->_customContentView)
  {
    [(CCUIMenuModuleViewController *)self scrollViewContentHeightForWidth:width];
    double v6 = v15;
  }
  -[UIScrollView setContentSize:](self->_contentScrollView, "setContentSize:", width, v6);
  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.double width = v12;
  v21.size.double height = v14;
  [(UIScrollView *)self->_contentScrollView setScrollEnabled:v6 > CGRectGetHeight(v21)];
  customContentView = self->_customContentView;
  if (customContentView)
  {
    [(UIView *)customContentView frame];
    double v17 = self->_customContentView;
    double v18 = *MEMORY[0x1E4F1DAD8];
    double v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    -[UIView setFrame:](v17, "setFrame:", v18, v19);
  }
}

- (void)_setupTitleLabel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__CCUIMenuModuleViewController__setupTitleLabel__block_invoke;
  v2[3] = &unk_1E6AD41E8;
  void v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

uint64_t __48__CCUIMenuModuleViewController__setupTitleLabel__block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)v2[128];
  [v2 preferredExpandedContentWidth];
  objc_msgSend(v2, "_titleWidthForContainerWidth:");
  objc_msgSend(v3, "sizeThatFits:");
  double v6 = *(void **)(*(void *)(a1 + 32) + 1024);
  return objc_msgSend(v6, "setBounds:", 0.0, 0.0, v4, v5);
}

- (void)_setupSubtitleLabel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51__CCUIMenuModuleViewController__setupSubtitleLabel__block_invoke;
  v2[3] = &unk_1E6AD41E8;
  void v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

uint64_t __51__CCUIMenuModuleViewController__setupSubtitleLabel__block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)v2[129];
  [v2 preferredExpandedContentWidth];
  objc_msgSend(v2, "_titleWidthForContainerWidth:");
  objc_msgSend(v3, "sizeThatFits:");
  double v6 = *(void **)(*(void *)(a1 + 32) + 1032);
  return objc_msgSend(v6, "setBounds:", 0.0, 0.0, v4, v5);
}

- (void)_updateMenuItemsSeparatorVisiblity
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v2 = [(UIStackView *)self->_menuItemsContainer arrangedSubviews];
  BOOL v3 = [v2 reverseObjectEnumerator];
  double v4 = [v3 allObjects];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    double v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        CGFloat v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v10 isHidden] & 1) == 0)
        {
          id v11 = v7;
          if (!v7) {
            id v11 = v10;
          }
          [v10 setSeparatorVisible:v7 != 0];
          double v7 = v11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    double v7 = 0;
  }
}

- (BOOL)_toggleSelectionForMenuItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v4 = (CCUIMenuModuleItemView *)a3;
  footerButtonView = self->_footerButtonView;
  if (v4)
  {
    BOOL v6 = footerButtonView == v4;
    if (v6 == [(CCUIMenuModuleItemView *)footerButtonView isHighlighted])
    {
      char v7 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v6 = 0;
    char v7 = 0;
    if (([(CCUIMenuModuleItemView *)footerButtonView isHighlighted] & 1) == 0) {
      goto LABEL_6;
    }
  }
  [(CCUIMenuModuleItemView *)self->_footerButtonView setHighlighted:v6];
  char v7 = 1;
LABEL_6:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(UIStackView *)self->_menuItemsContainer arrangedSubviews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(CCUIMenuModuleItemView **)(*((void *)&v15 + 1) + 8 * i);
        if ([(CCUIMenuModuleItemView *)v13 isHighlighted] != (v13 == v4))
        {
          [(CCUIMenuModuleItemView *)v13 setHighlighted:v13 == v4];
          char v7 = 1;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7 & 1;
}

- (void)_handlePressGesture:(id)a3
{
  id v30 = a3;
  if ([v30 state] == 1)
  {
    BOOL v4 = [(CCUIButtonModuleViewController *)self isExpanded];
    self->_ignoreMenuItemAtTouchLocationAfterExpanded = !v4;
    if (!v4)
    {
      pressGestureRecognizer = self->_pressGestureRecognizer;
      BOOL v6 = [(CCUIMenuModuleViewController *)self view];
      char v7 = [v6 window];
      [(UILongPressGestureRecognizer *)pressGestureRecognizer locationInView:v7];
      self->_touchLocationToIgnore.x = v8;
      self->_touchLocationToIgnore.y = v9;
    }
  }
  uint64_t v10 = [(CCUIMenuModuleViewController *)self view];
  [v30 locationInView:v10];
  double v12 = v11;
  double v14 = v13;

  long long v15 = [(CCUIMenuModuleViewController *)self view];
  long long v16 = objc_msgSend(v15, "hitTest:withEvent:", 0, v12, v14);
  long long v17 = self;
  id v18 = v16;
  if (v17)
  {
    if (objc_opt_isKindOfClass()) {
      double v19 = v18;
    }
    else {
      double v19 = 0;
    }
  }
  else
  {
    double v19 = 0;
  }
  id v20 = v19;

  if (self->_allowsMenuInteraction)
  {
    if (self->_ignoreMenuItemAtTouchLocationAfterExpanded)
    {
      CGRect v21 = [(CCUIMenuModuleViewController *)self view];
      long long v22 = [(CCUIMenuModuleViewController *)self view];
      long long v23 = [v22 window];
      objc_msgSend(v21, "convertPoint:fromView:", v23, self->_touchLocationToIgnore.x, self->_touchLocationToIgnore.y);
      double v25 = v24;
      double v27 = v26;

      uint64_t v28 = [(CCUIMenuModuleViewController *)self view];
      objc_msgSend(v28, "hitTest:withEvent:", 0, v25, v27);
      id v29 = (id)objc_claimAutoreleasedReturnValue();

      if (!v20) {
        goto LABEL_15;
      }
    }
    else
    {
      id v29 = 0;
      if (!v20) {
        goto LABEL_15;
      }
    }
    if (v20 == v29)
    {
LABEL_20:

      goto LABEL_21;
    }
LABEL_15:
    self->_ignoreMenuItemAtTouchLocationAfterExpanded = 0;
    if ([(CCUIMenuModuleViewController *)self _toggleSelectionForMenuItem:v20]) {
      [(UISelectionFeedbackGenerator *)self->_feedbackGenerator selectionChanged];
    }
    if (v20 && [v30 state] == 3) {
      [(CCUIMenuModuleViewController *)self _handleActionTapped:v20];
    }
    goto LABEL_20;
  }
LABEL_21:
}

- (double)_separatorHeight
{
  double v2 = [(CCUIMenuModuleViewController *)self traitCollection];
  BOOL v3 = [v2 preferredContentSizeCategory];
  double v4 = 1.0;
  if (!UIContentSizeCategoryIsAccessibilityCategory(v3))
  {
    uint64_t v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v5 scale];
    double v4 = v6;
  }
  return 1.0 / v4;
}

- (id)_titleFont
{
  if ([(CCUIMenuModuleViewController *)self _shouldLimitContentSizeCategory])
  {
    id v3 = (id)*MEMORY[0x1E4FB2790];
  }
  else
  {
    double v4 = [(CCUIMenuModuleViewController *)self traitCollection];
    id v3 = [v4 preferredContentSizeCategory];
  }
  BOOL v5 = [(CCUIMenuModuleViewController *)self hasGlyph];
  double v6 = (void *)MEMORY[0x1E4FB2908];
  if (v5)
  {
    uint64_t v7 = 8;
  }
  else
  {
    double v6 = (void *)MEMORY[0x1E4FB2998];
    uint64_t v7 = 4;
  }
  CGFloat v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", *v6, v7, v3);

  return v8;
}

- (id)_subtitleFont
{
  if ([(CCUIMenuModuleViewController *)self _shouldLimitContentSizeCategory])
  {
    id v3 = (id)*MEMORY[0x1E4FB2790];
  }
  else
  {
    double v4 = [(CCUIMenuModuleViewController *)self traitCollection];
    id v3 = [v4 preferredContentSizeCategory];
  }
  if ([(CCUIMenuModuleViewController *)self hasGlyph]) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = 1;
  }
  double v6 = objc_msgSend(MEMORY[0x1E4FB08E0], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", *MEMORY[0x1E4FB2950], v5, v3);

  return v6;
}

- (BOOL)_shouldLimitContentSizeCategory
{
  id v3 = [(CCUIMenuModuleViewController *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];

  BOOL v5 = (self->_forceLimitContentSizeCategory
     || (unint64_t)([(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation] - 3) <= 1)
    && UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E4FB2790]) == NSOrderedDescending;

  return v5;
}

- (BOOL)_shouldHideGlyphForLimitedContentSizeCategory
{
  BOOL v2 = [(CCUIMenuModuleViewController *)self _shouldLimitContentSizeCategory];
  if (v2) {
    LOBYTE(v2) = (unint64_t)([(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation] - 3) < 2;
  }
  return v2;
}

- (id)_preferredFontForTextStyle:(id)a3 hiFontStyle:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(CCUIMenuModuleViewController *)self traitCollection];
  CGFloat v8 = [v7 preferredContentSizeCategory];

  if ([(CCUIMenuModuleViewController *)self _shouldLimitContentSizeCategory])
  {
    id v9 = (id)*MEMORY[0x1E4FB2790];

    CGFloat v8 = v9;
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4FB08E0], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", v6, a4, v8);

  return v10;
}

- (double)_defaultMenuItemHeight
{
  BOOL v2 = [(CCUIMenuModuleViewController *)self traitCollection];
  id v3 = [v2 preferredContentSizeCategory];

  +[CCUIMenuModuleItemView defaultMenuItemHeightForContentSizeCategory:v3];
  double v5 = v4;

  return v5;
}

- (double)scrollViewContentHeightForWidth:(double)a3
{
  customContentView = self->_customContentView;
  if (customContentView)
  {
    [(UIView *)customContentView frame];
    return CGRectGetHeight(*(CGRect *)&v5);
  }
  else if (self->_visibleMenuItems <= 0.0)
  {
    [(CCUIMenuModuleViewController *)self _menuItemsHeightForWidth:a3];
  }
  else
  {
    [(CCUIMenuModuleViewController *)self _defaultMenuItemHeight];
    double v11 = v10;
    [(CCUIMenuModuleViewController *)self visibleMenuItems];
    return v11 * v12;
  }
  return result;
}

- (double)_menuItemsHeightForWidth:(double)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(UIStackView *)self->_menuItemsContainer arrangedSubviews];
  uint64_t v6 = [v5 count];

  if (!v6) {
    return 0.0;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [(UIStackView *)self->_menuItemsContainer arrangedSubviews];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        double v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (([v13 isHidden] & 1) == 0)
        {
          objc_msgSend(v13, "sizeThatFits:", a3, 0.0);
          double v11 = v11 + v14;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

- (BOOL)_setForceLimitContentSizeCategory:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL forceLimitContentSizeCategory = self->_forceLimitContentSizeCategory;
  if (forceLimitContentSizeCategory != a3)
  {
    self->_BOOL forceLimitContentSizeCategory = a3;
    titleLabel = self->_titleLabel;
    uint64_t v7 = [(CCUIMenuModuleViewController *)self _titleFont];
    [(UILabel *)titleLabel setFont:v7];

    subtitleLabel = self->_subtitleLabel;
    uint64_t v9 = [(CCUIMenuModuleViewController *)self _subtitleFont];
    [(UILabel *)subtitleLabel setFont:v9];

    [(CCUIMenuModuleItemView *)self->_footerButtonView setShouldLimitContentSizeCategory:v3];
  }
  return forceLimitContentSizeCategory != v3;
}

- (void)_contentSizeCategoryDidChange
{
  [(CCUIMenuModuleViewController *)self _setForceLimitContentSizeCategory:0];
  [(CCUIMenuModuleViewController *)self _updateTitleFont];
  [(CCUIMenuModuleViewController *)self _updateSubtitleFont];
  [(CCUIMenuModuleViewController *)self _updateLeadingAndTrailingViews];
}

- (void)_updateTitleFont
{
  titleLabel = self->_titleLabel;
  double v4 = [(CCUIMenuModuleViewController *)self _titleFont];
  [(UILabel *)titleLabel setFont:v4];

  id v5 = [(CCUIMenuModuleViewController *)self viewIfLoaded];
  [v5 setNeedsLayout];
}

- (void)_updateSubtitleFont
{
  subtitleLabel = self->_subtitleLabel;
  double v4 = [(CCUIMenuModuleViewController *)self _subtitleFont];
  [(UILabel *)subtitleLabel setFont:v4];

  id v5 = [(CCUIMenuModuleViewController *)self viewIfLoaded];
  [v5 setNeedsLayout];
}

- (void)_updateLeadingAndTrailingViews
{
  BOOL v3 = [(UIStackView *)self->_menuItemsContainer arrangedSubviews];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__CCUIMenuModuleViewController__updateLeadingAndTrailingViews__block_invoke;
  v5[3] = &unk_1E6AD4548;
  v5[4] = self;
  [v3 enumerateObjectsUsingBlock:v5];
  double v4 = [(CCUIMenuModuleViewController *)self viewIfLoaded];
  [v4 setNeedsLayout];
}

void __62__CCUIMenuModuleViewController__updateLeadingAndTrailingViews__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  BOOL v3 = [v6 menuItem];
  if ([v3 isSelected])
  {
    double v4 = [*(id *)(a1 + 32) _leadingViewForMenuItem:v3];
    [v6 setLeadingView:v4];

    id v5 = [*(id *)(a1 + 32) _trailingViewForMenuItem:v3];
    [v6 setTrailingView:v5];
  }
}

- (double)_footerHeight
{
  if ([(CCUIMenuModuleViewController *)self _shouldShowFooterChin])
  {
    v17.origin.x = CCUIReferenceScreenBounds();
    double Width = CGRectGetWidth(v17);
    if (Width >= 1024.0)
    {
      BOOL v2 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v2 userInterfaceIdiom] == 1)
      {
        double v8 = 24.0;
        if (SBFEffectiveHomeButtonType() != 2) {
          goto LABEL_37;
        }
      }
    }
    v18.origin.x = CCUIReferenceScreenBounds();
    double v9 = CGRectGetWidth(v18);
    if (v9 >= 1024.0
      && ([MEMORY[0x1E4FB16C8] currentDevice],
          BOOL v3 = objc_claimAutoreleasedReturnValue(),
          [v3 userInterfaceIdiom] == 1)
      && SBFEffectiveHomeButtonType() == 2)
    {

      double v8 = 24.0;
    }
    else
    {
      v19.origin.x = CCUIReferenceScreenBounds();
      double v11 = CGRectGetWidth(v19);
      if (v11 >= 834.0)
      {
        double v4 = [MEMORY[0x1E4FB16C8] currentDevice];
        if ([v4 userInterfaceIdiom] == 1)
        {
          double v8 = 24.0;
          if (SBFEffectiveHomeButtonType() == 2) {
            goto LABEL_33;
          }
        }
      }
      v20.origin.x = CCUIReferenceScreenBounds();
      double v12 = CGRectGetWidth(v20);
      if (v12 >= 834.0)
      {
        id v5 = [MEMORY[0x1E4FB16C8] currentDevice];
        if ([v5 userInterfaceIdiom] == 1)
        {
          double v8 = 24.0;
          if (SBFEffectiveHomeButtonType() != 2) {
            goto LABEL_31;
          }
        }
      }
      double v13 = [MEMORY[0x1E4FB16C8] currentDevice];
      double v8 = 24.0;
      if ([v13 userInterfaceIdiom] != 1)
      {
        v21.origin.x = CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v21) < 430.0)
        {
          v22.origin.x = CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v22) < 428.0)
          {
            v23.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v23) < 414.0 || SBFEffectiveHomeButtonType() != 2)
            {
              v24.origin.x = CCUIReferenceScreenBounds();
              if (CGRectGetWidth(v24) < 414.0)
              {
                v25.origin.x = CCUIReferenceScreenBounds();
                if (CGRectGetWidth(v25) < 393.0)
                {
                  v26.origin.x = CCUIReferenceScreenBounds();
                  if (CGRectGetWidth(v26) < 390.0)
                  {
                    v27.origin.x = CCUIReferenceScreenBounds();
                    if (CGRectGetWidth(v27) < 375.0 || SBFEffectiveHomeButtonType() != 2)
                    {
                      v28.origin.x = CCUIReferenceScreenBounds();
                      if (CGRectGetWidth(v28) < 375.0) {
                        double v8 = 20.0;
                      }
                      else {
                        double v8 = 24.0;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }

      if (v12 >= 834.0) {
LABEL_31:
      }

      if (v11 >= 834.0) {
LABEL_33:
      }

      if (v9 >= 1024.0) {
    }
      }
    if (Width >= 1024.0) {
LABEL_37:
    }
  }
  else if (self->_shouldShowFooterButton)
  {
    [(CCUIMenuModuleItemView *)self->_footerButtonView intrinsicContentSize];
    double v8 = v10;
  }
  else
  {
    double v8 = 0.0;
  }
  char IsZero = BSFloatIsZero();
  double result = 0.0;
  if ((IsZero & 1) == 0)
  {
    [(CCUIMenuModuleViewController *)self _separatorHeight];
    return v8 + v16;
  }
  return result;
}

- (double)_aggregateModuleHeight
{
  [(CCUIMenuModuleViewController *)self headerHeight];
  double v4 = v3;
  [(UIView *)self->_contentView frame];
  double v5 = v4 + CGRectGetHeight(v8);
  [(CCUIMenuModuleViewController *)self _footerHeight];
  return v5 + v6;
}

- (BOOL)_shouldShowFooterSeparator
{
  return [(CCUIMenuModuleViewController *)self _shouldShowFooterChin]
      || self->_shouldShowFooterButton;
}

- (BOOL)_shouldShowFooterChin
{
  if (self->_shouldShowFooterButton) {
    return 0;
  }
  double v4 = [(UIStackView *)self->_menuItemsContainer arrangedSubviews];
  if ([v4 count]) {
    BOOL customContentViewScrolls = 1;
  }
  else {
    BOOL customContentViewScrolls = self->_customContentViewScrolls;
  }

  return customContentViewScrolls;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (unint64_t)minimumMenuItems
{
  return self->_minimumMenuItems;
}

- (void)setMinimumMenuItems:(unint64_t)a3
{
  self->_minimumMenuItems = a3;
}

- (double)visibleMenuItems
{
  return self->_visibleMenuItems;
}

- (void)setVisibleMenuItems:(double)a3
{
  self->_visibleMenuItems = a3;
}

- (unint64_t)indentation
{
  return self->_indentation;
}

- (void)setIndentation:(unint64_t)a3
{
  self->_indentation = a3;
}

- (BOOL)isBusy
{
  return self->_busy;
}

- (BOOL)shouldProvideOwnPlatter
{
  return self->_shouldProvideOwnPlatter;
}

- (void)setShouldProvideOwnPlatter:(BOOL)a3
{
  self->_shouldProvideOwnPlatter = a3;
}

- (BOOL)useTrailingCheckmarkLayout
{
  return self->_useTrailingCheckmarkLayout;
}

- (void)setUseTrailingCheckmarkLayout:(BOOL)a3
{
  self->_useTrailingCheckmarkLayout = a3;
}

- (BOOL)useTrailingInset
{
  return self->_useTrailingInset;
}

- (void)setUseTrailingInset:(BOOL)a3
{
  self->_useTrailingInset = a3;
}

- (BOOL)useTallLayout
{
  return self->_useTallLayout;
}

- (void)setUseTallLayout:(BOOL)a3
{
  self->_useTallLayout = a3;
}

- (CCUIContentModuleContext)contentModuleContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentModuleContext);
  return (CCUIContentModuleContext *)WeakRetained;
}

- (void)setContentModuleContext:(id)a3
{
}

- (BOOL)hideGlyphInHeader
{
  return self->_hideGlyphInHeader;
}

- (void)setHideGlyphInHeader:(BOOL)a3
{
  self->_hideGlyphInHeader = a3;
}

- (CCUIMenuItemsUpdating)menuUpdatingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuUpdatingDelegate);
  return (CCUIMenuItemsUpdating *)WeakRetained;
}

- (void)setMenuUpdatingDelegate:(id)a3
{
}

- (BOOL)isAlwaysExpanded
{
  return self->_alwaysExpanded;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_menuUpdatingDelegate);
  objc_destroyWeak((id *)&self->_contentModuleContext);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_customContentView, 0);
  objc_storeStrong((id *)&self->_footerButtonView, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_pressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_busyIndicatorView, 0);
  objc_storeStrong((id *)&self->_darkeningBackgroundView, 0);
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_identiferToActivityIndicatorView, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_menuItemsContainer, 0);
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProviders, 0);
  objc_storeStrong((id *)&self->_platterMaterialView, 0);
  objc_storeStrong((id *)&self->_footerSeparatorView, 0);
  objc_storeStrong((id *)&self->_headerSeparatorView, 0);
  objc_storeStrong((id *)&self->_transformView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
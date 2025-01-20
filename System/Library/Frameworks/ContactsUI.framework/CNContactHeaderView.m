@interface CNContactHeaderView
+ (BOOL)requiresConstraintBasedLayout;
+ (CGSize)defaultPhotoSize;
+ (id)descriptorForRequiredKeys;
+ (id)descriptorForRequiredKeysIncludingAvatarViewDescriptors:(BOOL)a3;
+ (id)makePhotoViewWithShouldAllowTakePhotoAction:(BOOL)a3 shouldAllowImageDrops:(BOOL)a4 monogramOnly:(BOOL)a5;
+ (id)sizeAttributesShowingNavBar:(BOOL)a3;
- (BOOL)alwaysShowsMonogram;
- (BOOL)canBecomeFirstResponder;
- (BOOL)isAXSize;
- (BOOL)isOrientationPhoneLandscape;
- (BOOL)isPad;
- (BOOL)isPadCompactHorizontalSize;
- (BOOL)isPadRegularHorizontalSize;
- (BOOL)isPhotoLowQuality;
- (BOOL)isSiri;
- (BOOL)needsLabelSizeCalculation;
- (BOOL)shouldShowBelowNavigationTitle;
- (BOOL)shouldUseConstrainedMaxHeight;
- (BOOL)showMonogramsOnly;
- (BOOL)visibleToScrollViews;
- (CNContact)contactMiniCache;
- (CNContactHeaderView)initWithContact:(id)a3 frame:(CGRect)a4 shouldAllowTakePhotoAction:(BOOL)a5 shouldAllowImageDrops:(BOOL)a6 showingNavBar:(BOOL)a7 monogramOnly:(BOOL)a8 delegate:(id)a9;
- (CNContactHeaderViewDelegate)delegate;
- (CNContactHeaderViewSizeAttributes)sizeAttributes;
- (CNContactPhotoView)photoView;
- (CNContactStore)xpcContactStore;
- (CNPresenterDelegate)presenterDelegate;
- (CNSensitiveContentBlurView)sensitiveContentBlurView;
- (CNUIBackgroundColors)colorsMiniCache;
- (NSArray)activatedConstraints;
- (NSArray)contacts;
- (NSDictionary)nameTextAttributes;
- (NSLayoutConstraint)photoHeightConstraint;
- (NSLayoutConstraint)photoTopConstraint;
- (OS_dispatch_queue)backgroundColorCacheQueue;
- (UIImageView)posterView;
- (UILabel)nameLabel;
- (double)constrainedMaxHeight;
- (double)currentHeightPercentMaximized;
- (double)currentHeightPercentMaximizedForMaxHeight:(double)a3;
- (double)currentHeightPercentMaximizedForPhoto;
- (double)defaultMaxBaseHeight;
- (double)lastViewWidth;
- (double)maxHeight;
- (double)minHeight;
- (double)minTitleOffset;
- (double)safeAreaPhotoOffset;
- (double)safeAreaTop;
- (id)backgroundGradientDefaultGrayColors;
- (id)colorExtractionContext;
- (id)contactStyle;
- (id)contactViewCache;
- (id)dataForBackgroundColorService:(id)a3;
- (id)descriptorForRequiredKeys;
- (id)viewControllerForPhotoView:(id)a3;
- (void)dealloc;
- (void)fetchColorsForContactImageData:(id)a3 bitmapFormat:(id)a4 isPoster:(BOOL)a5 forContact:(id)a6 cacheResult:(BOOL)a7 withCompletionHandler:(id)a8;
- (void)layoutSubviews;
- (void)photoView:(id)a3 didAcceptDropOfImageData:(id)a4;
- (void)photoViewDidUpdate:(id)a3;
- (void)reloadDataIfNeeded;
- (void)reloadDataPreservingChanges:(BOOL)a3;
- (void)setActivatedConstraints:(id)a3;
- (void)setAlwaysShowsMonogram:(BOOL)a3;
- (void)setBackgroundColorCacheQueue:(id)a3;
- (void)setColorsMiniCache:(id)a3;
- (void)setConstrainedMaxHeight:(double)a3;
- (void)setConstrainedMaxHeight:(double)a3 enabled:(BOOL)a4;
- (void)setContactMiniCache:(id)a3;
- (void)setContacts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsSiri:(BOOL)a3;
- (void)setLastViewWidth:(double)a3;
- (void)setNameLabel:(id)a3;
- (void)setNameTextAttributes:(id)a3;
- (void)setNeedsLabelSizeCalculation:(BOOL)a3;
- (void)setNeedsReload;
- (void)setPhotoHeightConstraint:(id)a3;
- (void)setPhotoTopConstraint:(id)a3;
- (void)setPosterView:(id)a3;
- (void)setPresenterDelegate:(id)a3;
- (void)setSensitiveContentBlurView:(id)a3;
- (void)setShouldShowBelowNavigationTitle:(BOOL)a3;
- (void)setShouldUseConstrainedMaxHeight:(BOOL)a3;
- (void)setShowMonogramsOnly:(BOOL)a3;
- (void)setSizeAttributes:(id)a3;
- (void)setVisibleToScrollViews:(BOOL)a3;
- (void)setXpcContactStore:(id)a3;
- (void)updateConstraints;
- (void)updateFontSizes;
- (void)updateForShowingNavBar:(BOOL)a3;
- (void)updateSizeDependentAttributes;
- (void)updateWithContacts:(id)a3;
- (void)updateWithNewContact:(id)a3;
@end

@implementation CNContactHeaderView

+ (id)descriptorForRequiredKeys
{
  return (id)[a1 descriptorForRequiredKeysIncludingAvatarViewDescriptors:1];
}

+ (id)descriptorForRequiredKeysIncludingAvatarViewDescriptors:(BOOL)a3
{
  BOOL v3 = a3;
  v28[27] = *MEMORY[0x1E4F143B8];
  v4 = +[CNMonogrammer descriptorForRequiredKeysIncludingImage:1];
  v5 = +[CNContactPhotoView descriptorForRequiredKeysWithThreeDTouchEnabled:](CNContactPhotoView, "descriptorForRequiredKeysWithThreeDTouchEnabled:", 1, v4);
  v28[1] = v5;
  v6 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:1];
  uint64_t v7 = *MEMORY[0x1E4F1AEB0];
  v28[2] = v6;
  v28[3] = v7;
  uint64_t v8 = *MEMORY[0x1E4F1AEA0];
  v28[4] = *MEMORY[0x1E4F1ADF0];
  v28[5] = v8;
  uint64_t v9 = *MEMORY[0x1E4F1AF30];
  v28[6] = *MEMORY[0x1E4F1ADE0];
  v28[7] = v9;
  uint64_t v10 = *MEMORY[0x1E4F1AEC0];
  v28[8] = *MEMORY[0x1E4F1AEB8];
  v28[9] = v10;
  uint64_t v11 = *MEMORY[0x1E4F1AF00];
  v28[10] = *MEMORY[0x1E4F1AEF8];
  v28[11] = v11;
  uint64_t v12 = *MEMORY[0x1E4F1AF40];
  v28[12] = *MEMORY[0x1E4F1AEF0];
  v28[13] = v12;
  uint64_t v13 = *MEMORY[0x1E4F1AD88];
  v28[14] = *MEMORY[0x1E4F1AF38];
  v28[15] = v13;
  uint64_t v14 = *MEMORY[0x1E4F1AF08];
  v28[16] = *MEMORY[0x1E4F1AED8];
  v28[17] = v14;
  uint64_t v15 = *MEMORY[0x1E4F1ADB8];
  v28[18] = *MEMORY[0x1E4F1AFA8];
  v28[19] = v15;
  uint64_t v16 = *MEMORY[0x1E4F1AE20];
  v28[20] = *MEMORY[0x1E4F1AE78];
  v28[21] = v16;
  uint64_t v17 = *MEMORY[0x1E4F1AF70];
  v28[22] = *MEMORY[0x1E4F1AF98];
  v28[23] = v17;
  v18 = [MEMORY[0x1E4F1B9F8] descriptorForRequiredKeys];
  uint64_t v19 = *MEMORY[0x1E4F1ADC0];
  v28[24] = v18;
  v28[25] = v19;
  v20 = [MEMORY[0x1E4F1B938] descriptorForRequiredKeys];
  v28[26] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:27];

  if (v3)
  {
    v22 = +[CNAvatarView descriptorForRequiredKeysWithThreeDTouchEnabled:1];
    uint64_t v23 = [v21 arrayByAddingObject:v22];

    v21 = (void *)v23;
  }
  v24 = (void *)MEMORY[0x1E4F1B8F8];
  v25 = [NSString stringWithUTF8String:"+[CNContactHeaderView descriptorForRequiredKeysIncludingAvatarViewDescriptors:]"];
  v26 = [v24 descriptorWithKeyDescriptors:v21 description:v25];

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoView, 0);
  objc_storeStrong((id *)&self->_colorsMiniCache, 0);
  objc_storeStrong((id *)&self->_contactMiniCache, 0);
  objc_storeStrong((id *)&self->_backgroundColorCacheQueue, 0);
  objc_storeStrong((id *)&self->_sizeAttributes, 0);
  objc_storeStrong((id *)&self->_photoHeightConstraint, 0);
  objc_storeStrong((id *)&self->_photoTopConstraint, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_activatedConstraints, 0);
  objc_storeStrong((id *)&self->_sensitiveContentBlurView, 0);
  objc_storeStrong((id *)&self->_posterView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_xpcContactStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presenterDelegate);
  objc_storeStrong((id *)&self->_nameTextAttributes, 0);

  objc_storeStrong((id *)&self->_colorExtractionContext, 0);
}

- (void)setShouldShowBelowNavigationTitle:(BOOL)a3
{
  self->_shouldShowBelowNavigationTitle = a3;
}

- (BOOL)shouldShowBelowNavigationTitle
{
  return self->_shouldShowBelowNavigationTitle;
}

- (void)setShowMonogramsOnly:(BOOL)a3
{
  self->_showMonogramsOnly = a3;
}

- (BOOL)showMonogramsOnly
{
  return self->_showMonogramsOnly;
}

- (void)setVisibleToScrollViews:(BOOL)a3
{
  self->_visibleToScrollViews = a3;
}

- (BOOL)visibleToScrollViews
{
  return self->_visibleToScrollViews;
}

- (void)setAlwaysShowsMonogram:(BOOL)a3
{
  self->_alwaysShowsMonogram = a3;
}

- (BOOL)alwaysShowsMonogram
{
  return self->_alwaysShowsMonogram;
}

- (CNContactPhotoView)photoView
{
  return self->_photoView;
}

- (void)setColorsMiniCache:(id)a3
{
}

- (CNUIBackgroundColors)colorsMiniCache
{
  return self->_colorsMiniCache;
}

- (void)setContactMiniCache:(id)a3
{
}

- (CNContact)contactMiniCache
{
  return self->_contactMiniCache;
}

- (void)setBackgroundColorCacheQueue:(id)a3
{
}

- (OS_dispatch_queue)backgroundColorCacheQueue
{
  return self->_backgroundColorCacheQueue;
}

- (void)setShouldUseConstrainedMaxHeight:(BOOL)a3
{
  self->_shouldUseConstrainedMaxHeight = a3;
}

- (BOOL)shouldUseConstrainedMaxHeight
{
  return self->_shouldUseConstrainedMaxHeight;
}

- (void)setConstrainedMaxHeight:(double)a3
{
  self->_constrainedMaxHeight = a3;
}

- (double)constrainedMaxHeight
{
  return self->_constrainedMaxHeight;
}

- (void)setLastViewWidth:(double)a3
{
  self->_lastViewWidth = a3;
}

- (double)lastViewWidth
{
  return self->_lastViewWidth;
}

- (void)setNeedsLabelSizeCalculation:(BOOL)a3
{
  self->_needsLabelSizeCalculation = a3;
}

- (BOOL)needsLabelSizeCalculation
{
  return self->_needsLabelSizeCalculation;
}

- (void)setSizeAttributes:(id)a3
{
}

- (CNContactHeaderViewSizeAttributes)sizeAttributes
{
  return self->_sizeAttributes;
}

- (void)setPhotoHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)photoHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 512, 1);
}

- (void)setPhotoTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)photoTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 504, 1);
}

- (void)setContacts:(id)a3
{
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setActivatedConstraints:(id)a3
{
}

- (NSArray)activatedConstraints
{
  return self->_activatedConstraints;
}

- (void)setSensitiveContentBlurView:(id)a3
{
}

- (CNSensitiveContentBlurView)sensitiveContentBlurView
{
  return self->_sensitiveContentBlurView;
}

- (void)setPosterView:(id)a3
{
}

- (UIImageView)posterView
{
  return self->_posterView;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setXpcContactStore:(id)a3
{
}

- (CNContactStore)xpcContactStore
{
  return self->_xpcContactStore;
}

- (void)setIsSiri:(BOOL)a3
{
  self->_isSiri = a3;
}

- (BOOL)isSiri
{
  return self->_isSiri;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactHeaderViewDelegate *)WeakRetained;
}

- (CNPresenterDelegate)presenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterDelegate);

  return (CNPresenterDelegate *)WeakRetained;
}

- (void)setNameTextAttributes:(id)a3
{
}

- (NSDictionary)nameTextAttributes
{
  return self->_nameTextAttributes;
}

- (BOOL)isPhotoLowQuality
{
  v2 = [(CNContactHeaderView *)self contacts];
  BOOL v3 = [v2 firstObject];
  char v4 = [v3 hasLowQualityImage];

  return v4;
}

- (BOOL)isOrientationPhoneLandscape
{
  v2 = [(CNContactHeaderView *)self delegate];
  char v3 = [v2 isOrientationPhoneLandscape];

  return v3;
}

- (BOOL)isPad
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return v3 == 1;
}

- (BOOL)isPadCompactHorizontalSize
{
  uint64_t v3 = [(CNContactHeaderView *)self traitCollection];
  uint64_t v4 = [v3 horizontalSizeClass];

  BOOL result = [(CNContactHeaderView *)self isPad];
  if (v4 != 1) {
    return 0;
  }
  return result;
}

- (BOOL)isPadRegularHorizontalSize
{
  uint64_t v3 = [(CNContactHeaderView *)self traitCollection];
  uint64_t v4 = [v3 horizontalSizeClass];

  BOOL result = [(CNContactHeaderView *)self isPad];
  if (v4 == 1) {
    return 0;
  }
  return result;
}

- (id)contactViewCache
{
  uint64_t v3 = [(CNContactHeaderView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(CNContactHeaderView *)self delegate];
    v6 = [v5 contactViewCache];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)viewControllerForPhotoView:(id)a3
{
  char v4 = [(CNContactHeaderView *)self delegate];
  v5 = [v4 viewControllerForHeaderView:self];

  return v5;
}

- (void)photoView:(id)a3 didAcceptDropOfImageData:(id)a4
{
  id v5 = a4;
  id v6 = [(CNContactHeaderView *)self delegate];
  [v6 headerView:self didAcceptDropOfImageData:v5];
}

- (void)photoViewDidUpdate:(id)a3
{
  id v3 = [(CNContactHeaderView *)self delegate];
  [v3 headerPhotoDidUpdate];
}

- (void)updateSizeDependentAttributes
{
  [(CNContactHeaderView *)self bounds];
  if (v3 > 0.0)
  {
    [(CNContactHeaderView *)self currentHeightPercentMaximizedForPhoto];
    long double v5 = v4;
    double v6 = 0.0;
    if ([(CNContactHeaderView *)self shouldShowBelowNavigationTitle])
    {
      uint64_t v7 = [(CNContactHeaderView *)self sizeAttributes];
      [v7 navbarTitleOffsetWithPercentMax:(double)v5];
      double v6 = v8;
    }
    BOOL v9 = [(CNContactHeaderView *)self isSiri];
    [(CNContactHeaderView *)self safeAreaPhotoOffset];
    double v11 = v6 + v10;
    uint64_t v12 = [(CNContactHeaderView *)self sizeAttributes];
    uint64_t v13 = v12;
    if (v9)
    {
      [v12 photoMinTopMargin];
      double v15 = v11 + v14;
      uint64_t v16 = [(CNContactHeaderView *)self photoTopConstraint];
      [v16 setConstant:v15];
    }
    else
    {
      [v12 photoTopMarginWithPercentMax:(double)v5];
      double v18 = v11 + v17;
      uint64_t v16 = [(CNContactHeaderView *)self sizeAttributes];
      [v16 photoMinTopMargin];
      double v20 = v18 - v19;
      v21 = [(CNContactHeaderView *)self photoTopConstraint];
      [v21 setConstant:v20];
    }
    v22 = [(CNContactHeaderView *)self sizeAttributes];
    [v22 photoHeightWithPercentMax:(double)v5];
    double v24 = v23;
    v25 = [(CNContactHeaderView *)self photoHeightConstraint];
    [v25 setConstant:v24];

    double v26 = pow(v5, 3.0);
    id v27 = [(CNContactHeaderView *)self photoView];
    [v27 setLabelAlpha:v26];
  }
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CNContactHeaderView;
  [(CNContactHeaderView *)&v9 layoutSubviews];
  [(CNContactHeaderView *)self frame];
  double v4 = v3;
  long double v5 = (void *)MEMORY[0x1E4F5A3E0];
  [(CNContactHeaderView *)self lastViewWidth];
  -[CNContactHeaderView setNeedsLabelSizeCalculation:](self, "setNeedsLabelSizeCalculation:", -[CNContactHeaderView needsLabelSizeCalculation](self, "needsLabelSizeCalculation") | [v5 isDouble:v4 equalToOther:v6 withAccuracy:0.5] ^ 1);
  [(CNContactHeaderView *)self setLastViewWidth:v4];
  [(CNContactHeaderView *)self maxHeight];
  if (v7 > 0.0)
  {
    [(CNContactHeaderView *)self minHeight];
    if (v8 > 0.0) {
      [(CNContactHeaderView *)self updateSizeDependentAttributes];
    }
  }
}

- (double)currentHeightPercentMaximizedForMaxHeight:(double)a3
{
  [(CNContactHeaderView *)self minHeight];
  double v6 = a3 - v5;
  double result = 1.0;
  if (v6 > 0.0)
  {
    [(CNContactHeaderView *)self bounds];
    double v9 = v8;
    [(CNContactHeaderView *)self minHeight];
    double v11 = v9 - v10;
    [(CNContactHeaderView *)self minHeight];
    double result = v11 / (a3 - v12);
    if (result < 0.0) {
      double result = 0.0;
    }
    if (result > 1.0) {
      return 1.0;
    }
  }
  return result;
}

- (double)currentHeightPercentMaximizedForPhoto
{
  [(CNContactHeaderView *)self defaultMaxHeight];

  -[CNContactHeaderView currentHeightPercentMaximizedForMaxHeight:](self, "currentHeightPercentMaximizedForMaxHeight:");
  return result;
}

- (double)currentHeightPercentMaximized
{
  [(CNContactHeaderView *)self maxHeight];

  -[CNContactHeaderView currentHeightPercentMaximizedForMaxHeight:](self, "currentHeightPercentMaximizedForMaxHeight:");
  return result;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)reloadDataPreservingChanges:(BOOL)a3
{
  photoView = self->_photoView;
  if (a3) {
    [(CNContactPhotoView *)photoView updatePhoto];
  }
  else {
    [(CNContactPhotoView *)photoView resetPhoto];
  }
  self->_needsReload = 0;

  [(CNContactHeaderView *)self setNeedsLabelSizeCalculation:1];
}

- (void)reloadDataIfNeeded
{
  if (self->_needsReload) {
    [(CNContactHeaderView *)self reloadDataPreservingChanges:1];
  }
}

- (void)setNeedsReload
{
  if (!self->_needsReload)
  {
    self->_needsReload = 1;
    CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__CNContactHeaderView_setNeedsReload__block_invoke;
    block[3] = &unk_1E54978F0;
    block[4] = self;
    CFRunLoopObserverRef v3 = CFRunLoopObserverCreateWithHandler(v2, 0x20uLL, 0, 0, block);
    if (v3)
    {
      double v4 = v3;
      Main = CFRunLoopGetMain();
      CFRunLoopAddObserver(Main, v4, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
      CFRelease(v4);
    }
  }
}

uint64_t __37__CNContactHeaderView_setNeedsReload__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadDataIfNeeded];
}

- (id)backgroundGradientDefaultGrayColors
{
  CFAllocatorRef v2 = [(CNContactHeaderView *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceStyle];

  if (v3 == 2) {
    [MEMORY[0x1E4F5A670] defaultDarkGrayColors];
  }
  else {
  double v4 = [MEMORY[0x1E4F5A670] defaultGrayColors];
  }

  return v4;
}

- (id)dataForBackgroundColorService:(id)a3
{
  id v3 = a3;
  double v4 = mmap(0, [v3 length], 3, 4097, -1, 0);
  objc_msgSend(v3, "getBytes:length:", v4, objc_msgSend(v3, "length"));
  size_t v5 = [v3 length];

  double v6 = dispatch_get_global_queue(0, 0);
  dispatch_data_t v7 = dispatch_data_create(v4, v5, v6, (dispatch_block_t)*MEMORY[0x1E4F143F8]);

  return v7;
}

- (void)fetchColorsForContactImageData:(id)a3 bitmapFormat:(id)a4 isPoster:(BOOL)a5 forContact:(id)a6 cacheResult:(BOOL)a7 withCompletionHandler:(id)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  double v17 = (void (**)(id, void *))a8;
  id v18 = [(CNContactHeaderView *)self contactMiniCache];

  if (v18 == v16)
  {
    v28 = [(CNContactHeaderView *)self colorsMiniCache];
    v29 = v28;
    if (v11) {
      [v28 contactPoster];
    }
    else {
    v30 = [v28 contactImage];
    }
    v17[2](v17, v30);
  }
  else
  {
    BOOL v31 = a7;
    double v19 = v14;
    double v20 = [(CNContactHeaderView *)self xpcContactStore];

    if (!v20)
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4F1B990]);
      [v21 setUseOutOfProcessMapperExclusively:1];
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F1B980]) initWithConfiguration:v21];
      [(CNContactHeaderView *)self setXpcContactStore:v22];
    }
    double v23 = [(CNContactHeaderView *)self xpcContactStore];
    double v24 = +[CNUIContactsEnvironment currentEnvironment];
    v25 = [v24 defaultSchedulerProvider];
    double v26 = [v25 backgroundScheduler];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke;
    v32[3] = &unk_1E5497478;
    v38 = v17;
    id v33 = v23;
    id v34 = v19;
    id v35 = v15;
    v36 = self;
    BOOL v39 = v31;
    id v37 = v16;
    BOOL v40 = v11;
    id v27 = v23;
    [v26 performBlock:v32];

    id v14 = v19;
  }
}

void __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke_2;
  aBlock[3] = &unk_1E5498C00;
  id v30 = *(id *)(a1 + 72);
  CFAllocatorRef v2 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v28 = 0;
  double v6 = [v3 getBackgroundColorOnImageData:v4 bitmapFormat:v5 error:&v28];
  id v7 = v28;
  uint64_t v8 = *MEMORY[0x1E4F5A258];
  if (!(*(unsigned int (**)(void, void *))(*MEMORY[0x1E4F5A258] + 16))(*MEMORY[0x1E4F5A258], v6))
  {
    double v10 = [MEMORY[0x1E4F5A628] colorsFromDictionaries:v6];
    if (((*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v10) & 1) != 0 || !*(unsigned char *)(a1 + 80))
    {
      id v15 = CNUILogContactCard();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18B625000, v15, OS_LOG_TYPE_ERROR, "Failed to read colors from dictionary", buf, 2u);
      }

      BOOL v11 = [*(id *)(a1 + 56) backgroundGradientDefaultGrayColors];
      v2[2](v2, v11);
      goto LABEL_18;
    }
    BOOL v11 = (void *)[*(id *)(a1 + 64) mutableCopy];
    id v12 = objc_alloc(MEMORY[0x1E4F5A620]);
    uint64_t v13 = [v11 imageBackgroundColorsData];
    id v14 = (void *)[v12 initWithData:v13];

    if (*(unsigned char *)(a1 + 81)) {
      [v14 setContactPoster:v10];
    }
    else {
      [v14 setContactImage:v10];
    }
    id v16 = [v14 data];
    [v11 setImageBackgroundColorsData:v16];

    [*(id *)(a1 + 56) setContactMiniCache:*(void *)(a1 + 64)];
    [*(id *)(a1 + 56) setColorsMiniCache:v14];
    double v17 = [*(id *)(a1 + 56) delegate];
    if ([v17 headerViewShouldCacheContactBackgroundColor:*(void *)(a1 + 56)])
    {
      int v18 = [v11 hasBeenPersisted];

      if (!v18)
      {
LABEL_17:
        v2[2](v2, v10);

LABEL_18:
        goto LABEL_19;
      }
      double v19 = [*(id *)(a1 + 56) backgroundColorCacheQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke_29;
      block[3] = &unk_1E549B800;
      id v20 = v11;
      uint64_t v21 = *(void *)(a1 + 56);
      v22 = *(void **)(a1 + 64);
      id v25 = v20;
      uint64_t v26 = v21;
      id v27 = v22;
      dispatch_async(v19, block);

      double v17 = v25;
    }

    goto LABEL_17;
  }
  double v9 = CNUILogContactCard();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    double v23 = [v7 description];
    *(_DWORD *)buf = 138412290;
    v32 = v23;
    _os_log_error_impl(&dword_18B625000, v9, OS_LOG_TYPE_ERROR, "Failed to generate colors dictionary, error: %@", buf, 0xCu);
  }
  double v10 = [*(id *)(a1 + 56) backgroundGradientDefaultGrayColors];
  v2[2](v2, v10);
LABEL_19:
}

void __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke_3;
  v6[3] = &unk_1E549B710;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke_29(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v2 = CNUILogContactCard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v3;
    _os_log_impl(&dword_18B625000, v2, OS_LOG_TYPE_INFO, "Attempting to cache background colors for contact %@", buf, 0xCu);
  }

  id v4 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  [v4 setSuppressChangeNotifications:1];
  [v4 updateContact:a1[4]];
  id v5 = +[CNUIContactsEnvironment currentEnvironment];
  double v6 = [v5 inProcessContactStore];

  id v15 = 0;
  char v7 = [v6 executeSaveRequest:v4 error:&v15];
  id v8 = v15;
  if ((v7 & 1) == 0)
  {
    double v9 = CNUILogPosters();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = a1[4];
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_error_impl(&dword_18B625000, v9, OS_LOG_TYPE_ERROR, "Failed to save background colors to contact %@ with error %@", buf, 0x16u);
    }
  }
  double v10 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke_32;
  v13[3] = &unk_1E549BF80;
  BOOL v11 = (void *)a1[6];
  v13[4] = a1[5];
  id v14 = v11;
  [v10 performBlock:v13];
}

void __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke_32(uint64_t a1)
{
  CFAllocatorRef v2 = [*(id *)(a1 + 32) contactMiniCache];
  uint64_t v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    [*(id *)(a1 + 32) setContactMiniCache:0];
    id v4 = *(void **)(a1 + 32);
    [v4 setColorsMiniCache:0];
  }
}

uint64_t __121__CNContactHeaderView_fetchColorsForContactImageData_bitmapFormat_isPoster_forContact_cacheResult_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)colorExtractionContext
{
  colorExtractionContext = self->_colorExtractionContext;
  if (!colorExtractionContext)
  {
    id v4 = [MEMORY[0x1E4F5A670] ciContextWithHighPriority:1];
    id v5 = self->_colorExtractionContext;
    self->_colorExtractionContext = v4;

    colorExtractionContext = self->_colorExtractionContext;
  }

  return colorExtractionContext;
}

- (void)updateFontSizes
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2988]];
  id v4 = (void *)sCurrentNameFont;
  sCurrentNameFont = v3;

  uint64_t v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2948]];
  double v6 = (void *)sCurrentTaglineFont;
  sCurrentTaglineFont = v5;

  uint64_t v10 = *MEMORY[0x1E4FB06F8];
  char v7 = (void *)sCurrentNameFont;
  [(id)sCurrentNameFont _scaledValueForValue:30.0];
  id v8 = objc_msgSend(v7, "fontWithSize:");
  v11[0] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [self cn_updateDictionaryForKey:@"nameTextAttributes" withChanges:v9];
}

- (void)updateWithContacts:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([(NSArray *)self->_contacts _cn_isIdenticalToArray:v5] & 1) == 0)
  {
    p_contacts = &self->_contacts;
    id v15 = a3;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          BOOL v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
          uint64_t v12 = objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys", p_contacts, v15, (void)v16);
          uint64_t v20 = v12;
          uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
          [v11 assertKeysAreAvailable:v13];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v8);
    }

    objc_storeStrong((id *)p_contacts, v15);
    [(CNContactPhotoView *)self->_photoView setContacts:v6];
    -[CNContactHeaderView setHidden:](self, "setHidden:", [v6 count] == 0);
    [(CNContactHeaderView *)self setNeedsReload];
  }
}

- (void)updateWithNewContact:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v7[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(CNContactHeaderView *)self updateWithContacts:v6];
  }
  else
  {
    [(CNContactHeaderView *)self updateWithContacts:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)updateConstraints
{
  [(CNContactHeaderView *)self reloadDataIfNeeded];
  v19.receiver = self;
  v19.super_class = (Class)CNContactHeaderView;
  [(CNContactHeaderView *)&v19 updateConstraints];
  uint64_t v3 = (void *)MEMORY[0x1E4F28DC8];
  id v4 = [(CNContactHeaderView *)self activatedConstraints];
  [v3 deactivateConstraints:v4];

  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(CNContactHeaderView *)self photoView];
  uint64_t v7 = [v6 topAnchor];
  uint64_t v8 = [(CNContactHeaderView *)self safeAreaLayoutGuide];
  uint64_t v9 = [v8 topAnchor];
  [(CNContactHeaderView *)self safeAreaPhotoOffset];
  uint64_t v10 = objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9);
  [(CNContactHeaderView *)self setPhotoTopConstraint:v10];

  BOOL v11 = [(CNContactHeaderView *)self photoTopConstraint];
  LODWORD(v12) = 1148829696;
  [v11 setPriority:v12];

  uint64_t v13 = [(CNContactHeaderView *)self photoTopConstraint];
  [v5 addObject:v13];

  id v14 = [(CNContactHeaderView *)self photoView];
  id v15 = [v14 heightAnchor];
  long long v16 = [(CNContactHeaderView *)self sizeAttributes];
  [v16 photoMinHeight];
  long long v17 = objc_msgSend(v15, "constraintEqualToConstant:");
  [(CNContactHeaderView *)self setPhotoHeightConstraint:v17];

  long long v18 = [(CNContactHeaderView *)self photoHeightConstraint];
  [v5 addObject:v18];

  [(CNContactHeaderView *)self setActivatedConstraints:v5];
  [MEMORY[0x1E4F28DC8] activateConstraints:v5];
}

- (void)setConstrainedMaxHeight:(double)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  [(CNContactHeaderView *)self setConstrainedMaxHeight:a3];
  [(CNContactHeaderView *)self setShouldUseConstrainedMaxHeight:v4];

  [(CNContactHeaderView *)self setNeedsLayout];
}

- (double)defaultMaxBaseHeight
{
  double v3 = 0.0;
  if ([(CNContactHeaderView *)self shouldShowBelowNavigationTitle])
  {
    BOOL v4 = [(CNContactHeaderView *)self sizeAttributes];
    [v4 maxNavbarTitleOffset];
    double v3 = v5;
  }
  id v6 = [(CNContactHeaderView *)self sizeAttributes];
  [v6 maxHeight];
  double v8 = v3 + v7;
  [(CNContactHeaderView *)self safeAreaTop];
  double v10 = v8 + v9;

  return v10;
}

- (BOOL)isAXSize
{
  return objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
}

- (double)maxHeight
{
  if ([(CNContactHeaderView *)self shouldUseConstrainedMaxHeight])
  {
    [(CNContactHeaderView *)self constrainedMaxHeight];
    double v4 = v3;
    [(CNContactHeaderView *)self defaultMaxBaseHeight];
    if (v4 < result) {
      return v4;
    }
  }
  else
  {
    [(CNContactHeaderView *)self defaultMaxBaseHeight];
  }
  return result;
}

- (double)minTitleOffset
{
  if (![(CNContactHeaderView *)self shouldShowBelowNavigationTitle]) {
    return 0.0;
  }
  double v3 = [(CNContactHeaderView *)self sizeAttributes];
  [v3 minNavbarTitleOffset];
  double v5 = v4;

  return v5;
}

- (double)minHeight
{
  [(CNContactHeaderView *)self minTitleOffset];
  double v4 = v3;
  double v5 = [(CNContactHeaderView *)self sizeAttributes];
  [v5 minHeight];
  double v7 = v4 + v6;
  [(CNContactHeaderView *)self safeAreaTop];
  double v9 = v7 + v8;

  return v9;
}

- (double)safeAreaPhotoOffset
{
  [(CNContactHeaderView *)self safeAreaInsets];
  double v4 = v3;
  double v5 = [(CNContactHeaderView *)self sizeAttributes];
  [v5 photoMinHeight];
  double v7 = v6;
  double v8 = [(CNContactHeaderView *)self sizeAttributes];
  [v8 photoMinTopMargin];
  double v10 = v7 + v9;

  BOOL v11 = [(CNContactHeaderView *)self sizeAttributes];
  double v12 = v11;
  if (v4 >= v10)
  {
    [v11 photoMinHeight];
    double v16 = -v15;
    long long v17 = [(CNContactHeaderView *)self sizeAttributes];
    [v17 photoMinTopMargin];
    double v14 = v16 - v18;
  }
  else
  {
    [v11 photoMinTopMargin];
    double v14 = -(v4 - v13);
  }

  if (v4 + v14 >= 10.0) {
    return v14;
  }
  else {
    return -(v4 + -10.0);
  }
}

- (double)safeAreaTop
{
  [(CNContactHeaderView *)self safeAreaInsets];
  double v4 = v3;
  [(CNContactHeaderView *)self safeAreaPhotoOffset];
  return v4 + v5;
}

- (id)contactStyle
{
  return +[CNContactStyle currentStyle];
}

- (void)setPresenterDelegate:(id)a3
{
  p_presenterDelegate = &self->_presenterDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_presenterDelegate, v5);
  [(CNContactPhotoView *)self->_photoView setPresenterDelegate:v5];
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNContactHeaderView;
  [(CNContactHeaderView *)&v4 dealloc];
}

- (void)updateForShowingNavBar:(BOOL)a3
{
  BOOL v3 = a3;
  -[CNContactHeaderView setShouldShowBelowNavigationTitle:](self, "setShouldShowBelowNavigationTitle:");
  id v5 = [(id)objc_opt_class() sizeAttributesShowingNavBar:v3];
  [(CNContactHeaderView *)self setSizeAttributes:v5];

  [(CNContactHeaderView *)self updateSizeDependentAttributes];
}

- (CNContactHeaderView)initWithContact:(id)a3 frame:(CGRect)a4 shouldAllowTakePhotoAction:(BOOL)a5 shouldAllowImageDrops:(BOOL)a6 showingNavBar:(BOOL)a7 monogramOnly:(BOOL)a8 delegate:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v12 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v38[2] = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)CNContactHeaderView;
  id v18 = a9;
  id v19 = a3;
  uint64_t v20 = -[CNContactHeaderView initWithFrame:](&v36, sel_initWithFrame_, x, y, width, height);
  objc_storeWeak((id *)&v20->_delegate, v18);

  [(CNContactHeaderView *)v20 setShowMonogramsOnly:v9];
  [(CNContactHeaderView *)v20 setShouldShowBelowNavigationTitle:v10];
  uint64_t v21 = [(id)objc_opt_class() sizeAttributesShowingNavBar:v10];
  [(CNContactHeaderView *)v20 setSizeAttributes:v21];

  dispatch_queue_t v22 = dispatch_queue_create("com.apple.contact.backgroundColorCaching", 0);
  backgroundColorCacheQueue = v20->_backgroundColorCacheQueue;
  v20->_backgroundColorCacheQueue = (OS_dispatch_queue *)v22;

  uint64_t v24 = [(id)objc_opt_class() makePhotoViewWithShouldAllowTakePhotoAction:v12 shouldAllowImageDrops:v11 monogramOnly:v9];
  photoView = v20->_photoView;
  v20->_photoView = (CNContactPhotoView *)v24;

  [(CNContactPhotoView *)v20->_photoView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNContactPhotoView *)v20->_photoView setDelegate:v20];
  [(CNContactHeaderView *)v20 addSubview:v20->_photoView];
  v38[0] = *MEMORY[0x1E4FB2988];
  uint64_t v26 = v38[0];
  uint64_t v27 = *MEMORY[0x1E4FB0700];
  v37[0] = @"ABTextStyleAttributeName";
  v37[1] = v27;
  id v28 = [(CNContactHeaderView *)v20 contactStyle];
  v29 = [v28 textColor];
  v38[1] = v29;
  id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  [(CNContactHeaderView *)v20 setNameTextAttributes:v30];

  uint64_t v31 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v26];
  v32 = (void *)sCurrentNameFont;
  sCurrentNameFont = v31;

  uint64_t v33 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2948]];
  id v34 = (void *)sCurrentTaglineFont;
  sCurrentTaglineFont = v33;

  [(CNContactHeaderView *)v20 setNeedsUpdateConstraints];
  [(CNContactHeaderView *)v20 setNeedsLayout];
  [(CNContactHeaderView *)v20 updateWithNewContact:v19];

  return v20;
}

- (id)descriptorForRequiredKeys
{
  CFAllocatorRef v2 = objc_opt_class();

  return (id)[v2 descriptorForRequiredKeys];
}

+ (id)sizeAttributesShowingNavBar:(BOOL)a3
{
  return +[CNContactHeaderViewSizeAttributes displayAttributes];
}

+ (id)makePhotoViewWithShouldAllowTakePhotoAction:(BOOL)a3 shouldAllowImageDrops:(BOOL)a4 monogramOnly:(BOOL)a5
{
  id v5 = a1;
  CNAbstractMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

+ (CGSize)defaultPhotoSize
{
  +[CNContactPhotoView defaultSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

@end
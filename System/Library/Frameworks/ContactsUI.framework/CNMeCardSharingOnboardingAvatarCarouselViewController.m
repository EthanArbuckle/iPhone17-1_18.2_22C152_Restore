@interface CNMeCardSharingOnboardingAvatarCarouselViewController
- (AVTAvatarRecord)avatarRecord;
- (CNContact)contact;
- (CNMeCardSharingOnboardingAvatarCarouselItem)animojiItem;
- (CNMeCardSharingOnboardingAvatarCarouselItem)monogramItem;
- (CNMeCardSharingOnboardingAvatarCarouselItem)photoItem;
- (CNMeCardSharingOnboardingAvatarCarouselItem)photoPickerItem;
- (CNMeCardSharingOnboardingAvatarCarouselItem)selectedItem;
- (CNMeCardSharingOnboardingAvatarCarouselLayout)layout;
- (CNMeCardSharingOnboardingAvatarCarouselViewController)initWithContact:(id)a3 avatarRecord:(id)a4 logger:(id)a5;
- (CNMeCardSharingOnboardingAvatarCarouselViewControllerDelegate)delegate;
- (CNSharingProfileLogger)logger;
- (NSArray)items;
- (PRMonogramColor)monogramColor;
- (UICollectionView)collectionView;
- (id)animojiItemWithRecord:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)contactImageItemWithContact:(id)a3;
- (id)itemsForNoAnimojiAndNoPhoto;
- (id)monogramImageItemWithContact:(id)a3;
- (id)standardItems;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)buildItems;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)notifyDelegateOfUpdateToCenterMostItem;
- (void)reloadForUpdatedContactPhoto;
- (void)reloadForUpdatedMonogram;
- (void)scrollToItemAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)setAnimojiItem:(id)a3;
- (void)setAvatarRecord:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setContact:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setItems:(id)a3;
- (void)setLayout:(id)a3;
- (void)setMonogramColor:(id)a3;
- (void)setMonogramItem:(id)a3;
- (void)setPhotoItem:(id)a3;
- (void)setPhotoPickerItem:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CNMeCardSharingOnboardingAvatarCarouselViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_monogramItem, 0);
  objc_storeStrong((id *)&self->_photoItem, 0);
  objc_storeStrong((id *)&self->_animojiItem, 0);
  objc_storeStrong((id *)&self->_photoPickerItem, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_monogramColor, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (CNSharingProfileLogger)logger
{
  return self->_logger;
}

- (void)setMonogramItem:(id)a3
{
}

- (CNMeCardSharingOnboardingAvatarCarouselItem)monogramItem
{
  return self->_monogramItem;
}

- (void)setPhotoItem:(id)a3
{
}

- (CNMeCardSharingOnboardingAvatarCarouselItem)photoItem
{
  return self->_photoItem;
}

- (void)setAnimojiItem:(id)a3
{
}

- (CNMeCardSharingOnboardingAvatarCarouselItem)animojiItem
{
  return self->_animojiItem;
}

- (void)setPhotoPickerItem:(id)a3
{
}

- (CNMeCardSharingOnboardingAvatarCarouselItem)photoPickerItem
{
  return self->_photoPickerItem;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setAvatarRecord:(id)a3
{
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setLayout:(id)a3
{
}

- (CNMeCardSharingOnboardingAvatarCarouselLayout)layout
{
  return self->_layout;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setItems:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setMonogramColor:(id)a3
{
}

- (PRMonogramColor)monogramColor
{
  return self->_monogramColor;
}

- (void)setDelegate:(id)a3
{
}

- (CNMeCardSharingOnboardingAvatarCarouselViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNMeCardSharingOnboardingAvatarCarouselViewControllerDelegate *)WeakRetained;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v15 = a4;
  v5 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self layout];
  int64_t v6 = [v5 selectedPageIndex];

  NSUInteger v7 = [(NSArray *)self->_items indexOfObject:self->_photoPickerItem];
  BOOL v8 = v6 < (int64_t)[(NSArray *)self->_items count];
  v9 = v15;
  if (v8)
  {
    v10 = [(NSArray *)self->_items objectAtIndexedSubscript:v6];
    v11 = v10;
    if (v10 == self->_photoPickerItem)
    {
      uint64_t v12 = [v15 row];

      if (v12 == v7)
      {
        v13 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self delegate];
        [v13 avatarCarouselViewControllerDidTapPhotoPickerCell:self];
LABEL_8:

        v9 = v15;
        goto LABEL_9;
      }
    }
    else
    {
    }
    collectionView = self->_collectionView;
    v13 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self layout];
    objc_msgSend(v13, "pageOffsetForIndex:", objc_msgSend(v15, "row"));
    -[UICollectionView setContentOffset:animated:](collectionView, "setContentOffset:animated:", 1);
    goto LABEL_8;
  }
LABEL_9:
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[CNMeCardSharingOnboardingAvatarCarouselCell cellIdentifier];
  v9 = [v6 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v7];

  v10 = -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", [v7 item]);
  v11 = [MEMORY[0x1E4F29128] UUID];
  [v10 imageInsetPercentage];
  objc_msgSend(v9, "setImageInsetPercentage:");
  [v9 setDisplaySessionUUID:v11];
  uint64_t v12 = [v10 cachedImage];

  if (v12)
  {
    v13 = [v10 cachedImage];
    [v9 setImage:v13];
  }
  else
  {
    [v9 setImage:0];
    objc_initWeak(&location, v10);
    v14 = [v10 imageProvider];

    if (v14)
    {
      id v15 = [v10 imageProvider];
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      v20 = __95__CNMeCardSharingOnboardingAvatarCarouselViewController_collectionView_cellForItemAtIndexPath___block_invoke;
      v21 = &unk_1E5497E18;
      objc_copyWeak(&v24, &location);
      id v22 = v9;
      id v23 = v11;
      ((void (**)(void, uint64_t *))v15)[2](v15, &v18);

      objc_destroyWeak(&v24);
    }
    objc_destroyWeak(&location);
  }
  v16 = objc_msgSend(v10, "title", v18, v19, v20, v21);
  [v9 setTitle:v16];

  return v9;
}

void __95__CNMeCardSharingOnboardingAvatarCarouselViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setCachedImage:v6];
  v4 = [*(id *)(a1 + 32) displaySessionUUID];
  v5 = *(void **)(a1 + 40);

  if (v4 == v5) {
    [*(id *)(a1 + 32) setImage:v6];
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NSArray *)self->_items count];
}

- (void)scrollToItemAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(NSArray *)self->_items count] > a3)
  {
    collectionView = self->_collectionView;
    id v8 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self layout];
    [v8 pageOffsetForIndex:a3];
    -[UICollectionView setContentOffset:animated:](collectionView, "setContentOffset:animated:", v4);
  }
}

- (CNMeCardSharingOnboardingAvatarCarouselItem)selectedItem
{
  v3 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self layout];
  unint64_t v4 = [v3 selectedPageIndex];

  if (v4 >= [(NSArray *)self->_items count])
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSArray *)self->_items objectAtIndexedSubscript:v4];
  }

  return (CNMeCardSharingOnboardingAvatarCarouselItem *)v5;
}

- (void)notifyDelegateOfUpdateToCenterMostItem
{
  id v4 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self selectedItem];
  if (v4)
  {
    v3 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self delegate];
    [v3 avatarCarouselViewControllerDidUpdateCenterMostItem:v4];
  }
}

- (id)animojiItemWithRecord:(id)a3
{
  id v3 = a3;
  id v4 = [CNMeCardSharingOnboardingAvatarCarouselItem alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__CNMeCardSharingOnboardingAvatarCarouselViewController_animojiItemWithRecord___block_invoke;
  v8[3] = &unk_1E5497DF0;
  id v9 = v3;
  id v5 = v3;
  id v6 = [(CNMeCardSharingOnboardingAvatarCarouselItem *)v4 initWithImageInsetPercentage:v8 imageProvider:0.1];
  [(CNMeCardSharingOnboardingAvatarCarouselItem *)v6 setImageType:3];

  return v6;
}

void __79__CNMeCardSharingOnboardingAvatarCarouselViewController_animojiItemWithRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  id v4 = (void *)getAVTAvatarRecordImageProviderClass_softClass_19651;
  uint64_t v18 = getAVTAvatarRecordImageProviderClass_softClass_19651;
  if (!getAVTAvatarRecordImageProviderClass_softClass_19651)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __getAVTAvatarRecordImageProviderClass_block_invoke_19652;
    v13 = &unk_1E549AD00;
    v14 = &v15;
    __getAVTAvatarRecordImageProviderClass_block_invoke_19652((uint64_t)&v10);
    id v4 = (void *)v16[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v15, 8);
  id v6 = objc_alloc_init(v5);
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  id v7 = (void *)getAVTRenderingScopeClass_softClass_19653;
  uint64_t v18 = getAVTRenderingScopeClass_softClass_19653;
  if (!getAVTRenderingScopeClass_softClass_19653)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __getAVTRenderingScopeClass_block_invoke_19654;
    v13 = &unk_1E549AD00;
    v14 = &v15;
    __getAVTRenderingScopeClass_block_invoke_19654((uint64_t)&v10);
    id v7 = (void *)v16[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v15, 8);
  id v9 = [v8 largeThumbnailScope];
  [v6 imageForRecord:*(void *)(a1 + 32) scope:v9 handler:v3];
}

- (id)monogramImageItemWithContact:(id)a3
{
  id v4 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self contact];
  id v5 = (void *)[v4 mutableCopy];

  [v5 removePhoto];
  id v6 = +[CNAvatarImageRendererSettings defaultSettings];
  id v7 = [[CNAvatarImageRenderer alloc] initWithSettings:v6];
  id v8 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self monogramColor];
  id v9 = self->_layout;
  uint64_t v10 = [CNMeCardSharingOnboardingAvatarCarouselItem alloc];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __86__CNMeCardSharingOnboardingAvatarCarouselViewController_monogramImageItemWithContact___block_invoke;
  v20 = &unk_1E5497DC8;
  v21 = v9;
  id v22 = v8;
  id v23 = v7;
  id v24 = v5;
  id v11 = v5;
  uint64_t v12 = v7;
  id v13 = v8;
  v14 = v9;
  uint64_t v15 = [(CNMeCardSharingOnboardingAvatarCarouselItem *)v10 initWithImageInsetPercentage:&v17 imageProvider:0.0];
  -[CNMeCardSharingOnboardingAvatarCarouselItem setImageType:](v15, "setImageType:", 2, v17, v18, v19, v20);

  return v15;
}

void __86__CNMeCardSharingOnboardingAvatarCarouselViewController_monogramImageItemWithContact___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) itemSize];
  id v4 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:color:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:color:", 0, 0, *(void *)(a1 + 40));
  id v5 = *(void **)(a1 + 48);
  v11[0] = *(void *)(a1 + 56);
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__CNMeCardSharingOnboardingAvatarCarouselViewController_monogramImageItemWithContact___block_invoke_2;
  v9[3] = &unk_1E5499AB0;
  id v10 = v3;
  id v7 = v3;
  id v8 = (id)[v5 renderAvatarsForContacts:v6 scope:v4 imageHandler:v9];
}

void __86__CNMeCardSharingOnboardingAvatarCarouselViewController_monogramImageItemWithContact___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__CNMeCardSharingOnboardingAvatarCarouselViewController_monogramImageItemWithContact___block_invoke_3;
  v6[3] = &unk_1E549B710;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __86__CNMeCardSharingOnboardingAvatarCarouselViewController_monogramImageItemWithContact___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)contactImageItemWithContact:(id)a3
{
  id v4 = a3;
  id v5 = [[CNMeCardSharingContactAvatarProvider alloc] initWithContact:v4];

  id v6 = self->_layout;
  id v7 = [CNMeCardSharingOnboardingAvatarCarouselItem alloc];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__CNMeCardSharingOnboardingAvatarCarouselViewController_contactImageItemWithContact___block_invoke;
  v12[3] = &unk_1E5497DA0;
  id v13 = v5;
  v14 = v6;
  uint64_t v15 = self;
  id v8 = v6;
  id v9 = v5;
  id v10 = [(CNMeCardSharingOnboardingAvatarCarouselItem *)v7 initWithImageInsetPercentage:v12 imageProvider:0.0];
  [(CNMeCardSharingOnboardingAvatarCarouselItem *)v10 setImageType:[(CNContact *)self->_contact rawImageType]];

  return v10;
}

void __85__CNMeCardSharingOnboardingAvatarCarouselViewController_contactImageItemWithContact___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) itemSize];
  double v6 = v5;
  double v8 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__CNMeCardSharingOnboardingAvatarCarouselViewController_contactImageItemWithContact___block_invoke_2;
  v10[3] = &unk_1E5497D78;
  v10[4] = *(void *)(a1 + 48);
  id v11 = v3;
  id v9 = v3;
  objc_msgSend(v4, "generateAvatarImageOfSize:imageHandler:", v10, v6, v8);
}

void __85__CNMeCardSharingOnboardingAvatarCarouselViewController_contactImageItemWithContact___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    double v6 = *(void **)(*(void *)(a1 + 32) + 1064);
    double v7 = [a3 localizedDescription];
    [v6 logOnboardingAvatarCarouselErrorCreatingContactImageWithDescription:v7];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__CNMeCardSharingOnboardingAvatarCarouselViewController_contactImageItemWithContact___block_invoke_3;
  v10[3] = &unk_1E549B710;
  id v8 = *(id *)(a1 + 40);
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __85__CNMeCardSharingOnboardingAvatarCarouselViewController_contactImageItemWithContact___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)reloadForUpdatedMonogram
{
  monogramItem = self->_monogramItem;
  self->_monogramItem = 0;

  [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self buildItems];
  collectionView = self->_collectionView;

  [(UICollectionView *)collectionView reloadData];
}

- (void)reloadForUpdatedContactPhoto
{
  p_photoItem = &self->_photoItem;
  photoItem = self->_photoItem;
  self->_photoItem = 0;

  monogramItem = self->_monogramItem;
  self->_monogramItem = 0;

  [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self buildItems];
  [(UICollectionView *)self->_collectionView reloadData];
  if (![(CNContact *)self->_contact imageDataAvailable]
    || [(CNContact *)self->_contact rawImageType] == 2)
  {
    p_photoItem = &self->_monogramItem;
  }
  id v10 = *p_photoItem;
  double v6 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self layout];
  objc_msgSend(v6, "pageOffsetForIndex:", -[NSArray indexOfObject:](self->_items, "indexOfObject:", v10));
  double v8 = v7;

  [(UICollectionView *)self->_collectionView contentOffset];
  if (v9 == v8) {
    [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self notifyDelegateOfUpdateToCenterMostItem];
  }
  else {
    -[UICollectionView setContentOffset:](self->_collectionView, "setContentOffset:", v8, 0.0);
  }
}

- (id)standardItems
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(CNContact *)self->_contact imageDataAvailable]) {
    BOOL v4 = [(CNContact *)self->_contact rawImageType] != 2;
  }
  else {
    BOOL v4 = 0;
  }
  if (self->_avatarRecord
    && (![(CNContact *)self->_contact imageDataAvailable]
     || [(CNContact *)self->_contact imageDataAvailable]
     && ![(CNContact *)self->_contact hasImageOfType:3]))
  {
    animojiItem = self->_animojiItem;
    if (!animojiItem)
    {
      double v6 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self animojiItemWithRecord:self->_avatarRecord];
      [(CNMeCardSharingOnboardingAvatarCarouselItem *)v6 setShouldShowVariants:1];
      double v7 = self->_animojiItem;
      self->_animojiItem = v6;

      animojiItem = self->_animojiItem;
    }
    [v3 addObject:animojiItem];
  }
  if (v4)
  {
    photoItem = self->_photoItem;
    if (!photoItem)
    {
      double v9 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self contactImageItemWithContact:self->_contact];
      [(CNMeCardSharingOnboardingAvatarCarouselItem *)v9 setShouldShowVariants:0];
      id v10 = self->_photoItem;
      self->_photoItem = v9;

      photoItem = self->_photoItem;
    }
    [v3 addObject:photoItem];
  }
  monogramItem = self->_monogramItem;
  if (!monogramItem)
  {
    id v12 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self monogramImageItemWithContact:self->_contact];
    [(CNMeCardSharingOnboardingAvatarCarouselItem *)v12 setShouldShowVariants:1];
    id v13 = self->_monogramItem;
    self->_monogramItem = v12;

    monogramItem = self->_monogramItem;
  }
  [v3 addObject:monogramItem];
  v14 = [CNMeCardSharingOnboardingAvatarCarouselItem alloc];
  uint64_t v15 = CNContactsUIBundle();
  v16 = [v15 localizedStringForKey:@"SHARING_ONBOARDING_VIEW_MORE" value:&stru_1ED8AC728 table:@"Localized"];
  uint64_t v17 = [(CNMeCardSharingOnboardingAvatarCarouselItem *)v14 initWithTitle:v16];

  photoPickerItem = self->_photoPickerItem;
  self->_photoPickerItem = v17;
  uint64_t v19 = v17;

  [v3 addObject:v19];
  v20 = (void *)[v3 copy];

  return v20;
}

- (id)itemsForNoAnimojiAndNoPhoto
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = [CNMeCardSharingOnboardingAvatarCarouselItem alloc];
  BOOL v4 = CNContactsUIBundle();
  id v5 = [v4 localizedStringForKey:@"SHARING_ONBOARDING_ADD_PHOTO" value:&stru_1ED8AC728 table:@"Localized"];
  double v6 = [(CNMeCardSharingOnboardingAvatarCarouselItem *)v3 initWithTitle:v5];

  objc_storeStrong((id *)&self->_photoPickerItem, v6);
  monogramItem = self->_monogramItem;
  if (!monogramItem)
  {
    double v8 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self monogramImageItemWithContact:self->_contact];
    [(CNMeCardSharingOnboardingAvatarCarouselItem *)v8 setShouldShowVariants:1];
    double v9 = self->_monogramItem;
    self->_monogramItem = v8;

    monogramItem = self->_monogramItem;
  }
  v12[0] = self->_photoPickerItem;
  v12[1] = monogramItem;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  return v10;
}

- (void)buildItems
{
  if (self->_avatarRecord || [(CNContact *)self->_contact imageDataAvailable])
  {
    id v3 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self standardItems];
  }
  else
  {
    id v3 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self itemsForNoAnimojiAndNoPhoto];
  }
  items = self->_items;
  self->_items = v3;
}

- (void)viewWillLayoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)CNMeCardSharingOnboardingAvatarCarouselViewController;
  [(CNMeCardSharingOnboardingAvatarCarouselViewController *)&v27 viewWillLayoutSubviews];
  id v3 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v6 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self view];
  [v6 bounds];
  double v8 = floor(v5 - v7);

  double v9 = floor(v8 * 0.5 * 0.5) + -10.0;
  id v10 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self view];
  [v10 bounds];
  double v12 = v11;
  id v13 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self view];
  [v13 bounds];
  -[UICollectionViewFlowLayout setItemSize:](self->_layout, "setItemSize:", v12, v14);

  [(UICollectionViewFlowLayout *)self->_layout setMinimumLineSpacing:v9];
  [(CNMeCardSharingOnboardingAvatarCarouselLayout *)self->_layout invalidateLayout];
  uint64_t v15 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self view];
  [v15 bounds];
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:");

  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", 0.0, 0.0, 0.0, v8 * 0.5);
  [(UICollectionViewFlowLayout *)self->_layout itemSize];
  double v17 = v9 + v16;
  [(UICollectionView *)self->_collectionView bounds];
  double v19 = v18;
  double v20 = -(v18 - v17);
  [(UICollectionViewFlowLayout *)self->_layout itemSize];
  double v22 = v19 - v21;
  id v23 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self collectionView];
  objc_msgSend(v23, "_setInterpageSpacing:", v20, 0.0);

  id v24 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self collectionView];
  objc_msgSend(v24, "_setPagingOrigin:", v22 * -0.5, 0.0);

  v25 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self collectionView];
  objc_msgSend(v25, "_setFirstPageOffset:", -(v8 * 0.5), 0.0);

  v26 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self collectionView];
  objc_msgSend(v26, "setContentOffset:", -(v8 * 0.5), 0.0);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNMeCardSharingOnboardingAvatarCarouselViewController;
  [(CNMeCardSharingOnboardingAvatarCarouselViewController *)&v4 viewWillAppear:a3];
  [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self notifyDelegateOfUpdateToCenterMostItem];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)CNMeCardSharingOnboardingAvatarCarouselViewController;
  [(CNMeCardSharingOnboardingAvatarCarouselViewController *)&v14 viewDidLoad];
  id v3 = objc_alloc_init(CNMeCardSharingOnboardingAvatarCarouselLayout);
  layout = self->_layout;
  self->_layout = v3;

  [(UICollectionViewFlowLayout *)self->_layout setScrollDirection:1];
  [(UICollectionViewFlowLayout *)self->_layout setMinimumInteritemSpacing:0.0];
  [(UICollectionViewFlowLayout *)self->_layout setMinimumLineSpacing:0.0];
  id v5 = objc_alloc(MEMORY[0x1E4FB1568]);
  double v6 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self view];
  [v6 bounds];
  double v7 = (UICollectionView *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", self->_layout);
  collectionView = self->_collectionView;
  self->_collectionView = v7;

  double v9 = [MEMORY[0x1E4FB1618] clearColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v9];

  [(UICollectionView *)self->_collectionView setDataSource:self];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setPagingEnabled:1];
  [(UICollectionView *)self->_collectionView setShowsVerticalScrollIndicator:0];
  [(UICollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
  id v10 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self view];
  [v10 addSubview:self->_collectionView];

  double v11 = self->_collectionView;
  uint64_t v12 = objc_opt_class();
  id v13 = +[CNMeCardSharingOnboardingAvatarCarouselCell cellIdentifier];
  [(UICollectionView *)v11 registerClass:v12 forCellWithReuseIdentifier:v13];

  [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self buildItems];
}

- (CNMeCardSharingOnboardingAvatarCarouselViewController)initWithContact:(id)a3 avatarRecord:(id)a4 logger:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CNMeCardSharingOnboardingAvatarCarouselViewController;
  uint64_t v12 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)&v19 initWithNibName:0 bundle:0];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_avatarRecord, a4);
    objc_storeStrong((id *)&v13->_contact, a3);
    objc_storeStrong((id *)&v13->_logger, a5);
    objc_super v14 = [MEMORY[0x1E4F89D48] availableColors];
    uint64_t v15 = [v14 firstObject];
    monogramColor = v13->_monogramColor;
    v13->_monogramColor = (PRMonogramColor *)v15;

    double v17 = v13;
  }

  return v13;
}

@end
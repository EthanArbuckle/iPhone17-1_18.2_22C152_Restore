@interface MKPlaceCollectionViewModel
- (BOOL)isSaved;
- (BOOL)shouldDisplayMetadata;
- (CGSize)photoSize;
- (GEOPlaceCollection)placeCollection;
- (MKCuratedCollectionsSyncCoordinator)syncCoordinator;
- (MKPlaceCollectionViewModel)initWithGEOPlaceCollection:(id)a3 usingSyncCoordinator:(id)a4 inContext:(int64_t)a5 usingTitleFont:(id)a6;
- (NSAttributedString)collectionLongTitle;
- (NSAttributedString)collectionTitle;
- (NSAttributedString)secondaryCollectionTitle;
- (UIColor)backgroundColor;
- (UIImage)publisherLogoImage;
- (id)description;
- (void)_publisherImageWithIdentifier:(unsigned int)a3 completion:(id)a4;
- (void)collectionImageForSize:(CGSize)a3 onCompletion:(id)a4;
- (void)contentCategorySizeDidChange;
- (void)initializeFonts;
- (void)publisherIconImageWithCompletion:(id)a3;
- (void)publisherLogoImageWithCompletion:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCollectionLongTitle:(id)a3;
- (void)setCollectionTitle:(id)a3;
- (void)setIsSaved:(BOOL)a3;
- (void)setPhotoSize:(CGSize)a3;
- (void)setPublisherLogoImage:(id)a3;
- (void)setSecondaryCollectionTitle:(id)a3;
- (void)setSyncCoordinator:(id)a3;
@end

@implementation MKPlaceCollectionViewModel

void __82__MKPlaceCollectionViewModel_ImageUtilities__collectionImageForSize_onCompletion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = +[MKPlaceCollectionImageProvider sharedInstance];
  v3 = [*(id *)(a1 + 32) placeCollection];
  unint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8) - 1;
  if (v4 > 9) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_18BD1BA30[v4];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__MKPlaceCollectionViewModel_ImageUtilities__collectionImageForSize_onCompletion___block_invoke_2;
  v6[3] = &unk_1E54BC950;
  objc_copyWeak(&v8, &location);
  id v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "loadGradientCoverImageWithCuratedCollection:size:contentSizeCategory:usingImageSource:completion:", v3, 0, v5, v6, *(double *)(a1 + 48), *(double *)(a1 + 56));

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (UIColor)backgroundColor
{
  backgroundColor = self->_backgroundColor;
  if (!backgroundColor)
  {
    unint64_t v4 = +[MKPlaceCollectionImageProvider sharedInstance];
    uint64_t v5 = [v4 joeColorForCuratedCollection:self->_placeCollection];
    v6 = self->_backgroundColor;
    self->_backgroundColor = v5;

    backgroundColor = self->_backgroundColor;
  }
  id v7 = backgroundColor;

  return v7;
}

- (NSAttributedString)collectionTitle
{
  v15[1] = *MEMORY[0x1E4F143B8];
  collectionTitle = self->_collectionTitle;
  if (!collectionTitle)
  {
    unint64_t v4 = [(MKPlaceCollectionViewModel *)self placeCollection];
    uint64_t v5 = [v4 collectionTitle];

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
      id v7 = [(MKPlaceCollectionViewModel *)self placeCollection];
      id v8 = [v7 collectionTitle];
      titleFont = self->_titleFont;
      uint64_t v14 = *MEMORY[0x1E4F42508];
      v15[0] = titleFont;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      v11 = (NSAttributedString *)[v6 initWithString:v8 attributes:v10];
      v12 = self->_collectionTitle;
      self->_collectionTitle = v11;
    }
    collectionTitle = self->_collectionTitle;
  }

  return collectionTitle;
}

- (GEOPlaceCollection)placeCollection
{
  return self->_placeCollection;
}

- (void)collectionImageForSize:(CGSize)a3 onCompletion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = (void (**)(id, UIImage *, void, uint64_t, uint64_t))a4;
  -[MKPlaceCollectionViewModel setPhotoSize:](self, "setPhotoSize:", width, height);
  collectionImage = self->_collectionImage;
  if (collectionImage)
  {
    v7[2](v7, collectionImage, 0, 1, 1);
  }
  else
  {
    imageLoadingQueue = self->_imageLoadingQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __82__MKPlaceCollectionViewModel_ImageUtilities__collectionImageForSize_onCompletion___block_invoke;
    v10[3] = &unk_1E54BD170;
    v10[4] = self;
    double v12 = width;
    double v13 = height;
    v11 = v7;
    dispatch_async(imageLoadingQueue, v10);
  }
}

- (void)setPhotoSize:(CGSize)a3
{
  self->_photoSize = a3;
}

- (void)publisherLogoImageWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  imageLoadingQueue = self->_imageLoadingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MKPlaceCollectionViewModel_publisherLogoImageWithCompletion___block_invoke;
  block[3] = &unk_1E54BD148;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(imageLoadingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)isSaved
{
  v2 = self;
  v3 = [(MKPlaceCollectionViewModel *)self syncCoordinator];
  LOBYTE(v2) = [v3 collectionIsSaved:v2->_placeCollection];

  return (char)v2;
}

- (MKCuratedCollectionsSyncCoordinator)syncCoordinator
{
  return self->_syncCoordinator;
}

uint64_t __71__MKPlaceCollectionViewModel__publisherImageWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __71__MKPlaceCollectionViewModel__publisherImageWithIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setPublisherLogoImage:v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __71__MKPlaceCollectionViewModel__publisherImageWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __71__MKPlaceCollectionViewModel__publisherImageWithIdentifier_completion___block_invoke_2;
      v4[3] = &unk_1E54B8360;
      id v6 = *(id *)(a1 + 32);
      id v5 = v3;
      dispatch_async(MEMORY[0x1E4F14428], v4);
    }
  }
}

- (void)setPublisherLogoImage:(id)a3
{
}

- (MKPlaceCollectionViewModel)initWithGEOPlaceCollection:(id)a3 usingSyncCoordinator:(id)a4 inContext:(int64_t)a5 usingTitleFont:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MKPlaceCollectionViewModel;
  uint64_t v14 = [(MKPlaceCollectionViewModel *)&v23 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_placeCollection, a3);
    uint64_t v16 = geo_dispatch_queue_create_with_qos();
    imageLoadingQueue = v15->_imageLoadingQueue;
    v15->_imageLoadingQueue = (OS_dispatch_queue *)v16;

    v18 = +[MKSystemController sharedInstance];
    [v18 screenScale];
    v15->_screenScale = v19;

    v20 = [MEMORY[0x1E4F28B50] mainBundle];
    v21 = [v20 bundleIdentifier];
    [v21 isEqualToString:@"com.apple.Maps"];

    objc_storeStrong((id *)&v15->_syncCoordinator, a4);
    v15->_context = a5;
    if (v13)
    {
      v15->_isUsingInjectedFont = 1;
      objc_storeStrong((id *)&v15->_titleFont, a6);
    }
    else
    {
      [(MKPlaceCollectionViewModel *)v15 initializeFonts];
      v15->_isUsingInjectedFont = 0;
    }
  }

  return v15;
}

- (void)initializeFonts
{
  uint64_t v3 = *MEMORY[0x1E4F43870];
  if (self->_context == 9)
  {
    objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", v3, *MEMORY[0x1E4F43930]);
    id v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    titleFont = self->_titleFont;
    self->_titleFont = v4;
  }
  else
  {
    v10 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:v3 maximumContentSizeCategory:*MEMORY[0x1E4F43780]];
    [(UIFont *)v10 pointSize];
    CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontMenuTitleFontType|0x60, v6, 0);
    CopyOfSystemUIFontWithGrade = (UIFont *)CTFontCreateCopyOfSystemUIFontWithGrade();
    CFRelease(UIFontForLanguage);
    id v9 = self->_titleFont;
    self->_titleFont = CopyOfSystemUIFontWithGrade;

    titleFont = v10;
  }
}

void __63__MKPlaceCollectionViewModel_publisherLogoImageWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uint64_t v3 = [WeakRetained placeCollection];
    id v4 = [v3 publisherAttribution];

    if ([v4 logoWithoutPaddingIdentifier]) {
      uint64_t v5 = [v4 logoWithoutPaddingIdentifier];
    }
    else {
      uint64_t v5 = [v4 logoIdentifier];
    }
    [v6 _publisherImageWithIdentifier:v5 completion:*(void *)(a1 + 32)];

    id WeakRetained = v6;
  }
}

- (void)_publisherImageWithIdentifier:(unsigned int)a3 completion:(id)a4
{
  id v6 = a4;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __71__MKPlaceCollectionViewModel__publisherImageWithIdentifier_completion___block_invoke;
  v24[3] = &unk_1E54BD0D0;
  id v7 = v6;
  id v25 = v7;
  uint64_t v8 = MEMORY[0x18C139AE0](v24);
  id v9 = (void (**)(void, void))v8;
  unint64_t context = self->_context;
  if (context <= 9)
  {
    if (context == 2)
    {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
    else
    {
      id v11 = [(MKPlaceCollectionViewModel *)self publisherLogoImage];
      if (v11)
      {
        ((void (**)(void, void *))v9)[2](v9, v11);
      }
      else
      {
        id v12 = [(MKPlaceCollectionViewModel *)self placeCollection];
        id v13 = [v12 publisherAttribution];
        uint64_t v14 = [v13 displayName];

        objc_initWeak(&location, self);
        imageLoadingQueue = self->_imageLoadingQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __71__MKPlaceCollectionViewModel__publisherImageWithIdentifier_completion___block_invoke_3;
        block[3] = &unk_1E54BD120;
        unsigned int v22 = a3;
        id v18 = v14;
        double v19 = self;
        id v16 = v14;
        objc_copyWeak(&v21, &location);
        v20 = v9;
        dispatch_async(imageLoadingQueue, block);

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (UIImage)publisherLogoImage
{
  return (UIImage *)objc_getProperty(self, a2, 120, 1);
}

void __71__MKPlaceCollectionViewModel__publisherImageWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  v2 = +[MKPlaceCollectionsPublisherIconManager sharedInstance];
  uint64_t v3 = *(unsigned int *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(double *)(*(void *)(a1 + 40) + 24);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__MKPlaceCollectionViewModel__publisherImageWithIdentifier_completion___block_invoke_4;
  v6[3] = &unk_1E54BD0F8;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  id v7 = *(id *)(a1 + 48);
  [v2 iconForPublisherNamed:v4 usingId:v3 contentScale:v6 onCompletion:v5];

  objc_destroyWeak(&v8);
}

void __82__MKPlaceCollectionViewModel_ImageUtilities__collectionImageForSize_onCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, int a5)
{
  id v12 = a2;
  id v9 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v12 && !v9 && a5)
    {
      objc_storeStrong(WeakRetained + 4, a2);
      id v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      id v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v11();
  }
}

- (void)contentCategorySizeDidChange
{
  collectionTitle = self->_collectionTitle;
  self->_collectionTitle = 0;

  collectionLongTitle = self->_collectionLongTitle;
  self->_collectionLongTitle = 0;

  secondaryCollectionTitle = self->_secondaryCollectionTitle;
  self->_secondaryCollectionTitle = 0;

  if (!self->_isUsingInjectedFont)
  {
    [(MKPlaceCollectionViewModel *)self initializeFonts];
  }
}

- (NSAttributedString)collectionLongTitle
{
  v15[1] = *MEMORY[0x1E4F143B8];
  collectionLongTitle = self->_collectionLongTitle;
  if (!collectionLongTitle)
  {
    uint64_t v4 = [(MKPlaceCollectionViewModel *)self placeCollection];
    double v5 = [v4 collectionLongTitle];

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
      id v7 = [(MKPlaceCollectionViewModel *)self placeCollection];
      id v8 = [v7 collectionLongTitle];
      titleFont = self->_titleFont;
      uint64_t v14 = *MEMORY[0x1E4F42508];
      v15[0] = titleFont;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      id v11 = (NSAttributedString *)[v6 initWithString:v8 attributes:v10];
      id v12 = self->_collectionLongTitle;
      self->_collectionLongTitle = v11;
    }
    collectionLongTitle = self->_collectionLongTitle;
  }

  return collectionLongTitle;
}

- (NSAttributedString)secondaryCollectionTitle
{
  v23[1] = *MEMORY[0x1E4F143B8];
  secondaryCollectionTitle = self->_secondaryCollectionTitle;
  if (secondaryCollectionTitle)
  {
    uint64_t v3 = secondaryCollectionTitle;
  }
  else
  {
    double v5 = NSString;
    id v6 = _MKLocalizedStringFromThisBundle(@"[Guides Home] Place Count In Collection List Cell");
    id v7 = [(MKPlaceCollectionViewModel *)self placeCollection];
    id v8 = objc_msgSend(v5, "localizedStringWithFormat:", v6, objc_msgSend(v7, "numberOfItems"));

    id v9 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v10 = [v9 userInterfaceLayoutDirection];

    id v11 = NSString;
    id v12 = [(MKPlaceCollectionViewModel *)self placeCollection];
    id v13 = [v12 publisherAttribution];
    uint64_t v14 = [v13 displayName];
    v15 = (void *)v14;
    if (v10 == 1) {
      [v11 localizedStringWithFormat:@"%@ · %@", v8, v14];
    }
    else {
    id v16 = [v11 localizedStringWithFormat:@"%@ · %@", v14, v8];
    }

    uint64_t v22 = *MEMORY[0x1E4F42508];
    v17 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E4F438C8]);
    v23[0] = v17;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];

    double v19 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v16 attributes:v18];
    v20 = self->_secondaryCollectionTitle;
    self->_secondaryCollectionTitle = v19;

    uint64_t v3 = self->_secondaryCollectionTitle;
  }

  return v3;
}

- (BOOL)shouldDisplayMetadata
{
  return self->_context == 9;
}

- (void)publisherIconImageWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  imageLoadingQueue = self->_imageLoadingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MKPlaceCollectionViewModel_publisherIconImageWithCompletion___block_invoke;
  block[3] = &unk_1E54BD148;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(imageLoadingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __63__MKPlaceCollectionViewModel_publisherIconImageWithCompletion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v2);
    id v4 = [v3 placeCollection];
    double v5 = [v4 publisherAttribution];
    uint64_t v6 = [v5 iconIdentifier];

    [WeakRetained _publisherImageWithIdentifier:v6 completion:*(void *)(a1 + 32)];
  }
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(GEOPlaceCollection *)self->_placeCollection collectionLongTitle];
  double v5 = v4;
  if (!v4)
  {
    double v5 = [(GEOPlaceCollection *)self->_placeCollection collectionTitle];
  }
  uint64_t v6 = [(GEOPlaceCollection *)self->_placeCollection collectionIdentifier];
  id v7 = [v3 stringWithFormat:@"Guide: %@, MUID: %llu", v5, objc_msgSend(v6, "muid")];

  if (!v4) {

  }
  return v7;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)setCollectionTitle:(id)a3
{
}

- (void)setCollectionLongTitle:(id)a3
{
}

- (void)setSecondaryCollectionTitle:(id)a3
{
}

- (void)setIsSaved:(BOOL)a3
{
  self->_isSaved = a3;
}

- (void)setSyncCoordinator:(id)a3
{
}

- (CGSize)photoSize
{
  double width = self->_photoSize.width;
  double height = self->_photoSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherLogoImage, 0);
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_placeCollection, 0);
  objc_storeStrong((id *)&self->_secondaryCollectionTitle, 0);
  objc_storeStrong((id *)&self->_collectionLongTitle, 0);
  objc_storeStrong((id *)&self->_collectionTitle, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_publisherLogoImageQueue, 0);
  objc_storeStrong((id *)&self->_imageLoadingQueue, 0);
  objc_storeStrong((id *)&self->_collectionImage, 0);

  objc_storeStrong((id *)&self->_titleFont, 0);
}

@end
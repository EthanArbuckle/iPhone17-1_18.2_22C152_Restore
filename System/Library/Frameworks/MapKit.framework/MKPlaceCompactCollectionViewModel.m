@interface MKPlaceCompactCollectionViewModel
- (BOOL)isEqual:(id)a3;
- (BOOL)isWorldwide;
- (BOOL)shouldShowSubtitleForCategory:(id)a3;
- (BOOL)useBorderHighlight;
- (CGSize)photoSize;
- (GEOGuideLocation)guideLocation;
- (MKPlaceCompactCollectionViewModel)initWithGuideLocation:(id)a3 context:(int64_t)a4 useBorderHighlight:(BOOL)a5;
- (NSAttributedString)subTitle;
- (NSAttributedString)title;
- (NSString)preferredSizeCategory;
- (UIColor)backgroundColor;
- (UIFont)subTitleFont;
- (UIFont)titleFont;
- (UIImage)image;
- (id)description;
- (int64_t)context;
- (void)compactCollectionImageForSize:(CGSize)a3 onCompletion:(id)a4;
- (void)contentCategorySizeDidChange:(id)a3;
- (void)initializeFonts;
- (void)setBackgroundColor:(id)a3;
- (void)setContext:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setPhotoSize:(CGSize)a3;
- (void)setPreferredSizeCategory:(id)a3;
- (void)setSubTitle:(id)a3;
- (void)setSubTitleFont:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setUseBorderHighlight:(BOOL)a3;
@end

@implementation MKPlaceCompactCollectionViewModel

- (MKPlaceCompactCollectionViewModel)initWithGuideLocation:(id)a3 context:(int64_t)a4 useBorderHighlight:(BOOL)a5
{
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MKPlaceCompactCollectionViewModel;
  v10 = [(MKPlaceCompactCollectionViewModel *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_guideLocation, a3);
    v11->_context = a4;
    v11->_useBorderHighlight = a5;
    id v12 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v13 = objc_msgSend(v12, "initWithObjects:", *MEMORY[0x1E4F437A8], *MEMORY[0x1E4F437C8], *MEMORY[0x1E4F437B8], *MEMORY[0x1E4F437B0], *MEMORY[0x1E4F437A0], 0);
    supportedSizeCategories = v11->_supportedSizeCategories;
    v11->_supportedSizeCategories = (NSArray *)v13;

    [(MKPlaceCompactCollectionViewModel *)v11 initializeFonts];
  }

  return v11;
}

- (void)initializeFonts
{
  id v7 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F43870] maximumContentSizeCategory:*MEMORY[0x1E4F43790]];
  [v7 pointSize];
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontMenuTitleFontType|0x60, v3, 0);
  CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade();
  CFRelease(UIFontForLanguage);
  [(MKPlaceCompactCollectionViewModel *)self setTitleFont:CopyOfSystemUIFontWithGrade];

  v6 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E4F438C8]);
  [(MKPlaceCompactCollectionViewModel *)self setSubTitleFont:v6];
}

- (void)contentCategorySizeDidChange:(id)a3
{
  id v8 = a3;
  id v4 = [(MKPlaceCompactCollectionViewModel *)self preferredSizeCategory];

  v5 = v8;
  if (v4 != v8)
  {
    [(MKPlaceCompactCollectionViewModel *)self setPreferredSizeCategory:v8];
    title = self->_title;
    self->_title = 0;

    subTitle = self->_subTitle;
    self->_subTitle = 0;

    [(MKPlaceCompactCollectionViewModel *)self initializeFonts];
    v5 = v8;
  }
}

- (NSAttributedString)title
{
  v18[2] = *MEMORY[0x1E4F143B8];
  title = self->_title;
  if (title) {
    goto LABEL_2;
  }
  v5 = [(MKPlaceCompactCollectionViewModel *)self guideLocation];
  v6 = [v5 title];

  if (!v6)
  {
    title = self->_title;
LABEL_2:
    CGFloat v3 = title;
    goto LABEL_5;
  }
  v17[0] = *MEMORY[0x1E4F42508];
  id v7 = [(MKPlaceCompactCollectionViewModel *)self titleFont];
  v18[0] = v7;
  v17[1] = *MEMORY[0x1E4F42520];
  LODWORD(v8) = 1045220557;
  id v9 = [NSNumber numberWithFloat:v8];
  v18[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v12 = [(MKPlaceCompactCollectionViewModel *)self guideLocation];
  uint64_t v13 = [v12 title];
  v14 = (NSAttributedString *)[v11 initWithString:v13 attributes:v10];
  v15 = self->_title;
  self->_title = v14;

  CGFloat v3 = self->_title;
LABEL_5:

  return v3;
}

- (NSAttributedString)subTitle
{
  v16[1] = *MEMORY[0x1E4F143B8];
  subTitle = self->_subTitle;
  if (subTitle) {
    goto LABEL_2;
  }
  v5 = [(MKPlaceCompactCollectionViewModel *)self guideLocation];
  v6 = [v5 country];

  if (!v6)
  {
    subTitle = self->_subTitle;
LABEL_2:
    CGFloat v3 = subTitle;
    goto LABEL_5;
  }
  uint64_t v15 = *MEMORY[0x1E4F42508];
  id v7 = [(MKPlaceCompactCollectionViewModel *)self subTitleFont];
  v16[0] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

  id v9 = objc_alloc(MEMORY[0x1E4F28B18]);
  v10 = [(MKPlaceCompactCollectionViewModel *)self guideLocation];
  id v11 = [v10 country];
  id v12 = (NSAttributedString *)[v9 initWithString:v11 attributes:v8];
  uint64_t v13 = self->_subTitle;
  self->_subTitle = v12;

  CGFloat v3 = self->_subTitle;
LABEL_5:

  return v3;
}

- (BOOL)shouldShowSubtitleForCategory:(id)a3
{
  return [(NSArray *)self->_supportedSizeCategories containsObject:a3];
}

- (UIColor)backgroundColor
{
  backgroundColor = self->_backgroundColor;
  if (!backgroundColor)
  {
    id v4 = +[MKPlaceCollectionImageProvider sharedInstance];
    v5 = [(MKPlaceCompactCollectionViewModel *)self guideLocation];
    objc_msgSend(v4, "joeColorForCompactCollection:usingCarouselContext:", v5, -[MKPlaceCompactCollectionViewModel context](self, "context"));
    v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_backgroundColor;
    self->_backgroundColor = v6;

    backgroundColor = self->_backgroundColor;
  }
  double v8 = backgroundColor;

  return v8;
}

- (BOOL)useBorderHighlight
{
  return !self->_context && self->_useBorderHighlight;
}

- (BOOL)isWorldwide
{
  return [(GEOGuideLocation *)self->_guideLocation type] == 2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MKPlaceCompactCollectionViewModel *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    id v7 = [(MKPlaceCompactCollectionViewModel *)self guideLocation];
    double v8 = [(MKPlaceCompactCollectionViewModel *)v6 guideLocation];

    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)description
{
  v2 = NSString;
  CGFloat v3 = [(MKPlaceCompactCollectionViewModel *)self title];
  id v4 = [v3 string];
  v5 = [v2 stringWithFormat:@"Guide Location: %@", v4];

  return v5;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)setUseBorderHighlight:(BOOL)a3
{
  self->_useBorderHighlight = a3;
}

- (void)setTitle:(id)a3
{
}

- (void)setSubTitle:(id)a3
{
}

- (GEOGuideLocation)guideLocation
{
  return self->_guideLocation;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
}

- (UIFont)subTitleFont
{
  return self->_subTitleFont;
}

- (void)setSubTitleFont:(id)a3
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

- (void)setPhotoSize:(CGSize)a3
{
  self->_photoSize = a3;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)preferredSizeCategory
{
  return self->_preferredSizeCategory;
}

- (void)setPreferredSizeCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSizeCategory, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subTitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_guideLocation, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);

  objc_storeStrong((id *)&self->_supportedSizeCategories, 0);
}

- (void)compactCollectionImageForSize:(CGSize)a3 onCompletion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = (void (**)(id, void *, void, uint64_t, uint64_t))a4;
  -[MKPlaceCompactCollectionViewModel setPhotoSize:](self, "setPhotoSize:", width, height);
  double v8 = [(MKPlaceCompactCollectionViewModel *)self image];

  if (v8)
  {
    char v9 = [(MKPlaceCompactCollectionViewModel *)self image];
    v7[2](v7, v9, 0, 1, 1);
  }
  else
  {
    objc_initWeak(&location, self);
    v10 = dispatch_get_global_queue(25, 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __96__MKPlaceCompactCollectionViewModel_ImageUtilities__compactCollectionImageForSize_onCompletion___block_invoke;
    v11[3] = &unk_1E54BC978;
    v11[4] = self;
    v13[1] = *(id *)&width;
    v13[2] = *(id *)&height;
    objc_copyWeak(v13, &location);
    id v12 = v7;
    dispatch_async(v10, v11);

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
}

void __96__MKPlaceCompactCollectionViewModel_ImageUtilities__compactCollectionImageForSize_onCompletion___block_invoke(uint64_t a1)
{
  v2 = +[MKPlaceCollectionImageProvider sharedInstance];
  CGFloat v3 = [*(id *)(a1 + 32) guideLocation];
  uint64_t v4 = [*(id *)(a1 + 32) context];
  if (v4 == 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = v4 == 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__MKPlaceCompactCollectionViewModel_ImageUtilities__compactCollectionImageForSize_onCompletion___block_invoke_2;
  v6[3] = &unk_1E54BC950;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  id v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "loadCoverImageWithGuideLocation:size:usingImageSource:completion:", v3, v5, v6, *(double *)(a1 + 56), *(double *)(a1 + 64));

  objc_destroyWeak(&v8);
}

void __96__MKPlaceCompactCollectionViewModel_ImageUtilities__compactCollectionImageForSize_onCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, int a5)
{
  id v12 = a2;
  id v9 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v12 && !v9 && a5)
    {
      objc_storeStrong(WeakRetained + 10, a2);
      id v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      id v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v11();
  }
}

@end
@interface PDFThumbnailView
- (BOOL)allowsPageReordering;
- (CGSize)thumbnailSize;
- (NSArray)selectedPages;
- (PDFThumbnailContextMenuDelegate)thumbnailContextMenuDelegate;
- (PDFThumbnailDataSourceDelegate)thumbnailDataSourceDelegate;
- (PDFThumbnailLayoutMode)layoutMode;
- (PDFThumbnailView)init;
- (PDFThumbnailView)initWithCoder:(id)a3;
- (PDFThumbnailView)initWithFrame:(CGRect)a3;
- (PDFThumbnailView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (PDFThumbnailView)initWithStyle:(int64_t)a3;
- (PDFView)PDFView;
- (UIColor)backgroundColor;
- (UIEdgeInsets)contentInset;
- (void)_commonInitWithStyle:(int64_t)a3;
- (void)_updateLayout;
- (void)currentPageChanged:(id)a3;
- (void)dealloc;
- (void)documentChanged:(id)a3;
- (void)documentMutated:(id)a3;
- (void)documentUnlocked:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)pageChanged:(id)a3;
- (void)setAllowsPageReordering:(BOOL)a3;
- (void)setBackgroundColor:(UIColor *)backgroundColor;
- (void)setContentInset:(UIEdgeInsets)contentInset;
- (void)setLayoutMode:(PDFThumbnailLayoutMode)layoutMode;
- (void)setPDFView:(PDFView *)PDFView;
- (void)setThumbnailContextMenuDelegate:(id)a3;
- (void)setThumbnailDataSourceDelegate:(id)a3;
- (void)setThumbnailSize:(CGSize)thumbnailSize;
- (void)setupNotifications;
- (void)updateNotificationsForDocument;
@end

@implementation PDFThumbnailView

- (PDFThumbnailView)init
{
  v5.receiver = self;
  v5.super_class = (Class)PDFThumbnailView;
  v2 = [(PDFThumbnailView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PDFThumbnailView *)v2 _commonInitWithStyle:0];
  }
  return v3;
}

- (PDFThumbnailView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PDFThumbnailView;
  v3 = -[PDFThumbnailView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PDFThumbnailView *)v3 _commonInitWithStyle:0];
  }
  return v4;
}

- (PDFThumbnailView)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDFThumbnailView;
  objc_super v5 = [(PDFThumbnailView *)&v13 initWithCoder:v4];
  if (v5)
  {
    if ([v4 allowsKeyedCoding])
    {
      -[PDFThumbnailView _commonInitWithStyle:](v5, "_commonInitWithStyle:", (int)[v4 decodeIntForKey:@"Style"]);
      [v4 decodeFloatForKey:@"ThumbSizeWidth"];
      v5->_thumbnailSize.width = v6;
      [v4 decodeFloatForKey:@"ThumbSizeHeight"];
      v5->_thumbnailSize.height = v7;
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PDFView"];
    }
    else
    {
      int v12 = 1;
      [v4 decodeValueOfObjCType:"i" at:&v12 size:4];
      *(void *)v11 = 0;
      [v4 decodeValueOfObjCType:"q" at:v11 size:8];
      [(PDFThumbnailView *)v5 _commonInitWithStyle:*(void *)v11];
      v11[0] = 0.0;
      [v4 decodeValueOfObjCType:"f" at:v11 size:4];
      v5->_thumbnailSize.width = v11[0];
      [v4 decodeValueOfObjCType:"f" at:v11 size:4];
      v5->_thumbnailSize.height = v11[0];
      uint64_t v8 = [v4 decodeObject];
    }
    v9 = (void *)v8;
    if (v8) {
      [(PDFThumbnailView *)v5 setPDFView:v8];
    }

    if (v5->_thumbnailSize.width <= 0.0 || v5->_thumbnailSize.height <= 0.0) {
      v5->_thumbnailSize = (CGSize)kDefaultThumbnailSize;
    }
    [(PDFThumbnailView *)v5 setBackgroundColor:v5->_backgroundColor];
    [(PDFThumbnailView *)v5 _updateLayout];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(PDFThumbnailCollectionViewInterface *)self->_iconsView removeFromSuperview];
  v12.receiver = self;
  v12.super_class = (Class)PDFThumbnailView;
  [(PDFThumbnailView *)&v12 encodeWithCoder:v4];
  [(PDFThumbnailView *)self addSubview:self->_iconsView];
  if ([v4 allowsKeyedCoding])
  {
    [v4 encodeInt:LODWORD(self->_style) forKey:@"Style"];
    CGFloat width = self->_thumbnailSize.width;
    *(float *)&CGFloat width = width;
    [v4 encodeFloat:@"ThumbSizeWidth" forKey:width];
    CGFloat height = self->_thumbnailSize.height;
    *(float *)&CGFloat height = height;
    [v4 encodeFloat:@"ThumbSizeHeight" forKey:height];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
    [v4 encodeConditionalObject:WeakRetained forKey:@"PDFView"];
  }
  else
  {
    int v11 = 1;
    [v4 encodeValueOfObjCType:"i" at:&v11];
    [v4 encodeValueOfObjCType:"q" at:&self->_style];
    float v8 = self->_thumbnailSize.width;
    float v10 = v8;
    [v4 encodeValueOfObjCType:"f" at:&v10];
    float v9 = self->_thumbnailSize.height;
    float v10 = v9;
    [v4 encodeValueOfObjCType:"f" at:&v10];
  }
}

- (PDFThumbnailView)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PDFThumbnailView;
  id v4 = [(PDFThumbnailView *)&v7 init];
  objc_super v5 = v4;
  if (v4) {
    [(PDFThumbnailView *)v4 _commonInitWithStyle:a3];
  }
  return v5;
}

- (PDFThumbnailView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PDFThumbnailView;
  objc_super v5 = -[PDFThumbnailView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  float v6 = v5;
  if (v5) {
    [(PDFThumbnailView *)v5 _commonInitWithStyle:a4];
  }
  return v6;
}

- (void)_commonInitWithStyle:(int64_t)a3
{
  v24[4] = *MEMORY[0x263EF8340];
  if (!self->_iconsView)
  {
    self->_style = a3;
    self->_thumbnailSize = (CGSize)kDefaultThumbnailSize;
    long long v4 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
    *(_OWORD *)&self->_contentInset.top = *MEMORY[0x263F834E8];
    *(_OWORD *)&self->_contentInset.bottom = v4;
    if (a3 == 1)
    {
      objc_super v5 = [[PDFThumbnailsCollectionView alloc] initFromThumbnailView:self];
      iconsView = self->_iconsView;
      self->_iconsView = v5;

      [(PDFThumbnailView *)self addSubview:self->_iconsView];
      [(PDFThumbnailCollectionViewInterface *)self->_iconsView setTranslatesAutoresizingMaskIntoConstraints:0];
      v19 = (void *)MEMORY[0x263F08938];
      v23 = [(PDFThumbnailCollectionViewInterface *)self->_iconsView bottomAnchor];
      v22 = [(PDFThumbnailView *)self bottomAnchor];
      v21 = [v23 constraintEqualToAnchor:v22];
      v24[0] = v21;
      v20 = [(PDFThumbnailCollectionViewInterface *)self->_iconsView topAnchor];
      objc_super v7 = [(PDFThumbnailView *)self topAnchor];
      objc_super v8 = [v20 constraintEqualToAnchor:v7];
      v24[1] = v8;
      float v9 = [(PDFThumbnailCollectionViewInterface *)self->_iconsView leadingAnchor];
      float v10 = [(PDFThumbnailView *)self leadingAnchor];
      int v11 = [v9 constraintEqualToAnchor:v10];
      v24[2] = v11;
      objc_super v12 = [(PDFThumbnailCollectionViewInterface *)self->_iconsView trailingAnchor];
      objc_super v13 = [(PDFThumbnailView *)self trailingAnchor];
      v14 = [v12 constraintEqualToAnchor:v13];
      v24[3] = v14;
      v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:4];
      [v19 activateConstraints:v15];
    }
    else
    {
      v16 = [[PDFIconsView alloc] initFromThumbnailView:self];
      v17 = self->_iconsView;
      self->_iconsView = v16;

      v18 = self->_iconsView;
      [(PDFThumbnailView *)self bounds];
      -[PDFThumbnailCollectionViewInterface setFrame:](v18, "setFrame:");
      [(PDFThumbnailCollectionViewInterface *)self->_iconsView setAutoresizingMask:18];
      [(PDFThumbnailView *)self addSubview:self->_iconsView];
    }
    [(PDFThumbnailView *)self setupNotifications];
  }
}

- (void)setupNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_documentChanged_ name:@"PDFViewChangedDocument" object:0];
  [v3 addObserver:self selector:sel_currentPageChanged_ name:@"PDFViewChangedPage" object:0];
  [v3 addObserver:self selector:sel_pageChanged_ name:@"PDFViewAnnotationsDidChange" object:0];
  [(PDFThumbnailView *)self updateNotificationsForDocument];
}

- (void)updateNotificationsForDocument
{
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  long long v4 = [WeakRetained document];

  [v5 removeObserver:self name:@"PDFDocumentDidUnlock" object:0];
  [v5 removeObserver:self name:@"PDFDocumentDidMutate" object:0];
  [v5 removeObserver:self name:@"PDFPageDidChangeBounds" object:0];
  [v5 removeObserver:self name:@"PDFPageDidRotate" object:0];
  if (v4)
  {
    [v5 addObserver:self selector:sel_documentUnlocked_ name:@"PDFDocumentDidUnlock" object:v4];
    [v5 addObserver:self selector:sel_documentMutated_ name:@"PDFDocumentDidMutate" object:v4];
    [v5 addObserver:self selector:sel_pageChanged_ name:@"PDFPageDidChangeBounds" object:v4];
    [v5 addObserver:self selector:sel_pageChanged_ name:@"PDFPageDidRotate" object:v4];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PDFThumbnailView;
  [(PDFThumbnailView *)&v4 dealloc];
}

- (void)setPDFView:(PDFView *)PDFView
{
  objc_storeWeak((id *)&self->_pdfView, PDFView);
  [(PDFThumbnailCollectionViewInterface *)self->_iconsView updateIconsImages];
  [(PDFThumbnailView *)self _updateLayout];

  [(PDFThumbnailView *)self updateNotificationsForDocument];
}

- (PDFView)PDFView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);

  return (PDFView *)WeakRetained;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  objc_super v4 = (UIColor *)[(UIColor *)backgroundColor copy];
  id v5 = self->_backgroundColor;
  self->_backgroundColor = v4;

  iconsView = self->_iconsView;
  objc_super v7 = self->_backgroundColor;

  [(PDFThumbnailCollectionViewInterface *)iconsView setBackgroundColor:v7];
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSArray)selectedPages
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [(PDFThumbnailCollectionViewInterface *)self->_iconsView currentPage];
  id v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_super v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  else
  {
    objc_super v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)setThumbnailSize:(CGSize)thumbnailSize
{
  self->_thumbnailSize = thumbnailSize;
  [(PDFThumbnailView *)self _updateLayout];
  iconsView = self->_iconsView;

  [(PDFThumbnailCollectionViewInterface *)iconsView updateIconsImages];
}

- (CGSize)thumbnailSize
{
  double width = self->_thumbnailSize.width;
  double height = self->_thumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAllowsPageReordering:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    iconsView = self->_iconsView;
    [(PDFThumbnailCollectionViewInterface *)iconsView setAllowsPageReordering:v3];
  }
}

- (BOOL)allowsPageReordering
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  iconsView = self->_iconsView;

  return [(PDFThumbnailCollectionViewInterface *)iconsView allowsPageReordering];
}

- (void)setLayoutMode:(PDFThumbnailLayoutMode)layoutMode
{
  self->_layoutMode = layoutMode;
  [(PDFThumbnailView *)self _updateLayout];
}

- (PDFThumbnailLayoutMode)layoutMode
{
  return self->_layoutMode;
}

- (void)setContentInset:(UIEdgeInsets)contentInset
{
  self->_contentInset = contentInset;
  [(PDFThumbnailView *)self _updateLayout];
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_updateLayout
{
}

- (void)documentChanged:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  id v5 = [v6 object];

  if (WeakRetained == v5)
  {
    [(PDFThumbnailCollectionViewInterface *)self->_iconsView documentChanged:v6];
    [(PDFThumbnailView *)self updateNotificationsForDocument];
  }
}

- (void)documentUnlocked:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  id v5 = [WeakRetained document];
  id v6 = [v7 object];

  if (v5 == v6) {
    [(PDFThumbnailCollectionViewInterface *)self->_iconsView documentChanged:v7];
  }
}

- (void)documentMutated:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  id v5 = [WeakRetained document];
  id v6 = [v7 object];

  if (v5 == v6) {
    [(PDFThumbnailCollectionViewInterface *)self->_iconsView documentMutated:v7];
  }
}

- (void)currentPageChanged:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  id v5 = [v6 object];

  if (WeakRetained == v5) {
    [(PDFThumbnailCollectionViewInterface *)self->_iconsView currentPageChanged:v6];
  }
}

- (void)pageChanged:(id)a3
{
  id v14 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  id v5 = [WeakRetained document];
  if (!v5) {
    goto LABEL_10;
  }
  id v6 = [v14 name];
  if ([v6 isEqualToString:@"PDFPageDidChangeBounds"])
  {

    goto LABEL_5;
  }
  id v7 = [v14 name];
  int v8 = [v7 isEqualToString:@"PDFPageDidRotate"];

  if (v8)
  {
LABEL_5:
    float v9 = [v14 object];

    if (v9 != v5) {
      goto LABEL_10;
    }
  }
  float v10 = [v14 userInfo];
  int v11 = [v10 objectForKey:@"page"];
  objc_super v12 = v11;
  if (v11)
  {
    objc_super v13 = [v11 document];

    if (v13 == v5) {
      [(PDFThumbnailCollectionViewInterface *)self->_iconsView pageChanged:v14];
    }
  }

LABEL_10:
}

- (PDFThumbnailContextMenuDelegate)thumbnailContextMenuDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->thumbnailContextMenuDelegate);

  return (PDFThumbnailContextMenuDelegate *)WeakRetained;
}

- (void)setThumbnailContextMenuDelegate:(id)a3
{
}

- (PDFThumbnailDataSourceDelegate)thumbnailDataSourceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailDataSourceDelegate);

  return (PDFThumbnailDataSourceDelegate *)WeakRetained;
}

- (void)setThumbnailDataSourceDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_thumbnailDataSourceDelegate);
  objc_destroyWeak((id *)&self->thumbnailContextMenuDelegate);
  objc_storeStrong((id *)&self->_iconsView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);

  objc_destroyWeak((id *)&self->_pdfView);
}

@end
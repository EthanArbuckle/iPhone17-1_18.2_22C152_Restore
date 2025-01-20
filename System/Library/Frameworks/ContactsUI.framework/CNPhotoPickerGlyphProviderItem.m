@interface CNPhotoPickerGlyphProviderItem
+ (id)thumbnailViewForImage:(id)a3;
- (CNPhotoPickerGlyphProviderItem)initWithSymbolImageNamed:(id)a3;
- (CNPhotoPickerGlyphProviderItem)initWithSymbolImageNamed:(id)a3 withAddItemType:(unint64_t)a4;
- (NSString)symbolImageName;
- (UIColor)tintColor;
- (UIView)symbolImageView;
- (id)backgroundColorWithTintColor:(id)a3;
- (id)imageForImageNamed:(id)a3 withTintColor:(id)a4;
- (int64_t)scaleForImageNamed:(id)a3;
- (unint64_t)addItemType;
- (unint64_t)imageType;
- (void)setAddItemType:(unint64_t)a3;
- (void)setSymbolImageName:(id)a3;
- (void)setSymbolImageView:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setupSymbolImageView;
- (void)thumbnailViewWithCompletion:(id)a3;
- (void)updateTintColorIfNeeded:(id)a3;
@end

@implementation CNPhotoPickerGlyphProviderItem

+ (id)thumbnailViewForImage:(id)a3
{
  id v3 = a3;
  [v3 size];
  double v5 = fmax(v4, 90.0);
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, v5, v5);
  [v6 setAutoresizingMask:18];
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", 0.0, 0.0, v5, v5);
  [v6 center];
  objc_msgSend(v7, "setCenter:");
  [v7 setAutoresizingMask:18];
  [v7 setContentMode:4];
  [v7 setImage:v3];

  [v6 addSubview:v7];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);

  objc_storeStrong((id *)&self->_symbolImageView, 0);
}

- (void)setTintColor:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setSymbolImageName:(id)a3
{
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (void)setSymbolImageView:(id)a3
{
}

- (void)setAddItemType:(unint64_t)a3
{
  self->_addItemType = a3;
}

- (unint64_t)addItemType
{
  return self->_addItemType;
}

- (void)updateTintColorIfNeeded:(id)a3
{
  id v11 = a3;
  id v4 = [(CNPhotoPickerGlyphProviderItem *)self tintColor];

  if (v4 != v11)
  {
    [(CNPhotoPickerGlyphProviderItem *)self setTintColor:v11];
    double v5 = objc_opt_class();
    v6 = [(CNPhotoPickerGlyphProviderItem *)self symbolImageName];
    v7 = [(CNPhotoPickerGlyphProviderItem *)self imageForImageNamed:v6 withTintColor:v11];
    v8 = [v5 thumbnailViewForImage:v7];
    [(CNPhotoPickerGlyphProviderItem *)self setSymbolImageView:v8];

    v9 = [(CNPhotoPickerGlyphProviderItem *)self backgroundColorWithTintColor:v11];
    v10 = [(CNPhotoPickerGlyphProviderItem *)self symbolImageView];
    [v10 setBackgroundColor:v9];
  }
}

- (id)backgroundColorWithTintColor:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4FB1E20];
  id v4 = a3;
  double v5 = [v3 traitCollectionWithUserInterfaceStyle:0];
  v6 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
  v12[0] = v5;
  v7 = [v4 colorWithAlphaComponent:0.15];
  v12[1] = v6;
  v13[0] = v7;
  v8 = [v4 colorWithAlphaComponent:0.3];

  v13[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  v10 = [MEMORY[0x1E4FB1618] _dynamicColorWithColorsByTraitCollection:v9];

  return v10;
}

- (id)imageForImageNamed:(id)a3 withTintColor:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4FB2988];
  v7 = (void *)MEMORY[0x1E4FB1818];
  id v8 = a4;
  id v9 = a3;
  v10 = objc_msgSend(v7, "cnui_symbolImageNamed:scale:weight:withColor:useFixedSize:compatibleWithTextStyle:", v9, -[CNPhotoPickerGlyphProviderItem scaleForImageNamed:](self, "scaleForImageNamed:", v9), 5, v8, 1, v6);

  return v10;
}

- (int64_t)scaleForImageNamed:(id)a3
{
  int v3 = [a3 isEqualToString:@"plus"];
  id v4 = (int64_t *)MEMORY[0x1E4FB2A50];
  if (!v3) {
    id v4 = (int64_t *)MEMORY[0x1E4FB2A58];
  }
  return *v4;
}

- (void)thumbnailViewWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = [(CNPhotoPickerGlyphProviderItem *)self symbolImageView];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (unint64_t)imageType
{
  return 0;
}

- (void)setupSymbolImageView
{
  int v3 = [(CNPhotoPickerProviderItem *)self callbackQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__CNPhotoPickerGlyphProviderItem_setupSymbolImageView__block_invoke;
  v4[3] = &unk_1E549B488;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __54__CNPhotoPickerGlyphProviderItem_setupSymbolImageView__block_invoke(uint64_t a1)
{
  v2 = objc_opt_class();
  int v3 = *(void **)(a1 + 32);
  id v4 = [v3 symbolImageName];
  id v5 = +[CNUIColorRepository photoPickerSymbolImageColor];
  id v6 = [v3 imageForImageNamed:v4 withTintColor:v5];
  uint64_t v7 = [v2 thumbnailViewForImage:v6];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 184);
  *(void *)(v8 + 184) = v7;

  v10 = *(id **)(a1 + 32);
  id v12 = [v10[23] tintColor];
  id v11 = [v10 backgroundColorWithTintColor:v12];
  [*(id *)(*(void *)(a1 + 32) + 184) setBackgroundColor:v11];
}

- (UIView)symbolImageView
{
  symbolImageView = self->_symbolImageView;
  if (!symbolImageView)
  {
    [(CNPhotoPickerGlyphProviderItem *)self setupSymbolImageView];
    symbolImageView = self->_symbolImageView;
  }
  id v4 = symbolImageView;

  return v4;
}

- (CNPhotoPickerGlyphProviderItem)initWithSymbolImageNamed:(id)a3
{
  id v5 = a3;
  id v6 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:](self, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", 0, 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_symbolImageName, a3);
    v7->_addItemType = 4;
    uint64_t v8 = v7;
  }

  return v7;
}

- (CNPhotoPickerGlyphProviderItem)initWithSymbolImageNamed:(id)a3 withAddItemType:(unint64_t)a4
{
  id v5 = [(CNPhotoPickerGlyphProviderItem *)self initWithSymbolImageNamed:a3];
  id v6 = v5;
  if (v5)
  {
    v5->_addItemType = a4;
    uint64_t v7 = v5;
  }

  return v6;
}

@end
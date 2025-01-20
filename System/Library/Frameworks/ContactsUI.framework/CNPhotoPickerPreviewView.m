@interface CNPhotoPickerPreviewView
+ (id)pickerPreviewWithFrame:(CGRect)a3 forItem:(id)a4;
- (CAShapeLayer)clippingLayer;
- (CNPhotoPickerPreviewView)initWithFrame:(CGRect)a3;
- (UIView)previewView;
- (UIView)thumbnailContentView;
- (void)layoutSubviews;
- (void)setClippingLayer:(id)a3;
- (void)setThumbnailContentView:(id)a3;
- (void)setupPreview;
- (void)updatePreviewWithItem:(id)a3;
@end

@implementation CNPhotoPickerPreviewView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clippingLayer, 0);
  objc_storeStrong((id *)&self->_thumbnailContentView, 0);

  objc_storeStrong((id *)&self->_previewView, 0);
}

- (void)setClippingLayer:(id)a3
{
}

- (CAShapeLayer)clippingLayer
{
  return self->_clippingLayer;
}

- (void)setThumbnailContentView:(id)a3
{
}

- (UIView)thumbnailContentView
{
  return self->_thumbnailContentView;
}

- (UIView)previewView
{
  return self->_previewView;
}

- (void)updatePreviewWithItem:(id)a3
{
  id v4 = a3;
  v5 = [(CNPhotoPickerPreviewView *)self thumbnailContentView];
  [v5 removeFromSuperview];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__CNPhotoPickerPreviewView_updatePreviewWithItem___block_invoke;
  v6[3] = &unk_1E549A038;
  v6[4] = self;
  [v4 thumbnailViewWithCompletion:v6];
}

void __50__CNPhotoPickerPreviewView_updatePreviewWithItem___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setThumbnailContentView:v4];
  v5 = [*(id *)(a1 + 32) previewView];
  [v5 addSubview:v4];

  id v6 = [*(id *)(a1 + 32) previewView];
  [v6 frame];
  objc_msgSend(v4, "setFrame:");
}

- (void)setupPreview
{
  [(CNPhotoPickerPreviewView *)self frame];
  double v4 = v3;
  [(CNPhotoPickerPreviewView *)self frame];
  id v6 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", 0.0, 0.0, v4, v5);
  previewView = self->_previewView;
  self->_previewView = v6;

  [(UIView *)self->_previewView setAutoresizingMask:18];
  v8 = +[CNUIColorRepository photoPickerAvatarBackgroundDefaultColor];
  [(UIView *)self->_previewView setBackgroundColor:v8];

  [(CNPhotoPickerPreviewView *)self addSubview:self->_previewView];
  v9 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
  clippingLayer = self->_clippingLayer;
  self->_clippingLayer = v9;

  v11 = self->_clippingLayer;
  id v12 = [(UIView *)self->_previewView layer];
  [v12 setMask:v11];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)CNPhotoPickerPreviewView;
  [(CNPhotoPickerPreviewView *)&v8 layoutSubviews];
  double v3 = (void *)MEMORY[0x1E4FB14C0];
  double v4 = [(CNPhotoPickerPreviewView *)self previewView];
  [v4 bounds];
  objc_msgSend(v3, "bezierPathWithOvalInRect:");
  id v5 = objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 CGPath];
  v7 = [(CNPhotoPickerPreviewView *)self clippingLayer];
  [v7 setPath:v6];
}

- (CNPhotoPickerPreviewView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNPhotoPickerPreviewView;
  double v3 = -[CNPhotoPickerPreviewView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(CNPhotoPickerPreviewView *)v3 setupPreview];
    id v5 = v4;
  }

  return v4;
}

+ (id)pickerPreviewWithFrame:(CGRect)a3 forItem:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v10 = off_1E5495308;
  if ((isKindOfClass & 1) == 0) {
    v10 = off_1E5495310;
  }
  v11 = objc_msgSend(objc_alloc(*v10), "initWithFrame:", x, y, width, height);

  return v11;
}

@end
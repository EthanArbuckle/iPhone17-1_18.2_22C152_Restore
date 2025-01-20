@interface MUPlacePhotoView
- (BOOL)isZoomed;
- (BOOL)needsFullImageDownload;
- (MUPlacePhotoObfuscationView)obfuscationView;
- (MUPlacePhotoView)initWithImage:(id)a3;
- (MUPlacePhotoViewObfuscationModel)obfuscationModel;
- (UIImage)image;
- (UIImageView)imageView;
- (void)_updateObfuscationPosition;
- (void)_updateObfuscationText;
- (void)_updateObfuscationWithPreviousModel:(id)a3;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setIsZoomed:(BOOL)a3;
- (void)setNeedsFullImageDownload:(BOOL)a3;
- (void)setObfuscationModel:(id)a3;
- (void)setObfuscationView:(id)a3;
- (void)zoomWithGestureRecognizer:(id)a3;
@end

@implementation MUPlacePhotoView

- (MUPlacePhotoView)initWithImage:(id)a3
{
  v38[6] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MUPlacePhotoView;
  v6 = -[MUPlacePhotoView initWithFrame:](&v36, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v6)
  {
    [MEMORY[0x1E4FB1618] clearColor];
    v7 = id v35 = v5;
    [(MUPlacePhotoView *)v6 setBackgroundColor:v7];

    [(MUPlacePhotoView *)v6 setUserInteractionEnabled:1];
    [(MUPlacePhotoView *)v6 setClipsToBounds:1];
    [(MUPlacePhotoView *)v6 setDelegate:v6];
    [(MUPlacePhotoView *)v6 setContentMode:4];
    [(MUPlacePhotoView *)v6 setMaximumZoomScale:3.0];
    [(MUPlacePhotoView *)v6 setMinimumZoomScale:1.0];
    [(MUPlacePhotoView *)v6 setDecelerationRate:0.850000024];
    [(MUPlacePhotoView *)v6 setShowsVerticalScrollIndicator:0];
    [(MUPlacePhotoView *)v6 setShowsHorizontalScrollIndicator:0];
    [(MUPlacePhotoView *)v6 setAccessibilityIdentifier:@"PlacePhotoView"];
    objc_storeStrong((id *)&v6->_image, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v6->_image];
    imageView = v6->_imageView;
    v6->_imageView = (UIImageView *)v8;

    [(UIImageView *)v6->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v6->_imageView setAccessibilityIgnoresInvertColors:1];
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIImageView *)v6->_imageView setBackgroundColor:v10];

    [(UIImageView *)v6->_imageView setContentMode:1];
    [(UIImageView *)v6->_imageView setUserInteractionEnabled:1];
    [(UIImageView *)v6->_imageView setAccessibilityIdentifier:@"ImageView"];
    [(MUPlacePhotoView *)v6 addSubview:v6->_imageView];
    v27 = (void *)MEMORY[0x1E4F28DC8];
    v34 = [(UIImageView *)v6->_imageView leadingAnchor];
    v33 = [(MUPlacePhotoView *)v6 leadingAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v38[0] = v32;
    v31 = [(UIImageView *)v6->_imageView trailingAnchor];
    v30 = [(MUPlacePhotoView *)v6 trailingAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v38[1] = v29;
    v28 = [(UIImageView *)v6->_imageView topAnchor];
    v26 = [(MUPlacePhotoView *)v6 topAnchor];
    v25 = [v28 constraintEqualToAnchor:v26];
    v38[2] = v25;
    v24 = [(UIImageView *)v6->_imageView bottomAnchor];
    v11 = [(MUPlacePhotoView *)v6 bottomAnchor];
    v12 = [v24 constraintEqualToAnchor:v11];
    v38[3] = v12;
    v13 = [(UIImageView *)v6->_imageView heightAnchor];
    v14 = [(MUPlacePhotoView *)v6 heightAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v38[4] = v15;
    v16 = [(UIImageView *)v6->_imageView widthAnchor];
    v17 = [(MUPlacePhotoView *)v6 widthAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v38[5] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:6];
    [v27 activateConstraints:v19];

    v20 = self;
    v37 = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    id v22 = (id)[(MUPlacePhotoView *)v6 registerForTraitChanges:v21 withAction:sel__updateObfuscationText];

    id v5 = v35;
  }

  return v6;
}

- (void)setImage:(id)a3
{
  id v5 = a3;
  if (([(UIImage *)self->_image isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_image, a3);
    [(MUPlacePhotoView *)self _updateObfuscationPosition];
    v6 = (void *)MEMORY[0x1E4FB1EB0];
    v7 = [(MUPlacePhotoView *)self imageView];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __29__MUPlacePhotoView_setImage___block_invoke;
    v8[3] = &unk_1E574EE08;
    v8[4] = self;
    id v9 = v5;
    [v6 transitionWithView:v7 duration:5242880 options:v8 animations:0 completion:0.200000003];
  }
}

void __29__MUPlacePhotoView_setImage___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) imageView];
  [v2 setImage:v1];
}

- (void)zoomWithGestureRecognizer:(id)a3
{
  id v22 = a3;
  if ([(MUPlacePhotoView *)self isZoomed])
  {
    [(MUPlacePhotoView *)self minimumZoomScale];
    -[MUPlacePhotoView setZoomScale:animated:](self, "setZoomScale:animated:", 1);
  }
  else
  {
    [v22 locationInView:self];
    double v5 = v4;
    double v7 = v6;
    [(MUPlacePhotoView *)self frame];
    double v9 = v8;
    [(MUPlacePhotoView *)self maximumZoomScale];
    double v11 = v9 / v10;
    [(MUPlacePhotoView *)self frame];
    double v13 = v12;
    [(MUPlacePhotoView *)self maximumZoomScale];
    double v15 = v13 / v14;
    if (v5 - v11 * 0.5 >= 0.0) {
      double v16 = v5 - v11 * 0.5;
    }
    else {
      double v16 = 0.0;
    }
    if (v7 - v15 * 0.5 >= 0.0) {
      double v17 = v7 - v15 * 0.5;
    }
    else {
      double v17 = 0.0;
    }
    [(MUPlacePhotoView *)self frame];
    if (v11 + v16 > v18)
    {
      [(MUPlacePhotoView *)self frame];
      double v16 = v19 - v11;
    }
    [(MUPlacePhotoView *)self frame];
    if (v15 + v17 > v20)
    {
      [(MUPlacePhotoView *)self frame];
      double v17 = v21 - v15;
    }
    -[MUPlacePhotoView zoomToRect:animated:](self, "zoomToRect:animated:", 1, v16, v17, v11, v15);
  }
}

- (BOOL)isZoomed
{
  [(MUPlacePhotoView *)self zoomScale];
  double v4 = v3;
  [(MUPlacePhotoView *)self minimumZoomScale];
  return v4 != v5;
}

- (void)setObfuscationModel:(id)a3
{
  id v8 = a3;
  if ((-[MUPlacePhotoViewObfuscationModel isEqual:](self->_obfuscationModel, "isEqual:") & 1) == 0)
  {
    obfuscationModel = self->_obfuscationModel;
    double v5 = (MUPlacePhotoViewObfuscationModel *)v8;
    double v6 = self->_obfuscationModel;
    self->_obfuscationModel = v5;
    double v7 = obfuscationModel;

    [(MUPlacePhotoView *)self _updateObfuscationWithPreviousModel:v7];
  }
}

- (void)_updateObfuscationWithPreviousModel:(id)a3
{
  id v17 = a3;
  double v4 = [v17 tapGestureRecognizer];

  if (v4)
  {
    double v5 = [(MUPlacePhotoView *)self obfuscationView];
    double v6 = [v17 tapGestureRecognizer];
    [v5 removeGestureRecognizer:v6];
  }
  if (self->_obfuscationModel)
  {
    double v7 = [(MUPlacePhotoView *)self obfuscationView];

    if (!v7)
    {
      id v8 = [MUPlacePhotoObfuscationView alloc];
      double v9 = -[MUPlacePhotoObfuscationView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(MUPlacePhotoView *)self setObfuscationView:v9];

      double v10 = [(MUPlacePhotoView *)self imageView];
      double v11 = [(MUPlacePhotoView *)self obfuscationView];
      [v10 addSubview:v11];

      [(MUPlacePhotoView *)self _updateObfuscationPosition];
    }
  }
  double v12 = [(MUPlacePhotoViewObfuscationModel *)self->_obfuscationModel tapGestureRecognizer];

  if (v12)
  {
    double v13 = [(MUPlacePhotoView *)self obfuscationView];
    double v14 = [(MUPlacePhotoViewObfuscationModel *)self->_obfuscationModel tapGestureRecognizer];
    [v13 addGestureRecognizer:v14];
  }
  BOOL v15 = self->_obfuscationModel == 0;
  double v16 = [(MUPlacePhotoView *)self obfuscationView];
  [v16 setHidden:v15];

  [(MUPlacePhotoView *)self _updateObfuscationText];
}

- (void)_updateObfuscationText
{
  v22[1] = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  double v4 = objc_msgSend(v3, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09E0]);

  double v5 = [(MUPlacePhotoViewObfuscationModel *)self->_obfuscationModel providerName];
  id v6 = v4;
  if ([v5 length])
  {
    double v20 = self;
    uint64_t v21 = *MEMORY[0x1E4FB06F8];
    v22[0] = v6;
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    double v19 = _MULocalizedStringFromThisBundle(@"View on %@ %@");
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v19 attributes:v7];
    double v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v7];
    id v10 = objc_alloc_init(MEMORY[0x1E4FB0870]);
    double v11 = [MEMORY[0x1E4FB1830] configurationWithFont:v6 scale:1];
    double v12 = objc_msgSend(MEMORY[0x1E4FB1818], "_mapsui_systemImageNamed:withConfiguration:", @"arrow.up.right.square.fill", v11);
    double v13 = [v12 imageWithRenderingMode:2];
    [v10 setImage:v13];

    double v14 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v10];
    BOOL v15 = objc_msgSend(MEMORY[0x1E4F28B18], "localizedAttributedStringWithFormat:options:", v8, 2, v9, v14);
    double v16 = (void *)[v15 mutableCopy];

    if (v7) {
      objc_msgSend(v16, "addAttributes:range:", v7, 0, objc_msgSend(v16, "length"));
    }
    id v17 = (void *)[v16 copy];

    self = v20;
  }
  else
  {
    id v17 = 0;
  }

  double v18 = [(MUPlacePhotoView *)self obfuscationView];
  [v18 setAttributedText:v17];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MUPlacePhotoView;
  [(MUPlacePhotoView *)&v3 layoutSubviews];
  [(MUPlacePhotoView *)self _updateObfuscationPosition];
}

- (void)_updateObfuscationPosition
{
  objc_super v3 = [(MUPlacePhotoView *)self obfuscationView];

  if (v3)
  {
    double v4 = [(MUPlacePhotoView *)self image];
    [v4 size];
    double v6 = v5;

    if (v6 != 0.0)
    {
      double v7 = [(MUPlacePhotoView *)self image];
      [v7 size];
      double v9 = v8;
      id v10 = [(MUPlacePhotoView *)self image];
      [v10 size];
      double v12 = v9 / v11;

      double v13 = [(MUPlacePhotoView *)self imageView];
      [v13 bounds];
      double Height = CGRectGetHeight(v26);

      BOOL v15 = [(MUPlacePhotoView *)self imageView];
      [v15 bounds];
      double Width = CGRectGetWidth(v27);

      double v17 = Width / v12;
      if (v12 * Height < Width) {
        double Width = v12 * Height;
      }
      if (v17 < Height) {
        double Height = v17;
      }
      double v18 = [(MUPlacePhotoView *)self obfuscationView];
      objc_msgSend(v18, "setFrame:", 0.0, 0.0, Width, Height);

      id v24 = [(MUPlacePhotoView *)self imageView];
      [v24 center];
      double v20 = v19;
      double v22 = v21;
      v23 = [(MUPlacePhotoView *)self obfuscationView];
      objc_msgSend(v23, "setCenter:", v20, v22);
    }
  }
}

- (UIImage)image
{
  return self->_image;
}

- (void)setIsZoomed:(BOOL)a3
{
  self->_isZoomed = a3;
}

- (BOOL)needsFullImageDownload
{
  return self->_needsFullImageDownload;
}

- (void)setNeedsFullImageDownload:(BOOL)a3
{
  self->_needsFullImageDownload = a3;
}

- (MUPlacePhotoViewObfuscationModel)obfuscationModel
{
  return self->_obfuscationModel;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (MUPlacePhotoObfuscationView)obfuscationView
{
  return self->_obfuscationView;
}

- (void)setObfuscationView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obfuscationView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_obfuscationModel, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
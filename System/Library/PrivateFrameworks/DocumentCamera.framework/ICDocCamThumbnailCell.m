@interface ICDocCamThumbnailCell
- (BOOL)isAccessibilityElement;
- (ICDocCamThumbnailCell)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)indexStringForAccessibility;
- (id)parentCollectionView;
- (void)applyLayoutAttributes:(id)a3;
- (void)prepareForReuse;
- (void)setImageView:(id)a3;
@end

@implementation ICDocCamThumbnailCell

- (ICDocCamThumbnailCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v45.receiver = self;
  v45.super_class = (Class)ICDocCamThumbnailCell;
  v7 = -[ICDocCamThumbnailCell initWithFrame:](&v45, sel_initWithFrame_);
  if (v7)
  {
    id v8 = [MEMORY[0x263F1C550] blackColor];
    uint64_t v9 = [v8 CGColor];
    v10 = [(ICDocCamThumbnailCell *)v7 layer];
    [v10 setShadowColor:v9];

    v11 = [(ICDocCamThumbnailCell *)v7 layer];
    [v11 setShadowRadius:1.0];

    v12 = [(ICDocCamThumbnailCell *)v7 layer];
    objc_msgSend(v12, "setShadowOffset:", 0.0, 0.0);

    v13 = [(ICDocCamThumbnailCell *)v7 layer];
    LODWORD(v14) = 1045220557;
    [v13 setShadowOpacity:v14];

    id v15 = objc_alloc_init(MEMORY[0x263F1C6D0]);
    [(ICDocCamThumbnailCell *)v7 setImageView:v15];

    v16 = [(ICDocCamThumbnailCell *)v7 imageView];
    [v16 setContentMode:2];

    v17 = [(ICDocCamThumbnailCell *)v7 imageView];
    [v17 setClipsToBounds:1];

    v18 = [(ICDocCamThumbnailCell *)v7 imageView];
    objc_msgSend(v18, "setFrame:", x, y, width, height);

    v19 = [(ICDocCamThumbnailCell *)v7 imageView];
    [v19 setAccessibilityIgnoresInvertColors:1];

    v20 = [(ICDocCamThumbnailCell *)v7 imageView];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

    v21 = [(ICDocCamThumbnailCell *)v7 contentView];
    v22 = [(ICDocCamThumbnailCell *)v7 imageView];
    [v21 addSubview:v22];

    v23 = [MEMORY[0x263EFF980] array];
    v24 = [(ICDocCamThumbnailCell *)v7 contentView];
    v25 = [v24 leadingAnchor];
    v26 = [(ICDocCamThumbnailCell *)v7 imageView];
    v27 = [v26 leadingAnchor];
    v28 = [v25 constraintEqualToAnchor:v27];
    [v23 addObject:v28];

    v29 = [(ICDocCamThumbnailCell *)v7 contentView];
    v30 = [v29 trailingAnchor];
    v31 = [(ICDocCamThumbnailCell *)v7 imageView];
    v32 = [v31 trailingAnchor];
    v33 = [v30 constraintEqualToAnchor:v32];
    [v23 addObject:v33];

    v34 = [(ICDocCamThumbnailCell *)v7 contentView];
    v35 = [v34 topAnchor];
    v36 = [(ICDocCamThumbnailCell *)v7 imageView];
    v37 = [v36 topAnchor];
    v38 = [v35 constraintEqualToAnchor:v37];
    [v23 addObject:v38];

    v39 = [(ICDocCamThumbnailCell *)v7 contentView];
    v40 = [v39 bottomAnchor];
    v41 = [(ICDocCamThumbnailCell *)v7 imageView];
    v42 = [v41 bottomAnchor];
    v43 = [v40 constraintEqualToAnchor:v42];
    [v23 addObject:v43];

    [MEMORY[0x263F08938] activateConstraints:v23];
  }
  return v7;
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)ICDocCamThumbnailCell;
  [(ICDocCamThumbnailCell *)&v6 prepareForReuse];
  v3 = [(ICDocCamThumbnailCell *)self layer];
  LODWORD(v4) = 1.0;
  [v3 setSpeed:v4];

  v5 = [(ICDocCamThumbnailCell *)self imageView];
  [v5 setImage:0];
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ICDocCamThumbnailCell;
  [(ICDocCamThumbnailCell *)&v23 applyLayoutAttributes:v4];
  id v5 = v4;
  objc_opt_class();
  double v6 = 0.0;
  double v7 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v5 imageWidth];
    double v7 = v8;
    [v5 imageHeight];
    double v6 = v9;
  }
  v10 = [(ICDocCamThumbnailCell *)self imageView];
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v7, v6);

  LODWORD(v10) = [v5 renderShadow];
  v11 = [(ICDocCamThumbnailCell *)self layer];
  v12 = v11;
  LODWORD(v13) = 1045220557;
  if (!v10) {
    *(float *)&double v13 = 0.0;
  }
  [v11 setShadowOpacity:v13];

  if ([v5 renderBorder])
  {
    id v14 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.2];
    uint64_t v15 = [v14 CGColor];
    v16 = [(ICDocCamThumbnailCell *)self layer];
    [v16 setBorderColor:v15];

    v17 = [(ICDocCamThumbnailCell *)self layer];
    v18 = v17;
    double v19 = 0.5;
  }
  else
  {
    id v20 = [MEMORY[0x263F1C550] clearColor];
    uint64_t v21 = [v20 CGColor];
    v22 = [(ICDocCamThumbnailCell *)self layer];
    [v22 setBorderColor:v21];

    v17 = [(ICDocCamThumbnailCell *)self layer];
    v18 = v17;
    double v19 = 0.0;
  }
  [v17 setBorderWidth:v19];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(ICDocCamThumbnailCell *)self imageView];
  id v4 = [v3 image];
  [v4 size];
  double v6 = v5;
  double v7 = [(ICDocCamThumbnailCell *)self imageView];
  double v8 = [v7 image];
  [v8 size];
  double v10 = v9;

  v11 = +[DCLocalization localizedStringForKey:@"Scan thumbnail" value:@"Scan thumbnail" table:@"Localizable"];
  if (v6 >= v10) {
    v12 = @"portrait";
  }
  else {
    v12 = @"landscape";
  }
  double v13 = +[DCLocalization localizedStringForKey:v12 value:v12 table:@"Localizable"];
  v22 = [(ICDocCamThumbnailCell *)self indexStringForAccessibility];
  id v20 = __DCAccessibilityStringForVariables(1, v11, v14, v15, v16, v17, v18, v19, (uint64_t)v13);

  return v20;
}

- (id)accessibilityHint
{
  return +[DCLocalization localizedStringForKey:@"Double-tap to preview scan." value:@"Double-tap to preview scan." table:@"Localizable"];
}

- (id)indexStringForAccessibility
{
  v3 = [(ICDocCamThumbnailCell *)self parentCollectionView];
  id v4 = v3;
  if (v3)
  {
    double v5 = [v3 indexPathForCell:self];
    double v6 = v5;
    if (v5 && [v5 item] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = [v6 item] + 1;
      uint64_t v9 = objc_msgSend(v4, "numberOfItemsInSection:", objc_msgSend(v6, "section"));
      double v10 = NSString;
      v11 = +[DCLocalization localizedStringForKey:@"%lu of %lu" value:@"%lu of %lu" table:@"Localizable"];
      double v7 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v8, v9);
    }
    else
    {
      double v7 = 0;
    }
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)parentCollectionView
{
  v2 = [(ICDocCamThumbnailCell *)self superview];
  if (v2)
  {
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      v3 = [v2 superview];

      v2 = v3;
      if (!v3) {
        goto LABEL_7;
      }
    }
    uint64_t v4 = objc_opt_class();
    v3 = DCDynamicCast(v4, (uint64_t)v2);
  }
  else
  {
    v3 = 0;
  }
LABEL_7:

  return v3;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
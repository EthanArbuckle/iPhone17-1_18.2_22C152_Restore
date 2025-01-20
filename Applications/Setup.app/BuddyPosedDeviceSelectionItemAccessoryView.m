@interface BuddyPosedDeviceSelectionItemAccessoryView
- (BOOL)selected;
- (BuddyPosedDeviceSelectionItemAccessoryView)initWithImage:(id)a3 text:(id)a4;
- (BuddyPosedDeviceSelectionItemAccessoryView)initWithSymbol:(id)a3 text:(id)a4;
- (NSString)accessoryText;
- (UIImage)selectedImage;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (void)setAccessoryText:(id)a3;
- (void)setImageView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedImage:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BuddyPosedDeviceSelectionItemAccessoryView

- (BuddyPosedDeviceSelectionItemAccessoryView)initWithImage:(id)a3 text:(id)a4
{
  id v52 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = 0;
  objc_storeStrong(&obj, a4);
  id v5 = v52;
  id v52 = 0;
  v49.receiver = v5;
  v49.super_class = (Class)BuddyPosedDeviceSelectionItemAccessoryView;
  v6 = -[BuddyPosedDeviceSelectionItemAccessoryView initWithFrame:](&v49, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  id v52 = v6;
  objc_storeStrong(&v52, v6);
  if (v6)
  {
    objc_storeStrong((id *)v52 + 3, location[0]);
    id v7 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v8 = (void *)*((void *)v52 + 4);
    *((void *)v52 + 4) = v7;

    [*((id *)v52 + 4) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v52 + 4) setContentMode:4];
    v9 = +[UIImageSymbolConfiguration configurationWithPointSize:24.0];
    [*((id *)v52 + 4) setPreferredSymbolConfiguration:v9];

    id v10 = [*((id *)v52 + 4) layer];
    [v10 setCornerRadius:12.0];

    id v11 = [*((id *)v52 + 4) layer];
    [v11 setMasksToBounds:1];

    id v12 = [*((id *)v52 + 4) layer];
    [v12 setBorderWidth:1.0];

    id v13 = [v52 traitCollection];
    v43 = _NSConcreteStackBlock;
    int v44 = -1073741824;
    int v45 = 0;
    v46 = sub_1000EB0F0;
    v47 = &unk_1002B0D20;
    id v48 = v52;
    [v13 performAsCurrentTraitCollection:&v43];

    objc_storeStrong((id *)v52 + 5, obj);
    id v14 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v15 = (void *)*((void *)v52 + 2);
    *((void *)v52 + 2) = v14;

    [*((id *)v52 + 2) setNumberOfLines:0];
    [*((id *)v52 + 2) setText:obj];
    id v16 = +[UIColor _labelColor];
    [*((id *)v52 + 2) setTextColor:v16];

    [*((id *)v52 + 2) setTranslatesAutoresizingMaskIntoConstraints:0];
    [v52 addSubview:*((void *)v52 + 4)];
    [v52 addSubview:*((void *)v52 + 2)];
    double v42 = 8.0;
    id v17 = +[BYDevice currentDevice];
    id v18 = [v17 size];

    if (v18 == (id)2) {
      double v42 = 5.0;
    }
    id v41 = [*((id *)v52 + 2) topAnchor];
    id v40 = [v52 topAnchor];
    id v39 = [v41 constraintEqualToAnchor:];
    v53[0] = v39;
    id v38 = [*((id *)v52 + 2) centerXAnchor];
    id v37 = [v52 centerXAnchor];
    id v36 = [v38 constraintEqualToAnchor:];
    v53[1] = v36;
    id v35 = [*((id *)v52 + 4) topAnchor];
    id v34 = [*((id *)v52 + 2) bottomAnchor];
    id v33 = [v35 constraintEqualToAnchor:v42];
    v53[2] = v33;
    id v32 = [*((id *)v52 + 4) centerXAnchor];
    id v31 = [v52 centerXAnchor];
    id v19 = [v32 constraintEqualToAnchor:];
    v53[3] = v19;
    id v20 = [*((id *)v52 + 4) heightAnchor];
    id v21 = [v20 constraintEqualToConstant:24.0];
    v53[4] = v21;
    id v22 = [*((id *)v52 + 4) widthAnchor];
    id v23 = [*((id *)v52 + 4) heightAnchor];
    id v24 = [v22 constraintEqualToAnchor:v23];
    v53[5] = v24;
    id v25 = [v52 bottomAnchor];
    id v26 = [*((id *)v52 + 4) bottomAnchor];
    id v27 = [v25 constraintEqualToAnchor:v26];
    v53[6] = v27;
    v28 = +[NSArray arrayWithObjects:v53 count:7];
    +[NSLayoutConstraint activateConstraints:v28];

    [v52 layoutSubviews];
    objc_storeStrong(&v48, 0);
  }
  [v52 setTranslatesAutoresizingMaskIntoConstraints:0];
  v29 = (BuddyPosedDeviceSelectionItemAccessoryView *)v52;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v52, 0);
  return v29;
}

- (BuddyPosedDeviceSelectionItemAccessoryView)initWithSymbol:(id)a3 text:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v5 = +[UIColor whiteColor];
  v16[0] = v5;
  v6 = +[UIColor systemBlueColor];
  v16[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v16 count:2];
  id v12 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v7];

  id v11 = +[UIImage systemImageNamed:location[0] withConfiguration:v12];
  id v8 = v15;
  id v15 = 0;
  id v15 = [v8 initWithImage:v11 text:v13];
  v9 = (BuddyPosedDeviceSelectionItemAccessoryView *)v15;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v15, 0);
  return v9;
}

- (void)setSelected:(BOOL)a3
{
  if (a3 && !self->_selected)
  {
    v3 = [(BuddyPosedDeviceSelectionItemAccessoryView *)self imageView];
    id v4 = [(UIImageView *)v3 layer];
    [v4 setBorderWidth:0.0];

    id v5 = [(BuddyPosedDeviceSelectionItemAccessoryView *)self selectedImage];
    v6 = [(BuddyPosedDeviceSelectionItemAccessoryView *)self imageView];
    [(UIImageView *)v6 setImage:v5];
  }
  if (!a3 && self->_selected)
  {
    id v7 = [(BuddyPosedDeviceSelectionItemAccessoryView *)self imageView];
    id v8 = [(UIImageView *)v7 layer];
    [v8 setBorderWidth:1.0];

    v9 = [(BuddyPosedDeviceSelectionItemAccessoryView *)self imageView];
    [(UIImageView *)v9 setImage:0];
  }
  self->_selected = a3;
  id v10 = [(BuddyPosedDeviceSelectionItemAccessoryView *)self imageView];
  [(UIImageView *)v10 layoutIfNeeded];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6.receiver = v8;
  v6.super_class = (Class)BuddyPosedDeviceSelectionItemAccessoryView;
  [(BuddyPosedDeviceSelectionItemAccessoryView *)&v6 traitCollectionDidChange:location[0]];
  v3 = +[UIColor systemGrayColor];
  id v4 = [(UIColor *)v3 CGColor];
  id v5 = [(UIImageView *)v8->_imageView layer];
  [v5 setBorderColor:v4];

  objc_storeStrong(location, 0);
}

- (BOOL)selected
{
  return self->_selected;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIImage)selectedImage
{
  return self->_selectedImage;
}

- (void)setSelectedImage:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (NSString)accessoryText
{
  return self->_accessoryText;
}

- (void)setAccessoryText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface BuddyAppleIDServiceView
- (BuddyAppleIDServiceView)initWithImage:(id)a3 description:(id)a4;
- (UIImageView)imageView;
- (UILabel)label;
- (void)setImageView:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation BuddyAppleIDServiceView

- (BuddyAppleIDServiceView)initWithImage:(id)a3 description:(id)a4
{
  id v65 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v63 = 0;
  objc_storeStrong(&v63, a4);
  id v5 = v65;
  id v65 = 0;
  v62.receiver = v5;
  v62.super_class = (Class)BuddyAppleIDServiceView;
  v6 = -[BuddyAppleIDServiceView initWithFrame:](&v62, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  id v65 = v6;
  objc_storeStrong(&v65, v6);
  if (v6)
  {
    id v7 = objc_alloc((Class)UIImageView);
    id v8 = [v7 initWithImage:location[0]];
    [v65 setImageView:v8];

    id v9 = [v65 imageView];
    [v9 setAccessibilityIgnoresInvertColors:1];

    id v10 = [v65 imageView];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v11 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v65 setLabel:v11];

    id v12 = [v65 label];
    [v12 setNumberOfLines:0];

    id v13 = v63;
    id v14 = [v65 label];
    [v14 setText:v13];

    id v15 = [v65 label];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    v16 = +[UIColor lightGrayColor];
    id v17 = [v65 label];
    [v17 setTextColor:v16];

    v18 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    id v19 = [v65 label];
    [v19 setFont:v18];

    id v20 = v65;
    id v21 = [v65 imageView];
    [v20 addSubview:v21];

    id v22 = v65;
    id v23 = [v65 label];
    [v22 addSubview:v23];

    id v60 = [v65 topAnchor];
    id v61 = [v65 imageView];
    id v59 = [v61 topAnchor];
    id v58 = [v60 constraintEqualToAnchor:0.0];
    v66[0] = v58;
    id v56 = [v65 leadingAnchor];
    id v57 = [v65 imageView];
    id v55 = [v57 leadingAnchor];
    id v54 = [v56 constraintEqualToAnchor:0.0];
    v66[1] = v54;
    id v53 = [v65 imageView];
    id v52 = [v53 heightAnchor];
    id v51 = [v52 constraintEqualToConstant:40.0];
    v66[2] = v51;
    id v50 = [v65 imageView];
    id v49 = [v50 widthAnchor];
    id v48 = [v49 constraintEqualToConstant:40.0];
    v66[3] = v48;
    id v47 = [v65 imageView];
    id v46 = [v47 bottomAnchor];
    id v45 = [v65 bottomAnchor];
    id v44 = [v46 constraintLessThanOrEqualToAnchor:0.0];
    v66[4] = v44;
    id v42 = [v65 topAnchor];
    id v43 = [v65 label];
    id v41 = [v43 topAnchor];
    UIRoundToViewScale();
    id v40 = [v42 constraintEqualToAnchor:v41];
    v66[5] = v40;
    id v39 = [v65 imageView];
    id v37 = [v39 trailingAnchor];
    id v38 = [v65 label];
    id v36 = [v38 leadingAnchor];
    id v24 = [v37 constraintEqualToAnchor:-12.0];
    v66[6] = v24;
    id v25 = [v65 label];
    id v26 = [v25 trailingAnchor];
    id v27 = [v65 trailingAnchor];
    id v28 = [v26 constraintEqualToAnchor:v27 constant:0.0];
    v66[7] = v28;
    id v29 = [v65 label];
    id v30 = [v29 bottomAnchor];
    id v31 = [v65 bottomAnchor];
    id v32 = [v30 constraintLessThanOrEqualToAnchor:v31 constant:0.0];
    v66[8] = v32;
    v33 = +[NSArray arrayWithObjects:v66 count:9];
    +[NSLayoutConstraint activateConstraints:v33];
  }
  v34 = (BuddyAppleIDServiceView *)v65;
  objc_storeStrong(&v63, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v65, 0);
  return v34;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
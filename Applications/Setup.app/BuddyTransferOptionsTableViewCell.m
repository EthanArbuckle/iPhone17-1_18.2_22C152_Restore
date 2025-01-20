@interface BuddyTransferOptionsTableViewCell
- (BuddyAspectFitLayerView)iconLayerView;
- (BuddyTransferOptionsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CALayer)iconLayer;
- (UIImageView)chevronView;
- (UILabel)descriptionLabel;
- (UILabel)footnoteLabel;
- (UILabel)nameLabel;
- (double)_chevronWidth;
- (double)_imageLeadingMargin;
- (double)_imageTrailingMargin;
- (double)_imageWidth;
- (id)_descriptionFont;
- (id)_footnoteFont;
- (id)_titleFont;
- (void)prepareForReuse;
- (void)setChevronView:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setFootnoteLabel:(id)a3;
- (void)setIconLayer:(id)a3;
- (void)setIconLayerView:(id)a3;
- (void)setNameLabel:(id)a3;
@end

@implementation BuddyTransferOptionsTableViewCell

- (BuddyTransferOptionsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v78 = self;
  SEL v77 = a2;
  int64_t v76 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v4 = v78;
  id v78 = 0;
  v74.receiver = v4;
  v74.super_class = (Class)BuddyTransferOptionsTableViewCell;
  v5 = [(BuddyTransferOptionsTableViewCell *)&v74 initWithStyle:v76 reuseIdentifier:location];
  id v78 = v5;
  objc_storeStrong(&v78, v5);
  if (v5)
  {
    [v78 setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = -[BuddyAspectFitLayerView initWithFrame:]([BuddyAspectFitLayerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v7 = (void *)*((void *)v78 + 4);
    *((void *)v78 + 4) = v6;

    [*((id *)v78 + 4) setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = [v78 contentView];
    [v8 addSubview:*((void *)v78 + 4)];

    id v68 = [*((id *)v78 + 4) leadingAnchor];
    id v70 = [v78 contentView];
    id v66 = [v70 leadingAnchor];
    [v78 _imageLeadingMargin];
    id v64 = [v68 constraintEqualToAnchor:v66];
    v81[0] = v64;
    id v62 = [v78 contentView];
    id v9 = [v62 topAnchor];
    id v10 = [*((id *)v78 + 4) topAnchor];
    id v11 = [v9 constraintLessThanOrEqualToAnchor:v10];
    v81[1] = v11;
    id v12 = [v78 contentView];
    id v13 = [v12 bottomAnchor];
    id v14 = [*((id *)v78 + 4) bottomAnchor];
    id v15 = [v13 constraintGreaterThanOrEqualToAnchor:v14];
    v81[2] = v15;
    id v16 = [*((id *)v78 + 4) widthAnchor];
    [v78 _imageWidth];
    id v17 = [v16 constraintEqualToConstant:];
    v81[3] = v17;
    v18 = +[NSArray arrayWithObjects:v81 count:4];
    +[NSLayoutConstraint activateConstraints:v18];

    id v73 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v73 setAxis:1];
    [v73 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v19 = [v78 contentView];
    [v19 addSubview:v73];

    id v61 = [v73 leadingAnchor];
    id v60 = [*((id *)v78 + 4) trailingAnchor];
    [v78 _imageTrailingMargin];
    id v20 = [v61 constraintEqualToAnchor:v60];
    v80[0] = v20;
    id v21 = [v73 topAnchor];
    id v22 = [v78 contentView];
    id v23 = [v22 topAnchor];
    id v24 = [v21 constraintEqualToAnchor:v23 constant:40.0];
    v80[1] = v24;
    id v25 = [v78 contentView];
    id v26 = [v25 bottomAnchor];
    id v27 = [v73 bottomAnchor];
    id v28 = [v26 constraintEqualToAnchor:v27 constant:30.0];
    v80[2] = v28;
    v29 = +[NSArray arrayWithObjects:v80 count:3];
    +[NSLayoutConstraint activateConstraints:v29];

    id v72 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v72 setAxis:1];
    [v72 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v30 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v31 = (void *)*((void *)v78 + 1);
    *((void *)v78 + 1) = v30;

    id v32 = [v78 _titleFont];
    [*((id *)v78 + 1) setFont:v32];

    [*((id *)v78 + 1) setNumberOfLines:0];
    [*((id *)v78 + 1) setTranslatesAutoresizingMaskIntoConstraints:0];
    [v72 addArrangedSubview:*((void *)v78 + 1)];
    [v72 setCustomSpacing:*((void *)v78 + 1) afterView:2.0];
    id v33 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v34 = (void *)*((void *)v78 + 2);
    *((void *)v78 + 2) = v33;

    id v35 = [v78 _descriptionFont];
    [*((id *)v78 + 2) setFont:v35];

    [*((id *)v78 + 2) setNumberOfLines:0];
    [*((id *)v78 + 2) setTranslatesAutoresizingMaskIntoConstraints:0];
    [v72 addArrangedSubview:*((void *)v78 + 2)];
    [v73 addArrangedSubview:v72];
    [v73 setCustomSpacing:v72 afterView:16.0];
    id v36 = [*((id *)v78 + 4) centerYAnchor];
    id v37 = [v72 centerYAnchor];
    id v38 = [v36 constraintEqualToAnchor:v37];
    [v38 setActive:1];

    id v39 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v40 = (void *)*((void *)v78 + 3);
    *((void *)v78 + 3) = v39;

    id v41 = [v78 _footnoteFont];
    [*((id *)v78 + 3) setFont:v41];

    [*((id *)v78 + 3) setNumberOfLines:0];
    [*((id *)v78 + 3) setTranslatesAutoresizingMaskIntoConstraints:0];
    [v73 addArrangedSubview:*((void *)v78 + 3)];
    v42 = +[UIImage systemImageNamed:@"chevron.forward"];
    v43 = +[UIColor tertiaryLabelColor];
    id v71 = [(UIImage *)v42 imageWithTintColor:v43 renderingMode:1];

    id v44 = [objc_alloc((Class)UIImageView) initWithImage:v71];
    v45 = (void *)*((void *)v78 + 5);
    *((void *)v78 + 5) = v44;

    [*((id *)v78 + 5) setContentMode:1];
    [*((id *)v78 + 5) setTranslatesAutoresizingMaskIntoConstraints:0];
    id v46 = [v78 contentView];
    [v46 addSubview:*((void *)v78 + 5)];

    id v67 = [*((id *)v78 + 5) centerYAnchor];
    id v69 = [v78 contentView];
    id v65 = [v69 centerYAnchor];
    id v63 = [v67 constraintEqualToAnchor:];
    v79[0] = v63;
    id v47 = [*((id *)v78 + 5) widthAnchor];
    [v78 _chevronWidth];
    id v48 = [v47 constraintEqualToConstant:];
    v79[1] = v48;
    id v49 = [*((id *)v78 + 5) leadingAnchor];
    id v50 = [v73 trailingAnchor];
    id v51 = [v49 constraintEqualToAnchor:v50 constant:10.0];
    v79[2] = v51;
    id v52 = [v78 contentView];
    id v53 = [v52 trailingAnchor];
    id v54 = [*((id *)v78 + 5) trailingAnchor];
    id v55 = [v53 constraintEqualToAnchor:v54 constant:8.0];
    v79[3] = v55;
    v56 = +[NSArray arrayWithObjects:v79 count:4];
    +[NSLayoutConstraint activateConstraints:v56];

    LODWORD(v57) = 1148846080;
    [*((id *)v78 + 5) setContentHuggingPriority:0 forAxis:v57];
    objc_storeStrong(&v71, 0);
    objc_storeStrong(&v72, 0);
    objc_storeStrong(&v73, 0);
  }
  v58 = (BuddyTransferOptionsTableViewCell *)v78;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v78, 0);
  return v58;
}

- (void)prepareForReuse
{
  id v9 = self;
  SEL v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)BuddyTransferOptionsTableViewCell;
  [(BuddyTransferOptionsTableViewCell *)&v7 prepareForReuse];
  id v2 = [(BuddyTransferOptionsTableViewCell *)v9 imageView];
  [v2 setImage:0];

  v3 = [(BuddyTransferOptionsTableViewCell *)v9 iconLayerView];
  [(BuddyAspectFitLayerView *)v3 setManagedLayer:0];

  id v4 = [(BuddyTransferOptionsTableViewCell *)v9 nameLabel];
  [(UILabel *)v4 setText:0];

  v5 = [(BuddyTransferOptionsTableViewCell *)v9 descriptionLabel];
  [(UILabel *)v5 setText:0];

  v6 = [(BuddyTransferOptionsTableViewCell *)v9 footnoteLabel];
  [(UILabel *)v6 setText:0];
}

- (CALayer)iconLayer
{
  id v2 = [(BuddyTransferOptionsTableViewCell *)self iconLayerView];
  v3 = [(BuddyAspectFitLayerView *)v2 managedLayer];

  return v3;
}

- (void)setIconLayer:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = location[0];
  id v4 = [(BuddyTransferOptionsTableViewCell *)v6 iconLayerView];
  [(BuddyAspectFitLayerView *)v4 setManagedLayer:v3];

  objc_storeStrong(location, 0);
}

- (id)_titleFont
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
  id v2 = [location[0] fontDescriptorWithSymbolicTraits:2];
  id v3 = +[UIFont fontWithDescriptor:v2 size:0.0];

  objc_storeStrong(location, 0);

  return v3;
}

- (id)_descriptionFont
{
  id v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleSubheadline, a2, self);
  id v3 = +[UIFont fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (id)_footnoteFont
{
  id v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleFootnote, a2, self);
  id v3 = +[UIFont fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (double)_imageWidth
{
  id v2 = +[BYDevice currentDevice];
  id v3 = [v2 size];

  if (v3 == (id)2) {
    return 40.0;
  }
  else {
    return 54.0;
  }
}

- (double)_imageLeadingMargin
{
  id v2 = +[BYDevice currentDevice];
  id v3 = (char *)[v2 size];

  if (v3)
  {
    if (v3 == (char *)1) {
      return 20.0;
    }
    if (v3 == (char *)2) {
      return 12.0;
    }
    if (v3 != (char *)3)
    {
      if ((unint64_t)(v3 - 4) >= 3) {
        return v5;
      }
      return 20.0;
    }
  }
  return 16.0;
}

- (double)_imageTrailingMargin
{
  id v2 = +[BYDevice currentDevice];
  id v3 = (char *)[v2 size];

  if (v3)
  {
    if (v3 == (char *)1) {
      return 14.0;
    }
    if ((unint64_t)(v3 - 2) >= 2)
    {
      if ((unint64_t)(v3 - 4) >= 3) {
        return v5;
      }
      return 14.0;
    }
  }
  return 10.0;
}

- (double)_chevronWidth
{
  id v2 = +[BYDevice currentDevice];
  id v3 = [v2 size];

  if (v3 == (id)2) {
    return 24.0;
  }
  else {
    return 20.0;
  }
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UILabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setFootnoteLabel:(id)a3
{
}

- (BuddyAspectFitLayerView)iconLayerView
{
  return self->_iconLayerView;
}

- (void)setIconLayerView:(id)a3
{
}

- (UIImageView)chevronView
{
  return self->_chevronView;
}

- (void)setChevronView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
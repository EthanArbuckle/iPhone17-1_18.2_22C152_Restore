@interface _UIShareHeaderTableViewCell
- (UIImageView)sharedItemBadge;
- (UIImageView)sharedItemThumnail;
- (UILabel)sharedByModifiedByLabel;
- (UILabel)sharedItemLabel;
- (UILabel)sharedWithinLabel;
- (_UIShareHeaderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)didAddSubview:(id)a3;
- (void)setSharedByModifiedByLabel:(id)a3;
- (void)setSharedItemBadge:(id)a3;
- (void)setSharedItemLabel:(id)a3;
- (void)setSharedItemThumnail:(id)a3;
- (void)setSharedWithinLabel:(id)a3;
@end

@implementation _UIShareHeaderTableViewCell

- (_UIShareHeaderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v73.receiver = self;
  v73.super_class = (Class)_UIShareHeaderTableViewCell;
  v4 = [(_UIShareHeaderTableViewCell *)&v73 initWithStyle:0 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc_init((Class)UILabel);
    [(_UIShareHeaderTableViewCell *)v4 setSharedItemLabel:v5];

    v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    [(_UIShareHeaderTableViewCell *)v4 sharedItemLabel];
    v7 = v72 = v4;
    [v7 setFont:v6];

    id v8 = objc_alloc_init((Class)UILabel);
    [(_UIShareHeaderTableViewCell *)v72 setSharedWithinLabel:v8];

    v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    v10 = [(_UIShareHeaderTableViewCell *)v72 sharedWithinLabel];
    [v10 setFont:v9];

    id v11 = objc_alloc_init((Class)UILabel);
    [(_UIShareHeaderTableViewCell *)v72 setSharedByModifiedByLabel:v11];

    v12 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    v13 = [(_UIShareHeaderTableViewCell *)v72 sharedByModifiedByLabel];
    [v13 setFont:v12];

    v14 = +[UIColor secondaryLabelColor];
    v15 = [(_UIShareHeaderTableViewCell *)v72 sharedByModifiedByLabel];
    [v15 setTextColor:v14];

    v16 = [(_UIShareHeaderTableViewCell *)v72 sharedItemLabel];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    v17 = [(_UIShareHeaderTableViewCell *)v72 sharedWithinLabel];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

    v18 = [(_UIShareHeaderTableViewCell *)v72 sharedByModifiedByLabel];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

    v19 = +[NSMutableArray arrayWithCapacity:8];
    id v20 = objc_alloc_init((Class)UIStackView);
    [v20 setAxis:1];
    [v20 setDistribution:0];
    [v20 setAlignment:1];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = [(_UIShareHeaderTableViewCell *)v72 sharedItemLabel];
    v71 = v20;
    [v20 addArrangedSubview:v21];

    v22 = [(_UIShareHeaderTableViewCell *)v72 sharedWithinLabel];
    [v20 addArrangedSubview:v22];

    v23 = [(_UIShareHeaderTableViewCell *)v72 sharedByModifiedByLabel];
    [v20 addArrangedSubview:v23];

    id v24 = objc_alloc_init((Class)UIImageView);
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v24 setContentMode:1];
    v25 = [v24 widthAnchor];
    v26 = [v25 constraintEqualToConstant:21.0];
    v76[0] = v26;
    v27 = [v24 heightAnchor];
    v28 = [v27 constraintEqualToConstant:17.0];
    v76[1] = v28;
    v29 = +[NSArray arrayWithObjects:v76 count:2];
    v30 = v19;
    v70 = v19;
    [v19 addObjectsFromArray:v29];

    [(_UIShareHeaderTableViewCell *)v72 setSharedItemBadge:v24];
    id v31 = objc_alloc_init((Class)UIImageView);
    [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v31 setContentMode:1];
    [v31 addSubview:v24];
    v66 = [v31 widthAnchor];
    v64 = [v66 constraintEqualToConstant:54.0];
    v75[0] = v64;
    v62 = [v31 heightAnchor];
    v32 = [v62 constraintEqualToConstant:54.0];
    v75[1] = v32;
    v33 = [v31 bottomAnchor];
    v34 = v24;
    v69 = v24;
    v35 = [v24 bottomAnchor];
    v36 = [v33 constraintEqualToAnchor:v35];
    v75[2] = v36;
    v68 = v31;
    v37 = [v31 trailingAnchor];
    v38 = [v34 trailingAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    v75[3] = v39;
    v40 = +[NSArray arrayWithObjects:v75 count:4];
    [v30 addObjectsFromArray:v40];

    [(_UIShareHeaderTableViewCell *)v72 setSharedItemThumnail:v31];
    id v41 = objc_alloc((Class)UIStackView);
    v42 = [(_UIShareHeaderTableViewCell *)v72 contentView];
    [v42 bounds];
    id v43 = objc_msgSend(v41, "initWithFrame:");

    [v43 setAxis:0];
    [v43 setDistribution:0];
    [v43 setAlignment:3];
    [v43 setSpacing:20.0];
    v44 = [(_UIShareHeaderTableViewCell *)v72 sharedItemThumnail];
    [v43 addArrangedSubview:v44];

    [v43 addArrangedSubview:v71];
    [v43 setAutoresizingMask:18];
    [v43 setTranslatesAutoresizingMaskIntoConstraints:0];
    v45 = [(_UIShareHeaderTableViewCell *)v72 contentView];
    [v45 addSubview:v43];

    v46 = [(_UIShareHeaderTableViewCell *)v72 contentView];
    v67 = [v46 layoutMarginsGuide];
    v65 = [v67 leadingAnchor];
    v63 = [v43 leadingAnchor];
    v61 = [v65 constraintEqualToAnchor:v63];
    v74[0] = v61;
    v60 = [v46 layoutMarginsGuide];
    v59 = [v60 bottomAnchor];
    v58 = [v43 bottomAnchor];
    v57 = [v59 constraintEqualToAnchor:v58];
    v74[1] = v57;
    v56 = [v46 layoutMarginsGuide];
    v47 = [v56 trailingAnchor];
    v48 = [v43 trailingAnchor];
    v49 = [v47 constraintEqualToAnchor:v48];
    v74[2] = v49;
    v50 = [v46 layoutMarginsGuide];
    v51 = [v50 topAnchor];
    v52 = [v43 topAnchor];
    v53 = [v51 constraintEqualToAnchor:v52];
    v74[3] = v53;
    v54 = +[NSArray arrayWithObjects:v74 count:4];
    [v70 addObjectsFromArray:v54];

    v4 = v72;
    +[NSLayoutConstraint activateConstraints:v70];
  }
  return v4;
}

- (void)didAddSubview:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIShareHeaderTableViewCell;
  [(_UIShareHeaderTableViewCell *)&v10 didAddSubview:v4];
  id v5 = NSStringFromClass((Class)[v4 classForCoder]);
  if ([v5 isEqualToString:@"_UITableViewCellSeparatorView"])
  {
    [v4 frame];
    double v7 = v6;
    [(_UIShareHeaderTableViewCell *)self frame];
    double v9 = v8;

    if (v7 == v9) {
      [v4 setHidden:1];
    }
  }
  else
  {
  }
}

- (UILabel)sharedItemLabel
{
  return self->_sharedItemLabel;
}

- (void)setSharedItemLabel:(id)a3
{
}

- (UILabel)sharedWithinLabel
{
  return self->_sharedWithinLabel;
}

- (void)setSharedWithinLabel:(id)a3
{
}

- (UILabel)sharedByModifiedByLabel
{
  return self->_sharedByModifiedByLabel;
}

- (void)setSharedByModifiedByLabel:(id)a3
{
}

- (UIImageView)sharedItemThumnail
{
  return self->_sharedItemThumnail;
}

- (void)setSharedItemThumnail:(id)a3
{
}

- (UIImageView)sharedItemBadge
{
  return self->_sharedItemBadge;
}

- (void)setSharedItemBadge:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedItemBadge, 0);
  objc_storeStrong((id *)&self->_sharedItemThumnail, 0);
  objc_storeStrong((id *)&self->_sharedByModifiedByLabel, 0);
  objc_storeStrong((id *)&self->_sharedWithinLabel, 0);

  objc_storeStrong((id *)&self->_sharedItemLabel, 0);
}

@end
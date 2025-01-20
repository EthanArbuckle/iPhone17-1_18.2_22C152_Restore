@interface CACInstructionalCell
- (CACInstructionalCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)backgroundColor;
- (id)backgroundConfiguration;
- (void)layoutSubviews;
@end

@implementation CACInstructionalCell

- (id)backgroundColor
{
  return +[UIColor clearColor];
}

- (id)backgroundConfiguration
{
  return +[UIBackgroundConfiguration clearConfiguration];
}

- (CACInstructionalCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v48.receiver = self;
  v48.super_class = (Class)CACInstructionalCell;
  id v7 = a5;
  v8 = [(CACInstructionalCell *)&v48 initWithStyle:a3 reuseIdentifier:a4 specifier:v7];
  v9 = +[UIColor clearColor];
  [(CACInstructionalCell *)v8 setBackgroundColor:v9];

  v10 = +[UIBackgroundConfiguration clearConfiguration];
  [(CACInstructionalCell *)v8 setBackgroundConfiguration:v10];

  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  -[CACInstructionalCell setSeparatorInset:](v8, "setSeparatorInset:", UIEdgeInsetsZero.top, left, bottom, right);
  -[CACInstructionalCell setLayoutMargins:](v8, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
  v47 = [v7 propertyForKey:@"Title"];
  v45 = [v7 propertyForKey:@"Icon"];
  v46 = [v7 propertyForKey:@"IconIgnoresInvertColors"];
  v44 = [v7 propertyForKey:@"Description"];
  v43 = [v7 propertyForKey:@"URLText"];
  v41 = [v7 propertyForKey:@"ButtonCallback"];
  v42 = [v7 propertyForKey:@"CloseCallback"];

  v40 = objc_opt_new();
  v14 = objc_msgSend(v40, "makeContentCellViewWithTitle:image:imageIgnoresInvertColors:description:linkTitle:linkCallback:closeCallback:", v47, v45, objc_msgSend(v46, "BOOLValue"), v44, v43, v41, v42);
  v15 = [v14 view];

  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = [(CACInstructionalCell *)v8 contentView];
  [v16 addSubview:v15];

  v17 = +[UIColor clearColor];
  v18 = [(CACInstructionalCell *)v8 contentView];
  [v18 setBackgroundColor:v17];

  v19 = [v15 layer];
  [v19 setCornerRadius:16.0];

  [v15 setAccessibilityContainerType:4];
  v20 = settingsLocString(@"TIP_VOICEOVER_HINTS_LABEL", @"Accessibility");
  [v15 setAccessibilityLabel:v20];

  v38 = [v15 topAnchor];
  v39 = [(CACInstructionalCell *)v8 contentView];
  v37 = [v39 topAnchor];
  v36 = [v38 constraintEqualToAnchor:v37 constant:0.0];
  v49[0] = v36;
  v34 = [v15 leadingAnchor];
  v35 = [(CACInstructionalCell *)v8 contentView];
  v33 = [v35 leadingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33 constant:15.0];
  v49[1] = v32;
  v21 = [v15 trailingAnchor];
  v22 = [(CACInstructionalCell *)v8 contentView];
  v23 = [v22 trailingAnchor];
  v24 = [v21 constraintEqualToAnchor:v23 constant:-15.0];
  v49[2] = v24;
  v25 = [v15 bottomAnchor];
  v31 = v8;
  v26 = [(CACInstructionalCell *)v8 contentView];
  v27 = [v26 bottomAnchor];
  v28 = [v25 constraintEqualToAnchor:v27 constant:0.0];
  v49[3] = v28;
  v29 = +[NSArray arrayWithObjects:v49 count:4];
  +[NSLayoutConstraint activateConstraints:v29];

  return v31;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CACInstructionalCell;
  [(CACInstructionalCell *)&v14 layoutSubviews];
  v3 = +[UIColor clearColor];
  [(CACInstructionalCell *)self setBackgroundColor:v3];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = [(CACInstructionalCell *)self subviews];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        NSClassFromString(@"_UITableViewCellSeparatorView");
        if (objc_opt_isKindOfClass()) {
          [v9 setHidden:1];
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_backgroundContentView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
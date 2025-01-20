@interface CNAvatarCardContactCell
- (BOOL)moreHighlighted;
- (UIImageView)contactImageView;
- (void)_updateFonts;
- (void)awakeFromNib;
- (void)prepareForReuse;
- (void)reloadData;
- (void)setContactImageView:(id)a3;
@end

@implementation CNAvatarCardContactCell

- (void).cxx_destruct
{
}

- (void)setContactImageView:(id)a3
{
}

- (UIImageView)contactImageView
{
  return self->_contactImageView;
}

- (BOOL)moreHighlighted
{
  return 1;
}

- (void)reloadData
{
  v3 = [(CNAvatarCardActionCell *)self action];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [v6 mainAction];

    id v4 = (id)v7;
  }
  objc_opt_class();
  id v26 = v4;
  if (objc_opt_isKindOfClass()) {
    v8 = v26;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    v10 = [v9 propertyAction];
    v11 = [v10 propertyItem];
    v12 = [v11 contact];

    v13 = [MEMORY[0x1E4F1B910] sharedFullNameFormatterWithFallBacks];
    v14 = [v13 stringFromContact:v12];
    v15 = [(CNAvatarCardActionCell *)self titleLabel];
    [v15 setText:v14];

    v16 = [(CNAvatarCardContactCell *)self contactImageView];
    [v16 layoutIfNeeded];

    v17 = [CNMonogrammer alloc];
    v18 = [(CNAvatarCardContactCell *)self contactImageView];
    [v18 bounds];
    v19 = [(CNMonogrammer *)v17 initWithStyle:0 diameter:CGRectGetWidth(v28)];

    v20 = [(CNAvatarCardContactCell *)self contactImageView];
    v21 = [(CNMonogrammer *)v19 monogramForContact:v12];
    [v20 setImage:v21];

    v22 = +[CNUIColorRepository navigationListActionIconFillColorRegular];
    v23 = [(CNAvatarCardActionCell *)self actionImageView];
    [v23 setTintColor:v22];

    v24 = [v9 image];
    v25 = [(CNAvatarCardActionCell *)self actionImageView];
    [v25 setImage:v24];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CNAvatarCardContactCell;
  [(CNAvatarCardActionCell *)&v3 prepareForReuse];
  [(CNAvatarCardContactCell *)self _updateFonts];
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)CNAvatarCardContactCell;
  [(CNAvatarCardActionCell *)&v3 awakeFromNib];
  [(CNAvatarCardContactCell *)self _updateFonts];
}

- (void)_updateFonts
{
  objc_super v3 = (void *)MEMORY[0x1E4FB08E0];
  id v6 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:0 options:2];
  id v4 = [v3 fontWithDescriptor:v6 size:0.0];
  v5 = [(CNAvatarCardActionCell *)self titleLabel];
  [v5 setFont:v4];
}

@end
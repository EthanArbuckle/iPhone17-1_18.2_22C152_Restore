@interface HKTitledContactBuddyHeaderView
- (HKTitledContactBuddyHeaderView)initWithTopInset:(double)a3 parentViewController:(id)a4;
- (double)bottomPadding;
- (void)_updateForCurrentSizeCategory;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKTitledContactBuddyHeaderView

- (HKTitledContactBuddyHeaderView)initWithTopInset:(double)a3 parentViewController:(id)a4
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v41.receiver = self;
  v41.super_class = (Class)HKTitledContactBuddyHeaderView;
  v7 = [(HKTitledBuddyHeaderView *)&v41 initWithTopInset:0 linkButtonTitle:a3];
  v8 = v7;
  if (v7)
  {
    [(HKTitledContactBuddyHeaderView *)v7 setTranslatesAutoresizingMaskIntoConstraints:1];
    id v9 = objc_alloc_init(MEMORY[0x1E4F4C068]);
    v10 = [v9 profilePictureForAccountOwnerWithoutMonogramFallback];
    v11 = objc_msgSend(v10, "hk_resizedInterfaceImageWithSize:", 59.0, 59.0);
    if (!v11)
    {
      v12 = [MEMORY[0x1E4FB1F48] _applicationKeyWindow];
      uint64_t v13 = [v12 effectiveUserInterfaceLayoutDirection];

      uint64_t v47 = 0;
      v48 = &v47;
      uint64_t v49 = 0x2050000000;
      v14 = (void *)getCNAvatarImageRendererClass_softClass;
      uint64_t v50 = getCNAvatarImageRendererClass_softClass;
      if (!getCNAvatarImageRendererClass_softClass)
      {
        uint64_t v42 = MEMORY[0x1E4F143A8];
        uint64_t v43 = 3221225472;
        v44 = __getCNAvatarImageRendererClass_block_invoke;
        v45 = &unk_1E6D514F8;
        v46 = &v47;
        __getCNAvatarImageRendererClass_block_invoke((uint64_t)&v42);
        v14 = (void *)v48[3];
      }
      v15 = v14;
      _Block_object_dispose(&v47, 8);
      id v16 = objc_alloc_init(v15);
      uint64_t v47 = 0;
      v48 = &v47;
      uint64_t v49 = 0x2050000000;
      v17 = (void *)getCNAvatarImageRenderingScopeClass_softClass;
      uint64_t v50 = getCNAvatarImageRenderingScopeClass_softClass;
      if (!getCNAvatarImageRenderingScopeClass_softClass)
      {
        uint64_t v42 = MEMORY[0x1E4F143A8];
        uint64_t v43 = 3221225472;
        v44 = __getCNAvatarImageRenderingScopeClass_block_invoke;
        v45 = &unk_1E6D514F8;
        v46 = &v47;
        __getCNAvatarImageRenderingScopeClass_block_invoke((uint64_t)&v42);
        v17 = (void *)v48[3];
      }
      id v18 = v17;
      _Block_object_dispose(&v47, 8);
      v19 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v19 scale];
      v21 = objc_msgSend(v18, "scopeWithPointSize:scale:rightToLeft:style:", v13 == 1, 0, 59.0, 59.0, v20);

      id v22 = objc_alloc_init(MEMORY[0x1E4F1B8F8]);
      v51[0] = v22;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
      v11 = [v16 avatarImageForContacts:v23 scope:v21];
    }
    v24 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v11];
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HKTitledContactBuddyHeaderView *)v8 addSubview:v24];
    [(HKTitledBuddyHeaderView *)v8 deactivateDefaultTitleLabelBaselineConstraint];
    v25 = [v24 topAnchor];
    v26 = [(HKTitledContactBuddyHeaderView *)v8 topAnchor];
    v27 = [v25 constraintEqualToAnchor:v26 constant:12.0];
    [v27 setActive:1];

    v28 = [v24 centerXAnchor];
    v29 = [(HKTitledContactBuddyHeaderView *)v8 centerXAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    [v30 setActive:1];

    v31 = [v24 widthAnchor];
    v32 = [v31 constraintEqualToConstant:59.0];
    [v32 setActive:1];

    v33 = [v24 heightAnchor];
    v34 = [v33 constraintEqualToConstant:59.0];
    [v34 setActive:1];

    v35 = [(HKTitledBuddyHeaderView *)v8 titleLabel];
    v36 = [v35 firstBaselineAnchor];
    v37 = [v24 bottomAnchor];
    uint64_t v38 = [v36 constraintEqualToAnchor:v37 constant:0.0];
    titleBaselineConstraint = v8->_titleBaselineConstraint;
    v8->_titleBaselineConstraint = (NSLayoutConstraint *)v38;

    [(NSLayoutConstraint *)v8->_titleBaselineConstraint setActive:1];
    [(HKTitledContactBuddyHeaderView *)v8 _updateForCurrentSizeCategory];
  }
  return v8;
}

- (void)_updateForCurrentSizeCategory
{
  v4.receiver = self;
  v4.super_class = (Class)HKTitledContactBuddyHeaderView;
  [(HKTitledBuddyHeaderView *)&v4 _updateForCurrentSizeCategory];
  v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2988]];
  [v3 _scaledValueForValue:44.0];
  -[NSLayoutConstraint setConstant:](self->_titleBaselineConstraint, "setConstant:");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    v5 = [(HKTitledContactBuddyHeaderView *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];
    v7 = [v9 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    id v4 = v9;
    if ((v8 & 1) == 0)
    {
      [(HKTitledContactBuddyHeaderView *)self _updateForCurrentSizeCategory];
      id v4 = v9;
    }
  }
}

- (double)bottomPadding
{
  return 56.0;
}

- (void).cxx_destruct
{
}

@end
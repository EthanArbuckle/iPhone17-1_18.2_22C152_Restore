@interface CKDetailsGroupNameCell
+ (BOOL)shouldHighlight;
+ (id)reuseIdentifier;
- (CKDetailsAddGroupNameView)groupNameView;
- (CKDetailsGroupNameCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_ckSymbolImageNamed:(id)a3 preferredContentSizeCategory:(id)a4 preferredFontTextStyle:(id)a5;
- (void)dealloc;
- (void)setGroupNameView:(id)a3;
@end

@implementation CKDetailsGroupNameCell

- (CKDetailsGroupNameCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CKDetailsGroupNameCell;
  v4 = [(CKDetailsCell *)&v6 initWithStyle:a3 reuseIdentifier:a4];
  if (v4) {
    CKIsRunningInMacCatalyst();
  }
  return v4;
}

- (id)_ckSymbolImageNamed:(id)a3 preferredContentSizeCategory:(id)a4 preferredFontTextStyle:(id)a5
{
  v7 = (void *)MEMORY[0x1E4F42F80];
  id v8 = a5;
  id v9 = a3;
  v10 = [v7 traitCollectionWithPreferredContentSizeCategory:a4];
  v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v8 compatibleWithTraitCollection:v10];

  [v11 pointSize];
  v12 = objc_msgSend(MEMORY[0x1E4F42A98], "configurationWithPointSize:");
  v13 = [MEMORY[0x1E4F42A80] systemImageNamed:v9 withConfiguration:v12];

  return v13;
}

- (void)dealloc
{
  v3 = [(CKDetailsGroupNameCell *)self groupNameView];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)CKDetailsGroupNameCell;
  [(CKDetailsGroupNameCell *)&v4 dealloc];
}

- (void)setGroupNameView:(id)a3
{
  v32[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(CKDetailsGroupNameCell *)self groupNameView];

  if (v6 != v5)
  {
    v7 = [(CKDetailsGroupNameCell *)self groupNameView];
    [v7 removeFromSuperview];

    p_groupNameView = &self->_groupNameView;
    objc_storeStrong((id *)&self->_groupNameView, a3);
    id v9 = [(CKDetailsGroupNameCell *)self contentView];
    [v9 addSubview:self->_groupNameView];

    if (!CKIsRunningInMacCatalyst())
    {
      [(CKDetailsAddGroupNameView *)*p_groupNameView setTranslatesAutoresizingMaskIntoConstraints:0];
      v22 = (void *)MEMORY[0x1E4F28DC8];
      v30 = [(CKDetailsAddGroupNameView *)*p_groupNameView topAnchor];
      v31 = [(CKDetailsGroupNameCell *)self contentView];
      v29 = [v31 layoutMarginsGuide];
      v28 = [v29 topAnchor];
      v27 = [v30 constraintEqualToAnchor:v28];
      v32[0] = v27;
      v25 = [(CKDetailsAddGroupNameView *)*p_groupNameView leftAnchor];
      v26 = [(CKDetailsGroupNameCell *)self contentView];
      v24 = [v26 layoutMarginsGuide];
      v23 = [v24 leftAnchor];
      v21 = [v25 constraintEqualToAnchor:v23];
      v32[1] = v21;
      v19 = [(CKDetailsAddGroupNameView *)*p_groupNameView bottomAnchor];
      v20 = [(CKDetailsGroupNameCell *)self contentView];
      v10 = [v20 layoutMarginsGuide];
      v11 = [v10 bottomAnchor];
      v12 = [v19 constraintEqualToAnchor:v11];
      v32[2] = v12;
      v13 = [(CKDetailsAddGroupNameView *)*p_groupNameView rightAnchor];
      v14 = [(CKDetailsGroupNameCell *)self contentView];
      v15 = [v14 layoutMarginsGuide];
      v16 = [v15 rightAnchor];
      v17 = [v13 constraintEqualToAnchor:v16];
      v32[3] = v17;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
      [v22 activateConstraints:v18];
    }
  }
}

+ (id)reuseIdentifier
{
  return @"Details_GroupName_Identifier";
}

+ (BOOL)shouldHighlight
{
  return 0;
}

- (CKDetailsAddGroupNameView)groupNameView
{
  return self->_groupNameView;
}

- (void).cxx_destruct
{
}

@end
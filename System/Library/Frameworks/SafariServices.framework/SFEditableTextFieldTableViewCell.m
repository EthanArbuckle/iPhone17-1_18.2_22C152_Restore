@interface SFEditableTextFieldTableViewCell
- (SFEditableTextFieldTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITextField)editableTextField;
- (void)setEditableTextField:(id)a3;
@end

@implementation SFEditableTextFieldTableViewCell

- (SFEditableTextFieldTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)SFEditableTextFieldTableViewCell;
  v4 = [(SFEditableTextFieldTableViewCell *)&v30 initWithStyle:0 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(SFEditableTextFieldTableViewCell *)v4 contentView];
    v29 = v6;
    v7 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    editableTextField = v5->_editableTextField;
    v5->_editableTextField = v7;

    [(UITextField *)v5->_editableTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    if ([(SFEditableTextFieldTableViewCell *)v5 _sf_usesLeftToRightLayout]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 2;
    }
    [(UITextField *)v5->_editableTextField setTextAlignment:v9];
    v10 = +[_SFAccountManagerAppearanceValues titleFontForLargerCell];
    [(UITextField *)v5->_editableTextField setFont:v10];

    [v6 addSubview:v5->_editableTextField];
    v11 = [(SFEditableTextFieldTableViewCell *)v5 contentView];
    v12 = [v11 layoutMarginsGuide];

    v23 = (void *)MEMORY[0x1E4F28DC8];
    v28 = [(UITextField *)v5->_editableTextField leadingAnchor];
    v27 = [v12 leadingAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v31[0] = v26;
    v25 = [(UITextField *)v5->_editableTextField trailingAnchor];
    v24 = [v12 trailingAnchor];
    v13 = [v25 constraintEqualToAnchor:v24];
    v31[1] = v13;
    v14 = [(UITextField *)v5->_editableTextField heightAnchor];
    v15 = [v12 heightAnchor];
    v16 = [v14 constraintLessThanOrEqualToAnchor:v15];
    v31[2] = v16;
    v17 = [(UITextField *)v5->_editableTextField centerYAnchor];
    v18 = [v12 centerYAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v31[3] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
    [v23 activateConstraints:v20];

    v21 = v5;
  }

  return v5;
}

- (UITextField)editableTextField
{
  return self->_editableTextField;
}

- (void)setEditableTextField:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
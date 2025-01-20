@interface AKBasicLoginTableViewCell
- (AKBasicLoginTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITextField)cellTextField;
@end

@implementation AKBasicLoginTableViewCell

- (AKBasicLoginTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v33[4] = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)AKBasicLoginTableViewCell;
  v4 = [(AKBasicLoginTableViewCell *)&v32 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    -[AKBasicLoginTableViewCell setSeparatorInset:](v4, "setSeparatorInset:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
    v6 = +[AKBasicLoginAppearance tableCellBackgroundColor];
    [(AKBasicLoginTableViewCell *)v5 setBackgroundColor:v6];

    v7 = [(AKBasicLoginTableViewCell *)v5 textLabel];
    [v7 setHidden:1];

    id v8 = objc_alloc(MEMORY[0x1E4F42F10]);
    v9 = (UITextField *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UITextField *)v9 setBorderStyle:0];
    [(UITextField *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v9 setAdjustsFontForContentSizeCategory:1];
    [(UITextField *)v9 setAutocapitalizationType:0];
    [(UITextField *)v9 setAutocorrectionType:1];
    [(UITextField *)v9 setEnablesReturnKeyAutomatically:1];
    v10 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [(UITextField *)v9 setFont:v10];

    v11 = [(AKBasicLoginTableViewCell *)v5 contentView];
    [v11 addSubview:v9];

    cellTextField = v5->_cellTextField;
    v5->_cellTextField = v9;
    v31 = v9;

    v30 = [(UITextField *)v5->_cellTextField leadingAnchor];
    v29 = [(AKBasicLoginTableViewCell *)v5 leadingAnchor];
    v28 = [v30 constraintEqualToAnchor:v29 constant:16.0];
    v33[0] = v28;
    v26 = [(UITextField *)v5->_cellTextField trailingAnchor];
    v27 = [(AKBasicLoginTableViewCell *)v5 contentView];
    v25 = [v27 trailingAnchor];
    [(AKBasicLoginTableViewCell *)v5 separatorInset];
    v24 = [v26 constraintEqualToAnchor:v25 constant:-v13];
    v33[1] = v24;
    v14 = [(UITextField *)v5->_cellTextField heightAnchor];
    v15 = [(AKBasicLoginTableViewCell *)v5 contentView];
    v16 = [v15 heightAnchor];
    v17 = [v14 constraintEqualToAnchor:v16 constant:-20.0];
    v33[2] = v17;
    v18 = [(UITextField *)v5->_cellTextField centerYAnchor];
    v19 = [(AKBasicLoginTableViewCell *)v5 contentView];
    v20 = [v19 centerYAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    v33[3] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];

    [MEMORY[0x1E4F28DC8] activateConstraints:v22];
  }
  return v5;
}

- (UITextField)cellTextField
{
  return self->_cellTextField;
}

- (void).cxx_destruct
{
}

@end
@interface EKUILocationEditItemCell
- (EKUILocationEditItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIButton)clearButton;
- (id)description;
- (void)updateWithName:(id)a3 sourceSupportsAvailability:(BOOL)a4 availabilityRequestInProgress:(BOOL)a5 availabilityType:(int64_t)a6;
@end

@implementation EKUILocationEditItemCell

- (EKUILocationEditItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v47.receiver = self;
  v47.super_class = (Class)EKUILocationEditItemCell;
  v4 = [(EKUILocationEditItemCell *)&v47 initWithStyle:0 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(EKUILocationEditItemCell *)v4 contentView];
    v7 = [EKUIClearButton alloc];
    v8 = ClearButtonImageColor();
    uint64_t v9 = [(EKUIClearButton *)v7 initWithColor:v8];
    clearButton = v5->_clearButton;
    v5->_clearButton = (UIButton *)v9;

    [(UIButton *)v5->_clearButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 addSubview:v5->_clearButton];
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    title = v5->_title;
    v5->_title = v11;

    [(UILabel *)v5->_title setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v5->_title setFont:v13];

    v14 = [(EKUILocationEditItemCell *)v5 textLabel];
    v15 = [v14 textColor];
    [(UILabel *)v5->_title setTextColor:v15];

    [v6 addSubview:v5->_title];
    v16 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    image = v5->_image;
    v5->_image = v16;

    v18 = (void *)MEMORY[0x1E4FB1830];
    v19 = [(UILabel *)v5->_title font];
    v20 = [v18 configurationWithFont:v19];
    [(UIImageView *)v5->_image setPreferredSymbolConfiguration:v20];

    [(UIImageView *)v5->_image setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v21) = 1148846080;
    [(UIImageView *)v5->_image setContentHuggingPriority:0 forAxis:v21];
    LODWORD(v22) = 1148846080;
    [(UIImageView *)v5->_image setContentHuggingPriority:1 forAxis:v22];
    LODWORD(v23) = 1148846080;
    [(UIImageView *)v5->_image setContentCompressionResistancePriority:0 forAxis:v23];
    LODWORD(v24) = 1148846080;
    [(UIImageView *)v5->_image setContentCompressionResistancePriority:1 forAxis:v24];
    [v6 addSubview:v5->_image];
    uint64_t v25 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = v5->_spinner;
    v5->_spinner = (UIActivityIndicatorView *)v25;

    [(UIActivityIndicatorView *)v5->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v27) = 1148846080;
    [(UIActivityIndicatorView *)v5->_spinner setContentHuggingPriority:0 forAxis:v27];
    LODWORD(v28) = 1148846080;
    [(UIActivityIndicatorView *)v5->_spinner setContentHuggingPriority:1 forAxis:v28];
    LODWORD(v29) = 1148846080;
    [(UIActivityIndicatorView *)v5->_spinner setContentCompressionResistancePriority:0 forAxis:v29];
    LODWORD(v30) = 1148846080;
    [(UIActivityIndicatorView *)v5->_spinner setContentCompressionResistancePriority:1 forAxis:v30];
    [v6 addSubview:v5->_spinner];
    v31 = _NSDictionaryOfVariableBindings(&cfstr_Title.isa, v5->_title, 0);
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v33 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-(textPadding)-[_title]-(textPadding)-|" options:0 metrics:&unk_1F0D03DA8 views:v31];
    [v32 addObjectsFromArray:v33];

    v34 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5->_image attribute:5 relatedBy:0 toItem:v6 attribute:5 multiplier:1.0 constant:16.0];
    [v32 addObject:v34];

    v35 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5->_image attribute:10 relatedBy:0 toItem:v6 attribute:10 multiplier:1.0 constant:0.0];
    [v32 addObject:v35];

    v36 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5->_spinner attribute:5 relatedBy:0 toItem:v6 attribute:5 multiplier:1.0 constant:16.0];
    [v32 addObject:v36];

    v37 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5->_spinner attribute:10 relatedBy:0 toItem:v6 attribute:10 multiplier:1.0 constant:0.0];
    [v32 addObject:v37];

    v38 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5->_title attribute:5 relatedBy:0 toItem:v6 attribute:5 multiplier:1.0 constant:46.0];
    [v32 addObject:v38];

    v39 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5->_clearButton attribute:5 relatedBy:0 toItem:v5->_title attribute:6 multiplier:1.0 constant:8.0];
    [v32 addObject:v39];

    v40 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5->_clearButton attribute:10 relatedBy:0 toItem:v6 attribute:10 multiplier:1.0 constant:0.0];
    [v32 addObject:v40];

    v41 = (void *)MEMORY[0x1E4F28DC8];
    v42 = v5->_clearButton;
    +[EKUIClearButton trailingOffsetToMarginForTextFieldClearButtonAlignment];
    v44 = [v41 constraintWithItem:v6 attribute:18 relatedBy:0 toItem:v42 attribute:6 multiplier:1.0 constant:v43];
    [v32 addObject:v44];

    v45 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:44.0];
    [v32 addObject:v45];

    [v6 addConstraints:v32];
  }
  return v5;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F576E8]);
  v8.receiver = self;
  v8.super_class = (Class)EKUILocationEditItemCell;
  v4 = [(EKUILocationEditItemCell *)&v8 description];
  v5 = (void *)[v3 initWithSuperclassDescription:v4];

  [v5 setKey:@"_title" withObject:self->_title];
  [v5 setKey:@"_spinner" withObject:self->_spinner];
  [v5 setKey:@"_clearButton" withObject:self->_clearButton];
  [v5 setKey:@"_image" withObject:self->_image];
  v6 = [v5 build];

  return v6;
}

- (void)updateWithName:(id)a3 sourceSupportsAvailability:(BOOL)a4 availabilityRequestInProgress:(BOOL)a5 availabilityType:(int64_t)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v15 = a3;
  int v10 = [(UIActivityIndicatorView *)self->_spinner isHidden];
  if (v8 && v7)
  {
    if (!v10) {
      goto LABEL_11;
    }
    [(UIActivityIndicatorView *)self->_spinner startAnimating];
    [(UIActivityIndicatorView *)self->_spinner setHidden:0];
    goto LABEL_9;
  }
  if ((v10 & 1) == 0)
  {
    [(UIActivityIndicatorView *)self->_spinner stopAnimating];
    [(UIActivityIndicatorView *)self->_spinner setHidden:1];
    [(UIImageView *)self->_image setHidden:0];
  }
  if (!v8)
  {
LABEL_9:
    p_image = &self->_image;
    uint64_t v14 = 1;
    goto LABEL_10;
  }
  v11 = ImageForAvailabilityType(a6);
  p_image = &self->_image;
  [(UIImageView *)self->_image setImage:v11];

  v13 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [(UIImageView *)self->_image setTintColor:v13];

  uint64_t v14 = 0;
LABEL_10:
  [(UIImageView *)*p_image setHidden:v14];
LABEL_11:
  [(UILabel *)self->_title setText:v15];
}

- (UIButton)clearButton
{
  return self->_clearButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end
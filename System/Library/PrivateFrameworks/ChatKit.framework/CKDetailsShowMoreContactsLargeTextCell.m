@interface CKDetailsShowMoreContactsLargeTextCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKDetailsShowMoreContactsLargeTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_initConstraints;
@end

@implementation CKDetailsShowMoreContactsLargeTextCell

- (CKDetailsShowMoreContactsLargeTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CKDetailsShowMoreContactsLargeTextCell;
  v4 = [(CKDetailsCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(CKDetailsShowMoreContactsLargeTextCell *)v4 _initConstraints];
  }
  return v5;
}

- (void)_initConstraints
{
  v23[3] = *MEMORY[0x1E4F143B8];
  v3 = [(CKDetailsShowMoreContactsLargeTextCell *)self textLabel];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = (void *)MEMORY[0x1E4F28DC8];
  v22 = [(CKDetailsShowMoreContactsLargeTextCell *)self textLabel];
  v20 = [v22 leadingAnchor];
  v21 = [(CKDetailsShowMoreContactsLargeTextCell *)self contentView];
  v19 = [v21 layoutMarginsGuide];
  v18 = [v19 leadingAnchor];
  v17 = [v20 constraintEqualToAnchor:v18];
  v23[0] = v17;
  v16 = [(CKDetailsShowMoreContactsLargeTextCell *)self textLabel];
  v14 = [v16 trailingAnchor];
  v4 = [(CKDetailsShowMoreContactsLargeTextCell *)self contentView];
  v5 = [v4 layoutMarginsGuide];
  v6 = [v5 trailingAnchor];
  objc_super v7 = [v14 constraintEqualToAnchor:v6];
  v23[1] = v7;
  v8 = [(CKDetailsShowMoreContactsLargeTextCell *)self textLabel];
  v9 = [v8 topAnchor];
  v10 = [(CKDetailsShowMoreContactsLargeTextCell *)self contentView];
  v11 = [v10 topAnchor];
  v12 = [v9 constraintEqualToAnchor:v11 constant:10.0];
  v23[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  [v15 activateConstraints:v13];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  v5 = [(CKDetailsShowMoreContactsLargeTextCell *)self contentView];
  v6 = [v5 layoutMarginsGuide];
  [v6 layoutFrame];
  double v8 = v7;

  v9 = [(CKDetailsShowMoreContactsLargeTextCell *)self textLabel];
  objc_msgSend(v9, "sizeThatFits:", v8, height);
  double v11 = v10;

  double v12 = v11 + 20.0;
  double v13 = v8;
  result.double height = v12;
  result.width = v13;
  return result;
}

@end
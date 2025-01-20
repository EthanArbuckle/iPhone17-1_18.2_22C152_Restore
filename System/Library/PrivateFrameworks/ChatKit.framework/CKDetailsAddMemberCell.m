@interface CKDetailsAddMemberCell
+ (Class)cellClass;
+ (double)preferredHeight;
+ (id)reuseIdentifier;
- (CKDetailsAddMemberCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)addLabel;
- (void)setAddLabel:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation CKDetailsAddMemberCell

+ (Class)cellClass
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 isAccessibilityPreferredContentSizeCategory];
  id v3 = (id)objc_opt_class();

  return (Class)v3;
}

+ (id)reuseIdentifier
{
  return @"CKDetailsAddMemberCell_reuseIdentifier";
}

+ (double)preferredHeight
{
  return 0.0;
}

- (CKDetailsAddMemberCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)CKDetailsAddMemberCell;
  v4 = [(CKDetailsCell *)&v24 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42B38]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CKDetailsAddMemberCell *)v4 setAddLabel:v6];

    v7 = [(CKDetailsAddMemberCell *)v4 addLabel];
    [v7 setNumberOfLines:0];

    v8 = [(CKDetailsAddMemberCell *)v4 addLabel];
    v9 = CKFrameworkBundle();
    v10 = [v9 localizedStringForKey:@"ADD_CONTACT" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v8 setText:v10];

    v11 = [(CKDetailsAddMemberCell *)v4 addLabel];
    v12 = +[CKUIBehavior sharedBehaviors];
    v13 = [v12 addContactFont];
    [v11 setFont:v13];

    v14 = [(CKDetailsAddMemberCell *)v4 addLabel];
    v15 = +[CKUIBehavior sharedBehaviors];
    v16 = [v15 theme];
    v17 = [v16 detailsTextColor];
    [v14 setTextColor:v17];

    v18 = [(CKDetailsAddMemberCell *)v4 addLabel];
    [v18 sizeToFit];

    v19 = [(CKDetailsAddMemberCell *)v4 contentView];
    v20 = [(CKDetailsAddMemberCell *)v4 addLabel];
    [v19 addSubview:v20];

    v21 = [(CKDetailsAddMemberCell *)v4 contentView];
    [v21 setBackgroundColor:0];

    v22 = [(CKDetailsCell *)v4 bottomSeperator];
    [v22 setHidden:1];
  }
  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[CKDetailsAddMemberCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  id v5 = [(CKDetailsAddMemberCell *)self addLabel];
  [v5 setEnabled:v3];

  id v6 = [(CKDetailsAddMemberCell *)self addLabel];
  [v6 setUserInteractionEnabled:v3];
}

- (UILabel)addLabel
{
  return self->_addLabel;
}

- (void)setAddLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface CKDetailsAddMemberLargeTextCell
+ (double)preferredHeight;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKDetailsAddMemberLargeTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILayoutGuide)leadingGuide;
- (void)_initConstraints;
- (void)_initLabel;
- (void)setLeadingGuide:(id)a3;
@end

@implementation CKDetailsAddMemberLargeTextCell

+ (double)preferredHeight
{
  return *MEMORY[0x1E4F43D18];
}

- (CKDetailsAddMemberLargeTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CKDetailsAddMemberLargeTextCell;
  v4 = [(CKDetailsAddMemberCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(CKDetailsAddMemberLargeTextCell *)v4 _initLabel];
    [(CKDetailsAddMemberLargeTextCell *)v5 _initConstraints];
  }
  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(CKDetailsAddMemberCell *)self addLabel];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;

  double v8 = v7 + 20.0;
  double v9 = width;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (void)_initConstraints
{
  v22[3] = *MEMORY[0x1E4F143B8];
  v3 = [(CKDetailsAddMemberCell *)self addLabel];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v14 = (void *)MEMORY[0x1E4F28DC8];
  v21 = [(CKDetailsAddMemberCell *)self addLabel];
  v19 = [v21 leadingAnchor];
  v20 = [(CKDetailsAddMemberLargeTextCell *)self contentView];
  v18 = [v20 layoutMarginsGuide];
  v17 = [v18 leadingAnchor];
  v16 = [v19 constraintEqualToAnchor:v17];
  v22[0] = v16;
  v15 = [(CKDetailsAddMemberCell *)self addLabel];
  v4 = [v15 trailingAnchor];
  v5 = [(CKDetailsAddMemberLargeTextCell *)self contentView];
  double v6 = [v5 layoutMarginsGuide];
  double v7 = [v6 trailingAnchor];
  double v8 = [v4 constraintEqualToAnchor:v7];
  v22[1] = v8;
  double v9 = [(CKDetailsAddMemberCell *)self addLabel];
  v10 = [v9 topAnchor];
  v11 = [(CKDetailsAddMemberLargeTextCell *)self topAnchor];
  v12 = [v10 constraintEqualToAnchor:v11 constant:10.0];
  v22[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  [v14 activateConstraints:v13];
}

- (void)_initLabel
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  v5 = [(CKDetailsAddMemberCell *)self addLabel];
  double v6 = [v5 text];
  uint64_t v11 = *MEMORY[0x1E4FB0738];
  v12[0] = v3;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  double v8 = (void *)[v4 initWithString:v6 attributes:v7];

  double v9 = [(CKDetailsAddMemberCell *)self addLabel];
  [v9 _setOverallWritingDirectionFollowsLayoutDirection:1];

  v10 = [(CKDetailsAddMemberCell *)self addLabel];
  [v10 setAttributedText:v8];
}

- (UILayoutGuide)leadingGuide
{
  return self->_leadingGuide;
}

- (void)setLeadingGuide:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
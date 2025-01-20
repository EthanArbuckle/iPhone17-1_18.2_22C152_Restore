@interface CKPinnedConversationDropTargetCollectionViewCell
+ (NSString)reuseIdentifier;
+ (NSString)uniqueIdentifier;
+ (id)uniqueIdentifierForDropTargetAtItemIndex:(int64_t)a3;
- (BOOL)shouldAnimateCircle;
- (BOOL)shouldHideLabel;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKDropZoneCircleView)dropZoneCircleView;
- (CKPinnedConversationDropTargetCollectionViewCell)initWithFrame:(CGRect)a3;
- (CKPinnedConversationView)prototypeConversationView;
- (UILabel)instructionLabel;
- (int64_t)layoutStyle;
- (void)_updateFont;
- (void)_updateInstructionLabelColor;
- (void)layoutSubviews;
- (void)setDropZoneCircleView:(id)a3;
- (void)setInstructionLabel:(id)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setPrototypeConversationView:(id)a3;
- (void)setShouldAnimateCircle:(BOOL)a3;
- (void)setShouldHideLabel:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CKPinnedConversationDropTargetCollectionViewCell

+ (NSString)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (NSString)uniqueIdentifier
{
  return (NSString *)@"PinnedConversationDropTarget";
}

+ (id)uniqueIdentifierForDropTargetAtItemIndex:(int64_t)a3
{
  v4 = NSString;
  v5 = [a1 uniqueIdentifier];
  v6 = [v4 stringWithFormat:@"%@%li", v5, a3];

  return v6;
}

- (CKPinnedConversationDropTargetCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)CKPinnedConversationDropTargetCollectionViewCell;
  v7 = -[CKPinnedConversationDropTargetCollectionViewCell initWithFrame:](&v21, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    v9 = [(CKPinnedConversationDropTargetCollectionViewCell *)v7 contentView];
    id v10 = objc_alloc(MEMORY[0x1E4F42B38]);
    [(CKPinnedConversationDropTargetCollectionViewCell *)v8 bounds];
    uint64_t v11 = objc_msgSend(v10, "initWithFrame:");
    instructionLabel = v8->_instructionLabel;
    v8->_instructionLabel = (UILabel *)v11;

    v13 = v8->_instructionLabel;
    v14 = CKFrameworkBundle();
    v15 = [v14 localizedStringForKey:@"PIN_CONVERSATION_DROP_TARGET_LABEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [(UILabel *)v13 setText:v15];

    [(UILabel *)v8->_instructionLabel setNumberOfLines:3];
    [(UILabel *)v8->_instructionLabel setTextAlignment:1];
    [(CKPinnedConversationDropTargetCollectionViewCell *)v8 _updateInstructionLabelColor];
    [v9 addSubview:v8->_instructionLabel];
    v16 = -[CKDropZoneCircleView initWithFrame:]([CKDropZoneCircleView alloc], "initWithFrame:", x, y, width, height);
    dropZoneCircleView = v8->_dropZoneCircleView;
    v8->_dropZoneCircleView = v16;

    [v9 addSubview:v8->_dropZoneCircleView];
    v18 = objc_alloc_init(CKPinnedConversationView);
    prototypeConversationView = v8->_prototypeConversationView;
    v8->_prototypeConversationView = v18;

    [(CKPinnedConversationView *)v8->_prototypeConversationView configureAsPrototypeCell];
    [(CKPinnedConversationDropTargetCollectionViewCell *)v8 setShouldHideLabel:0];
    [(CKPinnedConversationDropTargetCollectionViewCell *)v8 setShouldAnimateCircle:1];
    [(CKPinnedConversationDropTargetCollectionViewCell *)v8 _updateFont];
  }
  return v8;
}

- (void)setShouldHideLabel:(BOOL)a3
{
  self->_shouldHideLabel = a3;
  -[UILabel setHidden:](self->_instructionLabel, "setHidden:");
}

- (void)setShouldAnimateCircle:(BOOL)a3
{
  self->_shouldAnimateCircle = a3;
  dropZoneCircleView = self->_dropZoneCircleView;
  if (a3) {
    [(CKDropZoneCircleView *)dropZoneCircleView startAnimating];
  }
  else {
    [(CKDropZoneCircleView *)dropZoneCircleView stopAnimating];
  }
}

- (void)_updateFont
{
  instructionLabel = self->_instructionLabel;
  id v4 = +[CKUIBehavior sharedBehaviors];
  v3 = [v4 conversationListDropTargetInstructionFont];
  [(UILabel *)instructionLabel setFont:v3];
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)CKPinnedConversationDropTargetCollectionViewCell;
  [(CKPinnedConversationDropTargetCollectionViewCell *)&v34 layoutSubviews];
  v3 = [(CKPinnedConversationDropTargetCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  +[CKPinnedConversationView avatarViewPadding];
  double v11 = v10;
  +[CKPinnedConversationView avatarViewSizeFittingSize:layoutStyle:](CKPinnedConversationView, "avatarViewSizeFittingSize:layoutStyle:", self->_layoutStyle, v7, v9);
  double v13 = v12;
  double v15 = v14;
  double v16 = (v7 - v12) * 0.5;
  double v17 = v5 + v11;
  -[CKDropZoneCircleView setFrame:](self->_dropZoneCircleView, "setFrame:", v16, v17, v12, v14);
  [(UILabel *)self->_instructionLabel setAllowsDefaultTighteningForTruncation:0];
  -[UILabel sizeThatFits:](self->_instructionLabel, "sizeThatFits:", v13, v15);
  double v19 = v18;
  double v21 = v20;
  -[UILabel setBounds:](self->_instructionLabel, "setBounds:", 0.0, 0.0, v18, v20);
  v22 = [(UILabel *)self->_instructionLabel font];
  [v22 lineHeight];
  unint64_t v24 = llround(v21 / v23);

  if (v24 == 2)
  {
    [(UILabel *)self->_instructionLabel _firstLineBaselineOffsetFromBoundsTop];
    double v26 = v25;
    v35.origin.double x = v16;
    v35.origin.double y = v17;
    v35.size.double width = v13;
    v35.size.double height = v15;
    double v27 = CGRectGetMidY(v35) - v26;
  }
  else
  {
    v36.origin.double x = v16;
    v36.origin.double y = v17;
    v36.size.double width = v13;
    v36.size.double height = v15;
    double v27 = CGRectGetMidY(v36) + v21 * -0.5;
  }
  v37.origin.double x = v16;
  v37.origin.double y = v17;
  v37.size.double width = v13;
  v37.size.double height = v15;
  v38.origin.double x = CGRectGetMidX(v37) - v19 * 0.5;
  v38.origin.double y = v27;
  v38.size.double width = v19;
  v38.size.double height = v21;
  double MaxY = CGRectGetMaxY(v38);
  v39.origin.double x = v16;
  v39.origin.double y = v17;
  v39.size.double width = v13;
  v39.size.double height = v15;
  CGFloat MidY = CGRectGetMidY(v39);
  double v30 = v13 * 0.5 * (v13 * 0.5) - (MaxY - MidY) * (MaxY - MidY);
  v40.origin.double x = v16;
  v40.origin.double y = v17;
  v40.size.double width = v13;
  v40.size.double height = v15;
  double v31 = sqrt(v30);
  CGFloat v32 = CGRectGetMidX(v40) - v31;
  v41.origin.double x = v16;
  v41.origin.double y = v17;
  v41.size.double width = v13;
  v41.size.double height = v15;
  CGFloat v33 = CGRectGetMidX(v41) + v31 - v32;
  [(UILabel *)self->_instructionLabel setAllowsDefaultTighteningForTruncation:1];
  -[UILabel setFrame:](self->_instructionLabel, "setFrame:", v32, v27, v33, v21);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CKPinnedConversationView *)self->_prototypeConversationView setLayoutStyle:self->_layoutStyle];
  prototypeConversationView = self->_prototypeConversationView;

  -[CKPinnedConversationView sizeThatFits:](prototypeConversationView, "sizeThatFits:", width, height);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKPinnedConversationDropTargetCollectionViewCell;
  [(CKPinnedConversationDropTargetCollectionViewCell *)&v4 traitCollectionDidChange:a3];
  [(CKPinnedConversationDropTargetCollectionViewCell *)self _updateInstructionLabelColor];
}

- (void)_updateInstructionLabelColor
{
  v3 = [(CKPinnedConversationDropTargetCollectionViewCell *)self traitCollection];
  unint64_t v4 = [v3 userInterfaceStyle];

  if (v4 >= 2)
  {
    if (v4 != 2)
    {
      id v7 = 0;
      goto LABEL_7;
    }
    uint64_t v5 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.48];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F428B8] colorWithRed:0.31372549 green:0.333333333 blue:0.360784314 alpha:0.6];
  }
  id v7 = (id)v5;
LABEL_7:
  double v6 = [(CKPinnedConversationDropTargetCollectionViewCell *)self instructionLabel];
  [v6 setTextColor:v7];
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (BOOL)shouldHideLabel
{
  return self->_shouldHideLabel;
}

- (BOOL)shouldAnimateCircle
{
  return self->_shouldAnimateCircle;
}

- (CKDropZoneCircleView)dropZoneCircleView
{
  return self->_dropZoneCircleView;
}

- (void)setDropZoneCircleView:(id)a3
{
}

- (UILabel)instructionLabel
{
  return self->_instructionLabel;
}

- (void)setInstructionLabel:(id)a3
{
}

- (CKPinnedConversationView)prototypeConversationView
{
  return self->_prototypeConversationView;
}

- (void)setPrototypeConversationView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prototypeConversationView, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);

  objc_storeStrong((id *)&self->_dropZoneCircleView, 0);
}

@end
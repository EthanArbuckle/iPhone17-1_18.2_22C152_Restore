@interface GestureInstructionView
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (GestureInstructionView)initWithFrame:(CGRect)a3;
- (void)_addInstructionWithImageName:(id)a3 titleKey:(id)a4 descriptionKey:(id)a5 bundle:(id)a6;
- (void)_updateUI;
- (void)layoutSubviews;
@end

@implementation GestureInstructionView

- (GestureInstructionView)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)GestureInstructionView;
  v3 = -[GestureInstructionView initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor blackColor];
    [(GestureInstructionView *)v3 setBackgroundColor:v4];

    v5 = [(GestureInstructionView *)v3 panGestureRecognizer];
    [v5 setDelegate:v3];

    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v7;

    v9 = v3->_titleLabel;
    v10 = +[UIColor whiteColor];
    [(UILabel *)v9 setTextColor:v10];

    v11 = v3->_titleLabel;
    v12 = [v6 localizedStringForKey:@"GESTURE_INSTRUCTION_TITLE" value:&stru_24D60 table:@"DigitalTouchBalloonProvider-Localizable"];
    [(UILabel *)v11 setText:v12];

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle1];
    v14 = +[UIApplication sharedApplication];
    v15 = [v14 preferredContentSizeCategory];
    uint64_t v16 = _UIContentSizeCategoryCompareToContentSizeCategory();

    if (v16 == 1)
    {
      v17 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
      uint64_t v18 = [v13 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v17];

      v13 = (void *)v18;
    }
    [v13 _scaledValueForValue:30.0];
    v19 = v3->_titleLabel;
    v20 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    [(UILabel *)v19 setFont:v20];

    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(UILabel *)v3->_titleLabel sizeToFit];
    [(GestureInstructionView *)v3 addSubview:v3->_titleLabel];
    uint64_t v21 = +[NSMutableArray arrayWithCapacity:6];
    itemViews = v3->_itemViews;
    v3->_itemViews = (NSMutableArray *)v21;

    [(GestureInstructionView *)v3 _addInstructionWithImageName:@"legend-sketch" titleKey:@"GESTURE_TITLE_SKETCH" descriptionKey:@"GESTURE_INSTRUCTION_SKETCH" bundle:v6];
    [(GestureInstructionView *)v3 _addInstructionWithImageName:@"legend-tap" titleKey:@"GESTURE_TITLE_TAP" descriptionKey:@"GESTURE_INSTRUCTION_TAP" bundle:v6];
    [(GestureInstructionView *)v3 _addInstructionWithImageName:@"legend-anger" titleKey:@"GESTURE_TITLE_ANGER" descriptionKey:@"GESTURE_INSTRUCTION_ANGER" bundle:v6];
    [(GestureInstructionView *)v3 _addInstructionWithImageName:@"legend-kiss" titleKey:@"GESTURE_TITLE_KISS" descriptionKey:@"GESTURE_INSTRUCTION_KISS" bundle:v6];
    [(GestureInstructionView *)v3 _addInstructionWithImageName:@"legend-heartbeat" titleKey:@"GESTURE_TITLE_HEARTBEAT" descriptionKey:@"GESTURE_INSTRUCTION_HEARTBEAT" bundle:v6];
    [(GestureInstructionView *)v3 _addInstructionWithImageName:@"legend-heartbreak" titleKey:@"GESTURE_TITLE_HEARTBREAK" descriptionKey:@"GESTURE_INSTRUCTION_HEARTBREAK" bundle:v6];
    v23 = v3;
  }
  return v3;
}

- (void)_addInstructionWithImageName:(id)a3 titleKey:(id)a4 descriptionKey:(id)a5 bundle:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v15 = [v10 localizedStringForKey:a4 value:&stru_24D60 table:@"DigitalTouchBalloonProvider-Localizable"];
  v13 = [v10 localizedStringForKey:v11 value:&stru_24D60 table:@"DigitalTouchBalloonProvider-Localizable"];

  v14 = [[GestureInstructionItemView alloc] initWithImageName:v12 title:v15 description:v13];
  [(GestureInstructionItemView *)v14 setUserInteractionEnabled:0];
  [(GestureInstructionView *)self addSubview:v14];
  [(NSMutableArray *)self->_itemViews addObject:v14];
}

- (void)_updateUI
{
  [(GestureInstructionView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = +[UIApplication sharedApplication];
  v8 = [v7 preferredContentSizeCategory];
  if (_UIContentSizeCategoryIsAccessibilityContentSizeCategory()) {
    double v9 = 10.0;
  }
  else {
    double v9 = 0.0;
  }

  UIRoundToViewScale();
  double v11 = v10;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:");
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v9, 20.0, v11, v12);
  [(UILabel *)self->_titleLabel frame];
  double MaxY = CGRectGetMaxY(v30);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v14 = self->_itemViews;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_msgSend(v19, "sizeThatFits:", v4, v6, (void)v25);
        CGFloat v21 = v20;
        CGFloat v22 = MaxY + 20.0;
        CGFloat v24 = v23 + -v9 * 2.0;
        objc_msgSend(v19, "setFrame:", v9, v22, v24, v20);
        v31.origin.x = v9;
        v31.origin.y = v22;
        v31.size.width = v24;
        v31.size.height = v21;
        double MaxY = CGRectGetMaxY(v31);
      }
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  -[GestureInstructionView setContentSize:](self, "setContentSize:", v4, MaxY + 6.0);
}

- (void)layoutSubviews
{
  [(GestureInstructionView *)self _updateUI];
  [(GestureInstructionView *)self bounds];
  double v4 = v3;
  [(GestureInstructionView *)self contentSize];
  if (v4 - v5 <= 40.0)
  {
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }
  else
  {
    double top = (v4 - v5) * 0.5 + -20.0;
    double left = 0.0;
    double bottom = 0.0;
    double right = 0.0;
  }

  -[GestureInstructionView setContentInset:](self, "setContentInset:", top, left, bottom, right);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) == 0
     || ([v4 view],
         double v5 = (GestureInstructionView *)objc_claimAutoreleasedReturnValue(),
         v5,
         v5 == self))
    && ([(GestureInstructionView *)self bounds],
        double v7 = v6,
        [(GestureInstructionView *)self contentSize],
        v7 <= v8))
  {
    v11.receiver = self;
    v11.super_class = (Class)GestureInstructionView;
    BOOL v9 = [(GestureInstructionView *)&v11 gestureRecognizerShouldBegin:v4];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    BOOL v9 = [v6 view];
    if (v9 != self)
    {
      char v10 = 1;
      self = v9;
      goto LABEL_8;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v11 = [v7 view];
    char v10 = v11 != self;

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  char v10 = 0;
  if (isKindOfClass) {
LABEL_8:
  }

LABEL_9:
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemViews, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
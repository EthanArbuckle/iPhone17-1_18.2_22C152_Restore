@interface GKContactSkipControl
- (GKContactSkipControl)initWithFrame:(CGRect)a3;
- (NSArray)buttons;
- (NSArray)values;
- (NSMutableDictionary)buttonsToTitles;
- (NSString)lastSelectedValue;
- (UIView)buttonView;
- (UIView)centeringView;
- (id)compactPhoneValues:(int64_t)a3;
- (id)nextTitleFollowingValue:(id)a3;
- (int64_t)valueButtonCountThatFitsHeight:(double)a3;
- (void)awakeFromNib;
- (void)determineButtonFromGesture:(id)a3;
- (void)setButtonView:(id)a3;
- (void)setButtons:(id)a3;
- (void)setButtonsToTitles:(id)a3;
- (void)setCenteringView:(id)a3;
- (void)setLastSelectedValue:(id)a3;
- (void)setValues:(id)a3;
- (void)setupButtonView;
- (void)setupValueButtons;
- (void)valueSelected:(id)a3;
@end

@implementation GKContactSkipControl

- (GKContactSkipControl)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKContactSkipControl;
  v3 = -[GKContactSkipControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(GKContactSkipControl *)v3 setupButtonView];
  }
  return v4;
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)GKContactSkipControl;
  [(GKContactSkipControl *)&v3 awakeFromNib];
  [(GKContactSkipControl *)self setupButtonView];
}

- (void)setupButtonView
{
  if (!self->_buttonView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(GKContactSkipControl *)self bounds];
    v4 = objc_msgSend(v3, "initWithFrame:");
    [(GKContactSkipControl *)self setButtonView:v4];

    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)self->_buttonView setBackgroundColor:v5];

    [(UIView *)self->_buttonView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKContactSkipControl *)self addSubview:self->_buttonView];
    double v6 = *MEMORY[0x1E4FB2848];
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    v10 = objc_msgSend(MEMORY[0x1E4F28DC8], "_gkConstraintsForView:withinView:insets:", self->_buttonView, self, *MEMORY[0x1E4FB2848], v7, v8, v9);
    [(GKContactSkipControl *)self addConstraints:v10];

    id v11 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(UIView *)self->_buttonView bounds];
    v12 = objc_msgSend(v11, "initWithFrame:");
    [(GKContactSkipControl *)self setCenteringView:v12];

    [(UIView *)self->_centeringView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_buttonView addSubview:self->_centeringView];
    centeringView = self->_centeringView;
    v14 = [MEMORY[0x1E4F28DC8] constraintWithItem:centeringView attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:1.0];
    [(UIView *)centeringView addConstraint:v14];

    buttonView = self->_buttonView;
    v16 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_centeringView attribute:1 relatedBy:0 toItem:buttonView attribute:1 multiplier:1.0 constant:0.0];
    [(UIView *)buttonView addConstraint:v16];

    v17 = self->_buttonView;
    v18 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_centeringView attribute:10 relatedBy:0 toItem:v17 attribute:10 multiplier:1.0 constant:0.0];
    [(UIView *)v17 addConstraint:v18];

    [(UIView *)self->_centeringView setHidden:1];
    id v19 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(GKContactSkipControl *)self bounds];
    id v24 = (id)objc_msgSend(v19, "initWithFrame:");
    v20 = [MEMORY[0x1E4FB1618] clearColor];
    [v24 setBackgroundColor:v20];

    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_determineButtonFromGesture_];
    [v24 addGestureRecognizer:v21];

    v22 = (void *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel_determineButtonFromGesture_];
    [v24 addGestureRecognizer:v22];

    [(GKContactSkipControl *)self addSubview:v24];
    v23 = objc_msgSend(MEMORY[0x1E4F28DC8], "_gkConstraintsForView:withinView:insets:", v24, self, v6, v7, v8, v9);
    [(GKContactSkipControl *)self addConstraints:v23];
  }
}

- (void)setValues:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToArray:self->_values] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_values, a3);
    [(GKContactSkipControl *)self setupValueButtons];
  }
}

- (id)compactPhoneValues:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:20];
  double v6 = (double)[(NSArray *)self->_values count] + -1.0;
  if (v6 > 0.0)
  {
    double v7 = 0.0;
    do
    {
      double v8 = [(NSArray *)self->_values objectAtIndexedSubscript:llround(v7)];
      [v5 addObject:v8];

      [v5 addObject:@"•"];
      double v7 = v6 / (double)a3 + v7;
    }
    while (v7 < v6);
  }
  if ([v5 containsObject:@"#"])
  {
    double v9 = [v5 lastObject];
    int v10 = [v9 isEqualToString:@"•"];

    if (v10) {
      [v5 removeLastObject];
    }
  }
  else if ([(NSArray *)self->_values count])
  {
    id v11 = [(NSArray *)self->_values lastObject];
    [v5 addObject:v11];
  }
  v12 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];

  return v12;
}

- (id)nextTitleFollowingValue:(id)a3
{
  NSUInteger v4 = [(NSArray *)self->_values indexOfObject:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (NSUInteger v5 = v4 + 1, v4 + 1 >= [(NSArray *)self->_values count]))
  {
    double v6 = 0;
  }
  else
  {
    double v6 = [(NSArray *)self->_values objectAtIndexedSubscript:v5];
  }

  return v6;
}

- (int64_t)valueButtonCountThatFitsHeight:(double)a3
{
  NSUInteger v5 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  [(UIView *)self->_buttonView frame];
  objc_msgSend(v5, "setFrame:", v7, v9);
  int v10 = (void *)MEMORY[0x1E4FB08E0];
  [MEMORY[0x1E4FB08E0] smallSystemFontSize];
  id v11 = objc_msgSend(v10, "systemFontOfSize:");
  v12 = [v5 titleLabel];
  [v12 setFont:v11];

  v13 = [v5 titleLabel];
  [v13 setAdjustsFontSizeToFitWidth:1];

  v14 = [v5 titleLabel];
  [v14 setTextAlignment:1];

  [v5 setTitle:@"A" forState:0];
  objc_msgSend(v5, "setTitleEdgeInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  objc_msgSend(v5, "setContentEdgeInsets:", -1.0, 0.0, -1.0, 0.0);
  [v5 sizeToFit];
  [v5 bounds];
  int64_t v16 = (uint64_t)(a3 / v15);

  return v16;
}

- (void)setupValueButtons
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v3 = self->_buttons;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v57 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v56 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v5);
  }

  double v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSArray count](self->_values, "count"));
  [(GKContactSkipControl *)self setButtonsToTitles:v8];

  double v9 = self->_values;
  [(UIView *)self->_buttonView frame];
  uint64_t v11 = [(GKContactSkipControl *)self valueButtonCountThatFitsHeight:v10];
  if (v11 < [(NSArray *)self->_values count])
  {
    if (v11 >= 0) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = v11 + 1;
    }
    uint64_t v13 = [(GKContactSkipControl *)self compactPhoneValues:v12 >> 1];

    double v9 = (NSArray *)v13;
  }
  v49 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v9, "count"));
  v14 = [(NSArray *)self->_values objectAtIndexedSubscript:0];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  double v15 = v9;
  uint64_t v50 = [(NSArray *)v15 countByEnumeratingWithState:&v52 objects:v60 count:16];
  int64_t v16 = 0;
  if (!v50)
  {
    v46 = v15;
    goto LABEL_29;
  }
  uint64_t v48 = *(void *)v53;
  double v17 = *MEMORY[0x1E4FB2848];
  double v18 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  uint64_t v51 = 1;
  double v19 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v20 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  obj = v15;
  do
  {
    uint64_t v21 = 0;
    v22 = v16;
    do
    {
      if (*(void *)v53 != v48) {
        objc_enumerationMutation(obj);
      }
      v23 = *(void **)(*((void *)&v52 + 1) + 8 * v21);
      int64_t v16 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
      id v24 = (void *)MEMORY[0x1E4FB08E0];
      [MEMORY[0x1E4FB08E0] smallSystemFontSize];
      v25 = objc_msgSend(v24, "systemFontOfSize:");
      v26 = [(UIView *)v16 titleLabel];
      [v26 setFont:v25];

      v27 = [(UIView *)v16 titleLabel];
      [v27 setAdjustsFontSizeToFitWidth:1];

      v28 = [(UIView *)v16 titleLabel];
      [v28 setTextAlignment:1];

      v29 = [(GKContactSkipControl *)self tintColor];
      [(UIView *)v16 setTitleColor:v29 forState:0];

      [(UIView *)v16 setTitle:v23 forState:0];
      -[UIView setTitleEdgeInsets:](v16, "setTitleEdgeInsets:", v17, v18, v19, v20);
      -[UIView setContentEdgeInsets:](v16, "setContentEdgeInsets:", -1.0, 0.0, -1.0, 0.0);
      v30 = [MEMORY[0x1E4FB1618] clearColor];
      [(UIView *)v16 setBackgroundColor:v30];

      [(UIView *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v31 = v23;
      if ([v31 isEqualToString:@"•"])
      {
        id v32 = [(GKContactSkipControl *)self nextTitleFollowingValue:v14];
      }
      else
      {
        id v32 = v31;
        id v31 = v14;
        v14 = v32;
      }

      [(UIView *)v16 setTag:v51 + v21];
      buttonsToTitles = self->_buttonsToTitles;
      v34 = objc_msgSend(NSNumber, "numberWithInteger:", -[UIView tag](v16, "tag"));
      [(NSMutableDictionary *)buttonsToTitles setObject:v32 forKey:v34];

      [v49 addObject:v16];
      [(UIView *)self->_buttonView addSubview:v16];
      buttonView = self->_buttonView;
      v36 = [MEMORY[0x1E4F28DC8] constraintWithItem:v16 attribute:1 relatedBy:0 toItem:buttonView attribute:1 multiplier:1.0 constant:0.0];
      [(UIView *)buttonView addConstraint:v36];

      v37 = self->_buttonView;
      v38 = [MEMORY[0x1E4F28DC8] constraintWithItem:v16 attribute:2 relatedBy:0 toItem:v37 attribute:2 multiplier:1.0 constant:0.0];
      [(UIView *)v37 addConstraint:v38];

      v39 = self->_buttonView;
      if (v22)
      {
        double v40 = 1.0;
        v41 = v16;
        centeringView = v22;
        uint64_t v43 = 4;
      }
      else
      {
        centeringView = self->_centeringView;
        double v40 = 1.0;
        v41 = v16;
        uint64_t v43 = 3;
      }
      v44 = [MEMORY[0x1E4F28DC8] constraintWithItem:v41 attribute:3 relatedBy:0 toItem:centeringView attribute:v43 multiplier:v40 constant:0.0];
      [(UIView *)v39 addConstraint:v44];

      ++v21;
      v22 = v16;
    }
    while (v50 != v21);
    double v15 = obj;
    uint64_t v50 = [(NSArray *)obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    v51 += v21;
  }
  while (v50);

  if (v16)
  {
    v45 = self->_buttonView;
    v46 = [MEMORY[0x1E4F28DC8] constraintWithItem:v16 attribute:4 relatedBy:0 toItem:self->_centeringView attribute:4 multiplier:1.0 constant:0.0];
    [(UIView *)v45 addConstraint:v46];
LABEL_29:
  }
  [(GKContactSkipControl *)self setButtons:v49];
}

- (void)determineButtonFromGesture:(id)a3
{
  [a3 locationInView:self->_buttonView];
  -[UIView hitTest:withEvent:](self->_buttonView, "hitTest:withEvent:", 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(GKContactSkipControl *)self valueSelected:v4];
  }
}

- (void)valueSelected:(id)a3
{
  buttonsToTitles = self->_buttonsToTitles;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "tag"));
  id v7 = [(NSMutableDictionary *)buttonsToTitles objectForKey:v5];

  uint64_t v6 = [(GKContactSkipControl *)self lastSelectedValue];
  LOBYTE(v5) = [v6 isEqualToString:v7];

  if ((v5 & 1) == 0)
  {
    [(GKContactSkipControl *)self setLastSelectedValue:v7];
    [(GKContactSkipControl *)self sendActionsForControlEvents:4096];
  }
}

- (NSArray)values
{
  return self->_values;
}

- (NSString)lastSelectedValue
{
  return self->_lastSelectedValue;
}

- (void)setLastSelectedValue:(id)a3
{
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (UIView)buttonView
{
  return self->_buttonView;
}

- (void)setButtonView:(id)a3
{
}

- (UIView)centeringView
{
  return self->_centeringView;
}

- (void)setCenteringView:(id)a3
{
}

- (NSMutableDictionary)buttonsToTitles
{
  return self->_buttonsToTitles;
}

- (void)setButtonsToTitles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonsToTitles, 0);
  objc_storeStrong((id *)&self->_centeringView, 0);
  objc_storeStrong((id *)&self->_buttonView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_lastSelectedValue, 0);

  objc_storeStrong((id *)&self->_values, 0);
}

@end
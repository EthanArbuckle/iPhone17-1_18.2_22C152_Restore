@interface VOTUIBrailleView
- (BOOL)_isEightDotBraille;
- (BOOL)accessibilityIgnoresInvertColors;
- (NSArray)dotNumberPositions;
- (NSArray)typingModeConstraintsForInsertedTextLabel;
- (NSArray)xConstraintsForDotNumbers;
- (NSArray)yConstraintsForDotNumbers;
- (VOTUIBrailleView)initWithDotNumberPositions:(id)a3 typingMode:(int64_t)a4;
- (id)_circleViewForDotNumber:(unint64_t)a3;
- (id)_constraintsToCenterItem:(id)a3 withItem:(id)a4;
- (id)_dotCircleImageFilled:(BOOL)a3;
- (id)_generateAndStoreConstraintsForDotNumbers;
- (id)_generateAndStoreTypingModeConstraintsForInsertedTextLabel;
- (id)_highlightedCircleViewForDotNumber:(unint64_t)a3;
- (id)_xConstraintForDotNumber:(unint64_t)a3;
- (id)_yConstraintForDotNumber:(unint64_t)a3;
- (int64_t)typingMode;
- (unint64_t)_numberOfDots;
- (void)_addSubviews;
- (void)_updateConstantsForDotNumberConstraints;
- (void)_updateDotsSevenAndEightVisibility;
- (void)flashInsertedText:(id)a3;
- (void)highlightBrailleDots:(id)a3;
- (void)setDotNumberPositions:(id)a3 typingMode:(int64_t)a4;
- (void)setTypingModeConstraintsForInsertedTextLabel:(id)a3;
- (void)setXConstraintsForDotNumbers:(id)a3;
- (void)setYConstraintsForDotNumbers:(id)a3;
@end

@implementation VOTUIBrailleView

- (VOTUIBrailleView)initWithDotNumberPositions:(id)a3 typingMode:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VOTUIBrailleView;
  v8 = [(VOTUIBrailleView *)&v11 init];
  if (v8)
  {
    v9 = +[UIColor colorWithWhite:0.0 alpha:0.7];
    [(VOTUIBrailleView *)v8 setBackgroundColor:v9];

    v8->_typingMode = a4;
    objc_storeStrong((id *)&v8->_dotNumberPositions, a3);
    [(VOTUIBrailleView *)v8 _addSubviews];
  }

  return v8;
}

- (void)setDotNumberPositions:(id)a3 typingMode:(int64_t)a4
{
  v10 = (NSArray *)a3;
  if (self->_typingMode != a4)
  {
    id v7 = [(VOTUIBrailleView *)self typingModeConstraintsForInsertedTextLabel];

    if (v7)
    {
      v8 = [(VOTUIBrailleView *)self typingModeConstraintsForInsertedTextLabel];
      [(VOTUIBrailleView *)self removeConstraints:v8];
    }
  }
  if (self->_dotNumberPositions != v10)
  {
    objc_storeStrong((id *)&self->_dotNumberPositions, a3);
    [(VOTUIBrailleView *)self _updateConstantsForDotNumberConstraints];
    [(VOTUIBrailleView *)self _updateDotsSevenAndEightVisibility];
    [(VOTUIBrailleView *)self setNeedsLayout];
  }
  if (self->_typingMode != a4)
  {
    self->_typingMode = a4;
    v9 = [(VOTUIBrailleView *)self _generateAndStoreTypingModeConstraintsForInsertedTextLabel];
    [(VOTUIBrailleView *)self addConstraints:v9];
  }
}

- (void)flashInsertedText:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    [(UILabel *)self->_insertedTextLabel setText:v4];
    [(UILabel *)self->_insertedTextLabel setAlpha:1.0];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_ADF8;
    v5[3] = &unk_3D2B0;
    v5[4] = self;
    +[UIView animateWithDuration:v5 animations:1.0];
  }
}

- (void)highlightBrailleDots:(id)a3
{
  id v4 = a3;
  if ([(VOTUIBrailleView *)self _numberOfDots])
  {
    unint64_t v5 = 1;
    do
    {
      v6 = +[NSNumber numberWithUnsignedInteger:v5];
      unsigned int v7 = [v4 containsObject:v6];

      v8 = [(VOTUIBrailleView *)self _circleViewForDotNumber:v5];
      v9 = v8;
      if (v7)
      {
        [v8 setAlpha:0.0];

        v10 = [(VOTUIBrailleView *)self _highlightedCircleViewForDotNumber:v5];
        [v10 setAlpha:0.5];
      }
      else
      {
        [v8 alpha];
        double v12 = v11;

        if (v12 != 0.5)
        {
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_AF90;
          v13[3] = &unk_3D300;
          v13[4] = self;
          v13[5] = v5;
          +[UIView animateWithDuration:v13 animations:0.3];
        }
      }
      ++v5;
    }
    while (v5 <= [(VOTUIBrailleView *)self _numberOfDots]);
  }
}

- (unint64_t)_numberOfDots
{
  v2 = [(VOTUIBrailleView *)self dotNumberPositions];
  v3 = (int *)[v2 count];

  if (v3 != (int *)((char *)&dword_4 + 2) && v3 != &dword_8)
  {
    _AXAssert();
    if ((unint64_t)v3 >= 9) {
      _AXAssert();
    }
  }
  return (unint64_t)v3;
}

- (BOOL)_isEightDotBraille
{
  return (int *)[(VOTUIBrailleView *)self _numberOfDots] == &dword_8;
}

- (id)_circleViewForDotNumber:(unint64_t)a3
{
  return [(NSMutableArray *)self->_dotNumberCircleViews objectAtIndexedSubscript:a3 - 1];
}

- (id)_highlightedCircleViewForDotNumber:(unint64_t)a3
{
  return [(NSMutableArray *)self->_dotNumberHighlightedCircleViews objectAtIndexedSubscript:a3 - 1];
}

- (id)_dotCircleImageFilled:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_4BEA0 != -1) {
    dispatch_once(&qword_4BEA0, &stru_3D340);
  }
  id v4 = &qword_4BE98;
  if (!v3) {
    id v4 = &qword_4BE90;
  }
  unint64_t v5 = (void *)*v4;

  return v5;
}

- (void)_addSubviews
{
  BOOL v3 = +[NSMutableArray array];
  unint64_t v4 = [(VOTUIBrailleView *)self _numberOfDots];
  unint64_t v5 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v4];
  dotNumberCircleViews = self->_dotNumberCircleViews;
  self->_dotNumberCircleViews = v5;

  unsigned int v7 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v4];
  dotNumberHighlightedCircleViews = self->_dotNumberHighlightedCircleViews;
  self->_dotNumberHighlightedCircleViews = v7;

  v9 = +[NSMutableArray array];
  viewsForEightDotBrailleOnly = self->_viewsForEightDotBrailleOnly;
  self->_viewsForEightDotBrailleOnly = v9;

  uint64_t v11 = 1;
  do
  {
    id v12 = objc_alloc((Class)UIImageView);
    v13 = [(VOTUIBrailleView *)self _dotCircleImageFilled:0];
    id v14 = [v12 initWithImage:v13];

    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v15 = objc_alloc((Class)UIImageView);
    v16 = [(VOTUIBrailleView *)self _dotCircleImageFilled:1];
    id v17 = [v15 initWithImage:v16];

    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v14 setAlpha:0.5];
    [v17 setAlpha:0.0];
    id v18 = objc_alloc_init((Class)UILabel);
    v19 = +[NSNumber numberWithUnsignedInteger:v11];
    v20 = AXFormatNumber();
    [v18 setText:v20];

    v21 = +[UIFont _thinSystemFontOfSize:60.0];
    [v18 setFont:v21];

    v22 = +[UIColor whiteColor];
    [v18 setTextColor:v22];

    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(VOTUIBrailleView *)self addSubview:v14];
    [(VOTUIBrailleView *)self addSubview:v17];
    [(VOTUIBrailleView *)self addSubview:v18];
    v23 = [(VOTUIBrailleView *)self _constraintsToCenterItem:v14 withItem:v17];
    [v3 addObjectsFromArray:v23];

    v24 = [(VOTUIBrailleView *)self _constraintsToCenterItem:v18 withItem:v14];
    [v3 addObjectsFromArray:v24];

    [(NSMutableArray *)self->_dotNumberCircleViews addObject:v14];
    [(NSMutableArray *)self->_dotNumberHighlightedCircleViews addObject:v17];
    uint64_t v25 = v11 - 7;
    if ((unint64_t)(v11 - 7) <= 1)
    {
      v26 = self->_viewsForEightDotBrailleOnly;
      v37[0] = v18;
      v37[1] = v14;
      v37[2] = v17;
      v27 = +[NSArray arrayWithObjects:v37 count:3];
      [(NSMutableArray *)v26 addObjectsFromArray:v27];
    }
    uint64_t v11 = v25 + 8;
  }
  while (v25 != 1);
  v28 = [(VOTUIBrailleView *)self xConstraintsForDotNumbers];
  if (v28)
  {

LABEL_8:
    _AXAssert();
    goto LABEL_9;
  }
  v29 = [(VOTUIBrailleView *)self yConstraintsForDotNumbers];

  if (v29) {
    goto LABEL_8;
  }
LABEL_9:
  v30 = [(VOTUIBrailleView *)self _generateAndStoreConstraintsForDotNumbers];
  [v3 addObjectsFromArray:v30];

  v31 = (UILabel *)objc_alloc_init((Class)UILabel);
  insertedTextLabel = self->_insertedTextLabel;
  self->_insertedTextLabel = v31;

  v33 = +[UIFont _thinSystemFontOfSize:100.0];
  [(UILabel *)self->_insertedTextLabel setFont:v33];

  [(UILabel *)self->_insertedTextLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_insertedTextLabel setTextAlignment:1];
  v34 = +[UIColor whiteColor];
  [(UILabel *)self->_insertedTextLabel setTextColor:v34];

  [(UILabel *)self->_insertedTextLabel setAlpha:0.0];
  [(UILabel *)self->_insertedTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VOTUIBrailleView *)self addSubview:self->_insertedTextLabel];
  v35 = +[NSLayoutConstraint constraintWithItem:self->_insertedTextLabel attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
  [v3 addObject:v35];

  v36 = [(VOTUIBrailleView *)self _generateAndStoreTypingModeConstraintsForInsertedTextLabel];
  [v3 addObjectsFromArray:v36];

  [(VOTUIBrailleView *)self addConstraints:v3];
  [(VOTUIBrailleView *)self _updateDotsSevenAndEightVisibility];
}

- (void)_updateDotsSevenAndEightVisibility
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = self->_viewsForEightDotBrailleOnly;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      unsigned int v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "setHidden:", -[VOTUIBrailleView _isEightDotBraille](self, "_isEightDotBraille", (void)v8) ^ 1);
        unsigned int v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)_xConstraintForDotNumber:(unint64_t)a3
{
  id v4 = [(VOTUIBrailleView *)self xConstraintsForDotNumbers];
  id v5 = [v4 objectAtIndexedSubscript:a3 - 1];

  return v5;
}

- (id)_yConstraintForDotNumber:(unint64_t)a3
{
  id v4 = [(VOTUIBrailleView *)self yConstraintsForDotNumbers];
  id v5 = [v4 objectAtIndexedSubscript:a3 - 1];

  return v5;
}

- (id)_constraintsToCenterItem:(id)a3 withItem:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned int v7 = +[NSLayoutConstraint constraintWithItem:v6 attribute:9 relatedBy:0 toItem:v5 attribute:9 multiplier:1.0 constant:0.0];
  v11[0] = v7;
  long long v8 = +[NSLayoutConstraint constraintWithItem:v6 attribute:10 relatedBy:0 toItem:v5 attribute:10 multiplier:1.0 constant:0.0];

  v11[1] = v8;
  long long v9 = +[NSArray arrayWithObjects:v11 count:2];

  return v9;
}

- (id)_generateAndStoreTypingModeConstraintsForInsertedTextLabel
{
  BOOL v3 = +[NSMutableArray array];
  int64_t v4 = [(VOTUIBrailleView *)self typingMode];
  if (v4 == 1)
  {
    if ([(VOTUIBrailleView *)self _isEightDotBraille]) {
      uint64_t v12 = 7;
    }
    else {
      uint64_t v12 = 3;
    }
    if ([(VOTUIBrailleView *)self _isEightDotBraille]) {
      uint64_t v13 = 8;
    }
    else {
      uint64_t v13 = 6;
    }
    insertedTextLabel = self->_insertedTextLabel;
    id v15 = [(VOTUIBrailleView *)self _circleViewForDotNumber:v12];
    v16 = +[NSLayoutConstraint constraintWithItem:insertedTextLabel attribute:1 relatedBy:1 toItem:v15 attribute:2 multiplier:1.0 constant:10.0];
    [v3 addObject:v16];

    id v17 = self->_insertedTextLabel;
    id v18 = [(VOTUIBrailleView *)self _circleViewForDotNumber:v13];
    v19 = +[NSLayoutConstraint constraintWithItem:v17 attribute:2 relatedBy:-1 toItem:v18 attribute:1 multiplier:1.0 constant:-10.0];
    [v3 addObject:v19];

    v20 = self->_insertedTextLabel;
    long long v11 = [(VOTUIBrailleView *)self _circleViewForDotNumber:v12];
    v21 = +[NSLayoutConstraint constraintWithItem:v20 attribute:10 relatedBy:0 toItem:v11 attribute:10 multiplier:1.0 constant:0.0];
    [v3 addObject:v21];

    goto LABEL_11;
  }
  if (!v4)
  {
    id v5 = self->_insertedTextLabel;
    id v6 = [(VOTUIBrailleView *)self _circleViewForDotNumber:4];
    unsigned int v7 = +[NSLayoutConstraint constraintWithItem:v5 attribute:1 relatedBy:1 toItem:v6 attribute:2 multiplier:1.0 constant:10.0];
    [v3 addObject:v7];

    long long v8 = self->_insertedTextLabel;
    long long v9 = [(VOTUIBrailleView *)self _circleViewForDotNumber:1];
    long long v10 = +[NSLayoutConstraint constraintWithItem:v8 attribute:2 relatedBy:-1 toItem:v9 attribute:1 multiplier:1.0 constant:-10.0];
    [v3 addObject:v10];

    long long v11 = +[NSLayoutConstraint constraintWithItem:self->_insertedTextLabel attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
    [v3 addObject:v11];
LABEL_11:

    goto LABEL_13;
  }
  int64_t v23 = [(VOTUIBrailleView *)self typingMode];
  _AXAssert();
LABEL_13:
  -[VOTUIBrailleView setTypingModeConstraintsForInsertedTextLabel:](self, "setTypingModeConstraintsForInsertedTextLabel:", v3, v23);

  return v3;
}

- (id)_generateAndStoreConstraintsForDotNumbers
{
  BOOL v3 = +[NSMutableArray array];
  int64_t v4 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = [(VOTUIBrailleView *)self dotNumberPositions];
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v6)
  {

    for (unint64_t i = 1; i != 9; ++i)
    {
LABEL_11:
      id v18 = [(VOTUIBrailleView *)self _circleViewForDotNumber:i];
      v19 = +[NSLayoutConstraint constraintWithItem:v18 attribute:9 relatedBy:0 toItem:self attribute:1 multiplier:1.0 constant:0.0];
      [v3 addObject:v19];

      v20 = +[NSLayoutConstraint constraintWithItem:v18 attribute:10 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:0.0];
      [v4 addObject:v20];
    }
    goto LABEL_12;
  }
  id v7 = v6;
  id obj = v5;
  uint64_t v8 = *(void *)v25;
  unint64_t i = 1;
  do
  {
    for (j = 0; j != v7; j = (char *)j + 1)
    {
      if (*(void *)v25 != v8) {
        objc_enumerationMutation(obj);
      }
      [*(id *)(*((void *)&v24 + 1) + 8 * (void)j) CGPointValue];
      double v12 = v11;
      double v14 = v13;
      id v15 = [(VOTUIBrailleView *)self _circleViewForDotNumber:(char *)j + i];
      v16 = +[NSLayoutConstraint constraintWithItem:v15 attribute:9 relatedBy:0 toItem:self attribute:1 multiplier:1.0 constant:v12];
      [v3 addObject:v16];

      id v17 = +[NSLayoutConstraint constraintWithItem:v15 attribute:10 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v14];
      [v4 addObject:v17];
    }
    id v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    i += (unint64_t)j;
  }
  while (v7);

  if (i <= 8) {
    goto LABEL_11;
  }
LABEL_12:
  [(VOTUIBrailleView *)self setXConstraintsForDotNumbers:v3];
  [(VOTUIBrailleView *)self setYConstraintsForDotNumbers:v4];
  v21 = [v3 arrayByAddingObjectsFromArray:v4];

  return v21;
}

- (void)_updateConstantsForDotNumberConstraints
{
  BOOL v3 = [(VOTUIBrailleView *)self xConstraintsForDotNumbers];
  id v4 = [v3 count];
  id v5 = [(VOTUIBrailleView *)self dotNumberPositions];
  if (v4 < [v5 count])
  {

LABEL_4:
    id v26 = [(VOTUIBrailleView *)self xConstraintsForDotNumbers];
    [v26 count];
    long long v10 = [(VOTUIBrailleView *)self yConstraintsForDotNumbers];
    [v10 count];
    double v11 = [(VOTUIBrailleView *)self dotNumberPositions];
    [v11 count];
    _AXAssert();

    return;
  }
  id v6 = [(VOTUIBrailleView *)self yConstraintsForDotNumbers];
  id v7 = [v6 count];
  uint64_t v8 = [(VOTUIBrailleView *)self dotNumberPositions];
  id v9 = [v8 count];

  if (v7 < v9) {
    goto LABEL_4;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  double v12 = [(VOTUIBrailleView *)self dotNumberPositions];
  id v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (unint64_t i = 0; i != v14; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * i) CGPointValue];
        double v19 = v18;
        double v21 = v20;
        v22 = [(VOTUIBrailleView *)self xConstraintsForDotNumbers];
        int64_t v23 = [v22 objectAtIndexedSubscript:(char *)i + v15];

        [v23 setConstant:v19];
        long long v24 = [(VOTUIBrailleView *)self yConstraintsForDotNumbers];
        long long v25 = [v24 objectAtIndexedSubscript:(char *)i + v15];

        [v25 setConstant:v21];
      }
      id v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      v15 += (uint64_t)i;
    }
    while (v14);
  }
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (NSArray)dotNumberPositions
{
  return self->_dotNumberPositions;
}

- (int64_t)typingMode
{
  return self->_typingMode;
}

- (NSArray)xConstraintsForDotNumbers
{
  return self->_xConstraintsForDotNumbers;
}

- (void)setXConstraintsForDotNumbers:(id)a3
{
}

- (NSArray)yConstraintsForDotNumbers
{
  return self->_yConstraintsForDotNumbers;
}

- (void)setYConstraintsForDotNumbers:(id)a3
{
}

- (NSArray)typingModeConstraintsForInsertedTextLabel
{
  return self->_typingModeConstraintsForInsertedTextLabel;
}

- (void)setTypingModeConstraintsForInsertedTextLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingModeConstraintsForInsertedTextLabel, 0);
  objc_storeStrong((id *)&self->_yConstraintsForDotNumbers, 0);
  objc_storeStrong((id *)&self->_xConstraintsForDotNumbers, 0);
  objc_storeStrong((id *)&self->_dotNumberPositions, 0);
  objc_storeStrong((id *)&self->_insertedTextLabel, 0);
  objc_storeStrong((id *)&self->_viewsForEightDotBrailleOnly, 0);
  objc_storeStrong((id *)&self->_dotNumberHighlightedCircleViews, 0);

  objc_storeStrong((id *)&self->_dotNumberCircleViews, 0);
}

@end
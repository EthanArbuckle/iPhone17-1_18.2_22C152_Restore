@interface DOCHorizontalTagDotPicker
- (CGSize)intrinsicContentSize;
- (DOCHorizontalTagDotPicker)initWithFrame:(CGRect)a3;
- (NSArray)dotViews;
- (NSNumber)previousSelectedTagColor;
- (UIGestureRecognizer)changeColorPanGestureRecognizer;
- (UIGestureRecognizer)changeColorTapGestureRecognizer;
- (UIStackView)stackView;
- (id)selectedTagDotView;
- (int64_t)selectedTagColor;
- (void)handleChangeColor:(id)a3;
- (void)setPreviousSelectedTagColor:(id)a3;
- (void)setSelectedTagColor:(int64_t)a3;
- (void)setSelectedTagColorForLocation:(CGPoint)a3;
- (void)setStackView:(id)a3;
@end

@implementation DOCHorizontalTagDotPicker

- (CGSize)intrinsicContentSize
{
  v2 = +[DOCTagAppearance makerUI];
  [v2 rowOfTagsDotSize];
  double v4 = v3;
  [v2 rowOfTagsContentInsets];
  double v6 = v4 + v5;
  [v2 rowOfTagsContentInsets];
  double v8 = v6 + v7;

  double v9 = 500.0;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (DOCHorizontalTagDotPicker)initWithFrame:(CGRect)a3
{
  v55[8] = *MEMORY[0x263EF8340];
  v53.receiver = self;
  v53.super_class = (Class)DOCHorizontalTagDotPicker;
  double v3 = -[DOCHorizontalTagDotPicker initWithFrame:](&v53, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    v3->_selectedTagColor = -1;
    double v5 = dotViewForColor(0, 1);
    v55[0] = v5;
    double v6 = dotViewForColor(6, 0);
    v55[1] = v6;
    double v7 = dotViewForColor(7, 0);
    v55[2] = v7;
    double v8 = dotViewForColor(5, 0);
    v55[3] = v8;
    double v9 = dotViewForColor(2, 0);
    v55[4] = v9;
    double v10 = dotViewForColor(4, 0);
    v55[5] = v10;
    v11 = dotViewForColor(3, 0);
    v55[6] = v11;
    v12 = dotViewForColor(1, 0);
    v55[7] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:8];
    dotViews = v4->_dotViews;
    v4->_dotViews = (NSArray *)v13;

    v15 = (UIGestureRecognizer *)[objc_alloc(MEMORY[0x263F82A00]) initWithTarget:v4 action:sel_handleChangeColor_];
    [(UIGestureRecognizer *)v15 setMinimumNumberOfTouches:1];
    [(UIGestureRecognizer *)v15 setMaximumNumberOfTouches:1];
    [(UIGestureRecognizer *)v15 _setCanPanVertically:0];
    [(UIGestureRecognizer *)v15 _setHysteresis:0.0];
    changeColorPanGestureRecognizer = v4->_changeColorPanGestureRecognizer;
    v4->_changeColorPanGestureRecognizer = v15;
    v52 = v15;

    v17 = (UIGestureRecognizer *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:v4 action:sel_handleChangeColor_];
    [(UIGestureRecognizer *)v17 setMinimumPressDuration:0.0];
    changeColorTapGestureRecognizer = v4->_changeColorTapGestureRecognizer;
    v4->_changeColorTapGestureRecognizer = v17;
    v51 = v17;

    v19 = (UIStackView *)objc_alloc_init(MEMORY[0x263F82BF8]);
    stackView = v4->_stackView;
    v4->_stackView = v19;

    [(UIStackView *)v4->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_stackView setAxis:0];
    [(UIStackView *)v4->_stackView doc_addFlexiblySpacedArrangedSubviews:v4->_dotViews minSpacing:1.0 maxSpacing:35.0];
    [(DOCHorizontalTagDotPicker *)v4 setSelectedTagColor:0];
    v21 = [(DOCHorizontalTagDotPicker *)v4 stackView];
    [(DOCHorizontalTagDotPicker *)v4 addSubview:v21];

    v22 = [(DOCHorizontalTagDotPicker *)v4 changeColorTapGestureRecognizer];
    [(DOCHorizontalTagDotPicker *)v4 addGestureRecognizer:v22];

    v23 = [(DOCHorizontalTagDotPicker *)v4 changeColorPanGestureRecognizer];
    [(DOCHorizontalTagDotPicker *)v4 addGestureRecognizer:v23];

    v24 = [(DOCHorizontalTagDotPicker *)v4 changeColorPanGestureRecognizer];
    v25 = [(DOCHorizontalTagDotPicker *)v4 changeColorTapGestureRecognizer];
    [v24 requireGestureRecognizerToFail:v25];

    v39 = (void *)MEMORY[0x263F08938];
    v50 = [(DOCHorizontalTagDotPicker *)v4 stackView];
    v48 = [v50 leadingAnchor];
    v49 = [(DOCHorizontalTagDotPicker *)v4 layoutMarginsGuide];
    v47 = [v49 leadingAnchor];
    v46 = [v48 constraintGreaterThanOrEqualToAnchor:v47];
    v54[0] = v46;
    v45 = [(DOCHorizontalTagDotPicker *)v4 stackView];
    v43 = [v45 trailingAnchor];
    v44 = [(DOCHorizontalTagDotPicker *)v4 layoutMarginsGuide];
    v42 = [v44 trailingAnchor];
    v41 = [v43 constraintLessThanOrEqualToAnchor:v42];
    v54[1] = v41;
    v40 = [(DOCHorizontalTagDotPicker *)v4 stackView];
    v38 = [v40 centerXAnchor];
    v37 = [(DOCHorizontalTagDotPicker *)v4 centerXAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v54[2] = v36;
    v26 = [(DOCHorizontalTagDotPicker *)v4 stackView];
    v27 = [v26 topAnchor];
    v28 = [(DOCHorizontalTagDotPicker *)v4 topAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    v54[3] = v29;
    v30 = [(DOCHorizontalTagDotPicker *)v4 stackView];
    v31 = [v30 bottomAnchor];
    v32 = [(DOCHorizontalTagDotPicker *)v4 bottomAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    v54[4] = v33;
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:5];
    [v39 activateConstraints:v34];
  }
  return v4;
}

- (void)setSelectedTagColor:(int64_t)a3
{
  if (self->_selectedTagColor != a3)
  {
    double v5 = [(DOCHorizontalTagDotPicker *)self selectedTagDotView];
    [v5 setChecked:0];

    self->_selectedTagColor = a3;
    id v6 = [(DOCHorizontalTagDotPicker *)self selectedTagDotView];
    [v6 setChecked:1];
  }
}

- (id)selectedTagDotView
{
  switch([(DOCHorizontalTagDotPicker *)self selectedTagColor])
  {
    case 0:
      double v3 = [(DOCHorizontalTagDotPicker *)self dotViews];
      double v4 = v3;
      uint64_t v5 = 0;
      goto LABEL_11;
    case 1:
      double v3 = [(DOCHorizontalTagDotPicker *)self dotViews];
      double v4 = v3;
      uint64_t v5 = 7;
      goto LABEL_11;
    case 2:
      double v3 = [(DOCHorizontalTagDotPicker *)self dotViews];
      double v4 = v3;
      uint64_t v5 = 4;
      goto LABEL_11;
    case 3:
      double v3 = [(DOCHorizontalTagDotPicker *)self dotViews];
      double v4 = v3;
      uint64_t v5 = 6;
      goto LABEL_11;
    case 4:
      double v3 = [(DOCHorizontalTagDotPicker *)self dotViews];
      double v4 = v3;
      uint64_t v5 = 5;
      goto LABEL_11;
    case 5:
      double v3 = [(DOCHorizontalTagDotPicker *)self dotViews];
      double v4 = v3;
      uint64_t v5 = 3;
      goto LABEL_11;
    case 6:
      double v3 = [(DOCHorizontalTagDotPicker *)self dotViews];
      double v4 = v3;
      uint64_t v5 = 1;
      goto LABEL_11;
    case 7:
      double v3 = [(DOCHorizontalTagDotPicker *)self dotViews];
      double v4 = v3;
      uint64_t v5 = 2;
LABEL_11:
      id v6 = [v3 objectAtIndexedSubscript:v5];

      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

- (void)handleChangeColor:(id)a3
{
  id v8 = a3;
  switch([v8 state])
  {
    case 1:
      double v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[DOCHorizontalTagDotPicker selectedTagColor](self, "selectedTagColor"));
      [(DOCHorizontalTagDotPicker *)self setPreviousSelectedTagColor:v4];

      goto LABEL_3;
    case 2:
LABEL_3:
      uint64_t v5 = [(DOCHorizontalTagDotPicker *)self stackView];
      [v8 locationInView:v5];
      -[DOCHorizontalTagDotPicker setSelectedTagColorForLocation:](self, "setSelectedTagColorForLocation:");

      goto LABEL_7;
    case 3:
      goto LABEL_6;
    case 4:
      id v6 = [(DOCHorizontalTagDotPicker *)self previousSelectedTagColor];

      if (!v6) {
        goto LABEL_7;
      }
      double v7 = [(DOCHorizontalTagDotPicker *)self previousSelectedTagColor];
      -[DOCHorizontalTagDotPicker setSelectedTagColor:](self, "setSelectedTagColor:", [v7 integerValue]);

LABEL_6:
      [(DOCHorizontalTagDotPicker *)self setPreviousSelectedTagColor:0];
LABEL_7:

      return;
    default:
      goto LABEL_7;
  }
}

- (void)setSelectedTagColorForLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(DOCHorizontalTagDotPicker *)self dotViews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v11 frame];
        v18.CGFloat x = x;
        v18.CGFloat y = y;
        if (CGRectContainsPoint(v19, v18))
        {
          -[DOCHorizontalTagDotPicker setSelectedTagColor:](self, "setSelectedTagColor:", [v11 tagColor]);
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (int64_t)selectedTagColor
{
  return self->_selectedTagColor;
}

- (UIGestureRecognizer)changeColorTapGestureRecognizer
{
  return self->_changeColorTapGestureRecognizer;
}

- (UIGestureRecognizer)changeColorPanGestureRecognizer
{
  return self->_changeColorPanGestureRecognizer;
}

- (NSArray)dotViews
{
  return self->_dotViews;
}

- (NSNumber)previousSelectedTagColor
{
  return self->_previousSelectedTagColor;
}

- (void)setPreviousSelectedTagColor:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_previousSelectedTagColor, 0);
  objc_storeStrong((id *)&self->_dotViews, 0);
  objc_storeStrong((id *)&self->_changeColorPanGestureRecognizer, 0);

  objc_storeStrong((id *)&self->_changeColorTapGestureRecognizer, 0);
}

@end
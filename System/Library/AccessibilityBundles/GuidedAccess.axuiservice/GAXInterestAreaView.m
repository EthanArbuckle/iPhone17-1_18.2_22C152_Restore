@interface GAXInterestAreaView
- (BOOL)_shouldDisableSmartLayoutRelativeToEdgesForInterestAreaPathAtIndex:(unint64_t)a3;
- (BOOL)areSpecialControlsVisible;
- (BOOL)backgroundShouldCoverEverything;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (CGPoint)buttonBeingDraggedInitialCenter;
- (CGPoint)centerForBackgroundOfInterestAreaClippedView:(id)a3;
- (CGRect)_constrainedFrameForInsetFrame:(CGRect)a3 forInterestAreaPathAtIndex:(unint64_t)a4;
- (CGRect)accessibilityFrame;
- (CGRect)contentsBounds;
- (CGRect)savedFrame;
- (GAXInterestAreaClippedView)backgroundViewCoveringEverything;
- (GAXInterestAreaFingerPathView)fingerPathView;
- (GAXInterestAreaViewButton)buttonBeingDragged;
- (GAXInterestAreaViewDataSource)dataSource;
- (GAXInterestAreaViewDelegate)delegate;
- (GAXStyleProvider)styleProvider;
- (NSMutableArray)clippedViews;
- (NSMutableArray)closeButtons;
- (NSMutableArray)resizingKnobButtons;
- (UIColor)backgroundStripesPatternColor;
- (UIView)backgroundContainerView;
- (UIView)contentsView;
- (double)_scaleFactorForSpecialControls;
- (double)backgroundPatternScaleFactor;
- (double)contentsCornerRadius;
- (id)_interestAreaPathAtIndex:(unint64_t)a3;
- (id)_specialControlButtonAtLocation:(CGPoint)a3;
- (id)_specialControlButtonAtLocation:(CGPoint)a3 passingTest:(id)a4;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)interestAreaFingerPathView:(id)a3 interestAreaPathAtIndex:(unint64_t)a4;
- (int)backgroundStyle;
- (int64_t)accessibilityContainerType;
- (unint64_t)_numberOfInterestAreaPaths;
- (unint64_t)accessibilityTraits;
- (unint64_t)indexOfInterestAreaPathBeingDragged;
- (unint64_t)numberOfInterestAreaPathsForInterestAreaFingerPathView:(id)a3;
- (void)_commonInit;
- (void)_ensureBackgroundSizeOfBackgroundViewCoveringEverythingIsSet;
- (void)_enumerateInterestAreaPathsUsingBlock:(id)a3;
- (void)_enumerateInterestAreaPathsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)_enumerateSpecialControlPropertiesForInterestAreaPath:(id)a3 visibleKnobPositions:(unint64_t)a4 hasCloseButton:(BOOL)a5 usingBlock:(id)a6;
- (void)_enumerateSpecialControlsUsingBlock:(id)a3;
- (void)_getClippedViewPropertiesForInterestAreaPathAtIndex:(unint64_t)a3 frame:(CGRect *)a4 constrainedFrame:(CGRect *)a5 adjustedClippingPath:(id *)a6;
- (void)_handlePan:(id)a3;
- (void)_handleTap:(id)a3;
- (void)_insertClippedViewForInterestAreaPathAtIndex:(unint64_t)a3;
- (void)_refreshBackgroundStripesPatternColor;
- (void)_resetAllSpecialControls;
- (void)adjustOutOfBoundsDrawingToCoverView:(id)a3 edgeInsets:(UIEdgeInsets)a4;
- (void)dealloc;
- (void)deleteDynamicInterestAreaPathAtIndices:(id)a3;
- (void)deleteInterestAreaPathsAtIndices:(id)a3;
- (void)didMoveToWindow;
- (void)insertDynamicInterestAreaPathAtIndex:(unint64_t)a3;
- (void)insertInterestAreaPathAtIndex:(unint64_t)a3;
- (void)layoutSubviews;
- (void)reloadAllInterestAreaPaths;
- (void)reloadDynamicInterestAreaPathAtIndex:(unint64_t)a3;
- (void)reloadFrameOfInterestAreaPathAtIndex:(unint64_t)a3;
- (void)reloadInterestAreaPathAtIndex:(unint64_t)a3;
- (void)setBackgroundContainerView:(id)a3;
- (void)setBackgroundPatternScaleFactor:(double)a3;
- (void)setBackgroundShouldCoverEverything:(BOOL)a3;
- (void)setBackgroundShouldCoverEverything:(BOOL)a3 animated:(BOOL)a4;
- (void)setBackgroundStripesPatternColor:(id)a3;
- (void)setBackgroundStyle:(int)a3;
- (void)setBackgroundStyle:(int)a3 animated:(BOOL)a4;
- (void)setBackgroundViewCoveringEverything:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setButtonBeingDragged:(id)a3;
- (void)setButtonBeingDraggedInitialCenter:(CGPoint)a3;
- (void)setClippedViews:(id)a3;
- (void)setCloseButtons:(id)a3;
- (void)setContentsBounds:(CGRect)a3;
- (void)setContentsCornerRadius:(double)a3;
- (void)setContentsView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFingerPathView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIndexOfInterestAreaPathBeingDragged:(unint64_t)a3;
- (void)setResizingKnobButtons:(id)a3;
- (void)setSavedFrame:(CGRect)a3;
- (void)setSpecialControlsVisible:(BOOL)a3;
- (void)setSpecialControlsVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setStyleProvider:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation GAXInterestAreaView

- (void)_commonInit
{
  v22.receiver = self;
  v22.super_class = (Class)GAXInterestAreaView;
  [(GAXEventStealerView *)&v22 _commonInit];
  [(GAXInterestAreaView *)self setUserInteractionEnabled:1];
  [(GAXInterestAreaView *)self setMultipleTouchEnabled:0];
  [(GAXEventStealerView *)self setShouldStealAllEvents:0];
  [(GAXInterestAreaView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v3, v5, v7, v9);
  v12 = [v11 layer];
  [v12 setMasksToBounds:1];

  id v13 = objc_alloc((Class)UIView);
  [v11 bounds];
  id v14 = objc_msgSend(v13, "initWithFrame:");
  [v14 setAutoresizingMask:18];
  v15 = [v14 layer];
  [v15 setAllowsGroupOpacity:1];

  [v11 addSubview:v14];
  [(GAXInterestAreaView *)self setBackgroundContainerView:v14];
  [(GAXInterestAreaView *)self addSubview:v11];
  [(GAXInterestAreaView *)self setContentsView:v11];
  v16 = -[GAXInterestAreaFingerPathView initWithFrame:]([GAXInterestAreaFingerPathView alloc], "initWithFrame:", v4, v6, v8, v10);
  [(GAXInterestAreaFingerPathView *)v16 setAutoresizingMask:18];
  [(GAXInterestAreaFingerPathView *)v16 setDataSource:self];
  [(GAXInterestAreaFingerPathView *)v16 setHidden:1];
  [(GAXInterestAreaView *)self addSubview:v16];
  [(GAXInterestAreaView *)self setFingerPathView:v16];
  id v17 = [objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"_handlePan:"];
  [v17 setDelegate:self];
  [v17 setDelaysTouchesBegan:1];
  [(GAXInterestAreaView *)self addGestureRecognizer:v17];
  id v18 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleTap:"];
  [v18 setDelegate:self];
  [v18 setDelaysTouchesBegan:1];
  [(GAXInterestAreaView *)self addGestureRecognizer:v18];
  v19 = objc_opt_new();
  [(GAXInterestAreaView *)self setCloseButtons:v19];
  v20 = objc_opt_new();
  [(GAXInterestAreaView *)self setResizingKnobButtons:v20];
  v21 = [(GAXInterestAreaView *)self backgroundContainerView];
  [v21 setAlpha:0.0];

  [(GAXInterestAreaView *)self setIndexOfInterestAreaPathBeingDragged:0x7FFFFFFFFFFFFFFFLL];
  [(GAXInterestAreaView *)self setBackgroundPatternScaleFactor:1.0];
}

- (void)dealloc
{
  double v3 = [(GAXInterestAreaView *)self fingerPathView];
  [v3 setDataSource:0];

  double v4 = [(GAXInterestAreaView *)self clippedViews];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * i) setDelegate:0];
      }
      id v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }
  double v9 = [(GAXInterestAreaView *)self backgroundViewCoveringEverything];
  [v9 setDelegate:0];

  double v10 = [(GAXInterestAreaView *)self gestureRecognizers];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v17 + 1) + 8 * (void)j);
        [v15 setDelegate:0];
        [v15 removeTarget:self action:0];
      }
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  v16.receiver = self;
  v16.super_class = (Class)GAXInterestAreaView;
  [(GAXInterestAreaView *)&v16 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(GAXInterestAreaView *)self setNeedsLayout];
    id v5 = obj;
  }
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(GAXInterestAreaView *)self reloadAllInterestAreaPaths];
    id v5 = obj;
  }
}

- (void)setStyleProvider:(id)a3
{
  id v5 = (GAXStyleProvider *)a3;
  if (self->_styleProvider != v5)
  {
    id v12 = v5;
    objc_storeStrong((id *)&self->_styleProvider, a3);
    if (!v12)
    {
LABEL_9:
      id v11 = [(GAXInterestAreaView *)self fingerPathView];
      [v11 setStyleProvider:v12];

      goto LABEL_10;
    }
    [(GAXInterestAreaView *)self _refreshBackgroundStripesPatternColor];
    unsigned int v6 = [(GAXInterestAreaView *)self backgroundStyle];
    if (v6 == 2)
    {
      [(GAXStyleProvider *)v12 interestAreaViewBackgroundStripePatternAlpha];
      double v8 = v9;
    }
    else
    {
      if (v6 != 1)
      {
LABEL_8:
        [(GAXInterestAreaView *)self reloadAllInterestAreaPaths];
        goto LABEL_9;
      }
      [(GAXStyleProvider *)v12 interestAreaViewBackgroundStripePatternAlpha];
      double v8 = v7 * 0.5;
    }
    double v10 = [(GAXInterestAreaView *)self backgroundContainerView];
    [v10 setAlpha:v8];

    goto LABEL_8;
  }
LABEL_10:

  _objc_release_x2();
}

- (CGRect)contentsBounds
{
  v2 = [(GAXInterestAreaView *)self contentsView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setContentsBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(GAXInterestAreaView *)self contentsView];
  objc_msgSend(v7, "setFrame:", x, y, width, height);
}

- (double)contentsCornerRadius
{
  v2 = [(GAXInterestAreaView *)self contentsView];
  double v3 = [v2 layer];
  [v3 cornerRadius];
  double v5 = v4;

  return v5;
}

- (void)setContentsCornerRadius:(double)a3
{
  id v5 = [(GAXInterestAreaView *)self contentsView];
  double v4 = [v5 layer];
  [v4 setCornerRadius:a3];
}

- (void)setBackgroundPatternScaleFactor:(double)a3
{
  if (self->_backgroundPatternScaleFactor != a3)
  {
    self->_backgroundPatternScaleFactor = a3;
    id v5 = [(GAXInterestAreaView *)self clippedViews];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) setBackgroundPatternScaleFactor:a3];
        }
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    double v10 = [(GAXInterestAreaView *)self backgroundViewCoveringEverything];
    [v10 setBackgroundPatternScaleFactor:a3];
  }
}

- (void)setBackgroundStyle:(int)a3
{
}

- (void)setSpecialControlsVisible:(BOOL)a3
{
}

- (void)setBackgroundShouldCoverEverything:(BOOL)a3
{
}

- (UIColor)backgroundStripesPatternColor
{
  backgroundStripesPatternColor = self->_backgroundStripesPatternColor;
  if (!backgroundStripesPatternColor)
  {
    double v4 = [(GAXInterestAreaView *)self styleProvider];
    id v5 = [(GAXInterestAreaView *)self window];
    id v6 = [v5 screen];

    if (v4 && v6)
    {
      id v7 = [v4 interestAreaViewBackgroundColor];
      uint64_t v8 = [v4 interestAreaViewBackgroundHatchingTexture];
      [v4 interestAreaViewBackgroundHatchingTextureAlpha];
      double v10 = v9;
      [v8 size];
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      [v6 scale];
      CGFloat v16 = v15;
      [v8 size];
      UIGraphicsBeginImageContextWithOptions(v24, 1, v16);
      CurrentContext = UIGraphicsGetCurrentContext();
      id v18 = v7;
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v18 CGColor]);
      v25.origin.double x = 0.0;
      v25.origin.double y = 0.0;
      v25.size.double width = v12;
      v25.size.double height = v14;
      CGContextFillRect(CurrentContext, v25);
      objc_msgSend(v8, "drawAtPoint:blendMode:alpha:", 0, CGPointZero.x, CGPointZero.y, v10);
      long long v19 = UIGraphicsGetImageFromCurrentImageContext();
      long long v20 = (UIColor *)[objc_alloc((Class)UIColor) initWithPatternImage:v19];
      long long v21 = self->_backgroundStripesPatternColor;
      self->_backgroundStripesPatternColor = v20;

      UIGraphicsEndImageContext();
    }

    backgroundStripesPatternColor = self->_backgroundStripesPatternColor;
  }

  return backgroundStripesPatternColor;
}

- (void)setBackgroundStyle:(int)a3 animated:(BOOL)a4
{
  if (self->_backgroundStyle != a3)
  {
    BOOL v4 = a4;
    self->_backgroundStyle = a3;
    id v7 = [(GAXInterestAreaView *)self styleProvider];
    uint64_t v8 = [(GAXInterestAreaView *)self backgroundContainerView];
    double v9 = v8;
    if (a3)
    {
      [v7 interestAreaViewBackgroundStripePatternAlpha];
      if (a3 == 1) {
        double v11 = v10 * 0.5;
      }
      else {
        double v11 = v10;
      }
      if (v4)
      {
        [v9 setHidden:0];
        [v7 defaultAnimationDuration];
        double v13 = v12;
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_122A4;
        v23[3] = &unk_5D0C0;
        id v24 = v9;
        double v25 = v11;
        +[UIView animateWithDuration:v23 animations:v13];
        id v14 = v24;
LABEL_10:

LABEL_14:
        return;
      }
      [v9 setAlpha:v11];
      long long v17 = v9;
      uint64_t v18 = 0;
    }
    else
    {
      if (v4)
      {
        [v7 defaultAnimationDuration];
        double v16 = v15;
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_122B0;
        v21[3] = &unk_5CD28;
        id v22 = v9;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_122BC;
        v19[3] = &unk_5CBF8;
        id v20 = v22;
        +[UIView animateWithDuration:v21 animations:v19 completion:v16];

        id v14 = v22;
        goto LABEL_10;
      }
      [v8 setAlpha:0.0];
      long long v17 = v9;
      uint64_t v18 = 1;
    }
    [v17 setHidden:v18];
    goto LABEL_14;
  }
}

- (void)setSpecialControlsVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_specialControlsVisible != a3)
  {
    BOOL v4 = a4;
    self->_specialControlsVisible = a3;
    if (a3)
    {
      [(GAXInterestAreaView *)self _resetAllSpecialControls];
      if (!v4) {
        return;
      }
      [(GAXInterestAreaView *)self _enumerateSpecialControlsUsingBlock:&stru_5D100];
      id v6 = [(GAXInterestAreaView *)self styleProvider];
      [v6 defaultAnimationDuration];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_124A8;
      v9[3] = &unk_5CD28;
      v9[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9);
      goto LABEL_7;
    }
    if (a4)
    {
      id v6 = [(GAXInterestAreaView *)self styleProvider];
      [v6 defaultAnimationDuration];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_124C4;
      v8[3] = &unk_5CD28;
      v8[4] = self;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_124E0;
      v7[3] = &unk_5CBF8;
      v7[4] = self;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v8, v7);
LABEL_7:

      return;
    }
    [(GAXInterestAreaView *)self _enumerateSpecialControlsUsingBlock:&stru_5D180];
  }
}

- (void)setBackgroundShouldCoverEverything:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_backgroundShouldCoverEverything != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_backgroundShouldCoverEverything = a3;
    id v7 = [(GAXInterestAreaView *)self backgroundViewCoveringEverything];
    uint64_t v8 = [(GAXInterestAreaView *)self styleProvider];
    if (v5)
    {
      if (!v7)
      {
        double v9 = [(GAXInterestAreaView *)self backgroundContainerView];
        [v9 bounds];
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        id v7 = -[GAXInterestAreaClippedView initWithFrame:]([GAXInterestAreaClippedView alloc], "initWithFrame:", v10, v12, v14, v16);
        [(GAXInterestAreaClippedView *)v7 setAutoresizingMask:18];
        [(GAXInterestAreaView *)self bounds];
        -[GAXInterestAreaClippedView setBackgroundSize:](v7, "setBackgroundSize:", v18, v19);
        id v20 = [(GAXInterestAreaView *)self backgroundStripesPatternColor];
        [(GAXInterestAreaClippedView *)v7 setBackgroundColor:v20];

        [(GAXInterestAreaView *)self backgroundPatternScaleFactor];
        -[GAXInterestAreaClippedView setBackgroundPatternScaleFactor:](v7, "setBackgroundPatternScaleFactor:");
        long long v21 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v11, v13, v15, v17);
        [(GAXInterestAreaClippedView *)v7 setClippingPath:v21];

        [(GAXInterestAreaClippedView *)v7 setDelegate:self];
        [(GAXInterestAreaClippedView *)v7 setAlpha:0.0];
        [(GAXInterestAreaClippedView *)v7 setHidden:1];
        [v9 addSubview:v7];
        [(GAXInterestAreaView *)self setBackgroundViewCoveringEverything:v7];
      }
      [(GAXInterestAreaClippedView *)v7 setHidden:0];
      double v22 = 0.0;
      if (v4)
      {
        [v8 defaultAnimationDuration];
        double v22 = v23;
      }
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_12930;
      v42[3] = &unk_5CEB0;
      id v24 = v7;
      v43 = v24;
      v44 = self;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_12984;
      v41[3] = &unk_5CBF8;
      v41[4] = self;
      +[UIView animateWithDuration:v42 animations:v41 completion:v22];
      double v25 = v43;
    }
    else
    {
      double v25 = [(GAXInterestAreaView *)self clippedViews];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v26 = [v25 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v38;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v38 != v28) {
              objc_enumerationMutation(v25);
            }
            [*(id *)(*((void *)&v37 + 1) + 8 * i) setHidden:0];
          }
          id v27 = [v25 countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v27);
      }
      [(GAXInterestAreaView *)self _enumerateSpecialControlsUsingBlock:&stru_5D1E0];
      double v30 = 0.0;
      if (v4)
      {
        [v8 defaultAnimationDuration];
        double v30 = v31;
      }
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_12AA8;
      v34[3] = &unk_5CEB0;
      v35 = v7;
      v36 = self;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_12AFC;
      v32[3] = &unk_5CBF8;
      id v24 = v35;
      v33 = v24;
      +[UIView animateWithDuration:v34 animations:v32 completion:v30];
    }
  }
}

- (void)adjustOutOfBoundsDrawingToCoverView:(id)a3 edgeInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v9 = a3;
  id v29 = v9;
  if (v9)
  {
    [v9 bounds];
    objc_msgSend(v29, "convertRect:toView:", self, left + v10, top + v11, v12 - (left + right), v13 - (top + bottom));
    double x = v14;
    double y = v16;
    double width = v18;
    double height = v20;
    [v29 center];
    objc_msgSend(v29, "convertPoint:toView:", self, (left - right) * 0.5 + v22, (top - bottom) * 0.5 + v23);
    double MidX = v24;
    double MidY = v26;
  }
  else
  {
    [(GAXInterestAreaView *)self bounds];
    double x = v31.origin.x;
    double y = v31.origin.y;
    double width = v31.size.width;
    double height = v31.size.height;
    double MidX = CGRectGetMidX(v31);
    v32.origin.double x = x;
    v32.origin.double y = y;
    v32.size.double width = width;
    v32.size.double height = height;
    double MidY = CGRectGetMidY(v32);
  }
  uint64_t v28 = [(GAXInterestAreaView *)self fingerPathView];
  objc_msgSend(v28, "setBounds:", x, y, width, height);
  objc_msgSend(v28, "setCenter:", MidX, MidY);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)GAXInterestAreaView;
  [(GAXInterestAreaView *)&v3 layoutSubviews];
  [(GAXInterestAreaView *)self _resetAllSpecialControls];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GAXInterestAreaView;
  -[GAXInterestAreaView setBounds:](&v4, "setBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(GAXInterestAreaView *)self _ensureBackgroundSizeOfBackgroundViewCoveringEverythingIsSet];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GAXInterestAreaView;
  -[GAXInterestAreaView setFrame:](&v4, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(GAXInterestAreaView *)self _ensureBackgroundSizeOfBackgroundViewCoveringEverythingIsSet];
}

- (void)insertInterestAreaPathAtIndex:(unint64_t)a3
{
  BOOL v5 = -[GAXInterestAreaView _interestAreaPathAtIndex:](self, "_interestAreaPathAtIndex:");
  if (v5 && ([v5 isEmpty] & 1) == 0)
  {
    [(GAXInterestAreaView *)self _insertClippedViewForInterestAreaPathAtIndex:a3];
    [(GAXInterestAreaView *)self setNeedsLayout];
    id v6 = [(GAXInterestAreaView *)self buttonBeingDragged];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = (char *)[v6 associatedInterestAreaPathIndex];
      if ((unint64_t)v8 >= a3) {
        [v7 setAssociatedInterestAreaPathIndex:v8 + 1];
      }
    }
    unint64_t v9 = [(GAXInterestAreaView *)self indexOfInterestAreaPathBeingDragged];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL && v9 >= a3) {
      [(GAXInterestAreaView *)self setIndexOfInterestAreaPathBeingDragged:v9 + 1];
    }
  }

  _objc_release_x1();
}

- (void)reloadFrameOfInterestAreaPathAtIndex:(unint64_t)a3
{
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v10 = size;
  [(GAXInterestAreaView *)self _getClippedViewPropertiesForInterestAreaPathAtIndex:a3 frame:0 constrainedFrame:&origin adjustedClippingPath:0];
  id v6 = [(GAXInterestAreaView *)self clippedViews];
  id v7 = [v6 objectAtIndex:a3];

  uint64_t v8 = [(GAXInterestAreaView *)self backgroundContainerView];
  -[GAXInterestAreaView convertRect:toView:](self, "convertRect:toView:", v8, origin, v10);
  objc_msgSend(v7, "setFrame:");

  [(GAXInterestAreaView *)self setNeedsLayout];
}

- (void)reloadInterestAreaPathAtIndex:(unint64_t)a3
{
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v14 = size;
  CGPoint v11 = origin;
  CGSize v12 = size;
  id v10 = 0;
  [(GAXInterestAreaView *)self _getClippedViewPropertiesForInterestAreaPathAtIndex:a3 frame:&origin constrainedFrame:&v11 adjustedClippingPath:&v10];
  id v6 = v10;
  id v7 = [(GAXInterestAreaView *)self backgroundContainerView];
  uint64_t v8 = [(GAXInterestAreaView *)self clippedViews];
  unint64_t v9 = [v8 objectAtIndex:a3];

  -[GAXInterestAreaView convertRect:toView:](self, "convertRect:toView:", v7, origin, v14);
  objc_msgSend(v9, "setFrame:");
  [v9 setClippingPath:v6];

  -[GAXInterestAreaView convertRect:toView:](self, "convertRect:toView:", v7, v11, v12);
  objc_msgSend(v9, "setFrame:");
}

- (void)deleteInterestAreaPathsAtIndices:(id)a3
{
  id v4 = a3;
  long long v38 = self;
  v36 = [(GAXInterestAreaView *)self styleProvider];
  id v5 = objc_alloc((Class)UIView);
  [(GAXInterestAreaView *)v38 bounds];
  id v40 = objc_msgSend(v5, "initWithFrame:");
  id v6 = [v40 layer];
  [v6 setAllowsGroupOpacity:1];

  id v7 = objc_alloc((Class)UIView);
  [(GAXInterestAreaView *)v38 contentsBounds];
  id v37 = objc_msgSend(v7, "initWithFrame:");
  v35 = [v37 layer];
  [v35 setMasksToBounds:1];
  [(GAXInterestAreaView *)v38 contentsCornerRadius];
  objc_msgSend(v35, "setCornerRadius:");
  [v40 addSubview:v37];
  id v8 = objc_alloc((Class)UIView);
  [v37 bounds];
  id v9 = objc_msgSend(v8, "initWithFrame:");
  [v9 setAutoresizingMask:18];
  id v10 = [v9 layer];
  [v10 setAllowsGroupOpacity:1];

  unsigned int v11 = [(GAXInterestAreaView *)v38 backgroundStyle];
  if (v11 == 1)
  {
    [v36 interestAreaViewBackgroundStripePatternAlpha];
    double v12 = v13 * 0.5;
  }
  else
  {
    double v12 = 0.0;
    if (v11 == 2) {
      objc_msgSend(v36, "interestAreaViewBackgroundStripePatternAlpha", 0.0);
    }
  }
  [v9 setAlpha:v12];
  [v37 addSubview:v9];
  [(GAXInterestAreaView *)v38 clippedViews];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_13620;
  v55[3] = &unk_5D228;
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  id v56 = v34;
  id v33 = v9;
  id v57 = v33;
  [v4 enumerateIndexesUsingBlock:v55];
  [v34 removeObjectsAtIndexes:v4];
  v59[0] = [(GAXInterestAreaView *)v38 closeButtons];
  uint64_t v14 = [(GAXInterestAreaView *)v38 resizingKnobButtons];
  uint64_t v15 = 0;
  v59[1] = v14;
  char v16 = 1;
  do
  {
    char v39 = v16;
    id v17 = (id)v59[v15];
    double v18 = objc_opt_new();
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v19 = v17;
    id v20 = [v19 countByEnumeratingWithState:&v51 objects:v58 count:16];
    if (v20)
    {
      uint64_t v21 = 0;
      uint64_t v22 = *(void *)v52;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v52 != v22) {
            objc_enumerationMutation(v19);
          }
          double v24 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          double v25 = [v24 superview];
          if (v25)
          {
            unsigned int v26 = objc_msgSend(v4, "containsIndex:", objc_msgSend(v24, "associatedInterestAreaPathIndex"));

            if (v26)
            {
              [v24 removeFromSuperview];
              [v40 addSubview:v24];
              [v18 addIndex:(char *)i + v21];
            }
          }
        }
        id v20 = [v19 countByEnumeratingWithState:&v51 objects:v58 count:16];
        v21 += (uint64_t)i;
      }
      while (v20);
    }

    [v19 removeObjectsAtIndexes:v18];
    char v16 = 0;
    uint64_t v15 = 1;
  }
  while ((v39 & 1) != 0);
  [(GAXInterestAreaView *)v38 insertSubview:v40 atIndex:0];
  [v36 defaultAnimationDuration];
  double v28 = v27;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_13680;
  v49[3] = &unk_5CD28;
  id v50 = v40;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1368C;
  v47[3] = &unk_5CBF8;
  id v29 = v50;
  id v48 = v29;
  +[UIView animateWithDuration:v49 animations:v47 completion:v28];
  [(GAXInterestAreaView *)v38 setNeedsLayout];
  double v30 = [(GAXInterestAreaView *)v38 buttonBeingDragged];
  CGRect v31 = v30;
  if (v30)
  {
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    id v46 = 0;
    id v46 = [v30 associatedInterestAreaPathIndex];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1369C;
    v42[3] = &unk_5D250;
    void v42[4] = &v43;
    [v4 enumerateIndexesWithOptions:2 usingBlock:v42];
    [v31 setAssociatedInterestAreaPathIndex:v44[3]];
    _Block_object_dispose(&v43, 8);
  }
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  id v46 = 0;
  id v46 = [(GAXInterestAreaView *)v38 indexOfInterestAreaPathBeingDragged];
  if (v44[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_136BC;
    v41[3] = &unk_5D250;
    v41[4] = &v43;
    [v4 enumerateIndexesWithOptions:2 usingBlock:v41];
    [(GAXInterestAreaView *)v38 setIndexOfInterestAreaPathBeingDragged:v44[3]];
  }
  _Block_object_dispose(&v43, 8);

  for (uint64_t j = 1; j != -1; --j)
}

- (void)insertDynamicInterestAreaPathAtIndex:(unint64_t)a3
{
  id v3 = [(GAXInterestAreaView *)self fingerPathView];
  [v3 reloadAllInterestAreaPaths];
  [v3 setHidden:0];
}

- (void)reloadDynamicInterestAreaPathAtIndex:(unint64_t)a3
{
  id v3 = [(GAXInterestAreaView *)self fingerPathView];
  [v3 reloadAllInterestAreaPaths];
}

- (void)deleteDynamicInterestAreaPathAtIndices:(id)a3
{
  id v4 = [(GAXInterestAreaView *)self fingerPathView];
  [v4 reloadAllInterestAreaPaths];
  if (!-[GAXInterestAreaView numberOfInterestAreaPathsForInterestAreaFingerPathView:](self, "numberOfInterestAreaPathsForInterestAreaFingerPathView:", v4))[v4 setHidden:1]; {
}
  }

- (void)reloadAllInterestAreaPaths
{
  id v3 = [(GAXInterestAreaView *)self clippedViews];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v7) removeFromSuperview];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  [v3 removeAllObjects];
  unint64_t v8 = [(GAXInterestAreaView *)self _numberOfInterestAreaPaths];
  if (v8)
  {
    unint64_t v9 = v8;
    for (uint64_t i = 0; i != v9; ++i)
      [(GAXInterestAreaView *)self insertInterestAreaPathAtIndex:i];
  }
  [(GAXInterestAreaView *)self setNeedsLayout];
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(GAXInterestAreaView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v4 = [v3 interestAreaViewIsAccessibilityElement:self];
  }
  else {
    unsigned __int8 v4 = 1;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v3 canInteractWithInterestAreaView:self] & 1) == 0)
  {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (CGPoint)accessibilityActivationPoint
{
  double v2 = -1.0;
  double v3 = -1.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (int64_t)accessibilityContainerType
{
  double v3 = [(GAXInterestAreaView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v3 canInteractWithInterestAreaView:self] & 1) != 0)
  {
    id v4 = &dword_4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)GAXInterestAreaView;
    id v4 = [(GAXInterestAreaView *)&v6 accessibilityContainerType];
  }

  return (int64_t)v4;
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)GAXInterestAreaView;
  unint64_t v3 = [(GAXInterestAreaView *)&v6 accessibilityTraits];
  id v4 = [(GAXInterestAreaView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v4 canInteractWithInterestAreaView:self] & 1) == 0)
  {
    v3 |= UIAccessibilityTraitNotEnabled;
  }

  return v3;
}

- (id)accessibilityLabel
{
  return GAXLocString(@"AX_APPLICATION");
}

- (id)accessibilityValue
{
  unint64_t v3 = [(GAXInterestAreaView *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(GAXInterestAreaView *)self dataSource];
    id v5 = [v4 numberOfInterestAreaPathsForInterestAreaView:self];
  }
  else
  {
    id v5 = 0;
  }
  objc_super v6 = GAXLocString(@"AX_INTEREST_AREA_COUNT");
  id v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v5);

  return v7;
}

- (id)accessibilityHint
{
  unint64_t v3 = [(GAXInterestAreaView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v3 canInteractWithInterestAreaView:self])
  {
    id v4 = GAXLocString(@"HELP_INTEREST_AREA");
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (CGRect)accessibilityFrame
{
  double v2 = [(GAXInterestAreaView *)self contentsView];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  [(GAXInterestAreaView *)self frame];
  -[GAXInterestAreaView setSavedFrame:](self, "setSavedFrame:");
  v5.receiver = self;
  v5.super_class = (Class)GAXInterestAreaView;
  [(GAXInterestAreaView *)&v5 willMoveToWindow:v4];
}

- (void)didMoveToWindow
{
  v14.receiver = self;
  v14.super_class = (Class)GAXInterestAreaView;
  [(GAXInterestAreaView *)&v14 didMoveToWindow];
  [(GAXInterestAreaView *)self savedFrame];
  -[GAXInterestAreaView setFrame:](self, "setFrame:");
  -[GAXInterestAreaView setSavedFrame:](self, "setSavedFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(GAXInterestAreaView *)self _refreshBackgroundStripesPatternColor];
  double v3 = [(GAXInterestAreaView *)self backgroundStripesPatternColor];
  if (v3)
  {
    id v4 = [(GAXInterestAreaView *)self clippedViews];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        double v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) setBackgroundColor:v3];
          double v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v6);
    }
    double v9 = [(GAXInterestAreaView *)self backgroundViewCoveringEverything];
    [v9 setBackgroundColor:v3];
  }
}

- (void)_handlePan:(id)a3
{
  id v4 = a3;
  id v5 = (int *)[v4 state];
  if ((unint64_t)v5 - 1 <= 1)
  {
    id v6 = [(GAXInterestAreaView *)self delegate];
    uint64_t v7 = [(GAXInterestAreaView *)self buttonBeingDragged];
    uint64_t v32 = 0;
    id v33 = &v32;
    uint64_t v34 = 0x2020000000;
    unint64_t v35 = 0;
    unint64_t v35 = [(GAXInterestAreaView *)self indexOfInterestAreaPathBeingDragged];
    if (v7)
    {
LABEL_3:
      [v4 translationInView:self];
      double v9 = v8;
      double v11 = v10;
      [(GAXInterestAreaView *)self buttonBeingDraggedInitialCenter];
      double v13 = v9 + v12;
      double v15 = v11 + v14;
      double v29 = v13;
      double v30 = v15;
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v6, "interestAreaView:resizingKnobAtPosition:wasMovedToPoint:forInterestAreaPathAtIndex:constrainedResizingKnobCenter:", self, objc_msgSend(v7, "knobPosition"), objc_msgSend(v7, "associatedInterestAreaPathIndex"), &v29, v13, v15);
        double v13 = v29;
        double v15 = v30;
      }
      objc_msgSend(v7, "gax_setCenter:alignWithGrid:", 1, v13, v15);

LABEL_6:
      _Block_object_dispose(&v32, 8);
LABEL_23:

      goto LABEL_24;
    }
    if (v33[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v4 locationInView:self];
      uint64_t v19 = v18;
      uint64_t v21 = v20;
      uint64_t v22 = -[GAXInterestAreaView _specialControlButtonAtLocation:](self, "_specialControlButtonAtLocation:");
      uint64_t v7 = v22;
      if (v22)
      {
        [v22 setHighlighted:1];
        [(GAXInterestAreaView *)self setButtonBeingDragged:v7];
        [v7 center];
        -[GAXInterestAreaView setButtonBeingDraggedInitialCenter:](self, "setButtonBeingDraggedInitialCenter:");
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v6, "interestAreaView:willBeginMovingResizingKnobAtPosition:forInterestAreaPathAtIndex:", self, objc_msgSend(v7, "knobPosition"), objc_msgSend(v7, "associatedInterestAreaPathIndex"));
        }
        goto LABEL_3;
      }
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_14294;
      v31[3] = &unk_5D278;
      v31[5] = v19;
      v31[6] = v21;
      v31[4] = &v32;
      [(GAXInterestAreaView *)self _enumerateInterestAreaPathsWithOptions:2 usingBlock:v31];
      unsigned int v26 = v33;
      if (v33[3] != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[GAXInterestAreaView setIndexOfInterestAreaPathBeingDragged:](self, "setIndexOfInterestAreaPathBeingDragged:");
        char v27 = objc_opt_respondsToSelector();
        unsigned int v26 = v33;
        if (v27)
        {
          [v6 interestAreaView:self willBeginMovingInterestAreaPathAtIndex:v33[3]];
          unsigned int v26 = v33;
        }
      }
      if (v26[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        [v4 setEnabled:0];
        if (v33[3] == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_6;
        }
      }
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v28 = v33[3];
      [v4 translationInView:self];
      objc_msgSend(v6, "interestAreaView:interestAreaPathAtIndex:wasMovedWithTranslation:", self, v28);
    }
    goto LABEL_6;
  }
  if ((unint64_t)v5 - 3 <= 1)
  {
    if (v5 == &dword_4 && ([v4 isEnabled] & 1) == 0) {
      [v4 setEnabled:1];
    }
    char v16 = [(GAXInterestAreaView *)self buttonBeingDragged];
    id v6 = v16;
    if (v16)
    {
      [v16 setHighlighted:0];
      id v17 = [(GAXInterestAreaView *)self delegate];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v17, "interestAreaView:didFinishMovingResizingKnobAtPosition:forInterestAreaPathAtIndex:", self, objc_msgSend(v6, "knobPosition"), objc_msgSend(v6, "associatedInterestAreaPathIndex"));
      }
      [(GAXInterestAreaView *)self setButtonBeingDragged:0];
      -[GAXInterestAreaView setButtonBeingDraggedInitialCenter:](self, "setButtonBeingDraggedInitialCenter:", CGPointZero.x, CGPointZero.y);
      -[GAXInterestAreaView reloadInterestAreaPathAtIndex:](self, "reloadInterestAreaPathAtIndex:", [v6 associatedInterestAreaPathIndex]);

      [(GAXInterestAreaView *)self indexOfInterestAreaPathBeingDragged];
    }
    else
    {
      unint64_t v23 = [(GAXInterestAreaView *)self indexOfInterestAreaPathBeingDragged];
      if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v24 = v23;
        [(GAXInterestAreaView *)self setIndexOfInterestAreaPathBeingDragged:0x7FFFFFFFFFFFFFFFLL];
        double v25 = [(GAXInterestAreaView *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v25 interestAreaView:self didFinishMovingInterestAreaPathAtIndex:v24];
        }
      }
    }
    goto LABEL_23;
  }
LABEL_24:
}

- (void)_handleTap:(id)a3
{
  id v8 = a3;
  BOOL v4 = [v8 state] == (char *)&dword_0 + 3;
  id v5 = v8;
  if (v4)
  {
    [v8 locationInView:self];
    id v6 = -[GAXInterestAreaView _specialControlButtonAtLocation:passingTest:](self, "_specialControlButtonAtLocation:passingTest:", &stru_5D2B8);
    [v8 locationInView:self];
    objc_msgSend(v6, "convertPoint:fromView:", self);
    if (objc_msgSend(v6, "pointInside:withEvent:", 0))
    {
      uint64_t v7 = [(GAXInterestAreaView *)self delegate];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v7, "interestAreaView:didActivateCloseButtonForInterestAreaPathAtIndex:", self, objc_msgSend(v6, "associatedInterestAreaPathIndex"));
      }
    }
    id v5 = v8;
  }
}

- (void)_getClippedViewPropertiesForInterestAreaPathAtIndex:(unint64_t)a3 frame:(CGRect *)a4 constrainedFrame:(CGRect *)a5 adjustedClippingPath:(id *)a6
{
  double v11 = -[GAXInterestAreaView _interestAreaPathAtIndex:](self, "_interestAreaPathAtIndex:");
  [v11 bounds];
  CGFloat v16 = v12;
  CGFloat v17 = v13;
  CGFloat v18 = v14;
  CGFloat v19 = v15;
  if (a4)
  {
    a4->origin.double x = v12;
    a4->origin.double y = v13;
    a4->size.double width = v14;
    a4->size.double height = v15;
  }
  if (a5)
  {
    -[GAXInterestAreaView _constrainedFrameForInsetFrame:forInterestAreaPathAtIndex:](self, "_constrainedFrameForInsetFrame:forInterestAreaPathAtIndex:", a3, v12, v13, v14, v15);
    a5->origin.double x = v20;
    a5->origin.double y = v21;
    a5->size.double width = v22;
    a5->size.double height = v23;
  }
  if (a6)
  {
    id v24 = [v11 copy];
    *a6 = v24;
    v28.origin.double x = v16;
    v28.origin.double y = v17;
    v28.size.double width = v18;
    v28.size.double height = v19;
    CGFloat v25 = -CGRectGetMinX(v28);
    v29.origin.double x = v16;
    v29.origin.double y = v17;
    v29.size.double width = v18;
    v29.size.double height = v19;
    CGFloat MinY = CGRectGetMinY(v29);
    CGAffineTransformMakeTranslation(&v27, v25, -MinY);
    [v24 applyTransform:&v27];
  }
}

- (void)_insertClippedViewForInterestAreaPathAtIndex:(unint64_t)a3
{
  id v5 = [(GAXInterestAreaView *)self backgroundContainerView];
  id v6 = [(GAXInterestAreaView *)self clippedViews];
  if (!v6)
  {
    id v6 = objc_opt_new();
    [(GAXInterestAreaView *)self setClippedViews:v6];
  }
  id v7 = [v6 count];
  if ((unint64_t)v7 < a3)
  {
    _AXAssert();
    goto LABEL_13;
  }
  if (v6 && v5)
  {
    unint64_t v8 = (unint64_t)v7;
    CGSize size = CGRectZero.size;
    CGPoint origin = CGRectZero.origin;
    CGSize v21 = size;
    CGPoint v18 = origin;
    CGSize v19 = size;
    id v17 = 0;
    [(GAXInterestAreaView *)self _getClippedViewPropertiesForInterestAreaPathAtIndex:a3 frame:&origin constrainedFrame:&v18 adjustedClippingPath:&v17];
    id v10 = v17;
    double v11 = [GAXInterestAreaClippedView alloc];
    -[GAXInterestAreaView convertRect:toView:](self, "convertRect:toView:", v5, origin, v21);
    double v12 = -[GAXInterestAreaClippedView initWithFrame:](v11, "initWithFrame:");
    [(GAXInterestAreaView *)self bounds];
    -[GAXInterestAreaClippedView setBackgroundSize:](v12, "setBackgroundSize:", v13, v14);
    double v15 = [(GAXInterestAreaView *)self backgroundStripesPatternColor];
    [(GAXInterestAreaClippedView *)v12 setBackgroundColor:v15];

    [(GAXInterestAreaView *)self backgroundPatternScaleFactor];
    -[GAXInterestAreaClippedView setBackgroundPatternScaleFactor:](v12, "setBackgroundPatternScaleFactor:");
    [(GAXInterestAreaClippedView *)v12 setClippingPath:v10];

    [(GAXInterestAreaClippedView *)v12 setDelegate:self];
    -[GAXInterestAreaView convertRect:toView:](self, "convertRect:toView:", v5, v18, v19);
    -[GAXInterestAreaClippedView setFrame:](v12, "setFrame:");
    if (v8 <= a3)
    {
      CGFloat v16 = [(GAXInterestAreaView *)self backgroundViewCoveringEverything];
      if (!v16)
      {
        [v5 addSubview:v12];
        goto LABEL_12;
      }
    }
    else
    {
      CGFloat v16 = [v6 objectAtIndex:a3];
    }
    [v5 insertSubview:v12 belowSubview:v16];
LABEL_12:

    [v6 insertObject:v12 atIndex:a3];
  }
LABEL_13:
}

- (CGRect)_constrainedFrameForInsetFrame:(CGRect)a3 forInterestAreaPathAtIndex:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (![(GAXInterestAreaView *)self _shouldDisableSmartLayoutRelativeToEdgesForInterestAreaPathAtIndex:"_shouldDisableSmartLayoutRelativeToEdgesForInterestAreaPathAtIndex:"])
  {
    [(GAXInterestAreaView *)self contentsBounds];
    CGFloat v11 = v10;
    CGFloat v41 = v12;
    CGFloat v42 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v40 = v14;
    CGFloat v17 = v16;
    CGFloat rect = v16;
    CGPoint v18 = [(GAXInterestAreaView *)self _interestAreaPathAtIndex:a4];
    [v18 bounds];
    double v47 = width;
    double v48 = height;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    double v45 = x;
    double v46 = y;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    v50.origin.double x = v11;
    v50.origin.double y = v13;
    v50.size.double width = v15;
    v50.size.double height = v17;
    double MinX = CGRectGetMinX(v50);
    v51.origin.double x = v20;
    v51.origin.double y = v22;
    v51.size.double width = v24;
    v51.size.double height = v26;
    double v28 = MinX - CGRectGetMinX(v51);
    if (v28 < 0.0) {
      double v28 = 0.0;
    }
    double v44 = v28;
    v52.origin.double x = v20;
    v52.origin.double y = v22;
    v52.size.double width = v24;
    v52.size.double height = v26;
    double MaxX = CGRectGetMaxX(v52);
    v53.origin.double x = v42;
    v53.origin.double y = v41;
    v53.size.double width = v40;
    v53.size.double height = rect;
    double v30 = MaxX - CGRectGetMaxX(v53);
    if (v30 < 0.0) {
      double v30 = 0.0;
    }
    double v43 = v30;
    v54.origin.double x = v42;
    v54.origin.double y = v41;
    v54.size.double width = v40;
    v54.size.double height = rect;
    double MinY = CGRectGetMinY(v54);
    v55.origin.double x = v20;
    v55.origin.double y = v22;
    v55.size.double width = v24;
    v55.size.double height = v26;
    double v32 = MinY - CGRectGetMinY(v55);
    if (v32 >= 0.0) {
      double v33 = v32;
    }
    else {
      double v33 = 0.0;
    }
    v56.origin.double x = v20;
    v56.origin.double y = v22;
    v56.size.double width = v24;
    v56.size.double height = v26;
    double MaxY = CGRectGetMaxY(v56);
    v57.origin.double x = v42;
    v57.origin.double y = v41;
    v57.size.double width = v40;
    v57.size.double height = rect;
    double v35 = MaxY - CGRectGetMaxY(v57);
    if (v35 < 0.0) {
      double v35 = 0.0;
    }
    double x = v45 + v44;
    double y = v46 + v33;
    double width = v47 - (v44 + v43);
    double height = v48 - (v33 + v35);
  }
  double v36 = x;
  double v37 = y;
  double v38 = width;
  double v39 = height;
  result.size.double height = v39;
  result.size.double width = v38;
  result.origin.double y = v37;
  result.origin.double x = v36;
  return result;
}

- (void)_resetAllSpecialControls
{
  double v3 = [(GAXInterestAreaView *)self closeButtons];
  BOOL v4 = [(GAXInterestAreaView *)self resizingKnobButtons];
  unsigned int v5 = [(GAXInterestAreaView *)self areSpecialControlsVisible];
  [(GAXInterestAreaView *)self buttonBeingDragged];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_14DB0;
  v48[3] = &unk_5D2E0;
  char v50 = v5;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v49 = v6;
  [(GAXInterestAreaView *)self _enumerateSpecialControlsUsingBlock:v48];
  if (v5)
  {
    id v7 = [(GAXInterestAreaView *)self delegate];
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      unint64_t v8 = [(GAXInterestAreaView *)self styleProvider];
      if ([(GAXInterestAreaView *)self backgroundShouldCoverEverything]) {
        double v9 = 0.0;
      }
      else {
        double v9 = 1.0;
      }
      v44[0] = 0;
      v44[1] = v44;
      v44[2] = 0x5010000000;
      v44[3] = &unk_583BD;
      long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
      long long v45 = *(_OWORD *)&CGAffineTransformIdentity.a;
      long long v46 = v10;
      long long v47 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      v42[0] = 0;
      v42[1] = v42;
      v42[2] = 0x2020000000;
      char v43 = 0;
      v40[0] = 0;
      v40[1] = v40;
      v40[2] = 0x2020000000;
      id v41 = 0;
      id v41 = [v3 count];
      v39[0] = 0;
      v39[1] = v39;
      v39[2] = 0x2020000000;
      v39[3] = 0;
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x2020000000;
      id v38 = 0;
      id v38 = [v4 count];
      v36[0] = 0;
      v36[1] = v36;
      v36[2] = 0x2020000000;
      v36[3] = 0;
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x3032000000;
      v34[3] = sub_14E0C;
      void v34[4] = sub_14E1C;
      id v35 = 0;
      v32[0] = 0;
      v32[1] = v32;
      v32[2] = 0x3032000000;
      v32[3] = sub_14E0C;
      void v32[4] = sub_14E1C;
      id v33 = 0;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_14E24;
      v17[3] = &unk_5D308;
      id v18 = v6;
      double v23 = v36;
      CGFloat v24 = v37;
      id v19 = v4;
      double v25 = v32;
      id v11 = v8;
      id v20 = v11;
      CGFloat v26 = v39;
      CGAffineTransform v27 = v40;
      double v28 = v34;
      CGRect v29 = v42;
      id v21 = v3;
      CGFloat v22 = self;
      double v30 = v44;
      double v31 = v9;
      double v12 = objc_retainBlock(v17);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_151E8;
      v14[3] = &unk_5D358;
      v14[4] = self;
      id v15 = v7;
      CGFloat v13 = v12;
      id v16 = v13;
      [(GAXInterestAreaView *)self _enumerateInterestAreaPathsUsingBlock:v14];

      _Block_object_dispose(v32, 8);
      _Block_object_dispose(v34, 8);

      _Block_object_dispose(v36, 8);
      _Block_object_dispose(v37, 8);
      _Block_object_dispose(v39, 8);
      _Block_object_dispose(v40, 8);
      _Block_object_dispose(v42, 8);
      _Block_object_dispose(v44, 8);
    }
  }
}

- (void)_enumerateSpecialControlsUsingBlock:(id)a3
{
  BOOL v4 = (void (**)(id, void, char *, char *))a3;
  v23[0] = [(GAXInterestAreaView *)self closeButtons];
  uint64_t v5 = [(GAXInterestAreaView *)self resizingKnobButtons];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  v23[1] = v5;
  char v21 = 0;
  char v8 = 1;
  do
  {
    id v9 = (id)v23[v7];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v9;
    id v11 = (char *)[v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      double v12 = v11;
      uint64_t v13 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v4[2](v4, *(void *)(*((void *)&v17 + 1) + 8 * i), &i[v6], &v21);
          if (v21)
          {
            v6 += (uint64_t)i;
            goto LABEL_12;
          }
        }
        double v12 = (char *)[v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
        v6 += (uint64_t)i;
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    char v15 = v8 & (v21 == 0);
    uint64_t v7 = 1;
    char v8 = 0;
  }
  while ((v15 & 1) != 0);
  for (uint64_t j = 1; j != -1; --j)
}

- (void)_enumerateSpecialControlPropertiesForInterestAreaPath:(id)a3 visibleKnobPositions:(unint64_t)a4 hasCloseButton:(BOOL)a5 usingBlock:(id)a6
{
  BOOL v7 = a5;
  char v8 = a4;
  id v10 = a3;
  id v9 = (void (**)(id, uint64_t, BOOL))a6;
  if (v8)
  {
    [v10 topLeftPointOnPath];
    v9[2](v9, 1, v7);
    if ((v8 & 2) == 0)
    {
LABEL_3:
      if ((v8 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v10 topRightPointOnPath];
  v9[2](v9, 2, 0);
  if ((v8 & 4) == 0)
  {
LABEL_4:
    if ((v8 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  [v10 bottomRightPointOnPath];
  v9[2](v9, 4, 0);
  if ((v8 & 8) != 0)
  {
LABEL_5:
    [v10 bottomLeftPointOnPath];
    v9[2](v9, 8, 0);
  }
LABEL_6:
}

- (id)_specialControlButtonAtLocation:(CGPoint)a3
{
  return -[GAXInterestAreaView _specialControlButtonAtLocation:passingTest:](self, "_specialControlButtonAtLocation:passingTest:", &stru_5D378, a3.x, a3.y);
}

- (id)_specialControlButtonAtLocation:(CGPoint)a3 passingTest:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  uint64_t v21 = 0;
  CGFloat v22 = &v21;
  uint64_t v23 = 0x3032000000;
  CGFloat v24 = sub_14E0C;
  double v25 = sub_14E1C;
  id v26 = 0;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_1575C;
  double v14 = &unk_5D3A0;
  char v15 = self;
  id v7 = a4;
  double v19 = x;
  double v20 = y;
  id v16 = v7;
  long long v17 = &v21;
  long long v18 = v27;
  [(GAXInterestAreaView *)v15 _enumerateSpecialControlsUsingBlock:&v11];
  char v8 = (void *)v22[5];
  objc_msgSend(v8, "convertPoint:fromView:", self, x, y, v11, v12, v13, v14, v15);
  if (objc_msgSend(v8, "pointInside:withEvent:", 0)) {
    id v9 = (id)v22[5];
  }
  else {
    id v9 = 0;
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v27, 8);

  return v9;
}

- (unint64_t)_numberOfInterestAreaPaths
{
  double v3 = [(GAXInterestAreaView *)self dataSource];
  if (objc_opt_respondsToSelector()) {
    id v4 = [v3 numberOfInterestAreaPathsForInterestAreaView:self];
  }
  else {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (id)_interestAreaPathAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(GAXInterestAreaView *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 interestAreaView:self interestAreaPathAtIndex:a3];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_enumerateInterestAreaPathsUsingBlock:(id)a3
{
}

- (void)_enumerateInterestAreaPathsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v4 = a3;
  uint64_t v6 = (void (**)(id, void *, unint64_t, unsigned char *))a4;
  id v7 = [(GAXInterestAreaView *)self dataSource];
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    char v14 = 0;
    char v8 = (char *)[v7 numberOfInterestAreaPathsForInterestAreaView:self];
    if (v8)
    {
      unint64_t v9 = (unint64_t)v8;
      id v10 = v8 - 1;
      unint64_t v11 = 1;
      do
      {
        if ((v4 & 2) != 0) {
          unint64_t v12 = (unint64_t)v10;
        }
        else {
          unint64_t v12 = v11 - 1;
        }
        uint64_t v13 = [v7 interestAreaView:self interestAreaPathAtIndex:v12];
        v6[2](v6, v13, v12, &v14);

        if (v11 >= v9) {
          break;
        }
        ++v11;
        --v10;
      }
      while (!v14);
    }
  }
}

- (double)_scaleFactorForSpecialControls
{
  double v3 = [(GAXInterestAreaView *)self delegate];
  double v4 = 1.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 scaleForSpecialControlsInInterestAreaView:self];
    if (v5 != 0.0) {
      double v4 = v5;
    }
  }

  return v4;
}

- (BOOL)_shouldDisableSmartLayoutRelativeToEdgesForInterestAreaPathAtIndex:(unint64_t)a3
{
  double v5 = [(GAXInterestAreaView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v6 = [v5 interestAreaView:self shouldDisableSmartLayoutRelativeToEdgesForInterestAreaPathAtIndex:a3];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)_refreshBackgroundStripesPatternColor
{
}

- (void)_ensureBackgroundSizeOfBackgroundViewCoveringEverythingIsSet
{
  id v8 = [(GAXInterestAreaView *)self backgroundViewCoveringEverything];
  [v8 backgroundSize];
  if (v4 == CGSizeZero.width && v3 == CGSizeZero.height)
  {
    [(GAXInterestAreaView *)self bounds];
    objc_msgSend(v8, "setBackgroundSize:", v6, v7);
  }
}

- (unint64_t)numberOfInterestAreaPathsForInterestAreaFingerPathView:(id)a3
{
  double v4 = [(GAXInterestAreaView *)self dataSource];
  if (objc_opt_respondsToSelector()) {
    id v5 = [v4 numberOfDynamicInterestAreaPathsForInterestAreaView:self];
  }
  else {
    id v5 = 0;
  }

  return (unint64_t)v5;
}

- (id)interestAreaFingerPathView:(id)a3 interestAreaPathAtIndex:(unint64_t)a4
{
  double v6 = [(GAXInterestAreaView *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    double v7 = [v6 interestAreaView:self dynamicInterestAreaPathAtIndex:a4];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (CGPoint)centerForBackgroundOfInterestAreaClippedView:(id)a3
{
  id v4 = a3;
  [(GAXInterestAreaView *)self center];
  -[GAXInterestAreaView convertPoint:toView:](self, "convertPoint:toView:", v4);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    [v7 locationInView:self];
    double v8 = -[GAXInterestAreaView _specialControlButtonAtLocation:passingTest:](self, "_specialControlButtonAtLocation:passingTest:", &stru_5D3C0);
    if (!v8) {
      *((unsigned char *)v18 + 24) = 0;
    }
LABEL_9:

    goto LABEL_10;
  }
  double v8 = [(GAXInterestAreaView *)self buttonBeingDragged];
  if (v8) {
    goto LABEL_9;
  }
  if ([(GAXInterestAreaView *)self indexOfInterestAreaPathBeingDragged] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v7 locationInView:self];
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v13 = -[GAXInterestAreaView _specialControlButtonAtLocation:](self, "_specialControlButtonAtLocation:");

    if (!v13)
    {
      *((unsigned char *)v18 + 24) = 0;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_15E94;
      v16[3] = &unk_5D278;
      v16[5] = v10;
      v16[6] = v12;
      v16[4] = &v17;
      [(GAXInterestAreaView *)self _enumerateInterestAreaPathsUsingBlock:v16];
    }
  }
LABEL_10:
  char v14 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return v14;
}

- (GAXInterestAreaViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GAXInterestAreaViewDelegate *)WeakRetained;
}

- (GAXInterestAreaViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (GAXInterestAreaViewDataSource *)WeakRetained;
}

- (GAXStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (double)backgroundPatternScaleFactor
{
  return self->_backgroundPatternScaleFactor;
}

- (int)backgroundStyle
{
  return self->_backgroundStyle;
}

- (BOOL)areSpecialControlsVisible
{
  return self->_specialControlsVisible;
}

- (BOOL)backgroundShouldCoverEverything
{
  return self->_backgroundShouldCoverEverything;
}

- (void)setBackgroundStripesPatternColor:(id)a3
{
}

- (UIView)contentsView
{
  return self->_contentsView;
}

- (void)setContentsView:(id)a3
{
}

- (UIView)backgroundContainerView
{
  return self->_backgroundContainerView;
}

- (void)setBackgroundContainerView:(id)a3
{
}

- (GAXInterestAreaClippedView)backgroundViewCoveringEverything
{
  return self->_backgroundViewCoveringEverything;
}

- (void)setBackgroundViewCoveringEverything:(id)a3
{
}

- (GAXInterestAreaFingerPathView)fingerPathView
{
  return self->_fingerPathView;
}

- (void)setFingerPathView:(id)a3
{
}

- (NSMutableArray)clippedViews
{
  return self->_clippedViews;
}

- (void)setClippedViews:(id)a3
{
}

- (NSMutableArray)closeButtons
{
  return self->_closeButtons;
}

- (void)setCloseButtons:(id)a3
{
}

- (NSMutableArray)resizingKnobButtons
{
  return self->_resizingKnobButtons;
}

- (void)setResizingKnobButtons:(id)a3
{
}

- (GAXInterestAreaViewButton)buttonBeingDragged
{
  return self->_buttonBeingDragged;
}

- (void)setButtonBeingDragged:(id)a3
{
}

- (CGPoint)buttonBeingDraggedInitialCenter
{
  double x = self->_buttonBeingDraggedInitialCenter.x;
  double y = self->_buttonBeingDraggedInitialCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setButtonBeingDraggedInitialCenter:(CGPoint)a3
{
  self->_buttonBeingDraggedInitialCenter = a3;
}

- (unint64_t)indexOfInterestAreaPathBeingDragged
{
  return self->_indexOfInterestAreaPathBeingDragged;
}

- (void)setIndexOfInterestAreaPathBeingDragged:(unint64_t)a3
{
  self->_indexOfInterestAreaPathBeingDragged = a3;
}

- (CGRect)savedFrame
{
  double x = self->_savedFrame.origin.x;
  double y = self->_savedFrame.origin.y;
  double width = self->_savedFrame.size.width;
  double height = self->_savedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSavedFrame:(CGRect)a3
{
  self->_savedFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonBeingDragged, 0);
  objc_storeStrong((id *)&self->_resizingKnobButtons, 0);
  objc_storeStrong((id *)&self->_closeButtons, 0);
  objc_storeStrong((id *)&self->_clippedViews, 0);
  objc_storeStrong((id *)&self->_fingerPathView, 0);
  objc_storeStrong((id *)&self->_backgroundViewCoveringEverything, 0);
  objc_storeStrong((id *)&self->_backgroundContainerView, 0);
  objc_storeStrong((id *)&self->_contentsView, 0);
  objc_storeStrong((id *)&self->_backgroundStripesPatternColor, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_destroyWeak((id *)&self->_dataSource);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
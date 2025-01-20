@interface BuddyPosedDeviceSelectionView
+ (double)posedDevicesPadding;
+ (id)selectionItemWithImageName:(id)a3 symbolName:(id)a4 segment:(int64_t)a5 text:(id)a6 hostViewLayoutMargins:(NSDirectionalEdgeInsets)a7 posedDevicesPadding:(double)a8;
- (BuddyPosedDeviceSelectionDelegate)delegate;
- (BuddyPosedDeviceSelectionItemView)centerPosedView;
- (BuddyPosedDeviceSelectionItemView)leftPosedView;
- (BuddyPosedDeviceSelectionItemView)rightPosedView;
- (BuddyPosedDeviceSelectionView)initWithLeftView:(id)a3 centerView:(id)a4 rightView:(id)a5;
- (UIStackView)mainContainer;
- (UITapGestureRecognizer)centerTap;
- (UITapGestureRecognizer)leftTap;
- (UITapGestureRecognizer)rightTap;
- (UIView)centerContainer;
- (UIView)leftContainer;
- (UIView)rightContainer;
- (void)_updateViewContainerForAccessibilityOptions:(id)a3 contents:(id)a4;
- (void)didMoveToSuperview;
- (void)selectSegment:(int64_t)a3;
- (void)setCenterContainer:(id)a3;
- (void)setCenterPosedView:(id)a3;
- (void)setCenterTap:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLeftContainer:(id)a3;
- (void)setLeftPosedView:(id)a3;
- (void)setLeftTap:(id)a3;
- (void)setMainContainer:(id)a3;
- (void)setRightContainer:(id)a3;
- (void)setRightPosedView:(id)a3;
- (void)setRightTap:(id)a3;
- (void)tapped:(id)a3;
@end

@implementation BuddyPosedDeviceSelectionView

+ (double)posedDevicesPadding
{
  return 20.0;
}

- (BuddyPosedDeviceSelectionView)initWithLeftView:(id)a3 centerView:(id)a4 rightView:(id)a5
{
  id v70 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v68 = 0;
  objc_storeStrong(&v68, a4);
  id v67 = 0;
  objc_storeStrong(&v67, a5);
  id v7 = v70;
  id v70 = 0;
  v66.receiver = v7;
  v66.super_class = (Class)BuddyPosedDeviceSelectionView;
  v8 = -[BuddyPosedDeviceSelectionView initWithFrame:](&v66, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  id v70 = v8;
  objc_storeStrong(&v70, v8);
  if (v8)
  {
    id v9 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v10 = (void *)*((void *)v70 + 5);
    *((void *)v70 + 5) = v9;

    +[BuddyPosedDeviceSelectionView posedDevicesPadding];
    [*((id *)v70 + 5) setSpacing:v11 / 2.0];
    [*((id *)v70 + 5) setDistribution:1];
    [*((id *)v70 + 5) setAxis:0];
    id v12 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v13 = (void *)*((void *)v70 + 6);
    *((void *)v70 + 6) = v12;

    id v14 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v15 = (void *)*((void *)v70 + 7);
    *((void *)v70 + 7) = v14;

    id v16 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v17 = (void *)*((void *)v70 + 8);
    *((void *)v70 + 8) = v16;

    objc_storeStrong((id *)v70 + 2, location[0]);
    objc_storeStrong((id *)v70 + 3, v68);
    objc_storeStrong((id *)v70 + 4, v67);
    [*((id *)v70 + 6) addSubview:location[0]];
    [*((id *)v70 + 7) addSubview:v68];
    [*((id *)v70 + 8) addSubview:v67];
    id v65 = [location[0] centerXAnchor];
    id v64 = [*((id *)v70 + 6) centerXAnchor];
    id v63 = [v65 constraintEqualToAnchor:];
    v71[0] = v63;
    id v62 = [location[0] widthAnchor];
    id v61 = [*((id *)v70 + 6) widthAnchor];
    id v60 = [v62 constraintEqualToAnchor:];
    v71[1] = v60;
    id v59 = [location[0] topAnchor];
    id v58 = [*((id *)v70 + 6) topAnchor];
    id v57 = [v59 constraintEqualToAnchor:];
    v71[2] = v57;
    id v56 = [*((id *)v70 + 6) bottomAnchor];
    id v55 = [location[0] bottomAnchor];
    id v54 = [v56 constraintEqualToAnchor:];
    v71[3] = v54;
    id v53 = [v68 centerXAnchor];
    id v52 = [*((id *)v70 + 7) centerXAnchor];
    id v51 = [v53 constraintEqualToAnchor:];
    v71[4] = v51;
    id v50 = [v68 widthAnchor];
    id v49 = [*((id *)v70 + 7) widthAnchor];
    id v48 = [v50 constraintEqualToAnchor:];
    v71[5] = v48;
    id v47 = [v68 topAnchor];
    id v46 = [*((id *)v70 + 7) topAnchor];
    [v47 constraintEqualToAnchor:];
    v71[6] = v45;
    id v44 = [*((id *)v70 + 7) bottomAnchor];
    id v43 = [v68 bottomAnchor];
    id v42 = [v44 constraintEqualToAnchor:];
    v71[7] = v42;
    id v41 = [v67 centerXAnchor];
    id v40 = [*((id *)v70 + 8) centerXAnchor];
    id v39 = [v41 constraintEqualToAnchor:];
    v71[8] = v39;
    id v18 = [v67 widthAnchor];
    id v19 = [*((id *)v70 + 8) widthAnchor];
    id v20 = [v18 constraintEqualToAnchor:v19];
    v71[9] = v20;
    id v21 = [v67 topAnchor];
    id v22 = [*((id *)v70 + 8) topAnchor];
    id v23 = [v21 constraintEqualToAnchor:v22];
    v71[10] = v23;
    id v24 = [*((id *)v70 + 8) bottomAnchor];
    id v25 = [v67 bottomAnchor];
    id v26 = [v24 constraintEqualToAnchor:v25];
    v71[11] = v26;
    v27 = +[NSArray arrayWithObjects:v71 count:12];
    +[NSLayoutConstraint activateConstraints:v27];

    [*((id *)v70 + 5) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v70 + 6) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v70 + 7) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v70 + 8) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v70 + 5) addArrangedSubview:*((void *)v70 + 6)];
    [*((id *)v70 + 5) addArrangedSubview:*((void *)v70 + 7)];
    [*((id *)v70 + 5) addArrangedSubview:*((void *)v70 + 8)];
    [v70 addSubview:*((void *)v70 + 5)];
    [*((id *)v70 + 5) pinToEdges:v70];
    id v28 = objc_alloc((Class)UITapGestureRecognizer);
    id v29 = [v28 initWithTarget:v70 action:"tapped:"];
    v30 = (void *)*((void *)v70 + 9);
    *((void *)v70 + 9) = v29;

    id v31 = objc_alloc((Class)UITapGestureRecognizer);
    id v32 = [v31 initWithTarget:v70 action:"tapped:"];
    v33 = (void *)*((void *)v70 + 10);
    *((void *)v70 + 10) = v32;

    id v34 = objc_alloc((Class)UITapGestureRecognizer);
    id v35 = [v34 initWithTarget:v70 action:"tapped:"];
    v36 = (void *)*((void *)v70 + 11);
    *((void *)v70 + 11) = v35;

    [*((id *)v70 + 6) addGestureRecognizer:*((void *)v70 + 9)];
    [*((id *)v70 + 7) addGestureRecognizer:*((void *)v70 + 10)];
    [*((id *)v70 + 8) addGestureRecognizer:*((void *)v70 + 11)];
  }
  v37 = (BuddyPosedDeviceSelectionView *)v70;
  objc_storeStrong(&v67, 0);
  objc_storeStrong(&v68, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v70, 0);
  return v37;
}

- (void)didMoveToSuperview
{
  v13 = self;
  SEL v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)BuddyPosedDeviceSelectionView;
  [(BuddyPosedDeviceSelectionView *)&v11 didMoveToSuperview];
  v2 = v13;
  v3 = [(BuddyPosedDeviceSelectionView *)v13 leftContainer];
  v4 = [(BuddyPosedDeviceSelectionView *)v13 leftPosedView];
  [(BuddyPosedDeviceSelectionView *)v2 _updateViewContainerForAccessibilityOptions:v3 contents:v4];

  v5 = v13;
  v6 = [(BuddyPosedDeviceSelectionView *)v13 centerContainer];
  id v7 = [(BuddyPosedDeviceSelectionView *)v13 centerPosedView];
  [(BuddyPosedDeviceSelectionView *)v5 _updateViewContainerForAccessibilityOptions:v6 contents:v7];

  v8 = v13;
  id v9 = [(BuddyPosedDeviceSelectionView *)v13 rightContainer];
  v10 = [(BuddyPosedDeviceSelectionView *)v13 rightPosedView];
  [(BuddyPosedDeviceSelectionView *)v8 _updateViewContainerForAccessibilityOptions:v9 contents:v10];
}

- (void)tapped:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = location[0];
  id v4 = [location[0] view];
  [v3 locationInView:v4];
  double v6 = v5;
  id v7 = [(BuddyPosedDeviceSelectionView *)v17 leftPosedView];
  [(BuddyPosedDeviceSelectionItemView *)v7 contentContainerHeight];
  double v9 = v8;

  if (v6 >= v9)
  {
    v10 = (UIView *)[location[0] view];
    objc_super v11 = [(BuddyPosedDeviceSelectionView *)v17 leftContainer];

    if (v10 == v11)
    {
      [(BuddyPosedDeviceSelectionView *)v17 selectSegment:0];
    }
    else
    {
      SEL v12 = (UIView *)[location[0] view];
      v13 = [(BuddyPosedDeviceSelectionView *)v17 centerContainer];

      if (v12 == v13)
      {
        [(BuddyPosedDeviceSelectionView *)v17 selectSegment:1];
      }
      else
      {
        id v14 = (UIView *)[location[0] view];
        v15 = [(BuddyPosedDeviceSelectionView *)v17 rightContainer];

        if (v14 == v15) {
          [(BuddyPosedDeviceSelectionView *)v17 selectSegment:2];
        }
      }
    }
  }
  objc_storeStrong(location, 0);
}

- (void)selectSegment:(int64_t)a3
{
  id v3 = [(BuddyPosedDeviceSelectionView *)self leftPosedView];
  [(BuddyPosedDeviceSelectionItemView *)v3 setSelected:a3 == 0];

  id v4 = [(BuddyPosedDeviceSelectionView *)self centerPosedView];
  [(BuddyPosedDeviceSelectionItemView *)v4 setSelected:a3 == 1];

  double v5 = [(BuddyPosedDeviceSelectionView *)self rightPosedView];
  [(BuddyPosedDeviceSelectionItemView *)v5 setSelected:a3 == 2];

  double v6 = [(BuddyPosedDeviceSelectionView *)self leftContainer];
  id v7 = [(BuddyPosedDeviceSelectionView *)self leftPosedView];
  [(BuddyPosedDeviceSelectionView *)self _updateViewContainerForAccessibilityOptions:v6 contents:v7];

  double v8 = [(BuddyPosedDeviceSelectionView *)self centerContainer];
  double v9 = [(BuddyPosedDeviceSelectionView *)self centerPosedView];
  [(BuddyPosedDeviceSelectionView *)self _updateViewContainerForAccessibilityOptions:v8 contents:v9];

  v10 = [(BuddyPosedDeviceSelectionView *)self rightContainer];
  objc_super v11 = [(BuddyPosedDeviceSelectionView *)self rightPosedView];
  [(BuddyPosedDeviceSelectionView *)self _updateViewContainerForAccessibilityOptions:v10 contents:v11];

  SEL v12 = [(BuddyPosedDeviceSelectionView *)self delegate];
  [(BuddyPosedDeviceSelectionDelegate *)v12 didSelectSegment:a3];
}

+ (id)selectionItemWithImageName:(id)a3 symbolName:(id)a4 segment:(int64_t)a5 text:(id)a6 hostViewLayoutMargins:(NSDirectionalEdgeInsets)a7 posedDevicesPadding:(double)a8
{
  NSDirectionalEdgeInsets v22 = a7;
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  int64_t v19 = a5;
  id v18 = 0;
  objc_storeStrong(&v18, a6);
  v17[1] = *(id *)&a8;
  SEL v12 = [BuddyPosedDeviceSelectionItemAccessoryView alloc];
  v17[0] = [(BuddyPosedDeviceSelectionItemAccessoryView *)v12 initWithSymbol:v20 text:v18];
  id v16 = +[UIImage imageNamed:location[0]];
  v13 = [BuddyPosedDeviceSelectionItemView alloc];
  id v14 = -[BuddyPosedDeviceSelectionItemView initWithContentImage:selectionSegment:accessoryView:hostViewLayoutMargins:posedDevicesPadding:](v13, "initWithContentImage:selectionSegment:accessoryView:hostViewLayoutMargins:posedDevicesPadding:", v16, v19, v17[0], v22.top, v22.leading, v22.bottom, v22.trailing, a8);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);

  return v14;
}

- (void)_updateViewContainerForAccessibilityOptions:(id)a3 contents:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  [location[0] setIsAccessibilityElement:1];
  [location[0] setAccessibilityTraits:UIAccessibilityTraitButton];
  if ([v8 selected])
  {
    id v5 = location[0];
    unint64_t v6 = (unint64_t)[location[0] accessibilityTraits];
    [v5 setAccessibilityTraits:v6 | UIAccessibilityTraitSelected];
  }
  id v7 = [v8 title];
  [location[0] setAccessibilityLabel:v7];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (BuddyPosedDeviceSelectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BuddyPosedDeviceSelectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BuddyPosedDeviceSelectionItemView)leftPosedView
{
  return self->_leftPosedView;
}

- (void)setLeftPosedView:(id)a3
{
}

- (BuddyPosedDeviceSelectionItemView)centerPosedView
{
  return self->_centerPosedView;
}

- (void)setCenterPosedView:(id)a3
{
}

- (BuddyPosedDeviceSelectionItemView)rightPosedView
{
  return self->_rightPosedView;
}

- (void)setRightPosedView:(id)a3
{
}

- (UIStackView)mainContainer
{
  return self->_mainContainer;
}

- (void)setMainContainer:(id)a3
{
}

- (UIView)leftContainer
{
  return self->_leftContainer;
}

- (void)setLeftContainer:(id)a3
{
}

- (UIView)centerContainer
{
  return self->_centerContainer;
}

- (void)setCenterContainer:(id)a3
{
}

- (UIView)rightContainer
{
  return self->_rightContainer;
}

- (void)setRightContainer:(id)a3
{
}

- (UITapGestureRecognizer)leftTap
{
  return self->_leftTap;
}

- (void)setLeftTap:(id)a3
{
}

- (UITapGestureRecognizer)centerTap
{
  return self->_centerTap;
}

- (void)setCenterTap:(id)a3
{
}

- (UITapGestureRecognizer)rightTap
{
  return self->_rightTap;
}

- (void)setRightTap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
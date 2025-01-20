@interface BKUIJindoContainerScrollview
- (BKUIButtonTray)buttonTray;
- (BKUIJindoContainerScrollview)initWithFrame:(CGRect)a3 buttonTray:(id)a4;
- (BKUIPearlInstructionView)animatingInstructionView;
- (BKUIPearlInstructionView)instructionView;
- (BOOL)showsVerticalScrollIndicator;
- (NSLayoutConstraint)buttonTrayTopAnchor;
- (NSLayoutConstraint)horizontalConstraint;
- (NSLayoutConstraint)instructionViewTopConstraint;
- (NSLayoutConstraint)pinButtonTrayToScrollViewBottomConstraint;
- (NSLayoutConstraint)topToSuperViewConstraint;
- (UIScrollView)scrollview;
- (UIView)scrollContentView;
- (int64_t)indicatorStyle;
- (void)setAnimatingInstructionView:(id)a3;
- (void)setButtonTray:(id)a3;
- (void)setButtonTrayTopAnchor:(id)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setHorizontalConstraint:(id)a3;
- (void)setIndicatorStyle:(int64_t)a3;
- (void)setInstructionView:(id)a3;
- (void)setInstructionViewTopConstraint:(id)a3;
- (void)setPinButtonTrayToScrollViewBottomConstraint:(id)a3;
- (void)setScrollContentView:(id)a3;
- (void)setScrollview:(id)a3;
- (void)setShowsVerticalScrollIndicator:(BOOL)a3;
- (void)setTopToSuperViewConstraint:(id)a3;
@end

@implementation BKUIJindoContainerScrollview

- (BKUIJindoContainerScrollview)initWithFrame:(CGRect)a3 buttonTray:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v79[4] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v76.receiver = self;
  v76.super_class = (Class)BKUIJindoContainerScrollview;
  v11 = -[BKUIJindoContainerScrollview initWithFrame:](&v76, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42DB0]), "initWithFrame:", x, y, width, height);
    scrollview = v11->_scrollview;
    v11->_scrollview = (UIScrollView *)v12;

    [(UIScrollView *)v11->_scrollview setContentInsetAdjustmentBehavior:2];
    [(UIScrollView *)v11->_scrollview setTranslatesAutoresizingMaskIntoConstraints:0];
    [(BKUIJindoContainerScrollview *)v11 addSubview:v11->_scrollview];
    id v14 = objc_alloc(MEMORY[0x1E4F42FF0]);
    uint64_t v15 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    scrollContentView = v11->_scrollContentView;
    v11->_scrollContentView = (UIView *)v15;

    [(UIView *)v11->_scrollContentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIScrollView *)v11->_scrollview addSubview:v11->_scrollContentView];
    v17 = [(UIView *)v11->_scrollContentView centerXAnchor];
    [(BKUIJindoContainerScrollview *)v11 centerXAnchor];
    v18 = id v75 = v10;
    uint64_t v19 = [v17 constraintEqualToAnchor:v18];
    id obj = a4;
    horizontalConstraint = v11->_horizontalConstraint;
    v11->_horizontalConstraint = (NSLayoutConstraint *)v19;

    v64 = (void *)MEMORY[0x1E4F28DC8];
    v70 = [(UIView *)v11->_scrollContentView topAnchor];
    v67 = [(UIScrollView *)v11->_scrollview topAnchor];
    v21 = [v70 constraintEqualToAnchor:v67];
    v79[0] = v21;
    v22 = [(UIView *)v11->_scrollContentView widthAnchor];
    v23 = [(UIScrollView *)v11->_scrollview widthAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v79[1] = v24;
    v25 = [(UIView *)v11->_scrollContentView bottomAnchor];
    v26 = [(UIScrollView *)v11->_scrollview bottomAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v79[2] = v27;
    v79[3] = v11->_horizontalConstraint;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:4];
    [v64 activateConstraints:v28];

    v29 = objc_alloc_init(BKUIPearlInstructionView);
    instructionView = v11->_instructionView;
    v11->_instructionView = v29;

    [(BKUIPearlInstructionView *)v11->_instructionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v11->_scrollContentView addSubview:v11->_instructionView];
    v60 = (void *)MEMORY[0x1E4F28DC8];
    v71 = [(BKUIPearlInstructionView *)v11->_instructionView topAnchor];
    v68 = [(UIView *)v11->_scrollContentView topAnchor];
    v65 = [v71 constraintEqualToAnchor:v68];
    v78[0] = v65;
    v62 = [(BKUIPearlInstructionView *)v11->_instructionView leadingAnchor];
    v31 = [(UIView *)v11->_scrollContentView leadingAnchor];
    v32 = [v62 constraintEqualToAnchor:v31];
    v78[1] = v32;
    v33 = [(BKUIPearlInstructionView *)v11->_instructionView trailingAnchor];
    v34 = [(UIView *)v11->_scrollContentView trailingAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    v78[2] = v35;
    v36 = [(BKUIPearlInstructionView *)v11->_instructionView bottomAnchor];
    v37 = [(UIView *)v11->_scrollContentView bottomAnchor];
    v38 = [v36 constraintLessThanOrEqualToAnchor:v37];
    v78[3] = v38;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:4];
    [v60 activateConstraints:v39];

    objc_storeStrong((id *)&v11->_buttonTray, obj);
    [(BKUIButtonTray *)v11->_buttonTray setTranslatesAutoresizingMaskIntoConstraints:0];
    [(BKUIJindoContainerScrollview *)v11 addSubview:v11->_buttonTray];
    v40 = [(UIScrollView *)v11->_scrollview bottomAnchor];
    v41 = [(BKUIButtonTray *)v11->_buttonTray topAnchor];
    uint64_t v42 = [v40 constraintEqualToAnchor:v41];
    buttonTrayTopAnchor = v11->_buttonTrayTopAnchor;
    v11->_buttonTrayTopAnchor = (NSLayoutConstraint *)v42;

    v58 = (void *)MEMORY[0x1E4F28DC8];
    id obja = [(UIScrollView *)v11->_scrollview topAnchor];
    v72 = [(BKUIJindoContainerScrollview *)v11 topAnchor];
    v69 = [obja constraintEqualToAnchor:v72];
    v77[0] = v69;
    v66 = [(UIScrollView *)v11->_scrollview leadingAnchor];
    v63 = [(BKUIJindoContainerScrollview *)v11 leadingAnchor];
    v61 = [v66 constraintEqualToAnchor:v63];
    v77[1] = v61;
    v59 = [(UIScrollView *)v11->_scrollview trailingAnchor];
    v57 = [(BKUIJindoContainerScrollview *)v11 trailingAnchor];
    v56 = [v59 constraintEqualToAnchor:v57];
    v77[2] = v56;
    v77[3] = v11->_buttonTrayTopAnchor;
    v55 = [(BKUIButtonTray *)v11->_buttonTray bottomAnchor];
    v44 = [(BKUIJindoContainerScrollview *)v11 bottomAnchor];
    v45 = [v55 constraintEqualToAnchor:v44];
    v77[4] = v45;
    v46 = [(BKUIButtonTray *)v11->_buttonTray leadingAnchor];
    v47 = [(UIView *)v11->_scrollContentView leadingAnchor];
    v48 = [v46 constraintEqualToAnchor:v47];
    v77[5] = v48;
    v49 = [(BKUIButtonTray *)v11->_buttonTray trailingAnchor];
    v50 = [(UIView *)v11->_scrollContentView trailingAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    v77[6] = v51;
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:7];
    [v58 activateConstraints:v52];

    id v10 = v75;
    -[UIScrollView setContentSize:](v11->_scrollview, "setContentSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    [(UIScrollView *)v11->_scrollview setIndicatorStyle:2];
    [(UIScrollView *)v11->_scrollview setContentInsetAdjustmentBehavior:2];
    [(BKUIJindoContainerScrollview *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    v53 = [(BKUIJindoContainerScrollview *)v11 layer];
    [v53 setMasksToBounds:1];
  }
  return v11;
}

- (void)setIndicatorStyle:(int64_t)a3
{
  id v4 = [(BKUIJindoContainerScrollview *)self scrollview];
  [v4 setIndicatorStyle:a3];
}

- (int64_t)indicatorStyle
{
  v2 = [(BKUIJindoContainerScrollview *)self scrollview];
  int64_t v3 = [v2 indicatorStyle];

  return v3;
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BKUIJindoContainerScrollview *)self scrollview];
  [v4 setShowsVerticalScrollIndicator:v3];
}

- (BOOL)showsVerticalScrollIndicator
{
  v2 = [(BKUIJindoContainerScrollview *)self scrollview];
  char v3 = [v2 showsVerticalScrollIndicator];

  return v3;
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  id v7 = [(BKUIJindoContainerScrollview *)self scrollview];
  objc_msgSend(v7, "setContentOffset:animated:", v4, x, y);
}

- (UIView)scrollContentView
{
  return self->_scrollContentView;
}

- (void)setScrollContentView:(id)a3
{
}

- (BKUIPearlInstructionView)instructionView
{
  return self->_instructionView;
}

- (void)setInstructionView:(id)a3
{
}

- (BKUIPearlInstructionView)animatingInstructionView
{
  return self->_animatingInstructionView;
}

- (void)setAnimatingInstructionView:(id)a3
{
}

- (BKUIButtonTray)buttonTray
{
  return self->_buttonTray;
}

- (void)setButtonTray:(id)a3
{
}

- (NSLayoutConstraint)pinButtonTrayToScrollViewBottomConstraint
{
  return self->_pinButtonTrayToScrollViewBottomConstraint;
}

- (void)setPinButtonTrayToScrollViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)horizontalConstraint
{
  return self->_horizontalConstraint;
}

- (void)setHorizontalConstraint:(id)a3
{
}

- (NSLayoutConstraint)instructionViewTopConstraint
{
  return self->_instructionViewTopConstraint;
}

- (void)setInstructionViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)buttonTrayTopAnchor
{
  return self->_buttonTrayTopAnchor;
}

- (void)setButtonTrayTopAnchor:(id)a3
{
}

- (NSLayoutConstraint)topToSuperViewConstraint
{
  return self->_topToSuperViewConstraint;
}

- (void)setTopToSuperViewConstraint:(id)a3
{
}

- (UIScrollView)scrollview
{
  return self->_scrollview;
}

- (void)setScrollview:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollview, 0);
  objc_storeStrong((id *)&self->_topToSuperViewConstraint, 0);
  objc_storeStrong((id *)&self->_buttonTrayTopAnchor, 0);
  objc_storeStrong((id *)&self->_instructionViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_horizontalConstraint, 0);
  objc_storeStrong((id *)&self->_pinButtonTrayToScrollViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_buttonTray, 0);
  objc_storeStrong((id *)&self->_animatingInstructionView, 0);
  objc_storeStrong((id *)&self->_instructionView, 0);

  objc_storeStrong((id *)&self->_scrollContentView, 0);
}

@end
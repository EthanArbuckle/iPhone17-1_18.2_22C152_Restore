@interface BKUIContainerScrollView
- (BKUIButtonTray)buttonTray;
- (BKUIContainerScrollView)initWithFrame:(CGRect)a3 buttonTray:(id)a4;
- (BKUIPearlInstructionView)animatingInstructionView;
- (BKUIPearlInstructionView)instructionView;
- (NSLayoutConstraint)buttonTrayTopAnchor;
- (NSLayoutConstraint)horizontalConstraint;
- (NSLayoutConstraint)instructionViewTopConstraint;
- (NSLayoutConstraint)pinButtonTrayToScrollViewBottomConstraint;
- (NSLayoutConstraint)topToSuperViewConstraint;
- (UIView)scrollContentView;
- (void)setAnimatingInstructionView:(id)a3;
- (void)setButtonTray:(id)a3;
- (void)setButtonTrayTopAnchor:(id)a3;
- (void)setHorizontalConstraint:(id)a3;
- (void)setInstructionView:(id)a3;
- (void)setInstructionViewTopConstraint:(id)a3;
- (void)setPinButtonTrayToScrollViewBottomConstraint:(id)a3;
- (void)setScrollContentView:(id)a3;
- (void)setTopToSuperViewConstraint:(id)a3;
@end

@implementation BKUIContainerScrollView

- (BKUIContainerScrollView)initWithFrame:(CGRect)a3 buttonTray:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v75[4] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v72.receiver = self;
  v72.super_class = (Class)BKUIContainerScrollView;
  v11 = -[BKUIContainerScrollView initWithFrame:](&v72, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F42FF0]);
    uint64_t v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    scrollContentView = v11->_scrollContentView;
    v11->_scrollContentView = (UIView *)v13;

    [(UIView *)v11->_scrollContentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(BKUIContainerScrollView *)v11 addSubview:v11->_scrollContentView];
    v15 = [(UIView *)v11->_scrollContentView centerXAnchor];
    [(BKUIContainerScrollView *)v11 centerXAnchor];
    v16 = id obj = a4;
    uint64_t v17 = [v15 constraintEqualToAnchor:v16];
    horizontalConstraint = v11->_horizontalConstraint;
    v11->_horizontalConstraint = (NSLayoutConstraint *)v17;

    v57 = (void *)MEMORY[0x1E4F28DC8];
    v63 = [(UIView *)v11->_scrollContentView topAnchor];
    v61 = [(BKUIContainerScrollView *)v11 topAnchor];
    v59 = [v63 constraintEqualToAnchor:v61];
    v75[0] = v59;
    v19 = [(UIView *)v11->_scrollContentView widthAnchor];
    v20 = [(BKUIContainerScrollView *)v11 widthAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v75[1] = v21;
    v22 = [(UIView *)v11->_scrollContentView bottomAnchor];
    [(BKUIContainerScrollView *)v11 bottomAnchor];
    v23 = id v67 = v10;
    v24 = [v22 constraintEqualToAnchor:v23];
    v75[2] = v24;
    v75[3] = v11->_horizontalConstraint;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:4];
    [v57 activateConstraints:v25];

    v26 = objc_alloc_init(BKUIPearlInstructionView);
    instructionView = v11->_instructionView;
    v11->_instructionView = v26;

    [(BKUIPearlInstructionView *)v11->_instructionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v11->_scrollContentView addSubview:v11->_instructionView];
    v28 = [(BKUIPearlInstructionView *)v11->_instructionView topAnchor];
    v29 = [(UIView *)v11->_scrollContentView topAnchor];
    uint64_t v30 = [v28 constraintEqualToAnchor:v29];
    instructionViewTopConstraint = v11->_instructionViewTopConstraint;
    v11->_instructionViewTopConstraint = (NSLayoutConstraint *)v30;

    objc_storeStrong((id *)&v11->_buttonTray, obj);
    [(BKUIButtonTray *)v11->_buttonTray setTranslatesAutoresizingMaskIntoConstraints:0];
    v32 = [(BKUIPearlInstructionView *)v11->_instructionView bottomAnchor];
    v33 = [(BKUIButtonTray *)v11->_buttonTray topAnchor];
    uint64_t v34 = [v32 constraintLessThanOrEqualToAnchor:v33 constant:-25.0];
    buttonTrayTopAnchor = v11->_buttonTrayTopAnchor;
    v11->_buttonTrayTopAnchor = (NSLayoutConstraint *)v34;

    v64 = (void *)MEMORY[0x1E4F28DC8];
    v74[0] = v11->_instructionViewTopConstraint;
    v36 = [(BKUIPearlInstructionView *)v11->_instructionView leadingAnchor];
    v37 = [(UIView *)v11->_scrollContentView leadingAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    v74[1] = v38;
    v39 = [(BKUIPearlInstructionView *)v11->_instructionView trailingAnchor];
    v40 = [(UIView *)v11->_scrollContentView trailingAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    v74[2] = v41;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:3];
    [v64 activateConstraints:v42];

    [(UIView *)v11->_scrollContentView addSubview:v11->_buttonTray];
    v65 = [(UIView *)v11->_scrollContentView heightAnchor];
    v62 = [(BKUIContainerScrollView *)v11 heightAnchor];
    uint64_t v43 = [v65 constraintGreaterThanOrEqualToAnchor:v62];
    pinButtonTrayToScrollViewBottomConstraint = v11->_pinButtonTrayToScrollViewBottomConstraint;
    v11->_pinButtonTrayToScrollViewBottomConstraint = (NSLayoutConstraint *)v43;

    v58 = (void *)MEMORY[0x1E4F28DC8];
    v60 = [(BKUIButtonTray *)v11->_buttonTray bottomAnchor];
    v45 = [(UIView *)v11->_scrollContentView bottomAnchor];
    v46 = [v60 constraintEqualToAnchor:v45];
    v73[0] = v46;
    v73[1] = v11->_pinButtonTrayToScrollViewBottomConstraint;
    v47 = [(BKUIButtonTray *)v11->_buttonTray leadingAnchor];
    v48 = [(UIView *)v11->_scrollContentView leadingAnchor];
    v49 = [v47 constraintEqualToAnchor:v48];
    v73[2] = v49;
    v50 = [(BKUIButtonTray *)v11->_buttonTray trailingAnchor];
    v51 = [(UIView *)v11->_scrollContentView trailingAnchor];
    v52 = [v50 constraintEqualToAnchor:v51];
    v73[3] = v52;
    v73[4] = v11->_buttonTrayTopAnchor;
    v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:5];
    [v58 activateConstraints:v53];

    id v10 = v67;
    v71.receiver = v11;
    v71.super_class = (Class)BKUIContainerScrollView;
    [(BKUIContainerScrollView *)&v71 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v54 = *MEMORY[0x1E4F1DB30];
    double v55 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    v70.receiver = v11;
    v70.super_class = (Class)BKUIContainerScrollView;
    -[BKUIContainerScrollView setContentSize:](&v70, sel_setContentSize_, v54, v55);
    v69.receiver = v11;
    v69.super_class = (Class)BKUIContainerScrollView;
    [(BKUIContainerScrollView *)&v69 setIndicatorStyle:2];
    v68.receiver = v11;
    v68.super_class = (Class)BKUIContainerScrollView;
    [(BKUIContainerScrollView *)&v68 setContentInsetAdjustmentBehavior:2];
  }

  return v11;
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

- (void).cxx_destruct
{
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
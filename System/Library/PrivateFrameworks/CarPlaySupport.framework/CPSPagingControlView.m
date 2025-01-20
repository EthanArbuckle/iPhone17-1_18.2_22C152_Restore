@interface CPSPagingControlView
- (CPSPageControlling)pagingDelegate;
- (CPSPagingControlView)initWithFrame:(CGRect)a3;
- (NSNumberFormatter)numberFormatter;
- (UIButton)nextButton;
- (UIButton)previousButton;
- (UILabel)positionLabel;
- (id)_linearFocusItems;
- (unint64_t)pageCount;
- (unint64_t)pageIndex;
- (void)_handleNextButton:(id)a3;
- (void)_handlePreviousButton:(id)a3;
- (void)_invokeDelegateForPageIndex:(unint64_t)a3;
- (void)_update;
- (void)_updateImages;
- (void)enablePageControlsIfNecessary;
- (void)setNextButton:(id)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setPageCount:(unint64_t)a3;
- (void)setPageIndex:(unint64_t)a3;
- (void)setPagingDelegate:(id)a3;
- (void)setPositionLabel:(id)a3;
- (void)setPreviousButton:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSPagingControlView

- (CPSPagingControlView)initWithFrame:(CGRect)a3
{
  v57[2] = *MEMORY[0x263EF8340];
  CGRect v54 = a3;
  SEL v52 = a2;
  v53 = 0;
  v51.receiver = self;
  v51.super_class = (Class)CPSPagingControlView;
  v53 = -[CPSPagingControlView initWithFrame:](&v51, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v53, v53);
  if (v53)
  {
    [(CPSPagingControlView *)v53 setTranslatesAutoresizingMaskIntoConstraints:0];
    v53->_pageIndex = 0;
    v53->_pageCount = 0;
    v50 = +[CPSPagingControlButton buttonWithType:](CPSPagingControlButton, "buttonWithType:");
    [(CPSPagingControlButton *)v50 setTranslatesAutoresizingMaskIntoConstraints:0];
    -[CPSPagingControlButton addTarget:action:forControlEvents:](v50, "addTarget:action:forControlEvents:", v53, sel__handlePreviousButton_);
    id v7 = CPSLocalizedStringForKey(@"MAPS_PREVIOUS");
    v57[0] = v7;
    id v6 = CPSLocalizedStringForKey(@"MAPS_LEFT");
    v57[1] = v6;
    id v5 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v57);
    -[CPSPagingControlButton setAccessibilityUserInputLabels:](v50, "setAccessibilityUserInputLabels:");

    [(CPSPagingControlView *)v53 setPreviousButton:v50];
    [(CPSPagingControlView *)v53 addSubview:v50];
    v49 = +[CPSPagingControlButton buttonWithType:0];
    [(CPSPagingControlButton *)v49 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPSPagingControlButton *)v49 addTarget:v53 action:sel__handleNextButton_ forControlEvents:0x2000];
    id v10 = CPSLocalizedStringForKey(@"MAPS_NEXT");
    v56[0] = v10;
    id v9 = CPSLocalizedStringForKey(@"MAPS_RIGHT");
    v56[1] = v9;
    id v8 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
    -[CPSPagingControlButton setAccessibilityUserInputLabels:](v49, "setAccessibilityUserInputLabels:");

    [(CPSPagingControlView *)v53 setNextButton:v49];
    [(CPSPagingControlView *)v53 addSubview:v49];
    id v48 = objc_alloc_init(MEMORY[0x263F1C768]);
    [v48 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v11 = v48;
    id v12 = (id)[MEMORY[0x263F1C658] monospacedDigitSystemFontOfSize:12.0 weight:*MEMORY[0x263F1D338]];
    objc_msgSend(v11, "setFont:");

    id v13 = v48;
    id v14 = (id)[MEMORY[0x263F1C550] labelColor];
    objc_msgSend(v13, "setTextColor:");

    objc_msgSend(v48, "setTextAlignment:");
    [(CPSPagingControlView *)v53 setPositionLabel:v48];
    [(CPSPagingControlView *)v53 addSubview:v48];
    v15 = (void *)MEMORY[0x263F08938];
    id v46 = (id)[(CPSPagingControlView *)v53 heightAnchor];
    id v45 = (id)objc_msgSend(v46, "constraintEqualToConstant:");
    v55[0] = v45;
    id v44 = (id)[(CPSPagingControlButton *)v50 centerYAnchor];
    id v43 = (id)[(CPSPagingControlView *)v53 centerYAnchor];
    id v42 = (id)objc_msgSend(v44, "constraintEqualToAnchor:");
    v55[1] = v42;
    id v41 = (id)[v48 centerYAnchor];
    id v40 = (id)[(CPSPagingControlView *)v53 centerYAnchor];
    id v39 = (id)objc_msgSend(v41, "constraintEqualToAnchor:");
    v55[2] = v39;
    id v38 = (id)[(CPSPagingControlButton *)v49 centerYAnchor];
    id v37 = (id)[(CPSPagingControlView *)v53 centerYAnchor];
    id v36 = (id)objc_msgSend(v38, "constraintEqualToAnchor:");
    v55[3] = v36;
    id v35 = (id)[(CPSPagingControlButton *)v50 leftAnchor];
    id v34 = (id)[(CPSPagingControlView *)v53 leftAnchor];
    id v33 = (id)objc_msgSend(v35, "constraintEqualToAnchor:constant:");
    v55[4] = v33;
    id v32 = (id)[(CPSPagingControlView *)v53 rightAnchor];
    id v31 = (id)[(CPSPagingControlButton *)v49 rightAnchor];
    id v30 = (id)objc_msgSend(v32, "constraintEqualToAnchor:constant:", 20.0);
    v55[5] = v30;
    id v29 = (id)[v48 centerXAnchor];
    id v28 = (id)[(CPSPagingControlView *)v53 centerXAnchor];
    id v27 = (id)objc_msgSend(v29, "constraintEqualToAnchor:");
    v55[6] = v27;
    id v26 = (id)[(CPSPagingControlButton *)v50 rightAnchor];
    id v25 = (id)[v48 leftAnchor];
    id v24 = (id)objc_msgSend(v26, "constraintLessThanOrEqualToAnchor:constant:", -2.0);
    v55[7] = v24;
    id v23 = (id)[(CPSPagingControlButton *)v49 leftAnchor];
    id v22 = (id)[v48 rightAnchor];
    id v21 = (id)objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:constant:", 2.0);
    v55[8] = v21;
    id v20 = (id)[(CPSPagingControlButton *)v50 widthAnchor];
    id v19 = (id)[v20 constraintEqualToConstant:22.0];
    v55[9] = v19;
    id v18 = (id)[(CPSPagingControlButton *)v49 widthAnchor];
    id v17 = (id)[v18 constraintEqualToConstant:22.0];
    v55[10] = v17;
    id v16 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:11];
    objc_msgSend(v15, "activateConstraints:");

    id v47 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v47 setNumberStyle:1];
    [v47 setUsesGroupingSeparator:1];
    [(CPSPagingControlView *)v53 setNumberFormatter:v47];
    [(CPSPagingControlView *)v53 _updateImages];
    objc_storeStrong(&v47, 0);
    objc_storeStrong(&v48, 0);
    objc_storeStrong((id *)&v49, 0);
    objc_storeStrong((id *)&v50, 0);
  }
  v4 = v53;
  objc_storeStrong((id *)&v53, 0);
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSPagingControlView;
  [(CPSPagingControlView *)&v3 traitCollectionDidChange:location[0]];
  [(CPSPagingControlView *)v5 _updateImages];
  objc_storeStrong(location, 0);
}

- (void)_updateImages
{
  id v9 = self;
  v8[1] = (id)a2;
  v2 = (void *)MEMORY[0x263F1C6B0];
  id v4 = CPSFrameworkBundle();
  id v3 = (id)[(CPSPagingControlView *)v9 traitCollection];
  v8[0] = (id)objc_msgSend(v2, "imageNamed:inBundle:compatibleWithTraitCollection:", @"LeftChevron", v4);

  id v5 = [(CPSPagingControlView *)v9 previousButton];
  -[UIButton setImage:forState:](v5, "setImage:forState:", v8[0]);

  id v7 = (id)[v8[0] imageWithHorizontallyFlippedOrientation];
  id v6 = [(CPSPagingControlView *)v9 nextButton];
  [(UIButton *)v6 setImage:v7 forState:0];

  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);
}

- (void)_update
{
  id v28 = self;
  v27[1] = (id)a2;
  uint64_t v21 = MEMORY[0x263EF8330];
  int v22 = -1073741824;
  int v23 = 0;
  id v24 = __31__CPSPagingControlView__update__block_invoke;
  id v25 = &unk_2648A56E0;
  id v26 = self;
  v27[0] = (id)MEMORY[0x230F4C6B0](&v21);
  id v6 = NSString;
  id v9 = CPSLocalizedStringForKey(@"POSITION_IN_TRIP_PREVIEWS_FORMAT_%@_%@");
  id v8 = (id)(*((uint64_t (**)(id, unint64_t))v27[0] + 2))(v27[0], [(CPSPagingControlView *)v28 pageIndex] + 1);
  id v7 = (id)(*((uint64_t (**)(id, unint64_t))v27[0] + 2))(v27[0], [(CPSPagingControlView *)v28 pageCount]);
  id location = (id)objc_msgSend(v6, "localizedStringWithFormat:", v9, v8, v7);

  id v10 = [(CPSPagingControlView *)v28 positionLabel];
  [(UILabel *)v10 setText:location];

  unint64_t v19 = [(CPSPagingControlView *)v28 pageIndex];
  unint64_t v18 = [(CPSPagingControlView *)v28 pageCount];
  id v11 = [(CPSPagingControlView *)v28 previousButton];
  [(UIButton *)v11 setEnabled:v19 != 0];

  id v12 = [(CPSPagingControlView *)v28 nextButton];
  BOOL v13 = 0;
  if (v18 > 1) {
    BOOL v13 = v19 < v18 - 1;
  }
  [(UIButton *)v12 setEnabled:v13];

  id v4 = [(CPSPagingControlView *)v28 previousButton];
  char v16 = 0;
  LOBYTE(v5) = 0;
  if ([(UIButton *)v4 isFocused])
  {
    id v17 = [(CPSPagingControlView *)v28 previousButton];
    char v16 = 1;
    int v5 = [(UIButton *)v17 isEnabled] ^ 1;
  }
  if (v16) {

  }
  if (v5) {
    [(CPSPagingControlView *)v28 setNeedsFocusUpdate];
  }
  v2 = [(CPSPagingControlView *)v28 nextButton];
  char v14 = 0;
  LOBYTE(v3) = 0;
  if ([(UIButton *)v2 isFocused])
  {
    v15 = [(CPSPagingControlView *)v28 nextButton];
    char v14 = 1;
    int v3 = [(UIButton *)v15 isEnabled] ^ 1;
  }
  if (v14) {

  }
  if (v3) {
    [(CPSPagingControlView *)v28 setNeedsFocusUpdate];
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v27, 0);
  objc_storeStrong((id *)&v26, 0);
}

id __31__CPSPagingControlView__update__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (id)[*(id *)(a1 + 32) numberFormatter];
  id v3 = (id)[NSNumber numberWithUnsignedInteger:a2];
  id v5 = (id)objc_msgSend(v4, "stringFromNumber:");

  return v5;
}

- (void)enablePageControlsIfNecessary
{
  unint64_t v6 = [(CPSPagingControlView *)self pageIndex];
  unint64_t v5 = [(CPSPagingControlView *)self pageCount];
  v2 = [(CPSPagingControlView *)self previousButton];
  [(UIButton *)v2 setEnabled:v6 != 0];

  id v3 = [(CPSPagingControlView *)self nextButton];
  BOOL v4 = 0;
  if (v5 > 1) {
    BOOL v4 = v6 < v5 - 1;
  }
  -[UIButton setEnabled:](v3, "setEnabled:", v4, v2);
}

- (void)setPageIndex:(unint64_t)a3
{
  self->_pageIndex = a3;
  [(CPSPagingControlView *)self _update];
}

- (void)setPageCount:(unint64_t)a3
{
  self->_pageCount = a3;
  [(CPSPagingControlView *)self _update];
}

- (void)_handlePreviousButton:(id)a3
{
  unint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v4 = [(CPSPagingControlView *)v6 pageIndex];
  if (v4) {
    uint64_t v3 = v4 - 1;
  }
  else {
    uint64_t v3 = 0;
  }
  [(CPSPagingControlView *)v6 setPageIndex:v3];
  [(CPSPagingControlView *)v6 _invokeDelegateForPageIndex:v3];
  objc_storeStrong(location, 0);
}

- (void)_handleNextButton:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v5 = [(CPSPagingControlView *)v7 pageIndex];
  if (v5 >= [(CPSPagingControlView *)v7 pageCount] - 1) {
    unint64_t v3 = v5;
  }
  else {
    unint64_t v3 = v5 + 1;
  }
  unint64_t v4 = v3;
  -[CPSPagingControlView setPageIndex:](v7, "setPageIndex:", v3, v3);
  [(CPSPagingControlView *)v7 _invokeDelegateForPageIndex:v4];
  objc_storeStrong(location, 0);
}

- (void)_invokeDelegateForPageIndex:(unint64_t)a3
{
  unint64_t v4 = [(CPSPagingControlView *)self pagingDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    unint64_t v3 = [(CPSPagingControlView *)self pagingDelegate];
    [(CPSPageControlling *)v3 pagingControlView:self didSelectPageIndex:a3];
  }
}

- (id)_linearFocusItems
{
  id v11 = self;
  v10[1] = (id)a2;
  v10[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  id v8 = [(CPSPagingControlView *)v11 previousButton];
  char v9 = [(UIButton *)v8 isEnabled];

  if (v9)
  {
    id v7 = [(CPSPagingControlView *)v11 previousButton];
    objc_msgSend(v10[0], "addObject:");
  }
  char v5 = [(CPSPagingControlView *)v11 nextButton];
  char v6 = [(UIButton *)v5 isEnabled];

  if (v6)
  {
    unint64_t v4 = [(CPSPagingControlView *)v11 nextButton];
    objc_msgSend(v10[0], "addObject:");
  }
  id v3 = v10[0];
  objc_storeStrong(v10, 0);

  return v3;
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (UIButton)previousButton
{
  return self->_previousButton;
}

- (void)setPreviousButton:(id)a3
{
}

- (UIButton)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
}

- (CPSPageControlling)pagingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pagingDelegate);

  return (CPSPageControlling *)WeakRetained;
}

- (void)setPagingDelegate:(id)a3
{
}

- (UILabel)positionLabel
{
  return self->_positionLabel;
}

- (void)setPositionLabel:(id)a3
{
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
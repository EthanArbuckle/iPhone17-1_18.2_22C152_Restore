@interface CPSPanView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CPSPanButton)panDownButton;
- (CPSPanButton)panLeftButton;
- (CPSPanButton)panRightButton;
- (CPSPanButton)panUpButton;
- (CPSPanView)initWithFrame:(CGRect)a3;
- (CPSPanViewDelegate)delegate;
- (double)sideButtonTopInset;
- (void)_handleButtonTapped:(id)a3;
- (void)_handleLongPressGesture:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CPSPanView

- (CPSPanView)initWithFrame:(CGRect)a3
{
  v132[1] = *MEMORY[0x263EF8340];
  CGRect v126 = a3;
  SEL v124 = a2;
  id v125 = 0;
  v123.receiver = self;
  v123.super_class = (Class)CPSPanView;
  id v125 = -[CPSPanView initWithFrame:](&v123, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&v125, v125);
  if (v125)
  {
    [v125 setTranslatesAutoresizingMaskIntoConstraints:0];
    v3 = -[CPSPanButton initWithDirection:]([CPSPanButton alloc], "initWithDirection:");
    v4 = (void *)*((void *)v125 + 51);
    *((void *)v125 + 51) = v3;

    id v14 = CPSLocalizedStringForKey(@"ACCESSIBILITY_PAN_LEFT");
    v132[0] = v14;
    id v13 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v132 count:1];
    objc_msgSend(*((id *)v125 + 51), "setAccessibilityUserInputLabels:");

    [v125 addSubview:*((void *)v125 + 51)];
    v5 = [[CPSPanButton alloc] initWithDirection:2];
    v6 = (void *)*((void *)v125 + 52);
    *((void *)v125 + 52) = v5;

    id v16 = CPSLocalizedStringForKey(@"ACCESSIBILITY_PAN_RIGHT");
    id v131 = v16;
    id v15 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v131 count:1];
    objc_msgSend(*((id *)v125 + 52), "setAccessibilityUserInputLabels:");

    [v125 addSubview:*((void *)v125 + 52)];
    v7 = -[CPSPanButton initWithDirection:]([CPSPanButton alloc], "initWithDirection:");
    v8 = (void *)*((void *)v125 + 53);
    *((void *)v125 + 53) = v7;

    id v18 = CPSLocalizedStringForKey(@"ACCESSIBILITY_PAN_UP");
    id v130 = v18;
    id v17 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v130 count:1];
    objc_msgSend(*((id *)v125 + 53), "setAccessibilityUserInputLabels:");

    [v125 addSubview:*((void *)v125 + 53)];
    v9 = [[CPSPanButton alloc] initWithDirection:8];
    v10 = (void *)*((void *)v125 + 54);
    *((void *)v125 + 54) = v9;

    id v20 = CPSLocalizedStringForKey(@"ACCESSIBILITY_PAN_DOWN");
    id v129 = v20;
    id v19 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v129 count:1];
    objc_msgSend(*((id *)v125 + 54), "setAccessibilityUserInputLabels:");

    [v125 addSubview:*((void *)v125 + 54)];
    id v122 = objc_alloc_init(MEMORY[0x263F1C638]);
    [v125 addLayoutGuide:v122];
    id v121 = objc_alloc_init(MEMORY[0x263F1C638]);
    [v125 addLayoutGuide:v121];
    id v120 = objc_alloc_init(MEMORY[0x263F1C638]);
    [v125 addLayoutGuide:v120];
    id v119 = objc_alloc_init(MEMORY[0x263F1C638]);
    [v125 addLayoutGuide:v119];
    v21 = (void *)MEMORY[0x263F08938];
    id v110 = (id)[*((id *)v125 + 51) leftAnchor];
    id v109 = (id)[v125 leftAnchor];
    id v108 = (id)objc_msgSend(v110, "constraintEqualToAnchor:constant:");
    v128[0] = v108;
    id v107 = (id)[*((id *)v125 + 51) centerYAnchor];
    id v106 = (id)[v125 centerYAnchor];
    id v105 = (id)objc_msgSend(v107, "constraintEqualToAnchor:");
    v128[1] = v105;
    id v104 = (id)[*((id *)v125 + 51) widthAnchor];
    id v103 = (id)objc_msgSend(v104, "constraintEqualToConstant:");
    v128[2] = v103;
    id v102 = (id)[*((id *)v125 + 51) heightAnchor];
    id v101 = (id)[v102 constraintEqualToConstant:28.0];
    v128[3] = v101;
    id v100 = (id)[*((id *)v125 + 52) rightAnchor];
    id v99 = (id)[v125 rightAnchor];
    id v98 = (id)objc_msgSend(v100, "constraintEqualToAnchor:constant:");
    v128[4] = v98;
    id v97 = (id)[*((id *)v125 + 52) centerYAnchor];
    id v96 = (id)[v125 centerYAnchor];
    id v95 = (id)objc_msgSend(v97, "constraintEqualToAnchor:");
    v128[5] = v95;
    id v94 = (id)[*((id *)v125 + 52) widthAnchor];
    id v93 = (id)[v94 constraintEqualToConstant:28.0];
    v128[6] = v93;
    id v92 = (id)[*((id *)v125 + 52) heightAnchor];
    id v91 = (id)[v92 constraintEqualToConstant:28.0];
    v128[7] = v91;
    id v90 = (id)[*((id *)v125 + 53) topAnchor];
    id v89 = (id)[v125 topAnchor];
    id v88 = (id)objc_msgSend(v90, "constraintEqualToAnchor:constant:", 8.0);
    v128[8] = v88;
    id v87 = (id)[*((id *)v125 + 53) centerXAnchor];
    id v86 = (id)[v125 centerXAnchor];
    id v85 = (id)objc_msgSend(v87, "constraintEqualToAnchor:");
    v128[9] = v85;
    id v84 = (id)[*((id *)v125 + 53) widthAnchor];
    id v83 = (id)[v84 constraintEqualToConstant:28.0];
    v128[10] = v83;
    id v82 = (id)[*((id *)v125 + 53) heightAnchor];
    id v81 = (id)[v82 constraintEqualToConstant:28.0];
    v128[11] = v81;
    id v80 = (id)[*((id *)v125 + 54) bottomAnchor];
    id v79 = (id)[v125 bottomAnchor];
    id v78 = (id)objc_msgSend(v80, "constraintEqualToAnchor:constant:", -8.0);
    v128[12] = v78;
    id v77 = (id)[*((id *)v125 + 54) centerXAnchor];
    id v76 = (id)[v125 centerXAnchor];
    id v75 = (id)objc_msgSend(v77, "constraintEqualToAnchor:");
    v128[13] = v75;
    id v74 = (id)[*((id *)v125 + 54) widthAnchor];
    id v73 = (id)[v74 constraintEqualToConstant:28.0];
    v128[14] = v73;
    id v72 = (id)[*((id *)v125 + 54) heightAnchor];
    id v71 = (id)[v72 constraintEqualToConstant:28.0];
    v128[15] = v71;
    id v70 = (id)[v122 leftAnchor];
    id v69 = (id)[v125 leftAnchor];
    id v68 = (id)objc_msgSend(v70, "constraintEqualToAnchor:");
    v128[16] = v68;
    id v67 = (id)[v122 rightAnchor];
    id v66 = (id)[*((id *)v125 + 51) rightAnchor];
    id v65 = (id)objc_msgSend(v67, "constraintEqualToAnchor:");
    v128[17] = v65;
    id v64 = (id)[v122 bottomAnchor];
    id v63 = (id)[v125 bottomAnchor];
    id v62 = (id)objc_msgSend(v64, "constraintEqualToAnchor:");
    v128[18] = v62;
    id v61 = (id)[v122 topAnchor];
    id v60 = (id)[v125 topAnchor];
    id v59 = (id)objc_msgSend(v61, "constraintEqualToAnchor:");
    v128[19] = v59;
    id v58 = (id)[v121 leftAnchor];
    id v57 = (id)[*((id *)v125 + 52) leftAnchor];
    id v56 = (id)objc_msgSend(v58, "constraintEqualToAnchor:");
    v128[20] = v56;
    id v55 = (id)[v121 rightAnchor];
    id v54 = (id)[v125 rightAnchor];
    id v53 = (id)objc_msgSend(v55, "constraintEqualToAnchor:");
    v128[21] = v53;
    id v52 = (id)[v121 bottomAnchor];
    id v51 = (id)[v125 bottomAnchor];
    id v50 = (id)objc_msgSend(v52, "constraintEqualToAnchor:");
    v128[22] = v50;
    id v49 = (id)[v121 topAnchor];
    id v48 = (id)[v125 topAnchor];
    id v47 = (id)objc_msgSend(v49, "constraintEqualToAnchor:");
    v128[23] = v47;
    id v46 = (id)[v120 leftAnchor];
    id v45 = (id)[v125 leftAnchor];
    id v44 = (id)objc_msgSend(v46, "constraintEqualToAnchor:");
    v128[24] = v44;
    id v43 = (id)[v120 rightAnchor];
    id v42 = (id)[v125 rightAnchor];
    id v41 = (id)objc_msgSend(v43, "constraintEqualToAnchor:");
    v128[25] = v41;
    id v40 = (id)[v120 bottomAnchor];
    id v39 = (id)[*((id *)v125 + 53) bottomAnchor];
    id v38 = (id)objc_msgSend(v40, "constraintEqualToAnchor:");
    v128[26] = v38;
    id v37 = (id)[v120 topAnchor];
    id v36 = (id)[v125 topAnchor];
    id v35 = (id)objc_msgSend(v37, "constraintEqualToAnchor:");
    v128[27] = v35;
    id v34 = (id)[v119 leftAnchor];
    id v33 = (id)[v125 leftAnchor];
    id v32 = (id)objc_msgSend(v34, "constraintEqualToAnchor:");
    v128[28] = v32;
    id v31 = (id)[v119 rightAnchor];
    id v30 = (id)[v125 rightAnchor];
    id v29 = (id)objc_msgSend(v31, "constraintEqualToAnchor:");
    v128[29] = v29;
    id v28 = (id)[v119 bottomAnchor];
    id v27 = (id)[v125 bottomAnchor];
    id v26 = (id)objc_msgSend(v28, "constraintEqualToAnchor:");
    v128[30] = v26;
    id v25 = (id)[v119 topAnchor];
    id v24 = (id)[*((id *)v125 + 54) topAnchor];
    id v23 = (id)objc_msgSend(v25, "constraintEqualToAnchor:");
    v128[31] = v23;
    id v22 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v128 count:32];
    objc_msgSend(v21, "activateConstraints:");

    v127[0] = *((void *)v125 + 51);
    v127[1] = *((void *)v125 + 52);
    v127[2] = *((void *)v125 + 53);
    v127[3] = *((void *)v125 + 54);
    id v118 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v127 count:4];
    id v111 = v118;
    uint64_t v112 = MEMORY[0x263EF8330];
    int v113 = -1073741824;
    int v114 = 0;
    v115 = __28__CPSPanView_initWithFrame___block_invoke;
    v116 = &unk_2648A3CA8;
    id v117 = v125;
    [v111 enumerateObjectsUsingBlock:&v112];
    objc_storeStrong(&v117, 0);
    objc_storeStrong(&v118, 0);
    objc_storeStrong(&v119, 0);
    objc_storeStrong(&v120, 0);
    objc_storeStrong(&v121, 0);
    objc_storeStrong(&v122, 0);
  }
  v12 = (CPSPanView *)v125;
  objc_storeStrong(&v125, 0);
  return v12;
}

void __28__CPSPanView_initWithFrame___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v10[3] = a3;
  v10[2] = a4;
  v10[1] = a1;
  v10[0] = (id)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:a1[4] action:0x1F6CB382EuLL];
  [v10[0] setAllowedTouchTypes:&unk_26DF06AA8];
  objc_msgSend(v10[0], "setMinimumPressDuration:");
  [location[0] addGestureRecognizer:v10[0]];
  id v9 = (id)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:a1[4] action:0x1F9D2F55FuLL];
  [v9 setAllowedTouchTypes:&unk_26DF06AC0];
  [v9 requireGestureRecognizerToFail:v10[0]];
  [location[0] addGestureRecognizer:v9];
  id v8 = (id)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:a1[4] action:0x1F6CB382EuLL];
  [v8 setAllowedPressTypes:&unk_26DF06AD8];
  [v8 setMinimumPressDuration:0.25];
  [location[0] addGestureRecognizer:v8];
  id v7 = (id)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:a1[4] action:0x1F9D2F55FuLL];
  [v7 setAllowedPressTypes:&unk_26DF06AF0];
  [v7 requireGestureRecognizerToFail:v8];
  [v7 setDelegate:a1[4]];
  [location[0] addGestureRecognizer:v7];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v10, 0);
  objc_storeStrong(location, 0);
}

- (void)_handleButtonTapped:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_opt_class();
  id v4 = (id)[location[0] view];
  id v6 = CPSSafeCast_1(v3, v4);

  v5 = [(CPSPanView *)v8 delegate];
  -[CPSPanViewDelegate panView:panWithDirection:](v5, "panView:panWithDirection:", v8, [v6 direction]);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)_handleLongPressGesture:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = objc_opt_class();
  id v6 = (id)[location[0] view];
  id v9 = CPSSafeCast_1(v5, v6);

  uint64_t v8 = [v9 direction];
  uint64_t v7 = [location[0] state];
  if (v7 == 1)
  {
    id v4 = [(CPSPanView *)v11 delegate];
    [(CPSPanViewDelegate *)v4 panView:v11 panBeganWithDirection:v8];
  }
  else if (v7 == 3)
  {
    v3 = [(CPSPanView *)v11 delegate];
    [(CPSPanViewDelegate *)v3 panView:v11 panEndedWithDirection:v8];
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  if ((_CPSUIPressesContainsPressTypes(location[0], &unk_26DF06B08) & 1) == 0)
  {
    v5.receiver = v8;
    v5.super_class = (Class)CPSPanView;
    [(CPSPanView *)&v5 pressesBegan:location[0] withEvent:v6];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  if ((_CPSUIPressesContainsPressTypes(location[0], &unk_26DF06B20) & 1) == 0)
  {
    v5.receiver = v8;
    v5.super_class = (Class)CPSPanView;
    [(CPSPanView *)&v5 pressesChanged:location[0] withEvent:v6];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  if ((_CPSUIPressesContainsPressTypes(location[0], &unk_26DF06B38) & 1) == 0)
  {
    v5.receiver = v8;
    v5.super_class = (Class)CPSPanView;
    [(CPSPanView *)&v5 pressesCancelled:location[0] withEvent:v6];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  if ((_CPSUIPressesContainsPressTypes(location[0], &unk_26DF06B50) & 1) == 0)
  {
    v5.receiver = v8;
    v5.super_class = (Class)CPSPanView;
    [(CPSPanView *)&v5 pressesEnded:location[0] withEvent:v6];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (double)sideButtonTopInset
{
  v3 = [(CPSPanView *)self panRightButton];
  [(CPSPanButton *)v3 frame];
  double MinY = CGRectGetMinY(v6);

  [(CPSPanView *)self bounds];
  return CGRectGetHeight(v7) - MinY;
}

- (CPSPanButton)panLeftButton
{
  return self->_panLeftButton;
}

- (CPSPanButton)panRightButton
{
  return self->_panRightButton;
}

- (CPSPanButton)panUpButton
{
  return self->_panUpButton;
}

- (CPSPanButton)panDownButton
{
  return self->_panDownButton;
}

- (CPSPanViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CPSPanViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
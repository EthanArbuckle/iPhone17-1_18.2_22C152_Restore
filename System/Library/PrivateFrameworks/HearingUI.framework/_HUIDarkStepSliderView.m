@interface _HUIDarkStepSliderView
- (HACCCapsuleDarkBackground)darkBackgroundView;
- (HUISliderConfig)config;
- (HUIStepSlider)slider;
- (NSArray)defaultLayouts;
- (NSArray)largeTextLayouts;
- (UIView)leadingView;
- (UIView)trailingView;
- (_HUIDarkStepSliderView)initWithConfig:(id)a3;
- (void)_setContraintsFromConfig:(id)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setConfig:(id)a3;
- (void)setDarkBackgroundView:(id)a3;
- (void)setDefaultLayouts:(id)a3;
- (void)setLargeTextLayouts:(id)a3;
- (void)setLeadingView:(id)a3;
- (void)setSlider:(id)a3;
- (void)setTrailingView:(id)a3;
- (void)updateConstraintsWithConfig:(id)a3;
@end

@implementation _HUIDarkStepSliderView

- (_HUIDarkStepSliderView)initWithConfig:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HUIDarkStepSliderView;
  v6 = -[_HUIDarkStepSliderView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v8 = objc_alloc_init(HACCCapsuleDarkBackground);
    darkBackgroundView = v7->_darkBackgroundView;
    v7->_darkBackgroundView = v8;

    [(HACCCapsuleDarkBackground *)v7->_darkBackgroundView setAutoresizingMask:18];
    [(_HUIDarkStepSliderView *)v7 addSubview:v7->_darkBackgroundView];
    [(HACCCapsuleDarkBackground *)v7->_darkBackgroundView setupBackgroundVisualStyle];
    v10 = objc_alloc_init(HUIStepSlider);
    slider = v7->_slider;
    v7->_slider = v10;

    [(HUIStepSlider *)v7->_slider setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_HUIDarkStepSliderView *)v7 addSubview:v7->_slider];
    [(_HUIDarkStepSliderView *)v7 _setContraintsFromConfig:v5];
  }

  return v7;
}

- (void)_setContraintsFromConfig:(id)a3
{
  v55[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  switch([v4 style])
  {
    case 0:
      v48 = (void *)MEMORY[0x263F08938];
      v54 = [(_HUIDarkStepSliderView *)self slider];
      v53 = [v54 leadingAnchor];
      v52 = [(_HUIDarkStepSliderView *)self leadingAnchor];
      CCUILayoutGutter();
      v51 = objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52);
      v55[0] = v51;
      v50 = [(_HUIDarkStepSliderView *)self slider];
      v49 = [v50 trailingAnchor];
      v47 = [(_HUIDarkStepSliderView *)self trailingAnchor];
      CCUILayoutGutter();
      v46 = [v49 constraintEqualToAnchor:v47 constant:-v11];
      v55[1] = v46;
      v12 = [(_HUIDarkStepSliderView *)self slider];
      objc_super v13 = [v12 topAnchor];
      v14 = [(_HUIDarkStepSliderView *)self topAnchor];
      v15 = [v13 constraintEqualToAnchor:v14];
      v55[2] = v15;
      v16 = [(_HUIDarkStepSliderView *)self slider];
      v17 = [v16 bottomAnchor];
      v18 = [(_HUIDarkStepSliderView *)self bottomAnchor];
      v19 = [v17 constraintEqualToAnchor:v18];
      v55[3] = v19;
      v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:4];
      [v48 activateConstraints:v20];

      goto LABEL_22;
    case 1:
      v21 = [v4 minImage];

      if (v21)
      {
        id v22 = objc_alloc(MEMORY[0x263F82828]);
        v23 = [v4 minImage];
        v24 = (void *)[v22 initWithImage:v23];

        [v24 setContentMode:7];
        [(_HUIDarkStepSliderView *)self setLeadingView:v24];
      }
      v25 = [v4 maxImage];

      if (!v25) {
        goto LABEL_19;
      }
      id v26 = objc_alloc(MEMORY[0x263F82828]);
      v27 = [v4 maxImage];
      v28 = (void *)[v26 initWithImage:v27];

      [v28 setContentMode:8];
      goto LABEL_18;
    case 2:
      v29 = [v4 minImage];

      if (v29)
      {
        v30 = [v4 minImageAction];

        if (v30)
        {
          v31 = [MEMORY[0x263F824E8] buttonWithType:0];
          v32 = [v4 minImageAction];
          [v31 addAction:v32 forControlEvents:64];

          v33 = [v4 minImage];
          [v31 setImage:v33 forState:0];

          [v31 setContentHorizontalAlignment:1];
        }
        else
        {
          id v34 = objc_alloc(MEMORY[0x263F82828]);
          v35 = [v4 minImage];
          v31 = (void *)[v34 initWithImage:v35];

          [v31 setContentMode:7];
        }
        [(_HUIDarkStepSliderView *)self setLeadingView:v31];
      }
      v36 = [v4 valueLabel];

      if (!v36) {
        goto LABEL_19;
      }
      BOOL v37 = [(_HUIDarkStepSliderView *)self effectiveUserInterfaceLayoutDirection] != 1;
      v10 = [v4 valueLabel];
      [v10 setTextAlignment:2 * v37];
      break;
    case 3:
    case 4:
      uint64_t v5 = [v4 minTextLabel];
      if (!v5) {
        goto LABEL_19;
      }
      v6 = (void *)v5;
      v7 = [v4 valueLabel];

      if (!v7) {
        goto LABEL_19;
      }
      v8 = [v4 minTextLabel];
      [v8 setTextAlignment:0];

      v9 = [v4 valueLabel];
      [v9 setTextAlignment:2];

      v10 = [v4 minTextLabel];
      [(_HUIDarkStepSliderView *)self setLeadingView:v10];
      break;
    default:
      goto LABEL_19;
  }

  v28 = [v4 valueLabel];
LABEL_18:
  [(_HUIDarkStepSliderView *)self setTrailingView:v28];

LABEL_19:
  uint64_t v38 = [(_HUIDarkStepSliderView *)self leadingView];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(_HUIDarkStepSliderView *)self trailingView];

    if (v40)
    {
      v41 = [(_HUIDarkStepSliderView *)self leadingView];
      [v41 setTranslatesAutoresizingMaskIntoConstraints:0];

      v42 = [(_HUIDarkStepSliderView *)self trailingView];
      [v42 setTranslatesAutoresizingMaskIntoConstraints:0];

      v43 = [(_HUIDarkStepSliderView *)self leadingView];
      [(_HUIDarkStepSliderView *)self addSubview:v43];

      v44 = [(_HUIDarkStepSliderView *)self trailingView];
      [(_HUIDarkStepSliderView *)self addSubview:v44];

      v45 = [(_HUIDarkStepSliderView *)self config];
      [(_HUIDarkStepSliderView *)self updateConstraintsWithConfig:v45];
    }
  }
LABEL_22:
}

- (void)updateConstraintsWithConfig:(id)a3
{
  v156[14] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(_HUIDarkStepSliderView *)self setConfig:v4];
  uint64_t v5 = [(_HUIDarkStepSliderView *)self leadingView];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(_HUIDarkStepSliderView *)self trailingView];

    if (v7)
    {
      v8 = [(_HUIDarkStepSliderView *)self config];
      if ([v8 style] == 2)
      {
        BOOL v9 = 1;
      }
      else
      {
        v10 = [(_HUIDarkStepSliderView *)self config];
        if ([v10 style] == 3)
        {
          BOOL v9 = 1;
        }
        else
        {
          double v11 = [(_HUIDarkStepSliderView *)self config];
          BOOL v9 = [v11 style] == 4;
        }
      }

      v12 = [(_HUIDarkStepSliderView *)self config];
      int v13 = [v12 isLargeText];

      if (v13 && v9)
      {
        v14 = [(_HUIDarkStepSliderView *)self defaultLayouts];

        if (v14)
        {
          v15 = (void *)MEMORY[0x263F08938];
          v16 = [(_HUIDarkStepSliderView *)self defaultLayouts];
          [v15 deactivateConstraints:v16];
        }
        v17 = [(_HUIDarkStepSliderView *)self largeTextLayouts];

        if (!v17)
        {
          v153 = [(_HUIDarkStepSliderView *)self leadingView];
          v151 = [v153 leadingAnchor];
          v149 = [(_HUIDarkStepSliderView *)self leadingAnchor];
          CCUILayoutGutter();
          v147 = objc_msgSend(v151, "constraintEqualToAnchor:constant:", v149);
          v156[0] = v147;
          v145 = [(_HUIDarkStepSliderView *)self leadingView];
          v143 = [v145 topAnchor];
          v141 = [(_HUIDarkStepSliderView *)self topAnchor];
          v139 = [v143 constraintEqualToAnchor:v141];
          v156[1] = v139;
          v137 = [(_HUIDarkStepSliderView *)self leadingView];
          v133 = [v137 bottomAnchor];
          v135 = [(_HUIDarkStepSliderView *)self slider];
          v131 = [v135 topAnchor];
          v129 = [v133 constraintEqualToAnchor:v131];
          v156[2] = v129;
          v127 = [(_HUIDarkStepSliderView *)self leadingView];
          v125 = [v127 widthAnchor];
          v123 = [(_HUIDarkStepSliderView *)self widthAnchor];
          CCUILayoutGutter();
          v121 = [v125 constraintEqualToAnchor:v123 constant:v18 * -2.0];
          v156[3] = v121;
          v119 = [(_HUIDarkStepSliderView *)self leadingView];
          v117 = [v119 heightAnchor];
          v115 = [v117 constraintGreaterThanOrEqualToConstant:52.0];
          v156[4] = v115;
          v113 = [(_HUIDarkStepSliderView *)self slider];
          v109 = [v113 leadingAnchor];
          v111 = [(_HUIDarkStepSliderView *)self leadingView];
          v107 = [v111 leadingAnchor];
          v105 = [v109 constraintEqualToAnchor:v107];
          v156[5] = v105;
          v103 = [(_HUIDarkStepSliderView *)self slider];
          v101 = [v103 trailingAnchor];
          v99 = [(_HUIDarkStepSliderView *)self trailingAnchor];
          CCUILayoutGutter();
          v97 = [v101 constraintEqualToAnchor:v99 constant:-v19];
          v156[6] = v97;
          v95 = [(_HUIDarkStepSliderView *)self slider];
          v91 = [v95 topAnchor];
          v93 = [(_HUIDarkStepSliderView *)self leadingView];
          v89 = [v93 bottomAnchor];
          v87 = [v91 constraintEqualToAnchor:v89];
          v156[7] = v87;
          v85 = [(_HUIDarkStepSliderView *)self slider];
          v83 = [v85 bottomAnchor];
          v81 = [(_HUIDarkStepSliderView *)self bottomAnchor];
          v79 = [v83 constraintEqualToAnchor:v81 constant:-10.0];
          v156[8] = v79;
          v77 = [(_HUIDarkStepSliderView *)self trailingView];
          v73 = [v77 leadingAnchor];
          v75 = [(_HUIDarkStepSliderView *)self leadingView];
          v71 = [v75 leadingAnchor];
          v69 = [v73 constraintEqualToAnchor:v71];
          v156[9] = v69;
          v67 = [(_HUIDarkStepSliderView *)self trailingView];
          v63 = [v67 trailingAnchor];
          v65 = [(_HUIDarkStepSliderView *)self slider];
          v61 = [v65 trailingAnchor];
          v59 = [v63 constraintEqualToAnchor:v61];
          v156[10] = v59;
          v57 = [(_HUIDarkStepSliderView *)self trailingView];
          v55 = [v57 topAnchor];
          v53 = [(_HUIDarkStepSliderView *)self topAnchor];
          v51 = [v55 constraintEqualToAnchor:v53];
          v156[11] = v51;
          v49 = [(_HUIDarkStepSliderView *)self trailingView];
          v47 = [v49 bottomAnchor];
          v48 = [(_HUIDarkStepSliderView *)self slider];
          v20 = [v48 topAnchor];
          v21 = [v47 constraintEqualToAnchor:v20];
          v156[12] = v21;
          id v22 = [(_HUIDarkStepSliderView *)self trailingView];
          v23 = [v22 widthAnchor];
          v24 = [(_HUIDarkStepSliderView *)self leadingView];
          v25 = [v24 widthAnchor];
          id v26 = [v23 constraintLessThanOrEqualToAnchor:v25];
          v156[13] = v26;
          v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v156 count:14];
          [(_HUIDarkStepSliderView *)self setLargeTextLayouts:v27];
        }
        v28 = (void *)MEMORY[0x263F08938];
        uint64_t v29 = [(_HUIDarkStepSliderView *)self largeTextLayouts];
      }
      else
      {
        v30 = [(_HUIDarkStepSliderView *)self largeTextLayouts];

        if (v30)
        {
          v31 = (void *)MEMORY[0x263F08938];
          v32 = [(_HUIDarkStepSliderView *)self largeTextLayouts];
          [v31 deactivateConstraints:v32];
        }
        v33 = [(_HUIDarkStepSliderView *)self defaultLayouts];

        if (!v33)
        {
          v154 = [(_HUIDarkStepSliderView *)self leadingView];
          v152 = [v154 leadingAnchor];
          v150 = [(_HUIDarkStepSliderView *)self leadingAnchor];
          CCUILayoutGutter();
          v148 = objc_msgSend(v152, "constraintEqualToAnchor:constant:", v150);
          v155[0] = v148;
          v146 = [(_HUIDarkStepSliderView *)self leadingView];
          v144 = [v146 topAnchor];
          v142 = [(_HUIDarkStepSliderView *)self topAnchor];
          v140 = [v144 constraintEqualToAnchor:v142];
          v155[1] = v140;
          v138 = [(_HUIDarkStepSliderView *)self leadingView];
          v136 = [v138 bottomAnchor];
          v134 = [(_HUIDarkStepSliderView *)self bottomAnchor];
          v132 = [v136 constraintEqualToAnchor:v134];
          v155[2] = v132;
          v130 = [(_HUIDarkStepSliderView *)self leadingView];
          id v34 = [v130 widthAnchor];
          v128 = v34;
          uint64_t v35 = [v4 style];
          double v36 = 50.0;
          if (v35 != 4) {
            double v36 = 30.0;
          }
          v126 = [v34 constraintEqualToConstant:v36];
          v155[3] = v126;
          v124 = [(_HUIDarkStepSliderView *)self leadingView];
          v122 = [v124 heightAnchor];
          v120 = [v122 constraintEqualToConstant:52.0];
          v155[4] = v120;
          v118 = [(_HUIDarkStepSliderView *)self slider];
          v114 = [v118 leadingAnchor];
          v116 = [(_HUIDarkStepSliderView *)self leadingView];
          v112 = [v116 trailingAnchor];
          v110 = [v114 constraintEqualToAnchor:v112];
          v155[5] = v110;
          v108 = [(_HUIDarkStepSliderView *)self slider];
          v104 = [v108 trailingAnchor];
          v106 = [(_HUIDarkStepSliderView *)self trailingView];
          v102 = [v106 leadingAnchor];
          v100 = [v104 constraintEqualToAnchor:v102];
          v155[6] = v100;
          v98 = [(_HUIDarkStepSliderView *)self slider];
          v94 = [v98 topAnchor];
          v96 = [(_HUIDarkStepSliderView *)self leadingView];
          v92 = [v96 topAnchor];
          v90 = [v94 constraintEqualToAnchor:v92];
          v155[7] = v90;
          v88 = [(_HUIDarkStepSliderView *)self slider];
          v84 = [v88 bottomAnchor];
          v86 = [(_HUIDarkStepSliderView *)self leadingView];
          v82 = [v86 bottomAnchor];
          v80 = [v84 constraintEqualToAnchor:v82];
          v155[8] = v80;
          v78 = [(_HUIDarkStepSliderView *)self trailingView];
          v74 = [v78 leadingAnchor];
          v76 = [(_HUIDarkStepSliderView *)self slider];
          v72 = [v76 trailingAnchor];
          v70 = [v74 constraintEqualToAnchor:v72];
          v155[9] = v70;
          v68 = [(_HUIDarkStepSliderView *)self trailingView];
          v66 = [v68 trailingAnchor];
          v64 = [(_HUIDarkStepSliderView *)self trailingAnchor];
          CCUILayoutGutter();
          v62 = [v66 constraintEqualToAnchor:v64 constant:-v37];
          v155[10] = v62;
          v60 = [(_HUIDarkStepSliderView *)self trailingView];
          v56 = [v60 topAnchor];
          v58 = [(_HUIDarkStepSliderView *)self leadingView];
          v54 = [v58 topAnchor];
          v52 = [v56 constraintEqualToAnchor:v54];
          v155[11] = v52;
          v50 = [(_HUIDarkStepSliderView *)self trailingView];
          uint64_t v38 = [v50 bottomAnchor];
          v39 = [(_HUIDarkStepSliderView *)self leadingView];
          v40 = [v39 bottomAnchor];
          v41 = [v38 constraintEqualToAnchor:v40];
          v155[12] = v41;
          v42 = [(_HUIDarkStepSliderView *)self trailingView];
          v43 = [v42 widthAnchor];
          v44 = [v43 constraintGreaterThanOrEqualToConstant:30.0];
          v155[13] = v44;
          v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v155 count:14];
          [(_HUIDarkStepSliderView *)self setDefaultLayouts:v45];
        }
        v28 = (void *)MEMORY[0x263F08938];
        uint64_t v29 = [(_HUIDarkStepSliderView *)self defaultLayouts];
      }
      v46 = (void *)v29;
      [v28 activateConstraints:v29];
    }
  }
}

- (void)accessibilityDecrement
{
  id v2 = [(_HUIDarkStepSliderView *)self slider];
  [v2 accessibilityDecrement];
}

- (void)accessibilityIncrement
{
  id v2 = [(_HUIDarkStepSliderView *)self slider];
  [v2 accessibilityIncrement];
}

- (HUISliderConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (UIView)leadingView
{
  return self->_leadingView;
}

- (void)setLeadingView:(id)a3
{
}

- (HUIStepSlider)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
}

- (UIView)trailingView
{
  return self->_trailingView;
}

- (void)setTrailingView:(id)a3
{
}

- (HACCCapsuleDarkBackground)darkBackgroundView
{
  return self->_darkBackgroundView;
}

- (void)setDarkBackgroundView:(id)a3
{
}

- (NSArray)defaultLayouts
{
  return self->_defaultLayouts;
}

- (void)setDefaultLayouts:(id)a3
{
}

- (NSArray)largeTextLayouts
{
  return self->_largeTextLayouts;
}

- (void)setLargeTextLayouts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeTextLayouts, 0);
  objc_storeStrong((id *)&self->_defaultLayouts, 0);
  objc_storeStrong((id *)&self->_darkBackgroundView, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
@interface HUHomePodStereoSwapperCell
- (HUHomePodDetailView)leftHomePod;
- (HUHomePodDetailView)rightHomePod;
- (HUHomePodStereoSwapperCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUHomePodStereoSwapperCellDelegate)delegate;
- (UIButton)swapButton;
- (unint64_t)homePodVariant;
- (void)_setupConstraints;
- (void)_swap;
- (void)finishSetupWithDelegate:(id)a3 selectionStyle:(int64_t)a4 homePodVariant:(unint64_t)a5;
- (void)setDelegate:(id)a3;
- (void)setHomePodVariant:(unint64_t)a3;
- (void)setLeftHomePod:(id)a3;
- (void)setRightHomePod:(id)a3;
- (void)setSwapButton:(id)a3;
@end

@implementation HUHomePodStereoSwapperCell

- (HUHomePodStereoSwapperCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HUHomePodStereoSwapperCell;
  return [(HUHomePodStereoSwapperCell *)&v5 initWithStyle:a3 reuseIdentifier:a4];
}

- (void)finishSetupWithDelegate:(id)a3 selectionStyle:(int64_t)a4 homePodVariant:(unint64_t)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  [(HUHomePodStereoSwapperCell *)self setDelegate:a3];
  [(HUHomePodStereoSwapperCell *)self setSelectionStyle:a4];
  [(HUHomePodStereoSwapperCell *)self setHomePodVariant:a5];
  v8 = [[HUHomePodDetailView alloc] initWithRole:1 variant:[(HUHomePodStereoSwapperCell *)self homePodVariant]];
  [(HUHomePodStereoSwapperCell *)self setLeftHomePod:v8];

  v9 = [[HUHomePodDetailView alloc] initWithRole:2 variant:[(HUHomePodStereoSwapperCell *)self homePodVariant]];
  [(HUHomePodStereoSwapperCell *)self setRightHomePod:v9];

  v10 = [MEMORY[0x1E4F427E0] buttonWithType:0];
  [(HUHomePodStereoSwapperCell *)self setSwapButton:v10];

  v11 = [(HUHomePodStereoSwapperCell *)self swapButton];
  LODWORD(v12) = 1148846080;
  [v11 setContentCompressionResistancePriority:0 forAxis:v12];

  v13 = [(HUHomePodStereoSwapperCell *)self swapButton];
  v14 = HUNullableImageNamed(@"SpeakerFlipper");
  [v13 setImage:v14 forState:0];

  v15 = [(HUHomePodStereoSwapperCell *)self swapButton];
  [v15 addTarget:self action:sel__swap forControlEvents:64];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  rightHomePod = self->_rightHomePod;
  v28[0] = self->_leftHomePod;
  v28[1] = rightHomePod;
  v28[2] = self->_swapButton;
  v17 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v28, 3, 0);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
        v23 = [(HUHomePodStereoSwapperCell *)self contentView];
        [v23 addSubview:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v19);
  }

  [(HUHomePodStereoSwapperCell *)self _setupConstraints];
}

- (void)_setupConstraints
{
  v2 = (void *)MEMORY[0x1E4F28DC8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__HUHomePodStereoSwapperCell__setupConstraints__block_invoke;
  v4[3] = &unk_1E638F368;
  v4[4] = self;
  v3 = __47__HUHomePodStereoSwapperCell__setupConstraints__block_invoke((uint64_t)v4);
  [v2 activateConstraints:v3];
}

id __47__HUHomePodStereoSwapperCell__setupConstraints__block_invoke(uint64_t a1)
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  v92 = v2;
  uint64_t v93 = objc_opt_new();
  v3 = (void *)v93;
  v4 = objc_opt_new();
  v94 = v4;
  uint64_t v95 = objc_opt_new();
  v86 = (void *)v95;
  objc_super v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:4];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v87 objects:v96 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v88;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v88 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(a1 + 32) addLayoutGuide:*(void *)(*((void *)&v87 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v87 objects:v96 count:16];
    }
    while (v7);
  }

  v10 = [*(id *)(a1 + 32) swapButton];
  v11 = [v10 centerXAnchor];
  double v12 = [*(id *)(a1 + 32) contentView];
  v13 = [v12 centerXAnchor];
  v85 = [v11 constraintEqualToAnchor:v13];

  v14 = [*(id *)(a1 + 32) swapButton];
  v15 = [v14 centerYAnchor];
  v16 = [*(id *)(a1 + 32) contentView];
  v17 = [v16 centerYAnchor];
  v84 = [v15 constraintEqualToAnchor:v17];

  uint64_t v18 = [*(id *)(a1 + 32) contentView];
  uint64_t v19 = [v18 layoutMarginsGuide];
  uint64_t v20 = [v19 heightAnchor];
  v21 = [*(id *)(a1 + 32) leftHomePod];
  v22 = [v21 heightAnchor];
  v83 = [v20 constraintGreaterThanOrEqualToAnchor:v22];

  v23 = [*(id *)(a1 + 32) contentView];
  long long v24 = [v23 layoutMarginsGuide];
  long long v25 = [v24 heightAnchor];
  long long v26 = [*(id *)(a1 + 32) rightHomePod];
  long long v27 = [v26 heightAnchor];
  v82 = [v25 constraintGreaterThanOrEqualToAnchor:v27];

  v28 = [*(id *)(a1 + 32) leftHomePod];
  v29 = [v28 topAnchor];
  uint64_t v30 = [*(id *)(a1 + 32) contentView];
  v31 = [v30 layoutMarginsGuide];
  v32 = [v31 topAnchor];
  v80 = [v29 constraintEqualToAnchor:v32];

  v33 = [*(id *)(a1 + 32) rightHomePod];
  v34 = [v33 topAnchor];
  v35 = [*(id *)(a1 + 32) contentView];
  v36 = [v35 layoutMarginsGuide];
  v37 = [v36 topAnchor];
  v81 = [v34 constraintEqualToAnchor:v37];

  v38 = [v2 widthAnchor];
  v39 = [v3 widthAnchor];
  v79 = [v38 constraintEqualToAnchor:v39];

  v75 = v4;
  v40 = [v4 widthAnchor];
  v41 = [v86 widthAnchor];
  v78 = [v40 constraintEqualToAnchor:v41];

  v42 = [v3 widthAnchor];
  v43 = [*(id *)(a1 + 32) contentView];
  v44 = [v43 widthAnchor];
  v76 = [v42 constraintGreaterThanOrEqualToAnchor:v44 multiplier:0.05];

  v45 = [v86 widthAnchor];
  v46 = [*(id *)(a1 + 32) contentView];
  v47 = [v46 widthAnchor];
  v74 = [v45 constraintGreaterThanOrEqualToAnchor:v47 multiplier:0.07];

  v48 = [*(id *)(a1 + 32) leftHomePod];
  v49 = [v48 leadingAnchor];
  v50 = [v4 trailingAnchor];
  v77 = [v49 constraintEqualToAnchor:v50];

  v51 = [*(id *)(a1 + 32) leftHomePod];
  v52 = [v51 trailingAnchor];
  v53 = [v2 leadingAnchor];
  v72 = [v52 constraintEqualToAnchor:v53];

  v54 = [*(id *)(a1 + 32) rightHomePod];
  v55 = [v54 leadingAnchor];
  [v3 trailingAnchor];
  v56 = v2;
  v57 = v73 = v2;
  v58 = [v55 constraintEqualToAnchor:v57];

  v59 = [*(id *)(a1 + 32) rightHomePod];
  v60 = [v59 trailingAnchor];
  [v86 leadingAnchor];
  v62 = v61 = v3;
  v63 = [v60 constraintEqualToAnchor:v62];

  v91[0] = v85;
  v91[1] = v84;
  v91[2] = v83;
  v91[3] = v80;
  v91[4] = v82;
  v91[5] = v81;
  v91[6] = v79;
  v91[7] = v78;
  v91[8] = v76;
  v91[9] = v74;
  v91[10] = v77;
  v91[11] = v72;
  v91[12] = v58;
  v91[13] = v63;
  v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:14];
  v65 = [*(id *)(a1 + 32) leftHomePod];
  v66 = [*(id *)(a1 + 32) rightHomePod];
  v67 = [*(id *)(a1 + 32) swapButton];
  v68 = _NSDictionaryOfVariableBindings(&cfstr_Leadingswapbut.isa, v56, v61, v4, v86, v65, v66, v67, 0);
  v69 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[leftSpeakerMargin][leftHomePodDetailView][leadingSwapButtonMargin][swapButton][trailingSwapButtonMargin][rightHomePodDetailView][rightSpeakerMargin]|" options:0x10000 metrics:0 views:v68];
  v70 = [v69 arrayByAddingObjectsFromArray:v64];

  return v70;
}

- (void)_swap
{
  v3 = [(HUHomePodStereoSwapperCell *)self swapButton];
  +[HUAnimationUtilities schedulePopAnimation:v3 scaleFactor:0 beginDuration:0.8 endDuration:0.2 completion:0.4];

  v4 = [(HUHomePodStereoSwapperCell *)self delegate];

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didPressSwapButton:self];
  }
}

- (UIButton)swapButton
{
  return self->_swapButton;
}

- (void)setSwapButton:(id)a3
{
}

- (unint64_t)homePodVariant
{
  return self->_homePodVariant;
}

- (void)setHomePodVariant:(unint64_t)a3
{
  self->_homePodVariant = a3;
}

- (HUHomePodDetailView)leftHomePod
{
  return self->_leftHomePod;
}

- (void)setLeftHomePod:(id)a3
{
}

- (HUHomePodDetailView)rightHomePod
{
  return self->_rightHomePod;
}

- (void)setRightHomePod:(id)a3
{
}

- (HUHomePodStereoSwapperCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUHomePodStereoSwapperCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rightHomePod, 0);
  objc_storeStrong((id *)&self->_leftHomePod, 0);

  objc_storeStrong((id *)&self->_swapButton, 0);
}

@end
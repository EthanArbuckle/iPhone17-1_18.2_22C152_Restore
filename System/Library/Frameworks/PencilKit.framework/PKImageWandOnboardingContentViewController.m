@interface PKImageWandOnboardingContentViewController
- (id)initWithTitle:(void *)a3 titleBadgeText:(uint64_t)a4 detailText:(uint64_t)a5 symbolName:(uint64_t)a6 contentLayout:;
- (void)_updateHeaderLabelTextLayoutGuideConstraints;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PKImageWandOnboardingContentViewController

- (id)initWithTitle:(void *)a3 titleBadgeText:(uint64_t)a4 detailText:(uint64_t)a5 symbolName:(uint64_t)a6 contentLayout:
{
  v71[4] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if (a1)
  {
    v69.receiver = a1;
    v69.super_class = (Class)PKImageWandOnboardingContentViewController;
    v12 = (id *)objc_msgSendSuper2(&v69, sel_initWithTitle_detailText_symbolName_contentLayout_, a2, a4, a5, a6);
    v13 = v12;
    if (v12)
    {
      if (v11)
      {
        v14 = [v12 headerView];
        char v15 = objc_opt_respondsToSelector();

        if (v15)
        {
          id v16 = objc_alloc_init(MEMORY[0x1E4FB1940]);
          v17 = [v13 headerView];
          v18 = [v17 headerLabel];
          [v18 addLayoutGuide:v16];

          v19 = [v16 topAnchor];
          v20 = [v13 headerView];
          v21 = [v20 headerLabel];
          v22 = [v21 topAnchor];
          uint64_t v23 = [v19 constraintEqualToAnchor:v22];
          id v24 = v13[150];
          v13[150] = (id)v23;

          v25 = [v16 leadingAnchor];
          v26 = [v13 headerView];
          v27 = [v26 headerLabel];
          v28 = [v27 leadingAnchor];
          uint64_t v29 = [v25 constraintEqualToAnchor:v28];
          id v30 = v13[151];
          v13[151] = (id)v29;

          v31 = [v16 widthAnchor];
          uint64_t v32 = [v31 constraintEqualToConstant:0.0];
          id v33 = v13[152];
          v13[152] = (id)v32;

          v34 = [v16 heightAnchor];
          uint64_t v35 = [v34 constraintEqualToConstant:0.0];
          id v36 = v13[153];
          v13[153] = (id)v35;

          v71[0] = v13[150];
          v37 = (void *)MEMORY[0x1E4F28DC8];
          v71[1] = v13[151];
          v71[2] = v13[152];
          v71[3] = v13[153];
          v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:4];
          [v37 activateConstraints:v38];

          v39 = objc_alloc_init(PKBadgeLabel);
          id v40 = v13[148];
          v13[148] = v39;

          [v13[148] setText:v11];
          [v13[148] setTranslatesAutoresizingMaskIntoConstraints:0];
          v41 = [v13 headerView];
          [v41 addSubview:v13[148]];

          v42 = (void *)MEMORY[0x1E4F28DC8];
          v43 = [v13[148] centerYAnchor];
          v68 = v16;
          v44 = [v16 centerYAnchor];
          v45 = [v43 constraintEqualToAnchor:v44];
          v70[0] = v45;
          v46 = [v13[148] leadingAnchor];
          v47 = [v16 trailingAnchor];
          [v46 constraintEqualToAnchor:v47 constant:2.0];
          v49 = id v48 = v11;
          v70[1] = v49;
          v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
          [v42 activateConstraints:v50];

          id v11 = v48;
        }
      }
      v51 = _PencilKitBundle();
      v52 = [v51 localizedStringForKey:@"START_WITH_CIRCLE_TITLE" value:&stru_1F1FB2C00 table:@"ImageWand"];
      v53 = _PencilKitBundle();
      v54 = [v53 localizedStringForKey:@"START_WITH_CIRCLE_DESCRIPTION" value:&stru_1F1FB2C00 table:@"ImageWand"];
      v55 = [MEMORY[0x1E4FB1818] systemImageNamed:@"pencil.and.outline"];
      [v13 addBulletedListItemWithTitle:v52 description:v54 image:v55];

      v56 = _PencilKitBundle();
      v57 = [v56 localizedStringForKey:@"REPLACE_SKETCH_TITLE" value:&stru_1F1FB2C00 table:@"ImageWand"];
      v58 = _PencilKitBundle();
      v59 = [v58 localizedStringForKey:@"REPLACE_SKETCH_DESCRIPTION" value:&stru_1F1FB2C00 table:@"ImageWand"];
      v60 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"pencil.and.sparkles"];
      [v13 addBulletedListItemWithTitle:v57 description:v59 image:v60];

      uint64_t v61 = [MEMORY[0x1E4F83A80] boldButton];
      id v62 = v13[154];
      v13[154] = (id)v61;

      id v63 = v13[154];
      v64 = _PencilKitBundle();
      v65 = [v64 localizedStringForKey:@"CONTINUE_BUTTON" value:&stru_1F1FB2C00 table:@"ImageWand"];
      [v63 setTitle:v65 forState:0];

      v66 = [v13 buttonTray];
      [v66 addButton:v13[154]];

      -[PKImageWandOnboardingContentViewController _updateHeaderLabelTextLayoutGuideConstraints](v13);
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_updateHeaderLabelTextLayoutGuideConstraints
{
  if (a1)
  {
    v2 = [a1 viewIfLoaded];

    if (v2)
    {
      v3 = [a1 headerView];
      v4 = [v3 headerLabel];
      objc_msgSend(v4, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
      uint64_t v6 = v5;
      uint64_t v8 = v7;

      v9 = [a1 headerView];
      v10 = [v9 headerLabel];
      id v11 = [a1 headerView];
      v12 = [v11 headerLabel];
      [v12 bounds];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      v21 = [a1 headerView];
      v22 = [v21 headerLabel];
      objc_msgSend(v10, "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(v22, "numberOfLines"), v14, v16, v18, v20);
      double v24 = v23;
      double v26 = v25;

      v29[1] = 3221225472;
      double v27 = 0.0;
      if (v24 >= 0.0) {
        double v28 = v24;
      }
      else {
        double v28 = 0.0;
      }
      v29[0] = MEMORY[0x1E4F143A8];
      v29[2] = __90__PKImageWandOnboardingContentViewController__updateHeaderLabelTextLayoutGuideConstraints__block_invoke;
      v29[3] = &unk_1E64CA840;
      v29[4] = a1;
      if (v26 >= 0.0) {
        double v27 = v26;
      }
      *(double *)&v29[5] = v28;
      *(double *)&v29[6] = v27;
      v29[7] = v6;
      v29[8] = v8;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v29];
    }
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PKImageWandOnboardingContentViewController;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  -[PKImageWandOnboardingContentViewController _updateHeaderLabelTextLayoutGuideConstraints](self);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKImageWandOnboardingContentViewController;
  [(OBBaseWelcomeController *)&v3 viewDidLayoutSubviews];
  -[PKImageWandOnboardingContentViewController _updateHeaderLabelTextLayoutGuideConstraints](self);
}

uint64_t __90__PKImageWandOnboardingContentViewController__updateHeaderLabelTextLayoutGuideConstraints__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1200) setConstant:*(double *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 1208) setConstant:*(double *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 1216) setConstant:*(double *)(a1 + 56)];
  double v2 = *(double *)(a1 + 64);
  objc_super v3 = *(void **)(*(void *)(a1 + 32) + 1224);

  return [v3 setConstant:v2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_headerLabelTextLayoutGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_headerLabelTextLayoutGuideWidthConstraint, 0);
  objc_storeStrong((id *)&self->_headerLabelTextLayoutGuideLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_headerLabelTextLayoutGuideTopConstraint, 0);
  objc_storeStrong((id *)&self->_headerLabelTextLayoutGuide, 0);

  objc_storeStrong((id *)&self->_badgeLabel, 0);
}

@end
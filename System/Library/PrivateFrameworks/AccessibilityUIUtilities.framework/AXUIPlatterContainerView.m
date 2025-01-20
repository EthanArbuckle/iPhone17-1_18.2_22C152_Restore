@interface AXUIPlatterContainerView
- (AXUIPlatterContainerView)initWithFrame:(CGRect)a3;
- (BOOL)allowsScrolling;
- (BOOL)shouldMimicNotificationBannerTopOffset;
- (NSString)primaryTextStyle;
- (UIBlurEffect)platterBlurEffect;
- (UIView)contentView;
- (UIView)platterView;
- (double)platterWidth;
@end

@implementation AXUIPlatterContainerView

- (AXUIPlatterContainerView)initWithFrame:(CGRect)a3
{
  v106[5] = *MEMORY[0x1E4F143B8];
  v104.receiver = self;
  v104.super_class = (Class)AXUIPlatterContainerView;
  v3 = -[AXUIPlatterContainerView initWithFrame:](&v104, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!v3) {
    return v3;
  }
  uint64_t v100 = [MEMORY[0x1E4FB14C8] effectWithStyle:1200];
  v4 = (UIView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v100];
  [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = (void *)MEMORY[0x1E4FB17A8];
  v6 = [(AXUIPlatterContainerView *)v3 primaryTextStyle];
  v7 = [v5 metricsForTextStyle:v6];

  v99 = v7;
  [v7 scaledValueForValue:14.0];
  -[UIView _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:");
  id v8 = [MEMORY[0x1E4FB1618] blackColor];
  uint64_t v9 = [v8 CGColor];
  v10 = [(UIView *)v4 layer];
  [v10 setShadowColor:v9];

  v11 = [(UIView *)v4 layer];
  objc_msgSend(v11, "setShadowOffset:", 0.0, 5.0);

  v12 = [(UIView *)v4 layer];
  LODWORD(v13) = 1045220557;
  [v12 setShadowOpacity:v13];

  v14 = [(UIView *)v4 layer];
  [v14 setShadowRadius:10.0];

  [(AXUIPlatterContainerView *)v3 addSubview:v4];
  if ([(AXUIPlatterContainerView *)v3 shouldMimicNotificationBannerTopOffset])
  {
    v15 = [(AXUIPlatterContainerView *)v3 safeAreaLayoutGuide];
  }
  else
  {
    v15 = v3;
  }
  v16 = v15;
  v103 = v3;
  if ([(AXUIPlatterContainerView *)v3 shouldMimicNotificationBannerTopOffset])
  {
    if (MEMORY[0x1C8778780]())
    {
      v17 = v4;
      v18 = [getAXUIDisplayManagerClass() sharedDisplayManager];
      v19 = [v18 activeWindows];
      v20 = [v19 allValues];
      v21 = [v20 lastObject];
      v22 = [v21 allValues];
      v23 = [v22 lastObject];

      if (!v23)
      {
        v24 = [getAXUIDisplayManagerClass() sharedDisplayManager];
        v25 = [v24 passiveWindows];
        v26 = [v25 allValues];
        v27 = [v26 lastObject];
        v28 = [v27 allValues];
        v23 = [v28 lastObject];
      }
      [v23 safeAreaInsets];
      if (v29 == 0.0) {
        double v30 = 10.0;
      }
      else {
        double v30 = 0.0;
      }
    }
    else
    {
      v23 = [MEMORY[0x1E4FB1438] sharedApplication];
      v31 = [v23 delegate];
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

        double v30 = 0.0;
        goto LABEL_21;
      }
      v17 = v4;
      v32 = [MEMORY[0x1E4FB1438] sharedApplication];
      v33 = [v32 delegate];
      v34 = [v33 window];
      [v34 safeAreaInsets];
      double v30 = 10.0;
      if (v35 != 0.0)
      {
        v36 = [MEMORY[0x1E4FB16C8] currentDevice];
        uint64_t v37 = [v36 userInterfaceIdiom];

        if (v37 == 1) {
          double v30 = 10.0;
        }
        else {
          double v30 = 0.0;
        }
      }
    }
    v4 = v17;
LABEL_21:

    goto LABEL_22;
  }
  double v30 = 68.0;
LABEL_22:
  v102 = v4;
  v96 = [(UIView *)v4 leadingAnchor];
  v94 = [(AXUIPlatterContainerView *)v16 leadingAnchor];
  v92 = [v96 constraintGreaterThanOrEqualToAnchor:v94 constant:32.0];
  v106[0] = v92;
  v90 = [(UIView *)v4 trailingAnchor];
  v88 = [(AXUIPlatterContainerView *)v16 trailingAnchor];
  v86 = [v90 constraintLessThanOrEqualToAnchor:v88 constant:-32.0];
  v106[1] = v86;
  v38 = [(UIView *)v4 topAnchor];
  v39 = [(AXUIPlatterContainerView *)v16 topAnchor];
  v40 = [v38 constraintEqualToAnchor:v39 constant:v30];
  v106[2] = v40;
  v41 = [(UIView *)v4 bottomAnchor];
  v42 = [(AXUIPlatterContainerView *)v16 bottomAnchor];
  v43 = [v41 constraintLessThanOrEqualToAnchor:v42 constant:-v30];
  v106[3] = v43;
  v44 = [(UIView *)v4 centerXAnchor];
  v98 = v16;
  v45 = [(AXUIPlatterContainerView *)v16 centerXAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  v106[4] = v46;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:5];
  v101 = (void *)[v47 mutableCopy];

  v48 = v102;
  v3 = v103;
  [(AXUIPlatterContainerView *)v103 platterWidth];
  if (v49 > 0.0)
  {
    double v50 = v49;
    v51 = [(UIView *)v102 widthAnchor];
    v52 = [v51 constraintEqualToConstant:v50];

    LODWORD(v53) = 1144766464;
    [v52 setPriority:v53];
    [v101 addObject:v52];
  }
  v54 = (UIView *)objc_opt_new();
  [(UIView *)v54 setTranslatesAutoresizingMaskIntoConstraints:0];
  if ([(AXUIPlatterContainerView *)v103 allowsScrolling])
  {
    v55 = objc_opt_new();
    [v55 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v55 addSubview:v54];
    v56 = [(UIView *)v102 contentView];
    [v56 addSubview:v55];

    v57 = [v55 heightAnchor];
    v58 = [(UIView *)v54 heightAnchor];
    v59 = [v57 constraintEqualToAnchor:v58];

    LODWORD(v60) = 1132003328;
    v61 = v59;
    v85 = v59;
    [v59 setPriority:v60];
    v97 = [(UIView *)v54 topAnchor];
    v95 = [v55 topAnchor];
    v93 = [v97 constraintEqualToAnchor:v95];
    v105[0] = v93;
    v91 = [(UIView *)v54 bottomAnchor];
    v89 = [v55 bottomAnchor];
    v87 = [v91 constraintEqualToAnchor:v89];
    v105[1] = v87;
    v84 = [(UIView *)v54 leadingAnchor];
    v83 = [v55 leadingAnchor];
    v82 = [v84 constraintEqualToAnchor:v83];
    v105[2] = v82;
    v62 = [(UIView *)v54 trailingAnchor];
    v63 = [v55 trailingAnchor];
    v64 = [v62 constraintEqualToAnchor:v63];
    v105[3] = v64;
    v65 = [(UIView *)v54 widthAnchor];
    v66 = [v55 widthAnchor];
    v67 = [v65 constraintEqualToAnchor:v66];
    v105[4] = v67;
    v105[5] = v61;
    v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:6];
    v69 = v101;
    [v101 addObjectsFromArray:v68];

    v48 = v102;
    v3 = v103;

    v70 = (void *)MEMORY[0x1E4F28DC8];
    v71 = [(UIView *)v102 contentView];
    v72 = objc_msgSend(v70, "ax_constraintsToMakeView:sameDimensionsAsView:", v55, v71);
    [v101 addObjectsFromArray:v72];

    v73 = v85;
  }
  else
  {
    v74 = [(UIView *)v102 contentView];
    [v74 addSubview:v54];

    v75 = (void *)MEMORY[0x1E4F28DC8];
    v55 = [(UIView *)v102 contentView];
    v73 = objc_msgSend(v75, "ax_constraintsToMakeView:sameDimensionsAsView:", v54, v55);
    v69 = v101;
    [v101 addObjectsFromArray:v73];
  }

  [MEMORY[0x1E4F28DC8] activateConstraints:v69];
  platterView = v3->_platterView;
  v3->_platterView = v48;
  v77 = v48;

  contentView = v3->_contentView;
  v3->_contentView = v54;
  v79 = v54;

  platterBlurEffect = v3->_platterBlurEffect;
  v3->_platterBlurEffect = (UIBlurEffect *)v100;

  return v3;
}

- (NSString)primaryTextStyle
{
  return (NSString *)(id)*MEMORY[0x1E4FB2908];
}

- (double)platterWidth
{
  v2 = (void *)MEMORY[0x1E4FB17A8];
  v3 = [(AXUIPlatterContainerView *)self primaryTextStyle];
  v4 = [v2 metricsForTextStyle:v3];

  [v4 scaledValueForValue:316.0];
  double v6 = v5;

  return v6;
}

- (BOOL)shouldMimicNotificationBannerTopOffset
{
  return 0;
}

- (BOOL)allowsScrolling
{
  return 0;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIBlurEffect)platterBlurEffect
{
  return self->_platterBlurEffect;
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_platterBlurEffect, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
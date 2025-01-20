@interface ICDocCamRecropTransitionAnimator
- (BOOL)presenting;
- (CGRect)containerViewFrame;
- (ICDocCamImageQuad)quadForOverlay;
- (ICDocCamRecropTransitionAnimator)initWithImage:(id)a3 unfilteredImage:(id)a4 orientation:(int64_t)a5 indexPath:(id)a6 duration:(double)a7 completion:(id)a8;
- (NSIndexPath)indexPath;
- (UIImage)filteredImage;
- (UIImage)unfilteredImage;
- (UIView)startView;
- (double)duration;
- (double)matrixTransformingToUnitSquareWithPoints:(double)a1 y0:(double)a2 x1:(double)a3 y1:(double)a4 x2:(double)a5 y2:(double)a6 x3:(double)a7 y3:(double)a8;
- (double)transitionDuration:(id)a3;
- (id)completion;
- (id)imageMeshTransform:(BOOL)a3;
- (id)scrollViewTransform:(BOOL)a3;
- (int64_t)orientation;
- (uint64_t)matrixTransformingQuadForOverlayToImageView:(unsigned char *)a3;
- (void)animateTransition:(id)a3;
- (void)performPopTransitionFromViewController:(id)a3 toViewController:(id)a4 transitionContext:(id)a5;
- (void)performPushTransitionFromViewController:(id)a3 toViewController:(id)a4 transitionContext:(id)a5;
- (void)performSimpleFadeInFromViewController:(id)a3 toViewController:(id)a4 transitionContext:(id)a5;
- (void)setCompletion:(id)a3;
- (void)setContainerViewFrame:(CGRect)a3;
- (void)setDuration:(double)a3;
- (void)setFilteredImage:(id)a3;
- (void)setIndexPath:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setPresenting:(BOOL)a3;
- (void)setQuadForOverlay:(id)a3;
- (void)setStartView:(id)a3;
- (void)setUnfilteredImage:(id)a3;
- (void)sortPoints:(CGPoint *)a3 sorted:(CGPoint *)a4;
@end

@implementation ICDocCamRecropTransitionAnimator

- (ICDocCamRecropTransitionAnimator)initWithImage:(id)a3 unfilteredImage:(id)a4 orientation:(int64_t)a5 indexPath:(id)a6 duration:(double)a7 completion:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ICDocCamRecropTransitionAnimator;
  v19 = [(ICDocCamRecropTransitionAnimator *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_filteredImage, a3);
    objc_storeStrong((id *)&v20->_unfilteredImage, a4);
    v20->_orientation = a5;
    objc_storeStrong((id *)&v20->_indexPath, a6);
    v20->_duration = a7;
    uint64_t v21 = MEMORY[0x21D44FA30](v18);
    id completion = v20->_completion;
    v20->_id completion = (id)v21;
  }
  return v20;
}

- (double)transitionDuration:(id)a3
{
  return 0.14;
}

- (void)animateTransition:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F1D7B0];
  id v5 = a3;
  id v8 = [v5 viewControllerForKey:v4];
  v6 = [v5 viewControllerForKey:*MEMORY[0x263F1D7A0]];
  v7 = [v5 containerView];
  [v7 frame];
  -[ICDocCamRecropTransitionAnimator setContainerViewFrame:](self, "setContainerViewFrame:");

  if ([(ICDocCamRecropTransitionAnimator *)self presenting]) {
    [(ICDocCamRecropTransitionAnimator *)self performPushTransitionFromViewController:v6 toViewController:v8 transitionContext:v5];
  }
  else {
    [(ICDocCamRecropTransitionAnimator *)self performPopTransitionFromViewController:v6 toViewController:v8 transitionContext:v5];
  }
}

- (void)performPushTransitionFromViewController:(id)a3 toViewController:(id)a4 transitionContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 containerView];
  v12 = [v9 view];
  [v11 addSubview:v12];

  [v10 finalFrameForViewController:v9];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  uint64_t v21 = [v9 view];
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  v22 = [v9 view];
  [v22 setNeedsLayout];

  v23 = [v9 view];
  [v23 layoutIfNeeded];

  objc_super v24 = [v9 view];
  v25 = [v24 layer];
  [v25 setOpacity:0.0];

  uint64_t v26 = objc_opt_class();
  v27 = DCDynamicCast(v26, (uint64_t)v9);
  uint64_t v28 = objc_opt_class();
  v29 = DCDynamicCast(v28, (uint64_t)v8);
  v30 = [v27 quadForOverlay];
  v31 = [(ICDocCamRecropTransitionAnimator *)self indexPath];
  [v29 recropTargetForIndexPath:v31];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;

  v40 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v33, v35, v37, v39);
  v41 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v33, v35, v37, v39);
  [(ICDocCamRecropTransitionAnimator *)self setStartView:v41];
  [(ICDocCamRecropTransitionAnimator *)self setQuadForOverlay:v30];
  v42 = [(ICDocCamRecropTransitionAnimator *)self scrollViewTransform:0];
  v138 = [(ICDocCamRecropTransitionAnimator *)self scrollViewTransform:1];
  uint64_t v139 = [(ICDocCamRecropTransitionAnimator *)self imageMeshTransform:0];
  uint64_t v43 = [(ICDocCamRecropTransitionAnimator *)self imageMeshTransform:1];
  v137 = (void *)v43;
  if (v42 && v138 && v139 && v43)
  {
    [v27 placard];
    v44 = v131 = v42;
    [v44 layer];
    v45 = v140 = v27;
    [v45 setOpacity:0.0];

    v46 = [v140 scrollView];
    v47 = [v46 layer];
    [v47 setOpacity:0.0];

    v48 = [v140 overlay];
    v49 = [v48 layer];
    [v49 setOpacity:0.0];

    [v40 setContentMode:0];
    v50 = [(ICDocCamRecropTransitionAnimator *)self unfilteredImage];
    [v40 setImage:v50];

    v51 = [v10 containerView];
    [v51 addSubview:v40];

    [v41 setContentMode:0];
    v52 = [(ICDocCamRecropTransitionAnimator *)self filteredImage];
    [v41 setImage:v52];

    v53 = [v10 containerView];
    [v53 addSubview:v41];

    v54 = [v29 bottomToolbar];
    [v54 frame];
    double v56 = v55;
    [v54 frame];
    double v58 = v57;
    [v54 frame];
    double v60 = v59;
    v130 = v54;
    [v54 frame];
    double v62 = v61;
    v63 = [v29 view];
    [v63 safeAreaInsets];
    double v65 = v62 + v64;

    double v66 = *MEMORY[0x263F1D1C0];
    double v67 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v68 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v69 = *(double *)(MEMORY[0x263F1D1C0] + 24);
    objc_msgSend(v54, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, 0.0, 0.0, v60, v65, *MEMORY[0x263F1D1C0], v67, v68, v69);
    v70 = id v135 = v8;
    [v70 setTranslatesAutoresizingMaskIntoConstraints:0];
    v125 = v70;
    objc_msgSend(v70, "setFrame:", v56, v58, v60, v65);
    v71 = [v10 containerView];
    [v71 addSubview:v70];

    v72 = [v140 buttonContainer];
    [v72 size];
    double v74 = v73;
    [v72 size];
    v129 = v72;
    objc_msgSend(v72, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, 0.0, 0.0, v74, v75, v66, v67, v68, v69);
    v76 = v133 = v30;
    [v72 frame];
    objc_msgSend(v76, "setFrame:");
    [v76 setAccessibilityLabel:@"Fake Button Container"];
    v77 = [v10 containerView];
    [v77 addSubview:v76];

    v78 = [v140 buttonContainer];
    v79 = [v78 layer];
    [v79 setOpacity:0.0];

    v80 = [v76 layer];
    LODWORD(v81) = 1.0;
    [v80 setOpacity:v81];

    v82 = [v41 layer];
    LODWORD(v83) = 1.0;
    [v82 setOpacity:v83];

    id v84 = objc_alloc_init(MEMORY[0x263EFF980]);
    v85 = [v76 bottomAnchor];
    v86 = [v10 containerView];
    [v86 bottomAnchor];
    v87 = v134 = v29;
    [v85 constraintEqualToAnchor:v87 constant:0.0];
    v88 = v136 = v40;
    [v84 addObject:v88];

    v89 = [v76 leadingAnchor];
    v90 = [v10 containerView];
    v91 = [v90 leadingAnchor];
    v92 = [v89 constraintEqualToAnchor:v91 constant:0.0];
    v128 = v84;
    [v84 addObject:v92];

    v93 = [v76 trailingAnchor];
    v94 = [v10 containerView];
    v95 = [v94 trailingAnchor];
    v96 = [v93 constraintEqualToAnchor:v95 constant:0.0];
    [v84 addObject:v96];

    [MEMORY[0x263F08938] activateConstraints:v84];
    [MEMORY[0x263F158F8] begin];
    v97 = (void *)MEMORY[0x263F158F8];
    v141[0] = MEMORY[0x263EF8330];
    v141[1] = 3221225472;
    v141[2] = __111__ICDocCamRecropTransitionAnimator_performPushTransitionFromViewController_toViewController_transitionContext___block_invoke;
    v141[3] = &unk_2642A97A0;
    id v142 = v10;
    v132 = v41;
    id v98 = v41;
    id v143 = v98;
    id v99 = v136;
    id v144 = v99;
    id v145 = v125;
    id v146 = v76;
    id v147 = v140;
    v148 = self;
    id v124 = v9;
    id v149 = v124;
    id v127 = v76;
    id v126 = v125;
    [v97 setCompletionBlock:v141];
    v100 = [MEMORY[0x263F15760] animationWithKeyPath:@"meshTransform"];
    id v123 = v10;
    [v100 setFromValue:v139];
    [v100 setToValue:v137];
    [(ICDocCamRecropTransitionAnimator *)self duration];
    [v100 setDuration:v101 + -0.2];
    uint64_t v102 = *MEMORY[0x263F15AA8];
    [v100 setFillMode:*MEMORY[0x263F15AA8]];
    [v100 setRemovedOnCompletion:0];
    LODWORD(v103) = 1051361018;
    LODWORD(v104) = 1045220557;
    LODWORD(v105) = 1.0;
    v106 = [MEMORY[0x263F15808] functionWithControlPoints:v103 :0.0 :v104 :v105];
    [v100 setTimingFunction:v106];

    v107 = [v98 layer];
    [v107 addAnimation:v100 forKey:@"meshTransform"];

    v108 = [v99 layer];
    [v108 addAnimation:v100 forKey:@"meshTransform"];

    v109 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    [v109 setFromValue:&unk_26C7ED700];
    [v109 setToValue:&unk_26C7ED6E8];
    [(ICDocCamRecropTransitionAnimator *)self duration];
    [v109 setDuration:v110 + -0.2];
    LODWORD(v111) = 1.0;
    [v109 setRepeatCount:v111];
    [v109 setRemovedOnCompletion:0];
    [v109 setFillMode:v102];
    uint64_t v112 = *MEMORY[0x263F15EB8];
    v113 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    [v109 setTimingFunction:v113];

    v114 = [v98 layer];
    [v114 addAnimation:v109 forKey:@"opacity"];

    v40 = v136;
    v115 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    [v115 setFromValue:&unk_26C7ED6E8];
    [v115 setToValue:&unk_26C7ED700];
    [v115 setDuration:0.14];
    LODWORD(v116) = 1.0;
    [v115 setRepeatCount:v116];
    [v115 setRemovedOnCompletion:0];
    [v115 setFillMode:v102];
    v117 = (void *)v139;
    uint64_t v118 = v112;
    v119 = v123;
    v120 = [MEMORY[0x263F15808] functionWithName:v118];
    [v115 setTimingFunction:v120];

    v121 = [v124 view];
    v122 = [v121 layer];
    v42 = v131;
    [v122 addAnimation:v115 forKey:@"opacity"];

    id v8 = v135;
    v27 = v140;
    [MEMORY[0x263F158F8] commit];

    v41 = v132;
    v29 = v134;

    v30 = v133;
  }
  else
  {
    [(ICDocCamRecropTransitionAnimator *)self performSimpleFadeInFromViewController:v8 toViewController:v9 transitionContext:v10];
    v119 = v10;
    v117 = (void *)v139;
  }
}

void __111__ICDocCamRecropTransitionAnimator_performPushTransitionFromViewController_toViewController_transitionContext___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
  [MEMORY[0x263F158F8] begin];
  v2 = (void *)MEMORY[0x263F158F8];
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  v31 = __111__ICDocCamRecropTransitionAnimator_performPushTransitionFromViewController_toViewController_transitionContext___block_invoke_2;
  double v32 = &unk_2642A9778;
  id v33 = *(id *)(a1 + 40);
  id v34 = *(id *)(a1 + 48);
  id v35 = *(id *)(a1 + 56);
  id v36 = *(id *)(a1 + 64);
  id v3 = *(id *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 80);
  id v37 = v3;
  uint64_t v38 = v4;
  [v2 setCompletionBlock:&v29];
  id v5 = objc_msgSend(*(id *)(a1 + 64), "layer", v29, v30, v31, v32);
  LODWORD(v6) = 1.0;
  [v5 setOpacity:v6];

  v7 = [*(id *)(a1 + 72) buttonContainer];
  id v8 = [v7 layer];
  LODWORD(v9) = 1.0;
  [v8 setOpacity:v9];

  id v10 = [*(id *)(a1 + 40) layer];
  [v10 setOpacity:0.0];

  v11 = [*(id *)(a1 + 88) view];
  v12 = [v11 layer];
  LODWORD(v13) = 1.0;
  [v12 setOpacity:v13];

  double v14 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v14 setFromValue:&unk_26C7ED6E8];
  [v14 setToValue:&unk_26C7ED700];
  [v14 setDuration:0.2];
  LODWORD(v15) = 1.0;
  [v14 setRepeatCount:v15];
  [v14 setRemovedOnCompletion:0];
  uint64_t v16 = *MEMORY[0x263F15AA8];
  [v14 setFillMode:*MEMORY[0x263F15AA8]];
  uint64_t v17 = *MEMORY[0x263F15EB8];
  double v18 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v14 setTimingFunction:v18];

  double v19 = [*(id *)(a1 + 72) scrollView];
  double v20 = [v19 layer];
  [v20 addAnimation:v14 forKey:@"opacity"];

  uint64_t v21 = [*(id *)(a1 + 72) overlay];
  v22 = [v21 layer];
  [v22 addAnimation:v14 forKey:@"opacity"];

  v23 = [*(id *)(a1 + 72) placard];
  objc_super v24 = [v23 layer];
  [v24 addAnimation:v14 forKey:@"opacity"];

  v25 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v25 setFromValue:&unk_26C7ED700];
  [v25 setToValue:&unk_26C7ED6E8];
  [v25 setDuration:0.2];
  LODWORD(v26) = 1.0;
  [v25 setRepeatCount:v26];
  [v25 setRemovedOnCompletion:0];
  [v25 setFillMode:v16];
  v27 = [MEMORY[0x263F15808] functionWithName:v17];
  [v25 setTimingFunction:v27];

  uint64_t v28 = [*(id *)(a1 + 48) layer];
  [v28 addAnimation:v25 forKey:@"opacity"];

  [MEMORY[0x263F158F8] commit];
}

void __111__ICDocCamRecropTransitionAnimator_performPushTransitionFromViewController_toViewController_transitionContext___block_invoke_2(id *a1)
{
  [a1[4] removeFromSuperview];
  [a1[5] removeFromSuperview];
  [a1[6] removeFromSuperview];
  [a1[7] removeFromSuperview];
  v2 = [a1[8] scrollView];
  id v3 = [v2 layer];
  LODWORD(v4) = 1.0;
  [v3 setOpacity:v4];

  id v5 = [a1[8] overlay];
  double v6 = [v5 layer];
  LODWORD(v7) = 1.0;
  [v6 setOpacity:v7];

  id v8 = [a1[9] completion];

  if (v8)
  {
    double v9 = [a1[9] completion];
    v9[2]();
  }
}

- (void)performPopTransitionFromViewController:(id)a3 toViewController:(id)a4 transitionContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [v9 containerView];
  v12 = [v8 view];
  [v11 addSubview:v12];

  [v9 finalFrameForViewController:v8];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  uint64_t v21 = [v8 view];
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  v22 = [v8 view];
  [v22 setNeedsLayout];

  v23 = [v8 view];
  [v23 layoutIfNeeded];

  uint64_t v24 = objc_opt_class();
  v25 = DCDynamicCast(v24, (uint64_t)v10);

  uint64_t v26 = objc_opt_class();
  v27 = DCDynamicCast(v26, (uint64_t)v8);
  [v27 updateFilterViewLayoutIfNeeded];
  [v27 resetImageCentering];
  uint64_t v28 = [(ICDocCamRecropTransitionAnimator *)self indexPath];
  [v27 recropTargetForIndexPath:v28];
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;

  id v37 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v30, v32, v34, v36);
  uint64_t v38 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v30, v32, v34, v36);
  [v37 setAccessibilityLabel:@"unfilteredImageView"];
  [v38 setAccessibilityLabel:@"filteredImageView"];
  [(ICDocCamRecropTransitionAnimator *)self setStartView:v38];
  v121 = v25;
  double v39 = [v25 finalQuadFromOverlay];
  [(ICDocCamRecropTransitionAnimator *)self setQuadForOverlay:v39];

  v125 = [(ICDocCamRecropTransitionAnimator *)self imageMeshTransform:1];
  id v124 = [(ICDocCamRecropTransitionAnimator *)self imageMeshTransform:0];
  v40 = [v8 view];
  v41 = [v40 layer];
  [v41 setOpacity:0.0];

  [v38 setContentMode:0];
  v42 = [(ICDocCamRecropTransitionAnimator *)self filteredImage];
  [v38 setImage:v42];

  uint64_t v43 = [v9 containerView];
  [v43 addSubview:v38];

  [v37 setContentMode:0];
  v44 = [(ICDocCamRecropTransitionAnimator *)self unfilteredImage];
  [v37 setImage:v44];

  v45 = [v9 containerView];
  v122 = v37;
  [v45 addSubview:v37];

  v46 = [v27 pageViewController];
  v47 = [v46 view];
  v48 = [v47 layer];
  [v48 setOpacity:0.0];

  v49 = [v27 bottomToolbar];
  [v49 frame];
  double v51 = v50;
  [v49 frame];
  double v53 = v52;
  [v49 frame];
  double v55 = v54;
  [v49 frame];
  double v57 = v56;
  double v58 = [v27 view];
  [v58 safeAreaInsets];
  double v60 = v57 + v59;

  double v62 = *MEMORY[0x263F1D1C0];
  double v61 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v64 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v63 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  v120 = v49;
  double v65 = objc_msgSend(v49, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, 0.0, 0.0, v55, v60, *MEMORY[0x263F1D1C0], v61, v64, v63);
  [v65 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(v65, "setFrame:", v51, v53, v55, v60);
  double v66 = [v9 containerView];
  [v66 addSubview:v65];

  double v67 = [v27 filterViewController];
  v119 = v67;
  if (v67)
  {
    double v68 = [v67 scrollView];
    [v68 bounds];
    double v69 = objc_msgSend(v68, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1);
    [v69 setAccessibilityLabel:@"fakeFilterScrollView"];
    [v69 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v68 frame];
    objc_msgSend(v69, "setFrame:");
    objc_msgSend(v69, "setHidden:", objc_msgSend(v68, "isHidden"));
    v70 = v9;
    v71 = [v9 containerView];
    [v71 addSubview:v69];
    v72 = 0;
  }
  else
  {
    double v68 = [v27 topToolbar];
    [v68 size];
    double v74 = v73;
    [v68 size];
    v72 = objc_msgSend(v68, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, 0.0, 0.0, v74, v75, v62, v61, v64, v63);
    [v72 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v68 frame];
    objc_msgSend(v72, "setFrame:");
    v70 = v9;
    v71 = [v9 containerView];
    [v71 addSubview:v72];
    double v69 = 0;
  }

  v76 = [v8 view];
  v77 = [v76 layer];
  [v77 setOpacity:0.0];

  [MEMORY[0x263F158F8] begin];
  v78 = (void *)MEMORY[0x263F158F8];
  v126[0] = MEMORY[0x263EF8330];
  v126[1] = 3221225472;
  v126[2] = __110__ICDocCamRecropTransitionAnimator_performPopTransitionFromViewController_toViewController_transitionContext___block_invoke;
  v126[3] = &unk_2642A97C8;
  id v127 = v70;
  id v128 = v27;
  id v129 = v8;
  id v130 = v38;
  id v131 = v122;
  id v132 = v65;
  id v133 = v72;
  id v134 = v69;
  id v135 = self;
  id v118 = v69;
  id v117 = v72;
  id v116 = v65;
  id v79 = v122;
  id v113 = v38;
  id v123 = v8;
  id v115 = v27;
  id v114 = v70;
  [v78 setCompletionBlock:v126];
  [(ICDocCamRecropTransitionAnimator *)self duration];
  double v81 = v80 + -0.2;
  v82 = [MEMORY[0x263F15760] animationWithKeyPath:@"meshTransform"];
  [v82 setFromValue:v125];
  [v82 setToValue:v124];
  [v82 setDuration:v81];
  uint64_t v83 = *MEMORY[0x263F15AA8];
  [v82 setFillMode:*MEMORY[0x263F15AA8]];
  [v82 setRemovedOnCompletion:0];
  LODWORD(v84) = 1051361018;
  LODWORD(v85) = 1045220557;
  LODWORD(v86) = 1.0;
  v87 = [MEMORY[0x263F15808] functionWithControlPoints:v84 :0.0 :v85 :v86];
  [v82 setTimingFunction:v87];

  v88 = [v113 layer];
  [v88 addAnimation:v82 forKey:@"meshTransform"];

  v89 = v79;
  uint64_t v112 = v79;
  v90 = [v79 layer];
  [v90 addAnimation:v82 forKey:@"meshTransform"];

  v91 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v91 setFromValue:&unk_26C7ED700];
  [v91 setToValue:&unk_26C7ED6E8];
  [v91 setDuration:v81];
  LODWORD(v92) = 1.0;
  [v91 setRepeatCount:v92];
  [v91 setRemovedOnCompletion:0];
  [v91 setFillMode:v83];
  uint64_t v93 = *MEMORY[0x263F15EB8];
  v94 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v91 setTimingFunction:v94];

  v95 = [v89 layer];
  [v95 addAnimation:v91 forKey:@"opacity"];

  v96 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v96 setFromValue:&unk_26C7ED6E8];
  [v96 setToValue:&unk_26C7ED700];
  [v96 setDuration:0.14];
  LODWORD(v97) = 1.0;
  [v96 setRepeatCount:v97];
  [v96 setRemovedOnCompletion:0];
  [v96 setFillMode:v83];
  id v98 = [MEMORY[0x263F15808] functionWithName:v93];
  [v96 setTimingFunction:v98];

  id v99 = [v123 view];
  v100 = [v99 layer];
  [v100 addAnimation:v96 forKey:@"opacity"];

  double v101 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v101 setFromValue:&unk_26C7ED700];
  [v101 setToValue:&unk_26C7ED6E8];
  [v101 setDuration:0.14];
  LODWORD(v102) = 1.0;
  [v101 setRepeatCount:v102];
  [v101 setRemovedOnCompletion:0];
  [v101 setFillMode:v83];
  double v103 = [MEMORY[0x263F15808] functionWithName:v93];
  [v101 setTimingFunction:v103];

  double v104 = [v121 overlay];
  double v105 = [v104 layer];
  [v105 addAnimation:v101 forKey:@"opacity"];

  v106 = [v121 placard];
  v107 = [v106 layer];
  [v107 addAnimation:v101 forKey:@"opacity"];

  v108 = [v121 backgroundImageView];
  v109 = [v108 layer];
  [v109 addAnimation:v101 forKey:@"opacity"];

  double v110 = [v121 imageView];
  double v111 = [v110 layer];
  [v111 addAnimation:v101 forKey:@"opacity"];

  [MEMORY[0x263F158F8] commit];
}

void __110__ICDocCamRecropTransitionAnimator_performPopTransitionFromViewController_toViewController_transitionContext___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
  v2 = [*(id *)(a1 + 40) pageViewController];
  id v3 = [v2 view];
  double v4 = [v3 layer];
  LODWORD(v5) = 1.0;
  [v4 setOpacity:v5];

  double v6 = [*(id *)(a1 + 48) view];
  double v7 = [v6 layer];
  LODWORD(v8) = 1.0;
  [v7 setOpacity:v8];

  [MEMORY[0x263F158F8] begin];
  id v9 = (void *)MEMORY[0x263F158F8];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  double v19 = __110__ICDocCamRecropTransitionAnimator_performPopTransitionFromViewController_toViewController_transitionContext___block_invoke_2;
  double v20 = &unk_2642A9778;
  id v21 = *(id *)(a1 + 56);
  id v22 = *(id *)(a1 + 64);
  id v23 = *(id *)(a1 + 72);
  id v24 = *(id *)(a1 + 80);
  id v10 = *(id *)(a1 + 88);
  uint64_t v11 = *(void *)(a1 + 96);
  id v25 = v10;
  uint64_t v26 = v11;
  [v9 setCompletionBlock:&v17];
  v12 = objc_msgSend(*(id *)(a1 + 56), "layer", v17, v18, v19, v20);
  [v12 setOpacity:0.0];

  double v13 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v13 setFromValue:&unk_26C7ED700];
  [v13 setToValue:&unk_26C7ED6E8];
  [v13 setDuration:0.2];
  LODWORD(v14) = 1.0;
  [v13 setRepeatCount:v14];
  [v13 setRemovedOnCompletion:0];
  [v13 setFillMode:*MEMORY[0x263F15AA8]];
  double v15 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v13 setTimingFunction:v15];

  double v16 = [*(id *)(a1 + 56) layer];
  [v16 addAnimation:v13 forKey:@"opacity"];

  [MEMORY[0x263F158F8] commit];
}

void __110__ICDocCamRecropTransitionAnimator_performPopTransitionFromViewController_toViewController_transitionContext___block_invoke_2(id *a1)
{
  [a1[4] removeFromSuperview];
  [a1[5] removeFromSuperview];
  [a1[6] removeFromSuperview];
  [a1[7] removeFromSuperview];
  [a1[8] removeFromSuperview];
  v2 = [a1[9] completion];

  if (v2)
  {
    id v3 = [a1[9] completion];
    v3[2]();
  }
}

- (void)performSimpleFadeInFromViewController:(id)a3 toViewController:(id)a4 transitionContext:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 view];
  id v10 = [v9 layer];
  [v10 setOpacity:0.0];

  [MEMORY[0x263F158F8] begin];
  uint64_t v11 = (void *)MEMORY[0x263F158F8];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __109__ICDocCamRecropTransitionAnimator_performSimpleFadeInFromViewController_toViewController_transitionContext___block_invoke;
  v19[3] = &unk_2642A97F0;
  id v20 = v8;
  id v21 = v7;
  id v22 = self;
  id v12 = v7;
  id v13 = v8;
  [v11 setCompletionBlock:v19];
  double v14 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v14 setFromValue:&unk_26C7ED6E8];
  [v14 setToValue:&unk_26C7ED700];
  [(ICDocCamRecropTransitionAnimator *)self transitionDuration:v13];
  objc_msgSend(v14, "setDuration:");
  LODWORD(v15) = 1.0;
  [v14 setRepeatCount:v15];
  [v14 setRemovedOnCompletion:0];
  [v14 setFillMode:*MEMORY[0x263F15AA8]];
  double v16 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v14 setTimingFunction:v16];

  uint64_t v17 = [v12 view];
  uint64_t v18 = [v17 layer];
  [v18 addAnimation:v14 forKey:@"opacity"];

  [MEMORY[0x263F158F8] commit];
}

void __109__ICDocCamRecropTransitionAnimator_performSimpleFadeInFromViewController_toViewController_transitionContext___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "completeTransition:", objc_msgSend(a1[4], "transitionWasCancelled") ^ 1);
  v2 = [a1[5] view];
  id v3 = [v2 layer];
  LODWORD(v4) = 1.0;
  [v3 setOpacity:v4];

  double v5 = [a1[6] completion];

  if (v5)
  {
    double v6 = [a1[6] completion];
    v6[2]();
  }
}

- (id)imageMeshTransform:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [MEMORY[0x263F15830] meshTransform];
  double v6 = v5;
  if (!v3)
  {
    long long v83 = xmmword_21791AA30;
    long long v84 = xmmword_21791AA30;
    uint64_t v85 = 0;
    [v5 addVertex:&v83];
    __asm { FMOV            V0.2D, #1.0 }
    long long v83 = _Q0;
    long long v84 = _Q0;
    uint64_t v85 = 0;
    [v6 addVertex:&v83];
    long long v83 = xmmword_21791AA40;
    uint64_t v85 = 0;
    long long v84 = 0x3FF0000000000000uLL;
    [v6 addVertex:&v83];
    uint64_t v85 = 0;
    long long v83 = 0u;
    long long v84 = 0u;
LABEL_12:
    objc_msgSend(v6, "addVertex:", &v83, *(void *)&v77, *(void *)&v78);
    long long v84 = 0uLL;
    long long v83 = xmmword_21791AA50;
    [v6 addFace:&v83];
    [v6 setSubdivisionSteps:0];
    id v75 = v6;
    goto LABEL_13;
  }
  id v7 = [(ICDocCamRecropTransitionAnimator *)self startView];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  long long v86 = 0uLL;
  if (![(ICDocCamRecropTransitionAnimator *)self orientation])
  {
    double v35 = [(ICDocCamRecropTransitionAnimator *)self quadForOverlay];
    [v35 topLeft];
    double v18 = v36;
    double v20 = v37;

    uint64_t v38 = [(ICDocCamRecropTransitionAnimator *)self quadForOverlay];
    [v38 topRight];
    double v81 = v40;
    double v82 = v39;

    v41 = [(ICDocCamRecropTransitionAnimator *)self quadForOverlay];
    [v41 bottomLeft];
    double v79 = v43;
    double v80 = v42;

    v27 = [(ICDocCamRecropTransitionAnimator *)self quadForOverlay];
    [v27 bottomRight];
    goto LABEL_11;
  }
  if ([(ICDocCamRecropTransitionAnimator *)self orientation] == 2)
  {
    double v16 = [(ICDocCamRecropTransitionAnimator *)self quadForOverlay];
    [v16 topRight];
    double v18 = v17;
    double v20 = v19;

    id v21 = [(ICDocCamRecropTransitionAnimator *)self quadForOverlay];
    [v21 bottomRight];
    double v81 = v23;
    double v82 = v22;

    id v24 = [(ICDocCamRecropTransitionAnimator *)self quadForOverlay];
    [v24 topLeft];
    double v79 = v26;
    double v80 = v25;

    v27 = [(ICDocCamRecropTransitionAnimator *)self quadForOverlay];
    [v27 bottomLeft];
LABEL_11:
    double v77 = v29;
    double v78 = v28;
    double v62 = v9 + v13;
    double v63 = v11 + v15;

    double v64 = (v18 - v9) / v13 + 0.0;
    double v65 = (v20 - v11) / v15 + 0.0;
    double v66 = (v81 - v11) / v15;
    double v67 = v15;
    double v68 = (v82 - (v9 + v13)) / v13 + 1.0;
    double v69 = v13;
    double v70 = v66 + 0.0;
    double v71 = (v80 - v9) / v69 + 0.0;
    double v72 = (v78 - v62) / v69 + 1.0;
    long long v83 = xmmword_21791AA30;
    double v73 = (v77 - v63) / v67 + 1.0;
    *(double *)&long long v84 = v71;
    *((double *)&v84 + 1) = (v79 - v63) / v67 + 1.0;
    uint64_t v85 = 0;
    [v6 addVertex:&v83];
    __asm { FMOV            V0.2D, #1.0 }
    long long v83 = _Q0;
    *(double *)&long long v84 = v72;
    *((double *)&v84 + 1) = v73;
    uint64_t v85 = 0;
    [v6 addVertex:&v83];
    long long v83 = xmmword_21791AA40;
    *(double *)&long long v84 = v68;
    *((double *)&v84 + 1) = v70;
    uint64_t v85 = 0;
    [v6 addVertex:&v83];
    long long v83 = v86;
    *(double *)&long long v84 = v64;
    *((double *)&v84 + 1) = v65;
    uint64_t v85 = 0;
    goto LABEL_12;
  }
  if ([(ICDocCamRecropTransitionAnimator *)self orientation] == 3)
  {
    v44 = [(ICDocCamRecropTransitionAnimator *)self quadForOverlay];
    [v44 bottomLeft];
    double v18 = v45;
    double v20 = v46;

    v47 = [(ICDocCamRecropTransitionAnimator *)self quadForOverlay];
    [v47 topLeft];
    double v81 = v49;
    double v82 = v48;

    double v50 = [(ICDocCamRecropTransitionAnimator *)self quadForOverlay];
    [v50 bottomRight];
    double v79 = v52;
    double v80 = v51;

    v27 = [(ICDocCamRecropTransitionAnimator *)self quadForOverlay];
    [v27 topRight];
    goto LABEL_11;
  }
  if ([(ICDocCamRecropTransitionAnimator *)self orientation] == 1)
  {
    double v53 = [(ICDocCamRecropTransitionAnimator *)self quadForOverlay];
    [v53 bottomRight];
    double v18 = v54;
    double v20 = v55;

    double v56 = [(ICDocCamRecropTransitionAnimator *)self quadForOverlay];
    [v56 bottomLeft];
    double v81 = v58;
    double v82 = v57;

    double v59 = [(ICDocCamRecropTransitionAnimator *)self quadForOverlay];
    [v59 topRight];
    double v79 = v61;
    double v80 = v60;

    v27 = [(ICDocCamRecropTransitionAnimator *)self quadForOverlay];
    [v27 topLeft];
    goto LABEL_11;
  }
  id v75 = 0;
LABEL_13:

  return v75;
}

- (id)scrollViewTransform:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [MEMORY[0x263F15830] meshTransform];
  double v6 = v5;
  if (v3)
  {
    long long v54 = xmmword_21791AA30;
    float64x2_t v55 = (float64x2_t)xmmword_21791AA30;
    uint64_t v56 = 0;
    [v5 addVertex:&v54];
    __asm { FMOV            V0.2D, #1.0 }
    long long v54 = _Q0;
    float64x2_t v55 = (float64x2_t)_Q0;
    uint64_t v56 = 0;
    [v6 addVertex:&v54];
    long long v54 = xmmword_21791AA40;
    uint64_t v56 = 0;
    float64x2_t v55 = (float64x2_t)0x3FF0000000000000uLL;
    [v6 addVertex:&v54];
    uint64_t v56 = 0;
    long long v54 = 0u;
    float64x2_t v55 = 0u;
LABEL_5:
    [v6 addVertex:&v54];
    float64x2_t v55 = 0uLL;
    long long v54 = xmmword_21791AA50;
    [v6 addFace:&v54];
    [v6 setSubdivisionSteps:0];
    id v37 = v6;
    goto LABEL_7;
  }
  char v53 = 0;
  [(ICDocCamRecropTransitionAnimator *)self matrixTransformingQuadForOverlayToImageView:&v53];
  if (v53)
  {
    float32x4_t v42 = v13;
    float32x4_t v44 = v14;
    float32x4_t v40 = v12;
    [(ICDocCamRecropTransitionAnimator *)self containerViewFrame];
    float64_t x = v58.origin.x;
    float64_t y = v58.origin.y;
    CGFloat width = v58.size.width;
    CGFloat rect = v58.size.height;
    double MinX = CGRectGetMinX(v58);
    v59.origin.float64_t x = x;
    v59.origin.float64_t y = y;
    v59.size.CGFloat width = width;
    v59.size.height = rect;
    double MaxY = CGRectGetMaxY(v59);
    v60.origin.float64_t x = x;
    v60.origin.float64_t y = y;
    v60.size.CGFloat width = width;
    v60.size.height = rect;
    double MaxX = CGRectGetMaxX(v60);
    v61.origin.float64_t x = x;
    v61.origin.float64_t y = y;
    v61.size.CGFloat width = width;
    v61.size.height = rect;
    double v18 = CGRectGetMaxY(v61);
    v62.origin.float64_t x = x;
    v62.origin.float64_t y = y;
    v62.size.CGFloat width = width;
    v62.size.height = rect;
    double v19 = CGRectGetMaxX(v62);
    v63.origin.float64_t x = x;
    v63.origin.float64_t y = y;
    v63.size.CGFloat width = width;
    v63.size.height = rect;
    double MinY = CGRectGetMinY(v63);
    v64.origin.float64_t x = x;
    v64.origin.float64_t y = y;
    v64.size.CGFloat width = width;
    v64.size.height = rect;
    double v21 = CGRectGetMinX(v64);
    v65.origin.float64_t x = x;
    v65.origin.float64_t y = y;
    v65.size.CGFloat width = width;
    v65.size.height = rect;
    CGFloat v22 = CGRectGetMinY(v65);
    float v23 = MinX;
    float v24 = MaxY;
    float v25 = MaxX;
    float v26 = v18;
    float v27 = v19;
    float v28 = MinY;
    float v29 = v21;
    *(float *)&CGFloat v22 = v22;
    int32x4_t v30 = (int32x4_t)vaddq_f32(v44, vmlaq_n_f32(vmulq_n_f32(v40, v23), v42, v24));
    int32x4_t v31 = (int32x4_t)vaddq_f32(v44, vmlaq_n_f32(vmulq_n_f32(v40, v25), v42, v26));
    int32x4_t v39 = (int32x4_t)vaddq_f32(v44, vmlaq_n_f32(vmulq_n_f32(v40, v27), v42, v28));
    int32x4_t v45 = (int32x4_t)vaddq_f32(v44, vmlaq_n_f32(vmulq_n_f32(v40, v29), v42, *(float *)&v22));
    v32.f64[0] = width;
    v32.f64[1] = rect;
    uint64_t v56 = 0;
    v33.f64[0] = x;
    v33.f64[1] = y;
    float64x2_t recta = v33;
    float64x2_t v52 = v32;
    __asm { FMOV            V7.2D, #1.0 }
    long long v41 = (__int128)_Q7;
    float64x2_t v43 = vaddq_f64(v33, v32);
    v35.f64[1] = v43.f64[1];
    v35.f64[0] = x;
    float64x2_t v49 = vaddq_f64(vdivq_f64(vsubq_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v31.i8, (float32x2_t)vdup_laneq_s32(v31, 2))), v43), v32), _Q7);
    long long v54 = xmmword_21791AA30;
    float64x2_t v55 = vaddq_f64(vdivq_f64(vsubq_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v30.i8, (float32x2_t)vdup_laneq_s32(v30, 2))), v35), v32), (float64x2_t)xmmword_21791AA30);
    [v6 addVertex:&v54];
    long long v54 = v41;
    float64x2_t v55 = v49;
    uint64_t v56 = 0;
    [v6 addVertex:&v54];
    v36.f64[0] = v43.f64[0];
    v36.f64[1] = y;
    long long v54 = xmmword_21791AA40;
    float64x2_t v55 = vaddq_f64(vdivq_f64(vsubq_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v39.i8, (float32x2_t)vdup_laneq_s32(v39, 2))), v36), v52), (float64x2_t)xmmword_21791AA40);
    uint64_t v56 = 0;
    [v6 addVertex:&v54];
    long long v54 = 0uLL;
    float64x2_t v55 = vaddq_f64(vdivq_f64(vsubq_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v45.i8, (float32x2_t)vdup_laneq_s32(v45, 2))), recta), v52), (float64x2_t)0);
    uint64_t v56 = 0;
    goto LABEL_5;
  }
  id v37 = 0;
LABEL_7:

  return v37;
}

- (uint64_t)matrixTransformingQuadForOverlayToImageView:(unsigned char *)a3
{
  v55[8] = *MEMORY[0x263EF8340];
  double v5 = [a1 startView];
  [v5 frame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  float32x4_t v14 = [a1 quadForOverlay];
  [v14 topLeft];
  uint64_t v16 = v15;
  double v17 = [a1 quadForOverlay];
  [v17 topLeft];
  v55[0] = v16;
  v55[1] = v18;
  double v19 = [a1 quadForOverlay];
  [v19 topRight];
  uint64_t v21 = v20;
  CGFloat v22 = [a1 quadForOverlay];
  [v22 topRight];
  v55[2] = v21;
  v55[3] = v23;
  float v24 = [a1 quadForOverlay];
  [v24 bottomRight];
  uint64_t v26 = v25;
  float v27 = [a1 quadForOverlay];
  [v27 bottomRight];
  v55[4] = v26;
  v55[5] = v28;
  float v29 = [a1 quadForOverlay];
  [v29 bottomLeft];
  uint64_t v31 = v30;
  float64x2_t v32 = [a1 quadForOverlay];
  [v32 bottomLeft];
  v55[6] = v31;
  v55[7] = v33;

  [a1 sortPoints:v55 sorted:v54];
  uint64_t result = [a1 matrixTransformingToUnitSquareWithPoints:v54[0] y0:v54[1] x1:v54[2] y1:v54[3] x2:v54[4] y2:v54[5] x3:v54[6] y3:v54[7]];
  float32x4_t v36 = vmulq_f32((float32x4_t)v35.columns[0], vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v35.columns[2], (int8x16_t)v35.columns[2], 0xCuLL), (int8x16_t)v35.columns[2], 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v35.columns[1], (int32x4_t)v35.columns[1]), (int8x16_t)v35.columns[1], 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v35.columns[2], (int32x4_t)v35.columns[2]), (int8x16_t)v35.columns[2], 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v35.columns[1], (int8x16_t)v35.columns[1], 0xCuLL), (int8x16_t)v35.columns[1], 8uLL)));
  if (fabsf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v36, 2), vaddq_f32(v36, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1))).f32[0]) >= 0.01)
  {
    simd_float3x3 v56 = __invert_f3(v35);
    simd_float3 v50 = v56.columns[1];
    simd_float3 v51 = v56.columns[0];
    simd_float3 v49 = v56.columns[2];
    *(CGFloat *)v56.columns[0].i64 = v7;
    *(CGFloat *)v56.columns[1].i64 = v9;
    *(CGFloat *)v56.columns[2].i64 = v11;
    CGFloat v37 = v13;
    double MinX = CGRectGetMinX(*(CGRect *)v56.columns[0].f32);
    v57.origin.float64_t x = v7;
    v57.origin.float64_t y = v9;
    v57.size.CGFloat width = v11;
    v57.size.height = v13;
    double MaxY = CGRectGetMaxY(v57);
    v58.origin.float64_t x = v7;
    v58.origin.float64_t y = v9;
    v58.size.CGFloat width = v11;
    v58.size.height = v13;
    double MaxX = CGRectGetMaxX(v58);
    v59.origin.float64_t x = v7;
    v59.origin.float64_t y = v9;
    v59.size.CGFloat width = v11;
    v59.size.height = v13;
    double v38 = CGRectGetMaxY(v59);
    v60.origin.float64_t x = v7;
    v60.origin.float64_t y = v9;
    v60.size.CGFloat width = v11;
    v60.size.height = v13;
    double v39 = CGRectGetMaxX(v60);
    v61.origin.float64_t x = v7;
    v61.origin.float64_t y = v9;
    v61.size.CGFloat width = v11;
    v61.size.height = v13;
    double MinY = CGRectGetMinY(v61);
    v62.origin.float64_t x = v7;
    v62.origin.float64_t y = v9;
    v62.size.CGFloat width = v11;
    v62.size.height = v13;
    double v41 = CGRectGetMinX(v62);
    v63.origin.float64_t x = v7;
    v63.origin.float64_t y = v9;
    v63.size.CGFloat width = v11;
    v63.size.height = v13;
    uint64_t result = [a1 matrixTransformingToUnitSquareWithPoints:MinX y0:MaxY x1:MaxX y1:v38 x2:v39 y2:MinY x3:v41 y3:CGRectGetMinY(v63)];
    uint64_t v45 = 0;
    v52[0] = v51;
    v52[1] = v50;
    v52[2] = v49;
    memset(v53, 0, sizeof(v53));
    do
    {
      v53[v45] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v42, COERCE_FLOAT(v52[v45])), v43, *(float32x2_t *)&v52[v45], 1), v44, (float32x4_t)v52[v45], 2);
      ++v45;
    }
    while (v45 != 3);
    *a3 = 1;
  }
  else
  {
    *a3 = 0;
  }
  return result;
}

- (void)sortPoints:(CGPoint *)a3 sorted:(CGPoint *)a4
{
  v53[4] = *MEMORY[0x263EF8340];
  double v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", a3->x, a3->y);
  v53[0] = v6;
  CGFloat v7 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", a3[1].x, a3[1].y);
  v53[1] = v7;
  double v8 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", a3[2].x, a3[2].y);
  v53[2] = v8;
  CGFloat v9 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", a3[3].x, a3[3].y);
  _OWORD v53[3] = v9;
  double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:4];

  CGFloat v11 = [v10 sortedArrayUsingComparator:&__block_literal_global_2];
  double v12 = [v11 objectAtIndexedSubscript:0];
  [v12 CGPointValue];
  double v14 = v13;

  uint64_t v15 = [v11 objectAtIndexedSubscript:1];
  [v15 CGPointValue];
  double v17 = v16;

  uint64_t v18 = 2;
  double v19 = [v11 objectAtIndexedSubscript:2];
  [v19 CGPointValue];
  double v21 = v20;

  CGFloat v22 = [v11 objectAtIndexedSubscript:3];
  [v22 CGPointValue];
  double v24 = v23;

  BOOL v25 = v14 < v17;
  if (v24 >= v21) {
    uint64_t v26 = 2;
  }
  else {
    uint64_t v26 = 3;
  }
  if (v24 >= v21) {
    uint64_t v18 = 3;
  }
  float v27 = [v11 objectAtIndexedSubscript:v14 >= v17];
  [v27 CGPointValue];
  CGFloat v29 = v28;
  double v31 = v30;

  float64x2_t v32 = [v11 objectAtIndexedSubscript:v26];
  [v32 CGPointValue];
  double v34 = v33;
  CGFloat v36 = v35;

  CGFloat v37 = [v11 objectAtIndexedSubscript:v18];
  [v37 CGPointValue];
  double v39 = v38;
  double v41 = v40;

  float32x4_t v42 = [v11 objectAtIndexedSubscript:v25];
  [v42 CGPointValue];
  CGFloat v44 = v43;
  CGFloat v46 = v45;

  if (v41 < v31 && v39 < v34)
  {
    v47 = [v11 objectAtIndexedSubscript:v18];
    [v47 CGPointValue];
    double v34 = v48;
    CGFloat v36 = v49;

    simd_float3 v50 = [v11 objectAtIndexedSubscript:v26];
    [v50 CGPointValue];
    double v39 = v51;
    double v41 = v52;
  }
  a4->float64_t x = v44;
  a4->float64_t y = v46;
  a4[1].float64_t x = v39;
  a4[1].float64_t y = v41;
  a4[2].float64_t x = v34;
  a4[2].float64_t y = v36;
  a4[3].float64_t x = v29;
  a4[3].float64_t y = v31;
}

uint64_t __54__ICDocCamRecropTransitionAnimator_sortPoints_sorted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v4 = NSNumber;
  id v5 = a3;
  [a2 CGPointValue];
  double v6 = objc_msgSend(v4, "numberWithDouble:");
  CGFloat v7 = NSNumber;
  [v5 CGPointValue];
  double v9 = v8;

  double v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (double)matrixTransformingToUnitSquareWithPoints:(double)a1 y0:(double)a2 x1:(double)a3 y1:(double)a4 x2:(double)a5 y2:(double)a6 x3:(double)a7 y3:(double)a8
{
  double v8 = a1 - a3 + a5 - a7;
  double v9 = a2 - a4 + a6 - a8;
  if (v8 == 0.0 && v9 == 0.0)
  {
    double v10 = a3 - a1;
    double v11 = a4 - a2;
  }
  else
  {
    float v12 = v8;
    float v13 = v9;
    float v14 = a7 - a5;
    float v15 = a8 - a6;
    float v16 = a3 - a5;
    float v17 = a4 - a6;
    double v18 = (float)((float)((float)(v12 * v15) - (float)(v13 * v14)) / (float)((float)(v16 * v15) - (float)(v17 * v14)));
    double v10 = a3 - a1 + v18 * a3;
    double v11 = a4 - a2 + v18 * a4;
  }
  *(float *)&double v19 = v10;
  float v20 = v11;
  *((float *)&v19 + 1) = v20;
  __asm { FMOV            V2.4S, #1.0 }
  return v19;
}

- (BOOL)presenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (UIImage)filteredImage
{
  return self->_filteredImage;
}

- (void)setFilteredImage:(id)a3
{
}

- (UIImage)unfilteredImage
{
  return self->_unfilteredImage;
}

- (void)setUnfilteredImage:(id)a3
{
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (CGRect)containerViewFrame
{
  double x = self->_containerViewFrame.origin.x;
  double y = self->_containerViewFrame.origin.y;
  double width = self->_containerViewFrame.size.width;
  double height = self->_containerViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContainerViewFrame:(CGRect)a3
{
  self->_containerViewFrame = a3;
}

- (UIView)startView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_startView);

  return (UIView *)WeakRetained;
}

- (void)setStartView:(id)a3
{
}

- (ICDocCamImageQuad)quadForOverlay
{
  return self->_quadForOverlay;
}

- (void)setQuadForOverlay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quadForOverlay, 0);
  objc_destroyWeak((id *)&self->_startView);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_unfilteredImage, 0);

  objc_storeStrong((id *)&self->_filteredImage, 0);
}

@end
@interface ICDocCamThumbnailZoomTransitionAnimator
- (BOOL)_shouldCrossFadeNavigationBar;
- (BOOL)presenting;
- (ICDocCamThumbnailZoomTransitionAnimator)initWithImage:(id)a3 indexPath:(id)a4 duration:(double)a5 completion:(id)a6;
- (NSIndexPath)indexPath;
- (UIImage)thumbnailImage;
- (double)duration;
- (id)completion;
- (void)animateTransition:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDuration:(double)a3;
- (void)setIndexPath:(id)a3;
- (void)setPresenting:(BOOL)a3;
- (void)setThumbnailImage:(id)a3;
@end

@implementation ICDocCamThumbnailZoomTransitionAnimator

- (ICDocCamThumbnailZoomTransitionAnimator)initWithImage:(id)a3 indexPath:(id)a4 duration:(double)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ICDocCamThumbnailZoomTransitionAnimator;
  v14 = [(ICDocCamThumbnailZoomTransitionAnimator *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_thumbnailImage, a3);
    objc_storeStrong((id *)&v15->_indexPath, a4);
    v15->_duration = a5;
    uint64_t v16 = MEMORY[0x21D44FA30](v13);
    id completion = v15->_completion;
    v15->_id completion = (id)v16;
  }
  return v15;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:*MEMORY[0x263F1D7B0]];
  v6 = [v4 viewControllerForKey:*MEMORY[0x263F1D7A0]];
  v7 = [v4 containerView];
  v8 = [v5 view];
  [v7 addSubview:v8];

  v9 = [v6 view];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [v5 view];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  objc_super v19 = [v5 view];
  [v19 setNeedsLayout];

  v20 = [v5 view];
  [v20 layoutIfNeeded];

  LODWORD(v20) = [(ICDocCamThumbnailZoomTransitionAnimator *)self presenting];
  uint64_t v21 = objc_opt_class();
  if (v20)
  {
    v22 = DCDynamicCast(v21, (uint64_t)v5);
    uint64_t v23 = objc_opt_class();
    v24 = DCDynamicCast(v23, (uint64_t)v6);
    v25 = [(ICDocCamThumbnailZoomTransitionAnimator *)self indexPath];
    v148 = v24;
    [v24 zoomTargetForIndexPath:v25];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;

    v34 = [(ICDocCamThumbnailZoomTransitionAnimator *)self indexPath];
    v35 = v22;
  }
  else
  {
    v22 = DCDynamicCast(v21, (uint64_t)v6);
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = DCDynamicCast(v36, (uint64_t)v5);
    v38 = [(ICDocCamThumbnailZoomTransitionAnimator *)self indexPath];
    [v22 zoomTargetForIndexPath:v38];
    double v27 = v39;
    double v29 = v40;
    double v31 = v41;
    double v33 = v42;

    v34 = [(ICDocCamThumbnailZoomTransitionAnimator *)self indexPath];
    v148 = (void *)v37;
    v35 = (void *)v37;
  }
  [v35 zoomTargetForIndexPath:v34];
  uint64_t v139 = v44;
  uint64_t v140 = v43;
  uint64_t v137 = v46;
  uint64_t v138 = v45;

  v47 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v27, v29, v31, v33);
  [v47 setContentMode:2];
  v48 = [(ICDocCamThumbnailZoomTransitionAnimator *)self thumbnailImage];
  [v47 setImage:v48];

  [v47 setClipsToBounds:1];
  v49 = [v4 containerView];
  [v49 addSubview:v47];

  v146 = v4;
  v141 = v6;
  v150 = v5;
  double v142 = v29;
  double v143 = v27;
  double v144 = v33;
  double v145 = v31;
  if ([(ICDocCamThumbnailZoomTransitionAnimator *)self presenting])
  {
    v50 = 0;
    v51 = 0;
    double v52 = *MEMORY[0x263F1D1C0];
    double v53 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v55 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v54 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }
  else
  {
    uint64_t v56 = [v4 containerView];
    id v57 = objc_alloc_init(MEMORY[0x263EFF980]);
    if ([v22 statusBarWasHiddenWhenDoneTapped])
    {
      v51 = 0;
      double v58 = 0.0;
      v59 = (void *)v56;
    }
    else
    {
      [v22 view];
      v60 = v59 = (void *)v56;
      v61 = [v60 window];
      v62 = [v61 windowScene];
      v63 = [v62 statusBarManager];
      [v63 statusBarFrame];
      double v65 = v64;
      double v67 = v66;
      double v69 = v68;
      double v58 = v70;

      id v4 = v146;
      v51 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v65, v67, v69, v58);
      v71 = [MEMORY[0x263F1C550] whiteColor];
      [v51 setBackgroundColor:v71];

      v72 = [v146 containerView];
      [v72 addSubview:v51];

      v73 = [v51 leadingAnchor];
      v74 = [v59 leadingAnchor];
      v75 = [v73 constraintEqualToAnchor:v74 constant:0.0];
      [v57 addObject:v75];

      v76 = [v51 trailingAnchor];
      v77 = [v59 trailingAnchor];
      v78 = [v76 constraintEqualToAnchor:v77 constant:0.0];
      [v57 addObject:v78];

      v79 = [v51 topAnchor];
      v80 = [v59 topAnchor];
      v81 = [v79 constraintEqualToAnchor:v80 constant:0.0];
      [v57 addObject:v81];

      v82 = [v51 heightAnchor];
      v83 = [v82 constraintEqualToConstant:v58];
      [v57 addObject:v83];
    }
    v84 = [v22 navigationItem];
    v85 = [v84 navigationBar];

    [v85 size];
    double v87 = v86;
    [v85 size];
    double v52 = *MEMORY[0x263F1D1C0];
    double v53 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v55 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v54 = *(double *)(MEMORY[0x263F1D1C0] + 24);
    v50 = objc_msgSend(v85, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, 0.0, 0.0, v87, v88, *MEMORY[0x263F1D1C0], v53, v55, v54);
    [v50 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v85 size];
    double v90 = v89;
    [v85 size];
    objc_msgSend(v50, "setFrame:", 0.0, v58, v90, v91);
    v92 = [v4 containerView];
    [v92 addSubview:v50];

    [MEMORY[0x263F08938] activateConstraints:v57];
  }
  v93 = [v22 bottomToolbar];
  [v93 frame];
  double v95 = v94;
  [v93 frame];
  double v97 = v96;
  [v93 frame];
  double v99 = v98;
  [v93 frame];
  double v101 = v100;
  v102 = [v22 view];
  [v102 safeAreaInsets];
  double v104 = v101 + v103;

  v105 = objc_msgSend(v93, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, 0.0, 0.0, v99, v104, v52, v53, v55, v54);
  [v105 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(v105, "setFrame:", v95, v97, v99, v104);
  v106 = [v4 containerView];
  [v106 addSubview:v105];

  v107 = [v22 pageViewController];
  v108 = [v107 view];
  [v108 setHidden:1];

  if (![(ICDocCamThumbnailZoomTransitionAnimator *)self presenting])
  {
    v135 = v50;
    v109 = self;
    v110 = v47;
    v111 = v51;
    v112 = [v22 indexPathForCurrentDocument];
    v113 = [v148 thumbnailViewController];
    v114 = [v113 collectionView];
    v115 = [v114 cellForItemAtIndexPath:v112];

    if ([v22 documentCount] == 1)
    {
      [v115 setAlpha:0.0];
    }
    else
    {
      v116 = [v115 layer];
      [v116 setOpacity:0.0];
    }
    v51 = v111;
    v47 = v110;
    self = v109;
    v50 = v135;
  }
  v172[0] = 0;
  v172[1] = v172;
  v172[2] = 0x2020000000;
  int v173 = 0;
  v163[0] = MEMORY[0x263EF8330];
  v163[1] = 3221225472;
  v163[2] = __61__ICDocCamThumbnailZoomTransitionAnimator_animateTransition___block_invoke;
  v163[3] = &unk_2642AA728;
  v163[4] = self;
  v171 = v172;
  id v117 = v47;
  id v164 = v117;
  id v118 = v105;
  id v165 = v118;
  id v136 = v22;
  id v166 = v136;
  id v147 = v146;
  id v167 = v147;
  id v119 = v51;
  id v168 = v119;
  id v120 = v50;
  id v169 = v120;
  id v149 = v148;
  id v170 = v149;
  v121 = (void *)MEMORY[0x21D44FA30](v163);
  v122 = [v150 view];
  [v122 setAlpha:0.0];

  BOOL v123 = [(ICDocCamThumbnailZoomTransitionAnimator *)self presenting];
  double v124 = 0.0;
  v125 = v118;
  if (!v123)
  {
    double v124 = 1.0;
    [v118 setAlpha:1.0];
    [v119 setAlpha:1.0];
    v125 = v120;
  }
  [v125 setAlpha:v124];
  v126 = (void *)MEMORY[0x263F1CB60];
  v157[0] = MEMORY[0x263EF8330];
  v157[1] = 3221225472;
  v157[2] = __61__ICDocCamThumbnailZoomTransitionAnimator_animateTransition___block_invoke_18;
  v157[3] = &unk_2642AA750;
  id v127 = v150;
  id v158 = v127;
  v159 = self;
  id v128 = v118;
  id v160 = v128;
  id v129 = v119;
  id v161 = v129;
  id v130 = v120;
  id v162 = v130;
  [v126 animateWithDuration:0 delay:v157 options:v121 animations:0.14 completion:0.0];
  objc_msgSend(v117, "setFrame:", v143, v142, v145, v144);
  v131 = (void *)MEMORY[0x263F1CB60];
  [(ICDocCamThumbnailZoomTransitionAnimator *)self duration];
  double v133 = v132;
  v151[0] = MEMORY[0x263EF8330];
  v151[1] = 3221225472;
  v151[2] = __61__ICDocCamThumbnailZoomTransitionAnimator_animateTransition___block_invoke_2_19;
  v151[3] = &unk_2642AA778;
  id v134 = v117;
  id v152 = v134;
  uint64_t v153 = v140;
  uint64_t v154 = v139;
  uint64_t v155 = v138;
  uint64_t v156 = v137;
  [v131 animateWithDuration:0 delay:v151 usingSpringWithDamping:v121 initialSpringVelocity:v133 options:0.0 animations:0.8 completion:0.0];

  _Block_object_dispose(v172, 8);
}

void __61__ICDocCamThumbnailZoomTransitionAnimator_animateTransition___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if (++*(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) == 2)
  {
    if ([*(id *)(a1 + 32) presenting])
    {
      [*(id *)(a1 + 40) removeFromSuperview];
      [*(id *)(a1 + 48) removeFromSuperview];
      v3 = [*(id *)(a1 + 56) pageViewController];
      id v4 = [v3 view];
      [v4 setHidden:0];

      objc_msgSend(*(id *)(a1 + 64), "completeTransition:", objc_msgSend(*(id *)(a1 + 64), "transitionWasCancelled") ^ 1);
      v5 = [*(id *)(a1 + 32) completion];

      if (v5)
      {
        v6 = [*(id *)(a1 + 32) completion];
        v6[2]();
      }
    }
    else
    {
      [*(id *)(a1 + 48) removeFromSuperview];
      [*(id *)(a1 + 72) removeFromSuperview];
      [*(id *)(a1 + 80) removeFromSuperview];
      uint64_t v7 = [*(id *)(a1 + 56) documentCount];
      v8 = *(void **)(a1 + 56);
      if (v7 == 1)
      {
        v9 = [v8 indexPathForCurrentDocument];
        double v10 = [*(id *)(a1 + 88) thumbnailViewController];
        double v11 = [v10 collectionView];
        id v12 = [v11 cellForItemAtIndexPath:v9];

        [v12 setAlpha:1.0];
        [*(id *)(a1 + 40) setAlpha:0.0];
        [*(id *)(a1 + 40) removeFromSuperview];
        objc_msgSend(*(id *)(a1 + 64), "completeTransition:", objc_msgSend(*(id *)(a1 + 64), "transitionWasCancelled") ^ 1);
      }
      else
      {
        v9 = [v8 indexPathForCurrentDocument];
        double v13 = [*(id *)(a1 + 88) thumbnailViewController];
        double v14 = [v13 collectionView];
        double v15 = [v14 cellForItemAtIndexPath:v9];

        [MEMORY[0x263F158F8] begin];
        double v16 = (void *)MEMORY[0x263F158F8];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __61__ICDocCamThumbnailZoomTransitionAnimator_animateTransition___block_invoke_2;
        v27[3] = &unk_2642A97F0;
        id v28 = *(id *)(a1 + 40);
        id v12 = v15;
        id v29 = v12;
        id v30 = *(id *)(a1 + 64);
        [v16 setCompletionBlock:v27];
        double v17 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
        [v17 setFromValue:&unk_26C7ED8C8];
        [v17 setToValue:&unk_26C7ED8E0];
        [v17 setDuration:0.05];
        LODWORD(v18) = 1.0;
        [v17 setRepeatCount:v18];
        [v17 setRemovedOnCompletion:0];
        uint64_t v19 = *MEMORY[0x263F15AA8];
        [v17 setFillMode:*MEMORY[0x263F15AA8]];
        uint64_t v20 = *MEMORY[0x263F15EB8];
        uint64_t v21 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
        [v17 setTimingFunction:v21];

        v22 = [v12 layer];
        [v22 addAnimation:v17 forKey:@"opacity"];

        uint64_t v23 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
        [v23 setBeginTime:CACurrentMediaTime() + 0.05];
        [v23 setFromValue:&unk_26C7ED8E0];
        [v23 setToValue:&unk_26C7ED8C8];
        [v23 setDuration:0.2];
        LODWORD(v24) = 1.0;
        [v23 setRepeatCount:v24];
        [v23 setRemovedOnCompletion:0];
        [v23 setFillMode:v19];
        v25 = [MEMORY[0x263F15808] functionWithName:v20];
        [v23 setTimingFunction:v25];

        double v26 = [*(id *)(a1 + 40) layer];
        [v26 addAnimation:v23 forKey:@"opacity"];

        [MEMORY[0x263F158F8] commit];
      }
    }
  }
  objc_sync_exit(v2);
}

uint64_t __61__ICDocCamThumbnailZoomTransitionAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = [*(id *)(a1 + 40) layer];
  LODWORD(v3) = 1.0;
  [v2 setOpacity:v3];

  id v4 = *(void **)(a1 + 48);
  uint64_t v5 = [v4 transitionWasCancelled] ^ 1;

  return [v4 completeTransition:v5];
}

uint64_t __61__ICDocCamThumbnailZoomTransitionAnimator_animateTransition___block_invoke_18(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:1.0];

  int v3 = [*(id *)(a1 + 40) presenting];
  id v4 = *(void **)(a1 + 48);
  if (v3)
  {
    double v5 = 1.0;
  }
  else
  {
    [v4 setAlpha:0.0];
    [*(id *)(a1 + 56) setAlpha:0.0];
    id v4 = *(void **)(a1 + 64);
    double v5 = 0.0;
  }

  return [v4 setAlpha:v5];
}

uint64_t __61__ICDocCamThumbnailZoomTransitionAnimator_animateTransition___block_invoke_2_19(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)_shouldCrossFadeNavigationBar
{
  return 1;
}

- (BOOL)presenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setThumbnailImage:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);

  objc_storeStrong((id *)&self->_thumbnailImage, 0);
}

@end
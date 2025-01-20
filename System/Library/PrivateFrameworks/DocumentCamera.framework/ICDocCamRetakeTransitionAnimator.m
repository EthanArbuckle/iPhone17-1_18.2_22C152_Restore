@interface ICDocCamRetakeTransitionAnimator
- (BOOL)presenting;
- (ICDocCamRetakeTransitionAnimator)initWithImage:(id)a3 indexPath:(id)a4 duration:(double)a5 completion:(id)a6;
- (NSIndexPath)indexPath;
- (UIImage)retakeImage;
- (double)duration;
- (id)completion;
- (id)makeUIImageFromCIImage:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDuration:(double)a3;
- (void)setIndexPath:(id)a3;
- (void)setPresenting:(BOOL)a3;
- (void)setRetakeImage:(id)a3;
@end

@implementation ICDocCamRetakeTransitionAnimator

- (ICDocCamRetakeTransitionAnimator)initWithImage:(id)a3 indexPath:(id)a4 duration:(double)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ICDocCamRetakeTransitionAnimator;
  v14 = [(ICDocCamRetakeTransitionAnimator *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_retakeImage, a3);
    objc_storeStrong((id *)&v15->_indexPath, a4);
    v15->_duration = a5;
    uint64_t v16 = MEMORY[0x21D44FA30](v13);
    id completion = v15->_completion;
    v15->_id completion = (id)v16;
  }
  return v15;
}

- (id)makeUIImageFromCIImage:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F00628];
  uint64_t v11 = *MEMORY[0x263F00808];
  v12[0] = MEMORY[0x263EFFA80];
  v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v7 = [v3 contextWithOptions:v6];

  [v5 extent];
  v8 = (CGImage *)objc_msgSend(v7, "createCGImage:fromRect:", v5);

  v9 = [MEMORY[0x263F1C6B0] imageWithCGImage:v8];
  CGImageRelease(v8);

  return v9;
}

- (void)animateTransition:(id)a3
{
  v183[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v153 = self;
  if ([(ICDocCamRetakeTransitionAnimator *)self presenting])
  {
    id v5 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ICDocCamRetakeTransitionAnimator animateTransition:](v5);
    }
  }
  v158 = [v4 viewControllerForKey:*MEMORY[0x263F1D7B0]];
  v157 = [v4 viewControllerForKey:*MEMORY[0x263F1D7A0]];
  v6 = [v4 containerView];
  v7 = [v158 view];
  v8 = [v157 view];
  [v6 insertSubview:v7 belowSubview:v8];

  v9 = [v157 view];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [v158 view];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  objc_super v19 = [v158 view];
  [v19 setNeedsLayout];

  v20 = [v158 view];
  [v20 layoutIfNeeded];

  uint64_t v21 = objc_opt_class();
  v160 = DCDynamicCast(v21, (uint64_t)v157);
  v22 = [(ICDocCamRetakeTransitionAnimator *)v153 indexPath];
  [v160 zoomTargetForIndexPath:v22];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  v31 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v151 = [v31 _graphicsQuality];

  id v152 = [(ICDocCamRetakeTransitionAnimator *)v153 retakeImage];
  if (v151 != 100)
  {
    id v32 = objc_alloc(MEMORY[0x263F00650]);
    id v33 = v152;
    v34 = objc_msgSend(v32, "initWithCGImage:", objc_msgSend(v33, "CGImage"));
    [v34 extent];
    CGRect v185 = CGRectIntegral(v184);
    double x = v185.origin.x;
    double y = v185.origin.y;
    double width = v185.size.width;
    double height = v185.size.height;
    v39 = objc_msgSend(v34, "imageByCroppingToRect:");
    v40 = [v39 imageByClampingToExtent];
    [v40 extent];
    v41 = objc_msgSend(v40, "imageBySettingAlphaOneInExtent:");

    v42 = (void *)MEMORY[0x263F00640];
    v182[0] = *MEMORY[0x263F00968];
    v182[1] = @"inputRadius";
    v183[0] = v41;
    v43 = [NSNumber numberWithDouble:40.0];
    v183[1] = v43;
    v44 = [NSDictionary dictionaryWithObjects:v183 forKeys:v182 count:2];
    v45 = [v42 filterWithName:@"CIGaussianBlur" withInputParameters:v44];
    v46 = [v45 outputImage];
    v47 = objc_msgSend(v46, "imageByCroppingToRect:", x, y, width, height);

    v48 = [(ICDocCamRetakeTransitionAnimator *)v153 makeUIImageFromCIImage:v47];
    [v33 size];
    double v50 = v49;
    [v33 size];
    objc_msgSend(v48, "dc_scaledImageWithSize:scale:", v50);
    id v152 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v172 = 0;
  v173 = &v172;
  uint64_t v174 = 0x3032000000;
  v175 = __Block_byref_object_copy__9;
  v176 = __Block_byref_object_dispose__9;
  id v177 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v24, v26, v28, v30);
  [(id)v173[5] setContentMode:2];
  [(id)v173[5] setImage:v152];
  [(id)v173[5] setClipsToBounds:1];
  v51 = [v4 containerView];
  [v51 addSubview:v173[5]];

  v150 = [v4 containerView];
  id v156 = objc_alloc_init(MEMORY[0x263EFF980]);
  char v52 = [v160 statusBarWasHiddenWhenDoneTapped];
  if (v52)
  {
    v53 = 0;
    double v54 = 0.0;
  }
  else
  {
    v55 = [v160 view];
    v56 = [v55 window];
    v57 = [v56 windowScene];
    v58 = [v57 statusBarManager];
    [v58 statusBarFrame];
    double v60 = v59;
    double v62 = v61;
    double v64 = v63;
    double v54 = v65;

    v53 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v60, v62, v64, v54);
    v66 = [MEMORY[0x263F1C550] whiteColor];
    [v53 setBackgroundColor:v66];

    [v53 setTranslatesAutoresizingMaskIntoConstraints:0];
    v67 = [v4 containerView];
    [v67 addSubview:v53];

    v68 = [v53 leadingAnchor];
    v69 = [v150 leadingAnchor];
    v70 = [v68 constraintEqualToAnchor:v69 constant:0.0];
    [v156 addObject:v70];

    v71 = [v53 trailingAnchor];
    v72 = [v150 trailingAnchor];
    v73 = [v71 constraintEqualToAnchor:v72 constant:0.0];
    [v156 addObject:v73];

    v74 = [v53 topAnchor];
    v75 = [v150 topAnchor];
    v76 = [v74 constraintEqualToAnchor:v75 constant:0.0];
    [v156 addObject:v76];

    v77 = [v53 heightAnchor];
    v78 = [v77 constraintEqualToConstant:v54];
    [v156 addObject:v78];
  }
  v79 = [v160 navigationItem];
  v159 = [v79 navigationBar];

  [v159 size];
  double v81 = v80;
  [v159 size];
  double v82 = *MEMORY[0x263F1D1C0];
  double v83 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v84 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v85 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  v87 = objc_msgSend(v159, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, 0.0, 0.0, v81, v86, *MEMORY[0x263F1D1C0], v83, v84, v85);
  [v87 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v159 size];
  double v89 = v88;
  [v159 size];
  objc_msgSend(v87, "setFrame:", 0.0, v54, v89, v90);
  v91 = [v4 containerView];
  [v91 addSubview:v87];

  [MEMORY[0x263F08938] activateConstraints:v156];
  v155 = [v160 bottomToolbar];
  [v155 size];
  double v93 = v92;
  [v155 size];
  v95 = objc_msgSend(v155, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, 0.0, 0.0, v93, v94, v82, v83, v84, v85);
  [v95 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v155 frame];
  objc_msgSend(v95, "setFrame:");
  v96 = [v4 containerView];
  [v96 addSubview:v95];

  v97 = [v160 pageViewController];
  v98 = [v97 view];
  [v98 setHidden:1];

  [MEMORY[0x263F158F8] begin];
  v99 = (void *)MEMORY[0x263F158F8];
  v164[0] = MEMORY[0x263EF8330];
  v164[1] = 3221225472;
  v164[2] = __54__ICDocCamRetakeTransitionAnimator_animateTransition___block_invoke;
  v164[3] = &unk_2642AA7F0;
  id v145 = v4;
  id v165 = v145;
  v171 = &v172;
  id v148 = v95;
  id v166 = v148;
  id v146 = v53;
  id v167 = v146;
  id v147 = v87;
  id v168 = v147;
  id v149 = v160;
  id v169 = v149;
  v170 = v153;
  [v99 setCompletionBlock:v164];
  LODWORD(v100) = 1051361018;
  LODWORD(v101) = 1045220557;
  LODWORD(v102) = 1.0;
  v161 = [MEMORY[0x263F15808] functionWithControlPoints:v100 :0.0 :v101 :v102];
  v103 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v103 setFromValue:&unk_26C7ED8F8];
  [v103 setToValue:&unk_26C7ED910];
  [v103 setDuration:0.12];
  LODWORD(v104) = 1.0;
  [v103 setRepeatCount:v104];
  [v103 setRemovedOnCompletion:0];
  uint64_t v105 = *MEMORY[0x263F15AA8];
  [v103 setFillMode:*MEMORY[0x263F15AA8]];
  [v103 setTimingFunction:v161];
  v106 = [v149 view];
  v107 = [v106 layer];
  [v107 addAnimation:v103 forKey:@"opacity"];
  v154 = v103;

  v108 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v108 setFromValue:&unk_26C7ED8F8];
  [v108 setToValue:&unk_26C7ED910];
  [v108 setDuration:0.12];
  LODWORD(v109) = 1.0;
  [v108 setRepeatCount:v109];
  [v108 setRemovedOnCompletion:0];
  [v108 setFillMode:v105];
  [v108 setTimingFunction:v161];
  v110 = [v148 layer];
  [v110 addAnimation:v108 forKey:@"opacity"];

  if ((v52 & 1) == 0)
  {
    v111 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    [v111 setFromValue:&unk_26C7ED8F8];
    [v111 setToValue:&unk_26C7ED910];
    [v111 setDuration:0.12];
    LODWORD(v112) = 1.0;
    [v111 setRepeatCount:v112];
    [v111 setRemovedOnCompletion:0];
    [v111 setFillMode:v105];
    [v111 setTimingFunction:v161];
    v113 = [v146 layer];
    [v113 addAnimation:v111 forKey:@"opacity"];
  }
  v114 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v114 setFromValue:&unk_26C7ED8F8];
  [v114 setToValue:&unk_26C7ED910];
  [v114 setDuration:0.12];
  LODWORD(v115) = 1.0;
  [v114 setRepeatCount:v115];
  [v114 setRemovedOnCompletion:0];
  [v114 setFillMode:v105];
  [v114 setTimingFunction:v161];
  v116 = [v147 layer];
  [v116 addAnimation:v114 forKey:@"opacity"];

  v117 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale"];
  [v117 setFromValue:&unk_26C7ED8F8];
  [v117 setToValue:&unk_26C7ED690];
  [v117 setDuration:0.28];
  LODWORD(v118) = 1.0;
  [v117 setRepeatCount:v118];
  [v117 setRemovedOnCompletion:0];
  [v117 setFillMode:v105];
  [v117 setTimingFunction:v161];
  v119 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v119 setBeginTime:0.08];
  [v119 setFromValue:&unk_26C7ED8F8];
  [v119 setToValue:&unk_26C7ED910];
  [v119 setDuration:0.15];
  LODWORD(v120) = 1.0;
  [v119 setRepeatCount:v120];
  [v119 setRemovedOnCompletion:0];
  [v119 setFillMode:v105];
  uint64_t v121 = *MEMORY[0x263F15EB8];
  v122 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v119 setTimingFunction:v122];

  if (v151 == 100)
  {
    uint64_t v144 = *MEMORY[0x263F15BC8];
    v123 = objc_msgSend(MEMORY[0x263F157C8], "filterWithType:");
    [v123 setEnabled:1];
    [v123 setValue:MEMORY[0x263EFFA88] forKey:@"inputNormalizeEdges"];
    [v123 setValue:&unk_26C7ED910 forKey:@"inputRadius"];
    v124 = [MEMORY[0x263F1C5C0] currentDevice];
    if ([v124 _graphicsQuality] == 100) {
      v125 = @"default";
    }
    else {
      v125 = @"low";
    }
    [v123 setValue:v125 forKey:@"inputQuality"];

    v126 = [(id)v173[5] layer];
    v181 = v123;
    v127 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v181 count:1];
    [v126 setFilters:v127];

    v128 = [(id)v173[5] layer];
    [v128 setShouldRasterize:1];

    v129 = [MEMORY[0x263F15760] animationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
    v130 = [(id)v173[5] layer];
    v131 = [v130 valueForKeyPath:@"filters.gaussianBlur.inputRadius"];
    [v129 setFromValue:v131];

    [v129 setToValue:&unk_26C7ED928];
    [v129 setDuration:0.15];
    LODWORD(v132) = 1.0;
    [v129 setRepeatCount:v132];
    [v129 setRemovedOnCompletion:0];
    [v129 setFillMode:v105];
    v133 = [MEMORY[0x263F15808] functionWithName:v121];
    [v129 setTimingFunction:v133];

    v134 = [MEMORY[0x263F157C8] filterWithType:v144];
    [v134 setEnabled:1];
    [v134 setValue:MEMORY[0x263EFFA88] forKey:@"inputNormalizeEdges"];
    [v134 setValue:&unk_26C7ED928 forKey:@"inputRadius"];
    v135 = [MEMORY[0x263F1C5C0] currentDevice];
    if ([v135 _graphicsQuality] == 100) {
      v136 = @"default";
    }
    else {
      v136 = @"low";
    }
    [v134 setValue:v136 forKey:@"inputQuality"];

    v137 = [(id)v173[5] layer];
    v180 = v134;
    v138 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v180 count:1];
    [v137 setFilters:v138];
  }
  else
  {
    v129 = 0;
  }
  v139 = [(id)v173[5] layer];
  [v139 setOpacity:0.0];

  CATransform3DMakeScale(&v163, 0.5, 0.5, 0.5);
  v140 = [(id)v173[5] layer];
  CATransform3D v162 = v163;
  [v140 setTransform:&v162];

  v141 = [MEMORY[0x263F15750] animation];
  [v141 setDuration:0.28];
  if (v151 == 100 && v129)
  {
    v179[0] = v117;
    v179[1] = v119;
    v179[2] = v129;
    v142 = [MEMORY[0x263EFF8C0] arrayWithObjects:v179 count:3];
    [v141 setAnimations:v142];
  }
  else
  {
    v178[0] = v117;
    v178[1] = v119;
    v142 = [MEMORY[0x263EFF8C0] arrayWithObjects:v178 count:2];
    [v141 setAnimations:v142];
  }

  v143 = [(id)v173[5] layer];
  [v143 addAnimation:v141 forKey:@"animGroup"];

  [MEMORY[0x263F158F8] commit];
  _Block_object_dispose(&v172, 8);
}

void __54__ICDocCamRetakeTransitionAnimator_animateTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) removeFromSuperview];
  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 48) removeFromSuperview];
  [*(id *)(a1 + 56) removeFromSuperview];
  v2 = [*(id *)(a1 + 64) pageViewController];
  v3 = [v2 view];
  [v3 setHidden:0];

  id v4 = [*(id *)(a1 + 72) completion];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 72) completion];
    v5[2]();
  }
}

- (BOOL)presenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (UIImage)retakeImage
{
  return self->_retakeImage;
}

- (void)setRetakeImage:(id)a3
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

  objc_storeStrong((id *)&self->_retakeImage, 0);
}

- (void)animateTransition:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "Custom view controller transition only used for pop, not push.", v1, 2u);
}

@end
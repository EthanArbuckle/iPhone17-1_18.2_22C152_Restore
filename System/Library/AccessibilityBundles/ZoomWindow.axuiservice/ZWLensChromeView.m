@interface ZWLensChromeView
- (BOOL)isAccessibilityElement;
- (BOOL)showingResizeHandles;
- (CALayer)backdropLayer;
- (CALayer)grabberOverlayLayer;
- (CAShapeLayer)backdropGrabberMaskLayer;
- (CAShapeLayer)backdropMaskShapeLayer;
- (CAShapeLayer)backdropResizingMaskLayer;
- (CAShapeLayer)chromeInnerBorderLayer;
- (CAShapeLayer)chromeOuterBorderLayer;
- (CAShapeLayer)lensResizingHandlesLayer;
- (CAShapeLayer)touchStealerShapeLayer;
- (CGRect)previousResizeBounds;
- (NSArray)resizeElements;
- (ZWLensChromeView)initWithFrame:(CGRect)a3;
- (id)accessibilityElements;
- (void)layoutSubviews;
- (void)setBackdropGrabberMaskLayer:(id)a3;
- (void)setBackdropLayer:(id)a3;
- (void)setBackdropMaskShapeLayer:(id)a3;
- (void)setBackdropResizingMaskLayer:(id)a3;
- (void)setChromeInnerBorderLayer:(id)a3;
- (void)setChromeOuterBorderLayer:(id)a3;
- (void)setGrabberOverlayLayer:(id)a3;
- (void)setLensResizingHandlesLayer:(id)a3;
- (void)setPreviousResizeBounds:(CGRect)a3;
- (void)setResizeElements:(id)a3;
- (void)setShowingResizeHandles:(BOOL)a3;
- (void)setTouchStealerShapeLayer:(id)a3;
- (void)showLensResizingHandles:(BOOL)a3 animated:(BOOL)a4;
- (void)updateChromeVisibility:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation ZWLensChromeView

- (ZWLensChromeView)initWithFrame:(CGRect)a3
{
  v54.receiver = self;
  v54.super_class = (Class)ZWLensChromeView;
  v3 = -[ZWLensChromeView initWithFrame:](&v54, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(ZWLensChromeView *)v3 layer];
    if (ZWEnableLensEyeCandy() && ZWUseVibrantBlendModes())
    {
      id v6 = objc_alloc_init((Class)CABackdropLayer);
      [v6 setEnabled:1];
      [v6 setAllowsHitTesting:0];
      [v6 setMarginWidth:12.0];
      [v6 setMasksToBounds:0];
      [(ZWLensChromeView *)v4 setBackdropLayer:v6];
      v7 = [(ZWLensChromeView *)v4 layer];
      [v7 addSublayer:v6];

      v8 = +[CALayer layer];
      v9 = [(ZWLensChromeView *)v4 backdropLayer];
      [v9 setMask:v8];

      v10 = +[CAShapeLayer layer];
      [(ZWLensChromeView *)v4 setBackdropMaskShapeLayer:v10];

      v11 = +[CAShapeLayer layer];
      [(ZWLensChromeView *)v4 setBackdropResizingMaskLayer:v11];

      id v12 = +[UIColor whiteColor];
      id v13 = [v12 CGColor];
      v14 = [(ZWLensChromeView *)v4 backdropResizingMaskLayer];
      [v14 setBackgroundColor:v13];

      v15 = [(ZWLensChromeView *)v4 backdropResizingMaskLayer];
      [v15 setOpacity:0.0];

      v16 = +[CAShapeLayer layer];
      [(ZWLensChromeView *)v4 setBackdropGrabberMaskLayer:v16];

      id v17 = +[UIColor whiteColor];
      id v18 = [v17 CGColor];
      v19 = [(ZWLensChromeView *)v4 backdropGrabberMaskLayer];
      [v19 setBackgroundColor:v18];

      v20 = [(ZWLensChromeView *)v4 backdropGrabberMaskLayer];
      [v20 setCornerRadius:5.0];

      v21 = [(ZWLensChromeView *)v4 backdropLayer];
      v22 = [v21 mask];
      v23 = [(ZWLensChromeView *)v4 backdropMaskShapeLayer];
      [v22 addSublayer:v23];

      v24 = [(ZWLensChromeView *)v4 backdropLayer];
      v25 = [v24 mask];
      v26 = [(ZWLensChromeView *)v4 backdropGrabberMaskLayer];
      [v25 addSublayer:v26];

      v27 = [(ZWLensChromeView *)v4 backdropLayer];
      v28 = [v27 mask];
      v29 = [(ZWLensChromeView *)v4 backdropResizingMaskLayer];
      [v28 addSublayer:v29];

      v5 = v6;
    }
    v30 = +[CAShapeLayer layer];
    [(ZWLensChromeView *)v4 setChromeInnerBorderLayer:v30];
    [v5 addSublayer:v30];
    id v31 = +[UIColor clearColor];
    objc_msgSend(v30, "setFillColor:", objc_msgSend(v31, "CGColor"));

    ZWLensInnerColor();
    id v32 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setStrokeColor:", objc_msgSend(v32, "CGColor"));

    [v30 setLineWidth:ZWLensInnerBorderWidth()];
    uint64_t v33 = kCAFilterPlusL;
    v34 = +[CAFilter filterWithType:kCAFilterPlusL];
    [v30 setCompositingFilter:v34];

    id v35 = objc_alloc_init((Class)CALayer);
    ZWLensInnerColor();
    id v36 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setBackgroundColor:", objc_msgSend(v36, "CGColor"));

    [v35 setMasksToBounds:1];
    v37 = +[CAFilter filterWithType:v33];
    [v35 setCompositingFilter:v37];

    [(ZWLensChromeView *)v4 setGrabberOverlayLayer:v35];
    v38 = [(ZWLensChromeView *)v4 grabberOverlayLayer];
    [v38 setCornerRadius:5.0];

    [v5 addSublayer:v35];
    v39 = +[CAShapeLayer layer];
    [(ZWLensChromeView *)v4 setChromeOuterBorderLayer:v39];
    [v5 addSublayer:v39];
    id v40 = +[UIColor clearColor];
    objc_msgSend(v39, "setFillColor:", objc_msgSend(v40, "CGColor"));

    ZWLensOuterColor();
    id v41 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setStrokeColor:", objc_msgSend(v41, "CGColor"));

    [v39 setLineWidth:ZWLensOuterBorderWidth()];
    v42 = +[CAFilter filterWithType:kCAFilterPlusD];
    [v39 setCompositingFilter:v42];

    v43 = +[CAShapeLayer layer];
    [(ZWLensChromeView *)v4 setLensResizingHandlesLayer:v43];
    [v43 setOpacity:0.0];
    ZWLensInnerColor();
    id v44 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setFillColor:", objc_msgSend(v44, "CGColor"));

    v45 = +[CAFilter filterWithType:v33];
    [v43 setCompositingFilter:v45];

    v46 = [(ZWLensChromeView *)v4 layer];
    [v46 addSublayer:v43];

    v47 = +[CAShapeLayer layer];

    [(ZWLensChromeView *)v4 setTouchStealerShapeLayer:v47];
    LODWORD(v48) = 1.0;
    [v47 setOpacity:v48];
    v49 = +[UIColor blackColor];
    id v50 = [v49 colorWithAlphaComponent:0.00392156863];
    objc_msgSend(v47, "setStrokeColor:", objc_msgSend(v50, "CGColor"));

    id v51 = +[UIColor clearColor];
    objc_msgSend(v47, "setFillColor:", objc_msgSend(v51, "CGColor"));

    [v47 setLineWidth:ZWZoomLensBorderThicknessForTouches()];
    v52 = [(ZWLensChromeView *)v4 layer];
    [v52 addSublayer:v47];
  }
  return v4;
}

- (void)layoutSubviews
{
  v144.receiver = self;
  v144.super_class = (Class)ZWLensChromeView;
  [(ZWLensChromeView *)&v144 layoutSubviews];
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(ZWLensChromeView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(ZWLensChromeView *)self chromeInnerBorderLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(ZWLensChromeView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(ZWLensChromeView *)self chromeOuterBorderLayer];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  [(ZWLensChromeView *)self bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = [(ZWLensChromeView *)self lensResizingHandlesLayer];
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  [(ZWLensChromeView *)self bounds];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  v38 = [(ZWLensChromeView *)self backdropLayer];
  v39 = [v38 mask];
  objc_msgSend(v39, "setFrame:", v31, v33, v35, v37);

  [(ZWLensChromeView *)self bounds];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  double v48 = [(ZWLensChromeView *)self backdropResizingMaskLayer];
  objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

  [(ZWLensChromeView *)self bounds];
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  v57 = [(ZWLensChromeView *)self backdropMaskShapeLayer];
  objc_msgSend(v57, "setFrame:", v50, v52, v54, v56);

  [(ZWLensChromeView *)self bounds];
  double v59 = v58;
  double v61 = v60;
  double v63 = v62;
  double v65 = v64;
  v66 = [(ZWLensChromeView *)self touchStealerShapeLayer];
  objc_msgSend(v66, "setFrame:", v59, v61, v63, v65);

  [(ZWLensChromeView *)self bounds];
  +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
  id v67 = objc_claimAutoreleasedReturnValue();
  id v68 = [v67 CGPath];
  v69 = [(ZWLensChromeView *)self touchStealerShapeLayer];
  [v69 setPath:v68];

  [(ZWLensChromeView *)self bounds];
  v74 = ZWOuterLensBorderForBounds([(ZWLensChromeView *)self showingResizeHandles], v70, v71, v72, v73);
  [(ZWLensChromeView *)self bounds];
  v79 = ZWInnerLensBorderForBounds([(ZWLensChromeView *)self showingResizeHandles], v75, v76, v77, v78);
  id v80 = v74;
  id v81 = [v80 CGPath];
  v82 = [(ZWLensChromeView *)self chromeOuterBorderLayer];
  [v82 setPath:v81];

  id v83 = v79;
  id v84 = [v83 CGPath];
  v85 = [(ZWLensChromeView *)self chromeInnerBorderLayer];
  [v85 setPath:v84];

  [(ZWLensChromeView *)self bounds];
  CGFloat v86 = CGRectGetMidX(v145) + -23.0;
  [(ZWLensChromeView *)self bounds];
  CGFloat v87 = CGRectGetMaxY(v146) + -5.0;
  v88 = [(ZWLensChromeView *)self grabberOverlayLayer];
  objc_msgSend(v88, "setFrame:", v86, v87, 46.0, 10.0);

  v89 = [(ZWLensChromeView *)self grabberOverlayLayer];
  [v89 frame];
  double v91 = v90;
  double v93 = v92;
  double v95 = v94;
  double v97 = v96;
  v98 = [(ZWLensChromeView *)self backdropGrabberMaskLayer];
  objc_msgSend(v98, "setFrame:", v91, v93, v95, v97);

  [(ZWLensChromeView *)self bounds];
  double v100 = v99;
  double v102 = v101;
  double v104 = v103;
  double v106 = v105;
  v107 = [(ZWLensChromeView *)self backdropLayer];
  objc_msgSend(v107, "setFrame:", v100, v102, v104, v106);

  [(ZWLensChromeView *)self bounds];
  ZWResizeGrabberPath(v108, v109, v110, v111);
  id v112 = objc_claimAutoreleasedReturnValue();
  id v113 = [v112 CGPath];
  v114 = [(ZWLensChromeView *)self lensResizingHandlesLayer];
  [v114 setPath:v113];

  [(ZWLensChromeView *)self bounds];
  ZWResizeGrabberPath(v115, v116, v117, v118);
  id v119 = objc_claimAutoreleasedReturnValue();
  id v120 = [v119 CGPath];
  v121 = [(ZWLensChromeView *)self backdropResizingMaskLayer];
  [v121 setPath:v120];

  id v122 = +[UIColor whiteColor];
  id v123 = [v122 CGColor];
  v124 = [(ZWLensChromeView *)self backdropResizingMaskLayer];
  [v124 setFillColor:v123];

  id v125 = +[UIColor clearColor];
  id v126 = [v125 CGColor];
  v127 = [(ZWLensChromeView *)self backdropResizingMaskLayer];
  [v127 setBackgroundColor:v126];

  id v128 = [v83 copy];
  [v128 appendPath:v80];
  id v129 = v128;
  id v130 = [v129 CGPath];
  v131 = [(ZWLensChromeView *)self backdropMaskShapeLayer];
  [v131 setPath:v130];

  id v132 = +[UIColor clearColor];
  id v133 = [v132 CGColor];
  v134 = [(ZWLensChromeView *)self backdropMaskShapeLayer];
  [v134 setFillColor:v133];

  id v135 = +[UIColor whiteColor];
  id v136 = [v135 CGColor];
  v137 = [(ZWLensChromeView *)self backdropMaskShapeLayer];
  [v137 setStrokeColor:v136];

  double v138 = ZWLensInnerBorderWidth();
  double v139 = ZWLensOuterBorderWidth();
  if (v138 < v139) {
    double v138 = v139;
  }
  v140 = [(ZWLensChromeView *)self backdropMaskShapeLayer];
  [v140 setLineWidth:v138];

  id v141 = +[UIColor clearColor];
  id v142 = [v141 CGColor];
  v143 = [(ZWLensChromeView *)self backdropMaskShapeLayer];
  [v143 setBackgroundColor:v142];

  +[CATransaction commit];
}

- (void)updateChromeVisibility:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  double v9 = 0.0;
  if (v5) {
    double v9 = ZWDefaultFadeAnimationDuration();
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __63__ZWLensChromeView_updateChromeVisibility_animated_completion___block_invoke;
  v13[3] = &unk_78B78;
  v13[4] = self;
  BOOL v14 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __63__ZWLensChromeView_updateChromeVisibility_animated_completion___block_invoke_2;
  v11[3] = &unk_78D60;
  id v12 = v8;
  id v10 = v8;
  +[UIView animateWithDuration:v13 animations:v11 completion:v9];
}

id __63__ZWLensChromeView_updateChromeVisibility_animated_completion___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

uint64_t __63__ZWLensChromeView_updateChromeVisibility_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)showLensResizingHandles:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  +[CATransaction begin];
  +[CATransaction setDisableActions:!v4];
  double v7 = [(ZWLensChromeView *)self lensResizingHandlesLayer];
  id v8 = v7;
  if (v5) {
    float v9 = 1.0;
  }
  else {
    float v9 = 0.0;
  }
  if (v5) {
    float v10 = 0.0;
  }
  else {
    float v10 = 1.0;
  }
  [v7 setOpacity:COERCE_DOUBLE((unint64_t)LODWORD(v9))];

  v11 = [(ZWLensChromeView *)self grabberOverlayLayer];
  *(float *)&double v12 = v10;
  [v11 setOpacity:v12];

  double v13 = [(ZWLensChromeView *)self backdropResizingMaskLayer];
  *(float *)&double v14 = v9;
  [v13 setOpacity:v14];

  double v15 = [(ZWLensChromeView *)self backdropGrabberMaskLayer];
  *(float *)&double v16 = v10;
  [v15 setOpacity:v16];

  [(ZWLensChromeView *)self setShowingResizeHandles:v5];
  [(ZWLensChromeView *)self layoutSubviews];

  +[CATransaction commit];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  double v3 = ZWZoomLensBorderThicknessForTouches();
  [(ZWLensChromeView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = __41__ZWLensChromeView_accessibilityElements__block_invoke;
  v83[3] = &__block_descriptor_40_e42__CGRect__CGPoint_dd__CGSize_dd__24__0d8d16l;
  *(double *)&v83[4] = v3;
  double v12 = objc_retainBlock(v83);
  if ([(ZWLensChromeView *)self showingResizeHandles])
  {
    double v13 = [(ZWLensChromeView *)self resizeElements];

    if (!v13)
    {
      double v14 = +[NSMutableArray array];
      id v15 = [objc_alloc((Class)UIAccessibilityElement) initWithAccessibilityContainer:self];
      double v16 = ZWLocString(@"ZW_RESIZE_HANDLE_UPPER_LEFT");
      [v15 setAccessibilityLabel:v16];

      CGFloat v77 = v15;
      [v14 addObject:v15];
      id v17 = [objc_alloc((Class)UIAccessibilityElement) initWithAccessibilityContainer:self];
      double v18 = ZWLocString(@"ZW_RESIZE_HANDLE_UPPER");
      [v17 setAccessibilityLabel:v18];

      CGFloat v75 = v17;
      [v14 addObject:v17];
      id v19 = [objc_alloc((Class)UIAccessibilityElement) initWithAccessibilityContainer:self];
      v20 = ZWLocString(@"ZW_RESIZE_HANDLE_UPPER_RIGHT");
      [v19 setAccessibilityLabel:v20];

      CGFloat v73 = v19;
      [v14 addObject:v19];
      id v21 = [objc_alloc((Class)UIAccessibilityElement) initWithAccessibilityContainer:self];
      double v22 = ZWLocString(@"ZW_RESIZE_HANDLE_LEFT");
      [v21 setAccessibilityLabel:v22];

      CGFloat v71 = v21;
      [v14 addObject:v21];
      id v23 = [objc_alloc((Class)UIAccessibilityElement) initWithAccessibilityContainer:self];
      double v24 = ZWLocString(@"ZW_RESIZE_HANDLE_RIGHT");
      [v23 setAccessibilityLabel:v24];

      v69 = v23;
      [v14 addObject:v23];
      id v25 = [objc_alloc((Class)UIAccessibilityElement) initWithAccessibilityContainer:self];
      double v26 = ZWLocString(@"ZW_RESIZE_HANDLE_LOWER_LEFT");
      [v25 setAccessibilityLabel:v26];

      id v68 = v25;
      [v14 addObject:v25];
      id v27 = [objc_alloc((Class)UIAccessibilityElement) initWithAccessibilityContainer:self];
      double v28 = ZWLocString(@"ZW_RESIZE_HANDLE_LOWER");
      [v27 setAccessibilityLabel:v28];

      id v67 = v27;
      [v14 addObject:v27];
      id v29 = [objc_alloc((Class)UIAccessibilityElement) initWithAccessibilityContainer:self];
      double v30 = ZWLocString(@"ZW_RESIZE_HANDLE_LOWER_RIGHT");
      [v29 setAccessibilityLabel:v30];

      [v14 addObject:v29];
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v31 = v14;
      id v32 = [v31 countByEnumeratingWithState:&v79 objects:v84 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v80;
        do
        {
          for (i = 0; i != v33; i = (char *)i + 1)
          {
            if (*(void *)v80 != v34) {
              objc_enumerationMutation(v31);
            }
            double v36 = *(void **)(*((void *)&v79 + 1) + 8 * i);
            [v36 setIsAccessibilityElement:1];
            double v37 = ZWLocString(@"ZW_RESIZE_HANDLE_HINT");
            [v36 setAccessibilityHint:v37];
          }
          id v33 = [v31 countByEnumeratingWithState:&v79 objects:v84 count:16];
        }
        while (v33);
      }

      [(ZWLensChromeView *)self setResizeElements:v31];
    }
    [(ZWLensChromeView *)self previousResizeBounds];
    v119.origin.x = v5;
    v119.origin.y = v7;
    v119.size.width = v9;
    v119.size.height = v11;
    if (!CGRectEqualToRect(v86, v119))
    {
      v38 = [(ZWLensChromeView *)self resizeElements];
      CGFloat v70 = [v38 objectAtIndexedSubscript:0];

      v39 = [(ZWLensChromeView *)self resizeElements];
      double v40 = [v39 objectAtIndexedSubscript:1];

      double v41 = [(ZWLensChromeView *)self resizeElements];
      double v42 = [v41 objectAtIndexedSubscript:2];

      double v43 = [(ZWLensChromeView *)self resizeElements];
      CGFloat v76 = [v43 objectAtIndexedSubscript:3];

      double v44 = [(ZWLensChromeView *)self resizeElements];
      double v45 = [v44 objectAtIndexedSubscript:4];

      double v46 = [(ZWLensChromeView *)self resizeElements];
      CGFloat v72 = [v46 objectAtIndexedSubscript:5];

      double v47 = [(ZWLensChromeView *)self resizeElements];
      v74 = [v47 objectAtIndexedSubscript:6];

      double v48 = [(ZWLensChromeView *)self resizeElements];
      CGFloat v78 = [v48 objectAtIndexedSubscript:7];

      v87.origin.x = v5;
      v87.origin.y = v7;
      v87.size.width = v9;
      v87.size.height = v11;
      double MinX = CGRectGetMinX(v87);
      v88.origin.x = v5;
      v88.origin.y = v7;
      v88.size.width = v9;
      v88.size.height = v11;
      CGFloat MinY = CGRectGetMinY(v88);
      v89.origin.x = ((double (*)(void *, double, CGFloat))v12[2])(v12, MinX, MinY);
      CGRect v90 = UIAccessibilityConvertFrameToScreenCoordinates(v89, &self->super);
      objc_msgSend(v70, "setAccessibilityFrame:", v90.origin.x, v90.origin.y, v90.size.width, v90.size.height);
      v91.origin.x = v5;
      v91.origin.y = v7;
      v91.size.width = v9;
      v91.size.height = v11;
      double MidX = CGRectGetMidX(v91);
      v92.origin.x = v5;
      v92.origin.y = v7;
      v92.size.width = v9;
      v92.size.height = v11;
      CGFloat v52 = CGRectGetMinY(v92);
      v93.origin.x = ((double (*)(void *, double, CGFloat))v12[2])(v12, MidX, v52);
      CGRect v94 = UIAccessibilityConvertFrameToScreenCoordinates(v93, &self->super);
      objc_msgSend(v40, "setAccessibilityFrame:", v94.origin.x, v94.origin.y, v94.size.width, v94.size.height);
      v95.origin.x = v5;
      v95.origin.y = v7;
      v95.size.width = v9;
      v95.size.height = v11;
      double MaxX = CGRectGetMaxX(v95);
      v96.origin.x = v5;
      v96.origin.y = v7;
      v96.size.width = v9;
      v96.size.height = v11;
      CGFloat v54 = CGRectGetMinY(v96);
      v97.origin.x = ((double (*)(void *, double, CGFloat))v12[2])(v12, MaxX, v54);
      CGRect v98 = UIAccessibilityConvertFrameToScreenCoordinates(v97, &self->super);
      objc_msgSend(v42, "setAccessibilityFrame:", v98.origin.x, v98.origin.y, v98.size.width, v98.size.height);
      v99.origin.x = v5;
      v99.origin.y = v7;
      v99.size.width = v9;
      v99.size.height = v11;
      double v55 = CGRectGetMaxX(v99);
      v100.origin.x = v5;
      v100.origin.y = v7;
      v100.size.width = v9;
      v100.size.height = v11;
      CGFloat MidY = CGRectGetMidY(v100);
      v101.origin.x = ((double (*)(void *, double, CGFloat))v12[2])(v12, v55, MidY);
      CGRect v102 = UIAccessibilityConvertFrameToScreenCoordinates(v101, &self->super);
      objc_msgSend(v45, "setAccessibilityFrame:", v102.origin.x, v102.origin.y, v102.size.width, v102.size.height);
      v103.origin.x = v5;
      v103.origin.y = v7;
      v103.size.width = v9;
      v103.size.height = v11;
      double v57 = CGRectGetMinX(v103);
      v104.origin.x = v5;
      v104.origin.y = v7;
      v104.size.width = v9;
      v104.size.height = v11;
      CGFloat MaxY = CGRectGetMaxY(v104);
      v105.origin.x = ((double (*)(void *, double, CGFloat))v12[2])(v12, v57, MaxY);
      CGRect v106 = UIAccessibilityConvertFrameToScreenCoordinates(v105, &self->super);
      objc_msgSend(v72, "setAccessibilityFrame:", v106.origin.x, v106.origin.y, v106.size.width, v106.size.height);
      v107.origin.x = v5;
      v107.origin.y = v7;
      v107.size.width = v9;
      v107.size.height = v11;
      double v59 = CGRectGetMinX(v107);
      v108.origin.x = v5;
      v108.origin.y = v7;
      v108.size.width = v9;
      v108.size.height = v11;
      CGFloat v60 = CGRectGetMidY(v108);
      v109.origin.x = ((double (*)(void *, double, CGFloat))v12[2])(v12, v59, v60);
      CGRect v110 = UIAccessibilityConvertFrameToScreenCoordinates(v109, &self->super);
      objc_msgSend(v76, "setAccessibilityFrame:", v110.origin.x, v110.origin.y, v110.size.width, v110.size.height);
      v111.origin.x = v5;
      v111.origin.y = v7;
      v111.size.width = v9;
      v111.size.height = v11;
      double v61 = CGRectGetMidX(v111);
      v112.origin.x = v5;
      v112.origin.y = v7;
      v112.size.width = v9;
      v112.size.height = v11;
      CGFloat v62 = CGRectGetMaxY(v112);
      v113.origin.x = ((double (*)(void *, double, CGFloat))v12[2])(v12, v61, v62);
      CGRect v114 = UIAccessibilityConvertFrameToScreenCoordinates(v113, &self->super);
      objc_msgSend(v74, "setAccessibilityFrame:", v114.origin.x, v114.origin.y, v114.size.width, v114.size.height);
      v115.origin.x = v5;
      v115.origin.y = v7;
      v115.size.width = v9;
      v115.size.height = v11;
      double v63 = CGRectGetMaxX(v115);
      v116.origin.x = v5;
      v116.origin.y = v7;
      v116.size.width = v9;
      v116.size.height = v11;
      CGFloat v64 = CGRectGetMaxY(v116);
      v117.origin.x = ((double (*)(void *, double, CGFloat))v12[2])(v12, v63, v64);
      CGRect v118 = UIAccessibilityConvertFrameToScreenCoordinates(v117, &self->super);
      objc_msgSend(v78, "setAccessibilityFrame:", v118.origin.x, v118.origin.y, v118.size.width, v118.size.height);
      -[ZWLensChromeView setPreviousResizeBounds:](self, "setPreviousResizeBounds:", v5, v7, v9, v11);
    }
    double v65 = [(ZWLensChromeView *)self resizeElements];
  }
  else
  {
    double v65 = 0;
  }

  return v65;
}

double __41__ZWLensChromeView_accessibilityElements__block_invoke(uint64_t a1, double a2)
{
  return a2 - *(double *)(a1 + 32) * 0.5;
}

- (CAShapeLayer)chromeOuterBorderLayer
{
  return self->_chromeOuterBorderLayer;
}

- (void)setChromeOuterBorderLayer:(id)a3
{
}

- (CAShapeLayer)chromeInnerBorderLayer
{
  return self->_chromeInnerBorderLayer;
}

- (void)setChromeInnerBorderLayer:(id)a3
{
}

- (CAShapeLayer)lensResizingHandlesLayer
{
  return self->_lensResizingHandlesLayer;
}

- (void)setLensResizingHandlesLayer:(id)a3
{
}

- (CAShapeLayer)touchStealerShapeLayer
{
  return self->_touchStealerShapeLayer;
}

- (void)setTouchStealerShapeLayer:(id)a3
{
}

- (CALayer)grabberOverlayLayer
{
  return self->_grabberOverlayLayer;
}

- (void)setGrabberOverlayLayer:(id)a3
{
}

- (CALayer)backdropLayer
{
  return self->_backdropLayer;
}

- (void)setBackdropLayer:(id)a3
{
}

- (CAShapeLayer)backdropMaskShapeLayer
{
  return self->_backdropMaskShapeLayer;
}

- (void)setBackdropMaskShapeLayer:(id)a3
{
}

- (CAShapeLayer)backdropGrabberMaskLayer
{
  return self->_backdropGrabberMaskLayer;
}

- (void)setBackdropGrabberMaskLayer:(id)a3
{
}

- (CAShapeLayer)backdropResizingMaskLayer
{
  return self->_backdropResizingMaskLayer;
}

- (void)setBackdropResizingMaskLayer:(id)a3
{
}

- (NSArray)resizeElements
{
  return self->_resizeElements;
}

- (void)setResizeElements:(id)a3
{
}

- (CGRect)previousResizeBounds
{
  double x = self->_previousResizeBounds.origin.x;
  double y = self->_previousResizeBounds.origin.y;
  double width = self->_previousResizeBounds.size.width;
  double height = self->_previousResizeBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviousResizeBounds:(CGRect)a3
{
  self->_previousResizeBounds = a3;
}

- (BOOL)showingResizeHandles
{
  return self->_showingResizeHandles;
}

- (void)setShowingResizeHandles:(BOOL)a3
{
  self->_showingResizeHandles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resizeElements, 0);
  objc_storeStrong((id *)&self->_backdropResizingMaskLayer, 0);
  objc_storeStrong((id *)&self->_backdropGrabberMaskLayer, 0);
  objc_storeStrong((id *)&self->_backdropMaskShapeLayer, 0);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_grabberOverlayLayer, 0);
  objc_storeStrong((id *)&self->_touchStealerShapeLayer, 0);
  objc_storeStrong((id *)&self->_lensResizingHandlesLayer, 0);
  objc_storeStrong((id *)&self->_chromeInnerBorderLayer, 0);

  objc_storeStrong((id *)&self->_chromeOuterBorderLayer, 0);
}

@end
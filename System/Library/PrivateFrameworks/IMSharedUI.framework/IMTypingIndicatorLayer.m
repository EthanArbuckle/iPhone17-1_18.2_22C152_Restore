@interface IMTypingIndicatorLayer
+ (BOOL)supportsTypingIndicatorAnimation;
+ (CGPoint)largeBubbleGrowOffset;
+ (CGPoint)mediumBubbleGrowOffset;
+ (CGPoint)smallBubbleGrowOffset;
+ (CGPoint)thinkingDotsOffset;
+ (CGRect)iconImageFrame;
+ (CGRect)largeBubbleFrame;
+ (CGRect)mediumBubbleFrame;
+ (CGRect)smallBubbleFrame;
+ (CGSize)defaultSize;
+ (double)iconImageTrailingSpace;
+ (double)thinkingDotDiameter;
+ (double)thinkingDotSpace;
- (BOOL)hasDarkBackground;
- (BOOL)isHighlighted;
- (CALayer)bubbleContainer;
- (CALayer)iconImageLayer;
- (CALayer)largeBubble;
- (CALayer)mediumBubble;
- (CALayer)smallBubble;
- (CALayer)thinkingDot;
- (CALayer)thinkingDotContainer;
- (CAReplicatorLayer)thinkingDots;
- (IMTypingIndicatorLayer)init;
- (UIColor)bubbleColor;
- (UIColor)customBubbleColor;
- (UIColor)defaultBubbleColor;
- (UIColor)defaultThinkingDotColor;
- (UIColor)thinkingDotColor;
- (UITraitCollection)traitCollection;
- (double)bubbleOpacity;
- (double)convertedCurrentMediaTime;
- (double)defaultBubbleOpacity;
- (double)defaultThinkingDotOpacity;
- (double)thinkingDotOpacity;
- (id)_largeBubbleGrowAnimationsWithSpeed:(double)a3 offset:(CGPoint)a4;
- (id)_largeBubblePulseAnimationWithSpeed:(double)a3 delay:(double)a4;
- (id)_mediumBubbleGrowAnimationsWithSpeed:(double)a3 offset:(CGPoint)a4;
- (id)_mediumBubblePulseAnimationWithSpeed:(double)a3 delay:(double)a4;
- (id)_smallBubbleGrowAnimationsWithSpeed:(double)a3 offset:(CGPoint)a4;
- (id)_smallBubblePulseAnimationWithSpeed:(double)a3 delay:(double)a4;
- (id)iconImage;
- (id)initHighlighted:(BOOL)a3;
- (id)resolvedColor:(id)a3 forTraitCollection:(id)a4;
- (void)_buildIconImage;
- (void)_buildThinkingDots;
- (void)_setup;
- (void)_updateBubbleColors;
- (void)_updateBubbleOpacity;
- (void)_updateForImage;
- (void)setBubbleColor:(id)a3;
- (void)setBubbleContainer:(id)a3;
- (void)setBubbleOpacity:(double)a3;
- (void)setCustomBubbleColor:(id)a3;
- (void)setHasDarkBackground:(BOOL)a3;
- (void)setIconImage:(id)a3;
- (void)setIconImageLayer:(id)a3;
- (void)setLargeBubble:(id)a3;
- (void)setMediumBubble:(id)a3;
- (void)setSmallBubble:(id)a3;
- (void)setThinkingDot:(id)a3;
- (void)setThinkingDotColor:(id)a3;
- (void)setThinkingDotContainer:(id)a3;
- (void)setThinkingDotOpacity:(double)a3;
- (void)setThinkingDots:(id)a3;
- (void)setTraitCollection:(id)a3;
- (void)startGrowAnimation;
- (void)startGrowAnimationWithCompletionBlock:(id)a3;
- (void)startPulseAnimation;
- (void)startShrinkAnimationWithCompletionBlock:(id)a3;
- (void)stopAnimation;
- (void)stopPulseAnimation;
@end

@implementation IMTypingIndicatorLayer

- (IMTypingIndicatorLayer)init
{
  v7.receiver = self;
  v7.super_class = (Class)IMTypingIndicatorLayer;
  v2 = [(IMTypingIndicatorLayer *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend__setup(v2, v3, v4);
  }
  return v5;
}

- (id)initHighlighted:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IMTypingIndicatorLayer;
  uint64_t v4 = [(IMTypingIndicatorLayer *)&v9 init];
  objc_super v7 = v4;
  if (v4)
  {
    v4->_highlighted = a3;
    objc_msgSend__setup(v4, v5, v6);
  }
  return v7;
}

- (double)convertedCurrentMediaTime
{
  CACurrentMediaTime();
  MEMORY[0x270F9A6D0](self, sel_convertTime_fromLayer_, 0);
  return result;
}

- (void)setBubbleColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_bubbleColor = (id *)&self->_bubbleColor;
  if (self->_bubbleColor != v5)
  {
    objc_super v9 = v5;
    objc_storeStrong(p_bubbleColor, a3);
    p_bubbleColor = (id *)objc_msgSend__updateBubbleColors(self, v7, v8);
    v5 = v9;
  }
  MEMORY[0x270F9A758](p_bubbleColor, v5);
}

- (void)setBubbleOpacity:(double)a3
{
  if (self->_bubbleOpacity != a3)
  {
    self->_bubbleOpacity = a3;
    objc_msgSend__updateBubbleOpacity(self, a2, v3);
  }
}

- (id)resolvedColor:(id)a3 forTraitCollection:(id)a4
{
  id v5 = a3;
  objc_super v7 = v5;
  if (a4)
  {
    objc_msgSend_resolvedColorWithTraitCollection_(v5, v6, (uint64_t)a4);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = v5;
  }
  objc_super v9 = v8;

  return v9;
}

- (void)setTraitCollection:(id)a3
{
  id v5 = (UITraitCollection *)a3;
  p_traitCollection = &self->_traitCollection;
  if (self->_traitCollection != v5)
  {
    v29 = v5;
    objc_storeStrong((id *)&self->_traitCollection, a3);
    objc_super v9 = objc_msgSend_defaultThinkingDotColor(self, v7, v8);
    objc_msgSend_resolvedColor_forTraitCollection_(self, v10, (uint64_t)v9, *p_traitCollection);
    v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
    thinkingDotColor = self->_thinkingDotColor;
    self->_thinkingDotColor = v11;

    v15 = objc_msgSend_defaultBubbleColor(self, v13, v14);
    objc_msgSend_resolvedColor_forTraitCollection_(self, v16, (uint64_t)v15, *p_traitCollection);
    v17 = (UIColor *)objc_claimAutoreleasedReturnValue();
    bubbleColor = self->_bubbleColor;
    self->_bubbleColor = v17;

    objc_msgSend__updateBubbleColors(self, v19, v20);
    thinkingDot = self->_thinkingDot;
    objc_msgSend_thinkingDotColor(self, v22, v23);
    id v24 = objc_claimAutoreleasedReturnValue();
    uint64_t v27 = objc_msgSend_CGColor(v24, v25, v26);
    objc_msgSend_setBackgroundColor_(thinkingDot, v28, v27);

    id v5 = v29;
  }
}

- (void)setIconImage:(id)a3
{
  id v5 = (const char *)a3;
  uint64_t iconImage = (uint64_t)self->_iconImage;
  if ((const char *)iconImage != v5)
  {
    objc_super v9 = v5;
    uint64_t iconImage = objc_msgSend_isEqual_((void *)iconImage, v5, (uint64_t)v5);
    id v5 = v9;
    if ((iconImage & 1) == 0)
    {
      objc_storeStrong(&self->_iconImage, a3);
      uint64_t iconImage = objc_msgSend__updateForImage(self, v7, v8);
      id v5 = v9;
    }
  }
  MEMORY[0x270F9A758](iconImage, v5);
}

- (void)_setup
{
  objc_msgSend_defaultThinkingDotColor(self, a2, v2);
  id v128 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resolvedColor_forTraitCollection_(self, v4, (uint64_t)v128, self->_traitCollection);
  id v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  thinkingDotColor = self->_thinkingDotColor;
  self->_thinkingDotColor = v5;

  objc_super v9 = objc_msgSend_defaultBubbleColor(self, v7, v8);
  objc_msgSend_resolvedColor_forTraitCollection_(self, v10, (uint64_t)v9, self->_traitCollection);
  v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
  bubbleColor = self->_bubbleColor;
  self->_bubbleColor = v11;

  objc_msgSend_defaultThinkingDotOpacity(self, v13, v14);
  self->_thinkingDotOpacity = v15;
  objc_msgSend_defaultBubbleOpacity(self, v16, v17);
  self->_bubbleOpacity = v18;
  objc_msgSend_frame(self, v19, v20);
  double v22 = v21;
  double v24 = v23;
  v25 = objc_opt_class();
  objc_msgSend_defaultSize(v25, v26, v27);
  objc_msgSend_setFrame_(self, v28, v29, v22, v24, v30, v31);
  v32 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
  bubbleContainer = self->_bubbleContainer;
  self->_bubbleContainer = v32;

  v34 = self->_bubbleContainer;
  objc_msgSend_bounds(self, v35, v36);
  objc_msgSend_setFrame_(v34, v37, v38);
  objc_msgSend_setAllowsGroupOpacity_(self->_bubbleContainer, v39, 1);
  objc_msgSend_addSublayer_(self, v40, (uint64_t)self->_bubbleContainer);
  v41 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
  smallBubble = self->_smallBubble;
  self->_smallBubble = v41;

  v43 = objc_opt_class();
  objc_msgSend_smallBubbleFrame(v43, v44, v45);
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;
  objc_msgSend_setCornerRadius_(self->_smallBubble, v54, v55, v50 * 0.5);
  objc_msgSend_setAnchorPoint_(self->_smallBubble, v56, v57, 0.318, 0.318);
  objc_msgSend_setPosition_(self->_smallBubble, v58, v59, v47, v49);
  objc_msgSend_setBounds_(self->_smallBubble, v60, v61, 0.0, 0.0, v51, v53);
  objc_msgSend_addSublayer_(self->_bubbleContainer, v62, (uint64_t)self->_smallBubble);
  v63 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
  mediumBubble = self->_mediumBubble;
  self->_mediumBubble = v63;

  v65 = objc_opt_class();
  objc_msgSend_mediumBubbleFrame(v65, v66, v67);
  double v69 = v68;
  double v71 = v70;
  double v73 = v72;
  double v75 = v74;
  objc_msgSend_setCornerRadius_(self->_mediumBubble, v76, v77, v74 * 0.5);
  objc_msgSend_setAnchorPoint_(self->_mediumBubble, v78, v79, 0.326, 0.37);
  objc_msgSend_setPosition_(self->_mediumBubble, v80, v81, v69, v71);
  objc_msgSend_setBounds_(self->_mediumBubble, v82, v83, 0.0, 0.0, v73, v75);
  objc_msgSend_addSublayer_(self->_bubbleContainer, v84, (uint64_t)self->_mediumBubble);
  v85 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
  largeBubble = self->_largeBubble;
  self->_largeBubble = v85;

  v87 = objc_opt_class();
  objc_msgSend_largeBubbleFrame(v87, v88, v89);
  double v91 = v90;
  double v93 = v92;
  double v95 = v94;
  double v97 = v96;
  objc_msgSend_setCornerRadius_(self->_largeBubble, v98, v99, v96 * 0.5);
  objc_msgSend_setAnchorPoint_(self->_largeBubble, v100, v101, 0.185, 0.28);
  objc_msgSend_setPosition_(self->_largeBubble, v102, v103, v91, v93);
  objc_msgSend_setBounds_(self->_largeBubble, v104, v105, 0.0, 0.0, v95, v97);
  objc_msgSend_addSublayer_(self->_bubbleContainer, v106, (uint64_t)self->_largeBubble);
  v107 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
  thinkingDotContainer = self->_thinkingDotContainer;
  self->_thinkingDotContainer = v107;

  v109 = self->_thinkingDotContainer;
  v112 = objc_msgSend_largeBubble(self, v110, v111);
  objc_msgSend_anchorPoint(v112, v113, v114);
  objc_msgSend_setAnchorPoint_(v109, v115, v116);

  objc_msgSend_setPosition_(self->_thinkingDotContainer, v117, v118, v91, v93);
  objc_msgSend_setBounds_(self->_thinkingDotContainer, v119, v120, 0.0, 0.0, v95, v97);
  objc_msgSend_addSublayer_(self, v121, (uint64_t)self->_thinkingDotContainer);
  objc_msgSend__updateBubbleColors(self, v122, v123);
  objc_msgSend__updateBubbleOpacity(self, v124, v125);
  objc_msgSend__updateForImage(self, v126, v127);
}

- (void)_updateForImage
{
  objc_msgSend_largeBubble(self, a2, v2);
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_frame(v31, v4, v5);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = objc_opt_class();
  objc_msgSend_largeBubbleFrame(v12, v13, v14);
  double v18 = v17;
  if (self->_iconImage)
  {
    v19 = objc_opt_class();
    objc_msgSend_iconImageFrame(v19, v20, v21);
    double MaxX = CGRectGetMaxX(v33);
  }
  else
  {
    double MaxX = 0.0;
  }
  double v23 = v18 + MaxX;
  double v24 = objc_msgSend_largeBubble(self, v15, v16);
  objc_msgSend_setFrame_(v24, v25, v26, v7, v9, v23, v11);

  objc_msgSend__buildIconImage(self, v27, v28);
  objc_msgSend__buildThinkingDots(self, v29, v30);
}

- (void)_buildIconImage
{
  uint64_t v4 = objc_msgSend_iconImageLayer(self, a2, v2);
  id iconImage = self->_iconImage;
  if (iconImage)
  {
    if (v4)
    {
      id v44 = v4;
      objc_msgSend_setContents_(v4, v5, (uint64_t)iconImage);
    }
    else
    {
      objc_msgSend_layer(MEMORY[0x263F157E8], v5, (uint64_t)iconImage);
      id v44 = (id)objc_claimAutoreleasedReturnValue();
      double v8 = objc_opt_class();
      objc_msgSend_iconImageFrame(v8, v9, v10);
      double v12 = v11;
      objc_msgSend_setFrame_(v44, v13, v14);
      id v15 = self->_iconImage;
      double v18 = objc_msgSend_mainScreen(MEMORY[0x263F1C920], v16, v17);
      objc_msgSend_scale(v18, v19, v20);
      double v22 = v21;

      if (v22 == 1.0)
      {
        uint64_t v25 = 73;
      }
      else
      {
        uint64_t v26 = objc_msgSend_mainScreen(MEMORY[0x263F1C920], v23, v24);
        objc_msgSend_scale(v26, v27, v28);
        double v30 = v29;

        if (v30 == 2.0) {
          uint64_t v25 = 74;
        }
        else {
          uint64_t v25 = 75;
        }
      }
      id v31 = (uint64_t (*)(id, uint64_t, void))MEMORY[0x21D462110]("LICreateIconForImage", @"MobileIcons");
      uint64_t v32 = v31(v15, v25, 0);
      if (v32)
      {
        v34 = (const void *)v32;
        objc_msgSend_setContents_(v44, v33, v32);
        CFAutorelease(v34);
      }
      else
      {
        objc_msgSend_setMasksToBounds_(v44, v33, 1);
        objc_msgSend_setCornerCurve_(v44, v36, *MEMORY[0x263F15A20]);
        objc_msgSend_setCornerRadius_(v44, v37, v38, v12 * 0.5);
        objc_msgSend_setContents_(v44, v39, (uint64_t)self->_iconImage);
      }
      objc_msgSend_setIconImageLayer_(self, v35, (uint64_t)v44);
      v42 = objc_msgSend_largeBubble(self, v40, v41);
      objc_msgSend_addSublayer_(v42, v43, (uint64_t)v44);
    }
  }
  else
  {
    id v44 = v4;
    objc_msgSend_removeFromSuperlayer(v4, v5, 0);
    objc_msgSend_setIconImageLayer_(self, v7, 0);
  }
}

- (void)_buildThinkingDots
{
  v110[2] = *MEMORY[0x263EF8340];
  objc_msgSend_begin(MEMORY[0x263F158F8], a2, v2);
  objc_msgSend_setAnimationDuration_(MEMORY[0x263F158F8], v4, v5, 0.0);
  objc_msgSend_removeAllAnimations(self->_thinkingDot, v6, v7);
  objc_msgSend_removeFromSuperlayer(self->_thinkingDots, v8, v9);
  objc_msgSend_removeFromSuperlayer(self->_thinkingDot, v10, v11);
  thinkingDot = self->_thinkingDot;
  self->_thinkingDot = 0;

  thinkingDots = self->_thinkingDots;
  self->_thinkingDots = 0;

  objc_msgSend_layer(MEMORY[0x263F157E8], v14, v15);
  uint64_t v16 = (CALayer *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = self->_thinkingDot;
  self->_thinkingDot = v16;

  double v18 = objc_opt_class();
  objc_msgSend_thinkingDotDiameter(v18, v19, v20);
  double v22 = v21;
  objc_msgSend_setFrame_(self->_thinkingDot, v23, v24, 0.0, 0.0, v22, v22);
  objc_msgSend_setCornerRadius_(self->_thinkingDot, v25, v26, v22 * 0.5);
  uint64_t v27 = self->_thinkingDot;
  objc_msgSend_thinkingDotColor(self, v28, v29);
  id v30 = objc_claimAutoreleasedReturnValue();
  uint64_t v33 = objc_msgSend_CGColor(v30, v31, v32);
  objc_msgSend_setBackgroundColor_(v27, v34, v33);

  v35 = objc_opt_class();
  if (objc_msgSend_supportsTypingIndicatorAnimation(v35, v36, v37))
  {
    v40 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F157D8], v38, @"opacity");
    v110[0] = &unk_26C91C2E8;
    uint64_t v41 = NSNumber;
    objc_msgSend_thinkingDotOpacity(self, v42, v43);
    double v46 = objc_msgSend_numberWithDouble_(v41, v44, v45);
    v110[1] = v46;
    double v48 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v47, (uint64_t)v110, 2);
    objc_msgSend_setValues_(v40, v49, (uint64_t)v48);

    objc_msgSend_setKeyTimes_(v40, v50, (uint64_t)&unk_26C91C380);
    objc_msgSend_setCalculationMode_(v40, v51, *MEMORY[0x263F15970]);
    objc_msgSend_setDuration_(v40, v52, v53, 0.5);
    LODWORD(v54) = 1061271823;
    LODWORD(v55) = 1014679044;
    LODWORD(v56) = 1058306785;
    LODWORD(v57) = 1.0;
    v60 = objc_msgSend_functionWithControlPoints__::(MEMORY[0x263F15808], v58, v59, v54, v55, v56, v57);
    objc_msgSend_setTimingFunction_(v40, v61, (uint64_t)v60);

    LODWORD(v62) = 2139095040;
    objc_msgSend_setRepeatCount_(v40, v63, v64, v62);
    objc_msgSend_setAutoreverses_(v40, v65, 1);
    objc_msgSend_setFillMode_(v40, v66, *MEMORY[0x263F15AA8]);
    objc_msgSend_addAnimation_forKey_(self->_thinkingDot, v67, (uint64_t)v40, @"Opacity");
  }
  else
  {
    double v70 = self->_thinkingDot;
    objc_msgSend_thinkingDotOpacity(self, v38, v39);
    *(float *)&double v71 = v71;
    objc_msgSend_setOpacity_(v70, v72, v73, v71);
  }
  objc_msgSend_layer(MEMORY[0x263F15868], v68, v69);
  double v74 = (CAReplicatorLayer *)objc_claimAutoreleasedReturnValue();
  double v75 = self->_thinkingDots;
  self->_thinkingDots = v74;

  v76 = objc_opt_class();
  objc_msgSend_thinkingDotsOffset(v76, v77, v78);
  double v80 = v79;
  double v82 = v81;
  v85 = objc_msgSend_iconImage(self, v83, v84);
  if (v85)
  {
    v86 = objc_opt_class();
    objc_msgSend_iconImageFrame(v86, v87, v88);
    double MaxX = CGRectGetMaxX(v111);
    double v90 = objc_opt_class();
    objc_msgSend_iconImageTrailingSpace(v90, v91, v92);
    double v80 = MaxX + v93;
  }

  objc_msgSend_setFrame_(self->_thinkingDots, v94, v95, v80, v82, 0.0, 0.0);
  objc_msgSend_setInstanceCount_(self->_thinkingDots, v96, 3);
  double v97 = self->_thinkingDots;
  v98 = objc_opt_class();
  objc_msgSend_thinkingDotSpace(v98, v99, v100);
  CATransform3DMakeTranslation(&v109, v101, 0.0, 0.0);
  objc_msgSend_setInstanceTransform_(v97, v102, (uint64_t)&v109);
  objc_msgSend_setInstanceDelay_(self->_thinkingDots, v103, v104, 0.25);
  objc_msgSend_addSublayer_(self->_thinkingDots, v105, (uint64_t)self->_thinkingDot);
  objc_msgSend_addSublayer_(self->_thinkingDotContainer, v106, (uint64_t)self->_thinkingDots);
  objc_msgSend_commit(MEMORY[0x263F158F8], v107, v108);
}

- (void)_updateBubbleColors
{
  objc_msgSend_bubbleColor(self, a2, v2);
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_CGColor(v4, v5, v6);

  uint64_t v10 = objc_msgSend_largeBubble(self, v8, v9);
  objc_msgSend_setBackgroundColor_(v10, v11, v7);

  uint64_t v14 = objc_msgSend_mediumBubble(self, v12, v13);
  objc_msgSend_setBackgroundColor_(v14, v15, v7);

  objc_msgSend_smallBubble(self, v16, v17);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBackgroundColor_(v19, v18, v7);
}

- (void)_updateBubbleOpacity
{
  id v4 = objc_msgSend_largeBubble(self, a2, v2);
  LODWORD(v5) = 1.0;
  objc_msgSend_setOpacity_(v4, v6, v7, v5);

  uint64_t v10 = objc_msgSend_mediumBubble(self, v8, v9);
  LODWORD(v11) = 1.0;
  objc_msgSend_setOpacity_(v10, v12, v13, v11);

  uint64_t v16 = objc_msgSend_smallBubble(self, v14, v15);
  LODWORD(v17) = 1.0;
  objc_msgSend_setOpacity_(v16, v18, v19, v17);

  bubbleContainer = self->_bubbleContainer;
  objc_msgSend_bubbleOpacity(self, v21, v22);
  *(float *)&double v25 = v25;
  objc_msgSend_setOpacity_(bubbleContainer, v23, v24, v25);
}

- (id)_smallBubbleGrowAnimationsWithSpeed:(double)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v126[3] = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F15760], a2, @"hidden");
  uint64_t v9 = objc_msgSend_numberWithBool_(NSNumber, v8, 1);
  objc_msgSend_setFromValue_(v7, v10, (uint64_t)v9);

  double v12 = objc_msgSend_numberWithBool_(NSNumber, v11, 0);
  objc_msgSend_setToValue_(v7, v13, (uint64_t)v12);

  objc_msgSend_setDuration_(v7, v14, v15, 0.0);
  uint64_t v16 = *MEMORY[0x263F15AB0];
  objc_msgSend_setFillMode_(v7, v17, *MEMORY[0x263F15AB0]);
  objc_msgSend_setRemovedOnCompletion_(v7, v18, 1);
  uint64_t v19 = objc_opt_class();
  objc_msgSend_smallBubbleGrowOffset(v19, v20, v21);
  double v23 = v22;
  double v25 = v24;
  uint64_t v27 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F157D8], v26, @"position.x");
  float v28 = x;
  *(float *)&double v29 = v28;
  uint64_t v32 = objc_msgSend_numberWithFloat_(NSNumber, v30, v31, v29);
  v126[0] = v32;
  double v33 = x + v23;
  *(float *)&double v33 = x + v23;
  uint64_t v36 = objc_msgSend_numberWithFloat_(NSNumber, v34, v35, v33);
  v126[1] = v36;
  *(float *)&double v37 = x;
  v40 = objc_msgSend_numberWithFloat_(NSNumber, v38, v39, v37);
  v126[2] = v40;
  v42 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v41, (uint64_t)v126, 3);
  objc_msgSend_setValues_(v27, v43, (uint64_t)v42);

  uint64_t v44 = *MEMORY[0x263F15960];
  objc_msgSend_setCalculationMode_(v27, v45, *MEMORY[0x263F15960]);
  objc_msgSend_setDuration_(v27, v46, v47, 0.4);
  LODWORD(v48) = 0.25;
  LODWORD(v49) = 0.25;
  LODWORD(v50) = 1.0;
  LODWORD(v51) = 1036831949;
  double v54 = objc_msgSend_functionWithControlPoints__::(MEMORY[0x263F15808], v52, v53, v48, v51, v49, v50);
  objc_msgSend_setTimingFunction_(v27, v55, (uint64_t)v54);

  *(float *)&a3 = a3;
  LODWORD(v56) = LODWORD(a3);
  objc_msgSend_setSpeed_(v27, v57, v58, v56);
  objc_msgSend_setFillMode_(v27, v59, v16);
  objc_msgSend_setRemovedOnCompletion_(v27, v60, 1);
  double v62 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F157D8], v61, @"position.y");
  float v63 = y;
  *(float *)&double v64 = v63;
  uint64_t v67 = objc_msgSend_numberWithFloat_(NSNumber, v65, v66, v64);
  v125[0] = v67;
  double v68 = y + v25;
  *(float *)&double v68 = y + v25;
  double v71 = objc_msgSend_numberWithFloat_(NSNumber, v69, v70, v68);
  v125[1] = v71;
  *(float *)&double v72 = y;
  double v75 = objc_msgSend_numberWithFloat_(NSNumber, v73, v74, v72);
  v125[2] = v75;
  uint64_t v77 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v76, (uint64_t)v125, 3);
  objc_msgSend_setValues_(v62, v78, (uint64_t)v77);

  objc_msgSend_setCalculationMode_(v62, v79, v44);
  objc_msgSend_setDuration_(v62, v80, v81, 0.4);
  LODWORD(v82) = 1051315048;
  LODWORD(v83) = 1057991709;
  LODWORD(v84) = 1064582806;
  LODWORD(v85) = 1036831949;
  uint64_t v88 = objc_msgSend_functionWithControlPoints__::(MEMORY[0x263F15808], v86, v87, v82, v85, v83, v84);
  objc_msgSend_setTimingFunction_(v62, v89, (uint64_t)v88);

  LODWORD(v90) = LODWORD(a3);
  objc_msgSend_setSpeed_(v62, v91, v92, v90);
  objc_msgSend_setFillMode_(v62, v93, v16);
  objc_msgSend_setRemovedOnCompletion_(v62, v94, 1);
  double v96 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F15760], v95, @"transform.scale.xy");
  uint64_t v99 = objc_msgSend_numberWithFloat_(NSNumber, v97, v98, 0.0);
  objc_msgSend_setFromValue_(v96, v100, (uint64_t)v99);

  LODWORD(v101) = 1.0;
  uint64_t v104 = objc_msgSend_numberWithFloat_(NSNumber, v102, v103, v101);
  objc_msgSend_setToValue_(v96, v105, (uint64_t)v104);

  objc_msgSend_setDuration_(v96, v106, v107, 0.25);
  LODWORD(v108) = LODWORD(a3);
  objc_msgSend_setSpeed_(v96, v109, v110, v108);
  LODWORD(v111) = 0.25;
  LODWORD(v112) = 0.25;
  LODWORD(v113) = 1.0;
  LODWORD(v114) = 1036831949;
  v117 = objc_msgSend_functionWithControlPoints__::(MEMORY[0x263F15808], v115, v116, v111, v114, v112, v113);
  objc_msgSend_setTimingFunction_(v96, v118, (uint64_t)v117);

  objc_msgSend_setFillMode_(v96, v119, v16);
  objc_msgSend_setRemovedOnCompletion_(v96, v120, 1);
  v124[0] = v7;
  v124[1] = v27;
  v124[2] = v62;
  v124[3] = v96;
  v122 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v121, (uint64_t)v124, 4);

  return v122;
}

- (id)_smallBubblePulseAnimationWithSpeed:(double)a3 delay:(double)a4
{
  uint64_t v7 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F157D8], a2, @"transform.scale.xy");
  objc_msgSend_setValues_(v7, v8, (uint64_t)&unk_26C91C398);
  objc_msgSend_setCalculationMode_(v7, v9, *MEMORY[0x263F15960]);
  objc_msgSend_setTensionValues_(v7, v10, (uint64_t)&unk_26C91C3B0);
  objc_msgSend_setDuration_(v7, v11, v12, 0.7);
  objc_msgSend_convertedCurrentMediaTime(self, v13, v14);
  objc_msgSend_setBeginTime_(v7, v16, v17, v15 + a4);
  *(float *)&double v18 = a3;
  objc_msgSend_setSpeed_(v7, v19, v20, v18);
  double v22 = objc_msgSend_functionWithName_(MEMORY[0x263F15808], v21, *MEMORY[0x263F15EB8]);
  objc_msgSend_setTimingFunction_(v7, v23, (uint64_t)v22);

  LODWORD(v24) = 2139095040;
  objc_msgSend_setRepeatCount_(v7, v25, v26, v24);
  objc_msgSend_setAutoreverses_(v7, v27, 1);
  objc_msgSend_setFillMode_(v7, v28, *MEMORY[0x263F15AB0]);
  objc_msgSend_setRemovedOnCompletion_(v7, v29, 0);
  return v7;
}

- (id)_mediumBubbleGrowAnimationsWithSpeed:(double)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v144[3] = *MEMORY[0x263EF8340];
  double v8 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F15760], a2, @"hidden");
  uint64_t v10 = objc_msgSend_numberWithBool_(NSNumber, v9, 1);
  objc_msgSend_setFromValue_(v8, v11, (uint64_t)v10);

  uint64_t v13 = objc_msgSend_numberWithBool_(NSNumber, v12, 0);
  objc_msgSend_setToValue_(v8, v14, (uint64_t)v13);

  objc_msgSend_setDuration_(v8, v15, v16, 0.25);
  uint64_t v17 = *MEMORY[0x263F15AB0];
  objc_msgSend_setFillMode_(v8, v18, *MEMORY[0x263F15AB0]);
  objc_msgSend_setRemovedOnCompletion_(v8, v19, 1);
  v141 = self;
  uint64_t v20 = objc_opt_class();
  objc_msgSend_mediumBubbleGrowOffset(v20, v21, v22);
  double v24 = v23;
  double v26 = v25;
  float v28 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F157D8], v27, @"position.x");
  float v29 = x;
  *(float *)&double v30 = v29;
  double v33 = objc_msgSend_numberWithFloat_(NSNumber, v31, v32, v30);
  v144[0] = v33;
  double v34 = x + v24;
  *(float *)&double v34 = x + v24;
  double v37 = objc_msgSend_numberWithFloat_(NSNumber, v35, v36, v34);
  v144[1] = v37;
  *(float *)&double v38 = x;
  uint64_t v41 = objc_msgSend_numberWithFloat_(NSNumber, v39, v40, v38);
  v144[2] = v41;
  uint64_t v43 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v42, (uint64_t)v144, 3);
  objc_msgSend_setValues_(v28, v44, (uint64_t)v43);

  uint64_t v45 = *MEMORY[0x263F15960];
  objc_msgSend_setCalculationMode_(v28, v46, *MEMORY[0x263F15960]);
  objc_msgSend_convertedCurrentMediaTime(self, v47, v48);
  objc_msgSend_setBeginTime_(v28, v50, v51, v49 + 0.065);
  objc_msgSend_setDuration_(v28, v52, v53, 0.4);
  LODWORD(v54) = 0.25;
  LODWORD(v55) = 0.25;
  LODWORD(v56) = 1.0;
  LODWORD(v57) = 1036831949;
  v60 = objc_msgSend_functionWithControlPoints__::(MEMORY[0x263F15808], v58, v59, v54, v57, v55, v56);
  objc_msgSend_setTimingFunction_(v28, v61, (uint64_t)v60);

  *(float *)&a3 = a3;
  LODWORD(v62) = LODWORD(a3);
  objc_msgSend_setSpeed_(v28, v63, v64, v62);
  uint64_t v65 = v17;
  objc_msgSend_setFillMode_(v28, v66, v17);
  objc_msgSend_setRemovedOnCompletion_(v28, v67, 1);
  uint64_t v69 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F157D8], v68, @"position.y");
  float v70 = y;
  *(float *)&double v71 = v70;
  uint64_t v74 = objc_msgSend_numberWithFloat_(NSNumber, v72, v73, v71);
  v143[0] = v74;
  double v75 = y + v26;
  *(float *)&double v75 = y + v26;
  uint64_t v78 = objc_msgSend_numberWithFloat_(NSNumber, v76, v77, v75);
  v143[1] = v78;
  *(float *)&double v79 = y;
  double v82 = objc_msgSend_numberWithFloat_(NSNumber, v80, v81, v79);
  v143[2] = v82;
  double v84 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v83, (uint64_t)v143, 3);
  objc_msgSend_setValues_(v69, v85, (uint64_t)v84);

  objc_msgSend_setCalculationMode_(v69, v86, v45);
  objc_msgSend_convertedCurrentMediaTime(v141, v87, v88);
  objc_msgSend_setBeginTime_(v69, v90, v91, v89 + 0.065);
  objc_msgSend_setDuration_(v69, v92, v93, 0.4);
  LODWORD(v94) = 1051315048;
  LODWORD(v95) = 1057991709;
  LODWORD(v96) = 1064582806;
  LODWORD(v97) = 1036831949;
  uint64_t v100 = objc_msgSend_functionWithControlPoints__::(MEMORY[0x263F15808], v98, v99, v94, v97, v95, v96);
  objc_msgSend_setTimingFunction_(v69, v101, (uint64_t)v100);

  LODWORD(v102) = LODWORD(a3);
  objc_msgSend_setSpeed_(v69, v103, v104, v102);
  objc_msgSend_setFillMode_(v69, v105, v65);
  objc_msgSend_setRemovedOnCompletion_(v69, v106, 1);
  double v108 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F15760], v107, @"transform.scale.xy");
  double v111 = objc_msgSend_numberWithFloat_(NSNumber, v109, v110, 0.0);
  objc_msgSend_setFromValue_(v108, v112, (uint64_t)v111);

  LODWORD(v113) = 1.0;
  uint64_t v116 = objc_msgSend_numberWithFloat_(NSNumber, v114, v115, v113);
  objc_msgSend_setToValue_(v108, v117, (uint64_t)v116);

  objc_msgSend_convertedCurrentMediaTime(v141, v118, v119);
  objc_msgSend_setBeginTime_(v108, v121, v122, v120 + 0.065);
  objc_msgSend_setDuration_(v108, v123, v124, 0.25);
  LODWORD(v125) = LODWORD(a3);
  objc_msgSend_setSpeed_(v108, v126, v127, v125);
  LODWORD(v128) = 0.25;
  LODWORD(v129) = 0.25;
  LODWORD(v130) = 1.0;
  LODWORD(v131) = 1036831949;
  v134 = objc_msgSend_functionWithControlPoints__::(MEMORY[0x263F15808], v132, v133, v128, v131, v129, v130);
  objc_msgSend_setTimingFunction_(v108, v135, (uint64_t)v134);

  objc_msgSend_setFillMode_(v108, v136, v65);
  objc_msgSend_setRemovedOnCompletion_(v108, v137, 1);
  v142[0] = v8;
  v142[1] = v28;
  v142[2] = v69;
  v142[3] = v108;
  v139 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v138, (uint64_t)v142, 4);

  return v139;
}

- (id)_mediumBubblePulseAnimationWithSpeed:(double)a3 delay:(double)a4
{
  uint64_t v7 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F157D8], a2, @"transform.scale.xy");
  objc_msgSend_setValues_(v7, v8, (uint64_t)&unk_26C91C3C8);
  objc_msgSend_setCalculationMode_(v7, v9, *MEMORY[0x263F15960]);
  objc_msgSend_setTensionValues_(v7, v10, (uint64_t)&unk_26C91C3E0);
  objc_msgSend_convertedCurrentMediaTime(self, v11, v12);
  objc_msgSend_setBeginTime_(v7, v14, v15, v13 + a4);
  objc_msgSend_setDuration_(v7, v16, v17, 0.9);
  *(float *)&double v18 = a3;
  objc_msgSend_setSpeed_(v7, v19, v20, v18);
  uint64_t v22 = objc_msgSend_functionWithName_(MEMORY[0x263F15808], v21, *MEMORY[0x263F15EB8]);
  objc_msgSend_setTimingFunction_(v7, v23, (uint64_t)v22);

  LODWORD(v24) = 2139095040;
  objc_msgSend_setRepeatCount_(v7, v25, v26, v24);
  objc_msgSend_setAutoreverses_(v7, v27, 1);
  objc_msgSend_setFillMode_(v7, v28, *MEMORY[0x263F15AB0]);
  objc_msgSend_setRemovedOnCompletion_(v7, v29, 0);
  return v7;
}

- (id)_largeBubbleGrowAnimationsWithSpeed:(double)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v144[3] = *MEMORY[0x263EF8340];
  double v8 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F15760], a2, @"hidden");
  uint64_t v10 = objc_msgSend_numberWithBool_(NSNumber, v9, 1);
  objc_msgSend_setFromValue_(v8, v11, (uint64_t)v10);

  double v13 = objc_msgSend_numberWithBool_(NSNumber, v12, 0);
  objc_msgSend_setToValue_(v8, v14, (uint64_t)v13);

  objc_msgSend_setDuration_(v8, v15, v16, 0.25);
  uint64_t v17 = *MEMORY[0x263F15AB0];
  objc_msgSend_setFillMode_(v8, v18, *MEMORY[0x263F15AB0]);
  objc_msgSend_setRemovedOnCompletion_(v8, v19, 1);
  v141 = self;
  uint64_t v20 = objc_opt_class();
  objc_msgSend_largeBubbleGrowOffset(v20, v21, v22);
  double v24 = v23;
  double v26 = v25;
  float v28 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F157D8], v27, @"position.x");
  float v29 = x;
  *(float *)&double v30 = v29;
  double v33 = objc_msgSend_numberWithFloat_(NSNumber, v31, v32, v30);
  v144[0] = v33;
  double v34 = x + v24;
  *(float *)&double v34 = x + v24;
  double v37 = objc_msgSend_numberWithFloat_(NSNumber, v35, v36, v34);
  v144[1] = v37;
  *(float *)&double v38 = x;
  uint64_t v41 = objc_msgSend_numberWithFloat_(NSNumber, v39, v40, v38);
  v144[2] = v41;
  uint64_t v43 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v42, (uint64_t)v144, 3);
  objc_msgSend_setValues_(v28, v44, (uint64_t)v43);

  uint64_t v45 = *MEMORY[0x263F15960];
  objc_msgSend_setCalculationMode_(v28, v46, *MEMORY[0x263F15960]);
  objc_msgSend_convertedCurrentMediaTime(self, v47, v48);
  objc_msgSend_setBeginTime_(v28, v50, v51, v49 + 0.12);
  objc_msgSend_setDuration_(v28, v52, v53, 0.4);
  LODWORD(v54) = 0.25;
  LODWORD(v55) = 0.25;
  LODWORD(v56) = 1.0;
  LODWORD(v57) = 1036831949;
  v60 = objc_msgSend_functionWithControlPoints__::(MEMORY[0x263F15808], v58, v59, v54, v57, v55, v56);
  objc_msgSend_setTimingFunction_(v28, v61, (uint64_t)v60);

  *(float *)&a3 = a3;
  LODWORD(v62) = LODWORD(a3);
  objc_msgSend_setSpeed_(v28, v63, v64, v62);
  uint64_t v65 = v17;
  objc_msgSend_setFillMode_(v28, v66, v17);
  objc_msgSend_setRemovedOnCompletion_(v28, v67, 1);
  uint64_t v69 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F157D8], v68, @"position.y");
  float v70 = y;
  *(float *)&double v71 = v70;
  uint64_t v74 = objc_msgSend_numberWithFloat_(NSNumber, v72, v73, v71);
  v143[0] = v74;
  double v75 = y + v26;
  *(float *)&double v75 = y + v26;
  uint64_t v78 = objc_msgSend_numberWithFloat_(NSNumber, v76, v77, v75);
  v143[1] = v78;
  *(float *)&double v79 = y;
  double v82 = objc_msgSend_numberWithFloat_(NSNumber, v80, v81, v79);
  v143[2] = v82;
  double v84 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v83, (uint64_t)v143, 3);
  objc_msgSend_setValues_(v69, v85, (uint64_t)v84);

  objc_msgSend_setCalculationMode_(v69, v86, v45);
  objc_msgSend_convertedCurrentMediaTime(v141, v87, v88);
  objc_msgSend_setBeginTime_(v69, v90, v91, v89 + 0.12);
  objc_msgSend_setDuration_(v69, v92, v93, 0.4);
  LODWORD(v94) = 1045836616;
  LODWORD(v95) = 1048849804;
  LODWORD(v96) = 1057991709;
  LODWORD(v97) = 1064582806;
  uint64_t v100 = objc_msgSend_functionWithControlPoints__::(MEMORY[0x263F15808], v98, v99, v94, v95, v96, v97);
  objc_msgSend_setTimingFunction_(v69, v101, (uint64_t)v100);

  LODWORD(v102) = LODWORD(a3);
  objc_msgSend_setSpeed_(v69, v103, v104, v102);
  objc_msgSend_setFillMode_(v69, v105, v65);
  objc_msgSend_setRemovedOnCompletion_(v69, v106, 1);
  double v108 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F15760], v107, @"transform.scale.xy");
  double v111 = objc_msgSend_numberWithFloat_(NSNumber, v109, v110, 0.0);
  objc_msgSend_setFromValue_(v108, v112, (uint64_t)v111);

  LODWORD(v113) = 1.0;
  uint64_t v116 = objc_msgSend_numberWithFloat_(NSNumber, v114, v115, v113);
  objc_msgSend_setToValue_(v108, v117, (uint64_t)v116);

  objc_msgSend_convertedCurrentMediaTime(v141, v118, v119);
  objc_msgSend_setBeginTime_(v108, v121, v122, v120 + 0.12);
  objc_msgSend_setDuration_(v108, v123, v124, 0.25);
  LODWORD(v125) = LODWORD(a3);
  objc_msgSend_setSpeed_(v108, v126, v127, v125);
  LODWORD(v128) = 0.25;
  LODWORD(v129) = 0.25;
  LODWORD(v130) = 1.0;
  LODWORD(v131) = 1036831949;
  v134 = objc_msgSend_functionWithControlPoints__::(MEMORY[0x263F15808], v132, v133, v128, v131, v129, v130);
  objc_msgSend_setTimingFunction_(v108, v135, (uint64_t)v134);

  objc_msgSend_setFillMode_(v108, v136, v65);
  objc_msgSend_setRemovedOnCompletion_(v108, v137, 1);
  v142[0] = v8;
  v142[1] = v28;
  v142[2] = v69;
  v142[3] = v108;
  v139 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v138, (uint64_t)v142, 4);

  return v139;
}

- (id)_largeBubblePulseAnimationWithSpeed:(double)a3 delay:(double)a4
{
  uint64_t v7 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F157D8], a2, @"transform.scale.xy");
  objc_msgSend_setValues_(v7, v8, (uint64_t)&unk_26C91C3F8);
  objc_msgSend_setCalculationMode_(v7, v9, *MEMORY[0x263F15960]);
  objc_msgSend_setTensionValues_(v7, v10, (uint64_t)&unk_26C91C410);
  objc_msgSend_convertedCurrentMediaTime(self, v11, v12);
  objc_msgSend_setBeginTime_(v7, v14, v15, v13 + a4);
  objc_msgSend_setDuration_(v7, v16, v17, 1.9);
  *(float *)&double v18 = a3;
  objc_msgSend_setSpeed_(v7, v19, v20, v18);
  uint64_t v22 = objc_msgSend_functionWithName_(MEMORY[0x263F15808], v21, *MEMORY[0x263F15EB8]);
  objc_msgSend_setTimingFunction_(v7, v23, (uint64_t)v22);

  LODWORD(v24) = 2139095040;
  objc_msgSend_setRepeatCount_(v7, v25, v26, v24);
  objc_msgSend_setAutoreverses_(v7, v27, 1);
  objc_msgSend_setFillMode_(v7, v28, *MEMORY[0x263F15AB0]);
  objc_msgSend_setRemovedOnCompletion_(v7, v29, 0);
  return v7;
}

- (void)startGrowAnimationWithCompletionBlock:(id)a3
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend_begin(MEMORY[0x263F158F8], v5, v6);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  uint64_t v7 = objc_opt_class();
  objc_msgSend_smallBubbleFrame(v7, v8, v9);
  uint64_t v14 = objc_msgSend__smallBubbleGrowAnimationsWithSpeed_offset_(self, v10, v11, 1.0, v12, v13);
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v84, v91, 16);
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v85;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v85 != v19) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend_addAnimation_forKey_(self->_smallBubble, v17, *(void *)(*((void *)&v84 + 1) + 8 * v20++), 0);
      }
      while (v18 != v20);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v84, v91, 16);
    }
    while (v18);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  uint64_t v21 = objc_opt_class();
  objc_msgSend_mediumBubbleFrame(v21, v22, v23);
  float v28 = objc_msgSend__mediumBubbleGrowAnimationsWithSpeed_offset_(self, v24, v25, 1.0, v26, v27);
  uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v80, v90, 16);
  if (v30)
  {
    uint64_t v32 = v30;
    uint64_t v33 = *(void *)v81;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v81 != v33) {
          objc_enumerationMutation(v28);
        }
        objc_msgSend_addAnimation_forKey_(self->_mediumBubble, v31, *(void *)(*((void *)&v80 + 1) + 8 * v34++), 0);
      }
      while (v32 != v34);
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v80, v90, 16);
    }
    while (v32);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  objc_msgSend_position(self->_largeBubble, v35, v36);
  uint64_t v41 = objc_msgSend__largeBubbleGrowAnimationsWithSpeed_offset_(self, v37, v38, 1.0, v39, v40);
  uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v76, v89, 16);
  if (v43)
  {
    uint64_t v45 = v43;
    uint64_t v46 = *(void *)v77;
    do
    {
      uint64_t v47 = 0;
      do
      {
        if (*(void *)v77 != v46) {
          objc_enumerationMutation(v41);
        }
        objc_msgSend_addAnimation_forKey_(self->_largeBubble, v44, *(void *)(*((void *)&v76 + 1) + 8 * v47++), 0);
      }
      while (v45 != v47);
      uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v76, v89, 16);
    }
    while (v45);
  }

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  objc_msgSend_position(self->_largeBubble, v48, v49);
  double v54 = objc_msgSend__largeBubbleGrowAnimationsWithSpeed_offset_(self, v50, v51, 1.0, v52, v53);
  uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v55, (uint64_t)&v72, v88, 16);
  if (v56)
  {
    uint64_t v58 = v56;
    uint64_t v59 = *(void *)v73;
    do
    {
      uint64_t v60 = 0;
      do
      {
        if (*(void *)v73 != v59) {
          objc_enumerationMutation(v54);
        }
        objc_msgSend_addAnimation_forKey_(self->_thinkingDotContainer, v57, *(void *)(*((void *)&v72 + 1) + 8 * v60++), 0);
      }
      while (v58 != v60);
      uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v57, (uint64_t)&v72, v88, 16);
    }
    while (v58);
  }

  uint64_t v61 = (void *)MEMORY[0x263F158F8];
  uint64_t v66 = MEMORY[0x263EF8330];
  uint64_t v67 = 3221225472;
  double v68 = sub_2180F0D30;
  uint64_t v69 = &unk_2643006E8;
  float v70 = self;
  id v71 = v4;
  id v62 = v4;
  objc_msgSend_setCompletionBlock_(v61, v63, (uint64_t)&v66);
  objc_msgSend_commit(MEMORY[0x263F158F8], v64, v65, v66, v67, v68, v69, v70);
}

- (void)startGrowAnimation
{
}

- (void)startPulseAnimation
{
  uint64_t v3 = objc_opt_class();
  if (objc_msgSend_supportsTypingIndicatorAnimation(v3, v4, v5))
  {
    objc_msgSend_stopPulseAnimation(self, v6, v7);
    objc_msgSend_begin(MEMORY[0x263F158F8], v8, v9);
    smallBubble = self->_smallBubble;
    double v13 = objc_msgSend__smallBubblePulseAnimationWithSpeed_delay_(self, v11, v12, 1.0, 0.25);
    objc_msgSend_addAnimation_forKey_(smallBubble, v14, (uint64_t)v13, @"kCKAnimationKeyPulse");

    mediumBubble = self->_mediumBubble;
    uint64_t v18 = objc_msgSend__mediumBubblePulseAnimationWithSpeed_delay_(self, v16, v17, 1.0, 0.314999998);
    objc_msgSend_addAnimation_forKey_(mediumBubble, v19, (uint64_t)v18, @"kCKAnimationKeyPulse");

    largeBubble = self->_largeBubble;
    uint64_t v23 = objc_msgSend__largeBubblePulseAnimationWithSpeed_delay_(self, v21, v22, 1.0, 0.370000005);
    objc_msgSend_addAnimation_forKey_(largeBubble, v24, (uint64_t)v23, @"kCKAnimationKeyPulse");

    thinkingDotContainer = self->_thinkingDotContainer;
    float v28 = objc_msgSend__largeBubblePulseAnimationWithSpeed_delay_(self, v26, v27, 1.0, 0.370000005);
    objc_msgSend_addAnimation_forKey_(thinkingDotContainer, v29, (uint64_t)v28, @"kCKAnimationKeyPulse");

    objc_msgSend__buildThinkingDots(self, v30, v31);
    uint64_t v34 = (void *)MEMORY[0x263F158F8];
    objc_msgSend_commit(v34, v32, v33);
  }
}

- (void)stopPulseAnimation
{
  objc_msgSend_thinkingDotOpacity(self, a2, v2);
  *(float *)&double v4 = v4;
  objc_msgSend_setOpacity_(self->_thinkingDot, v5, v6, v4);
  objc_msgSend_removeAllAnimations(self->_thinkingDot, v7, v8);
  objc_msgSend_removeAnimationForKey_(self->_smallBubble, v9, @"kCKAnimationKeyPulse");
  objc_msgSend_removeAnimationForKey_(self->_mediumBubble, v10, @"kCKAnimationKeyPulse");
  objc_msgSend_removeAnimationForKey_(self->_largeBubble, v11, @"kCKAnimationKeyPulse");
  thinkingDotContainer = self->_thinkingDotContainer;
  objc_msgSend_removeAnimationForKey_(thinkingDotContainer, v12, @"kCKAnimationKeyPulse");
}

- (void)startShrinkAnimationWithCompletionBlock:(id)a3
{
  v142[3] = *MEMORY[0x263EF8340];
  id v137 = a3;
  objc_msgSend_stopPulseAnimation(self, v4, v5);
  objc_msgSend_begin(MEMORY[0x263F158F8], v6, v7);
  uint64_t v9 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F15760], v8, @"transform.scale.xy");
  LODWORD(v10) = 1.0;
  double v13 = objc_msgSend_numberWithFloat_(NSNumber, v11, v12, v10);
  objc_msgSend_setFromValue_(v9, v14, (uint64_t)v13);

  uint64_t v17 = objc_msgSend_numberWithFloat_(NSNumber, v15, v16, 0.0);
  objc_msgSend_setToValue_(v9, v18, (uint64_t)v17);

  objc_msgSend_convertedCurrentMediaTime(self, v19, v20);
  objc_msgSend_setBeginTime_(v9, v21, v22);
  objc_msgSend_setDuration_(v9, v23, v24, 0.25);
  LODWORD(v25) = 1.0;
  objc_msgSend_setSpeed_(v9, v26, v27, v25);
  LODWORD(v28) = 0.25;
  LODWORD(v29) = 0.25;
  LODWORD(v30) = 1.0;
  LODWORD(v31) = 1036831949;
  uint64_t v34 = objc_msgSend_functionWithControlPoints__::(MEMORY[0x263F15808], v32, v33, v28, v31, v29, v30);
  objc_msgSend_setTimingFunction_(v9, v35, (uint64_t)v34);

  uint64_t v138 = *MEMORY[0x263F15AB0];
  objc_msgSend_setFillMode_(v9, v36, *MEMORY[0x263F15AB0]);
  objc_msgSend_setRemovedOnCompletion_(v9, v37, 1);
  objc_msgSend_addAnimation_forKey_(self->_smallBubble, v38, (uint64_t)v9, 0);
  objc_msgSend_addAnimation_forKey_(self->_mediumBubble, v39, (uint64_t)v9, 0);
  objc_msgSend_addAnimation_forKey_(self->_largeBubble, v40, (uint64_t)v9, 0);
  objc_msgSend_addAnimation_forKey_(self->_thinkingDotContainer, v41, (uint64_t)v9, 0);
  uint64_t v43 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F157D8], v42, @"position.x");
  uint64_t v44 = objc_opt_class();
  objc_msgSend_largeBubbleFrame(v44, v45, v46);
  double v48 = v47;
  double v50 = v49;
  float v51 = v47;
  *(float *)&double v47 = v51;
  double v54 = objc_msgSend_numberWithFloat_(NSNumber, v52, v53, v47);
  v142[0] = v54;
  double v55 = v48 + 5.0;
  *(float *)&double v55 = v48 + 5.0;
  uint64_t v58 = objc_msgSend_numberWithFloat_(NSNumber, v56, v57, v55);
  v142[1] = v58;
  *(float *)&double v59 = v51;
  id v62 = objc_msgSend_numberWithFloat_(NSNumber, v60, v61, v59);
  v142[2] = v62;
  uint64_t v64 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v63, (uint64_t)v142, 3);
  objc_msgSend_setValues_(v43, v65, (uint64_t)v64);

  uint64_t v66 = *MEMORY[0x263F15960];
  objc_msgSend_setCalculationMode_(v43, v67, *MEMORY[0x263F15960]);
  objc_msgSend_convertedCurrentMediaTime(self, v68, v69);
  objc_msgSend_setBeginTime_(v43, v70, v71);
  objc_msgSend_setDuration_(v43, v72, v73, 0.25);
  LODWORD(v74) = 0.25;
  LODWORD(v75) = 0.25;
  LODWORD(v76) = 1.0;
  LODWORD(v77) = 1036831949;
  long long v80 = objc_msgSend_functionWithControlPoints__::(MEMORY[0x263F15808], v78, v79, v74, v77, v75, v76);
  objc_msgSend_setTimingFunction_(v43, v81, (uint64_t)v80);

  LODWORD(v82) = 1.0;
  objc_msgSend_setSpeed_(v43, v83, v84, v82);
  objc_msgSend_setFillMode_(v43, v85, v138);
  objc_msgSend_setRemovedOnCompletion_(v43, v86, 1);
  objc_msgSend_addAnimation_forKey_(self->_smallBubble, v87, (uint64_t)v43, 0);
  objc_msgSend_addAnimation_forKey_(self->_mediumBubble, v88, (uint64_t)v43, 0);
  objc_msgSend_addAnimation_forKey_(self->_largeBubble, v89, (uint64_t)v43, 0);
  objc_msgSend_addAnimation_forKey_(self->_thinkingDotContainer, v90, (uint64_t)v43, 0);
  uint64_t v92 = objc_msgSend_animationWithKeyPath_(MEMORY[0x263F157D8], v91, @"position.y");
  float v93 = v50;
  *(float *)&double v94 = v93;
  double v97 = objc_msgSend_numberWithFloat_(NSNumber, v95, v96, v94);
  v141[0] = v97;
  double v98 = v50 + -6.0;
  *(float *)&double v98 = v50 + -6.0;
  double v101 = objc_msgSend_numberWithFloat_(NSNumber, v99, v100, v98);
  v141[1] = v101;
  *(float *)&double v102 = v50;
  uint64_t v105 = objc_msgSend_numberWithFloat_(NSNumber, v103, v104, v102);
  v141[2] = v105;
  uint64_t v107 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v106, (uint64_t)v141, 3);
  objc_msgSend_setValues_(v92, v108, (uint64_t)v107);

  objc_msgSend_setCalculationMode_(v92, v109, v66);
  objc_msgSend_convertedCurrentMediaTime(self, v110, v111);
  objc_msgSend_setBeginTime_(v92, v112, v113);
  objc_msgSend_setDuration_(v92, v114, v115, 0.25);
  LODWORD(v116) = 1045836616;
  LODWORD(v117) = 1048849804;
  LODWORD(v118) = 1057991709;
  LODWORD(v119) = 1064582806;
  uint64_t v122 = objc_msgSend_functionWithControlPoints__::(MEMORY[0x263F15808], v120, v121, v116, v117, v118, v119);
  objc_msgSend_setTimingFunction_(v92, v123, (uint64_t)v122);

  LODWORD(v124) = 1.0;
  objc_msgSend_setSpeed_(v92, v125, v126, v124);
  objc_msgSend_setFillMode_(v92, v127, v138);
  objc_msgSend_setRemovedOnCompletion_(v92, v128, 1);
  objc_msgSend_addAnimation_forKey_(self->_smallBubble, v129, (uint64_t)v92, 0);
  objc_msgSend_addAnimation_forKey_(self->_mediumBubble, v130, (uint64_t)v92, 0);
  objc_msgSend_addAnimation_forKey_(self->_largeBubble, v131, (uint64_t)v92, 0);
  objc_msgSend_addAnimation_forKey_(self->_thinkingDotContainer, v132, (uint64_t)v92, 0);
  if (v137)
  {
    v135 = (void *)MEMORY[0x263F158F8];
    v139[0] = MEMORY[0x263EF8330];
    v139[1] = 3221225472;
    v139[2] = sub_2180F1558;
    v139[3] = &unk_264300710;
    id v140 = v137;
    objc_msgSend_setCompletionBlock_(v135, v136, (uint64_t)v139);
  }
  objc_msgSend_commit(MEMORY[0x263F158F8], v133, v134);
}

- (void)stopAnimation
{
  objc_msgSend_stopPulseAnimation(self, a2, v2);
  objc_msgSend_removeAllAnimations(self->_smallBubble, v4, v5);
  objc_msgSend_removeAllAnimations(self->_mediumBubble, v6, v7);
  objc_msgSend_removeAllAnimations(self->_largeBubble, v8, v9);
  thinkingDotContainer = self->_thinkingDotContainer;
  objc_msgSend_removeAllAnimations(thinkingDotContainer, v10, v11);
}

- (BOOL)hasDarkBackground
{
  return self->_hasDarkBackground;
}

- (void)setHasDarkBackground:(BOOL)a3
{
  self->_hasDarkBackground = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (id)iconImage
{
  return self->_iconImage;
}

- (UIColor)bubbleColor
{
  return self->_bubbleColor;
}

- (UIColor)thinkingDotColor
{
  return self->_thinkingDotColor;
}

- (void)setThinkingDotColor:(id)a3
{
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (double)bubbleOpacity
{
  return self->_bubbleOpacity;
}

- (double)thinkingDotOpacity
{
  return self->_thinkingDotOpacity;
}

- (void)setThinkingDotOpacity:(double)a3
{
  self->_thinkingDotOpacitdouble y = a3;
}

- (UIColor)customBubbleColor
{
  return self->_customBubbleColor;
}

- (void)setCustomBubbleColor:(id)a3
{
}

- (CALayer)bubbleContainer
{
  return self->_bubbleContainer;
}

- (void)setBubbleContainer:(id)a3
{
}

- (CALayer)smallBubble
{
  return self->_smallBubble;
}

- (void)setSmallBubble:(id)a3
{
}

- (CALayer)mediumBubble
{
  return self->_mediumBubble;
}

- (void)setMediumBubble:(id)a3
{
}

- (CALayer)largeBubble
{
  return self->_largeBubble;
}

- (void)setLargeBubble:(id)a3
{
}

- (CALayer)thinkingDotContainer
{
  return self->_thinkingDotContainer;
}

- (void)setThinkingDotContainer:(id)a3
{
}

- (CALayer)thinkingDot
{
  return self->_thinkingDot;
}

- (void)setThinkingDot:(id)a3
{
}

- (CAReplicatorLayer)thinkingDots
{
  return self->_thinkingDots;
}

- (void)setThinkingDots:(id)a3
{
}

- (CALayer)iconImageLayer
{
  return self->_iconImageLayer;
}

- (void)setIconImageLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageLayer, 0);
  objc_storeStrong((id *)&self->_thinkingDots, 0);
  objc_storeStrong((id *)&self->_thinkingDot, 0);
  objc_storeStrong((id *)&self->_thinkingDotContainer, 0);
  objc_storeStrong((id *)&self->_largeBubble, 0);
  objc_storeStrong((id *)&self->_mediumBubble, 0);
  objc_storeStrong((id *)&self->_smallBubble, 0);
  objc_storeStrong((id *)&self->_bubbleContainer, 0);
  objc_storeStrong((id *)&self->_customBubbleColor, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_thinkingDotColor, 0);
  objc_storeStrong((id *)&self->_bubbleColor, 0);
  objc_storeStrong(&self->_iconImage, 0);
}

+ (CGSize)defaultSize
{
  double v2 = 78.5;
  double v3 = 35.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIColor)defaultBubbleColor
{
  return (UIColor *)MEMORY[0x270F9A6D0](MEMORY[0x263F1C550], sel_colorWithDynamicProvider_, &unk_26C918F38);
}

- (UIColor)defaultThinkingDotColor
{
  return (UIColor *)((uint64_t (*)(void, char *))MEMORY[0x270F9A6D0])(MEMORY[0x263F1C550], sel_labelColor);
}

- (double)defaultThinkingDotOpacity
{
  return 0.449999988;
}

- (double)defaultBubbleOpacity
{
  return 1.0;
}

+ (BOOL)supportsTypingIndicatorAnimation
{
  return 1;
}

+ (CGRect)smallBubbleFrame
{
  double v2 = 35.0;
  double v3 = 2.0;
  double v4 = 5.5;
  double v5 = 5.5;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v2;
  result.origin.double x = v3;
  return result;
}

+ (CGPoint)smallBubbleGrowOffset
{
  double v2 = 5.5;
  double v3 = -2.5;
  result.double y = v3;
  result.double x = v2;
  return result;
}

+ (CGRect)mediumBubbleFrame
{
  objc_msgSend_smallBubbleFrame(a1, a2, v2);
  double v4 = v3 + 7.0;
  double v6 = v5 + -7.5;
  double v7 = 11.5;
  double v8 = 11.5;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.double y = v6;
  result.origin.double x = v4;
  return result;
}

+ (CGPoint)mediumBubbleGrowOffset
{
  double v2 = 5.0;
  double v3 = 3.5;
  result.double y = v3;
  result.double x = v2;
  return result;
}

+ (CGRect)largeBubbleFrame
{
  objc_msgSend_smallBubbleFrame(a1, a2, v2);
  double v4 = v3 + 16.0;
  double v6 = v5 + -25.5;
  double v7 = 57.5;
  double v8 = 35.0;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.double y = v6;
  result.origin.double x = v4;
  return result;
}

+ (CGPoint)largeBubbleGrowOffset
{
  double v2 = 5.0;
  double v3 = -6.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

+ (CGRect)iconImageFrame
{
  double v2 = 11.0;
  double v3 = 7.5;
  double v4 = 27.0;
  double v5 = 20.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

+ (double)iconImageTrailingSpace
{
  return 8.0;
}

+ (CGPoint)thinkingDotsOffset
{
  double v2 = 12.0;
  double v3 = 13.5;
  result.double y = v3;
  result.double x = v2;
  return result;
}

+ (double)thinkingDotDiameter
{
  return 8.5;
}

+ (double)thinkingDotSpace
{
  return 12.5;
}

@end
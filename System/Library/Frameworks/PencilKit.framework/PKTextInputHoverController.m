@interface PKTextInputHoverController
- (id)_cursorController;
- (id)_ibeamLayerCreateIfNecessary;
- (id)initWithDelegate:(id *)a1;
- (id)view;
- (uint64_t)performLineBreakAfterTapIfPossibleForElement:(double)a3 location:(CGFloat)a4;
- (void)didReceiveNormalTouch:(uint64_t *)a1;
- (void)hideIBeamLayer;
- (void)hoverController:(id)a3 didBegin:(id *)a4;
- (void)hoverController:(id)a3 didUpdate:(id *)a4;
- (void)hoverController:(id)a3 holdGestureMeanInputPoint:(id *)a4 latestInputPoint:(id *)a5;
- (void)hoverControllerDidEnd:(id)a3;
- (void)hoverControllerDidLift:(id)a3;
- (void)hoverControllerHoldGestureEnded:(id)a3;
- (void)set_hidePlaceholderElement:(uint64_t)a1;
- (void)unhidePlaceholderElementIfNecessary;
@end

@implementation PKTextInputHoverController

- (id)initWithDelegate:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)PKTextInputHoverController;
    v4 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak(v4 + 2, v3);
      v5 = [v3 hoverControllerContainerView:a1];
      v6 = -[PKHoverController initWithDelegate:view:]((int64x2_t *)[PKHoverController alloc], a1, v5);
      id v7 = a1[3];
      a1[3] = v6;

      v8 = +[PKHoverSettings sharedSettings];
      char v9 = [v8 showDebugLayer];
      v10 = a1[3];
      if (v10) {
        v10[424] = v9;
      }

      long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      *((_OWORD *)a1 + 10) = *MEMORY[0x1E4F1DB28];
      *((_OWORD *)a1 + 11) = v11;
    }
  }

  return a1;
}

- (void)didReceiveNormalTouch:(uint64_t *)a1
{
  if (a1)
  {
    id v3 = (void *)MEMORY[0x1E4FBA8A8];
    id v4 = a2;
    [v3 cancelPreviousPerformRequestsWithTarget:a1 selector:sel_unhidePlaceholderElementIfNecessary object:0];
    [a1 performSelector:sel_unhidePlaceholderElementIfNecessary withObject:0 afterDelay:1.0];
    -[PKHoverController didReceiveNormalTouch:](a1[3], v4);
  }
}

- (id)view
{
  id v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 2);
    id v1 = [WeakRetained hoverControllerContainerView:v1];
  }

  return v1;
}

- (id)_cursorController
{
  id v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 2);
    id v1 = [WeakRetained hoverControllerCursorController:v1];
  }

  return v1;
}

- (void)hoverController:(id)a3 didBegin:(id *)a4
{
  v6 = a3;
  id v7 = +[PKHoverSettings sharedSettings];
  char v8 = [v7 showDebugLayer];
  if (!v6)
  {

    goto LABEL_11;
  }
  v6[424] = v8;

  if (v6[424])
  {
    if (self)
    {
      hoverDebugLayer = self->__hoverDebugLayer;
      if (hoverDebugLayer)
      {
LABEL_10:
        long long v17 = *(_OWORD *)&a4->var9;
        v21[4] = *(_OWORD *)&a4->var7;
        v21[5] = v17;
        long long v18 = *(_OWORD *)&a4->var13;
        v21[6] = *(_OWORD *)&a4->var11;
        v21[7] = v18;
        long long v19 = *(_OWORD *)&a4->var1;
        v21[0] = a4->var0;
        v21[1] = v19;
        long long v20 = *(_OWORD *)&a4->var5;
        v21[2] = *(_OWORD *)&a4->var3;
        v21[3] = v20;
        -[PKHoverController updateShapeLayer:inputPoint:](v6, hoverDebugLayer, (double *)v21);
        goto LABEL_11;
      }
      id v10 = objc_alloc_init(MEMORY[0x1E4F39C88]);
      objc_storeStrong((id *)&self->__hoverDebugLayer, v10);
    }
    else
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F39C88]);
    }

    id v11 = [MEMORY[0x1E4FB1618] clearColor];
    uint64_t v12 = [v11 CGColor];
    if (self)
    {
      [(CAShapeLayer *)self->__hoverDebugLayer setFillColor:v12];

      objc_super v13 = self->__hoverDebugLayer;
    }
    else
    {
      [0 setFillColor:v12];

      objc_super v13 = 0;
    }
    [(CAShapeLayer *)v13 setAllowsHitTesting:0];
    v14 = -[PKTextInputHoverController view]((id *)&self->super.isa);
    v15 = [v14 layer];
    v16 = v15;
    if (self)
    {
      [v15 addSublayer:self->__hoverDebugLayer];

      hoverDebugLayer = self->__hoverDebugLayer;
    }
    else
    {
      [v15 addSublayer:0];

      hoverDebugLayer = 0;
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (void)hoverController:(id)a3 didUpdate:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (!self) {
    goto LABEL_56;
  }
  hoverDebugLayer = self->__hoverDebugLayer;
  if (hoverDebugLayer)
  {
    long long v9 = *(_OWORD *)&a4->var9;
    long long v244 = *(_OWORD *)&a4->var7;
    long long v245 = v9;
    long long v10 = *(_OWORD *)&a4->var13;
    long long v246 = *(_OWORD *)&a4->var11;
    long long v247 = v10;
    long long v11 = *(_OWORD *)&a4->var1;
    $047367E7237D93BB26E796C35D3A0ACE var0 = a4->var0;
    long long v241 = v11;
    long long v12 = *(_OWORD *)&a4->var5;
    long long v242 = *(_OWORD *)&a4->var3;
    long long v243 = v12;
    -[PKHoverController updateShapeLayer:inputPoint:](v6, hoverDebugLayer, &var0.var0.x);
  }
  hoverFlashElements = self->__hoverFlashElements;
  if (hoverFlashElements)
  {
    CGFloat x = a4->var0.var0.x;
    CGFloat y = a4->var0.var0.y;
    v16 = hoverFlashElements;
    if (![(NSArray *)v16 count])
    {
LABEL_23:

      goto LABEL_24;
    }
    long long v17 = self->__hoverFlashElements;
    uint64_t v18 = [(NSArray *)v17 count];
    long long v19 = [(UIView *)self->__hoverFlashElementsView subviews];
    uint64_t v20 = [v19 count];

    if (v18 == v20)
    {
      if ([(NSArray *)self->__hoverFlashElements count])
      {
        CGFloat v226 = y;
        CGFloat v229 = x;
        v16 = 0;
        v21 = 0;
        unint64_t v22 = 0;
        double rect = 1.79769313e308;
        double v224 = 1.79769313e308;
        do
        {
          v23 = [(NSArray *)self->__hoverFlashElements objectAtIndexedSubscript:v22];
          v24 = self->__hoverFlashElementsView;
          v25 = [(UIView *)v24 subviews];
          v26 = [v25 objectAtIndexedSubscript:v22];

          double v27 = -[PKTextInputElement frame]((uint64_t)v23);
          double v29 = v28;
          double v31 = v30;
          double v33 = v32;
          v34 = -[PKTextInputElement coordinateSpace]((uint64_t)v23);
          v35 = -[PKTextInputHoverController view]((id *)&self->super.isa);
          double v36 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v34, v35, v27, v29, v31, v33);
          CGFloat v38 = v37;
          CGFloat v40 = v39;
          CGFloat v42 = v41;

          v254.origin.CGFloat x = v36;
          v254.origin.CGFloat y = v38;
          v254.size.CGFloat width = v40;
          v254.size.height = v42;
          CGRect v255 = CGRectInset(v254, -4.0, -4.0);
          objc_msgSend(v26, "setFrame:", v255.origin.x, v255.origin.y, v255.size.width, v255.size.height);
          double v43 = -[PKTextInputElement frame]((uint64_t)v23);
          double v47 = -[PKTextInputElement hitToleranceFrameFromElementFrame:](v23, v43, v44, v45, v46);
          double v49 = v48;
          double v51 = v50;
          double v53 = v52;
          v54 = -[PKTextInputElement coordinateSpace]((uint64_t)v23);
          v55 = -[PKTextInputHoverController view]((id *)&self->super.isa);
          double v56 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v54, v55, v47, v49, v51, v53);
          CGFloat v58 = v57;
          CGFloat v233 = v60;
          CGFloat v235 = v59;

          distanceToRect(v229, v226, v36, v38, v40, v42);
          double v62 = v61;
          if (v61 < rect)
          {
            distanceToRect(v229, v226, v56, v58, v235, v233);
            double v224 = v63;
            v64 = v26;

            v65 = v23;
            v21 = v65;
            v16 = v64;
            double rect = v62;
          }

          ++v22;
        }
        while (v22 < [(NSArray *)self->__hoverFlashElements count]);
        if (v224 <= 0.0) {
          goto LABEL_16;
        }
      }
      else
      {
        v16 = 0;
        v21 = 0;
      }

      v21 = 0;
      v16 = 0;
LABEL_16:
      p_currentHoverFlashElementView = &self->__currentHoverFlashElementView;
      currentHoverFlashElementView = self->__currentHoverFlashElementView;
      if (v16 != (NSArray *)currentHoverFlashElementView)
      {
        v68 = currentHoverFlashElementView;
        v69 = [(UIView *)v68 subviews];
        [v69 makeObjectsPerformSelector:sel_removeFromSuperview];

        id v70 = [MEMORY[0x1E4FB1618] clearColor];
        uint64_t v71 = [v70 CGColor];
        v72 = [(UIView *)*p_currentHoverFlashElementView layer];
        [v72 setBorderColor:v71];

        v73 = [MEMORY[0x1E4FB1618] clearColor];
        [(UIView *)*p_currentHoverFlashElementView setBackgroundColor:v73];

        objc_storeStrong((id *)&self->__currentHoverFlashElementView, v16);
        if (v16)
        {
          v74 = -[PKTextInputElement referenceView]((id *)v21);
          v75 = [v74 tintColor];
          v76 = v75;
          if (v75)
          {
            id v77 = v75;
          }
          else
          {
            id v77 = [MEMORY[0x1E4FB1618] systemBlueColor];
          }
          v78 = v77;

          v79 = [v78 colorWithAlphaComponent:0.2];

          id v80 = [MEMORY[0x1E4FB1618] labelColor];
          uint64_t v81 = [v80 CGColor];
          v82 = [(NSArray *)v16 layer];
          [v82 setBorderColor:v81];

          v83 = -[PKTextInputHoverController view]((id *)&self->super.isa);
          v84 = [v83 _screen];
          [v84 scale];
          double v86 = 1.0 / v85;
          v87 = [(NSArray *)v16 layer];
          [v87 setBorderWidth:v86];

          v88 = (void *)MEMORY[0x1E4FB1EB0];
          *(void *)&var0.var0.CGFloat x = MEMORY[0x1E4F143A8];
          *(void *)&var0.var0.CGFloat y = 3221225472;
          *(void *)&long long v241 = __69__PKTextInputHoverController__updateFlashElementsForHoverInputPoint___block_invoke;
          *((void *)&v241 + 1) = &unk_1E64C5F60;
          v89 = v16;
          *(void *)&long long v242 = v89;
          *((void *)&v242 + 1) = v79;
          id v90 = v79;
          [v88 animateWithDuration:&var0 animations:0.2];
          dispatch_time_t v91 = dispatch_time(0, 500000000);
          uint64_t block = MEMORY[0x1E4F143A8];
          uint64_t v249 = 3221225472;
          v250 = __69__PKTextInputHoverController__updateFlashElementsForHoverInputPoint___block_invoke_2;
          v251 = &unk_1E64C61C0;
          v252 = v89;
          dispatch_after(v91, MEMORY[0x1E4F14428], &block);
        }
      }

      goto LABEL_23;
    }
  }
LABEL_24:
  if (self->__lineBreakTimestamp > 0.0)
  {
    self->__lineBreakPosition = (CGPoint)a4->var0;
    if (!self->__lineBreakWaitingForElement)
    {
      double v92 = CACurrentMediaTime();
      if (self->__lineBreakTimestamp + 0.1 <= v92)
      {
        self->__lineBreakWaitingForElement = 1;
        v93 = -[PKTextInputHoverController view]((id *)&self->super.isa);
        v94 = [v93 window];
        v95 = [v94 windowScene];
        uint64_t v96 = [v95 _visibleWindows];
        v97 = (void *)v96;
        v98 = (void *)MEMORY[0x1E4F1CBF0];
        if (v96) {
          v98 = (void *)v96;
        }
        id v99 = v98;

        id v100 = -[PKTextInputElementsFinder initWithWindowsToSearch:]([PKTextInputSingleElementFinder alloc], v99);
        objc_initWeak(location, self);
        uint64_t block = MEMORY[0x1E4F143A8];
        uint64_t v249 = 3221225472;
        v250 = __63__PKTextInputHoverController__checklineBreakGestureIfNecessary__block_invoke;
        v251 = &unk_1E64C5998;
        objc_copyWeak((id *)&v252, location);
        v101 = _Block_copy(&block);
        double v102 = self->__lineBreakPosition.x;
        double v103 = self->__lineBreakPosition.y;
        v104 = -[PKTextInputHoverController view]((id *)&self->super.isa);
        *(void *)&var0.var0.CGFloat x = MEMORY[0x1E4F143A8];
        *(void *)&var0.var0.CGFloat y = 3221225472;
        *(void *)&long long v241 = __63__PKTextInputHoverController__checklineBreakGestureIfNecessary__block_invoke_2;
        *((void *)&v241 + 1) = &unk_1E64C9B00;
        id v105 = v100;
        *((double *)&v243 + 1) = v102;
        *(double *)&long long v244 = v103;
        *(void *)&long long v242 = v105;
        *((void *)&v242 + 1) = self;
        *((double *)&v244 + 1) = v92;
        id v106 = v101;
        *(void *)&long long v243 = v106;
        objc_msgSend(v105, "findSingleElementAtPosition:coordinateSpace:completion:", v104, &var0, v102, v103);

        objc_destroyWeak((id *)&v252);
        objc_destroyWeak(location);
      }
    }
  }
  if (self->__ibeamElement)
  {
    double v107 = a4->var0.var0.x;
    double v108 = a4->var0.var0.y;
    v109 = -[PKTextInputHoverController view]((id *)&self->super.isa);
    v110 = -[PKTextInputElement coordinateSpace]((uint64_t)self->__ibeamElement);
    double v111 = *MEMORY[0x1E4F1DB30];
    double v112 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v113 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v109, v110, v107, v108, *MEMORY[0x1E4F1DB30], v112);
    double v115 = v114;

    double v116 = -[PKTextInputElement frame]((uint64_t)self->__ibeamElement);
    double v120 = v116;
    double v121 = v117;
    if (v113 >= v116)
    {
      double v122 = v116 + v118;
      BOOL v123 = v113 <= v120 + v118;
      double v120 = v113;
      if (!v123) {
        double v120 = v122;
      }
    }
    if (v115 >= v117)
    {
      double v121 = v115;
      if (v115 > v117 + v119) {
        double v121 = v117 + v119;
      }
    }
    v124 = -[PKTextInputElement coordinateSpace]((uint64_t)self->__ibeamElement);
    v125 = -[PKTextInputHoverController view]((id *)&self->super.isa);
    double v126 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v124, v125, v120, v121, v111, v112);
    double v128 = v127;

    v129 = self->__ibeamElementContent;
    v130 = -[PKTextInputHoverController view]((id *)&self->super.isa);
    v131 = v130;
    if (v129)
    {
      uint64_t v132 = [(PKTextInputElementContent *)(id *)&v129->super.isa characterIndexClosestToPoint:1 inCoordinateSpace:1 forInsertingText:v126 adjustForLastCharacter:v128];

      if (v132 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_49:
        -[PKTextInputHoverController hideIBeamLayer]((uint64_t)self);
        goto LABEL_56;
      }
    }
    else
    {

      uint64_t v132 = 0;
    }
    if (-[PKTextInputElementContent contentLength]((uint64_t)self->__ibeamElementContent))
    {
      v133 = self->__ibeamElementContent;
      v134 = -[PKTextInputHoverController view]((id *)&self->super.isa);
      [(PKTextInputElementContent *)(id *)&v133->super.isa firstRectForRange:1uLL inCoordinateSpace:v134];
      CGFloat v136 = v135;
      CGFloat v138 = v137;
      CGFloat v140 = v139;
      CGFloat v142 = v141;

      DKDDistanceToRect(v126, v128, v136, v138, v140, v142);
      double v234 = v128;
      double v236 = v126;
      if (v132 < 1)
      {
        CGFloat v157 = v142;
        double v156 = v143;
      }
      else
      {
        double v144 = v143;
        v145 = self->__ibeamElementContent;
        v146 = -[PKTextInputHoverController view]((id *)&self->super.isa);
        [(PKTextInputElementContent *)(id *)&v145->super.isa firstRectForRange:1uLL inCoordinateSpace:v146];
        double v147 = v140;
        CGFloat v149 = v148;
        CGFloat v227 = v150;
        double v230 = v136;
        double recta = v138;
        CGFloat v152 = v151;
        CGFloat v154 = v153;

        DKDDistanceToRect(v126, v128, v149, v227, v152, v154);
        if (v155 < v144) {
          double v156 = v155;
        }
        else {
          double v156 = v144;
        }
        if (v155 < v144)
        {
          CGFloat v142 = v154;
          double v147 = v152;
        }
        CGFloat v136 = v230;
        CGFloat v138 = recta;
        if (v155 < v144)
        {
          CGFloat v138 = v227;
          CGFloat v136 = v149;
          --v132;
        }
        CGFloat v140 = v147;
        CGFloat v157 = v142;
      }
      v158 = self->__ibeamElementContent;
      v159 = -[PKTextInputHoverController view]((id *)&self->super.isa);
      double v160 = -[PKTextInputElementContent caretRectForCharacterIndex:inCoordinateSpace:]((uint64_t)v158, v132, v159);
      CGFloat v162 = v161;
      CGFloat v164 = v163;
      double rectb = v165;

      if (v156 > 20.0) {
        goto LABEL_54;
      }
      v256.origin.CGFloat x = v160;
      v256.origin.CGFloat y = v162;
      v256.size.CGFloat width = v164;
      v256.size.height = rectb;
      if (CGRectIsNull(v256)
        || (v166 = self->__ibeamElementContent,
            -[PKTextInputHoverController view]((id *)&self->super.isa),
            v167 = objc_claimAutoreleasedReturnValue(),
            BOOL v168 = [(PKTextInputElementContent *)(uint64_t)v166 hasLinkAtCharacterIndex:v167 location:v236 coordinateSpace:v234], v166, v167, v168))
      {
LABEL_54:
        CGSize v169 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
        self->__ibeamFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
        self->__ibeamFrame.size = v169;
        id v170 = [MEMORY[0x1E4FB1618] clearColor];
        -[CALayer setBackgroundColor:](self->__ibeamLayer, "setBackgroundColor:", [v170 CGColor]);
LABEL_55:

        goto LABEL_56;
      }
      -[PKTextInputHoverController _ibeamLayerCreateIfNecessary]((id *)&self->super.isa);
      id v170 = (id)objc_claimAutoreleasedReturnValue();
      v171 = [MEMORY[0x1E4FB1618] grayColor];
      BOOL v172 = v132 == 0;
      uint64_t v173 = -[PKTextInputElementContent contentLength]((uint64_t)self->__ibeamElementContent) - 1;
      BOOL v174 = v132 >= v173;
      uint64_t v175 = v132 - 1;
      CGFloat v225 = v140;
      double v228 = v157;
      if (v132 < 1)
      {
        double v177 = v162;
        double v183 = v234;
        double v182 = v236;
LABEL_82:
        v259.origin.CGFloat x = v136;
        v259.origin.CGFloat y = v138;
        v259.size.CGFloat width = v225;
        v259.size.height = v228;
        CGRect v260 = CGRectInset(v259, -1.0, 0.0);
        double v209 = v260.origin.x;
        CGFloat width = v260.size.width;
        v260.origin.CGFloat y = v177;
        v260.size.height = rectb;
        if (v183 <= CGRectGetMaxY(v260)
          || v182 >= v209
          && (v261.origin.CGFloat x = v209,
              v261.origin.CGFloat y = v177,
              v261.size.CGFloat width = width,
              v261.size.height = rectb,
              v182 <= CGRectGetMaxX(v261)))
        {
          if (v209 >= v182) {
            double v213 = v209;
          }
          else {
            double v213 = v182;
          }
          if (v172) {
            double v182 = v213;
          }
          if (v174)
          {
            v262.origin.CGFloat x = v209;
            v262.origin.CGFloat y = v177;
            v262.size.CGFloat width = width;
            v262.size.height = rectb;
            double MaxX = CGRectGetMaxX(v262);
            if (MaxX < v182) {
              double v182 = MaxX;
            }
          }
          v263.origin.CGFloat x = self->__ibeamFrame.origin.x;
          double v215 = self->__ibeamFrame.origin.y;
          v263.size.CGFloat width = self->__ibeamFrame.size.width;
          v263.size.height = self->__ibeamFrame.size.height;
          v263.origin.CGFloat y = v215;
          IsEmptCGFloat y = CGRectIsEmpty(v263);
          BOOL v217 = IsEmpty;
          if (IsEmpty) {
            double v218 = v177;
          }
          else {
            double v218 = (v177 + v215 * 3.0) * 0.25;
          }
          [MEMORY[0x1E4F39CF8] begin];
          [MEMORY[0x1E4F39CF8] setDisableActions:1];
          objc_msgSend(v170, "setFrame:", v182, v218, 2.0, rectb);
          if (v217)
          {
            [MEMORY[0x1E4F39CF8] commit];
            v219 = (CGColor *)[v170 backgroundColor];
            id v220 = v171;
            if (!CGColorEqualToColor(v219, (CGColorRef)[v220 CGColor])) {
              objc_msgSend(v170, "setBackgroundColor:", objc_msgSend(v220, "CGColor"));
            }
          }
          else
          {
            v221 = (CGColor *)[v170 backgroundColor];
            id v222 = v171;
            if (!CGColorEqualToColor(v221, (CGColorRef)[v222 CGColor])) {
              objc_msgSend(v170, "setBackgroundColor:", objc_msgSend(v222, "CGColor"));
            }
            [MEMORY[0x1E4F39CF8] commit];
          }
          self->__ibeamFrame.origin.CGFloat x = v182;
          self->__ibeamFrame.origin.CGFloat y = v218;
          self->__ibeamFrame.size.CGFloat width = 2.0;
          self->__ibeamFrame.size.height = rectb;
          self->__ibeamLastTimestamp = CACurrentMediaTime();
        }
        else
        {
          CGSize v211 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
          self->__ibeamFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
          self->__ibeamFrame.size = v211;
          id v212 = [MEMORY[0x1E4FB1618] clearColor];
          -[CALayer setBackgroundColor:](self->__ibeamLayer, "setBackgroundColor:", [v212 CGColor]);
        }
        goto LABEL_55;
      }
      BOOL v176 = v132 >= v173;
      v223 = v171;
      double v177 = v162;
      if (v132 >= -[PKTextInputElementContent contentLength]((uint64_t)self->__ibeamElementContent) - 1)
      {
        double v183 = v234;
        double v182 = v236;
LABEL_74:
        BOOL v172 = 1;
        v195 = [(PKTextInputElementContent *)(uint64_t)self->__ibeamElementContent stringInRange:1];
        uint64_t v196 = [v195 characterAtIndex:0];
        v197 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
        LOBYTE(v196) = [v197 characterIsMember:v196];

        if ((v196 & 1) == 0)
        {
          double v232 = v136;
          v198 = self->__ibeamElementContent;
          v199 = -[PKTextInputHoverController view]((id *)&self->super.isa);
          [(PKTextInputElementContent *)(id *)&v198->super.isa firstRectForRange:1uLL inCoordinateSpace:v199];
          CGFloat v201 = v200;
          double v203 = v202;
          CGFloat v205 = v204;
          CGFloat v207 = v206;

          v258.origin.CGFloat x = v201;
          v258.origin.CGFloat y = v203;
          v258.size.CGFloat width = v205;
          v258.size.height = v207;
          if (CGRectIsNull(v258))
          {
            BOOL v172 = 0;
          }
          else
          {
            double v208 = v203 - v138;
            if (v203 - v138 < 0.0) {
              double v208 = -(v203 - v138);
            }
            BOOL v172 = v208 > v228 * 0.5;
          }
          CGFloat v136 = v232;
        }

        BOOL v174 = v176;
        v171 = v223;
        goto LABEL_82;
      }
      uint64_t v178 = v132 + 1;
      v179 = [(PKTextInputElementContent *)(uint64_t)self->__ibeamElementContent stringInRange:1];
      if ([v179 length] == 1)
      {
        uint64_t v180 = [v179 characterAtIndex:0];
        v181 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
        LOBYTE(v180) = [v181 characterIsMember:v180];

        BOOL v176 = 1;
        double v183 = v234;
        double v182 = v236;
        if ((v180 & 1) != 0 || v132 >= v173) {
          goto LABEL_73;
        }
      }
      else
      {
        double v183 = v234;
        double v182 = v236;
        if (v132 >= v173)
        {
          BOOL v176 = 1;
LABEL_73:

          goto LABEL_74;
        }
      }
      double v231 = v136;
      v184 = self->__ibeamElementContent;
      v185 = -[PKTextInputHoverController view]((id *)&self->super.isa);
      [(PKTextInputElementContent *)(id *)&v184->super.isa firstRectForRange:1uLL inCoordinateSpace:v185];
      CGFloat v187 = v186;
      double v189 = v188;
      CGFloat v191 = v190;
      CGFloat v193 = v192;

      v257.origin.CGFloat x = v187;
      v257.origin.CGFloat y = v189;
      v257.size.CGFloat width = v191;
      v257.size.height = v193;
      if (CGRectIsNull(v257))
      {
        BOOL v176 = 0;
      }
      else
      {
        double v194 = v189 - v138;
        if (v189 - v138 < 0.0) {
          double v194 = -(v189 - v138);
        }
        BOOL v176 = v194 > v228 * 0.5;
      }
      CGFloat v136 = v231;
      goto LABEL_73;
    }
    goto LABEL_49;
  }
LABEL_56:
}

- (void)hoverControllerDidEnd:(id)a3
{
  -[PKTextInputHoverController hideIBeamLayer]((uint64_t)self);
  id v4 = -[PKTextInputHoverController _cursorController]((id *)&self->super.isa);
  [v4 setForceVisible:0];

  if (self)
  {
    self->__lineBreakTimestamp = 0.0;
    [(CAShapeLayer *)self->__hoverDebugLayer removeFromSuperlayer];
    objc_storeStrong((id *)&self->__hoverDebugLayer, 0);
    [(UIView *)self->__hoverFlashElementsView removeFromSuperview];
    objc_storeStrong((id *)&self->__hoverFlashElementsView, 0);
    objc_storeStrong((id *)&self->__currentHoverFlashElementView, 0);
    self->__shouldMakeCursorStrong = 0;
  }
  else
  {
    [0 removeFromSuperlayer];
    [0 removeFromSuperview];
  }
  v5 = -[PKTextInputHoverController _cursorController]((id *)&self->super.isa);
  int v6 = [v5 forceStrong];

  if (v6)
  {
    objc_initWeak(&location, self);
    dispatch_time_t v7 = dispatch_time(0, 2000000000);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__PKTextInputHoverController_hoverControllerDidEnd___block_invoke;
    v8[3] = &unk_1E64C5998;
    objc_copyWeak(&v9, &location);
    dispatch_after(v7, MEMORY[0x1E4F14428], v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  if (self)
  {
    if (self->__hidePlaceholderElement)
    {
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_unhidePlaceholderElementIfNecessary object:0];
      [(PKTextInputHoverController *)self performSelector:sel_unhidePlaceholderElementIfNecessary withObject:0 afterDelay:1.0];
    }
  }
}

- (void)hideIBeamLayer
{
  if (a1)
  {
    long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(a1 + 160) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(a1 + 176) = v2;
    id v3 = *(void **)(a1 + 112);
    *(void *)(a1 + 112) = 0;

    id v4 = *(void **)(a1 + 120);
    *(void *)(a1 + 120) = 0;

    [*(id *)(a1 + 128) removeFromSuperlayer];
    v5 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = 0;
  }
}

void __52__PKTextInputHoverController_hoverControllerDidEnd___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = -[PKTextInputHoverController _cursorController](WeakRetained);
  [v1 setForceStrong:0];
}

- (void)unhidePlaceholderElementIfNecessary
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_unhidePlaceholderElementIfNecessary object:0];
  if (self)
  {
    hidePlaceholderElement = self->__hidePlaceholderElement;
    if (hidePlaceholderElement)
    {
      hoverController = self->__hoverController;
      if (hoverController && LOBYTE(hoverController->_waitingForHoverHoldTimestamp))
      {
        v5 = -[PKTextInputHoverController view]((id *)&self->super.isa);
        int v6 = [v5 window];
        dispatch_time_t v7 = [v6 windowScene];
        uint64_t v8 = [v7 _visibleWindows];
        id v9 = (void *)v8;
        long long v10 = (void *)MEMORY[0x1E4F1CBF0];
        if (v8) {
          long long v10 = (void *)v8;
        }
        id v11 = v10;

        id v12 = -[PKTextInputElementsFinder initWithWindowsToSearch:]([PKTextInputSingleElementFinder alloc], v11);
        objc_super v13 = self->__hoverController;
        if (v13)
        {
          end = v13->_inputPoints.__end_;
          value = v13->_inputPoints.__end_cap_.__value_;
          p_CGFloat y = &v13->_cachedLatestInputPoint.var0.point.y;
          p_force = &v13->_cachedLatestInputPoint.force;
          if (value == end)
          {
            uint64_t v18 = p_y;
          }
          else
          {
            p_force = (double *)((char *)end + 8);
            uint64_t v18 = (double *)end;
          }
          double v19 = *v18;
          double v20 = *p_force;
        }
        else
        {
          double v19 = 0.0;
          double v20 = 0.0;
        }
        v21 = -[PKTextInputHoverController view]((id *)&self->super.isa);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __65__PKTextInputHoverController_unhidePlaceholderElementIfNecessary__block_invoke;
        v23[3] = &unk_1E64C5F60;
        id v24 = v12;
        v25 = self;
        id v22 = v12;
        objc_msgSend(v22, "findSingleElementAtPosition:coordinateSpace:completion:", v21, v23, v19, v20);
      }
      else
      {
        [(PKTextInputElement *)hidePlaceholderElement endSuppressingPlaceholderIfNecessary];
        -[PKTextInputHoverController set_hidePlaceholderElement:]((uint64_t)self, 0);
      }
    }
  }
}

void __65__PKTextInputHoverController_unhidePlaceholderElementIfNecessary__block_invoke(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) foundElement];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    id v4 = *(void **)(v3 + 104);
    if (v4)
    {
      uint64_t v8 = v2;
      unsigned __int8 v5 = -[PKTextInputElement isEquivalentToElement:](v2, v4);
      int v6 = *(void **)(a1 + 40);
      if (v5)
      {
        long long v2 = v8;
        if (!v6) {
          goto LABEL_10;
        }
        [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:v6 selector:sel_unhidePlaceholderElementIfNecessary object:0];
        [v6 performSelector:sel_unhidePlaceholderElementIfNecessary withObject:0 afterDelay:1.0];
      }
      else
      {
        if (v6) {
          dispatch_time_t v7 = (void *)v6[13];
        }
        else {
          dispatch_time_t v7 = 0;
        }
        [v7 endSuppressingPlaceholderIfNecessary];
        -[PKTextInputHoverController set_hidePlaceholderElement:](*(void *)(a1 + 40), 0);
      }
      long long v2 = v8;
    }
  }
LABEL_10:
}

- (void)set_hidePlaceholderElement:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 104), a2);
  }
}

- (void)hoverControllerDidLift:(id)a3
{
  id v6 = a3;
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained hoverControllerDidLift:self];

    hidePlaceholderElement = self->__hidePlaceholderElement;
    if (hidePlaceholderElement)
    {
      [(PKTextInputElement *)hidePlaceholderElement endSuppressingPlaceholderIfNecessary];
      -[PKTextInputHoverController set_hidePlaceholderElement:]((uint64_t)self, 0);
    }
  }
  else
  {
    [0 hoverControllerDidLift:0];
  }
}

- (void)hoverController:(id)a3 holdGestureMeanInputPoint:(id *)a4 latestInputPoint:(id *)a5
{
  id v8 = a3;
  if (self)
  {
    double x = a4->var0.var0.x;
    double y = a4->var0.var0.y;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v12 = objc_msgSend(WeakRetained, "hoverController:topLevelHitViewAt:", self, x, y);
  }
  else
  {
    id v12 = 0;
  }
  int v13 = +[PKTextInputElementsFinder isResponderEditableTextInput:]((uint64_t)PKTextInputElementsFinder, v12);
  v14 = +[PKHoverSettings sharedSettings];
  int v15 = [v14 tooltipsActive];

  if (v15)
  {
    v16 = objc_msgSend(v12, "pk_hoverLabelAttributedString");
    if (!v16)
    {
      CGFloat v58 = (void *)MEMORY[0x1E4FB1EB0];
      id v59 = v8;
      id v17 = v12;
      uint64_t v18 = v17;
      if (!self) {
        goto LABEL_7;
      }
      double v19 = [v17 window];
      double v20 = -[PKTextInputHoverController view]((id *)&self->super.isa);
      v21 = [v20 window];

      if (v19 == v21)
      {
        id v22 = [v18 accessibilityLabel];
        v23 = v58;
        id v8 = v59;
        if (!v22)
        {
          id v22 = [v18 accessibilityHint];
        }
      }
      else
      {
LABEL_7:
        id v22 = 0;
        v23 = v58;
        id v8 = v59;
      }

      v16 = objc_msgSend(v23, "pk_hoverAttributedStringFromString:", v22);
    }
    if (objc_msgSend(v16, "length", v58)) {
      [(PKHoverController *)(uint64_t)self->__hoverController showAttributedLabel:a5->var0.var0.x atLocation:a5->var0.var0.y];
    }
  }
  -[PKHoverController hoverDebugLayerColor](v8);
  id v24 = objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [v24 CGColor];
  if (self) {
    hoverDebugLayer = self->__hoverDebugLayer;
  }
  else {
    hoverDebugLayer = 0;
  }
  [(CAShapeLayer *)hoverDebugLayer setFillColor:v25];

  double v27 = +[PKHoverSettings sharedSettings];
  int v28 = [v27 scribbleLineBreakHandling] & v13;

  if (v28 == 1)
  {
    if (self)
    {
      if (!self->__lineBreakWaitingForElement && self->__lineBreakTimestamp == 0.0)
      {
        self->__lineBreakTimestamp = CACurrentMediaTime();
        self->__lineBreakPosition = (CGPoint)a4->var0;
      }
    }
    else
    {
      CACurrentMediaTime();
    }
  }
  else
  {
    double v29 = +[PKHoverSettings sharedSettings];
    int v30 = [v29 scribbleFlashCursorActive];

    if (v30)
    {
      double v31 = -[PKTextInputHoverController _cursorController]((id *)&self->super.isa);
      [v31 flashCursor];
    }
  }
  double v32 = +[PKHoverSettings sharedSettings];
  int v33 = [v32 scribbleIBeamActive];
  v34 = (void *)MEMORY[0x1E4F1CBF0];
  if (!v33) {
    goto LABEL_36;
  }
  BOOL v35 = +[PKTextInputElementsFinder isResponderNonEditableTextInput:]((uint64_t)PKTextInputElementsFinder, v12);

  if (!v35) {
    goto LABEL_37;
  }
  if (!self)
  {
LABEL_30:
    CGFloat v38 = -[PKTextInputHoverController view]((id *)&self->super.isa);
    double v39 = [v38 window];
    CGFloat v40 = [v39 windowScene];
    uint64_t v41 = [v40 _visibleWindows];
    CGFloat v42 = (void *)v41;
    if (v41) {
      double v43 = (void *)v41;
    }
    else {
      double v43 = v34;
    }
    id v60 = v43;

    double v44 = -[PKTextInputElementsFinder initWithWindowsToSearch:]([PKTextInputSingleElementFinder alloc], v60);
    if (v44) {
      v44[4] = 257;
    }
    double v45 = a5->var0.var0.x;
    double v46 = a5->var0.var0.y;
    double v47 = -[PKTextInputHoverController view]((id *)&self->super.isa);
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __89__PKTextInputHoverController_hoverController_holdGestureMeanInputPoint_latestInputPoint___block_invoke;
    v68[3] = &unk_1E64C9A10;
    double v71 = v45;
    double v72 = v46;
    id v69 = v44;
    id v70 = self;
    double v32 = v44;
    objc_msgSend(v32, "findSingleElementAtPosition:coordinateSpace:completion:", v47, v68, v45, v46);

LABEL_36:
LABEL_37:
    double v36 = a5->var0.var0.x;
    double v37 = a5->var0.var0.y;
    long long v65 = *(_OWORD *)&a5->var9;
    long long v66 = *(_OWORD *)&a5->var11;
    long long v67 = *(_OWORD *)&a5->var13;
    long long v61 = *(_OWORD *)&a5->var1;
    long long v62 = *(_OWORD *)&a5->var3;
    long long v63 = *(_OWORD *)&a5->var5;
    long long v64 = *(_OWORD *)&a5->var7;
    if (!self) {
      goto LABEL_42;
    }
    goto LABEL_38;
  }
  if (!self->__iBeamWaitingForElement && !self->__ibeamElement)
  {
    self->__iBeamWaitingForElement = 1;
    goto LABEL_30;
  }
  double v36 = a5->var0.var0.x;
  double v37 = a5->var0.var0.y;
  long long v65 = *(_OWORD *)&a5->var9;
  long long v66 = *(_OWORD *)&a5->var11;
  long long v67 = *(_OWORD *)&a5->var13;
  long long v61 = *(_OWORD *)&a5->var1;
  long long v62 = *(_OWORD *)&a5->var3;
  long long v63 = *(_OWORD *)&a5->var5;
  long long v64 = *(_OWORD *)&a5->var7;
LABEL_38:
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_unhidePlaceholderElementIfNecessary object:0];
  [(PKTextInputHoverController *)self performSelector:sel_unhidePlaceholderElementIfNecessary withObject:0 afterDelay:1.0];
  double v48 = -[PKTextInputHoverController view]((id *)&self->super.isa);
  double v49 = [v48 window];
  double v50 = [v49 windowScene];
  uint64_t v51 = [v50 _visibleWindows];
  double v52 = (void *)v51;
  if (v51) {
    double v53 = (void *)v51;
  }
  else {
    double v53 = v34;
  }
  id v54 = v53;

  id v55 = -[PKTextInputElementsFinder initWithWindowsToSearch:]([PKTextInputSingleElementFinder alloc], v54);
  double v56 = -[PKTextInputHoverController view]((id *)&self->super.isa);
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __47__PKTextInputHoverController__handleHoverHold___block_invoke;
  v73[3] = &unk_1E64C9AB0;
  id v74 = v55;
  v75 = self;
  double v76 = v36;
  double v77 = v37;
  long long v82 = v65;
  long long v83 = v66;
  long long v84 = v67;
  long long v78 = v61;
  long long v79 = v62;
  long long v81 = v64;
  long long v80 = v63;
  id v57 = v55;
  objc_msgSend(v57, "findSingleElementAtPosition:coordinateSpace:completion:", v56, v73, v36, v37);

LABEL_42:
}

void __89__PKTextInputHoverController_hoverController_holdGestureMeanInputPoint_latestInputPoint___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) foundElement];
  if (v2)
  {
    uint64_t v3 = -[PKTextInputHoverController view](*(id **)(a1 + 40));
    BOOL v4 = [(PKTextInputElement *)(BOOL)v2 containsPoint:*(double *)(a1 + 48) inCoordinateSpace:*(double *)(a1 + 56)];

    if (v4)
    {
      if ((-[PKTextInputElement isEditableElement]((uint64_t)v2) & 1) == 0)
      {
        unsigned __int8 v5 = -[PKTextInputElement coordinateSpace]((uint64_t)v2);
        id v6 = -[PKTextInputHoverController view](*(id **)(a1 + 40));
        objc_msgSend(v5, "convertPoint:fromCoordinateSpace:", v6, *(double *)(a1 + 48), *(double *)(a1 + 56));
        double v8 = v7;
        double v10 = v9;

        double v11 = -[PKTextInputElement frame]((uint64_t)v2);
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __89__PKTextInputHoverController_hoverController_holdGestureMeanInputPoint_latestInputPoint___block_invoke_2;
        v19[3] = &unk_1E64C99E8;
        v19[4] = *(void *)(a1 + 40);
        id v2 = v2;
        id v20 = v2;
        -[PKTextInputElement loadContentFocusingIfNeededWithReferencePoint:alwaysSetSelectionFromReferencePoint:rectOfInterest:completion:]((uint64_t)v2, 0, v19, v8, v10, v11, v13, v15, v17);

        goto LABEL_8;
      }
    }
    else
    {

      id v2 = 0;
    }
  }
  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    *(unsigned char *)(v18 + 12) = 0;
  }
LABEL_8:
}

void __89__PKTextInputHoverController_hoverController_holdGestureMeanInputPoint_latestInputPoint___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(a1 + 40);
  id v6 = a2;
  if (v5) {
    objc_storeStrong((id *)(v5 + 112), v4);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    objc_storeStrong((id *)(v7 + 120), a2);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    *(unsigned char *)(v8 + 12) = 0;
  }
}

- (void)hoverControllerHoldGestureEnded:(id)a3
{
  if (self) {
    self->__shouldMakeCursorStrong = 0;
  }
  -[PKSqueezePaletteViewContext setSelectedColor:]((uint64_t)self, 0);
  id v4 = [MEMORY[0x1E4FB1618] clearColor];
  uint64_t v5 = [v4 CGColor];
  if (self) {
    hoverDebugLayer = self->__hoverDebugLayer;
  }
  else {
    hoverDebugLayer = 0;
  }
  [(CAShapeLayer *)hoverDebugLayer setFillColor:v5];

  [(PKHoverController *)self->__hoverController hideLabel];
  self->__shouldHoverFlashElements = 0;
}

void __52__PKTextInputHoverController__flashElementsForHover__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v44 = a2;
  if (*(void *)(a1 + 32))
  {
    if ([v44 count])
    {
      uint64_t v3 = (id *)(a1 + 40);
      id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained(v3);
      if (WeakRetained)
      {
        int v5 = WeakRetained[8];

        if (v5)
        {
          id v6 = objc_loadWeakRetained(v3);
          if (v6)
          {
            uint64_t v7 = [v44 allObjects];
            *((unsigned char *)v6 + 8) = 0;
            objc_storeStrong((id *)v6 + 7, v7);
            uint64_t v8 = -[PKTextInputHoverController view]((id *)v6);
            [v8 bounds];
            double v10 = v9;
            double v12 = v11;
            double v14 = v13;
            double v16 = v15;

            CGFloat v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v10, v12, v14, v16);
            [v17 setUserInteractionEnabled:0];
            uint64_t v18 = -[PKTextInputHoverController view]((id *)v6);
            [v18 addSubview:v17];

            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            id v19 = v7;
            uint64_t v20 = [v19 countByEnumeratingWithState:&v45 objects:v49 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v46;
              do
              {
                for (uint64_t i = 0; i != v21; ++i)
                {
                  if (*(void *)v46 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  uint64_t v24 = *(void *)(*((void *)&v45 + 1) + 8 * i);
                  double v25 = -[PKTextInputElement frame](v24);
                  double v27 = v26;
                  double v29 = v28;
                  double v31 = v30;
                  double v32 = -[PKTextInputElement coordinateSpace](v24);
                  int v33 = -[PKTextInputHoverController view]((id *)v6);
                  double v34 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v32, v33, v25, v27, v29, v31);
                  CGFloat v36 = v35;
                  CGFloat v38 = v37;
                  CGFloat v40 = v39;

                  v52.origin.double x = v34;
                  v52.origin.double y = v36;
                  v52.size.CGFloat width = v38;
                  v52.size.height = v40;
                  CGRect v53 = CGRectInset(v52, -4.0, -4.0);
                  uint64_t v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v53.origin.x, v53.origin.y, v53.size.width, v53.size.height);
                  CGFloat v42 = [MEMORY[0x1E4FB1618] clearColor];
                  [v41 setBackgroundColor:v42];

                  [v41 _setContinuousCornerRadius:4.0];
                  [v41 setClipsToBounds:1];
                  [v41 setUserInteractionEnabled:0];
                  [v17 addSubview:v41];
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v45 objects:v49 count:16];
              }
              while (v21);
            }

            double v43 = (void *)*((void *)v6 + 6);
            *((void *)v6 + 6) = v17;
          }
        }
      }
    }
  }
}

void __47__PKTextInputHoverController__handleHoverHold___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) foundElement];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      uint64_t v4 = *(void *)(v3 + 24);
      if (v4)
      {
        if (*(unsigned char *)(v4 + 56))
        {
          id v5 = *(id *)(v3 + 104);
          if (v5)
          {
            id v6 = v5;
            uint64_t v7 = *(void *)(a1 + 40);
            uint64_t v8 = v7 ? *(id **)(v7 + 104) : 0;
            unsigned __int8 v9 = -[PKTextInputElement isEquivalentToElement:](v8, v2);

            if ((v9 & 1) == 0) {
              [*(id *)(a1 + 40) unhidePlaceholderElementIfNecessary];
            }
          }
          -[PKTextInputHoverController set_hidePlaceholderElement:](*(void *)(a1 + 40), v2);
          uint64_t v10 = *(void *)(a1 + 40);
          if (v10) {
            double v11 = *(void **)(v10 + 104);
          }
          else {
            double v11 = 0;
          }
          [v11 beginSuppressingPlaceholderIfNecessary];
          double v12 = +[PKHoverSettings sharedSettings];
          int v13 = [v12 scribbleShowWritableElementsActive];

          if (v13)
          {
            uint64_t v14 = *(void *)(a1 + 40);
            if (v14)
            {
              double v15 = +[PKHoverSettings sharedSettings];
              int v16 = [v15 scribbleShowWritableElementsActive];

              if (v16)
              {
                id v17 = *(id *)(v14 + 48);
                if (v17)
                {
                }
                else if (!*(unsigned char *)(v14 + 8))
                {
                  *(unsigned char *)(v14 + 8) = 1;
                  uint64_t v18 = -[PKTextInputHoverController view]((id *)v14);
                  id v19 = [v18 window];
                  uint64_t v20 = [v19 windowScene];
                  uint64_t v21 = [v20 _visibleWindows];
                  uint64_t v22 = (void *)v21;
                  v23 = (void *)MEMORY[0x1E4F1CBF0];
                  if (v21) {
                    v23 = (void *)v21;
                  }
                  id v24 = v23;

                  id v25 = -[PKTextInputElementsFinder initWithWindowsToSearch:]([PKTextInputElementsFinder alloc], v24);
                  double v26 = -[PKTextInputHoverController view]((id *)v14);
                  [v26 bounds];
                  CGFloat v28 = v27;
                  CGFloat v30 = v29;
                  CGFloat v32 = v31;
                  CGFloat v34 = v33;

                  objc_initWeak(&location, (id)v14);
                  double v35 = -[PKTextInputHoverController view]((id *)v14);
                  v81.origin.double x = v28;
                  v81.origin.double y = v30;
                  v81.size.CGFloat width = v32;
                  v81.size.height = v34;
                  CGFloat MidX = CGRectGetMidX(v81);
                  v82.origin.double x = v28;
                  v82.origin.double y = v30;
                  v82.size.CGFloat width = v32;
                  v82.size.height = v34;
                  CGFloat MidY = CGRectGetMidY(v82);
                  from[0] = (id)MEMORY[0x1E4F143A8];
                  from[1] = (id)3221225472;
                  from[2] = __52__PKTextInputHoverController__flashElementsForHover__block_invoke;
                  from[3] = &unk_1E64C9A38;
                  id v38 = v25;
                  id v78 = v38;
                  objc_copyWeak(&v79, &location);
                  if (v38) {
                    -[PKTextInputElementsFinder _findAvailableTextInputElementsWithReusableElements:referenceHitPoint:referenceSearchArea:referenceCoordSpace:nearPointOnly:completion:]((uint64_t)v38, 0, v35, 0, from, MidX, MidY, v28, v30, v32, v34);
                  }

                  objc_destroyWeak(&v79);
                  objc_destroyWeak(&location);
                }
              }
            }
          }
          if ((-[PKTextInputElement isFocused]((uint64_t)v2) & 1) != 0
            || !-[PKTextInputElement shouldPostponeFocusing](v2))
          {
            if (-[PKTextInputElement isFocused]((uint64_t)v2))
            {
              id v54 = +[PKHoverSettings sharedSettings];
              if ([v54 scribbleHoverStrongActive])
              {
                id v55 = -[PKTextInputHoverController _cursorController](*(id **)(a1 + 40));
                if (![v55 forceStrong])
                {
                  uint64_t v56 = *(void *)(a1 + 40);
                  if (v56)
                  {
                    int v57 = *(unsigned __int8 *)(v56 + 9);

                    if (v57) {
                      goto LABEL_42;
                    }
                  }
                  else
                  {
                  }
                  uint64_t v58 = *(void *)(a1 + 40);
                  if (v58) {
                    id v59 = *(void **)(v58 + 24);
                  }
                  else {
                    id v59 = 0;
                  }
                  [(PKHoverController *)v59 showLabel:*(double *)(a1 + 48) atLocation:*(double *)(a1 + 56)];
                  uint64_t v60 = *(void *)(a1 + 40);
                  if (v60)
                  {
                    *(unsigned char *)(v60 + 9) = 1;
                    long long v61 = *(void **)(a1 + 40);
                  }
                  else
                  {
                    long long v61 = 0;
                  }
                  objc_initWeak(from, v61);
                  long long v62 = +[PKHoverSettings sharedSettings];
                  [v62 hoverAndHoldActionTimeInterval];
                  dispatch_time_t v64 = dispatch_time(0, (uint64_t)(v63 * 1000000000.0));
                  v65[0] = MEMORY[0x1E4F143A8];
                  v65[1] = 3221225472;
                  v65[2] = __47__PKTextInputHoverController__handleHoverHold___block_invoke_4;
                  v65[3] = &unk_1E64C5998;
                  objc_copyWeak(&v66, from);
                  dispatch_after(v64, MEMORY[0x1E4F14428], v65);

                  CGRect v53 = &v66;
                  goto LABEL_41;
                }
              }
            }
          }
          else
          {
            double v39 = +[PKHoverSettings sharedSettings];
            int v40 = [v39 scribbleFocusActive];

            if (v40)
            {
              -[PKSqueezePaletteViewContext setSelectedColor:](*(void *)(a1 + 40), v2);
              uint64_t v41 = *(void *)(a1 + 40);
              if (v41) {
                CGFloat v42 = *(void **)(v41 + 24);
              }
              else {
                CGFloat v42 = 0;
              }
              double v44 = *(double *)(a1 + 48);
              double v45 = *(double *)(a1 + 56);
              double v43 = (id *)(a1 + 48);
              [(PKHoverController *)v42 showLabel:v44 atLocation:v45];
              objc_initWeak(from, *(v43 - 1));
              long long v46 = +[PKHoverSettings sharedSettings];
              [v46 hoverAndHoldActionTimeInterval];
              dispatch_time_t v48 = dispatch_time(0, (uint64_t)(v47 * 1000000000.0));
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __47__PKTextInputHoverController__handleHoverHold___block_invoke_2;
              block[3] = &unk_1E64C9A88;
              objc_copyWeak(&v68, from);
              long long v49 = *((_OWORD *)v43 + 5);
              long long v73 = *((_OWORD *)v43 + 4);
              long long v74 = v49;
              long long v50 = *((_OWORD *)v43 + 7);
              long long v75 = *((_OWORD *)v43 + 6);
              long long v76 = v50;
              long long v51 = *((_OWORD *)v43 + 1);
              long long v69 = *(_OWORD *)v43;
              long long v70 = v51;
              long long v52 = *((_OWORD *)v43 + 3);
              long long v71 = *((_OWORD *)v43 + 2);
              long long v72 = v52;
              dispatch_after(v48, MEMORY[0x1E4F14428], block);

              CGRect v53 = &v68;
LABEL_41:
              objc_destroyWeak(v53);
              objc_destroyWeak(from);
            }
          }
        }
      }
    }
  }
LABEL_42:
}

void __47__PKTextInputHoverController__handleHoverHold___block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    id WeakRetained = (void *)WeakRetained[3];
  }
  [WeakRetained hideLabel];

  id v5 = objc_loadWeakRetained(v2);
  id v6 = v5;
  if (v5) {
    uint64_t v7 = (void *)*((void *)v5 + 5);
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__PKTextInputHoverController__handleHoverHold___block_invoke_3;
  v9[3] = &unk_1E64C9A60;
  objc_copyWeak(&v10, v2);
  [(PKTextInputElement *)(uint64_t)v8 focusElementIfNeededWithReferencePoint:v9 alwaysSetSelectionFromReferencePoint:*(double *)(a1 + 40) completion:*(double *)(a1 + 48)];

  objc_destroyWeak(&v10);
}

void __47__PKTextInputHoverController__handleHoverHold___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = -[PKTextInputHoverController _cursorController](WeakRetained);
  [v1 flashCursor];
}

void __47__PKTextInputHoverController__handleHoverHold___block_invoke_4(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained) {
    id WeakRetained = (void *)WeakRetained[3];
  }
  [WeakRetained hideLabel];

  uint64_t v4 = (unsigned __int8 *)objc_loadWeakRetained(v1);
  if (v4)
  {
    int v5 = v4[9];

    if (v5)
    {
      uint64_t v7 = (id *)objc_loadWeakRetained(v1);
      id v6 = -[PKTextInputHoverController _cursorController](v7);
      [v6 setForceStrong:1];
    }
  }
}

uint64_t __69__PKTextInputHoverController__updateFlashElementsForHoverInputPoint___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
}

void __69__PKTextInputHoverController__updateFlashElementsForHoverInputPoint___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1618] clearColor];
  uint64_t v3 = [v2 CGColor];
  uint64_t v4 = [*(id *)(a1 + 32) layer];
  [v4 setBorderColor:v3];

  int v5 = (void *)MEMORY[0x1E4FB1EB0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PKTextInputHoverController__updateFlashElementsForHoverInputPoint___block_invoke_3;
  v7[3] = &unk_1E64C61C0;
  id v8 = *(id *)(a1 + 32);
  [v5 animateWithDuration:v7 animations:0.2];
  id v6 = [*(id *)(a1 + 32) subviews];
  [v6 makeObjectsPerformSelector:sel_removeFromSuperview];
}

void __69__PKTextInputHoverController__updateFlashElementsForHoverInputPoint___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1618] clearColor];
  [*(id *)(a1 + 32) setBackgroundColor:v2];
}

void __63__PKTextInputHoverController__checklineBreakGestureIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[12])
  {
    uint64_t v3 = WeakRetained;
    -[PKTextInputHoverController hideIBeamLayer]((uint64_t)WeakRetained);
    id v2 = -[PKTextInputHoverController _cursorController](v3);
    [v2 setForceVisible:0];

    id WeakRetained = v3;
    *((unsigned char *)v3 + 11) = 0;
    v3[9] = 0;
  }
}

void __63__PKTextInputHoverController__checklineBreakGestureIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) foundElement];
  uint64_t v3 = (void *)v2;
  if (v2 && -[PKTextInputElement isFocused](v2))
  {
    uint64_t v4 = -[PKTextInputElement coordinateSpace]((uint64_t)v3);
    int v5 = -[PKTextInputHoverController view](*(id **)(a1 + 40));
    objc_msgSend(v4, "convertPoint:fromCoordinateSpace:", v5, *(double *)(a1 + 56), *(double *)(a1 + 64));
    double v7 = v6;
    CGFloat v9 = v8;

    id v10 = -[PKTextInputHoverController _cursorController](*(id **)(a1 + 40));
    LOBYTE(v5) = [v10 isCursorWeak];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__PKTextInputHoverController__checklineBreakGestureIfNecessary__block_invoke_3;
    v12[3] = &unk_1E64C9AD8;
    v12[4] = *(void *)(a1 + 40);
    id v13 = v3;
    uint64_t v15 = *(void *)(a1 + 72);
    long long v16 = *(_OWORD *)(a1 + 56);
    id v14 = *(id *)(a1 + 48);
    [(PKTextInputElement *)(uint64_t)v13 evaluateLineBreakForTapAtLocation:1 weakCursor:v12 allowTrailingWhitespace:v7 completion:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      *(unsigned char *)(v11 + 10) = 0;
    }
  }
}

void __63__PKTextInputHoverController__checklineBreakGestureIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    *(unsigned char *)(v4 + 10) = 0;
  }
  id v114 = v3;
  if (!v3 || -[PKTextInputElementContent contentLength]((uint64_t)v3) < 1)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_64;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5
    && (objc_storeStrong((id *)(v5 + 96), *(id *)(a1 + 40)), (uint64_t v6 = *(void *)(a1 + 32)) != 0)
    && (*(unsigned char *)(v6 + 11) = 1, (uint64_t v7 = *(void *)(a1 + 32)) != 0))
  {
    *(void *)(v7 + 88) = *(void *)(a1 + 56);
    double v8 = *(id **)(a1 + 32);
  }
  else
  {
    double v8 = 0;
  }
  CGFloat v9 = -[PKTextInputHoverController _cursorController](v8);
  int v10 = [v9 isCursorWeak];

  if (v10)
  {
    uint64_t v11 = -[PKTextInputHoverController _cursorController](*(id **)(a1 + 32));
    [v11 setForceVisible:1];
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    *(void *)(v12 + 80) = 1;
  }
  id v13 = +[PKHoverSettings sharedSettings];
  if (([v13 scribbleLineBreakMultiLineEnabled] & 1) == 0)
  {

    goto LABEL_64;
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    double v15 = *(double *)(v14 + 72);
  }
  else {
    double v15 = 0.0;
  }
  double v16 = *(double *)(a1 + 56) - v15;
  id v17 = +[PKHoverSettings sharedSettings];
  [v17 scribbleLineBreakMultiLineDelay];
  double v19 = v18;

  if (v16 <= v19) {
    goto LABEL_64;
  }
  uint64_t v20 = *(void *)(a1 + 32);
  double v21 = *(double *)(a1 + 64);
  double v22 = *(double *)(a1 + 72);
  v23 = (id *)v114;
  id v24 = v23;
  if (v20)
  {
    id v25 = v23[1];
    double v26 = -[PKTextInputHoverController view]((id *)v20);
    double v27 = -[PKTextInputElement coordinateSpace]((uint64_t)v25);
    double v28 = *MEMORY[0x1E4F1DB30];
    double v29 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v30 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v26, v27, v21, v22, *MEMORY[0x1E4F1DB30], v29);
    double v32 = v31;

    double v33 = -[PKTextInputElement frame]((uint64_t)v25);
    double v37 = v33;
    double v38 = v34;
    if (v30 >= v33)
    {
      double v39 = v33 + v35;
      BOOL v40 = v30 <= v37 + v35;
      double v37 = v30;
      if (!v40) {
        double v37 = v39;
      }
    }
    if (v32 >= v34)
    {
      double v38 = v32;
      if (v32 > v34 + v36) {
        double v38 = v34 + v36;
      }
    }
    uint64_t v41 = -[PKTextInputElement coordinateSpace]((uint64_t)v25);
    CGFloat v42 = -[PKTextInputHoverController view]((id *)v20);
    double v43 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v41, v42, v37, v38, v28, v29);
    double v45 = v44;

    uint64_t NonWhitespace = -[PKTextInputElementContent indexOfLastNonWhitespaceCharacter]((uint64_t)v24);
    double v47 = -[PKTextInputHoverController view]((id *)v20);
    uint64_t v48 = [(PKTextInputElementContent *)v24 characterIndexClosestToPoint:1 inCoordinateSpace:0 forInsertingText:v43 adjustForLastCharacter:v45];

    if (NonWhitespace != 0x7FFFFFFFFFFFFFFFLL
      && v48 != 0x7FFFFFFFFFFFFFFFLL
      && v48 < -[PKTextInputElementContent contentLength]((uint64_t)v24)
      && v48 > NonWhitespace)
    {
      long long v49 = -[PKTextInputHoverController view]((id *)v20);
      double v50 = -[PKTextInputElementContent caretRectForCharacterIndex:inCoordinateSpace:]((uint64_t)v24, v48, v49);
      double v52 = v51;
      double v54 = v53;
      double v56 = v55;

      *(void *)(v20 + 80) = 0;
LABEL_52:
      long long v71 = -[PKTextInputHoverController _ibeamLayerCreateIfNecessary]((id *)v20);
      v95 = [MEMORY[0x1E4FB1618] grayColor];
      uint64_t v96 = [v95 colorWithAlphaComponent:0.5];

      v125.origin.double x = *(CGFloat *)(v20 + 160);
      double v97 = *(double *)(v20 + 168);
      v125.size.CGFloat width = *(CGFloat *)(v20 + 176);
      v125.size.height = *(CGFloat *)(v20 + 184);
      v125.origin.double y = v97;
      IsEmptdouble y = CGRectIsEmpty(v125);
      BOOL v99 = IsEmpty;
      if (IsEmpty) {
        double v100 = v52;
      }
      else {
        double v100 = (v52 + v97 * 3.0) * 0.25;
      }
      objc_msgSend(MEMORY[0x1E4F39CF8], "begin", *(void *)&width, *(void *)&v109, *(void *)&v110, *(void *)&v111);
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      objc_msgSend(v71, "setFrame:", v50, v100, v54, v56);
      if (v99)
      {
        [MEMORY[0x1E4F39CF8] commit];
        v101 = (CGColor *)[v71 backgroundColor];
        id v102 = v96;
        if (!CGColorEqualToColor(v101, (CGColorRef)[v102 CGColor])) {
          objc_msgSend(v71, "setBackgroundColor:", objc_msgSend(v102, "CGColor"));
        }
      }
      else
      {
        double v103 = (CGColor *)[v71 backgroundColor];
        id v104 = v96;
        if (!CGColorEqualToColor(v103, (CGColorRef)[v104 CGColor])) {
          objc_msgSend(v71, "setBackgroundColor:", objc_msgSend(v104, "CGColor"));
        }
        [MEMORY[0x1E4F39CF8] commit];
      }
      *(double *)(v20 + 160) = v50;
      *(double *)(v20 + 168) = v100;
      *(double *)(v20 + 176) = v54;
      *(double *)(v20 + 184) = v56;
      *(CFTimeInterval *)(v20 + 136) = CACurrentMediaTime();
      id v105 = -[PKTextInputHoverController _cursorController]((id *)v20);
      uint64_t v106 = [v105 isCursorWeak];
      double v107 = -[PKTextInputHoverController _cursorController]((id *)v20);
      [v107 setForceVisible:v106];

LABEL_62:
      goto LABEL_63;
    }
    if (-[PKTextInputElementContent contentLength]((uint64_t)v24) < 1) {
      uint64_t v57 = -[PKTextInputElementContent selectedRange]((uint64_t)v24);
    }
    else {
      uint64_t v57 = -[PKTextInputElementContent contentLength]((uint64_t)v24);
    }
    uint64_t v58 = v57;
    id v59 = -[PKTextInputHoverController view]((id *)v20);
    double v60 = -[PKTextInputElementContent caretRectForCharacterIndex:inCoordinateSpace:]((uint64_t)v24, v58, v59);
    CGFloat v62 = v61;
    CGFloat v64 = v63;
    CGFloat v66 = v65;

    v117.origin.double x = v60;
    v117.origin.double y = v62;
    v117.size.CGFloat width = v64;
    v117.size.height = v66;
    if (CGRectIsNull(v117))
    {
      CGRectIsNull(*MEMORY[0x1E4F1DB20]);
    }
    else
    {
      uint64_t v115 = 0;
      long long v72 = -[PKTextInputHoverController view]((id *)v20);
      double v73 = -[PKTextInputElementContent caretRectForStartOfLineFromCharacterIndex:coordinateSpace:outCharacterIndex:]((uint64_t)v24, v58, v72, &v115);
      double v52 = v74;
      CGFloat v76 = v75;
      double v56 = v77;

      double v50 = v73;
      v118.origin.double x = v73;
      v118.origin.double y = v52;
      double v54 = v76;
      v118.size.CGFloat width = v76;
      v118.size.height = v56;
      double v78 = fmax(CGRectGetHeight(v118), 1.0);
      uint64_t v79 = v115 - 1;
      if (v115 >= 1)
      {
        long long v80 = -[PKTextInputHoverController view]((id *)v20);
        double v81 = -[PKTextInputElementContent caretRectForStartOfLineFromCharacterIndex:coordinateSpace:outCharacterIndex:]((uint64_t)v24, v79, v80, &v115);
        CGFloat v83 = v82;
        CGFloat v112 = v54;
        double v113 = v45;
        double v84 = v56;
        CGFloat v85 = v50;
        CGFloat v87 = v86;
        CGFloat v89 = v88;

        CGFloat v110 = v83;
        CGFloat v111 = v81;
        v119.origin.double x = v81;
        v119.origin.double y = v83;
        v119.size.CGFloat width = v87;
        double v56 = v84;
        double v45 = v113;
        CGFloat width = v119.size.width;
        CGFloat v109 = v89;
        v119.size.height = v89;
        double Height = CGRectGetHeight(v119);
        double v50 = v85;
        v120.origin.double x = v85;
        v120.origin.double y = v52;
        double v54 = v112;
        v120.size.CGFloat width = v112;
        v120.size.height = v56;
        if (vabdd_f64(Height, CGRectGetHeight(v120)) < 0.00999999978)
        {
          v121.origin.double x = v50;
          v121.origin.double y = v52;
          v121.size.CGFloat width = v112;
          v121.size.height = v56;
          double MinY = CGRectGetMinY(v121);
          v122.origin.double y = v83;
          v122.origin.double x = v111;
          v122.size.CGFloat width = width;
          v122.size.height = v109;
          double v78 = MinY - CGRectGetMinY(v122);
        }
      }
      v123.origin.double x = v50;
      v123.origin.double y = v52;
      v123.size.CGFloat width = v54;
      v123.size.height = v56;
      if (!CGRectIsNull(v123) && v78 > 0.0)
      {
        double v92 = +[PKHoverSettings sharedSettings];
        int v93 = [v92 scribbleLineBreakMultiLineMaxLines];

        if (v93 < 1)
        {
          uint64_t v94 = 0;
        }
        else
        {
          uint64_t v94 = 0;
          while (1)
          {
            v124.origin.double x = v50;
            v124.origin.double y = v52;
            v124.size.CGFloat width = v54;
            v124.size.height = v56;
            if (v45 <= CGRectGetMaxY(v124)) {
              break;
            }
            double v52 = v78 + v52;
            if (v93 == ++v94)
            {
              uint64_t v94 = v93;
              break;
            }
          }
        }
        *(void *)(v20 + 80) = v94;
        goto LABEL_52;
      }
    }
    long long v67 = *(void **)(v20 + 128);
    if (v67)
    {
      id v68 = (CGColor *)[v67 backgroundColor];
      id v69 = [MEMORY[0x1E4FB1618] clearColor];
      LOBYTE(v68) = CGColorEqualToColor(v68, (CGColorRef)[v69 CGColor]);

      if ((v68 & 1) == 0)
      {
        id v70 = [MEMORY[0x1E4FB1618] clearColor];
        objc_msgSend(*(id *)(v20 + 128), "setBackgroundColor:", objc_msgSend(v70, "CGColor"));
      }
    }
    *(void *)(v20 + 80) = 0;
    long long v71 = -[PKTextInputHoverController _cursorController]((id *)v20);
    [v71 setForceVisible:0];
    goto LABEL_62;
  }
LABEL_63:

LABEL_64:
}

- (uint64_t)performLineBreakAfterTapIfPossibleForElement:(double)a3 location:(CGFloat)a4
{
  id v7 = a2;
  if (a1)
  {
    double v8 = (id *)*(id *)(a1 + 96);
    int v9 = *(unsigned __int8 *)(a1 + 11);
    uint64_t v10 = *(void *)(a1 + 80);
    uint64_t v11 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = 0;

    *(unsigned char *)(a1 + 11) = 0;
    *(void *)(a1 + 72) = 0;
    *(void *)(a1 + 80) = 0;
    -[PKTextInputHoverController hideIBeamLayer](a1);
    unsigned int v12 = -[PKTextInputElement isEquivalentToElement:](v8, v7);
    if (v9) {
      unsigned int v13 = v12;
    }
    else {
      unsigned int v13 = 0;
    }
    if (v10 > 0) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    if (v14 == 1)
    {
      double v15 = -[PKTextInputHoverController _cursorController]((id *)a1);
      char v16 = [v15 isCursorWeak];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __84__PKTextInputHoverController_performLineBreakAfterTapIfPossibleForElement_location___block_invoke;
      v18[3] = &__block_descriptor_40_e35_v16__0__PKTextInputElementContent_8l;
      v18[4] = v10;
      [(PKTextInputElement *)(uint64_t)v7 evaluateLineBreakForTapAtLocation:0 weakCursor:v18 allowTrailingWhitespace:a3 completion:a4];
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

void __84__PKTextInputHoverController_performLineBreakAfterTapIfPossibleForElement_location___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = -[PKTextInputElementContent contentLength]((uint64_t)v3);
    uint64_t v6 = objc_opt_new();
    if (*(uint64_t *)(a1 + 32) >= 1)
    {
      uint64_t v7 = 0;
      do
      {
        [v6 appendString:@"\n"];
        ++v7;
      }
      while (v7 < *(void *)(a1 + 32));
    }
    v9[0] = v6;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [(PKTextInputElementContent *)v4 insertTextsToCommit:&unk_1F200EF40 withAlternatives:0 activePreviewText:v5 replacingRange:0 completion:&__block_literal_global_63];
  }
}

- (id)_ibeamLayerCreateIfNecessary
{
  uint64_t v2 = a1 + 16;
  id v3 = a1[16];
  if (!v3)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    [v3 setAllowsHitTesting:0];
    [v3 setCornerRadius:1.0];
    uint64_t v4 = -[PKTextInputHoverController view](a1);
    uint64_t v5 = [v4 layer];
    [v5 addSublayer:v3];

    objc_storeStrong(v2, v3);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__ibeamLayer, 0);
  objc_storeStrong((id *)&self->__ibeamElementContent, 0);
  objc_storeStrong((id *)&self->__ibeamElement, 0);
  objc_storeStrong((id *)&self->__hidePlaceholderElement, 0);
  objc_storeStrong((id *)&self->__lineBreakElement, 0);
  objc_storeStrong((id *)&self->__currentHoverFlashElementView, 0);
  objc_storeStrong((id *)&self->__hoverFlashElements, 0);
  objc_storeStrong((id *)&self->__hoverFlashElementsView, 0);
  objc_storeStrong((id *)&self->__hoverElementToFocus, 0);
  objc_storeStrong((id *)&self->__hoverDebugLayer, 0);
  objc_storeStrong((id *)&self->__hoverController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
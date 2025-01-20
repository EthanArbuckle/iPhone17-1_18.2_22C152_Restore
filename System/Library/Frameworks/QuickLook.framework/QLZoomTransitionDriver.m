@interface QLZoomTransitionDriver
+ (void)cropView:(id)a3 toAvoidNavigationOffset:(double)a4 presenting:(BOOL)a5 animationDuration:(double)a6;
- (void)_performZoomTransition;
- (void)tearDown;
@end

@implementation QLZoomTransitionDriver

- (void)_performZoomTransition
{
  long long v229 = 0u;
  long long v230 = 0u;
  long long v227 = 0u;
  long long v228 = 0u;
  long long v225 = 0u;
  long long v226 = 0u;
  memset(&v224, 0, sizeof(v224));
  memset(&v223[3], 0, 48);
  if ([(QLTransitionDriver *)self presenting]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  double v196 = v3;
  if ([(QLTransitionDriver *)self presenting]) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }
  v5 = [(QLTransitionDriver *)self transitionContainer];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  CGFloat v190 = v9;
  CGFloat v191 = v7;
  -[QLTransitionDriver setTransitionContainerOriginalFrame:](self, "setTransitionContainerOriginalFrame:", v7, v9, v11, v13);
  [(QLTransitionDriver *)self sourceViewFrame];
  double v15 = v14;
  double v17 = v16;
  [(QLTransitionDriver *)self uncroppedFrame];
  v19 = (_OWORD *)MEMORY[0x263F000D0];
  if (v15 == v20 && v17 == v18)
  {
    v21 = [(QLTransitionDriver *)self sourceView];
    uncroppedView = self->_uncroppedView;
    self->_uncroppedView = v21;

    if ([(QLTransitionDriver *)self isSourceViewTransformed])
    {
      [(QLTransitionDriver *)self sourceViewCenter];
      -[UIView setCenter:](self->_uncroppedView, "setCenter:");
      [(QLTransitionDriver *)self sourceViewBounds];
      -[UIView setBounds:](self->_uncroppedView, "setBounds:");
      [(QLTransitionDriver *)self sourceViewTransform];
      v23 = self->_uncroppedView;
      v221[0] = v221[3];
      v221[1] = v221[4];
      v221[2] = v221[5];
      [(UIView *)v23 setTransform:v221];
    }
    else
    {
      v64 = [(QLTransitionDriver *)self sourceView];
      v65 = self->_uncroppedView;
      self->_uncroppedView = v64;

      [(QLTransitionDriver *)self sourceViewFrame];
      -[UIView setFrame:](self->_uncroppedView, "setFrame:");
    }
    [(QLTransitionDriver *)self sourceViewFrame];
  }
  else
  {
    v24 = (UIView *)objc_opt_new();
    v25 = self->_uncroppedView;
    self->_uncroppedView = v24;

    if ([(QLTransitionDriver *)self isSourceViewTransformed])
    {
      v26 = [(QLTransitionDriver *)self sourceView];
      long long v27 = v19[1];
      v223[0] = *v19;
      v223[1] = v27;
      v223[2] = v19[2];
      [v26 setTransform:v223];

      [(QLTransitionDriver *)self sourceViewCenter];
      double v29 = v28;
      double v31 = v30;
      v32 = [(QLTransitionDriver *)self sourceView];
      objc_msgSend(v32, "setCenter:", v29, v31);

      [(QLTransitionDriver *)self sourceViewBounds];
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      double v40 = v39;
      v41 = [(QLTransitionDriver *)self sourceView];
      objc_msgSend(v41, "setBounds:", v34, v36, v38, v40);

      v42 = [(QLTransitionDriver *)self sourceView];
      [v42 frame];
      double v44 = v43;
      [(QLTransitionDriver *)self uncroppedFrame];
      double v46 = v44 + v45;
      v47 = [(QLTransitionDriver *)self sourceView];
      [v47 frame];
      double v49 = v48;
      [(QLTransitionDriver *)self uncroppedFrame];
      double v51 = v49 + v50;
      [(QLTransitionDriver *)self uncroppedFrame];
      -[UIView setFrame:](self->_uncroppedView, "setFrame:", v46, v51);

      [(QLTransitionDriver *)self uncroppedFrame];
      double v53 = -v52;
      [(QLTransitionDriver *)self uncroppedFrame];
      double v55 = -v54;
      [(QLTransitionDriver *)self sourceViewBounds];
      double v57 = v56;
      double v59 = v58;
      v60 = [(QLTransitionDriver *)self sourceView];
      objc_msgSend(v60, "setFrame:", v53, v55, v57, v59);

      v61 = self->_uncroppedView;
      v62 = [(QLTransitionDriver *)self sourceView];
      [(UIView *)v61 addSubview:v62];

      [(QLTransitionDriver *)self sourceViewCenter];
      -[UIView setCenter:](self->_uncroppedView, "setCenter:");
      [(QLTransitionDriver *)self sourceViewTransform];
      v63 = self->_uncroppedView;
      v222[0] = v222[3];
      v222[1] = v222[4];
      v222[2] = v222[5];
      [(UIView *)v63 setTransform:v222];
    }
    else
    {
      v70 = self->_uncroppedView;
      v71 = [(QLTransitionDriver *)self sourceView];
      [(UIView *)v70 addSubview:v71];

      [(QLTransitionDriver *)self sourceViewFrame];
      double v73 = v72;
      [(QLTransitionDriver *)self uncroppedFrame];
      double v75 = v73 + v74;
      [(QLTransitionDriver *)self sourceViewFrame];
      double v77 = v76;
      [(QLTransitionDriver *)self uncroppedFrame];
      double v79 = v77 + v78;
      [(QLTransitionDriver *)self uncroppedFrame];
      -[UIView setFrame:](self->_uncroppedView, "setFrame:", v75, v79);
      [(QLTransitionDriver *)self uncroppedFrame];
      double v81 = -v80;
      [(QLTransitionDriver *)self uncroppedFrame];
      double v83 = -v82;
      [(QLTransitionDriver *)self sourceViewFrame];
      double v85 = v84;
      double v87 = v86;
      v88 = [(QLTransitionDriver *)self sourceView];
      objc_msgSend(v88, "setFrame:", v81, v83, v85, v87);
    }
    [(UIView *)self->_uncroppedView frame];
  }
  CGFloat v184 = v66;
  CGFloat v192 = v67;
  double v89 = v68;
  double v197 = v69;
  v90 = [(QLTransitionDriver *)self transitionContainer];
  [v90 addSubview:self->_uncroppedView];

  v91 = [(QLTransitionDriver *)self transitionPreviewItem];
  if (v91)
  {
    v92 = [(QLTransitionDriver *)self transitionPreviewItem];
    objc_msgSend(v92, "previewSizeForItemViewControllerSize:", v11, v13);
    double v94 = v93;
    double v96 = v95;
  }
  else
  {
    [(QLTransitionDriver *)self transitionPreviewSize];
    double v94 = v97;
    double v96 = v98;
  }

  BOOL v99 = v94 == *MEMORY[0x263F001B0];
  BOOL v100 = v96 == *(double *)(MEMORY[0x263F001B0] + 8);
  double v194 = v13;
  if (v99 && v100) {
    double v101 = v13;
  }
  else {
    double v101 = v96;
  }
  if (v99 && v100) {
    double v102 = v11;
  }
  else {
    double v102 = v94;
  }
  v103 = [(QLTransitionDriver *)self transitionPreviewItem];
  int v104 = [v103 useFullPDFTransition];

  CGFloat v193 = v89;
  double v195 = v4;
  if (v104)
  {
    double v105 = (v102 + -24.0) / v89;
  }
  else
  {
    v106 = [(QLTransitionDriver *)self transitionContainer];
    [v106 frame];
    double v108 = v107;
    v109 = [(QLTransitionDriver *)self transitionContainer];
    [v109 frame];
    double v111 = v108 / v110;

    if (v89 / v197 > v111) {
      double v105 = v102 / v89;
    }
    else {
      double v105 = v101 / v197;
    }
  }
  v112 = [(QLTransitionDriver *)self gestureTracker];
  v113 = v112;
  CGFloat v183 = v11;
  if (v112)
  {
    [v112 trackedBounds];
    double v187 = v114;
    double v116 = v115;
    double v118 = v117;
    double v120 = v119;
    [v113 anchorPoint];
    double v122 = v121;
    double v124 = v123;
    [v113 trackedCenter];
    float64_t v126 = v125;
    float64_t v128 = v127;
    memset(&v220, 0, sizeof(v220));
    [v113 trackedTransform];
    v129 = [(QLTransitionDriver *)self sourceView];
    v130 = [v129 layer];
    [v130 anchorPoint];
    double v132 = v131;
    CGAffineTransform v219 = v220;
    v133.f64[1] = v220.ty;
    v133.f64[0] = v126;
    double v137 = QLConvertPointFromAnchorPointToNewAnchorPoint((float64x2_t *)&v219, v133, v128, v122, v124, v132, v134, v135, v136, v187, v116, v118, v120);
    double MidY = v138;
  }
  else
  {
    v231.origin.x = v191;
    v231.origin.y = v190;
    v231.size.width = v11;
    v231.size.height = v194;
    CGFloat MidX = CGRectGetMidX(v231);
    v232.size.width = v11;
    double v137 = MidX;
    v232.origin.x = v191;
    v232.origin.y = v190;
    v232.size.height = v194;
    double MidY = CGRectGetMidY(v232);
  }
  long long v186 = v19[1];
  long long v188 = *v19;
  *(_OWORD *)&v219.a = *v19;
  *(_OWORD *)&v219.c = v186;
  long long v185 = v19[2];
  *(_OWORD *)&v219.tx = v185;
  memset(&v220, 0, sizeof(v220));
  CGAffineTransformScale(&v220, &v219, v105, v105);
  if (v113)
  {
    [v113 trackedTransform];
    CGAffineTransform t1 = v220;
    CGAffineTransformConcat(&v219, &t1, &t2);
    CGAffineTransform v220 = v219;
  }
  memset(&v219, 0, sizeof(v219));
  if ([(QLTransitionDriver *)self isSourceViewTransformed])
  {
    [(QLTransitionDriver *)self sourceViewTransform];
  }
  else
  {
    *(_OWORD *)&v216.a = v188;
    *(_OWORD *)&v216.c = v186;
    *(_OWORD *)&v216.tx = v185;
  }
  CGAffineTransformScale(&v219, &v216, 1.0 / v105, 1.0 / v105);
  memset(&t1, 0, sizeof(t1));
  v141 = [(QLTransitionDriver *)self gestureTracker];
  if (v141)
  {
    v142 = [(QLTransitionDriver *)self gestureTracker];
    v143 = v142;
    if (v142) {
      [v142 trackedTransform];
    }
    else {
      memset(&t1, 0, sizeof(t1));
    }
  }
  else
  {
    *(_OWORD *)&t1.a = v188;
    *(_OWORD *)&t1.c = v186;
    *(_OWORD *)&t1.tx = v185;
  }

  v144 = [(QLTransitionDriver *)self transitionPreviewItem];
  int v145 = [v144 useFullPDFTransition];

  double v146 = 0.0;
  double v147 = 0.0;
  if (v145)
  {
    [(QLTransitionDriver *)self hostNavigationOffset];
    double v149 = v148 + 16.0;
    double v146 = v149 - (v194 - v197 * v105) * 0.5;
    double v147 = (v194 / v105 - v197) * 0.5 - v149 / v105;
  }
  if ([(QLTransitionDriver *)self presenting])
  {
    if ([(QLTransitionDriver *)self isSourceViewTransformed])
    {
      [(QLTransitionDriver *)self sourceViewCenter];
      double v151 = v150;
      double v153 = v152;
    }
    else
    {
      v233.origin.x = v184;
      v233.origin.y = v192;
      v233.size.width = v193;
      v233.size.height = v197;
      double v151 = CGRectGetMidX(v233);
      v234.origin.x = v184;
      v234.origin.y = v192;
      v234.size.width = v193;
      v234.size.height = v197;
      double v153 = CGRectGetMidY(v234);
    }
    v235.origin.x = v191;
    v235.origin.y = v190;
    v235.size.width = v183;
    v235.size.height = v194;
    CGFloat v182 = CGRectGetMidX(v235);
    v236.origin.x = v191;
    v236.origin.y = v190;
    v236.size.width = v183;
    v236.size.height = v194;
    double v156 = CGRectGetMidY(v236);
    if ([(QLTransitionDriver *)self isSourceViewTransformed])
    {
      [(QLTransitionDriver *)self sourceViewTransform];
    }
    else
    {
      *(_OWORD *)&v224.a = v188;
      *(_OWORD *)&v224.c = v186;
      *(_OWORD *)&v224.tx = v185;
    }
    double v181 = v146 + v156;
    *(CGAffineTransform *)&v223[3] = v220;
    v239.origin.x = v184;
    v239.origin.y = v192;
    v239.size.width = v193;
    v239.size.height = v197;
    double v137 = CGRectGetMidX(v239);
    v240.origin.x = v184;
    v240.origin.y = v192;
    v240.size.width = v193;
    v240.size.height = v197;
    double MidY = v147 + CGRectGetMidY(v240);
    v241.origin.x = v191;
    v241.origin.y = v190;
    v241.size.width = v183;
    v241.size.height = v194;
    CGFloat v189 = CGRectGetMidX(v241);
    v242.origin.x = v191;
    v242.origin.y = v190;
    v242.size.width = v183;
    v242.size.height = v194;
    double v157 = CGRectGetMidY(v242);
    p_CGAffineTransform t1 = &t1;
    v159 = &v219;
  }
  else
  {
    if ([(QLTransitionDriver *)self isSourceViewTransformed])
    {
      [(QLTransitionDriver *)self sourceViewCenter];
      double v181 = v155;
      CGFloat v182 = v154;
    }
    else
    {
      v237.origin.x = v184;
      v237.origin.y = v192;
      v237.size.width = v193;
      v237.size.height = v197;
      CGFloat v182 = CGRectGetMidX(v237);
      v238.origin.x = v184;
      v238.origin.y = v192;
      v238.size.width = v193;
      v238.size.height = v197;
      double v181 = CGRectGetMidY(v238);
    }
    CGAffineTransform v224 = v220;
    if ([(QLTransitionDriver *)self isSourceViewTransformed])
    {
      [(QLTransitionDriver *)self sourceViewTransform];
    }
    else
    {
      v223[3] = v188;
      v223[4] = v186;
      v223[5] = v185;
    }
    double v153 = MidY + v146;
    v243.origin.x = v184;
    v243.origin.y = v192;
    v243.size.width = v193;
    v243.size.height = v197;
    CGFloat v189 = CGRectGetMidX(v243);
    v244.origin.x = v184;
    v244.origin.y = v192;
    v244.size.width = v193;
    v244.size.height = v197;
    double v157 = v147 + CGRectGetMidY(v244);
    p_CGAffineTransform t1 = &v219;
    v159 = &t1;
    double v151 = v137;
  }
  long long v160 = *(_OWORD *)&v159->c;
  long long v228 = *(_OWORD *)&v159->a;
  long long v229 = v160;
  long long v230 = *(_OWORD *)&v159->tx;
  long long v161 = *(_OWORD *)&p_t1->c;
  long long v225 = *(_OWORD *)&p_t1->a;
  long long v226 = v161;
  long long v227 = *(_OWORD *)&p_t1->tx;
  CGAffineTransform v215 = v224;
  [(UIView *)self->_uncroppedView setTransform:&v215];
  [(UIView *)self->_uncroppedView setAlpha:v196];
  -[UIView setCenter:](self->_uncroppedView, "setCenter:", v151, v153);
  v162 = [(QLTransitionDriver *)self destinationView];
  v214[0] = v228;
  v214[1] = v229;
  v214[2] = v230;
  [v162 setTransform:v214];

  v163 = [(QLTransitionDriver *)self destinationView];
  [v163 setAlpha:v195];

  v164 = [(QLTransitionDriver *)self destinationView];
  objc_msgSend(v164, "setCenter:", v137, MidY);

  [(QLTransitionDriver *)self duration];
  double v166 = v165;
  v167 = (void *)MEMORY[0x263F82E00];
  BOOL v168 = [(QLTransitionDriver *)self presenting];
  v213[0] = MEMORY[0x263EF8330];
  v213[1] = 3221225472;
  v213[2] = __48__QLZoomTransitionDriver__performZoomTransition__block_invoke;
  v213[3] = &unk_2642F55B8;
  if (v168) {
    uint64_t v169 = 0x10000;
  }
  else {
    uint64_t v169 = 0x20000;
  }
  v213[4] = self;
  *(double *)&v213[5] = 1.0 - v196;
  [v167 animateWithDuration:v169 delay:v213 options:0 animations:v166 * 0.5 completion:0.0];
  v170 = (void *)MEMORY[0x263F82E00];
  BOOL v171 = [(QLTransitionDriver *)self presenting];
  v212[0] = MEMORY[0x263EF8330];
  v212[1] = 3221225472;
  v212[2] = __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_2;
  v212[3] = &unk_2642F55B8;
  if (v171) {
    uint64_t v172 = 0x20000;
  }
  else {
    uint64_t v172 = 0x10000;
  }
  v212[4] = self;
  *(double *)&v212[5] = 1.0 - v195;
  [v170 animateWithDuration:v172 delay:v212 options:0 animations:v166 * 0.5 completion:0.0];
  v173 = [(QLTransitionDriver *)self transitionContainer];
  v174 = [v173 layer];
  -[QLTransitionDriver setTransitionContainerMasksToBounds:](self, "setTransitionContainerMasksToBounds:", [v174 masksToBounds]);

  v175 = [(QLTransitionDriver *)self transitionContainer];
  v176 = [v175 layer];
  [v176 setMasksToBounds:1];

  if ([(QLTransitionDriver *)self presenting])
  {
    v205[0] = MEMORY[0x263EF8330];
    v205[1] = 3221225472;
    v205[2] = __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_3;
    v205[3] = &unk_2642F6920;
    v205[4] = self;
    *(CGFloat *)&v205[5] = v189;
    *(double *)&v205[6] = v157;
    long long v206 = v225;
    long long v207 = v226;
    long long v208 = v227;
    CGFloat v209 = v182;
    double v210 = v181;
    CGAffineTransform v211 = *(CGAffineTransform *)&v223[3];
    [MEMORY[0x263F82E00] _animateUsingSpringWithDuration:0 delay:v205 options:0 mass:v166 stiffness:0.0 damping:1.0 initialVelocity:350.0 animations:25.0691051 completion:0.0];
  }
  else
  {
    v177 = [(QLTransitionDriver *)self gestureTracker];
    if (v177)
    {
      v178 = [(QLTransitionDriver *)self gestureTracker];
      [v178 finalAnimationSpringDamping];
      double v180 = v179;
    }
    else
    {
      double v180 = 1.0;
    }

    v198[0] = MEMORY[0x263EF8330];
    v198[1] = 3221225472;
    v198[2] = __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_5;
    v198[3] = &unk_2642F6920;
    v198[4] = self;
    *(CGFloat *)&v198[5] = v189;
    *(double *)&v198[6] = v157;
    long long v199 = v225;
    long long v200 = v226;
    long long v201 = v227;
    CGFloat v202 = v182;
    double v203 = v181;
    CGAffineTransform v204 = *(CGAffineTransform *)&v223[3];
    [MEMORY[0x263F82E00] animateWithDuration:0 delay:v198 usingSpringWithDamping:0 initialSpringVelocity:v166 options:0.0 animations:v180 completion:0.0];
  }
}

uint64_t __48__QLZoomTransitionDriver__performZoomTransition__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 288) setAlpha:*(double *)(a1 + 40)];
}

void __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_2(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) destinationView];
  [v2 setAlpha:v1];
}

uint64_t __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_3(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F82E00];
  CAFrameRateRange v17 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_4;
  v8[3] = &unk_2642F6920;
  v8[4] = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v9 = *(_OWORD *)(a1 + 40);
  long long v10 = v3;
  long long v4 = *(_OWORD *)(a1 + 88);
  long long v11 = *(_OWORD *)(a1 + 72);
  long long v12 = v4;
  long long v5 = *(_OWORD *)(a1 + 104);
  long long v16 = *(_OWORD *)(a1 + 152);
  long long v15 = *(_OWORD *)(a1 + 136);
  long long v6 = *(_OWORD *)(a1 + 120);
  long long v13 = v5;
  long long v14 = v6;
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2097154, v8, *(double *)&v17.minimum, *(double *)&v17.maximum, *(double *)&v17.preferred);
}

uint64_t __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_4(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  long long v4 = [*(id *)(a1 + 32) destinationView];
  objc_msgSend(v4, "setCenter:", v2, v3);

  long long v5 = *(_OWORD *)(a1 + 72);
  v11[0] = *(_OWORD *)(a1 + 56);
  v11[1] = v5;
  v11[2] = *(_OWORD *)(a1 + 88);
  long long v6 = [*(id *)(a1 + 32) destinationView];
  [v6 setTransform:v11];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 288), "setCenter:", *(double *)(a1 + 104), *(double *)(a1 + 112));
  double v7 = *(void **)(*(void *)(a1 + 32) + 288);
  long long v8 = *(_OWORD *)(a1 + 136);
  v10[0] = *(_OWORD *)(a1 + 120);
  v10[1] = v8;
  v10[2] = *(_OWORD *)(a1 + 152);
  return [v7 setTransform:v10];
}

uint64_t __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_5(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x263F82E00];
  CAFrameRateRange v17 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_6;
  v8[3] = &unk_2642F6920;
  v8[4] = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v9 = *(_OWORD *)(a1 + 40);
  long long v10 = v3;
  long long v4 = *(_OWORD *)(a1 + 88);
  long long v11 = *(_OWORD *)(a1 + 72);
  long long v12 = v4;
  long long v5 = *(_OWORD *)(a1 + 104);
  long long v16 = *(_OWORD *)(a1 + 152);
  long long v15 = *(_OWORD *)(a1 + 136);
  long long v6 = *(_OWORD *)(a1 + 120);
  long long v13 = v5;
  long long v14 = v6;
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2097154, v8, *(double *)&v17.minimum, *(double *)&v17.maximum, *(double *)&v17.preferred);
}

uint64_t __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_6(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  long long v4 = [*(id *)(a1 + 32) destinationView];
  objc_msgSend(v4, "setCenter:", v2, v3);

  long long v5 = *(_OWORD *)(a1 + 72);
  v11[0] = *(_OWORD *)(a1 + 56);
  v11[1] = v5;
  v11[2] = *(_OWORD *)(a1 + 88);
  long long v6 = [*(id *)(a1 + 32) destinationView];
  [v6 setTransform:v11];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 288), "setCenter:", *(double *)(a1 + 104), *(double *)(a1 + 112));
  double v7 = *(void **)(*(void *)(a1 + 32) + 288);
  long long v8 = *(_OWORD *)(a1 + 136);
  v10[0] = *(_OWORD *)(a1 + 120);
  v10[1] = v8;
  v10[2] = *(_OWORD *)(a1 + 152);
  return [v7 setTransform:v10];
}

- (void)tearDown
{
  [(UIView *)self->_uncroppedView removeFromSuperview];
  BOOL v3 = [(QLTransitionDriver *)self transitionContainerMasksToBounds];
  long long v4 = [(QLTransitionDriver *)self transitionContainer];
  long long v5 = [v4 layer];
  [v5 setMasksToBounds:v3];

  [(QLTransitionDriver *)self transitionContainerOriginalFrame];
  double v7 = v6;
  [(QLTransitionDriver *)self transitionContainerOriginalFrame];
  double v9 = v8;
  long long v10 = [(QLTransitionDriver *)self transitionContainer];
  objc_msgSend(v10, "setBounds:", 0.0, 0.0, v7, v9);

  [(QLTransitionDriver *)self transitionContainerOriginalFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  id v19 = [(QLTransitionDriver *)self transitionContainer];
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);
}

+ (void)cropView:(id)a3 toAvoidNavigationOffset:(double)a4 presenting:(BOOL)a5 animationDuration:(double)a6
{
  BOOL v6 = a5;
  id v8 = a3;
  [v8 frame];
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  [v8 bounds];
  double v18 = v17;
  [v8 bounds];
  double v20 = v19 + a4;
  [v8 bounds];
  double v22 = v21;
  [v8 bounds];
  double v24 = v23;
  if (v6)
  {
    objc_msgSend(v8, "setBounds:", v18, v20, v22, v23);
    objc_msgSend(v8, "setFrame:", v18, v20, v22, v24);
  }
  v25 = (void *)MEMORY[0x263F82E00];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __88__QLZoomTransitionDriver_cropView_toAvoidNavigationOffset_presenting_animationDuration___block_invoke;
  v28[3] = &unk_2642F6948;
  BOOL v38 = v6;
  id v29 = v8;
  double v30 = v18;
  double v31 = v20;
  double v32 = v22;
  double v33 = v24;
  uint64_t v34 = v10;
  uint64_t v35 = v12;
  uint64_t v36 = v14;
  uint64_t v37 = v16;
  id v26 = v8;
  [v25 animateWithDuration:v28 animations:a6];
}

uint64_t __88__QLZoomTransitionDriver_cropView_toAvoidNavigationOffset_presenting_animationDuration___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 104);
  BOOL v3 = *(void **)(a1 + 32);
  if (v2) {
    long long v4 = (double *)(a1 + 96);
  }
  else {
    long long v4 = (double *)(a1 + 64);
  }
  if (v2) {
    long long v5 = (double *)(a1 + 72);
  }
  else {
    long long v5 = (double *)(a1 + 40);
  }
  if (v2) {
    BOOL v6 = (double *)(a1 + 80);
  }
  else {
    BOOL v6 = (double *)(a1 + 48);
  }
  if (v2) {
    double v7 = (double *)(a1 + 88);
  }
  else {
    double v7 = (double *)(a1 + 56);
  }
  objc_msgSend(v3, "setBounds:", *v5, *v6, *v7, *v4);
  double v8 = *v5;
  double v9 = *v6;
  double v10 = *v7;
  double v11 = *v4;
  uint64_t v12 = *(void **)(a1 + 32);

  return objc_msgSend(v12, "setFrame:", v8, v9, v10, v11);
}

- (void).cxx_destruct
{
}

@end
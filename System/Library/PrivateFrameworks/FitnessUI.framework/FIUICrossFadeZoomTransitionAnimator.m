@interface FIUICrossFadeZoomTransitionAnimator
- (BOOL)zoomingUp;
- (UIView)largeView;
- (UIView)smallView;
- (double)transitionDuration:(id)a3;
- (id)context;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)completeTransitionImmediately;
- (void)setContext:(id)a3;
- (void)setLargeView:(id)a3;
- (void)setSmallView:(id)a3;
- (void)setZoomingUp:(BOOL)a3;
@end

@implementation FIUICrossFadeZoomTransitionAnimator

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:*MEMORY[0x263F83C00]];
  v6 = [v4 viewControllerForKey:*MEMORY[0x263F83C10]];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke;
  aBlock[3] = &unk_2644A7B40;
  id v7 = v5;
  id v207 = v7;
  v208 = self;
  id v8 = v6;
  id v209 = v8;
  v9 = _Block_copy(aBlock);
  v202[0] = MEMORY[0x263EF8330];
  v202[1] = 3221225472;
  v202[2] = __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_2;
  v202[3] = &unk_2644A7B40;
  id v10 = v7;
  id v203 = v10;
  v204 = self;
  id v11 = v8;
  id v205 = v11;
  v159 = (void (**)(void))_Block_copy(v202);
  v198[0] = MEMORY[0x263EF8330];
  v198[1] = 3221225472;
  v198[2] = __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_3;
  v198[3] = &unk_2644A7B40;
  id v12 = v10;
  id v199 = v12;
  v200 = self;
  id v13 = v11;
  id v201 = v13;
  v160 = _Block_copy(v198);
  LODWORD(v11) = self->_zoomingUp;
  v14 = [v4 containerView];
  v157 = v12;
  v158 = v9;
  v156 = v13;
  if (v11)
  {
    v15 = [v12 view];
    [v14 addSubview:v15];

    v16 = [v4 containerView];
    v17 = [v13 view];
    [v16 addSubview:v17];

    v18 = [v12 view];
    [v18 setUserInteractionEnabled:0];

    v19 = [v13 view];
    [v19 setUserInteractionEnabled:0];

    v20 = [v12 view];
    [v20 frame];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    v29 = [v13 view];
    objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

    (*((void (**)(void *))v9 + 2))(v9);
    uint64_t v30 = [(UIView *)self->_smallView superview];
    uint64_t v31 = [(UIView *)self->_largeView superview];
    [(UIView *)self->_smallView frame];
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    [(UIView *)self->_largeView frame];
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    v48 = [v4 containerView];
    v155 = (void *)v30;
    objc_msgSend(v48, "convertRect:fromView:", v30, v33, v35, v37, v39);
    double v150 = v50;
    double v152 = v49;
    double v146 = v52;
    double v148 = v51;

    v53 = [v4 containerView];
    v154 = (void *)v31;
    objc_msgSend(v53, "convertRect:fromView:", v31, v41, v43, v45, v47);
    uint64_t v142 = v55;
    uint64_t v144 = v54;
    uint64_t v138 = v57;
    uint64_t v140 = v56;

    v58 = objc_msgSend(objc_alloc(MEMORY[0x263F82BE0]), "initWithFrame:", v33, v35, v37, v39);
    v59 = objc_msgSend(objc_alloc(MEMORY[0x263F82BE0]), "initWithFrame:", v41, v43, v45, v47);
    [v58 captureSnapshotOfView:self->_smallView withSnapshotType:1];
    [v59 captureSnapshotOfView:self->_largeView withSnapshotType:0];
    v60 = [v4 containerView];
    [v60 addSubview:v58];

    v61 = [v4 containerView];
    [v61 addSubview:v59];

    [(UIView *)self->_smallView setHidden:1];
    [(UIView *)self->_largeView setHidden:1];
    v62 = [v13 view];
    [v62 setAlpha:0.0];

    objc_msgSend(v58, "setFrame:", v152, v150, v148, v146);
    objc_msgSend(v59, "setFrame:", v152, v150, v148, v146);
    [v59 setAlpha:0.0];
    v63 = self->_smallView;
    v64 = self->_largeView;
    objc_initWeak(&location, self);
    v187[0] = MEMORY[0x263EF8330];
    v187[1] = 3221225472;
    v187[2] = __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_4;
    v187[3] = &unk_2644A8508;
    objc_copyWeak(&v196, &location);
    id v188 = v12;
    id v65 = v13;
    id v189 = v65;
    v66 = v63;
    v190 = v66;
    v67 = v64;
    v191 = v67;
    id v68 = v58;
    id v192 = v68;
    id v69 = v59;
    id v193 = v69;
    id v70 = v4;
    id v194 = v70;
    id v195 = v160;
    v71 = _Block_copy(v187);
    id animationCompletionBlock = self->_animationCompletionBlock;
    self->_id animationCompletionBlock = v71;

    v73 = (void *)MEMORY[0x263F82E00];
    [(FIUICrossFadeZoomTransitionAnimator *)self transitionDuration:v70];
    double v75 = v74;
    v179[0] = MEMORY[0x263EF8330];
    v179[1] = 3221225472;
    v179[2] = __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_5;
    v179[3] = &unk_2644A8530;
    id v180 = v65;
    id v76 = v68;
    id v181 = v76;
    uint64_t v183 = v144;
    uint64_t v184 = v142;
    uint64_t v185 = v140;
    uint64_t v186 = v138;
    id v77 = v69;
    id v182 = v77;
    [v73 animateWithDuration:v179 animations:self->_animationCompletionBlock completion:v75];

    objc_destroyWeak(&v196);
    objc_destroyWeak(&location);
  }
  else
  {
    v78 = [v13 view];
    [v14 addSubview:v78];

    v79 = [v4 containerView];
    v80 = [v12 view];
    [v79 addSubview:v80];

    v81 = [v12 view];
    [v81 setUserInteractionEnabled:0];

    v82 = [v13 view];
    [v82 setUserInteractionEnabled:0];

    v83 = [v12 view];
    [v83 frame];
    double v85 = v84;
    double v87 = v86;
    double v89 = v88;
    double v91 = v90;
    v92 = [v13 view];
    objc_msgSend(v92, "setFrame:", v85, v87, v89, v91);

    (*((void (**)(void *))v9 + 2))(v9);
    uint64_t v93 = [(UIView *)self->_smallView superview];
    uint64_t v94 = [(UIView *)self->_largeView superview];
    [(UIView *)self->_smallView frame];
    double v96 = v95;
    double v98 = v97;
    double v100 = v99;
    double v102 = v101;
    [(UIView *)self->_largeView frame];
    double v104 = v103;
    double v106 = v105;
    double v108 = v107;
    double v110 = v109;
    v111 = [v4 containerView];
    v154 = (void *)v94;
    objc_msgSend(v111, "convertRect:fromView:", v94, v104, v106, v108, v110);
    double v151 = v113;
    double v153 = v112;
    double v147 = v115;
    double v149 = v114;

    v116 = [v4 containerView];
    v155 = (void *)v93;
    objc_msgSend(v116, "convertRect:fromView:", v93, v96, v98, v100, v102);
    uint64_t v143 = v118;
    uint64_t v145 = v117;
    uint64_t v139 = v120;
    uint64_t v141 = v119;

    v121 = objc_msgSend(objc_alloc(MEMORY[0x263F82BE0]), "initWithFrame:", v96, v98, v100, v102);
    v122 = objc_msgSend(objc_alloc(MEMORY[0x263F82BE0]), "initWithFrame:", v104, v106, v108, v110);
    [v121 captureSnapshotOfView:self->_smallView withSnapshotType:0];
    [v122 captureSnapshotOfView:self->_largeView withSnapshotType:1];
    v123 = [v4 containerView];
    [v123 addSubview:v121];

    v124 = [v4 containerView];
    [v124 addSubview:v122];

    [(UIView *)self->_smallView setHidden:1];
    [(UIView *)self->_largeView setHidden:1];
    [v121 setAlpha:0.0];
    objc_msgSend(v121, "setFrame:", v153, v151, v149, v147);
    objc_msgSend(v122, "setFrame:", v153, v151, v149, v147);
    objc_initWeak(&location, self);
    v125 = self->_smallView;
    v126 = self->_largeView;
    v169[0] = MEMORY[0x263EF8330];
    v169[1] = 3221225472;
    v169[2] = __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_6;
    v169[3] = &unk_2644A8508;
    objc_copyWeak(&v178, &location);
    id v127 = v12;
    id v170 = v127;
    id v171 = v13;
    v128 = v125;
    v172 = v128;
    v129 = v126;
    v173 = v129;
    id v130 = v121;
    id v174 = v130;
    id v131 = v122;
    id v175 = v131;
    id v132 = v4;
    id v176 = v132;
    id v177 = v160;
    v133 = _Block_copy(v169);
    id v134 = self->_animationCompletionBlock;
    self->_id animationCompletionBlock = v133;

    v135 = (void *)MEMORY[0x263F82E00];
    [(FIUICrossFadeZoomTransitionAnimator *)self transitionDuration:v132];
    double v137 = v136;
    v161[0] = MEMORY[0x263EF8330];
    v161[1] = 3221225472;
    v161[2] = __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_7;
    v161[3] = &unk_2644A8530;
    id v162 = v127;
    id v76 = v130;
    id v163 = v76;
    uint64_t v165 = v145;
    uint64_t v166 = v143;
    uint64_t v167 = v141;
    uint64_t v168 = v139;
    id v77 = v131;
    id v164 = v77;
    [v135 animateWithDuration:v161 animations:self->_animationCompletionBlock completion:v137];
    v159[2]();

    objc_destroyWeak(&v178);
    objc_destroyWeak(&location);
  }
}

uint64_t __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) zoomTransitionAnimatorWillBeginTransition:*(void *)(a1 + 40)];
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    v3 = *(void **)(a1 + 48);
    return [v3 zoomTransitionAnimatorWillBeginTransition:v4];
  }
  return result;
}

uint64_t __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) zoomTransitionAnimatorDidBeginTransition:*(void *)(a1 + 40)];
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    v3 = *(void **)(a1 + 48);
    return [v3 zoomTransitionAnimatorDidBeginTransition:v4];
  }
  return result;
}

uint64_t __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) zoomTransitionAnimatorDidCompleteTransition:*(void *)(a1 + 40)];
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    v3 = *(void **)(a1 + 48);
    return [v3 zoomTransitionAnimatorDidCompleteTransition:v4];
  }
  return result;
}

void __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_4(uint64_t a1, uint64_t a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  if (WeakRetained && !WeakRetained[16])
  {
    WeakRetained[16] = 1;
    id v8 = WeakRetained;
    v5 = [*(id *)(a1 + 32) view];
    [v5 setUserInteractionEnabled:1];

    v6 = [*(id *)(a1 + 40) view];
    [v6 setUserInteractionEnabled:1];

    [*(id *)(a1 + 48) setHidden:0];
    [*(id *)(a1 + 56) setHidden:0];
    [*(id *)(a1 + 64) removeFromSuperview];
    [*(id *)(a1 + 72) removeFromSuperview];
    [*(id *)(a1 + 80) completeTransition:a2];
    id v7 = (void *)v8[1];
    v8[1] = 0;

    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    WeakRetained = v8;
  }
}

uint64_t __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:1.0];

  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  [*(id *)(a1 + 40) setAlpha:0.0];
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v3 = *(void **)(a1 + 48);
  return [v3 setAlpha:1.0];
}

void __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_6(uint64_t a1, uint64_t a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  if (WeakRetained && !WeakRetained[16])
  {
    WeakRetained[16] = 1;
    id v8 = WeakRetained;
    v5 = [*(id *)(a1 + 32) view];
    [v5 setUserInteractionEnabled:1];

    v6 = [*(id *)(a1 + 40) view];
    [v6 setUserInteractionEnabled:1];

    [*(id *)(a1 + 48) setHidden:0];
    [*(id *)(a1 + 56) setHidden:0];
    [*(id *)(a1 + 64) removeFromSuperview];
    [*(id *)(a1 + 72) removeFromSuperview];
    [*(id *)(a1 + 80) completeTransition:a2];
    id v7 = (void *)v8[1];
    v8[1] = 0;

    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    WeakRetained = v8;
  }
}

uint64_t __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_7(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:0.0];

  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  [*(id *)(a1 + 40) setAlpha:1.0];
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v3 = *(void **)(a1 + 48);
  return [v3 setAlpha:0.0];
}

- (void)animationEnded:(BOOL)a3
{
  self->_transitionCompleted = 1;
}

- (void)completeTransitionImmediately
{
  id animationCompletionBlock = (void (**)(id, uint64_t))self->_animationCompletionBlock;
  if (animationCompletionBlock)
  {
    animationCompletionBlock[2](animationCompletionBlock, 1);
    id v4 = self->_animationCompletionBlock;
    self->_id animationCompletionBlock = 0;
  }
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (UIView)smallView
{
  return self->_smallView;
}

- (void)setSmallView:(id)a3
{
}

- (UIView)largeView
{
  return self->_largeView;
}

- (void)setLargeView:(id)a3
{
}

- (BOOL)zoomingUp
{
  return self->_zoomingUp;
}

- (void)setZoomingUp:(BOOL)a3
{
  self->_zoomingUp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeView, 0);
  objc_storeStrong((id *)&self->_smallView, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong(&self->_animationCompletionBlock, 0);
}

@end
@interface CNAvatarCardTransition
- (BOOL)interactive;
- (BOOL)reversed;
- (UIPanGestureRecognizer)gestureRecognizer;
- (UIView)presentedView;
- (UIViewControllerContextTransitioning)context;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setContext:(id)a3;
- (void)setGestureRecognizer:(id)a3;
- (void)setPresentedView:(id)a3;
- (void)setReversed:(BOOL)a3;
@end

@implementation CNAvatarCardTransition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedView, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (void)setPresentedView:(id)a3
{
}

- (UIView)presentedView
{
  return self->_presentedView;
}

- (void)setContext:(id)a3
{
}

- (UIViewControllerContextTransitioning)context
{
  return self->_context;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setReversed:(BOOL)a3
{
  self->_reversed = a3;
}

- (BOOL)reversed
{
  return self->_reversed;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 containerView];
  uint64_t v6 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  v171 = v4;
  uint64_t v7 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  v177 = (void *)v7;
  v178 = (void *)v6;
  if ([(CNAvatarCardTransition *)self reversed]) {
    v8 = (void *)v6;
  }
  else {
    v8 = (void *)v7;
  }
  id v9 = v8;
  v10 = [v9 presentationController];
  v175 = [v10 sourceViewController];
  uint64_t v11 = [v175 _cardViewControllerTransitioning];
  if ([(CNAvatarCardTransition *)self reversed]) {
    v12 = v9;
  }
  else {
    v12 = (void *)v11;
  }
  id v13 = v12;
  if ([(CNAvatarCardTransition *)self reversed]) {
    v14 = (void *)v11;
  }
  else {
    v14 = v9;
  }
  id v15 = v14;
  v16 = [v10 presentedView];
  v17 = [v10 vibrancyView];
  [v10 frameOfPresentedViewInContainerView];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  if (![(CNAvatarCardTransition *)self reversed])
  {
    [v5 addSubview:v16];
    v26 = [v10 dimmingView];
    [v26 setAlpha:0.0];

    objc_msgSend(v16, "setFrame:", v19, v21, v23, v25);
    [v5 layoutIfNeeded];
  }
  uint64_t v27 = *MEMORY[0x1E4F1DB28];
  uint64_t v28 = *(void *)(MEMORY[0x1E4F1DB28] + 8);
  uint64_t v29 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
  uint64_t v30 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
  if (v13) {
    BOOL v31 = v15 == 0;
  }
  else {
    BOOL v31 = 1;
  }
  v173 = v13;
  v180 = v17;
  v170 = v16;
  if (!v31)
  {
    v32 = [v13 transitioningImage];
    [v13 transitioningImageFrame];
    double v34 = v33;
    uint64_t v165 = v30;
    uint64_t v167 = v29;
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    v41 = [v13 transitioningView];
    objc_msgSend(v5, "convertRect:fromView:", v41, v34, v36, v38, v40);
    double v160 = v43;
    double v162 = v42;
    double v45 = v44;
    double v47 = v46;

    v169 = [v15 transitioningImage];
    [v15 transitioningImageFrame];
    double v49 = v48;
    double v51 = v50;
    uint64_t v52 = v28;
    double v54 = v53;
    uint64_t v55 = v27;
    double v57 = v56;
    v58 = [v15 transitioningView];
    double v59 = v54;
    uint64_t v28 = v52;
    uint64_t v29 = v167;
    double v60 = v57;
    uint64_t v27 = v55;
    objc_msgSend(v5, "convertRect:fromView:", v58, v49, v51, v59, v60);
    uint64_t v164 = v61;
    uint64_t v63 = v62;
    uint64_t v65 = v64;
    uint64_t v67 = v66;

    v68 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v32];
    [v5 addSubview:v68];
    double v69 = v45;
    uint64_t v30 = v165;
    double v70 = v47;
    uint64_t v71 = v67;
    objc_msgSend(v68, "setFrame:", v162, v160, v69, v70);
    [v13 setTransitioningImageVisible:0];
    v72 = v15;
    [v15 setTransitioningImageVisible:0];
    [v10 setOriginalTransitioning:v13];

    v17 = v180;
    v156 = 0;
LABEL_19:
    uint64_t v73 = v30;
    uint64_t v159 = v28;
    uint64_t v161 = v29;
    uint64_t v158 = v27;
    goto LABEL_21;
  }
  if ([(CNAvatarCardTransition *)self reversed])
  {
    v72 = v15;
    v169 = 0;
    v68 = 0;
    v156 = 0;
    uint64_t v71 = v30;
    uint64_t v65 = v29;
    uint64_t v63 = v28;
    uint64_t v164 = v27;
    goto LABEL_19;
  }
  v74 = [v10 sourceView];
  [v10 sourceRect];
  v75 = objc_msgSend(v74, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0);

  [v10 sourceRect];
  double v77 = v76;
  uint64_t v65 = v29;
  double v79 = v78;
  uint64_t v80 = v30;
  double v82 = v81;
  double v84 = v83;
  v85 = [v10 sourceView];
  double v86 = v79;
  uint64_t v29 = v65;
  double v87 = v82;
  uint64_t v30 = v80;
  objc_msgSend(v17, "convertRect:fromView:", v85, v77, v86, v87, v84);
  objc_msgSend(v75, "setFrame:");

  v88 = [v15 transitioningView];
  v72 = v15;
  [v15 transitioningFrame];
  objc_msgSend(v88, "convertRect:toView:", v17);
  uint64_t v158 = v89;
  uint64_t v159 = v90;
  uint64_t v161 = v91;
  uint64_t v73 = v92;

  v156 = v75;
  [v17 addSubview:v75];
  v169 = 0;
  v68 = 0;
  uint64_t v71 = v80;
  uint64_t v63 = v28;
  uint64_t v164 = v27;
LABEL_21:
  v179 = v5;
  v176 = v9;
  v174 = (void *)v11;
  uint64_t v166 = v63;
  uint64_t v168 = v65;
  uint64_t v163 = v73;
  if ([(CNAvatarCardTransition *)self reversed])
  {
    v93 = 0;
    v94 = 0;
    uint64_t v154 = v29;
    uint64_t v155 = v30;
    uint64_t v152 = v27;
    uint64_t v153 = v28;
  }
  else
  {
    v95 = [v72 transitioningView];
    [v72 transitioningContentFrame];
    double v97 = v96;
    double v99 = v98;
    double v101 = v100;
    uint64_t v151 = v71;
    double v103 = v102;
    v94 = objc_msgSend(v95, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1);
    [v10 sourceRect];
    double v105 = v104;
    double v107 = v106;
    double v109 = v108;
    double v111 = v110;
    v112 = [v10 sourceView];
    objc_msgSend(v17, "convertRect:fromView:", v112, v105, v107, v109, v111);
    objc_msgSend(v94, "setFrame:");

    [v94 setAlpha:0.0];
    objc_msgSend(v17, "convertRect:fromView:", v95, v97, v99, v101, v103);
    uint64_t v152 = v113;
    uint64_t v153 = v114;
    uint64_t v154 = v115;
    uint64_t v155 = v116;
    [v17 addSubview:v94];
    [v72 transitioningFrame];
    double v118 = v117;
    double v120 = v119;
    double v122 = v121;
    double v124 = v123;
    v93 = objc_msgSend(v95, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1);
    [v10 sourceRect];
    double v126 = v125;
    double v128 = v127;
    double v130 = v129;
    double v132 = v131;
    v133 = [v10 sourceView];
    double v134 = v126;
    uint64_t v71 = v151;
    objc_msgSend(v17, "convertRect:fromView:", v133, v134, v128, v130, v132);
    objc_msgSend(v93, "setFrame:");

    [v93 setAlpha:0.0];
    objc_msgSend(v17, "convertRect:fromView:", v95, v118, v120, v122, v124);
    uint64_t v27 = v135;
    uint64_t v28 = v136;
    uint64_t v29 = v137;
    uint64_t v30 = v138;
    [v17 addSubview:v93];
  }
  v139 = v156;
  v157 = (void *)MEMORY[0x1E4FB1EB0];
  [(CNAvatarCardTransition *)self transitionDuration:v171];
  double v141 = v140;
  if ([(CNAvatarCardTransition *)self reversed]) {
    double v142 = 1.0;
  }
  else {
    double v142 = 0.8;
  }
  v191[0] = MEMORY[0x1E4F143A8];
  v191[1] = 3221225472;
  v191[2] = __44__CNAvatarCardTransition_animateTransition___block_invoke;
  v191[3] = &unk_1E549BE68;
  uint64_t v200 = v164;
  uint64_t v201 = v166;
  uint64_t v202 = v168;
  uint64_t v203 = v71;
  id v192 = v68;
  id v193 = v169;
  id v194 = v139;
  uint64_t v204 = v158;
  uint64_t v205 = v159;
  uint64_t v206 = v161;
  uint64_t v207 = v163;
  id v195 = v94;
  uint64_t v208 = v152;
  uint64_t v209 = v153;
  uint64_t v210 = v154;
  uint64_t v211 = v155;
  uint64_t v212 = v27;
  uint64_t v213 = v28;
  uint64_t v214 = v29;
  uint64_t v215 = v30;
  id v196 = v93;
  v197 = self;
  id v198 = v10;
  id v199 = v170;
  v181[0] = MEMORY[0x1E4F143A8];
  v181[1] = 3221225472;
  v181[2] = __44__CNAvatarCardTransition_animateTransition___block_invoke_2;
  v181[3] = &unk_1E549BEB8;
  id v182 = v192;
  id v183 = v72;
  v184 = self;
  id v185 = v198;
  id v186 = v194;
  id v187 = v195;
  id v188 = v196;
  id v189 = v199;
  id v190 = v171;
  id v143 = v171;
  id v144 = v199;
  id v145 = v196;
  id v172 = v195;
  id v146 = v194;
  id v147 = v198;
  id v148 = v72;
  id v149 = v192;
  id v150 = v169;
  [v157 animateWithDuration:0 delay:v191 usingSpringWithDamping:v181 initialSpringVelocity:v141 options:0.0 animations:v142 completion:0.0];
}

void __44__CNAvatarCardTransition_animateTransition___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "setFrame:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
    [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
  }
  v3 = *(void **)(a1 + 48);
  if (v3)
  {
    objc_msgSend(v3, "setFrame:", *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152));
    [*(id *)(a1 + 48) setAlpha:0.0];
  }
  id v4 = *(void **)(a1 + 56);
  if (v4)
  {
    [v4 setAlpha:1.0];
    objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(a1 + 160), *(double *)(a1 + 168), *(double *)(a1 + 176), *(double *)(a1 + 184));
    [*(id *)(a1 + 64) setAlpha:1.0];
    objc_msgSend(*(id *)(a1 + 64), "setFrame:", *(double *)(a1 + 192), *(double *)(a1 + 200), *(double *)(a1 + 208), *(double *)(a1 + 216));
  }
  if ([*(id *)(a1 + 72) reversed])
  {
    v5 = *(void **)(a1 + 88);
    [v5 setAlpha:0.0];
  }
  else
  {
    id v6 = [*(id *)(a1 + 80) dimmingView];
    [v6 setAlpha:1.0];
  }
}

void __44__CNAvatarCardTransition_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __44__CNAvatarCardTransition_animateTransition___block_invoke_3;
  uint64_t v11 = &unk_1E549BE90;
  id v12 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void **)(a1 + 56);
  id v13 = v5;
  uint64_t v14 = v6;
  id v15 = v7;
  id v16 = *(id *)(a1 + 64);
  id v17 = *(id *)(a1 + 72);
  id v18 = *(id *)(a1 + 80);
  id v19 = *(id *)(a1 + 88);
  [v4 performWithoutAnimation:&v8];
  objc_msgSend(*(id *)(a1 + 96), "completeTransition:", a2, v8, v9, v10, v11);
}

uint64_t __44__CNAvatarCardTransition_animateTransition___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 removeFromSuperview];
    [*(id *)(a1 + 40) setTransitioningImageVisible:1];
  }
  if (([*(id *)(a1 + 48) reversed] & 1) == 0)
  {
    v3 = [*(id *)(a1 + 56) cardView];
    [v3 setAlpha:1.0];
  }
  [*(id *)(a1 + 64) removeFromSuperview];
  [*(id *)(a1 + 72) removeFromSuperview];
  [*(id *)(a1 + 80) removeFromSuperview];
  id v4 = *(void **)(a1 + 88);

  return [v4 setAlpha:1.0];
}

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

@end
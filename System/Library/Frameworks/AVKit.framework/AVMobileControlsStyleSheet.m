@interface AVMobileControlsStyleSheet
- (AVMobileControlsStyleSheet)initWithTraitCollection:(id)a3;
- (UIEdgeInsets)embeddedInlineInsets;
- (UIEdgeInsets)landscapeFullscreenInsets;
- (UIEdgeInsets)playbackControlsViewLayoutMarginsForView:(id)a3 keyboardHeight:(double)a4 isFullScreen:(BOOL)a5;
- (UIEdgeInsets)portraitFullscreenInsets;
- (UITraitCollection)traitCollection;
- (double)standardPaddingFullScreen;
- (double)standardPaddingInline;
- (void)setTraitCollection:(id)a3;
@end

@implementation AVMobileControlsStyleSheet

- (void).cxx_destruct
{
}

- (UIEdgeInsets)embeddedInlineInsets
{
  double top = self->_embeddedInlineInsets.top;
  double left = self->_embeddedInlineInsets.left;
  double bottom = self->_embeddedInlineInsets.bottom;
  double right = self->_embeddedInlineInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTraitCollection:(id)a3
{
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (UIEdgeInsets)playbackControlsViewLayoutMarginsForView:(id)a3 keyboardHeight:(double)a4 isFullScreen:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = [(AVMobileControlsStyleSheet *)self traitCollection];
  [(AVMobileControlsStyleSheet *)self standardPaddingFullScreen];
  double v11 = v10;
  uint64_t v12 = [v9 userInterfaceIdiom];
  [v8 safeAreaInsets];
  double v14 = v13;
  double v100 = v15;
  double v101 = v16;
  double v99 = v17;
  v18 = [v8 window];

  double v102 = v14;
  if (v18)
  {
    double v97 = a4;
    double v98 = v11;
    v19 = [v8 window];
    v20 = [v19 windowScene];
    v21 = [v20 statusBarManager];
    [v21 statusBarFrame];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double Width = v28;

    v103.origin.CGFloat x = v23;
    v103.origin.CGFloat y = v25;
    v103.size.width = v27;
    v103.size.height = Width;
    double Height = CGRectGetHeight(v103);
    v104.origin.CGFloat x = v23;
    v104.origin.CGFloat y = v25;
    v104.size.width = v27;
    v104.size.height = Width;
    if (Height > CGRectGetWidth(v104))
    {
      v105.origin.CGFloat x = v23;
      v105.origin.CGFloat y = v25;
      v105.size.width = v27;
      v105.size.height = Width;
      CGFloat v31 = CGRectGetHeight(v105);
      v106.origin.CGFloat x = v23;
      v106.origin.CGFloat y = v25;
      v106.size.width = v27;
      v106.size.height = Width;
      double Width = CGRectGetWidth(v106);
      double v27 = v31;
    }
    v32 = [v8 window];
    objc_msgSend(v8, "convertRect:fromView:", v32, v23, v25, v27, Width);
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    [v8 bounds];
    v115.origin.CGFloat x = v41;
    v115.origin.CGFloat y = v42;
    v115.size.width = v43;
    v115.size.height = v44;
    v107.origin.CGFloat x = v34;
    v107.origin.CGFloat y = v36;
    v107.size.width = v38;
    v107.size.height = v40;
    CGRect v108 = CGRectIntersection(v107, v115);
    CGFloat x = v108.origin.x;
    CGFloat y = v108.origin.y;
    CGFloat v47 = v108.size.width;
    CGFloat v48 = v108.size.height;

    v109.origin.CGFloat x = x;
    v109.origin.CGFloat y = y;
    v109.size.width = v47;
    v109.size.height = v48;
    double v49 = CGRectGetHeight(v109);
    if (v49 < 0.0) {
      double v49 = 0.0;
    }
    double v96 = v49;
    v18 = [v8 window];
    [v8 bounds];
    objc_msgSend(v18, "convertRect:fromView:", v8);
    CGFloat v51 = v50;
    CGFloat v53 = v52;
    CGFloat v55 = v54;
    CGFloat v57 = v56;

    v110.origin.CGFloat x = v51;
    v110.origin.CGFloat y = v53;
    v110.size.width = v55;
    v110.size.height = v57;
    double v14 = v102;
    double v58 = v102 + CGRectGetMinY(v110);
    v111.origin.CGFloat x = v23;
    v111.origin.CGFloat y = v25;
    v111.size.width = v27;
    v111.size.height = Width;
    double v11 = v98;
    LODWORD(v18) = v58 > v98 * 0.5 + CGRectGetMaxY(v111);
    a4 = v97;
    if (!v5) {
      goto LABEL_24;
    }
  }
  else
  {
    double v96 = 0.0;
    if (!v5)
    {
LABEL_24:
      v78 = [v8 window];
      v79 = [v78 screen];

      [(AVMobileControlsStyleSheet *)self embeddedInlineInsets];
      v80 = [MEMORY[0x1E4FB16C8] currentDevice];
      [v80 orientation];

      [v79 _peripheryInsets];
      UIEdgeInsetsAdd();
      double v82 = v81;
      double v68 = v83;
      double v85 = v84;
      double v70 = v86;
      int v87 = objc_msgSend(v8, "avkit_isDescendantOfNonPagingScrollView");
      double v88 = -0.0;
      double v89 = v101;
      if (v87) {
        double v89 = -0.0;
      }
      double v69 = v85 + v89;
      if (!v87) {
        double v88 = v102;
      }
      double v66 = v82 + v88;

      goto LABEL_54;
    }
  }
  if (v12 == 5) {
    goto LABEL_24;
  }
  double v59 = v11 + a4;
  if (a4 >= 100.0) {
    double v59 = 0.0;
  }
  if (v101 >= v59) {
    double v60 = v101;
  }
  else {
    double v60 = v59;
  }
  [v9 displayCornerRadius];
  if (v61 <= 0.0)
  {
    double v90 = v11 * 0.5 + v96;
    if (v90 < v11) {
      double v90 = v11;
    }
    if (v18) {
      double v66 = v11 * 0.5 + v14;
    }
    else {
      double v66 = v90;
    }
    double v69 = v11 + v60;
    double v70 = v11;
    double v68 = v11;
  }
  else
  {
    v62 = (id *)MEMORY[0x1E4FB2608];
    if ([(id)*MEMORY[0x1E4FB2608] _isClassic] && objc_msgSend(*v62, "_classicMode") != 5)
    {
      [v8 bounds];
      double v91 = CGRectGetWidth(v112);
      [v8 bounds];
      if (v91 <= CGRectGetHeight(v113)) {
        double v70 = v11;
      }
      else {
        double v70 = v11 * 1.5;
      }
      double v69 = v70;
      double v68 = v70;
      double v66 = v70;
    }
    else
    {
      objc_msgSend(v8, "avkit_overrideLayoutMarginsForCounterRotation");
      double v66 = v63;
      double v68 = v67;
      double v69 = v64;
      double v70 = v65;
      if (v67 == 2.22507386e-308 && v63 == 2.22507386e-308 && v65 == 2.22507386e-308 && v64 == 2.22507386e-308)
      {
        v71 = [v8 window];
        v72 = [v71 windowScene];
        unint64_t v73 = [v72 interfaceOrientation] - 3;

        if (v73 > 1) {
          [(AVMobileControlsStyleSheet *)self portraitFullscreenInsets];
        }
        else {
          [(AVMobileControlsStyleSheet *)self landscapeFullscreenInsets];
        }
        if (v14 >= self->_statusBarHeight) {
          double v74 = v11 + v14;
        }
        if (v74 >= v14) {
          double v66 = v74;
        }
        else {
          double v66 = v14;
        }
        if (v75 >= v100) {
          double v68 = v75;
        }
        else {
          double v68 = v100;
        }
        if (v77 >= v99) {
          double v70 = v77;
        }
        else {
          double v70 = v99;
        }
        if (v76 >= v60) {
          double v69 = v76;
        }
        else {
          double v69 = v60;
        }
      }
    }
  }
LABEL_54:

  double v92 = v66;
  double v93 = v68;
  double v94 = v69;
  double v95 = v70;
  result.double right = v95;
  result.double bottom = v94;
  result.double left = v93;
  result.double top = v92;
  return result;
}

- (double)standardPaddingInline
{
  return 0.0;
}

- (double)standardPaddingFullScreen
{
  return 0.0;
}

- (UIEdgeInsets)portraitFullscreenInsets
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (UIEdgeInsets)landscapeFullscreenInsets
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (AVMobileControlsStyleSheet)initWithTraitCollection:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVMobileControlsStyleSheet;
  v6 = [(AVMobileControlsStyleSheet *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_traitCollection, a3);
    if ([v5 userInterfaceIdiom])
    {
      uint64_t v8 = [v5 userInterfaceIdiom];
      double v9 = 25.0;
      if (v8 != 1) {
        goto LABEL_7;
      }
    }
    else
    {
      double v9 = 44.0;
    }
    v7->_statusBardouble Height = v9;
  }
LABEL_7:

  return v7;
}

@end
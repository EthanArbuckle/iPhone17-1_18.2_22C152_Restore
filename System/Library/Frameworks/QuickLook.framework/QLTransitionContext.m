@interface QLTransitionContext
+ (BOOL)supportsSecureCoding;
+ (BOOL)useImageTransitionForPreviewController:(id)a3;
+ (BOOL)useViewTransitionForPreviewController:(id)a3;
+ (BOOL)useZoomTransitionForPreviewController:(id)a3;
+ (id)firstChildNavigationControllerFromViewController:(id)a3;
- (BOOL)isSourceTransformed;
- (BOOL)usingViewForZoomTransition;
- (CGAffineTransform)sourceTransform;
- (CGPoint)sourceCenter;
- (CGRect)sourceBounds;
- (CGRect)sourceFrame;
- (CGRect)uncroppedFrame;
- (CGSize)previewItemSize;
- (QLTransitionContext)initWithCoder:(id)a3;
- (QLTransitionContext)initWithQLPreviewController:(id)a3 containerView:(id)a4 toViewController:(id)a5;
- (UIView)sourceView;
- (UIView)sourceViewSnapshot;
- (double)hostNavigationOffset;
- (double)topNavigationOffset;
- (id)sourceViewSnapshotImage;
- (void)_snapshotSourceViewIfNeeded;
- (void)encodeWithCoder:(id)a3;
- (void)prepareContextToSend;
- (void)setHostNavigationOffset:(double)a3;
- (void)setIsSourceTransformed:(BOOL)a3;
- (void)setPreviewItemSize:(CGSize)a3;
- (void)setSourceBounds:(CGRect)a3;
- (void)setSourceCenter:(CGPoint)a3;
- (void)setSourceFrame:(CGRect)a3;
- (void)setSourceTransform:(CGAffineTransform *)a3;
- (void)setSourceView:(id)a3;
- (void)setSourceViewSnapshot:(id)a3;
- (void)setTopNavigationOffset:(double)a3;
- (void)setUncroppedFrame:(CGRect)a3;
- (void)setUpTransitionSourceView;
- (void)setUsingViewForZoomTransition:(BOOL)a3;
@end

@implementation QLTransitionContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)prepareContextToSend
{
  if (!self->_contextPreparedToSend)
  {
    self->_contextPreparedToSend = 1;
    [(QLTransitionContext *)self _snapshotSourceViewIfNeeded];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(QLTransitionContext *)self prepareContextToSend];
  double topNavigationOffset = self->_topNavigationOffset;
  *(float *)&double topNavigationOffset = topNavigationOffset;
  [v4 encodeFloat:@"topNavigationOffset" forKey:topNavigationOffset];
  double hostNavigationOffset = self->_hostNavigationOffset;
  *(float *)&double hostNavigationOffset = hostNavigationOffset;
  [v4 encodeFloat:@"hostNavigationOffset" forKey:hostNavigationOffset];
  objc_msgSend(v4, "encodeCGRect:forKey:", @"sourceFrame", self->_sourceFrame.origin.x, self->_sourceFrame.origin.y, self->_sourceFrame.size.width, self->_sourceFrame.size.height);
  objc_msgSend(v4, "encodeCGRect:forKey:", @"uncroppedFrame", self->_uncroppedFrame.origin.x, self->_uncroppedFrame.origin.y, self->_uncroppedFrame.size.width, self->_uncroppedFrame.size.height);
  v7 = [(QLTransitionContext *)self sourceViewSnapshotImage];
  [v4 encodeObject:v7 forKey:@"sourceViewSnapshotImage"];

  [(QLTransitionContext *)self previewItemSize];
  objc_msgSend(v4, "encodeCGSize:forKey:", @"previewItemSize");
  objc_msgSend(v4, "encodeBool:forKey:", -[QLTransitionContext isSourceTransformed](self, "isSourceTransformed"), @"isSourceTransformed");
  objc_msgSend(v4, "encodeCGRect:forKey:", @"sourceBounds", self->_sourceBounds.origin.x, self->_sourceBounds.origin.y, self->_sourceBounds.size.width, self->_sourceBounds.size.height);
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"sourceCenter", self->_sourceCenter.x, self->_sourceCenter.y);
  long long v8 = *(_OWORD *)&self->_sourceTransform.c;
  v9[0] = *(_OWORD *)&self->_sourceTransform.a;
  v9[1] = v8;
  v9[2] = *(_OWORD *)&self->_sourceTransform.tx;
  [v4 encodeCGAffineTransform:v9 forKey:@"sourceTransform"];
}

- (QLTransitionContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)QLTransitionContext;
  v5 = [(QLTransitionContext *)&v35 init];
  if (v5)
  {
    [v4 decodeCGRectForKey:@"sourceFrame"];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceViewSnapshotImage"];
    sourceViewSnapshotImage = v5->_sourceViewSnapshotImage;
    v5->_sourceViewSnapshotImage = (UIImage *)v14;

    [v4 decodeCGRectForKey:@"uncroppedFrame"];
    v5->_uncroppedFrame.origin.x = v16;
    v5->_uncroppedFrame.origin.y = v17;
    v5->_uncroppedFrame.size.width = v18;
    v5->_uncroppedFrame.size.height = v19;
    v5->_sourceFrame.origin.x = v7;
    v5->_sourceFrame.origin.y = v9;
    v5->_sourceFrame.size.width = v11;
    v5->_sourceFrame.size.height = v13;
    [v4 decodeFloatForKey:@"topNavigationOffset"];
    v5->_double topNavigationOffset = v20;
    [v4 decodeFloatForKey:@"hostNavigationOffset"];
    v5->_double hostNavigationOffset = v21;
    [v4 decodeCGSizeForKey:@"previewItemSize"];
    v5->_previewItemSize.width = v22;
    v5->_previewItemSize.height = v23;
    v5->_isSourceTransformed = [v4 decodeBoolForKey:@"isSourceTransformed"];
    [v4 decodeCGRectForKey:@"sourceBounds"];
    v5->_sourceBounds.origin.x = v24;
    v5->_sourceBounds.origin.y = v25;
    v5->_sourceBounds.size.width = v26;
    v5->_sourceBounds.size.height = v27;
    [v4 decodeCGPointForKey:@"sourceCenter"];
    v5->_sourceCenter.x = v28;
    v5->_sourceCenter.y = v29;
    if (v4)
    {
      [v4 decodeCGAffineTransformForKey:@"sourceTransform"];
    }
    else
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v32 = 0u;
    }
    *(_OWORD *)&v5->_sourceTransform.a = v32;
    *(_OWORD *)&v5->_sourceTransform.c = v33;
    *(_OWORD *)&v5->_sourceTransform.tx = v34;
    v30 = v5;
  }

  return v5;
}

- (UIView)sourceViewSnapshot
{
  sourceViewSnapshot = self->_sourceViewSnapshot;
  if (!sourceViewSnapshot)
  {
    id v4 = objc_alloc(MEMORY[0x263F82828]);
    [(QLTransitionContext *)self sourceFrame];
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    if ([(QLTransitionContext *)self isSourceTransformed])
    {
      [(QLTransitionContext *)self sourceCenter];
      -[UIView setCenter:](v5, "setCenter:");
      [(QLTransitionContext *)self sourceBounds];
      -[UIView setBounds:](v5, "setBounds:");
      [(QLTransitionContext *)self sourceTransform];
      v9[0] = v9[3];
      v9[1] = v9[4];
      v9[2] = v9[5];
      [(UIView *)v5 setTransform:v9];
    }
    double v6 = [(QLTransitionContext *)self sourceViewSnapshotImage];
    [(UIView *)v5 setImage:v6];

    [(UIView *)v5 setContentMode:1];
    CGFloat v7 = self->_sourceViewSnapshot;
    self->_sourceViewSnapshot = v5;

    sourceViewSnapshot = self->_sourceViewSnapshot;
  }

  return sourceViewSnapshot;
}

- (void)_snapshotSourceViewIfNeeded
{
  if (!self->_sourceViewSnapshotImage)
  {
    v3 = [(QLTransitionContext *)self sourceView];

    if (v3)
    {
      id v4 = [(QLTransitionContext *)self sourceView];
      [v4 bounds];
      double v6 = v5;
      double v8 = v7;

      if (v6 != 0.0 && v8 != 0.0)
      {
        CGFloat v9 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", v6, v8);
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __50__QLTransitionContext__snapshotSourceViewIfNeeded__block_invoke;
        v12[3] = &unk_2642F5DE0;
        v12[4] = self;
        double v10 = [v9 imageWithActions:v12];
        sourceViewSnapshotImage = self->_sourceViewSnapshotImage;
        self->_sourceViewSnapshotImage = v10;
      }
    }
  }
}

void __50__QLTransitionContext__snapshotSourceViewIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 CGContext];
  id v5 = [*(id *)(a1 + 32) sourceView];
  id v4 = [v5 layer];
  [v4 renderInContext:v3];
}

- (id)sourceViewSnapshotImage
{
  [(QLTransitionContext *)self _snapshotSourceViewIfNeeded];
  sourceViewSnapshotImage = self->_sourceViewSnapshotImage;

  return sourceViewSnapshotImage;
}

- (QLTransitionContext)initWithQLPreviewController:(id)a3 containerView:(id)a4 toViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    goto LABEL_14;
  }
  v43.receiver = self;
  v43.super_class = (Class)QLTransitionContext;
  CGFloat v11 = [(QLTransitionContext *)&v43 init];
  self = v11;
  if (!v11) {
    goto LABEL_14;
  }
  objc_storeWeak((id *)&v11->_previewController, v8);
  if (!+[QLTransitionContext useZoomTransitionForPreviewController:v8])goto LABEL_14; {
  if (_os_feature_enabled_impl())
  }
  {
    double v12 = [v10 view];
    [v12 layoutIfNeeded];
  }
  [(QLTransitionContext *)self setUpTransitionSourceView];
  CGFloat v13 = [(QLTransitionContext *)self sourceView];
  if (!v13)
  {
    if (self->_sourceViewSnapshotImage) {
      goto LABEL_9;
    }
LABEL_14:
    v41 = 0;
    goto LABEL_15;
  }

LABEL_9:
  uint64_t v14 = +[QLTransitionContext firstChildNavigationControllerFromViewController:v10];
  if (v14)
  {
    [(QLTransitionContext *)self setTopNavigationOffset:0.0];
    v15 = [v10 view];
    CGFloat v16 = [v15 window];
    CGFloat v17 = [v16 windowScene];
    CGFloat v18 = [v17 statusBarManager];
    [v18 statusBarFrame];
    double v20 = v19;
    [(QLTransitionContext *)self topNavigationOffset];
    [(QLTransitionContext *)self setTopNavigationOffset:v21 + v20];

    CGFloat v22 = [v14 navigationBar];
    [v22 frame];
    double v24 = v23;
    [(QLTransitionContext *)self topNavigationOffset];
    [(QLTransitionContext *)self setTopNavigationOffset:v25 + v24];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewController);
  CGFloat v27 = [WeakRetained internalNavigationController];
  CGFloat v28 = [v27 navigationBar];
  [v28 frame];
  [(QLTransitionContext *)self setHostNavigationOffset:v29];

  [(QLTransitionContext *)self hostNavigationOffset];
  if (v30 > 0.0)
  {
    v31 = [v10 view];
    long long v32 = [v31 window];
    long long v33 = [v32 windowScene];
    long long v34 = [v33 statusBarManager];
    [v34 statusBarFrame];
    double v36 = v35;
    [(QLTransitionContext *)self hostNavigationOffset];
    [(QLTransitionContext *)self setHostNavigationOffset:v37 + v36];
  }
  v38 = [v8 internalCurrentPreviewItem];
  [v9 bounds];
  objc_msgSend(v38, "previewSizeForItemViewControllerSize:", v39, v40);
  -[QLTransitionContext setPreviewItemSize:](self, "setPreviewItemSize:");

  self = self;
  v41 = self;
LABEL_15:

  return v41;
}

- (void)setUpTransitionSourceView
{
  p_previewController = &self->_previewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewController);
  BOOL v5 = +[QLTransitionContext useViewTransitionForPreviewController:WeakRetained];

  id v6 = objc_loadWeakRetained((id *)p_previewController);
  double v7 = [v6 delegate];
  if (v5)
  {
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      long long v9 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
      *(_OWORD *)&t2.double a = *MEMORY[0x263F001A8];
      *(_OWORD *)&t2.double c = v9;
      v79[0] = 0;
      v79[1] = 0;
      id v10 = objc_loadWeakRetained((id *)p_previewController);
      CGFloat v11 = [v10 delegate];
      id v12 = objc_loadWeakRetained((id *)p_previewController);
      CGFloat v13 = [v12 currentPreviewItem];
      uint64_t v14 = [v11 previewController:v12 transitionViewForPreviewItem:v13 uncroppedSourceFrame:&t2 realSize:v79];

      [(QLTransitionContext *)self setSourceView:v14];
      double c = t2.c;
      double d = t2.d;
      if (t2.c != *MEMORY[0x263F001B0] || t2.d != *(double *)(MEMORY[0x263F001B0] + 8))
      {
        double a = t2.a;
        double b = t2.b;
LABEL_11:
        -[QLTransitionContext setUncroppedFrame:](self, "setUncroppedFrame:", a, b, c, d);
        goto LABEL_14;
      }
    }
    else
    {
      id v44 = objc_loadWeakRetained((id *)p_previewController);
      v45 = [v44 delegate];
      char v46 = objc_opt_respondsToSelector();

      if (v46)
      {
        memset(&t2, 0, 32);
        id v47 = objc_loadWeakRetained((id *)p_previewController);
        v48 = [v47 delegate];
        id v49 = objc_loadWeakRetained((id *)p_previewController);
        v50 = [v49 currentPreviewItem];
        v51 = [v48 previewController:v49 transitionViewForPreviewItem:v50 uncroppedSourceFrame:&t2];

        [(QLTransitionContext *)self setSourceView:v51];
        double a = t2.a;
        double b = t2.b;
        double c = t2.c;
        double d = t2.d;
        goto LABEL_11;
      }
      id v52 = objc_loadWeakRetained((id *)p_previewController);
      v53 = [v52 delegate];
      id v54 = objc_loadWeakRetained((id *)p_previewController);
      v55 = [v54 currentPreviewItem];
      v56 = [v53 previewController:v54 transitionViewForPreviewItem:v55];

      [(QLTransitionContext *)self setSourceView:v56];
    }
    v57 = [(QLTransitionContext *)self sourceView];
    [v57 bounds];
    -[QLTransitionContext setUncroppedFrame:](self, "setUncroppedFrame:");

LABEL_14:
    v58 = [(QLTransitionContext *)self sourceView];

    if (v58)
    {
      [(QLTransitionContext *)self setUsingViewForZoomTransition:1];
      v59 = [(QLTransitionContext *)self sourceView];
      v60 = [v59 snapshotViewAfterScreenUpdates:0];
      [(QLTransitionContext *)self setSourceViewSnapshot:v60];

      v61 = [(QLTransitionContext *)self sourceView];
      v62 = [(QLTransitionContext *)self sourceView];
      [v62 bounds];
      objc_msgSend(v61, "convertRect:toView:", 0);
      -[QLTransitionContext setSourceFrame:](self, "setSourceFrame:");

      v63 = [(QLTransitionContext *)self sourceView];
      [v63 bounds];
      -[QLTransitionContext setSourceBounds:](self, "setSourceBounds:");

      v64 = [(QLTransitionContext *)self sourceView];
      v65 = [v64 superview];
      v66 = [(QLTransitionContext *)self sourceView];
      [v66 center];
      objc_msgSend(v65, "convertPoint:toView:", 0);
      -[QLTransitionContext setSourceCenter:](self, "setSourceCenter:");

      v67 = [(QLTransitionContext *)self sourceView];
      v68 = v67;
      if (v67)
      {
        [v67 transform];
      }
      else
      {
        long long v77 = 0u;
        long long v78 = 0u;
        long long v76 = 0u;
      }
      v75[0] = v76;
      v75[1] = v77;
      v75[2] = v78;
      [(QLTransitionContext *)self setSourceTransform:v75];

      [(QLTransitionContext *)self sourceTransform];
      long long v69 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&t2.double a = *MEMORY[0x263F000D0];
      *(_OWORD *)&t2.double c = v69;
      *(_OWORD *)&t2.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      if (CGAffineTransformEqualToTransform(&t1, &t2))
      {
        v70 = self;
        uint64_t v71 = 0;
      }
      else
      {
        v70 = self;
        uint64_t v71 = 1;
      }
      [(QLTransitionContext *)v70 setIsSourceTransformed:v71];
    }
    return;
  }
  id v19 = objc_loadWeakRetained((id *)p_previewController);
  double v20 = [v19 currentPreviewItem];
  id v72 = 0;
  [v7 previewController:v19 frameForPreviewItem:v20 inSourceView:&v72];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  id v29 = v72;
  if (v29)
  {
    objc_msgSend(v29, "convertRect:toView:", 0, v22, v24, v26, v28);
    double v31 = v30;
    double v33 = v32;
    memset(&t2, 0, 32);
    id v34 = objc_loadWeakRetained((id *)p_previewController);
    double v35 = [v34 delegate];
    id v36 = objc_loadWeakRetained((id *)p_previewController);
    double v37 = [v36 currentPreviewItem];
    v38 = [v35 previewController:v36 transitionImageForPreviewItem:v37 contentRect:&t2];

    sourceViewSnapshotImage = self->_sourceViewSnapshotImage;
    self->_sourceViewSnapshotImage = v38;

    double v40 = v31 + t2.a;
    double v41 = v33 + t2.b;
    double v42 = t2.c;
    double v43 = t2.d;
    -[QLTransitionContext setUncroppedFrame:](self, "setUncroppedFrame:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), t2.c, t2.d);
    -[QLTransitionContext setSourceFrame:](self, "setSourceFrame:", v40, v41, v42, v43);
    [(QLTransitionContext *)self setUsingViewForZoomTransition:0];
  }
}

+ (BOOL)useZoomTransitionForPreviewController:(id)a3
{
  id v3 = a3;
  if (UIAccessibilityIsReduceMotionEnabled() || ([v3 parentIsNavigationController] & 1) != 0) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = +[QLTransitionContext useImageTransitionForPreviewController:](QLTransitionContext, "useImageTransitionForPreviewController:", v3)|| +[QLTransitionContext useViewTransitionForPreviewController:v3];
  }

  return v4;
}

+ (BOOL)useImageTransitionForPreviewController:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v5 = [v3 delegate];
    char v6 = objc_opt_respondsToSelector();
  }
  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

+ (BOOL)useViewTransitionForPreviewController:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 delegate];
  if (objc_opt_respondsToSelector())
  {
    char v5 = 1;
  }
  else
  {
    char v6 = [v3 delegate];
    if (objc_opt_respondsToSelector())
    {
      char v5 = 1;
    }
    else
    {
      double v7 = [v3 delegate];
      char v5 = objc_opt_respondsToSelector();
    }
  }

  return v5 & 1;
}

+ (id)firstChildNavigationControllerFromViewController:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    char v5 = objc_msgSend(v3, "childViewControllers", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v4 = v10;

            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    id v4 = 0;
  }
LABEL_13:

  return v4;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
}

- (void)setSourceViewSnapshot:(id)a3
{
}

- (CGRect)sourceFrame
{
  objc_copyStruct(v6, &self->_sourceFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setSourceFrame:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_sourceFrame, &v3, 32, 1, 0);
}

- (BOOL)isSourceTransformed
{
  return self->_isSourceTransformed;
}

- (void)setIsSourceTransformed:(BOOL)a3
{
  self->_isSourceTransformedouble d = a3;
}

- (CGRect)sourceBounds
{
  objc_copyStruct(v6, &self->_sourceBounds, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setSourceBounds:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_sourceBounds, &v3, 32, 1, 0);
}

- (CGPoint)sourceCenter
{
  objc_copyStruct(v4, &self->_sourceCenter, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setSourceCenter:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_sourceCenter, &v3, 16, 1, 0);
}

- (CGAffineTransform)sourceTransform
{
  objc_copyStruct(retstr, &self->_sourceTransform, 48, 1, 0);
  return result;
}

- (void)setSourceTransform:(CGAffineTransform *)a3
{
}

- (CGRect)uncroppedFrame
{
  objc_copyStruct(v6, &self->_uncroppedFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setUncroppedFrame:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_uncroppedFrame, &v3, 32, 1, 0);
}

- (double)topNavigationOffset
{
  return self->_topNavigationOffset;
}

- (void)setTopNavigationOffset:(double)a3
{
  self->_double topNavigationOffset = a3;
}

- (double)hostNavigationOffset
{
  return self->_hostNavigationOffset;
}

- (void)setHostNavigationOffset:(double)a3
{
  self->_double hostNavigationOffset = a3;
}

- (BOOL)usingViewForZoomTransition
{
  return self->_usingViewForZoomTransition;
}

- (void)setUsingViewForZoomTransition:(BOOL)a3
{
  self->_usingViewForZoomTransition = a3;
}

- (CGSize)previewItemSize
{
  objc_copyStruct(v4, &self->_previewItemSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPreviewItemSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_previewItemSize, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceViewSnapshot, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_sourceViewSnapshotImage, 0);

  objc_destroyWeak((id *)&self->_previewController);
}

@end
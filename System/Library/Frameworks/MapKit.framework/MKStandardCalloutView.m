@interface MKStandardCalloutView
+ (Class)layerClass;
+ (double)defaultHeight;
- (BOOL)hasPendingVisibility;
- (BOOL)hideTitle;
- (BOOL)isLeftAnchored;
- (CGPoint)_originForScale:(double)a3;
- (CGPoint)anchorPoint;
- (CGPoint)offset;
- (MKStandardCalloutView)initWithAnnotationView:(id)a3;
- (id)subtitle;
- (int64_t)_calculateAnchorPosition:(CGPoint *)a3 visibleRect:(CGRect *)a4;
- (int64_t)anchorPosition;
- (void)_adaptToUserInterfaceStyle;
- (void)_addAccessoryTargetForView:(id)a3;
- (void)_calculateActualAnchorPoint:(CGPoint *)a3 frame:(CGRect *)a4 forDesiredAnchorPoint:(CGPoint)a5 boundaryRect:(CGRect)a6;
- (void)_calloutAccessoryControlTapped:(id)a3;
- (void)_frameDidChange;
- (void)_layoutSubviews:(BOOL)a3;
- (void)_markDidMoveCalled;
- (void)_removeAccessoryTargetForView:(id)a3;
- (void)_runBounceAnimationWithCompletionBlock:(id)a3;
- (void)_setNeedsCalloutUpdate;
- (void)_setOriginForScale:(double)a3;
- (void)_showFromAnchorPoint:(CGPoint)a3 boundaryRect:(CGRect)a4 animate:(BOOL)a5 completionBlock:(id)a6;
- (void)_startObservingAnnotationView:(id)a3;
- (void)_stopObservingAnnotationView:(id)a3;
- (void)_updateCallout;
- (void)_updateCalloutAnimated:(BOOL)a3;
- (void)animationDidStop:(id)a3 finished:(id)a4 context:(void *)a5;
- (void)annotationViewFrameDidChange;
- (void)completeBounceAnimation;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)dismissAnimated:(BOOL)a3 completionBlock:(id)a4;
- (void)forceAnchorPosition:(int64_t)a3;
- (void)motionEffectDidUpdate:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDetailView:(id)a3 animated:(BOOL)a4;
- (void)setFrame:(CGRect)a3;
- (void)setHideTitle:(BOOL)a3;
- (void)setLeftView:(id)a3 backgroundColor:(id)a4 animated:(BOOL)a5;
- (void)setOffset:(CGPoint)a3;
- (void)setRightView:(id)a3 animated:(BOOL)a4;
- (void)setSubtitle:(id)a3;
- (void)setSubtitle:(id)a3 animated:(BOOL)a4;
- (void)setTitle:(id)a3;
- (void)showAnimated:(BOOL)a3 completionBlock:(id)a4;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)updateConstraints;
@end

@implementation MKStandardCalloutView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  v3 = [(MKCalloutView *)self annotationView];
  [(MKStandardCalloutView *)self _stopObservingAnnotationView:v3];

  v4.receiver = self;
  v4.super_class = (Class)MKStandardCalloutView;
  [(MKStandardCalloutView *)&v4 dealloc];
}

- (void)setLeftView:(id)a3 backgroundColor:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v7 = [(MKSmallCalloutView *)self->_calloutView leftView];

  v8 = v9;
  if (v7 != v9)
  {
    [(MKSmallCalloutView *)self->_calloutView setLeftView:v9 animated:v5];
    v8 = v9;
  }
}

- (void)setRightView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = [(MKSmallCalloutView *)self->_calloutView rightView];

  id v7 = v8;
  if (v6 != v8)
  {
    [(MKSmallCalloutView *)self->_calloutView setRightView:v8 animated:v4];
    id v7 = v8;
  }
}

- (void)setDetailView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = [(MKSmallCalloutView *)self->_calloutView detailView];

  id v7 = v8;
  if (v6 != v8)
  {
    [(MKSmallCalloutView *)self->_calloutView setDetailView:v8 animated:v4];
    id v7 = v8;
  }
}

- (void)setSubtitle:(id)a3 animated:(BOOL)a4
{
}

+ (double)defaultHeight
{
  return 50.0;
}

- (MKStandardCalloutView)initWithAnnotationView:(id)a3
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)MKStandardCalloutView;
  BOOL v5 = [(MKCalloutView *)&v71 initWithAnnotationView:v4];
  id v6 = v5;
  if (v5)
  {
    [(MKStandardCalloutView *)v5 setAutoresizesSubviews:1];
    if (v4)
    {
      uint64_t v7 = [v4 _calloutStyle];
      p_style = &v6->_style;
      v6->_style = v7;
      p_metrics = (long long *)&v6->_metrics;
      if (v7 == 2)
      {
        char v10 = 0;
        long long v11 = xmmword_18BD1AF20;
        long long v12 = xmmword_18BD1AF30;
        long long v13 = xmmword_18BD1AF40;
        __asm { FMOV            V2.2D, #11.0 }
        double v19 = 4.0;
        char v20 = 1;
        goto LABEL_7;
      }
    }
    else
    {
      p_style = &v6->_style;
      v6->_style = 0;
      p_metrics = (long long *)&v6->_metrics;
    }
    char v20 = 0;
    long long v11 = xmmword_18BD1AF50;
    long long v12 = xmmword_18BD1AF60;
    long long v13 = xmmword_18BD1AF70;
    char v10 = 1;
    double v19 = 0.666666687;
    _Q2 = xmmword_18BD1AF50;
LABEL_7:
    long long *p_metrics = v13;
    p_metrics[1] = v12;
    *((unsigned char *)p_metrics + 32) = v20;
    *(_DWORD *)((char *)p_metrics + 33) = v66[0];
    *((_DWORD *)p_metrics + 9) = *(_DWORD *)((char *)v66 + 3);
    *((void *)p_metrics + 5) = 0x4018000000000000;
    *((double *)p_metrics + 6) = v19;
    *((unsigned char *)p_metrics + 56) = v10;
    *((unsigned char *)p_metrics + 57) = v10;
    *(_DWORD *)((char *)p_metrics + 58) = v69;
    *((_WORD *)p_metrics + 31) = v70;
    p_metrics[4] = v11;
    p_metrics[5] = _Q2;
    v21 = [_MKStandardCalloutMaskView alloc];
    [(MKStandardCalloutView *)v6 bounds];
    uint64_t v22 = -[_MKStandardCalloutMaskView initWithFrame:](v21, "initWithFrame:");
    maskView = v6->_maskView;
    v6->_maskView = (_MKStandardCalloutMaskView *)v22;

    uint64_t v24 = [(_MKStandardCalloutMaskView *)v6->_maskView layer];
    maskLayer = v6->_maskLayer;
    v6->_maskLayer = (_MKCalloutLayer *)v24;

    v26 = v6->_maskLayer;
    memmove(__dst, p_metrics, 0x60uLL);
    [(_MKCalloutLayer *)v26 setMetrics:__dst];
    v27 = [(MKStandardCalloutView *)v6 layer];
    [v27 sizeSublayerToBounds:v6->_maskLayer];

    v28 = [MEMORY[0x1E4F428B8] clearColor];
    [(MKStandardCalloutView *)v6 setBackgroundColor:v28];

    [(MKStandardCalloutView *)v6 setClipsToBounds:0];
    id v29 = [MEMORY[0x1E4F428B8] blackColor];
    uint64_t v30 = [v29 CGColor];
    v31 = [(MKStandardCalloutView *)v6 layer];
    [v31 setShadowColor:v30];

    if (*p_style == 2)
    {
      v45 = [(MKStandardCalloutView *)v6 layer];
      objc_msgSend(v45, "setShadowOffset:", 0.0, 1.0);

      v46 = [(MKStandardCalloutView *)v6 layer];
      [v46 setShadowRadius:12.0];

      v42 = [(MKStandardCalloutView *)v6 layer];
      v43 = v42;
      LODWORD(v44) = 1041865114;
    }
    else
    {
      if (*p_style)
      {
LABEL_12:
        id v47 = objc_alloc(MEMORY[0x1E4F43028]);
        [(UIView *)v6->_contentView bounds];
        uint64_t v48 = objc_msgSend(v47, "initWithFrame:");
        backdropView = v6->_backdropView;
        v6->_backdropView = (UIVisualEffectView *)v48;

        [(UIVisualEffectView *)v6->_backdropView setTranslatesAutoresizingMaskIntoConstraints:0];
        v50 = [MEMORY[0x1E4F427D8] effectWithStyle:0];
        [(UIVisualEffectView *)v6->_backdropView setEffect:v50];

        [(UIVisualEffectView *)v6->_backdropView setInsetsLayoutMarginsFromSafeArea:0];
        [(UIVisualEffectView *)v6->_backdropView _setUseLiveMasking:1];
        [(MKStandardCalloutView *)v6 addSubview:v6->_backdropView];
        [(UIVisualEffectView *)v6->_backdropView setMaskView:v6->_maskView];
        uint64_t v51 = [(UIVisualEffectView *)v6->_backdropView contentView];
        contentView = v6->_contentView;
        v6->_contentView = (UIView *)v51;

        v53 = [MKSmallCalloutView alloc];
        [(UIView *)v6->_contentView bounds];
        long long v54 = p_metrics[1];
        v66[0] = *p_metrics;
        v66[1] = v54;
        long long v55 = p_metrics[2];
        long long v56 = p_metrics[3];
        long long v57 = p_metrics[5];
        v66[4] = p_metrics[4];
        v66[5] = v57;
        v66[2] = v55;
        v66[3] = v56;
        uint64_t v58 = -[MKSmallCalloutView initWithFrame:metrics:](v53, "initWithFrame:metrics:", v66);
        calloutView = v6->_calloutView;
        v6->_calloutView = (MKSmallCalloutView *)v58;

        [(MKSmallCalloutView *)v6->_calloutView setTranslatesAutoresizingMaskIntoConstraints:0];
        [(MKSmallCalloutView *)v6->_calloutView setInsetsLayoutMarginsFromSafeArea:0];
        [(MKSmallCalloutView *)v6->_calloutView setPreservesSuperviewLayoutMargins:0];
        [(UIView *)v6->_contentView addSubview:v6->_calloutView];
        v60 = [MEMORY[0x1E4F1CA48] array];
        [(MKStandardCalloutView *)v6 _adaptToUserInterfaceStyle];
        v61 = [(UIView *)v6 _mapkit_constraintsPinningSubviewToBounds:v6->_backdropView];
        [v60 addObjectsFromArray:v61];

        v62 = [(UIView *)v6->_contentView _mapkit_constraintsPinningSubviewToBounds:v6->_calloutView];
        [v60 addObjectsFromArray:v62];

        [MEMORY[0x1E4F28DC8] activateConstraints:v60];
        v6->_anchor.offset = (CGPoint)*MEMORY[0x1E4F1DAD8];
        v6->_anchor.position = 0;
        [(MKStandardCalloutView *)v6 _updateCalloutAnimated:0];
        uint64_t v72 = objc_opt_class();
        v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
        id v64 = (id)[(MKStandardCalloutView *)v6 registerForTraitChanges:v63 withAction:sel_traitEnvironment_didChangeTraitCollection_];

        goto LABEL_13;
      }
      uint64_t v32 = +[_MKCalloutLayer layer];
      contentStrokeLayer = v6->_contentStrokeLayer;
      v6->_contentStrokeLayer = (_MKCalloutLayer *)v32;

      v34 = v6->_contentStrokeLayer;
      memmove(v67, p_metrics, 0x60uLL);
      [(_MKCalloutLayer *)v34 setMetrics:v67];
      [(_MKCalloutLayer *)v6->_contentStrokeLayer setFillColor:0];
      v35 = [MEMORY[0x1E4F428B8] colorWithWhite:0.5 alpha:0.300000012];
      [(_MKCalloutLayer *)v6->_contentStrokeLayer setStrokeColor:v35];

      v73 = @"transform";
      v36 = [MEMORY[0x1E4F1CA98] null];
      v74[0] = v36;
      v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:&v73 count:1];
      [(_MKCalloutLayer *)v6->_contentStrokeLayer setActions:v37];

      v38 = [(MKStandardCalloutView *)v6 layer];
      [v38 addSublayer:v6->_contentStrokeLayer];

      [(_MKCalloutLayer *)v6->_contentStrokeLayer setZPosition:10000.0];
      v39 = [(MKStandardCalloutView *)v6 layer];
      [v39 sizeSublayerToBounds:v6->_contentStrokeLayer];

      v40 = [(MKStandardCalloutView *)v6 layer];
      objc_msgSend(v40, "setShadowOffset:", 0.0, 4.0);

      v41 = [(MKStandardCalloutView *)v6 layer];
      [v41 setShadowRadius:6.0];

      v42 = [(MKStandardCalloutView *)v6 layer];
      v43 = v42;
      LODWORD(v44) = 1036831949;
    }
    [v42 setShadowOpacity:v44];

    goto LABEL_12;
  }
LABEL_13:

  return v6;
}

- (void)setTitle:(id)a3
{
}

- (void)setSubtitle:(id)a3
{
}

- (id)subtitle
{
  return [(MKSmallCalloutView *)self->_calloutView calloutSubtitle];
}

- (void)setOffset:(CGPoint)a3
{
  self->_anchor.offset = a3;
}

- (CGPoint)offset
{
  double x = self->_anchor.offset.x;
  double y = self->_anchor.offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)anchorPoint
{
  v2 = (double *)self;
  [(MKStandardCalloutView *)self frame];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  v2 += 53;
  CGFloat v7 = CGRectGetMinX(v11) + *v2;
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double v8 = CGRectGetMinY(v12) + v2[1];
  double v9 = v7;
  result.CGFloat y = v8;
  result.CGFloat x = v9;
  return result;
}

- (void)_calculateActualAnchorPoint:(CGPoint *)a3 frame:(CGRect *)a4 forDesiredAnchorPoint:(CGPoint)a5 boundaryRect:(CGRect)a6
{
  CGFloat x = a6.origin.x;
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  double v8 = a5.y;
  double v9 = a5.x;
  [(MKStandardCalloutView *)self frame];
  double v14 = v13;
  double v16 = v15;
  *(float *)&double v13 = v9;
  double v17 = roundf(*(float *)&v13);
  *(float *)&double v13 = v8;
  double v52 = roundf(*(float *)&v13);
  [(MKSmallCalloutView *)self->_calloutView preferredContentSize];
  double v19 = v18;
  CGFloat v21 = v20;
  switch(self->_anchor.position)
  {
    case 1:
      double v16 = v52;
      goto LABEL_8;
    case 2:
      v58.origin.CGFloat x = v14;
      v58.origin.CGFloat y = v16;
      v58.size.CGFloat width = v19;
      v58.size.CGFloat height = v21;
      double v16 = v52 - CGRectGetHeight(v58);
      goto LABEL_8;
    case 3:
      CGFloat v22 = y;
      CGFloat v23 = v18 + v17 + self->_metrics.margin;
      v53.size.CGFloat width = width;
      v53.origin.CGFloat x = x;
      v53.origin.CGFloat y = v22;
      v53.size.CGFloat height = height;
      if (v23 > CGRectGetMaxX(v53))
      {
        v54.origin.CGFloat x = x;
        v54.origin.CGFloat y = v22;
        v54.size.CGFloat width = width;
        v54.size.CGFloat height = height;
        CGFloat y = v22;
        double v24 = CGRectGetMaxX(v54) - (v19 + self->_metrics.margin);
LABEL_11:
        double v14 = v17;
        goto LABEL_18;
      }
      CGFloat v27 = v17 - self->_metrics.margin;
      v59.origin.CGFloat x = x;
      v59.origin.CGFloat y = v22;
      v59.size.CGFloat width = width;
      v59.size.CGFloat height = height;
      if (v27 < CGRectGetMinX(v59))
      {
        v60.origin.CGFloat x = x;
        v60.origin.CGFloat y = v22;
        v60.size.CGFloat width = width;
        v60.size.CGFloat height = height;
        CGFloat y = v22;
        double v24 = CGRectGetMinX(v60) + self->_metrics.margin;
        goto LABEL_11;
      }
      double v14 = v17;
      CGFloat y = v22;
      double v24 = v17;
      goto LABEL_18;
    case 4:
      v55.origin.CGFloat x = v14;
      v55.origin.CGFloat y = v16;
      v55.size.CGFloat width = v19;
      v55.size.CGFloat height = v21;
      double v14 = v17 - CGRectGetWidth(v55);
      v56.origin.CGFloat y = y;
      CGFloat v25 = v17 - v19 - self->_metrics.margin;
      v56.origin.CGFloat x = x;
      CGFloat rect = v56.origin.y;
      v56.size.CGFloat width = width;
      v56.size.CGFloat height = height;
      if (v25 < CGRectGetMinX(v56))
      {
        v57.origin.CGFloat x = x;
        v57.origin.CGFloat y = rect;
        double v26 = width;
        v57.size.CGFloat width = width;
        v57.size.CGFloat height = height;
        double v24 = v19 + CGRectGetMinX(v57) + self->_metrics.margin;
LABEL_14:
        CGFloat width = v26;
        goto LABEL_17;
      }
      CGFloat v28 = self->_metrics.margin + v17;
      v61.origin.CGFloat x = x;
      v61.origin.CGFloat y = rect;
      v61.size.CGFloat width = width;
      v61.size.CGFloat height = height;
      if (v28 > CGRectGetMaxX(v61))
      {
        v62.origin.CGFloat x = x;
        v62.origin.CGFloat y = rect;
        double v26 = width;
        v62.size.CGFloat width = width;
        v62.size.CGFloat height = height;
        double v24 = CGRectGetMaxX(v62) - self->_metrics.margin;
        goto LABEL_14;
      }
      double v24 = v17;
LABEL_17:
      CGFloat y = rect;
LABEL_18:
      if ((unint64_t)(self->_anchor.position - 1) > 1)
      {
        v68.origin.CGFloat x = v14;
        v68.origin.CGFloat y = v16;
        v68.size.CGFloat width = v19;
        v68.size.CGFloat height = v21;
        double v16 = round(v52 + CGRectGetHeight(v68) * -0.5);
        if (!a3) {
          goto LABEL_36;
        }
        goto LABEL_35;
      }
      double v47 = v24;
      v63.origin.CGFloat x = v14;
      v63.origin.CGFloat y = v16;
      v63.size.CGFloat width = v19;
      v63.size.CGFloat height = v21;
      CGFloat v29 = round(v17 - CGRectGetWidth(v63) * 0.5);
      p_metrics = &self->_metrics;
      double v31 = 0.0;
      double v46 = fmax((v19- (p_metrics->arrowBase+ (p_metrics->var0.radialSmoothing.arrowBaseRadius + p_metrics->cornerRadius) * 2.0))* 0.5, 0.0);
      CGFloat recta = v29;
      v64.origin.CGFloat x = v29;
      v64.origin.CGFloat y = v16;
      v64.size.CGFloat width = v19;
      v64.size.CGFloat height = v21;
      CGFloat v32 = CGRectGetMaxX(v64) + p_metrics->margin;
      v65.origin.CGFloat x = x;
      v65.origin.CGFloat y = y;
      v65.size.CGFloat width = width;
      v65.size.CGFloat height = height;
      if (v32 <= CGRectGetMaxX(v65))
      {
        v69.origin.CGFloat x = recta;
        double v43 = v19;
        double v44 = v16;
        v69.origin.CGFloat y = v16;
        v69.size.CGFloat width = v19;
        double v45 = v21;
        v69.size.CGFloat height = v21;
        CGFloat v35 = CGRectGetMinX(v69) - p_metrics->margin;
        v70.origin.CGFloat x = x;
        v70.origin.CGFloat y = y;
        v70.size.CGFloat width = width;
        v70.size.CGFloat height = height;
        BOOL v36 = v35 < CGRectGetMinX(v70);
        CGFloat v37 = x;
        double v24 = v47;
        double v34 = recta;
        if (!v36) {
          goto LABEL_31;
        }
        CGFloat v38 = y;
        CGFloat v39 = width;
        CGFloat v40 = height;
        double MinX = CGRectGetMinX(*(CGRect *)&v37);
        v71.origin.CGFloat x = recta;
        v71.origin.CGFloat y = v16;
        v71.size.CGFloat width = v19;
        v71.size.CGFloat height = v21;
        double v31 = MinX - (CGRectGetMinX(v71) - p_metrics->margin);
      }
      else
      {
        v66.origin.CGFloat x = x;
        v66.origin.CGFloat y = y;
        v66.size.CGFloat width = width;
        v66.size.CGFloat height = height;
        double MaxX = CGRectGetMaxX(v66);
        double v34 = recta;
        v67.origin.CGFloat x = recta;
        v67.origin.CGFloat y = v16;
        v67.size.CGFloat width = v19;
        v67.size.CGFloat height = v21;
        double v31 = MaxX - (CGRectGetMaxX(v67) + p_metrics->margin);
        double v24 = v47;
      }
      if (v31 > 0.0)
      {
        double v42 = v46;
        if (v31 < v46) {
          double v42 = v31;
        }
        goto LABEL_34;
      }
      double v43 = v19;
      double v44 = v16;
      double v45 = v21;
LABEL_31:
      CGFloat v21 = v45;
      double v42 = -v46;
      if (v31 > -v46) {
        double v42 = v31;
      }
      double v19 = v43;
      double v16 = v44;
LABEL_34:
      double v14 = v34 + v42;
      if (!a3) {
        goto LABEL_36;
      }
LABEL_35:
      a3->CGFloat x = v24;
      a3->CGFloat y = v52;
LABEL_36:
      if (a4)
      {
        a4->origin.CGFloat x = v14;
        a4->origin.CGFloat y = v16;
        a4->size.CGFloat width = v19;
        a4->size.CGFloat height = v21;
      }
      return;
    default:
LABEL_8:
      double v24 = v17;
      goto LABEL_18;
  }
}

- (CGPoint)_originForScale:(double)a3
{
  p_frame = &self->_frame;
  double MidX = CGRectGetMidX(self->_frame);
  double MidY = CGRectGetMidY(*p_frame);
  double v8 = MidX - CGRectGetMinX(*p_frame);
  double v9 = MidY - CGRectGetMinY(*p_frame);
  double v10 = round(MidX - (a3 + -1.0) * (self->_anchor.origin.x - v8));
  double v11 = round(MidY - (a3 + -1.0) * (self->_anchor.origin.y - v9));
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (void)_setOriginForScale:(double)a3
{
  [(MKStandardCalloutView *)self _originForScale:a3];
  double v5 = v4;
  double v7 = v6;
  id v8 = [(MKStandardCalloutView *)self layer];
  objc_msgSend(v8, "setPosition:", v5, v7);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MKStandardCalloutView *)self frame];
  v10.origin.double x = x;
  v10.origin.double y = y;
  v10.size.double width = width;
  v10.size.double height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    [(MKStandardCalloutView *)self _frameDidChange];
    v8.receiver = self;
    v8.super_class = (Class)MKStandardCalloutView;
    -[MKStandardCalloutView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  }
}

- (void)_frameDidChange
{
  p_anchor = &self->_anchor;
  int64_t position = self->_anchor.position;
  if ((unint64_t)(position - 1) < 2)
  {
    [(_MKCalloutLayer *)self->_maskLayer setArrowOffset:p_anchor->origin.x + self->_frame.size.width * -0.5];
    int64_t position = p_anchor->position;
  }
  [(_MKCalloutLayer *)self->_maskLayer setArrowPosition:position];
  [(_MKCalloutLayer *)self->_contentStrokeLayer setArrowPosition:p_anchor->position];
  [(_MKCalloutLayer *)self->_maskLayer arrowOffset];
  contentStrokeLayer = self->_contentStrokeLayer;

  -[_MKCalloutLayer setArrowOffset:](contentStrokeLayer, "setArrowOffset:");
}

- (void)forceAnchorPosition:(int64_t)a3
{
  if (self->_anchor.position != a3)
  {
    self->_anchor.int64_t position = a3;
    double arrowHeight = 0.0;
    switch(a3)
    {
      case 1:
        double arrowHeight = self->_metrics.arrowHeight;
        goto LABEL_4;
      case 2:
        double v6 = self->_metrics.arrowHeight;
        double v5 = 0.0;
        goto LABEL_9;
      case 3:
        double v7 = self->_metrics.arrowHeight;
        double v5 = 0.0;
        double v6 = 0.0;
        goto LABEL_10;
      case 4:
        double v5 = self->_metrics.arrowHeight;
        goto LABEL_8;
      default:
LABEL_4:
        double v5 = 0.0;
LABEL_8:
        double v6 = 0.0;
LABEL_9:
        double v7 = 0.0;
LABEL_10:
        -[MKSmallCalloutView setLayoutMargins:](self->_calloutView, "setLayoutMargins:", arrowHeight, v7, v6, v5);
        [(MKStandardCalloutView *)self _layoutSubviews:0];
        break;
    }
  }
}

- (void)didMoveToWindow
{
  v14.receiver = self;
  v14.super_class = (Class)MKStandardCalloutView;
  [(MKStandardCalloutView *)&v14 didMoveToWindow];
  v3 = [(MKStandardCalloutView *)self window];
  double v4 = [v3 screen];

  if (v4)
  {
    double v5 = [(MKStandardCalloutView *)self window];
    double v6 = [v5 screen];
    [v6 scale];
    double v8 = v7;
    CGRect v9 = [(UIView *)self->_contentView layer];
    [v9 setContentsScale:v8];

    CGRect v10 = [(MKStandardCalloutView *)self window];
    double v11 = [v10 screen];
    [v11 scale];
    -[_MKCalloutLayer setContentsScale:](self->_maskLayer, "setContentsScale:");

    CGRect v12 = [(MKStandardCalloutView *)self window];
    double v13 = [v12 screen];
    [v13 scale];
    -[_MKCalloutLayer setContentsScale:](self->_contentStrokeLayer, "setContentsScale:");
  }
}

- (void)updateConstraints
{
  v3 = [(MKCalloutView *)self annotationView];
  double v4 = [v3 _containerView];
  [v4 _visibleCenteringRectInView:v3];
  double v6 = v5;

  double v7 = v6 + self->_metrics.margin * -2.0;
  if ((unint64_t)([(MKStandardCalloutView *)self anchorPosition] - 3) <= 1)
  {
    if ([(MKStandardCalloutView *)self anchorPosition] == 4
      && ([v3 leftCalloutOffset], v8 < 0.0))
    {
      [v3 leftCalloutOffset];
      double v7 = v7 + v9;
    }
    else if ([(MKStandardCalloutView *)self anchorPosition] == 3)
    {
      [v3 rightCalloutOffset];
      if (v10 > 0.0)
      {
        [v3 rightCalloutOffset];
        double v7 = v7 - v11;
      }
    }
  }
  double v12 = fmin(v7, 390.0);
  [(MKSmallCalloutView *)self->_calloutView minimumWidth];
  if (v12 <= v13)
  {
    [(MKSmallCalloutView *)self->_calloutView minimumWidth];
    double v12 = v14;
  }
  [(MKSmallCalloutView *)self->_calloutView setMaximumWidth:v12];
  v15.receiver = self;
  v15.super_class = (Class)MKStandardCalloutView;
  [(MKStandardCalloutView *)&v15 updateConstraints];
}

- (void)_layoutSubviews:(BOOL)a3
{
  BOOL v3 = a3;
  $A0210CD9D506E42BFA64C98EA1A83F0A flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0 || !a3)
  {
    [(MKStandardCalloutView *)self updateConstraints];
    CGPoint desiredPoint = self->_anchor.desiredPoint;
    -[MKStandardCalloutView _calculateActualAnchorPoint:frame:forDesiredAnchorPoint:boundaryRect:](self, "_calculateActualAnchorPoint:frame:forDesiredAnchorPoint:boundaryRect:", &desiredPoint, &self->_frame, self->_anchor.desiredPoint.x, self->_anchor.desiredPoint.y, self->_anchor.desiredBounds.origin.x, self->_anchor.desiredBounds.origin.y, self->_anchor.desiredBounds.size.width, self->_anchor.desiredBounds.size.height);
    double x = desiredPoint.x;
    CGFloat v7 = x - CGRectGetMinX(self->_frame);
    double y = desiredPoint.y;
    CGFloat MinY = CGRectGetMinY(self->_frame);
    self->_anchor.origin.double x = v7;
    self->_anchor.origin.double y = y - MinY;
    if (v3)
    {
      double v10 = (void *)MEMORY[0x1E4F42FF0];
      UIAnimationDragCoefficient();
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __41__MKStandardCalloutView__layoutSubviews___block_invoke;
      v12[3] = &unk_1E54B8188;
      v12[4] = self;
      objc_msgSend(v10, "_mapkit_animateFromCurrentStateWithDuration:animations:completion:", v12, 0, v11 * 0.349999994);
    }
    else
    {
      -[MKStandardCalloutView setFrame:](self, "setFrame:", self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
      [(UIView *)self _mapkit_layoutBelowIfNeeded];
    }
  }
  else
  {
    self->_$A0210CD9D506E42BFA64C98EA1A83F0A flags = ($A0210CD9D506E42BFA64C98EA1A83F0A)(*(_DWORD *)&flags | 4);
  }
}

uint64_t __41__MKStandardCalloutView__layoutSubviews___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(void *)(a1 + 32) + 512), *(double *)(*(void *)(a1 + 32) + 520), *(double *)(*(void *)(a1 + 32) + 528), *(double *)(*(void *)(a1 + 32) + 536));
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_mapkit_layoutBelowIfNeeded");
}

- (void)_runBounceAnimationWithCompletionBlock:(id)a3
{
  v37[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F39B38] animation];
  [v5 setRemovedOnCompletion:1];
  [v5 setDuration:0.300000012];
  CATransform3DMakeScale(&v36, 0.120481931, 0.120481931, 1.0);
  CATransform3DMakeScale(&v35, 1.11244977, 1.11244977, 1.0);
  [(MKStandardCalloutView *)self _originForScale:0.120481931];
  double v7 = v6;
  double v9 = v8;
  [(MKStandardCalloutView *)self _originForScale:1.11244977];
  double v11 = v10;
  double v13 = v12;
  CATransform3D v34 = v36;
  CATransform3D v33 = v35;
  double v14 = _transformAnim((long long *)&v34, (long long *)&v33);
  objc_super v15 = _positionAnim(v7, v9, v11, v13);
  [v14 setDuration:0.13333334];
  [v15 setDuration:0.13333334];
  CATransform3D v36 = v35;
  CATransform3DMakeScale(&v34, 0.951807201, 0.951807201, 1.0);
  CATransform3D v35 = v34;
  [(MKStandardCalloutView *)self _originForScale:0.951807201];
  double v17 = v16;
  double v19 = v18;
  CATransform3D v34 = v36;
  CATransform3D v33 = v35;
  double v20 = _transformAnim((long long *)&v34, (long long *)&v33);
  CGFloat v21 = _positionAnim(v11, v13, v17, v19);
  [v20 setBeginTime:0.13333334];
  [v21 setBeginTime:0.13333334];
  [v20 setDuration:0.0833333358];
  [v21 setDuration:0.0833333358];
  CATransform3D v36 = v35;
  CATransform3DMakeScale(&v34, 1.0, 1.0, 1.0);
  CATransform3D v35 = v34;
  [(MKStandardCalloutView *)self _originForScale:1.0];
  double v23 = v22;
  double v25 = v24;
  CATransform3D v34 = v36;
  CATransform3D v33 = v35;
  double v26 = _transformAnim((long long *)&v34, (long long *)&v33);
  CGFloat v27 = _positionAnim(v17, v19, v23, v25);
  [v26 setBeginTime:0.216666676];
  [v27 setBeginTime:0.216666676];
  [v26 setDuration:0.0833333358];
  [v27 setDuration:0.0833333358];
  v37[0] = v14;
  v37[1] = v15;
  v37[2] = v20;
  v37[3] = v21;
  v37[4] = v26;
  v37[5] = v27;
  CGFloat v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:6];
  [v5 setAnimations:v28];

  CGFloat v29 = [(MKStandardCalloutView *)self layer];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __64__MKStandardCalloutView__runBounceAnimationWithCompletionBlock___block_invoke;
  v31[3] = &unk_1E54B9388;
  v31[4] = self;
  id v32 = v4;
  id v30 = v4;
  objc_msgSend(v29, "_mapkit_addAnimation:forKey:completion:", v5, @"MKCalloutViewBubbleAnimation", v31);
}

uint64_t __64__MKStandardCalloutView__runBounceAnimationWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = [NSNumber numberWithBool:a2];
  [v3 animationDidStop:@"MKCalloutViewBubbleAnimation" finished:v4 context:0];

  double v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v5();
}

- (int64_t)anchorPosition
{
  return self->_anchor.position;
}

- (BOOL)isLeftAnchored
{
  return self->_anchor.position == 3;
}

- (void)annotationViewFrameDidChange
{
  BOOL v3 = [(MKCalloutView *)self annotationView];
  int v4 = [v3 _shouldKeepCalloutVisible];

  if (v4)
  {
    if ((unint64_t)(self->_anchor.position - 1) <= 1)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __53__MKStandardCalloutView_annotationViewFrameDidChange__block_invoke;
      v6[3] = &unk_1E54B8188;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_performWithoutAnimation:", v6);
      v5.receiver = self;
      v5.super_class = (Class)MKStandardCalloutView;
      [(MKCalloutView *)&v5 annotationViewFrameDidChange];
    }
  }
}

uint64_t __53__MKStandardCalloutView_annotationViewFrameDidChange__block_invoke(uint64_t a1)
{
  float64x2_t v2 = *(float64x2_t *)MEMORY[0x1E4F1DAD8];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v7 = *MEMORY[0x1E4F1DB28];
  long long v8 = v3;
  float64x2_t v9 = v2;
  objc_msgSend(*(id *)(a1 + 32), "forceAnchorPosition:", objc_msgSend(*(id *)(a1 + 32), "_calculateAnchorPosition:visibleRect:", &v9, &v7));
  float64x2_t v9 = vrndaq_f64(v9);
  *(float64x2_t *)(*(void *)(a1 + 32) + 464) = v9;
  uint64_t v4 = *(void *)(a1 + 32) + 424;
  long long v5 = v7;
  *(_OWORD *)(v4 + 72) = v8;
  *(_OWORD *)(v4 + 56) = v5;
  [*(id *)(a1 + 32) _layoutSubviews:0];
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 584), "_mapkit_layoutIfNeeded");
}

- (void)_showFromAnchorPoint:(CGPoint)a3 boundaryRect:(CGRect)a4 animate:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v6 = a5;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v11 = a3.y;
  CGFloat v12 = a3.x;
  double v14 = (void (**)(void))a6;
  [(MKStandardCalloutView *)self completeBounceAnimation];
  self->_anchor.desiredPoint.CGFloat x = v12;
  self->_anchor.desiredPoint.CGFloat y = v11;
  self->_anchor.desiredBounds.origin.CGFloat x = x;
  self->_anchor.desiredBounds.origin.CGFloat y = y;
  self->_anchor.desiredBounds.size.CGFloat width = width;
  self->_anchor.desiredBounds.size.CGFloat height = height;
  self->_$A0210CD9D506E42BFA64C98EA1A83F0A flags = ($A0210CD9D506E42BFA64C98EA1A83F0A)(*(_DWORD *)&self->_flags & 0xFFFFFFFC | v6);
  objc_super v15 = [(MKCalloutView *)self annotationView];
  [v15 addSubview:self];

  [(MKStandardCalloutView *)self _layoutSubviews:0];
  [(UIView *)self->_calloutView _mapkit_layoutIfNeeded];
  [(UIView *)self _mapKit_setNeedsDisplay];
  [(MKStandardCalloutView *)self setAlpha:1.0];
  if (v6)
  {
    [(UIView *)self _mapkit_layoutIfNeeded];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __83__MKStandardCalloutView__showFromAnchorPoint_boundaryRect_animate_completionBlock___block_invoke;
    v16[3] = &unk_1E54B82E8;
    double v17 = v14;
    [(MKStandardCalloutView *)self _runBounceAnimationWithCompletionBlock:v16];
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    [(MKStandardCalloutView *)self _markDidMoveCalled];
    v14[2](v14);
  }
}

uint64_t __83__MKStandardCalloutView__showFromAnchorPoint_boundaryRect_animate_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)animationDidStop:(id)a3 finished:(id)a4 context:(void *)a5
{
  if ([a4 BOOLValue])
  {
    if (a3 != @"MKCalloutViewBubbleAnimation") {
      return;
    }
    long long v7 = [(MKStandardCalloutView *)self layer];
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v13 = *MEMORY[0x1E4F1DAB8];
    long long v14 = v8;
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v7 setAffineTransform:&v13];
  }
  else
  {
    [(MKStandardCalloutView *)self setAlpha:1.0];
    if (a3 != @"MKCalloutViewBubbleAnimation") {
      return;
    }
    long long v7 = [(MKStandardCalloutView *)self layer];
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v18 = v9;
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v20 = v10;
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    long long v13 = *MEMORY[0x1E4F39B10];
    long long v14 = v11;
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    long long v16 = v12;
    [v7 setTransform:&v13];
  }

  -[MKStandardCalloutView setFrame:](self, "setFrame:", self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    [(MKStandardCalloutView *)self _markDidMoveCalled];
  }
}

- (void)_markDidMoveCalled
{
  $A0210CD9D506E42BFA64C98EA1A83F0A flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
    self->_$A0210CD9D506E42BFA64C98EA1A83F0A flags = ($A0210CD9D506E42BFA64C98EA1A83F0A)(*(_DWORD *)&flags | 2);
    if ((*(unsigned char *)&flags & 4) != 0)
    {
      self->_$A0210CD9D506E42BFA64C98EA1A83F0A flags = ($A0210CD9D506E42BFA64C98EA1A83F0A)(*(_DWORD *)&flags & 0xFFFFFFF9 | 2);
      [(MKStandardCalloutView *)self _layoutSubviews:1];
    }
  }
}

- (void)completeBounceAnimation
{
  p_frame = &self->_frame;
  if (!CGRectIsEmpty(self->_frame))
  {
    uint64_t v4 = [(MKStandardCalloutView *)self layer];
    [v4 removeAllAnimations];

    long long v5 = [(MKStandardCalloutView *)self layer];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v7[0] = *MEMORY[0x1E4F1DAB8];
    v7[1] = v6;
    v7[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v5 setAffineTransform:v7];

    -[MKStandardCalloutView setFrame:](self, "setFrame:", p_frame->origin.x, p_frame->origin.y, p_frame->size.width, p_frame->size.height);
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      [(MKStandardCalloutView *)self _markDidMoveCalled];
    }
  }
}

- (void)motionEffectDidUpdate:(id)a3
{
  id v4 = a3;
  [(MKSmallCalloutView *)self->_calloutView bounds];
  if (v5 <= v6) {
    double v7 = v6;
  }
  else {
    double v7 = v5;
  }
  double v8 = v7 / 1920.0;
  BOOL v9 = v8 <= 0.0;
  double v10 = 1.0;
  BOOL v11 = v8 < 1.0 || v8 <= 0.0;
  if (v8 >= 1.0) {
    BOOL v9 = 1;
  }
  if (v11) {
    double v10 = 0.0;
  }
  if (v9) {
    double v8 = v10;
  }
  double v12 = fmin(fmax(v8 * -0.25 + 0.119999997, 0.0250000004), 1.20000005);
  double v13 = fmin(fmax(v8 * 30.0 + 6.0, 0.0), 10.0);
  if (v4)
  {
    objc_msgSend(v4, "transformWithTranslationScale:rotationScale:", v13, v13, v12, v12);
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
  }
  long long v14 = [(UIView *)self->_contentView layer];
  v28[4] = v33;
  v28[5] = v34;
  v28[6] = v35;
  v28[7] = v36;
  v28[0] = v29;
  v28[1] = v30;
  v28[2] = v31;
  v28[3] = v32;
  [v14 setTransform:v28];

  if (v4)
  {
    objc_msgSend(v4, "transformWithTranslationScale:rotationScale:", v13 / -3.0, v13 / -3.0, v12 / -3.0, v12 / -3.0);
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
  }
  long long v15 = [(MKSmallCalloutView *)self->_calloutView titlesContainerView];
  long long v16 = [v15 layer];
  v19[4] = v24;
  v19[5] = v25;
  v19[6] = v26;
  v19[7] = v27;
  v19[0] = v20;
  v19[1] = v21;
  v19[2] = v22;
  v19[3] = v23;
  [v16 setTransform:v19];

  objc_msgSend(v4, "offsetWithScale:", v13, 0.0);
  double v18 = v17;
  -[_MKCalloutLayer setArrowOffset:](self->_maskLayer, "setArrowOffset:");
  [(_MKCalloutLayer *)self->_contentStrokeLayer setArrowOffset:v18];
}

- (BOOL)hasPendingVisibility
{
  return self->_animatingMapToShow;
}

- (int64_t)_calculateAnchorPosition:(CGPoint *)a3 visibleRect:(CGRect *)a4
{
  double v6 = [(MKCalloutView *)self annotationView];
  double v7 = [v6 _containerView];
  [v7 _visibleCenteringRectInView:v6];
  double v82 = v8;
  double v83 = v9;
  double v11 = v10;
  double v13 = v12;

  char v14 = [v6 _allowedCalloutEdges];
  char v15 = [v6 _allowedCalloutEdges];
  char v16 = [v6 _allowedCalloutEdges];
  char v17 = [v6 _allowedCalloutEdges];
  if (v14) {
    goto LABEL_10;
  }
  if (v15 & 2 | (unint64_t)(v16 & 8))
  {
    id v18 = v6;
    [v18 bounds];
    CGFloat x = v84.origin.x;
    CGFloat y = v84.origin.y;
    CGFloat width = v84.size.width;
    CGFloat height = v84.size.height;
    double MinX = CGRectGetMinX(v84);
    v85.origin.CGFloat x = x;
    v85.origin.CGFloat y = y;
    v85.size.CGFloat width = width;
    v85.size.CGFloat height = height;
    objc_msgSend(v18, "leftCalloutOffset", CGRectGetMidY(v85));
    double v25 = v24;

    double v26 = MinX + v25;
    id v27 = v18;
    [v27 bounds];
    CGFloat v28 = v86.origin.x;
    CGFloat v29 = v86.origin.y;
    CGFloat v30 = v86.size.width;
    CGFloat v31 = v86.size.height;
    double MaxX = CGRectGetMaxX(v86);
    v87.origin.CGFloat x = v28;
    v87.origin.CGFloat y = v29;
    v87.size.CGFloat width = v30;
    v87.size.CGFloat height = v31;
    objc_msgSend(v27, "rightCalloutOffset", CGRectGetMidY(v87));
    double v34 = v33;

    v88.origin.CGFloat x = v82;
    v88.origin.CGFloat y = v83;
    v88.size.CGFloat width = v11;
    v88.size.CGFloat height = v13;
    double v35 = vabdd_f64(v26, CGRectGetMinX(v88));
    v89.origin.CGFloat x = v82;
    v89.origin.CGFloat y = v83;
    v89.size.CGFloat width = v11;
    v89.size.CGFloat height = v13;
    BOOL v36 = v35 > vabdd_f64(MaxX + v34, CGRectGetMaxX(v89));
    int v37 = (v16 & 8) == 0 || v36;
    id v38 = v27;
    [v38 bounds];
    CGFloat v43 = v39;
    CGFloat v44 = v40;
    CGFloat v45 = v41;
    CGFloat v46 = v42;
    if ((v15 & 2) != 0 && v37)
    {
      double v47 = CGRectGetMinX(*(CGRect *)&v39);
      v90.origin.CGFloat x = v43;
      v90.origin.CGFloat y = v44;
      v90.size.CGFloat width = v45;
      v90.size.CGFloat height = v46;
      double MidY = CGRectGetMidY(v90);
      [v38 leftCalloutOffset];
      double v50 = v49;
      double v52 = v51;

      double v53 = v47 + v50;
      double v54 = MidY + v52;
      [v38 frame];
      double v55 = CGRectGetWidth(v91);
      int64_t v56 = 4;
    }
    else
    {
      double v64 = CGRectGetMaxX(*(CGRect *)&v39);
      v94.origin.CGFloat x = v43;
      v94.origin.CGFloat y = v44;
      v94.size.CGFloat width = v45;
      v94.size.CGFloat height = v46;
      double v65 = CGRectGetMidY(v94);
      [v38 rightCalloutOffset];
      double v67 = v66;
      double v69 = v68;

      double v53 = v64 + v67;
      double v54 = v65 + v69;
      [v38 frame];
      double v55 = CGRectGetWidth(v95);
      [v38 frame];
      double v82 = v82 + CGRectGetWidth(v96);
      int64_t v56 = 3;
    }
    double v11 = v11 - v55;
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if ((v17 & 4) == 0)
  {
LABEL_10:
    id v57 = v6;
    [v57 bounds];
    double v58 = v92.origin.y;
    double MidX = CGRectGetMidX(v92);
    [v57 calloutOffset];
    double v61 = v60;
    double v63 = v62;

    double v53 = MidX + v61;
    double v54 = v58 + v63;
    [v57 frame];
    double v13 = v13 - CGRectGetHeight(v93);
    int64_t v56 = 2;
    if (!a3) {
      goto LABEL_15;
    }
LABEL_14:
    a3->CGFloat x = v53;
    a3->CGFloat y = v54;
    goto LABEL_15;
  }
  id v71 = v6;
  [v71 bounds];
  CGFloat v72 = v97.origin.x;
  CGFloat v73 = v97.origin.y;
  CGFloat v74 = v97.size.width;
  CGFloat v75 = v97.size.height;
  double v76 = CGRectGetMidX(v97);
  v98.origin.CGFloat x = v72;
  v98.origin.CGFloat y = v73;
  v98.size.CGFloat width = v74;
  v98.size.CGFloat height = v75;
  double MaxY = CGRectGetMaxY(v98);
  [v71 _bottomCalloutOffset];
  double v79 = v78;
  double v81 = v80;

  double v53 = v76 + v79;
  double v54 = MaxY + v81;
  [v71 frame];
  double v83 = v83 + CGRectGetHeight(v99);
  [v71 frame];
  double v13 = v13 - CGRectGetHeight(v100);
  int64_t v56 = 1;
  if (a3) {
    goto LABEL_14;
  }
LABEL_15:
  if (a4)
  {
    a4->origin.CGFloat x = v82;
    a4->origin.CGFloat y = v83;
    a4->size.CGFloat width = v11;
    a4->size.CGFloat height = v13;
  }

  return v56;
}

- (void)showAnimated:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = [(MKCalloutView *)self annotationView];
  self->_dismissed = 0;
  self->_animatingMapToShow = 0;
  [(MKStandardCalloutView *)self _updateCalloutAnimated:0];
  double v8 = (double *)MEMORY[0x1E4F1DAD8];
  long long v76 = *MEMORY[0x1E4F1DAD8];
  long long v66 = v76;
  *(_OWORD *)&v64[16] = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  v75.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  *(CGPoint *)double v64 = v75.origin;
  v75.size = *(CGSize *)&v64[16];
  int64_t v9 = [(MKStandardCalloutView *)self _calculateAnchorPosition:&v76 visibleRect:&v75];
  [(MKStandardCalloutView *)self forceAnchorPosition:v9];
  [(MKStandardCalloutView *)self updateConstraints];
  CGRect v73 = *(CGRect *)v64;
  long long v74 = v66;
  -[MKStandardCalloutView _calculateActualAnchorPoint:frame:forDesiredAnchorPoint:boundaryRect:](self, "_calculateActualAnchorPoint:frame:forDesiredAnchorPoint:boundaryRect:", &v74, &v73, v76, *(_OWORD *)&v75.origin, *(_OWORD *)&v75.size);
  CGRect v81 = CGRectOffset(v73, *(double *)&v76 - *(double *)&v74, *((double *)&v76 + 1) - *((double *)&v74 + 1));
  CGRect v77 = CGRectUnion(v75, v81);
  CGRectIntegral(v77);
  [v7 frame];
  CGFloat v14 = v10;
  double v65 = *v8;
  double v67 = v8[1];
  if (!v4)
  {
    double v26 = *v8;
    double v27 = v8[1];
    goto LABEL_25;
  }
  CGFloat v15 = v11;
  CGFloat v16 = v12;
  CGFloat v17 = v13;
  double v19 = *((double *)&v76 + 1);
  double v18 = *(double *)&v76;
  if ((unint64_t)(v9 - 3) < 2)
  {
    p_metrics = &self->_metrics;
    double margin = self->_metrics.margin;
    double arrowHeight = self->_metrics.arrowHeight;
    double v63 = margin + arrowHeight + CGRectGetHeight(v73) * 0.5;
    v79.origin.CGFloat x = v14;
    v79.origin.CGFloat y = v15;
    v79.size.CGFloat width = v16;
    v79.size.CGFloat height = v17;
    double Height = CGRectGetHeight(v79);
    if (Height <= CGRectGetHeight(v73) * 0.5)
    {
      double v25 = CGRectGetHeight(v73) * 0.5;
    }
    else
    {
      v80.origin.CGFloat x = v14;
      v80.origin.CGFloat y = v15;
      v80.size.CGFloat width = v16;
      v80.size.CGFloat height = v17;
      double v25 = CGRectGetHeight(v80);
    }
    double v24 = v63;
    goto LABEL_11;
  }
  if ((unint64_t)(v9 - 1) <= 1)
  {
    p_metrics = &self->_metrics;
    double v21 = self->_metrics.arrowHeight;
    double margin = self->_metrics.margin + (self->_metrics.arrowBase + -1.0) * 0.5 + 8.0;
    double v23 = v21 + CGRectGetHeight(*(CGRect *)&v10);
    double v24 = v23 + CGRectGetHeight(v73) + self->_metrics.margin;
    v78.origin.CGFloat x = v14;
    v78.origin.CGFloat y = v15;
    v78.size.CGFloat width = v16;
    v78.size.CGFloat height = v17;
    double v25 = CGRectGetHeight(v78);
LABEL_11:
    double v31 = v18 - margin;
    double v18 = v18 + margin;
    double v30 = v19 + v25 + p_metrics->margin;
    double v19 = v19 - v24;
    goto LABEL_12;
  }
  double v30 = *((double *)&v76 + 1);
  double v31 = *(double *)&v76;
LABEL_12:
  if (v9 == 4)
  {
    double v31 = v31 - CGRectGetWidth(v73);
  }
  else if (v9 == 3)
  {
    double v18 = v18 + CGRectGetWidth(v73);
  }
  double MinY = CGRectGetMinY(v75);
  CGRect v33 = v75;
  if (v19 >= MinY)
  {
    double v34 = v67;
    if (v30 > CGRectGetMaxY(v33)) {
      double v34 = CGRectGetMaxY(v75) - v30;
    }
  }
  else
  {
    double v34 = CGRectGetMinY(v33) - v19;
  }
  double MaxX = CGRectGetMaxX(v75);
  CGRect v36 = v75;
  if (v18 <= MaxX)
  {
    double v37 = v65;
    if (v31 < CGRectGetMinX(v36)) {
      double v37 = CGRectGetMinX(v75) - v31;
    }
  }
  else
  {
    double v37 = CGRectGetMaxX(v36) - v18;
  }
  id v38 = [(MKCalloutView *)self annotationView];
  CGFloat v39 = [(MKCalloutView *)self annotationView];
  double v40 = [v39 superview];
  objc_msgSend(v38, "convertPoint:toView:", v40, v65, v67);
  double v42 = v41;
  double v44 = v43;

  CGFloat v45 = [(MKCalloutView *)self annotationView];
  CGFloat v46 = [(MKCalloutView *)self annotationView];
  double v47 = [v46 superview];
  objc_msgSend(v45, "convertPoint:toView:", v47, v37, v34);
  double v49 = v48;
  double v51 = v50;

  double v26 = v42 - v49;
  double v27 = v44 - v51;
LABEL_25:
  *(void *)&long long v76 = round(*(double *)&v76);
  *((void *)&v76 + 1) = round(*((double *)&v76 + 1));
  if (v4)
  {
    if (fabs(v26) >= 1.0 || fabs(v27) >= 1.0)
    {
      self->_animatingMapToShow = 1;
      double v55 = [v7 _mapView];
      int64_t v56 = [v7 _containerView];
      id v57 = [(MKCalloutView *)self annotationView];
      double v58 = [v57 annotation];
      [v58 coordinate];
      double v60 = v59;
      double v62 = v61;
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __54__MKStandardCalloutView_showAnimated_completionBlock___block_invoke;
      v68[3] = &unk_1E54B93B0;
      v68[4] = self;
      id v69 = v7;
      long long v71 = v76;
      BOOL v72 = v4;
      id v70 = v6;
      objc_msgSend(v55, "annotationContainer:scrollToRevealCalloutWithOffset:annotationCoordinate:completionHandler:", v56, v68, round(v26), round(v27), v60, v62);

      goto LABEL_32;
    }
    double v52 = self;
    id v53 = v6;
    uint64_t v54 = 1;
  }
  else
  {
    double v52 = self;
    uint64_t v54 = 0;
    id v53 = v6;
  }
  -[MKStandardCalloutView _showFromAnchorPoint:boundaryRect:animate:completionBlock:](v52, "_showFromAnchorPoint:boundaryRect:animate:completionBlock:", v54, v53);
LABEL_32:
  [(MKStandardCalloutView *)self _startObservingAnnotationView:v7];
}

void __54__MKStandardCalloutView_showAnimated_completionBlock___block_invoke(uint64_t a1)
{
  float64x2_t v2 = [*(id *)(a1 + 32) annotationView];
  if (v2)
  {
    int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 549);

    if (!v3)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 548) = 0;
      BOOL v4 = [*(id *)(a1 + 40) _containerView];
      [v4 _visibleCenteringRectInView:*(void *)(a1 + 40)];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;

      double v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(unsigned __int8 *)(a1 + 72);
      uint64_t v15 = *(void *)(a1 + 48);
      double v16 = *(double *)(a1 + 56);
      double v17 = *(double *)(a1 + 64);
      objc_msgSend(v13, "_showFromAnchorPoint:boundaryRect:animate:completionBlock:", v14, v15, v16, v17, v6, v8, v10, v12);
    }
  }
}

- (void)dismissAnimated:(BOOL)a3 completionBlock:(id)a4
{
  double v6 = (void (**)(void))a4;
  double v7 = [(MKCalloutView *)self annotationView];
  [(MKStandardCalloutView *)self _stopObservingAnnotationView:v7];
  self->_dismissed = 1;
  if (a3)
  {
    double v8 = (void *)MEMORY[0x1E4F42FF0];
    UIAnimationDragCoefficient();
    double v10 = (float)(v9 * 0.1);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__MKStandardCalloutView_dismissAnimated_completionBlock___block_invoke;
    v18[3] = &unk_1E54B8188;
    v18[4] = self;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __57__MKStandardCalloutView_dismissAnimated_completionBlock___block_invoke_2;
    double v16 = &unk_1E54B89C0;
    double v17 = v6;
    objc_msgSend(v8, "_mapkit_animateWithDuration:animations:completion:", v18, &v13, v10);

    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  [(MKStandardCalloutView *)self setAlpha:0.0];
  v6[2](v6);
  if (v7)
  {
LABEL_5:
    double v11 = objc_msgSend(v7, "leftCalloutAccessoryView", v13, v14, v15, v16);
    [(MKStandardCalloutView *)self _removeAccessoryTargetForView:v11];

    double v12 = [v7 rightCalloutAccessoryView];
    [(MKStandardCalloutView *)self _removeAccessoryTargetForView:v12];
  }
LABEL_6:
}

uint64_t __57__MKStandardCalloutView_dismissAnimated_completionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __57__MKStandardCalloutView_dismissAnimated_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_calloutAccessoryControlTapped:(id)a3
{
  id v4 = a3;
  id v7 = [(MKCalloutView *)self annotationView];
  double v5 = [v7 _mapView];
  double v6 = [v7 _containerView];
  [v5 annotationContainer:v6 annotationView:v7 calloutAccessoryControlTapped:v4];
}

- (void)_addAccessoryTargetForView:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 addTarget:self action:sel__calloutAccessoryControlTapped_ forControlEvents:64];
  }
}

- (void)_removeAccessoryTargetForView:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 removeTarget:self action:sel__calloutAccessoryControlTapped_ forControlEvents:64];
  }
}

- (void)_updateCallout
{
}

- (void)_updateCalloutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(MKCalloutView *)self annotationView];
  *(_DWORD *)&self->_flags &= ~8u;
  id v17 = v5;
  if (v3)
  {
    [(UIView *)self _mapkit_layoutBelowIfNeeded];
    double v5 = v17;
  }
  double v6 = [v5 annotation];
  BOOL v7 = [(MKStandardCalloutView *)self hideTitle];
  if ([(MKStandardCalloutView *)self hideTitle])
  {
    int v8 = !v7;
    [(MKStandardCalloutView *)self setTitle:0];
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 {
         && ([v6 title],
  }
             float v9 = objc_claimAutoreleasedReturnValue(),
             uint64_t v10 = [v9 length],
             v9,
             v10))
  {
    double v11 = [v6 title];
    [(MKStandardCalloutView *)self setTitle:v11];

    int v8 = 1;
  }
  else
  {
    [(MKStandardCalloutView *)self setTitle:0];
    int v8 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    double v12 = [v6 subtitle];
  }
  else
  {
    double v12 = 0;
  }
  uint64_t v13 = [v17 leftCalloutAccessoryView];
  uint64_t v14 = [v17 rightCalloutAccessoryView];
  [(MKStandardCalloutView *)self setLeftView:v13 backgroundColor:0 animated:v3];
  [(MKStandardCalloutView *)self setRightView:v14 animated:v3];
  uint64_t v15 = [v17 detailCalloutAccessoryView];

  if (v15)
  {
    double v16 = [v17 detailCalloutAccessoryView];
    [(MKStandardCalloutView *)self setDetailView:v16 animated:v3];
  }
  else if (v8)
  {
    [(MKStandardCalloutView *)self setDetailView:0 animated:v3];
    [(MKStandardCalloutView *)self setSubtitle:v12 animated:v3];
  }
  [(MKStandardCalloutView *)self _addAccessoryTargetForView:v13];
  [(MKStandardCalloutView *)self _addAccessoryTargetForView:v14];
  if (v3) {
    [(MKStandardCalloutView *)self _layoutSubviews:1];
  }
}

- (void)_setNeedsCalloutUpdate
{
  $A0210CD9D506E42BFA64C98EA1A83F0A flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
    self->_$A0210CD9D506E42BFA64C98EA1A83F0A flags = ($A0210CD9D506E42BFA64C98EA1A83F0A)(*(_DWORD *)&flags | 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__MKStandardCalloutView__setNeedsCalloutUpdate__block_invoke;
    block[3] = &unk_1E54B8188;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

unsigned char *__47__MKStandardCalloutView__setNeedsCalloutUpdate__block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if ((result[544] & 8) != 0) {
    return (unsigned char *)[result _updateCalloutAnimated:1];
  }
  return result;
}

- (void)_startObservingAnnotationView:(id)a3
{
  if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    id v4 = a3;
    [v4 addObserver:self forKeyPath:@"annotation.title" options:3 context:0];
    [v4 addObserver:self forKeyPath:@"annotation.subtitle" options:3 context:0];
    [v4 addObserver:self forKeyPath:0x1ED920028 options:3 context:0];
    [v4 addObserver:self forKeyPath:0x1ED920048 options:3 context:0];
    [v4 addObserver:self forKeyPath:0x1ED920068 options:3 context:0];
    [v4 addObserver:self forKeyPath:0x1ED920008 options:0 context:0];
    double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v6 = [v4 annotation];

    [v5 addObserver:self selector:sel__updateCallout name:@"MKAnnotationCalloutInfoDidChangeNotification" object:v6];
    *(_DWORD *)&self->_flags |= 0x10u;
  }
}

- (void)_stopObservingAnnotationView:(id)a3
{
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    id v4 = a3;
    [v4 removeObserver:self forKeyPath:@"annotation.title"];
    [v4 removeObserver:self forKeyPath:@"annotation.subtitle"];
    double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:@"MKAnnotationCalloutInfoDidChangeNotification" object:0];

    [v4 removeObserver:self forKeyPath:0x1ED920028];
    [v4 removeObserver:self forKeyPath:0x1ED920048];
    [v4 removeObserver:self forKeyPath:0x1ED920068];
    [v4 removeObserver:self forKeyPath:0x1ED920008];

    *(_DWORD *)&self->_flags &= ~0x10u;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = *MEMORY[0x1E4F284E0];
  uint64_t v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];
  uint64_t v15 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];

  if (v14 != v15)
  {
    if (([v10 isEqualToString:@"annotation.title"] & 1) != 0
      || ([v10 isEqualToString:@"annotation.subtitle"] & 1) != 0
      || ([v10 isEqualToString:0x1ED920068] & 1) != 0
      || [v10 isEqualToString:0x1ED920008])
    {
      [(MKStandardCalloutView *)self _setNeedsCalloutUpdate];
    }
    else if (([v10 isEqualToString:0x1ED920028] & 1) != 0 {
           || [v10 isEqualToString:0x1ED920048])
    }
    {
      double v16 = [v12 objectForKey:v13];
      [(MKStandardCalloutView *)self _removeAccessoryTargetForView:v16];
      [(MKStandardCalloutView *)self _setNeedsCalloutUpdate];
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)MKStandardCalloutView;
      [(MKStandardCalloutView *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    }
  }
}

- (void)_adaptToUserInterfaceStyle
{
  int64_t style = self->_style;
  if (style == 2)
  {
    float v9 = [MEMORY[0x1E4F427D8] effectWithStyle:9];
    [(UIVisualEffectView *)self->_backdropView setEffect:v9];

    [(UIVisualEffectView *)self->_backdropView setBackgroundColor:0];
    id v10 = [(MKStandardCalloutView *)self traitCollection];
    uint64_t v11 = [v10 userInterfaceStyle];

    BOOL v7 = [(MKStandardCalloutView *)self layer];
    id v12 = v7;
    if (v11 == 2) {
      LODWORD(v8) = 1050253722;
    }
    else {
      LODWORD(v8) = 1041865114;
    }
  }
  else
  {
    if (style) {
      return;
    }
    id v4 = [MEMORY[0x1E4F427D8] effectWithStyle:10];
    [(UIVisualEffectView *)self->_backdropView setEffect:v4];

    [(UIVisualEffectView *)self->_backdropView setBackgroundColor:0];
    double v5 = [(MKStandardCalloutView *)self traitCollection];
    uint64_t v6 = [v5 userInterfaceStyle];

    BOOL v7 = [(MKStandardCalloutView *)self layer];
    id v12 = v7;
    if (v6 == 2) {
      LODWORD(v8) = 1051931443;
    }
    else {
      LODWORD(v8) = 1036831949;
    }
  }
  [v7 setShadowOpacity:v8];
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(MKStandardCalloutView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];
  uint64_t v8 = [v5 userInterfaceStyle];

  if (v7 != v8)
  {
    [(MKStandardCalloutView *)self _adaptToUserInterfaceStyle];
  }
}

- (BOOL)hideTitle
{
  return self->_hideTitle;
}

- (void)setHideTitle:(BOOL)a3
{
  self->_hideTitle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionEffect, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_calloutView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_contentStrokeLayer, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);

  objc_storeStrong((id *)&self->_maskView, 0);
}

@end
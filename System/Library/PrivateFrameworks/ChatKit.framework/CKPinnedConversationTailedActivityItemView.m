@interface CKPinnedConversationTailedActivityItemView
- (BOOL)supportsActivityItemViewContentScale;
- (BOOL)supportsAlignmentWithOriginationSubAvatarFrame;
- (CAShapeLayer)backdropMaskShapeLayer;
- (CAShapeLayer)contentViewStrokeLayer;
- (CGPoint)originationPoint;
- (CGPoint)tailAttachmentPoint;
- (CGPoint)tailAttachmentPointWithOutputForMinimumContinousAnchorX:(double *)a3 maximumContinuousAnchorX:(double *)a4;
- (CGRect)pillRect;
- (CGSize)parentAvatarViewSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKPinnedConversationActivityItem)activityItem;
- (CKPinnedConversationActivityItemViewBackdropLayer)backdropLayer;
- (CKPinnedConversationActivityItemViewDelegate)activityItemViewDelegate;
- (CKPinnedConversationActivityItemViewShadowLayer)broadShadowLayer;
- (CKPinnedConversationActivityItemViewShadowLayer)tightShadowLayer;
- (CKPinnedConversationTailedActivityItemView)initWithActivityItem:(id)a3 contentView:(id)a4 needsContentViewStroke:(BOOL)a5;
- (UIEdgeInsets)contentViewPadding;
- (UIView)contentView;
- (double)activityItemToContactItemVerticalOverlap;
- (double)balloonCornerRadius;
- (double)balloonTailHeight;
- (double)balloonTailRadius;
- (double)balloonTailWidth;
- (double)contentViewHorizontalInsetForPillCornerRadius;
- (double)pillCornerRadius;
- (double)preferredTailAttachmentPointXCoordinate;
- (id)_pathForTailedBalloonSegmentWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 anchorPoint:(CGPoint)a5 originationHorizontalDirection:(int64_t)a6 originationDirection:(int64_t)a7;
- (int64_t)activityItemViewContentScale;
- (int64_t)contentViewContentMode;
- (int64_t)originationDirection;
- (int64_t)originationHorizontalDirection;
- (void)_updateUserInterfaceStyles;
- (void)layoutSubviews;
- (void)setActivityItem:(id)a3;
- (void)setActivityItemViewContentScale:(int64_t)a3;
- (void)setActivityItemViewDelegate:(id)a3;
- (void)setBackdropLayer:(id)a3;
- (void)setBackdropMaskShapeLayer:(id)a3;
- (void)setBroadShadowLayer:(id)a3;
- (void)setContentViewStrokeLayer:(id)a3;
- (void)setOriginationDirection:(int64_t)a3;
- (void)setOriginationHorizontalDirection:(int64_t)a3;
- (void)setOriginationPoint:(CGPoint)a3;
- (void)setParentAvatarViewSize:(CGSize)a3;
- (void)setPreferredTailAttachmentPointXCoordinate:(double)a3;
- (void)setTightShadowLayer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CKPinnedConversationTailedActivityItemView

- (CKPinnedConversationTailedActivityItemView)initWithActivityItem:(id)a3 contentView:(id)a4 needsContentViewStroke:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CKPinnedConversationTailedActivityItemView;
  v11 = [(CKPinnedConversationTailedActivityItemView *)&v32 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_activityItem, a3);
    objc_storeStrong((id *)&v12->_contentView, a4);
    v13 = [[CKPinnedConversationActivityItemViewShadowLayer alloc] initWithShadowType:0];
    broadShadowLayer = v12->_broadShadowLayer;
    v12->_broadShadowLayer = v13;

    v15 = [[CKPinnedConversationActivityItemViewShadowLayer alloc] initWithShadowType:1];
    tightShadowLayer = v12->_tightShadowLayer;
    v12->_tightShadowLayer = v15;

    v17 = objc_alloc_init(CKPinnedConversationActivityItemViewBackdropLayer);
    backdropLayer = v12->_backdropLayer;
    v12->_backdropLayer = v17;

    v19 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    backdropMaskShapeLayer = v12->_backdropMaskShapeLayer;
    v12->_backdropMaskShapeLayer = v19;

    [(CKPinnedConversationActivityItemViewBackdropLayer *)v12->_backdropLayer setMask:v12->_backdropMaskShapeLayer];
    [(CKPinnedConversationTailedActivityItemView *)v12 _updateUserInterfaceStyles];
    v21 = [(CKPinnedConversationTailedActivityItemView *)v12 layer];
    [v21 addSublayer:v12->_broadShadowLayer];

    v22 = [(CKPinnedConversationTailedActivityItemView *)v12 layer];
    [v22 addSublayer:v12->_tightShadowLayer];

    v23 = v12->_backdropLayer;
    v24 = [(UIView *)v12->_contentView layer];
    [(CKPinnedConversationActivityItemViewBackdropLayer *)v23 addSublayer:v24];

    if (v5)
    {
      v25 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
      contentViewStrokeLayer = v12->_contentViewStrokeLayer;
      v12->_contentViewStrokeLayer = v25;

      [(CAShapeLayer *)v12->_contentViewStrokeLayer setLineWidth:1.0];
      id v27 = [MEMORY[0x1E4F428B8] colorWithWhite:0.341176471 alpha:1.0];
      -[CAShapeLayer setStrokeColor:](v12->_contentViewStrokeLayer, "setStrokeColor:", [v27 CGColor]);

      id v28 = [MEMORY[0x1E4F428B8] clearColor];
      -[CAShapeLayer setFillColor:](v12->_contentViewStrokeLayer, "setFillColor:", [v28 CGColor]);

      v29 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
      [(CAShapeLayer *)v12->_contentViewStrokeLayer setCompositingFilter:v29];

      [(CKPinnedConversationActivityItemViewBackdropLayer *)v12->_backdropLayer addSublayer:v12->_contentViewStrokeLayer];
    }
    v30 = [(CKPinnedConversationTailedActivityItemView *)v12 layer];
    [v30 addSublayer:v12->_backdropLayer];
  }
  return v12;
}

- (CGPoint)tailAttachmentPointWithOutputForMinimumContinousAnchorX:(double *)a3 maximumContinuousAnchorX:(double *)a4
{
  [(CKPinnedConversationTailedActivityItemView *)self bounds];
  v41.origin.x = v7;
  v41.origin.y = v8;
  v41.size.width = v9;
  v41.size.height = v10;
  [(CKPinnedConversationTailedActivityItemView *)self pillRect];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  int64_t originationDirection = self->_originationDirection;
  [(CKPinnedConversationTailedActivityItemView *)self balloonTailWidth];
  double v21 = v20;
  [(CKPinnedConversationTailedActivityItemView *)self pillCornerRadius];
  double v23 = v22;
  [(CKPinnedConversationTailedActivityItemView *)self preferredTailAttachmentPointXCoordinate];
  double v25 = v24;
  double v26 = 0.645679839;
  if (self->_originationHorizontalDirection) {
    double v27 = 0.645679839;
  }
  else {
    double v27 = 0.354320161;
  }
  double v38 = v27;
  if (self->_originationHorizontalDirection) {
    double v26 = 0.354320161;
  }
  double v40 = v26;
  v43.origin.x = v12;
  v43.origin.y = v14;
  v43.size.width = v16;
  v43.size.height = v18;
  double MinX = CGRectGetMinX(v43);
  v44.origin.x = v12;
  v44.origin.y = v14;
  v44.size.width = v16;
  v44.size.height = v18;
  double v37 = CGRectGetMinX(v44);
  v45.origin.x = v12;
  v45.origin.y = v14;
  v45.size.width = v16;
  v45.size.height = v18;
  double MaxX = CGRectGetMaxX(v45);
  v46.origin.x = v12;
  v46.origin.y = v14;
  v46.size.width = v16;
  v46.size.height = v18;
  double v29 = CGRectGetMaxX(v46);
  if (originationDirection == 1) {
    double MinY = CGRectGetMinY(v41);
  }
  else {
    double MinY = CGRectGetMaxY(v41);
  }
  double v31 = MinY;
  double v32 = v23 * 1.528665;
  double v33 = v21 * v38;
  if (a3) {
    *a3 = v32 + v37 + v33;
  }
  double v34 = v21 * v40;
  if (a4) {
    *a4 = v29 - v32 - v34;
  }
  double v35 = v23 + MinX + v33;
  double v36 = MaxX - v23 - v34;
  if (v36 >= v25) {
    double v36 = v25;
  }
  if (v35 < v36) {
    double v35 = v36;
  }
  result.y = v31;
  result.x = v35;
  return result;
}

- (CGPoint)tailAttachmentPoint
{
  [(CKPinnedConversationTailedActivityItemView *)self tailAttachmentPointWithOutputForMinimumContinousAnchorX:0 maximumContinuousAnchorX:0];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGRect)pillRect
{
  [(CKPinnedConversationTailedActivityItemView *)self balloonTailHeight];
  double v4 = v3;
  [(CKPinnedConversationTailedActivityItemView *)self bounds];
  double v9 = 0.0;
  if (self->_originationDirection == 1) {
    double v9 = v4;
  }
  double v10 = v6 + v9;
  double v11 = v8 - v4;
  result.size.height = v11;
  result.size.width = v7;
  result.origin.y = v10;
  result.origin.x = v5;
  return result;
}

- (void)layoutSubviews
{
  v96.receiver = self;
  v96.super_class = (Class)CKPinnedConversationTailedActivityItemView;
  [(CKPinnedConversationTailedActivityItemView *)&v96 layoutSubviews];
  [(CKPinnedConversationTailedActivityItemView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[CKPinnedConversationActivityItemViewShadowLayer setFrame:](self->_broadShadowLayer, "setFrame:");
  -[CKPinnedConversationActivityItemViewShadowLayer setFrame:](self->_tightShadowLayer, "setFrame:", v4, v6, v8, v10);
  -[CAShapeLayer setFrame:](self->_backdropMaskShapeLayer, "setFrame:", v4, v6, v8, v10);
  -[CKPinnedConversationActivityItemViewBackdropLayer setFrame:](self->_backdropLayer, "setFrame:", v4, v6, v8, v10);
  -[CAShapeLayer setFrame:](self->_contentViewStrokeLayer, "setFrame:", v4, v6, v8, v10);
  [(CKPinnedConversationTailedActivityItemView *)self contentViewPadding];
  double v86 = v11;
  double v82 = v12;
  double v84 = v13;
  double v80 = v14;
  [(CKPinnedConversationTailedActivityItemView *)self balloonTailHeight];
  double v16 = v15;
  [(CKPinnedConversationTailedActivityItemView *)self pillCornerRadius];
  double v92 = v17;
  double v18 = v17 * 1.528665;
  int64_t originationDirection = self->_originationDirection;
  double v20 = 0.0;
  if (originationDirection == 1) {
    double v21 = v16;
  }
  else {
    double v21 = 0.0;
  }
  double v78 = v21;
  double v22 = v6 + v21;
  double v23 = v10 - v16;
  double v94 = 0.0;
  double v95 = 0.0;
  [(CKPinnedConversationTailedActivityItemView *)self tailAttachmentPointWithOutputForMinimumContinousAnchorX:&v95 maximumContinuousAnchorX:&v94];
  double v88 = v25;
  int64_t originationHorizontalDirection = self->_originationHorizontalDirection;
  BOOL v26 = originationDirection != 1;
  BOOL v27 = originationDirection == 1;
  if (v18 + v18 >= v8)
  {
    BOOL v27 = 0;
    BOOL v26 = 0;
  }
  if (v24 < v95) {
    uint64_t v28 = v27;
  }
  else {
    uint64_t v28 = v18 + v18 < v8;
  }
  if (v24 < v95) {
    uint64_t v29 = v26;
  }
  else {
    uint64_t v29 = v18 + v18 < v8;
  }
  BOOL v30 = originationDirection != 1;
  BOOL v31 = originationDirection == 1;
  double v91 = v18 + v18;
  if (v18 + v18 >= v8)
  {
    BOOL v31 = 0;
    BOOL v30 = 0;
  }
  double v89 = v24;
  if (v24 > v94) {
    uint64_t v32 = v31;
  }
  else {
    uint64_t v32 = v18 + v18 < v8;
  }
  if (v24 > v94) {
    uint64_t v33 = v30;
  }
  else {
    uint64_t v33 = v18 + v18 < v8;
  }
  int64_t v34 = [(CKPinnedConversationTailedActivityItemView *)self contentViewContentMode];
  if (v34 == 1)
  {
    [(CKPinnedConversationTailedActivityItemView *)self bounds];
    double v20 = v39;
  }
  else
  {
    double v35 = 0.0;
    double v36 = 0.0;
    double v37 = 0.0;
    if (!v34)
    {
      [(CKPinnedConversationTailedActivityItemView *)self contentViewHorizontalInsetForPillCornerRadius];
      double v20 = v82 + v4 + v38;
      double v35 = v6 + v86 + v78;
      double v36 = v8 - v82 - v80 + v38 * -2.0;
      double v37 = v23 - v86 - v84;
    }
  }
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __60__CKPinnedConversationTailedActivityItemView_layoutSubviews__block_invoke;
  v93[3] = &unk_1E5621968;
  v93[4] = self;
  *(double *)&v93[5] = v20;
  *(double *)&v93[6] = v35;
  *(double *)&v93[7] = v36;
  *(double *)&v93[8] = v37;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v93];
  if (v29) {
    double v40 = v18;
  }
  else {
    double v40 = v92;
  }
  double v41 = v4 + v40;
  v97.origin.x = v4;
  v97.origin.y = v22;
  v97.size.width = v8;
  v97.size.height = v23;
  double MaxX = CGRectGetMaxX(v97);
  if (v33) {
    double v43 = v18;
  }
  else {
    double v43 = v92;
  }
  double v44 = MaxX - v43;
  if (!v28) {
    double v18 = v92;
  }
  v98.origin.x = v4;
  v98.origin.y = v22;
  v98.size.width = v8;
  v98.size.height = v23;
  double MaxY = CGRectGetMaxY(v98);
  id v45 = objc_alloc_init(MEMORY[0x1E4F427D0]);
  double v87 = v41;
  objc_msgSend(v45, "moveToPoint:", v41, v22);
  uint64_t v76 = 416;
  if (originationDirection == 1)
  {
    [v45 currentPoint];
    if (originationHorizontalDirection) {
      double v48 = v47;
    }
    else {
      double v48 = v22;
    }
    if (originationHorizontalDirection) {
      double v49 = v46;
    }
    else {
      double v49 = v44;
    }
    if (originationHorizontalDirection) {
      double v50 = v44;
    }
    else {
      double v50 = v46;
    }
    if (originationHorizontalDirection) {
      double v51 = v22;
    }
    else {
      double v51 = v47;
    }
    v52 = -[CKPinnedConversationTailedActivityItemView _pathForTailedBalloonSegmentWithStartPoint:endPoint:anchorPoint:originationHorizontalDirection:originationDirection:](self, "_pathForTailedBalloonSegmentWithStartPoint:endPoint:anchorPoint:originationHorizontalDirection:originationDirection:", self->_originationHorizontalDirection, self->_originationDirection, v49, v48, v50, v51, v89, v88, 416);
    v53 = v52;
    if (originationHorizontalDirection)
    {
      id v54 = v52;
    }
    else
    {
      id v54 = [v52 bezierPathByReversingPath];
    }
    v55 = v54;
    [v45 appendPath:v54];
  }
  else
  {
    objc_msgSend(v45, "addLineToPoint:", v44, v22);
  }
  double v77 = v4 + v18;
  BOOL v56 = v91 < v23;
  v99.origin.x = v4;
  v99.origin.y = v22;
  v99.size.width = v8;
  v99.size.height = v23;
  double v57 = CGRectGetMaxX(v99);
  v100.origin.x = v4;
  v100.origin.y = v22;
  v100.size.width = v8;
  v100.size.height = v23;
  double MinY = CGRectGetMinY(v100);
  v101.origin.x = v4;
  v101.origin.y = v22;
  v101.size.width = v8;
  v101.size.height = v23;
  double v59 = CGRectGetMaxX(v101);
  v102.origin.x = v4;
  v102.origin.y = v22;
  v102.size.width = v8;
  v102.size.height = v23;
  double v60 = CGRectGetMaxY(v102);
  v103.origin.x = v4;
  v103.origin.y = v22;
  v103.size.width = v8;
  v103.size.height = v23;
  double MinX = CGRectGetMinX(v103);
  v104.origin.x = v4;
  v104.origin.y = v22;
  v104.size.width = v8;
  v104.size.height = v23;
  double v79 = CGRectGetMaxY(v104);
  v105.origin.x = v4;
  v105.origin.y = v22;
  v105.size.width = v8;
  v105.size.height = v23;
  double v81 = CGRectGetMinX(v105);
  v106.origin.x = v4;
  v106.origin.y = v22;
  v106.size.width = v8;
  v106.size.height = v23;
  double v61 = CGRectGetMinY(v106);
  objc_msgSend(v45, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:leadInIsContinuous:leadOutIsContinuous:", 2, 0, v33, v56, v57, MinY, v92, v92);
  objc_msgSend(v45, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:leadInIsContinuous:leadOutIsContinuous:", 8, 0, v56, v32, v59, v60, v92, v92);
  if (originationDirection == 1)
  {
    objc_msgSend(v45, "addLineToPoint:", v77, MaxY);
    double v62 = v91;
  }
  else
  {
    [v45 currentPoint];
    double v65 = MaxY;
    if (originationHorizontalDirection) {
      double v66 = MaxY;
    }
    else {
      double v66 = v64;
    }
    double v67 = v77;
    if (originationHorizontalDirection) {
      double v68 = v77;
    }
    else {
      double v68 = v63;
    }
    if (originationHorizontalDirection)
    {
      double v67 = v63;
      double v65 = v64;
    }
    v69 = -[CKPinnedConversationTailedActivityItemView _pathForTailedBalloonSegmentWithStartPoint:endPoint:anchorPoint:originationHorizontalDirection:originationDirection:](self, "_pathForTailedBalloonSegmentWithStartPoint:endPoint:anchorPoint:originationHorizontalDirection:originationDirection:", self->_originationHorizontalDirection, *(Class *)((char *)&self->super.super.super.isa + v76), v68, v66, v67, v65, v89, v88, v76);
    v70 = v69;
    if (originationHorizontalDirection)
    {
      id v71 = [v69 bezierPathByReversingPath];
    }
    else
    {
      id v71 = v69;
    }
    v72 = v71;
    double v62 = v91;
    [v45 appendPath:v71];
  }
  BOOL v73 = v62 < v23;
  objc_msgSend(v45, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:leadInIsContinuous:leadOutIsContinuous:", 4, 0, v28, v73, MinX, v79, v92, v92);
  objc_msgSend(v45, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:leadInIsContinuous:leadOutIsContinuous:", 1, 0, v73, v29, v81, v61, v92, v92);
  objc_msgSend(v45, "addLineToPoint:", v87, v22);
  id v74 = v45;
  uint64_t v75 = [v74 CGPath];
  [(CAShapeLayer *)self->_backdropMaskShapeLayer setPath:v75];
  [(CKPinnedConversationActivityItemViewShadowLayer *)self->_broadShadowLayer setShadowPath:v75];
  [(CKPinnedConversationActivityItemViewShadowLayer *)self->_tightShadowLayer setShadowPath:v75];
  [(CAShapeLayer *)self->_contentViewStrokeLayer setPath:v75];
}

void __60__CKPinnedConversationTailedActivityItemView_layoutSubviews__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contentView];
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)_pathForTailedBalloonSegmentWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 anchorPoint:(CGPoint)a5 originationHorizontalDirection:(int64_t)a6 originationDirection:(int64_t)a7
{
  double y = a5.y;
  double x = a5.x;
  double v11 = a3.y;
  double v12 = a3.x;
  id v14 = objc_alloc_init(MEMORY[0x1E4F427D0]);
  objc_msgSend(v14, "moveToPoint:", v12, v11);
  [(CKPinnedConversationTailedActivityItemView *)self balloonTailWidth];
  double v16 = vabdd_f64(y, v11) + -1.0;
  double v17 = -(v15 * 0.661754856);
  if (a7 == 1) {
    double v18 = -(v16 * 0.811138015);
  }
  else {
    double v18 = v16 * 0.811138015;
  }
  double v19 = -(v16 * 0.182405165);
  if (a7 == 1) {
    double v19 = v16 * 0.182405165;
  }
  double v37 = v19;
  if (!a6) {
    double v17 = v15 * 0.661754856;
  }
  double v20 = -(v15 * 0.162759545);
  if (a6)
  {
    double v20 = v15 * 0.162759545;
    double v21 = v15 * 0.419959812;
  }
  else
  {
    double v21 = -(v15 * 0.419959812);
  }
  double v22 = -(v15 * 0.158070998);
  if (a6) {
    double v22 = v15 * 0.158070998;
  }
  double v36 = v22;
  if (a6) {
    double v23 = v15;
  }
  else {
    double v23 = -v15;
  }
  double v24 = x;
  double v25 = v20 + x + v17;
  double v38 = x + v17;
  double v39 = v23;
  double v26 = v16 * 0.136400323;
  if (a7 == 1) {
    double v26 = -(v16 * 0.136400323);
  }
  double v27 = v11 + v26;
  double v28 = v16 * 0.0121065375;
  if (a7 == 1) {
    double v28 = -(v16 * 0.0121065375);
  }
  double v35 = v28;
  objc_msgSend(v14, "addLineToPoint:");
  double v29 = v21 + v25;
  double v30 = v18 + v27;
  double v31 = (v27 - v30) / (v25 - v29);
  objc_msgSend(v14, "addQuadCurveToPoint:controlPoint:", v25, v27, v29 + (v11 - v30) / v31, v11);
  objc_msgSend(v14, "addLineToPoint:", v29, v30);
  objc_msgSend(v14, "addCurveToPoint:controlPoint1:controlPoint2:", v36 + v29, v37 + v30, v24, v30 + v31 * (v24 - v29), v36 + v29, v35 + v30);
  [v14 currentPoint];
  [v14 currentPoint];
  [v14 currentPoint];
  double v33 = v32;
  objc_msgSend(v14, "addLineToPoint:");
  objc_msgSend(v14, "addQuadCurveToPoint:controlPoint:", v39 + v38, v11, v33, v11);
  objc_msgSend(v14, "addLineToPoint:", a4.x, a4.y);

  return v14;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CKPinnedConversationTailedActivityItemView *)self contentViewPadding];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v35 = v12;
  [(CKPinnedConversationTailedActivityItemView *)self balloonTailHeight];
  double v14 = v13;
  [(CKPinnedConversationTailedActivityItemView *)self balloonTailWidth];
  [(CKPinnedConversationTailedActivityItemView *)self pillCornerRadius];
  int64_t v15 = [(CKPinnedConversationTailedActivityItemView *)self contentViewContentMode];
  if (v15 == 1)
  {
    double v29 = [(CKPinnedConversationTailedActivityItemView *)self contentView];
    objc_msgSend(v29, "systemLayoutSizeFittingSize:", width, height);
    double v22 = v30;
    double v21 = v31;
  }
  else
  {
    double v16 = v14;
    double v17 = height;
    double v34 = width;
    double v18 = v9;
    double v19 = v11;
    double v20 = v7;
    double v21 = 0.0;
    double v22 = 0.0;
    if (!v15)
    {
      double v23 = v16;
      [(CKPinnedConversationTailedActivityItemView *)self contentViewHorizontalInsetForPillCornerRadius];
      double v25 = v34 - v18 - v35 - v24 * 2.0;
      double v26 = [(CKPinnedConversationTailedActivityItemView *)self contentView];
      objc_msgSend(v26, "systemLayoutSizeFittingSize:", v25, v17 - v23 - v20 - v19);

      UICeilToViewScale();
      double v21 = v27;
      UICeilToViewScale();
      double v22 = v28;
    }
  }
  double v32 = v22;
  double v33 = v21;
  result.double height = v33;
  result.double width = v32;
  return result;
}

- (UIEdgeInsets)contentViewPadding
{
  double v2 = 5.0;
  double v3 = 0.0;
  double v4 = 5.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)balloonTailHeight
{
  [(CKPinnedConversationTailedActivityItemView *)self pillCornerRadius];

  UIRoundToViewScale();
  return result;
}

- (double)balloonTailWidth
{
  [(CKPinnedConversationTailedActivityItemView *)self balloonTailHeight];
  return v2 * 2.41;
}

- (double)balloonTailRadius
{
  return 3.0;
}

- (double)balloonCornerRadius
{
  return 10.0;
}

- (double)activityItemToContactItemVerticalOverlap
{
  return 3.0;
}

- (double)contentViewHorizontalInsetForPillCornerRadius
{
  [(CKPinnedConversationTailedActivityItemView *)self pillCornerRadius];

  UIRoundToViewScale();
  return result;
}

- (void)setOriginationDirection:(int64_t)a3
{
  if (self->_originationDirection != a3)
  {
    self->_int64_t originationDirection = a3;
    [(CKPinnedConversationTailedActivityItemView *)self setNeedsLayout];
  }
}

- (void)setOriginationPoint:(CGPoint)a3
{
  if (a3.x != self->_originationPoint.x || a3.y != self->_originationPoint.y)
  {
    self->_originationPoint = a3;
    [(CKPinnedConversationTailedActivityItemView *)self setNeedsLayout];
  }
}

- (void)setPreferredTailAttachmentPointXCoordinate:(double)a3
{
  if (self->_preferredTailAttachmentPointXCoordinate != a3)
  {
    self->_preferredTailAttachmentPointXCoordinate = a3;
    [(CKPinnedConversationTailedActivityItemView *)self setNeedsLayout];
  }
}

- (BOOL)supportsActivityItemViewContentScale
{
  return 0;
}

- (BOOL)supportsAlignmentWithOriginationSubAvatarFrame
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKPinnedConversationTailedActivityItemView;
  [(CKPinnedConversationTailedActivityItemView *)&v4 traitCollectionDidChange:a3];
  [(CKPinnedConversationTailedActivityItemView *)self _updateUserInterfaceStyles];
}

- (void)_updateUserInterfaceStyles
{
  double v3 = [(CKPinnedConversationTailedActivityItemView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  [(CKPinnedConversationActivityItemViewBackdropLayer *)self->_backdropLayer setUserInterfaceStyle:v4];
  [(CKPinnedConversationActivityItemViewShadowLayer *)self->_broadShadowLayer setUserInterfaceStyle:v4];
  tightShadowLayer = self->_tightShadowLayer;

  [(CKPinnedConversationActivityItemViewShadowLayer *)tightShadowLayer setUserInterfaceStyle:v4];
}

- (int64_t)contentViewContentMode
{
  return 0;
}

- (CKPinnedConversationActivityItem)activityItem
{
  return self->_activityItem;
}

- (void)setActivityItem:(id)a3
{
}

- (int64_t)originationDirection
{
  return self->_originationDirection;
}

- (CGPoint)originationPoint
{
  double x = self->_originationPoint.x;
  double y = self->_originationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int64_t)originationHorizontalDirection
{
  return self->_originationHorizontalDirection;
}

- (void)setOriginationHorizontalDirection:(int64_t)a3
{
  self->_int64_t originationHorizontalDirection = a3;
}

- (double)preferredTailAttachmentPointXCoordinate
{
  return self->_preferredTailAttachmentPointXCoordinate;
}

- (CKPinnedConversationActivityItemViewDelegate)activityItemViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityItemViewDelegate);

  return (CKPinnedConversationActivityItemViewDelegate *)WeakRetained;
}

- (void)setActivityItemViewDelegate:(id)a3
{
}

- (int64_t)activityItemViewContentScale
{
  return self->_activityItemViewContentScale;
}

- (void)setActivityItemViewContentScale:(int64_t)a3
{
  self->_activityItemViewContentScale = a3;
}

- (CGSize)parentAvatarViewSize
{
  double width = self->_parentAvatarViewSize.width;
  double height = self->_parentAvatarViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setParentAvatarViewSize:(CGSize)a3
{
  self->_parentAvatarViewSize = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (double)pillCornerRadius
{
  return self->_pillCornerRadius;
}

- (CKPinnedConversationActivityItemViewBackdropLayer)backdropLayer
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

- (CKPinnedConversationActivityItemViewShadowLayer)broadShadowLayer
{
  return self->_broadShadowLayer;
}

- (void)setBroadShadowLayer:(id)a3
{
}

- (CKPinnedConversationActivityItemViewShadowLayer)tightShadowLayer
{
  return self->_tightShadowLayer;
}

- (void)setTightShadowLayer:(id)a3
{
}

- (CAShapeLayer)contentViewStrokeLayer
{
  return self->_contentViewStrokeLayer;
}

- (void)setContentViewStrokeLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewStrokeLayer, 0);
  objc_storeStrong((id *)&self->_tightShadowLayer, 0);
  objc_storeStrong((id *)&self->_broadShadowLayer, 0);
  objc_storeStrong((id *)&self->_backdropMaskShapeLayer, 0);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_activityItemViewDelegate);

  objc_storeStrong((id *)&self->_activityItem, 0);
}

@end
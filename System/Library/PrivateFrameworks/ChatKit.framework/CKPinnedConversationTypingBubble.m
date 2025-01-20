@interface CKPinnedConversationTypingBubble
- (BOOL)supportsActivityItemViewContentScale;
- (BOOL)supportsAlignmentWithOriginationSubAvatarFrame;
- (CALayer)thinkingDotContainer;
- (CAReplicatorLayer)thinkingDots;
- (CAShapeLayer)backdropMaskShapeLayer;
- (CAShapeLayer)thinkingDot;
- (CGPoint)mediumBubbleOffset;
- (CGPoint)originationPoint;
- (CGPoint)smallBubbleOffset;
- (CGPoint)tailAttachmentPoint;
- (CGSize)largeBubbleSize;
- (CGSize)mediumBubbleSize;
- (CGSize)parentAvatarViewSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)smallBubbleSize;
- (CGSize)thinkingDotContainerSize;
- (CKPinnedConversationActivityItem)activityItem;
- (CKPinnedConversationActivityItemViewBackdropLayer)backdropLayer;
- (CKPinnedConversationActivityItemViewDelegate)activityItemViewDelegate;
- (CKPinnedConversationActivityItemViewShadowLayer)broadShadowLayer;
- (CKPinnedConversationActivityItemViewShadowLayer)tightShadowLayer;
- (CKPinnedConversationTypingBubble)initWithActivityItem:(id)a3;
- (CKPinnedConversationTypingBubbleActivityItem)typingBubbleActivityItem;
- (double)activityItemToContactItemVerticalOverlap;
- (double)largeBubbleCornerRadius;
- (double)preferredTailAttachmentPointXCoordinate;
- (double)thinkingDotDiameter;
- (double)thinkingDotOpacity;
- (double)thinkingDotSpace;
- (id)thinkingDotColor;
- (int64_t)activityItemViewContentScale;
- (int64_t)originationDirection;
- (int64_t)originationHorizontalDirection;
- (unint64_t)tailCornerAnchor;
- (void)_updateThinkingDotColor;
- (void)_updateUserInterfaceStyles;
- (void)calculateBezierPathWithOutputsForPath:(id *)a3 largeBubbleFrame:(CGRect *)a4 mediumBubbleFrame:(CGRect *)a5 smallBubbleFrame:(CGRect *)a6;
- (void)layoutSubviews;
- (void)setActivityItem:(id)a3;
- (void)setActivityItemViewContentScale:(int64_t)a3;
- (void)setActivityItemViewDelegate:(id)a3;
- (void)setBackdropLayer:(id)a3;
- (void)setBackdropMaskShapeLayer:(id)a3;
- (void)setBroadShadowLayer:(id)a3;
- (void)setOriginationDirection:(int64_t)a3;
- (void)setOriginationHorizontalDirection:(int64_t)a3;
- (void)setOriginationPoint:(CGPoint)a3;
- (void)setParentAvatarViewSize:(CGSize)a3;
- (void)setPreferredTailAttachmentPointXCoordinate:(double)a3;
- (void)setThinkingDot:(id)a3;
- (void)setThinkingDotContainer:(id)a3;
- (void)setThinkingDots:(id)a3;
- (void)setTightShadowLayer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CKPinnedConversationTypingBubble

- (CKPinnedConversationTypingBubble)initWithActivityItem:(id)a3
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v48.receiver = self;
  v48.super_class = (Class)CKPinnedConversationTypingBubble;
  v6 = [(CKPinnedConversationTypingBubble *)&v48 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_typingBubbleActivityItem, a3);
    v8 = [[CKPinnedConversationActivityItemViewShadowLayer alloc] initWithShadowType:0];
    broadShadowLayer = v7->_broadShadowLayer;
    v7->_broadShadowLayer = v8;

    v10 = [[CKPinnedConversationActivityItemViewShadowLayer alloc] initWithShadowType:1];
    tightShadowLayer = v7->_tightShadowLayer;
    v7->_tightShadowLayer = v10;

    v12 = objc_alloc_init(CKPinnedConversationActivityItemViewBackdropLayer);
    backdropLayer = v7->_backdropLayer;
    v7->_backdropLayer = v12;

    v14 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    backdropMaskShapeLayer = v7->_backdropMaskShapeLayer;
    v7->_backdropMaskShapeLayer = v14;

    [(CKPinnedConversationActivityItemViewBackdropLayer *)v7->_backdropLayer setMask:v7->_backdropMaskShapeLayer];
    [(CKPinnedConversationTypingBubble *)v7 _updateUserInterfaceStyles];
    v16 = [(CKPinnedConversationTypingBubble *)v7 layer];
    [v16 addSublayer:v7->_broadShadowLayer];

    v17 = [(CKPinnedConversationTypingBubble *)v7 layer];
    [v17 addSublayer:v7->_tightShadowLayer];

    v18 = [(CKPinnedConversationTypingBubble *)v7 layer];
    [v18 addSublayer:v7->_backdropLayer];

    v19 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    thinkingDotContainer = v7->_thinkingDotContainer;
    v7->_thinkingDotContainer = v19;

    v21 = v7->_thinkingDotContainer;
    [(CKPinnedConversationTypingBubble *)v7 bounds];
    -[CALayer setBounds:](v21, "setBounds:");
    v22 = [(CKPinnedConversationTypingBubble *)v7 layer];
    [v22 addSublayer:v7->_thinkingDotContainer];

    v23 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    thinkingDot = v7->_thinkingDot;
    v7->_thinkingDot = v23;

    v25 = (void *)MEMORY[0x1E4F427D0];
    [(CKPinnedConversationTypingBubble *)v7 thinkingDotDiameter];
    double v27 = v26;
    [(CKPinnedConversationTypingBubble *)v7 thinkingDotDiameter];
    objc_msgSend(v25, "bezierPathWithOvalInRect:", 0.0, 0.0, v27, v28);
    id v29 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setPath:](v7->_thinkingDot, "setPath:", [v29 CGPath]);
    [(CKPinnedConversationTypingBubble *)v7 _updateThinkingDotColor];
    v30 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
    v49[0] = &unk_1EDF16F68;
    v31 = NSNumber;
    [(CKPinnedConversationTypingBubble *)v7 thinkingDotOpacity];
    v32 = objc_msgSend(v31, "numberWithDouble:");
    v49[1] = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
    [v30 setValues:v33];

    [v30 setKeyTimes:&unk_1EDF150F8];
    [v30 setCalculationMode:*MEMORY[0x1E4F39D80]];
    [v30 setDuration:0.5];
    LODWORD(v34) = 1061271823;
    LODWORD(v35) = 1014679044;
    LODWORD(v36) = 1058306785;
    LODWORD(v37) = 1.0;
    v38 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v34 :v35 :v36 :v37];
    [v30 setTimingFunction:v38];

    LODWORD(v39) = 2139095040;
    [v30 setRepeatCount:v39];
    [v30 setAutoreverses:1];
    [v30 setFillMode:*MEMORY[0x1E4F39FA0]];
    [v30 setRemovedOnCompletion:0];
    [(CAShapeLayer *)v7->_thinkingDot addAnimation:v30 forKey:@"Opacity"];
    uint64_t v40 = [MEMORY[0x1E4F39C68] layer];
    thinkingDots = v7->_thinkingDots;
    v7->_thinkingDots = (CAReplicatorLayer *)v40;

    [(CAReplicatorLayer *)v7->_thinkingDots setInstanceCount:3];
    v42 = v7->_thinkingDots;
    [(CKPinnedConversationTypingBubble *)v7 thinkingDotDiameter];
    double v44 = v43;
    [(CKPinnedConversationTypingBubble *)v7 thinkingDotSpace];
    CATransform3DMakeTranslation(&v47, v44 + v45, 0.0, 0.0);
    [(CAReplicatorLayer *)v42 setInstanceTransform:&v47];
    [(CAReplicatorLayer *)v7->_thinkingDots setInstanceDelay:0.25];
    [(CAReplicatorLayer *)v7->_thinkingDots addSublayer:v7->_thinkingDot];
    [(CALayer *)v7->_thinkingDotContainer addSublayer:v7->_thinkingDots];
  }
  return v7;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)CKPinnedConversationTypingBubble;
  [(CKPinnedConversationTypingBubble *)&v24 layoutSubviews];
  memset(&v23, 0, sizeof(v23));
  memset(v22, 0, sizeof(v22));
  memset(v21, 0, sizeof(v21));
  id v20 = 0;
  [(CKPinnedConversationTypingBubble *)self calculateBezierPathWithOutputsForPath:&v20 largeBubbleFrame:&v23 mediumBubbleFrame:v22 smallBubbleFrame:v21];
  id v3 = v20;
  uint64_t v4 = [v3 CGPath];
  [v3 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  -[CKPinnedConversationActivityItemViewBackdropLayer setFrame:](self->_backdropLayer, "setFrame:");
  -[CAShapeLayer setFrame:](self->_backdropMaskShapeLayer, "setFrame:", v6, v8, v10, v12);
  -[CKPinnedConversationActivityItemViewShadowLayer setFrame:](self->_broadShadowLayer, "setFrame:", v6, v8, v10, v12);
  -[CKPinnedConversationActivityItemViewShadowLayer setFrame:](self->_tightShadowLayer, "setFrame:", v6, v8, v10, v12);
  [(CAShapeLayer *)self->_backdropMaskShapeLayer setPath:v4];
  [(CKPinnedConversationActivityItemViewShadowLayer *)self->_broadShadowLayer setShadowPath:v4];
  [(CKPinnedConversationActivityItemViewShadowLayer *)self->_tightShadowLayer setShadowPath:v4];
  [(CKPinnedConversationTypingBubble *)self thinkingDotContainerSize];
  double v14 = v13;
  double v16 = v15;
  CGFloat v17 = CGRectGetMinX(v23) + (v23.size.width - v13) * 0.5;
  CGFloat v18 = CGRectGetMinY(v23) + (v23.size.height - v16) * 0.5;
  v19 = [(CKPinnedConversationTypingBubble *)self thinkingDotContainer];

  objc_msgSend(v19, "setFrame:", v17, v18, v14, v16);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  memset(v13, 0, sizeof(v13));
  memset(v12, 0, sizeof(v12));
  memset(v11, 0, sizeof(v11));
  id v10 = 0;
  [(CKPinnedConversationTypingBubble *)self calculateBezierPathWithOutputsForPath:&v10 largeBubbleFrame:v13 mediumBubbleFrame:v12 smallBubbleFrame:v11];
  id v3 = v10;
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)activityItemToContactItemVerticalOverlap
{
  return 5.0;
}

- (CGSize)largeBubbleSize
{
  double v2 = 40.0;
  double v3 = 26.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)largeBubbleCornerRadius
{
  return 12.0;
}

- (CGSize)mediumBubbleSize
{
  double v2 = 9.0;
  double v3 = 9.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)smallBubbleSize
{
  double v2 = 5.0;
  double v3 = 5.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGPoint)mediumBubbleOffset
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)smallBubbleOffset
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)thinkingDotDiameter
{
  return 6.0;
}

- (id)thinkingDotColor
{
  return (id)[MEMORY[0x1E4F428B8] labelColor];
}

- (void)_updateThinkingDotColor
{
  id v3 = [(CKPinnedConversationTypingBubble *)self thinkingDotColor];
  -[CAShapeLayer setFillColor:](self->_thinkingDot, "setFillColor:", [v3 CGColor]);
}

- (double)thinkingDotOpacity
{
  return 0.45;
}

- (double)thinkingDotSpace
{
  return 3.0;
}

- (CGSize)thinkingDotContainerSize
{
  [(CKPinnedConversationTypingBubble *)self thinkingDotDiameter];
  double v4 = v3;
  [(CKPinnedConversationTypingBubble *)self thinkingDotSpace];
  double v6 = v5 + v5 + v4 * 3.0;
  [(CKPinnedConversationTypingBubble *)self thinkingDotDiameter];
  double v8 = v7;
  double v9 = v6;
  result.height = v8;
  result.width = v9;
  return result;
}

- (unint64_t)tailCornerAnchor
{
  int64_t originationDirection = self->_originationDirection;
  if (originationDirection == 1) {
    return 1;
  }
  else {
    return 4 * (originationDirection == 0);
  }
}

- (void)setPreferredTailAttachmentPointXCoordinate:(double)a3
{
  if (self->_preferredTailAttachmentPointXCoordinate != a3)
  {
    self->_preferredTailAttachmentPointXCoordinate = a3;
    [(CKPinnedConversationTypingBubble *)self setNeedsLayout];
  }
}

- (CGPoint)tailAttachmentPoint
{
  memset(v12, 0, sizeof(v12));
  memset(v11, 0, sizeof(v11));
  memset(&v10, 0, sizeof(v10));
  uint64_t v9 = 0;
  [(CKPinnedConversationTypingBubble *)self calculateBezierPathWithOutputsForPath:&v9 largeBubbleFrame:v12 mediumBubbleFrame:v11 smallBubbleFrame:&v10];
  unint64_t v3 = [(CKPinnedConversationTypingBubble *)self tailCornerAnchor];
  double v4 = 0.0;
  char v5 = v3 + 1;
  if (v3 + 1 > 9)
  {
    CGFloat MidX = 0.0;
    goto LABEL_7;
  }
  if (((1 << v5) & 0x221) != 0)
  {
    CGFloat MidX = CGRectGetMidX(v10);
    double MaxY = CGRectGetMaxY(v10);
LABEL_6:
    double v4 = MaxY;
    goto LABEL_7;
  }
  CGFloat MidX = 0.0;
  if (((1 << v5) & 0xC) != 0)
  {
    CGFloat MidX = CGRectGetMidX(v10);
    double MaxY = CGRectGetMinY(v10);
    goto LABEL_6;
  }
LABEL_7:
  double v8 = MidX;
  result.y = v4;
  result.x = v8;
  return result;
}

- (void)setOriginationDirection:(int64_t)a3
{
  if (self->_originationDirection != a3)
  {
    self->_int64_t originationDirection = a3;
    [(CKPinnedConversationTypingBubble *)self setNeedsLayout];
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

- (void)calculateBezierPathWithOutputsForPath:(id *)a3 largeBubbleFrame:(CGRect *)a4 mediumBubbleFrame:(CGRect *)a5 smallBubbleFrame:(CGRect *)a6
{
  [(CKPinnedConversationTypingBubble *)self largeBubbleSize];
  CGFloat v12 = v11;
  CGFloat v44 = v13;
  [(CKPinnedConversationTypingBubble *)self mediumBubbleSize];
  double v15 = v14;
  double v17 = v16;
  [(CKPinnedConversationTypingBubble *)self smallBubbleSize];
  CGFloat rect = v18;
  CGFloat v20 = v19;
  [(CKPinnedConversationTypingBubble *)self mediumBubbleOffset];
  double v46 = v21;
  double v40 = v22;
  [(CKPinnedConversationTypingBubble *)self smallBubbleOffset];
  double v24 = v23;
  double v26 = v25;
  [(CKPinnedConversationTypingBubble *)self largeBubbleCornerRadius];
  unint64_t v27 = [(CKPinnedConversationTypingBubble *)self tailCornerAnchor];
  double v28 = *MEMORY[0x1E4F1DB28];
  CGFloat v29 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v43 = v15;
  CGFloat v41 = v20;
  switch(v27)
  {
    case 1uLL:
      v50.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB28];
      v50.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DB28] + 8);
      v50.size.width = v15;
      v50.size.height = v17;
      v51.origin.double x = CGRectGetMaxX(v50) - v24;
      double x = v51.origin.x;
      v51.origin.y = v29;
      v51.size.width = rect;
      v51.size.height = v20;
      double v30 = v26 + CGRectGetMaxY(v51);
      v52.origin.double x = v28;
      v52.origin.y = v30;
      v52.size.width = v15;
      v52.size.height = v17;
      double v31 = v40 + CGRectGetMinY(v52);
      double v32 = v46;
      goto LABEL_5;
    case 2uLL:
      double v38 = *MEMORY[0x1E4F1DB28];
      v53.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB28];
      v53.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DB28] + 8);
      v53.size.width = v12;
      v53.size.height = v44;
      double v28 = v46 + CGRectGetMaxX(v53) - v15;
      v54.origin.double x = v28;
      v54.origin.y = v29;
      v54.size.width = v15;
      v54.size.height = v17;
      v55.origin.double x = CGRectGetMinX(v54) - v24;
      double x = v55.origin.x;
      v55.origin.y = v29;
      v55.size.width = rect;
      v55.size.height = v20;
      double v30 = v26 + CGRectGetMaxY(v55);
      v56.origin.double x = v28;
      v56.origin.y = v30;
      v56.size.width = v15;
      v56.size.height = v17;
      double v31 = v40 + CGRectGetMinY(v56);
      double v32 = v38;
      goto LABEL_5;
    case 4uLL:
      v57.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB28];
      v57.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DB28] + 8);
      v57.size.width = v15;
      v57.size.height = v17;
      double x = CGRectGetMaxX(v57) - v24;
      double v32 = v46;
      v58.origin.double x = v46;
      v58.origin.y = v29;
      v58.size.width = v12;
      v58.size.height = v44;
      double v30 = v40 + CGRectGetMaxY(v58) - v17;
      v59.origin.double x = v28;
      v59.origin.y = v30;
      v59.size.width = v15;
      v59.size.height = v17;
      CGFloat MaxY = CGRectGetMaxY(v59);
      double v31 = v29;
      double v33 = v26 + MaxY;
      goto LABEL_8;
    case 8uLL:
      v60.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB28];
      v60.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DB28] + 8);
      v60.size.width = v12;
      v60.size.height = v44;
      v61.origin.double x = v46 + CGRectGetMaxX(v60) - v15;
      CGFloat v47 = v61.origin.x;
      v61.origin.y = v29;
      v61.size.width = v15;
      v61.size.height = v17;
      double x = CGRectGetMinX(v61) - v24;
      v62.origin.double x = v28;
      v62.origin.y = v29;
      v62.size.width = v12;
      v62.size.height = v44;
      double v30 = v40 + CGRectGetMaxY(v62) - v17;
      v63.origin.double x = v47;
      v63.origin.y = v30;
      v63.size.width = v15;
      v63.size.height = v17;
      CGFloat v35 = CGRectGetMaxY(v63);
      double v31 = v29;
      double v33 = v26 + v35;
      double v32 = v28;
      double v28 = v47;
      goto LABEL_8;
    default:
      double v32 = *MEMORY[0x1E4F1DB28];
      double v30 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v31 = v30;
      double x = *MEMORY[0x1E4F1DB28];
LABEL_5:
      double v33 = v29;
LABEL_8:
      CGFloat v39 = v31;
      id v48 = [MEMORY[0x1E4F427D0] bezierPathWithRoundedRect:v32 cornerRadius:*(void *)&v38];
      double v36 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithOvalInRect:", v28, v30, v43, v17);
      double v37 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithOvalInRect:");
      [v48 appendPath:v36];
      [v48 appendPath:v37];
      if (a3) {
        *a3 = v48;
      }
      if (a4)
      {
        a4->origin.double x = v32;
        a4->origin.y = v39;
        a4->size.width = v12;
        a4->size.height = v44;
      }
      if (a5)
      {
        a5->origin.double x = v28;
        a5->origin.y = v30;
        a5->size.width = v43;
        a5->size.height = v17;
      }
      if (a6)
      {
        a6->origin.double x = x;
        a6->origin.y = v33;
        a6->size.width = rect;
        a6->size.height = v41;
      }

      return;
  }
}

- (CKPinnedConversationActivityItem)activityItem
{
  return (CKPinnedConversationActivityItem *)self->_typingBubbleActivityItem;
}

- (void)setActivityItem:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_typingBubbleActivityItem, a3);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKPinnedConversationTypingBubble;
  [(CKPinnedConversationTypingBubble *)&v4 traitCollectionDidChange:a3];
  [(CKPinnedConversationTypingBubble *)self _updateThinkingDotColor];
  [(CKPinnedConversationTypingBubble *)self _updateUserInterfaceStyles];
}

- (void)_updateUserInterfaceStyles
{
  unint64_t v3 = [(CKPinnedConversationTypingBubble *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  [(CKPinnedConversationActivityItemViewBackdropLayer *)self->_backdropLayer setUserInterfaceStyle:v4];
  [(CKPinnedConversationActivityItemViewShadowLayer *)self->_broadShadowLayer setUserInterfaceStyle:v4];
  tightShadowLayer = self->_tightShadowLayer;

  [(CKPinnedConversationActivityItemViewShadowLayer *)tightShadowLayer setUserInterfaceStyle:v4];
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

- (int64_t)originationHorizontalDirection
{
  return self->_originationHorizontalDirection;
}

- (void)setOriginationHorizontalDirection:(int64_t)a3
{
  self->_originationHorizontalDirection = a3;
}

- (CKPinnedConversationTypingBubbleActivityItem)typingBubbleActivityItem
{
  return self->_typingBubbleActivityItem;
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

- (void)setOriginationPoint:(CGPoint)a3
{
  self->_originationPoint = a3;
}

- (double)preferredTailAttachmentPointXCoordinate
{
  return self->_preferredTailAttachmentPointXCoordinate;
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

- (CALayer)thinkingDotContainer
{
  return self->_thinkingDotContainer;
}

- (void)setThinkingDotContainer:(id)a3
{
}

- (CAShapeLayer)thinkingDot
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thinkingDots, 0);
  objc_storeStrong((id *)&self->_thinkingDot, 0);
  objc_storeStrong((id *)&self->_thinkingDotContainer, 0);
  objc_storeStrong((id *)&self->_tightShadowLayer, 0);
  objc_storeStrong((id *)&self->_broadShadowLayer, 0);
  objc_storeStrong((id *)&self->_backdropMaskShapeLayer, 0);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_typingBubbleActivityItem, 0);

  objc_destroyWeak((id *)&self->_activityItemViewDelegate);
}

@end
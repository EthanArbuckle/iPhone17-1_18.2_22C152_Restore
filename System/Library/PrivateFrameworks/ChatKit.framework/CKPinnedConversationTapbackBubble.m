@interface CKPinnedConversationTapbackBubble
+ (CGRect)largeTailBalloonFrameForSize:(CGSize)a3 flipHorizontally:(BOOL)a4 flipVertically:(BOOL)a5;
+ (CGRect)smallTailBalloonFrameForSize:(CGSize)a3 flipHorizontally:(BOOL)a4 flipVertically:(BOOL)a5;
+ (CGRect)tapbackBalloonFrameForSize:(CGSize)a3 flipHorizontally:(BOOL)a4 flipVertically:(BOOL)a5;
+ (CGSize)largeTailBalloonSizeForSize:(CGSize)a3;
+ (CGSize)sizeThatFits:(CGSize)a3 flipHorizontally:(BOOL)a4 flipVertically:(BOOL)a5;
+ (CGSize)smallTailBalloonSizeForSize:(CGSize)a3;
+ (CGSize)tapbackBalloonSizeForSize:(CGSize)a3;
+ (char)colorTypeForTapBack:(int64_t)a3;
+ (id)tapBackBubblePathForSize:(CGSize)a3 tapbackBalloonFrame:(CGRect)a4 flipHorizontally:(BOOL)a5 flipVertically:(BOOL)a6;
- (BOOL)flipHorizontally;
- (BOOL)flipVertically;
- (BOOL)supportsActivityItemViewContentScale;
- (BOOL)supportsAlignmentWithOriginationSubAvatarFrame;
- (CAShapeLayer)backdropMaskShapeLayer;
- (CGPoint)originationPoint;
- (CGPoint)tailAttachmentPoint;
- (CGSize)parentAvatarViewSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKAcknowledgmentGlyphView)tapbackGlyph;
- (CKPinnedConversationActivityItem)activityItem;
- (CKPinnedConversationActivityItemViewBackdropLayer)backdropLayer;
- (CKPinnedConversationActivityItemViewDelegate)activityItemViewDelegate;
- (CKPinnedConversationActivityItemViewShadowLayer)broadShadowLayer;
- (CKPinnedConversationActivityItemViewShadowLayer)tightShadowLayer;
- (CKPinnedConversationTapbackBubble)initWithActivityItem:(id)a3;
- (CKPinnedConversationTapbackBubbleActivityItem)tapbackActivityItem;
- (IMTapback)displayedTapback;
- (UIView)tapbackContainerView;
- (UIView)tapbackView;
- (double)activityItemToContactItemVerticalOverlap;
- (double)preferredTailAttachmentPointXCoordinate;
- (int64_t)acknowledgmentType;
- (int64_t)activityItemViewContentScale;
- (int64_t)originationDirection;
- (int64_t)originationHorizontalDirection;
- (void)_updateAcknowledgmentType;
- (void)_updateUserInterfaceStyles;
- (void)configureWithTapback:(id)a3;
- (void)layoutSubviews;
- (void)setAcknowledgmentType:(int64_t)a3;
- (void)setActivityItem:(id)a3;
- (void)setActivityItemViewContentScale:(int64_t)a3;
- (void)setActivityItemViewDelegate:(id)a3;
- (void)setBackdropLayer:(id)a3;
- (void)setBackdropMaskShapeLayer:(id)a3;
- (void)setBroadShadowLayer:(id)a3;
- (void)setDisplayedTapback:(id)a3;
- (void)setOriginationDirection:(int64_t)a3;
- (void)setOriginationHorizontalDirection:(int64_t)a3;
- (void)setOriginationPoint:(CGPoint)a3;
- (void)setParentAvatarViewSize:(CGSize)a3;
- (void)setPreferredTailAttachmentPointXCoordinate:(double)a3;
- (void)setTapbackContainerView:(id)a3;
- (void)setTapbackGlyph:(id)a3;
- (void)setTapbackView:(id)a3;
- (void)setTightShadowLayer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CKPinnedConversationTapbackBubble

- (CKPinnedConversationTapbackBubble)initWithActivityItem:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKPinnedConversationTapbackBubble;
  v6 = [(CKPinnedConversationTapbackBubble *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tapbackActivityItem, a3);
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
    [(CKPinnedConversationTapbackBubble *)v7 _updateUserInterfaceStyles];
    v16 = [(CKPinnedConversationTapbackBubble *)v7 layer];
    [v16 addSublayer:v7->_broadShadowLayer];

    v17 = [(CKPinnedConversationTapbackBubble *)v7 layer];
    [v17 addSublayer:v7->_tightShadowLayer];

    v18 = [(CKPinnedConversationTapbackBubble *)v7 layer];
    [v18 addSublayer:v7->_backdropLayer];

    id v19 = objc_alloc(MEMORY[0x1E4F42FF0]);
    v20 = objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CKPinnedConversationTapbackBubble *)v7 setTapbackContainerView:v20];

    v21 = [(CKPinnedConversationTapbackBubble *)v7 tapbackContainerView];
    [(CKPinnedConversationTapbackBubble *)v7 addSubview:v21];

    [(CKPinnedConversationTapbackBubble *)v7 _updateAcknowledgmentType];
  }

  return v7;
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)CKPinnedConversationTapbackBubble;
  [(CKPinnedConversationTapbackBubble *)&v26 layoutSubviews];
  [(CKPinnedConversationTapbackBubble *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[CKPinnedConversationActivityItemViewBackdropLayer setFrame:](self->_backdropLayer, "setFrame:");
  -[CAShapeLayer setFrame:](self->_backdropMaskShapeLayer, "setFrame:", v4, v6, v8, v10);
  -[CKPinnedConversationActivityItemViewShadowLayer setFrame:](self->_broadShadowLayer, "setFrame:", v4, v6, v8, v10);
  -[CKPinnedConversationActivityItemViewShadowLayer setFrame:](self->_tightShadowLayer, "setFrame:", v4, v6, v8, v10);
  [(CKPinnedConversationTapbackBubble *)self bounds];
  double v12 = v11;
  double v14 = v13;
  objc_msgSend((id)objc_opt_class(), "tapbackBalloonFrameForSize:flipHorizontally:flipVertically:", -[CKPinnedConversationTapbackBubble flipHorizontally](self, "flipHorizontally"), -[CKPinnedConversationTapbackBubble flipVertically](self, "flipVertically"), v11, v13);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  objc_msgSend((id)objc_opt_class(), "tapBackBubblePathForSize:tapbackBalloonFrame:flipHorizontally:flipVertically:", -[CKPinnedConversationTapbackBubble flipHorizontally](self, "flipHorizontally"), -[CKPinnedConversationTapbackBubble flipVertically](self, "flipVertically"), v12, v14, v15, v17, v19, v21);
  id v23 = objc_claimAutoreleasedReturnValue();
  uint64_t v24 = [v23 CGPath];
  [(CAShapeLayer *)self->_backdropMaskShapeLayer setPath:v24];
  [(CKPinnedConversationActivityItemViewShadowLayer *)self->_broadShadowLayer setShadowPath:v24];
  [(CKPinnedConversationActivityItemViewShadowLayer *)self->_tightShadowLayer setShadowPath:v24];
  v25 = [(CKPinnedConversationTapbackBubble *)self tapbackContainerView];
  objc_msgSend(v25, "setFrame:", v16, v18, v20, v22);
}

+ (id)tapBackBubblePathForSize:(CGSize)a3 tapbackBalloonFrame:(CGRect)a4 flipHorizontally:(BOOL)a5 flipVertically:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v12 = a3.height;
  double v13 = a3.width;
  double v14 = [MEMORY[0x1E4F427D0] bezierPath];
  double v15 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithOvalInRect:", x, y, width, height);
  [v14 appendPath:v15];
  objc_msgSend((id)objc_opt_class(), "largeTailBalloonFrameForSize:flipHorizontally:flipVertically:", v7, v6, v13, v12);
  double v16 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithOvalInRect:");
  [v14 appendPath:v16];
  objc_msgSend((id)objc_opt_class(), "smallTailBalloonFrameForSize:flipHorizontally:flipVertically:", v7, v6, v13, v12);
  double v17 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithOvalInRect:");
  [v14 appendPath:v17];

  return v14;
}

- (double)activityItemToContactItemVerticalOverlap
{
  return 3.0;
}

- (BOOL)supportsActivityItemViewContentScale
{
  return 0;
}

- (BOOL)supportsAlignmentWithOriginationSubAvatarFrame
{
  return 0;
}

- (void)setAcknowledgmentType:(int64_t)a3
{
  uint64_t v5 = [(CKPinnedConversationTapbackBubble *)self tapbackGlyph];
  if (!v5
    || (BOOL v6 = (void *)v5,
        [(CKPinnedConversationTapbackBubble *)self tapbackGlyph],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 acknowledgmentType],
        v7,
        v6,
        v8 != a3))
  {
    double v9 = [(CKPinnedConversationTapbackBubble *)self tapbackGlyph];
    [v9 removeFromSuperview];

    double v10 = +[CKAcknowledgmentGlyphView glyphViewForAcknowledgmentType:glyphColor:](CKAcknowledgmentGlyphView, "glyphViewForAcknowledgmentType:glyphColor:", a3, [(id)objc_opt_class() colorTypeForTapBack:a3]);
    [(CKPinnedConversationTapbackBubble *)self setTapbackGlyph:v10];

    double v11 = [(CKPinnedConversationTapbackBubble *)self tapbackGlyph];
    [(CKPinnedConversationTapbackBubble *)self addSubview:v11];

    [(CKPinnedConversationTapbackBubble *)self setNeedsLayout];
  }
}

- (int64_t)acknowledgmentType
{
  v2 = [(CKPinnedConversationTapbackBubble *)self tapbackGlyph];
  int64_t v3 = [v2 acknowledgmentType];

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = objc_opt_class();
  BOOL v7 = [(CKPinnedConversationTapbackBubble *)self flipHorizontally];
  BOOL v8 = [(CKPinnedConversationTapbackBubble *)self flipVertically];

  objc_msgSend(v6, "sizeThatFits:flipHorizontally:flipVertically:", v7, v8, width, height);
  result.double height = v10;
  result.double width = v9;
  return result;
}

+ (CGSize)sizeThatFits:(CGSize)a3 flipHorizontally:(BOOL)a4 flipVertically:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double height = a3.height;
  double width = a3.width;
  double v9 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43890] addingSymbolicTraits:0 options:1];
  double v10 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v9 size:0.0];
  [v10 lineHeight];
  double v12 = v11 * 2.5;
  if (v12 < height) {
    double height = v12;
  }
  objc_msgSend((id)objc_opt_class(), "tapbackBalloonFrameForSize:flipHorizontally:flipVertically:", v6, v5, width, height);
  CGFloat v51 = v14;
  CGFloat v52 = v13;
  CGFloat v54 = v15;
  CGFloat v42 = v16;
  objc_msgSend((id)objc_opt_class(), "largeTailBalloonFrameForSize:flipHorizontally:flipVertically:", v6, v5, width, height);
  CGFloat v18 = v17;
  CGFloat v47 = v19;
  CGFloat v48 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v46 = v21;
  CGFloat v53 = v23;
  objc_msgSend((id)objc_opt_class(), "smallTailBalloonFrameForSize:flipHorizontally:flipVertically:", v6, v5, width, height);
  CGFloat y = v56.origin.y;
  CGFloat rect = v56.size.width;
  CGFloat v50 = v56.size.height;
  CGFloat x = v56.origin.x;
  CGFloat v41 = v56.origin.x;
  CGFloat v25 = v56.size.height;
  double MaxY = CGRectGetMaxY(v56);
  v57.origin.CGFloat x = v18;
  v57.origin.CGFloat y = v20;
  v57.size.double width = v22;
  v57.size.double height = v53;
  double v27 = CGRectGetMaxY(v57);
  if (MaxY < v27) {
    double MaxY = v27;
  }
  v58.origin.CGFloat x = v52;
  v58.origin.CGFloat y = v51;
  v58.size.double width = v54;
  v58.size.double height = v42;
  double v28 = CGRectGetMaxY(v58);
  if (MaxY >= v28) {
    double v28 = MaxY;
  }
  double v43 = v28;
  v59.origin.CGFloat x = x;
  v59.origin.CGFloat y = y;
  v59.size.double width = rect;
  v59.size.double height = v25;
  double MinY = CGRectGetMinY(v59);
  v60.origin.CGFloat y = v47;
  v60.origin.CGFloat x = v48;
  v60.size.double width = v46;
  v60.size.double height = v53;
  double v30 = CGRectGetMinY(v60);
  if (MinY >= v30) {
    double MinY = v30;
  }
  v61.origin.CGFloat x = v52;
  v61.origin.CGFloat y = v51;
  v61.size.double width = v54;
  v61.size.double height = v42;
  double v31 = CGRectGetMinY(v61);
  if (MinY < v31) {
    double v31 = MinY;
  }
  double v44 = v43 - v31;
  v62.origin.CGFloat x = v41;
  v62.origin.CGFloat y = y;
  v62.size.double height = v50;
  v62.size.double width = rect;
  double MaxX = CGRectGetMaxX(v62);
  v63.origin.CGFloat x = v48;
  v63.origin.CGFloat y = v47;
  v63.size.double width = v46;
  v63.size.double height = v53;
  double v33 = CGRectGetMaxX(v63);
  if (MaxX < v33) {
    double MaxX = v33;
  }
  v64.origin.CGFloat x = v52;
  v64.origin.CGFloat y = v51;
  v64.size.double width = v54;
  v64.size.double height = v42;
  double v34 = CGRectGetMaxX(v64);
  if (MaxX < v34) {
    double MaxX = v34;
  }
  v65.origin.CGFloat x = v41;
  v65.origin.CGFloat y = y;
  v65.size.double width = rect;
  v65.size.double height = v50;
  double MinX = CGRectGetMinX(v65);
  v66.origin.CGFloat x = v48;
  v66.origin.CGFloat y = v47;
  v66.size.double width = v46;
  v66.size.double height = v53;
  double v36 = CGRectGetMinX(v66);
  if (MinX >= v36) {
    double MinX = v36;
  }
  v67.origin.CGFloat x = v52;
  v67.origin.CGFloat y = v51;
  v67.size.double width = v54;
  v67.size.double height = v42;
  double v37 = CGRectGetMinX(v67);
  if (MinX < v37) {
    double v37 = MinX;
  }
  double v38 = MaxX - v37;

  double v39 = v38;
  double v40 = v44;
  result.double height = v40;
  result.double width = v39;
  return result;
}

+ (char)colorTypeForTapBack:(int64_t)a3
{
  double v4 = +[CKUIBehavior sharedBehaviors];
  BOOL v5 = [v4 theme];
  BOOL v6 = [v5 messageAcknowledgmentPinnedColor];

  if (a3 == 2000)
  {
    BOOL v7 = +[CKUIBehavior sharedBehaviors];
    BOOL v8 = [v7 theme];
    uint64_t v9 = [v8 messageAcknowledgmentRedColor];

    BOOL v6 = (void *)v9;
  }
  double v10 = +[CKUIBehavior sharedBehaviors];
  double v11 = [v10 theme];
  char v12 = [v11 ckAcknowledgementColorTypeForColor:v6];

  return v12;
}

+ (CGSize)tapbackBalloonSizeForSize:(CGSize)a3
{
  CGFloat v3 = a3.width / a3.height;
  double v4 = a3.width * 0.914285714;
  double v5 = a3.height * 0.8;
  if (v3 > 0.875) {
    double v4 = v5;
  }
  double v6 = v4;
  result.double height = v6;
  result.double width = v4;
  return result;
}

+ (CGSize)largeTailBalloonSizeForSize:(CGSize)a3
{
  objc_msgSend(a1, "tapbackBalloonSizeForSize:", a3.width, a3.height);
  double v4 = v3 * 0.375;
  double v5 = v4;
  result.double height = v5;
  result.double width = v4;
  return result;
}

+ (CGSize)smallTailBalloonSizeForSize:(CGSize)a3
{
  objc_msgSend(a1, "largeTailBalloonSizeForSize:", a3.width, a3.height);
  double v4 = v3 * 0.5;
  double v5 = v4;
  result.double height = v5;
  result.double width = v4;
  return result;
}

+ (CGRect)tapbackBalloonFrameForSize:(CGSize)a3 flipHorizontally:(BOOL)a4 flipVertically:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double height = a3.height;
  [a1 tapbackBalloonSizeForSize:a3.width];
  double v9 = v8;
  double v11 = v10;
  double v12 = v8 * 0.09375;
  double v13 = 0.0;
  if (v6) {
    double v12 = 0.0;
  }
  if (v5) {
    double v13 = height - v11;
  }
  result.size.double height = v11;
  result.size.double width = v9;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

+ (CGRect)largeTailBalloonFrameForSize:(CGSize)a3 flipHorizontally:(BOOL)a4 flipVertically:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double height = a3.height;
  double width = a3.width;
  objc_msgSend(a1, "largeTailBalloonSizeForSize:");
  double v11 = v10;
  double v13 = v12;
  objc_msgSend(a1, "tapbackBalloonFrameForSize:flipHorizontally:flipVertically:", v6, v5, width, height);
  uint64_t v18 = v14;
  uint64_t v19 = v15;
  double v20 = v16;
  uint64_t v21 = v17;
  double v22 = v16 * 0.09375;
  if (v6) {
    double v23 = CGRectGetMaxX(*(CGRect *)&v14) - (v11 - v22);
  }
  else {
    double v23 = CGRectGetMinX(*(CGRect *)&v14) - v22;
  }
  double v24 = v20 * 0.71875;
  uint64_t v25 = v18;
  uint64_t v26 = v19;
  double v27 = v20;
  uint64_t v28 = v21;
  if (v5) {
    double v29 = CGRectGetMaxY(*(CGRect *)&v25) - v24 - v13;
  }
  else {
    double v29 = v24 + CGRectGetMinY(*(CGRect *)&v25);
  }
  double v30 = v23;
  double v31 = v11;
  double v32 = v13;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.CGFloat y = v29;
  result.origin.CGFloat x = v30;
  return result;
}

+ (CGRect)smallTailBalloonFrameForSize:(CGSize)a3 flipHorizontally:(BOOL)a4 flipVertically:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double height = a3.height;
  double width = a3.width;
  objc_msgSend(a1, "smallTailBalloonSizeForSize:");
  double v11 = v10;
  double v13 = v12;
  objc_msgSend(a1, "largeTailBalloonFrameForSize:flipHorizontally:flipVertically:", v6, v5, width, height);
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  objc_msgSend(a1, "tapbackBalloonFrameForSize:flipHorizontally:flipVertically:", v6, v5, width, height);
  double v23 = v22 * 0.03125;
  uint64_t v24 = v15;
  uint64_t v25 = v17;
  uint64_t v26 = v19;
  uint64_t v27 = v21;
  if (v6) {
    double v28 = CGRectGetMinX(*(CGRect *)&v24) - (v11 - v23);
  }
  else {
    double v28 = CGRectGetMaxX(*(CGRect *)&v24) - v23;
  }
  uint64_t v29 = v15;
  uint64_t v30 = v17;
  uint64_t v31 = v19;
  uint64_t v32 = v21;
  if (v5) {
    double v33 = CGRectGetMinY(*(CGRect *)&v29) - (v13 - v23);
  }
  else {
    double v33 = CGRectGetMaxY(*(CGRect *)&v29) - v23;
  }
  double v34 = v28;
  double v35 = v11;
  double v36 = v13;
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v34;
  return result;
}

- (BOOL)flipHorizontally
{
  return 0;
}

- (BOOL)flipVertically
{
  return self->_originationDirection == 1;
}

- (CKPinnedConversationActivityItem)activityItem
{
  return (CKPinnedConversationActivityItem *)self->_tapbackActivityItem;
}

- (void)setActivityItem:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_tapbackActivityItem, a3);
    [(CKPinnedConversationTapbackBubble *)self _updateAcknowledgmentType];
  }
}

- (void)setPreferredTailAttachmentPointXCoordinate:(double)a3
{
  if (self->_preferredTailAttachmentPointXCoordinate != a3)
  {
    self->_preferredTailAttachmentPointXCoordinate = a3;
    [(CKPinnedConversationTapbackBubble *)self setNeedsLayout];
  }
}

- (void)setOriginationDirection:(int64_t)a3
{
  if (self->_originationDirection != a3)
  {
    self->_originationDirection = a3;
    [(CKPinnedConversationTapbackBubble *)self setNeedsLayout];
  }
}

- (CGPoint)tailAttachmentPoint
{
  double v3 = objc_opt_class();
  [(CKPinnedConversationTapbackBubble *)self bounds];
  objc_msgSend(v3, "smallTailBalloonFrameForSize:flipHorizontally:flipVertically:", -[CKPinnedConversationTapbackBubble flipHorizontally](self, "flipHorizontally"), -[CKPinnedConversationTapbackBubble flipVertically](self, "flipVertically"), v4, v5);
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  CGFloat MidX = CGRectGetMidX(v20);
  BOOL v11 = [(CKPinnedConversationTapbackBubble *)self flipVertically];
  CGFloat v12 = x;
  CGFloat v13 = y;
  CGFloat v14 = width;
  CGFloat v15 = height;
  if (v11) {
    double MaxY = CGRectGetMaxY(*(CGRect *)&v12);
  }
  else {
    double MaxY = CGRectGetMinY(*(CGRect *)&v12);
  }
  double v17 = MaxY;
  double v18 = MidX;
  result.CGFloat y = v17;
  result.CGFloat x = v18;
  return result;
}

- (void)_updateAcknowledgmentType
{
  double v3 = [(CKPinnedConversationTapbackBubbleActivityItem *)self->_tapbackActivityItem message];
  id v4 = [v3 tapback];

  [(CKPinnedConversationTapbackBubble *)self configureWithTapback:v4];
}

- (void)configureWithTapback:(id)a3
{
  id v32 = a3;
  id v4 = [(CKPinnedConversationTapbackBubble *)self displayedTapback];
  if (([v4 isEqual:v32] & 1) == 0)
  {
    double v5 = [(CKPinnedConversationTapbackBubble *)self tapbackView];
    [v5 removeFromSuperview];

    BOOL v6 = +[CKTapbackViewUtils viewFor:v32 isSelected:0];
    [(CKPinnedConversationTapbackBubble *)self setTapbackView:v6];
    [v6 platterEdgeInsets];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [(CKPinnedConversationTapbackBubble *)self setDisplayedTapback:v32];
    CGFloat v15 = [(CKPinnedConversationTapbackBubble *)self tapbackContainerView];
    [v15 addSubview:v6];

    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v16 = [v6 topAnchor];
    double v17 = [(CKPinnedConversationTapbackBubble *)self tapbackContainerView];
    double v18 = [v17 topAnchor];
    uint64_t v19 = [v16 constraintEqualToAnchor:v18 constant:v8];
    [v19 setActive:1];

    CGRect v20 = [v6 leadingAnchor];
    uint64_t v21 = [(CKPinnedConversationTapbackBubble *)self tapbackContainerView];
    double v22 = [v21 leadingAnchor];
    double v23 = [v20 constraintEqualToAnchor:v22 constant:v10];
    [v23 setActive:1];

    uint64_t v24 = [v6 bottomAnchor];
    uint64_t v25 = [(CKPinnedConversationTapbackBubble *)self tapbackContainerView];
    uint64_t v26 = [v25 bottomAnchor];
    uint64_t v27 = [v24 constraintEqualToAnchor:v26 constant:v12];
    [v27 setActive:1];

    double v28 = [v6 trailingAnchor];
    uint64_t v29 = [(CKPinnedConversationTapbackBubble *)self tapbackContainerView];
    uint64_t v30 = [v29 trailingAnchor];
    uint64_t v31 = [v28 constraintEqualToAnchor:v30 constant:v14];
    [v31 setActive:1];

    [(CKPinnedConversationTapbackBubble *)self setNeedsLayout];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKPinnedConversationTapbackBubble;
  [(CKPinnedConversationTapbackBubble *)&v4 traitCollectionDidChange:a3];
  [(CKPinnedConversationTapbackBubble *)self _updateUserInterfaceStyles];
}

- (void)_updateUserInterfaceStyles
{
  double v3 = [(CKPinnedConversationTapbackBubble *)self traitCollection];
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

- (CKPinnedConversationTapbackBubbleActivityItem)tapbackActivityItem
{
  return self->_tapbackActivityItem;
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

- (CKAcknowledgmentGlyphView)tapbackGlyph
{
  return self->_tapbackGlyph;
}

- (void)setTapbackGlyph:(id)a3
{
}

- (IMTapback)displayedTapback
{
  return self->_displayedTapback;
}

- (void)setDisplayedTapback:(id)a3
{
}

- (UIView)tapbackView
{
  return self->_tapbackView;
}

- (void)setTapbackView:(id)a3
{
}

- (UIView)tapbackContainerView
{
  return self->_tapbackContainerView;
}

- (void)setTapbackContainerView:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tightShadowLayer, 0);
  objc_storeStrong((id *)&self->_broadShadowLayer, 0);
  objc_storeStrong((id *)&self->_backdropMaskShapeLayer, 0);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_tapbackContainerView, 0);
  objc_storeStrong((id *)&self->_tapbackView, 0);
  objc_storeStrong((id *)&self->_displayedTapback, 0);
  objc_storeStrong((id *)&self->_tapbackGlyph, 0);
  objc_storeStrong((id *)&self->_tapbackActivityItem, 0);

  objc_destroyWeak((id *)&self->_activityItemViewDelegate);
}

@end
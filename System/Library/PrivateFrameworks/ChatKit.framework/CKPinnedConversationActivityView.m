@interface CKPinnedConversationActivityView
- (BOOL)haveAttachedContactItemViewsForActivityViews:(id)a3;
- (BOOL)isSuppressingActivity;
- (BOOL)nextContactItemIsClockwiseForOriginationDirection:(int64_t)a3 contactItemAlignment:(int64_t)a4;
- (BOOL)showContentAlignmentDebugFrames;
- (CAShapeLayer)activityItemAttachmentCircleDebugLayer;
- (CAShapeLayer)innerContentAlignmentDebugLayer;
- (CAShapeLayer)originationPointDebugLayer;
- (CAShapeLayer)outerContentAlignmentDebugLayer;
- (CGPoint)_convertPointInOwnCoordinateSpace:(CGPoint)a3 toUnscaledCoordinateSpaceOfSubview:(id)a4;
- (CGPoint)activityItemOriginationPoint;
- (CGPoint)pointAlongCircle:(CGRect)a3 atArcLength:(double)a4 fromPoint:(CGPoint)a5 clockwise:(BOOL)a6;
- (CGRect)activityItemOriginationSubAvatarFrame;
- (CGRect)avatarFrame;
- (CGRect)innerContentAlignmentFrame;
- (CGRect)outerContentAlignmentFrame;
- (CKPinnedConversationActivitySnapshot)latestSnapshot;
- (CKPinnedConversationActivityView)initWithFrame:(CGRect)a3;
- (NSArray)displayedContacts;
- (NSMutableArray)activityItemViews;
- (NSMutableArray)contactItemViews;
- (double)activityItemAttachmentCircleRadiusInsetForAvatarFrame:(CGRect)a3;
- (double)circleXCoordinateForYCoordinate:(double)a3 radius:(double)a4 centerPoint:(CGPoint)a5 contentAlignment:(int64_t)a6;
- (double)contactItemViewCenterXCoordinateForYCoordinate:(double)a3 avatarFrame:(CGRect)a4 contentAlignment:(int64_t)a5;
- (double)contactItemViewDiameterForAvatarFrame:(CGRect)a3;
- (double)tailAttachmentXCoordinateForYCoordinate:(double)a3 avatarFrame:(CGRect)a4 contentAlignment:(int64_t)a5;
- (id)_activityItemViewWithActivityItemIdentifier:(id)a3;
- (id)_presentedActivityItems;
- (id)_unattachedContactItemViews;
- (id)contactItemViewMatchingContactItemIdentifier:(id)a3 fromContactItemViews:(id)a4;
- (int64_t)activityItemOriginationDirection;
- (int64_t)activityViewContentAlignmentForContactItemAlignment:(int64_t)a3;
- (void)_layoutUnattachedContactItemViews:(id)a3 withContentScale:(id)a4 applyingTransform:(BOOL)a5;
- (void)_layoutViewsAssociatedWithActivityItemViews:(id)a3 excludingContactItemViews:(id)a4 withContentScale:(id)a5 applyingTransform:(BOOL)a6 updatingActivityItemViews:(BOOL)a7 updatingAttachedContactItemViews:(BOOL)a8;
- (void)_updateSnapshotAnimated:(BOOL)a3 completion:(id)a4;
- (void)applySnapshot:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)layoutSubviews;
- (void)resetToEmptySnapshot;
- (void)setActivityItemAttachmentCircleDebugLayer:(id)a3;
- (void)setActivityItemOriginationDirection:(int64_t)a3;
- (void)setActivityItemOriginationPoint:(CGPoint)a3;
- (void)setActivityItemOriginationSubAvatarFrame:(CGRect)a3;
- (void)setActivityItemViews:(id)a3;
- (void)setAvatarFrame:(CGRect)a3;
- (void)setContactItemViews:(id)a3;
- (void)setInnerContentAlignmentDebugLayer:(id)a3;
- (void)setInnerContentAlignmentFrame:(CGRect)a3;
- (void)setLatestSnapshot:(id)a3;
- (void)setOriginationPointDebugLayer:(id)a3;
- (void)setOuterContentAlignmentDebugLayer:(id)a3;
- (void)setOuterContentAlignmentFrame:(CGRect)a3;
- (void)setShowContentAlignmentDebugFrames:(BOOL)a3;
- (void)setSuppressingActivity:(BOOL)a3;
- (void)setSuppressingActivity:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation CKPinnedConversationActivityView

- (CKPinnedConversationActivityView)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)CKPinnedConversationActivityView;
  v7 = -[CKPinnedConversationActivityView initWithFrame:](&v20, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    [(CKPinnedConversationActivityView *)v7 setUserInteractionEnabled:0];
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    activityItemViews = v8->_activityItemViews;
    v8->_activityItemViews = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    contactItemViews = v8->_contactItemViews;
    v8->_contactItemViews = v11;

    CGPoint v13 = (CGPoint)*MEMORY[0x1E4F1DB28];
    CGSize v14 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v8->_innerContentAlignmentFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v8->_innerContentAlignmentFrame.size = v14;
    v8->_outerContentAlignmentFrame.origin = v13;
    v8->_outerContentAlignmentFrame.size = v14;
    v13.CGFloat x = x;
    v14.CGFloat width = y;
    CGFloat v15 = width;
    CGFloat v16 = height;
    CGFloat MidX = CGRectGetMidX(*(CGRect *)&v13.x);
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGFloat MidY = CGRectGetMidY(v21);
    v8->_activityItemOriginationPoint.CGFloat x = MidX;
    v8->_activityItemOriginationPoint.CGFloat y = MidY;
  }
  return v8;
}

- (void)setShowContentAlignmentDebugFrames:(BOOL)a3
{
  if (self->_showContentAlignmentDebugFrames != a3)
  {
    self->_showContentAlignmentDebugFrames = a3;
    if (a3)
    {
      v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
      innerContentAlignmentDebugLayer = self->_innerContentAlignmentDebugLayer;
      self->_innerContentAlignmentDebugLayer = v4;

      [(CAShapeLayer *)self->_innerContentAlignmentDebugLayer setFillColor:0];
      id v6 = [MEMORY[0x1E4F428B8] systemPinkColor];
      -[CAShapeLayer setStrokeColor:](self->_innerContentAlignmentDebugLayer, "setStrokeColor:", [v6 CGColor]);

      [(CAShapeLayer *)self->_innerContentAlignmentDebugLayer setLineDashPattern:&unk_1EDF15188];
      v7 = [(CKPinnedConversationActivityView *)self layer];
      [v7 addSublayer:self->_innerContentAlignmentDebugLayer];

      v8 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
      outerContentAlignmentDebugLayer = self->_outerContentAlignmentDebugLayer;
      self->_outerContentAlignmentDebugLayer = v8;

      [(CAShapeLayer *)self->_outerContentAlignmentDebugLayer setFillColor:0];
      id v10 = [MEMORY[0x1E4F428B8] systemBlueColor];
      -[CAShapeLayer setStrokeColor:](self->_outerContentAlignmentDebugLayer, "setStrokeColor:", [v10 CGColor]);

      [(CAShapeLayer *)self->_outerContentAlignmentDebugLayer setLineDashPattern:&unk_1EDF151A0];
      v11 = [(CKPinnedConversationActivityView *)self layer];
      [v11 addSublayer:self->_outerContentAlignmentDebugLayer];

      v12 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
      activityItemAttachmentCircleDebugLayer = self->_activityItemAttachmentCircleDebugLayer;
      self->_activityItemAttachmentCircleDebugLayer = v12;

      [(CAShapeLayer *)self->_activityItemAttachmentCircleDebugLayer setFillColor:0];
      id v14 = [MEMORY[0x1E4F428B8] systemOrangeColor];
      -[CAShapeLayer setStrokeColor:](self->_activityItemAttachmentCircleDebugLayer, "setStrokeColor:", [v14 CGColor]);

      [(CAShapeLayer *)self->_activityItemAttachmentCircleDebugLayer setLineDashPattern:&unk_1EDF151B8];
      CGFloat v15 = [(CKPinnedConversationActivityView *)self layer];
      [v15 addSublayer:self->_activityItemAttachmentCircleDebugLayer];

      CGFloat v16 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
      originationPointDebugLayer = self->_originationPointDebugLayer;
      self->_originationPointDebugLayer = v16;

      id v18 = [MEMORY[0x1E4F428B8] redColor];
      -[CAShapeLayer setFillColor:](self->_originationPointDebugLayer, "setFillColor:", [v18 CGColor]);

      v19 = [(CKPinnedConversationActivityView *)self layer];
      [v19 addSublayer:self->_originationPointDebugLayer];
    }
    else
    {
      [(CAShapeLayer *)self->_innerContentAlignmentDebugLayer removeFromSuperlayer];
      objc_super v20 = self->_innerContentAlignmentDebugLayer;
      self->_innerContentAlignmentDebugLayer = 0;

      [(CAShapeLayer *)self->_outerContentAlignmentDebugLayer removeFromSuperlayer];
      CGRect v21 = self->_outerContentAlignmentDebugLayer;
      self->_outerContentAlignmentDebugLayer = 0;

      [(CAShapeLayer *)self->_activityItemAttachmentCircleDebugLayer removeFromSuperlayer];
      v22 = self->_activityItemAttachmentCircleDebugLayer;
      self->_activityItemAttachmentCircleDebugLayer = 0;

      [(CAShapeLayer *)self->_originationPointDebugLayer removeFromSuperlayer];
      v19 = self->_originationPointDebugLayer;
      self->_originationPointDebugLayer = 0;
    }

    [(CKPinnedConversationActivityView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CKPinnedConversationActivityView;
  [(CKPinnedConversationActivityView *)&v9 layoutSubviews];
  [(CKPinnedConversationActivityView *)self _layoutViewsAssociatedWithActivityItemViews:self->_activityItemViews excludingContactItemViews:MEMORY[0x1E4F1CBF0] withContentScale:0 applyingTransform:0 updatingActivityItemViews:1 updatingAttachedContactItemViews:1];
  v3 = [(CKPinnedConversationActivityView *)self _unattachedContactItemViews];
  [(CKPinnedConversationActivityView *)self _layoutUnattachedContactItemViews:v3 withContentScale:0 applyingTransform:0];
  if (self->_showContentAlignmentDebugFrames)
  {
    [(CKPinnedConversationActivityView *)self bounds];
    -[CAShapeLayer setFrame:](self->_innerContentAlignmentDebugLayer, "setFrame:");
    objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", self->_innerContentAlignmentFrame.origin.x, self->_innerContentAlignmentFrame.origin.y, self->_innerContentAlignmentFrame.size.width, self->_innerContentAlignmentFrame.size.height);
    id v4 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setPath:](self->_innerContentAlignmentDebugLayer, "setPath:", [v4 CGPath]);

    [(CKPinnedConversationActivityView *)self bounds];
    -[CAShapeLayer setFrame:](self->_outerContentAlignmentDebugLayer, "setFrame:");
    objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", self->_outerContentAlignmentFrame.origin.x, self->_outerContentAlignmentFrame.origin.y, self->_outerContentAlignmentFrame.size.width, self->_outerContentAlignmentFrame.size.height);
    id v5 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setPath:](self->_outerContentAlignmentDebugLayer, "setPath:", [v5 CGPath]);

    [(CKPinnedConversationActivityView *)self bounds];
    -[CAShapeLayer setFrame:](self->_activityItemAttachmentCircleDebugLayer, "setFrame:");
    -[CKPinnedConversationActivityView activityItemAttachmentCircleRadiusInsetForAvatarFrame:](self, "activityItemAttachmentCircleRadiusInsetForAvatarFrame:", self->_avatarFrame.origin.x, self->_avatarFrame.origin.y, self->_avatarFrame.size.width, self->_avatarFrame.size.height);
    CGRect v10 = CGRectInset(self->_avatarFrame, v6, v6);
    objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithOvalInRect:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
    id v7 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setPath:](self->_activityItemAttachmentCircleDebugLayer, "setPath:", [v7 CGPath]);

    objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithOvalInRect:", self->_activityItemOriginationPoint.x + -3.0, self->_activityItemOriginationPoint.y + -3.0, 6.0, 6.0);
    id v8 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setPath:](self->_originationPointDebugLayer, "setPath:", [v8 CGPath]);
  }
}

- (id)_unattachedContactItemViews
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = self->_activityItemViews;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = [*(id *)(*((void *)&v26 + 1) + 8 * i) activityItem];
        CGRect v10 = [v9 attachedContactItemIdentifier];

        if ([v10 length]) {
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v12 = self->_contactItemViews;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        id v18 = objc_msgSend(v17, "pinnedConversationContactItem", (void)v22);
        v19 = [v18 contactItemIdentifier];

        if ([v19 length] && (objc_msgSend(v3, "containsObject:", v19) & 1) == 0) {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v14);
  }

  objc_super v20 = (void *)[v11 copy];

  return v20;
}

- (id)_presentedActivityItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_activityItemViews;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "activityItem", (void)v12);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  CGRect v10 = (void *)[v3 copy];

  return v10;
}

- (id)_activityItemViewWithActivityItemIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_activityItemViews;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        CGRect v10 = objc_msgSend(v9, "activityItem", (void)v13);
        id v11 = [v10 activityItemIdentifier];
        if ([v11 isEqualToString:v4])
        {
          id v6 = v9;

          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setActivityItemOriginationDirection:(int64_t)a3
{
  if (self->_activityItemOriginationDirection != a3)
  {
    self->_activityItemOriginationDirection = a3;
    [(CKPinnedConversationActivityView *)self setNeedsLayout];
  }
}

- (void)setInnerContentAlignmentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_innerContentAlignmentFrame = &self->_innerContentAlignmentFrame;
  if (!CGRectEqualToRect(a3, self->_innerContentAlignmentFrame))
  {
    p_innerContentAlignmentFrame->origin.CGFloat x = x;
    p_innerContentAlignmentFrame->origin.CGFloat y = y;
    p_innerContentAlignmentFrame->size.CGFloat width = width;
    p_innerContentAlignmentFrame->size.CGFloat height = height;
    [(CKPinnedConversationActivityView *)self setNeedsLayout];
  }
}

- (void)setOuterContentAlignmentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_outerContentAlignmentFrame = &self->_outerContentAlignmentFrame;
  if (!CGRectEqualToRect(a3, self->_outerContentAlignmentFrame))
  {
    p_outerContentAlignmentFrame->origin.CGFloat x = x;
    p_outerContentAlignmentFrame->origin.CGFloat y = y;
    p_outerContentAlignmentFrame->size.CGFloat width = width;
    p_outerContentAlignmentFrame->size.CGFloat height = height;
    [(CKPinnedConversationActivityView *)self setNeedsLayout];
  }
}

- (void)setActivityItemOriginationPoint:(CGPoint)a3
{
  if (self->_activityItemOriginationPoint.x != a3.x || self->_activityItemOriginationPoint.y != a3.y)
  {
    self->_activityItemOriginationPoint = a3;
    [(CKPinnedConversationActivityView *)self setNeedsLayout];
  }
}

- (id)contactItemViewMatchingContactItemIdentifier:(id)a3 fromContactItemViews:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        CGRect v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "pinnedConversationContactItem", (void)v14);
        long long v12 = [v11 contactItemIdentifier];

        if ([v12 isEqualToString:v5])
        {
          id v7 = v10;

          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)applySnapshot:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  objc_storeStrong((id *)&self->_latestSnapshot, a3);
  id v8 = a5;
  [(CKPinnedConversationActivityView *)self _updateSnapshotAnimated:v6 completion:v8];
}

- (void)_updateSnapshotAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v266 = *MEMORY[0x1E4F143B8];
  id v145 = a4;
  BOOL v155 = v4;
  if ([(CKPinnedConversationActivityView *)self isSuppressingActivity])
  {
    BOOL v6 = +[CKPinnedConversationActivitySnapshot emptySnapshot];
  }
  else
  {
    BOOL v6 = self->_latestSnapshot;
  }
  id v7 = v6;
  id v8 = [(CKPinnedConversationActivityView *)self _presentedActivityItems];
  v146 = v7;
  objc_super v9 = [(CKPinnedConversationActivitySnapshot *)v7 activityItems];
  id v161 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v160 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v159 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v158 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v250 = 0u;
  long long v251 = 0u;
  long long v252 = 0u;
  long long v253 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v250 objects:v265 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v251;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v251 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v250 + 1) + 8 * i);
        long long v17 = [v16 activityItemIdentifier];
        BOOL v18 = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke((uint64_t)v17, v8, v17);
        uint64_t v19 = v10;
        if (!v18)
        {
          if ([v16 activityItemAppearsWithAnimation]) {
            uint64_t v19 = v161;
          }
          else {
            uint64_t v19 = v160;
          }
        }
        [v19 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v250 objects:v265 count:16];
    }
    while (v13);
  }

  long long v248 = 0u;
  long long v249 = 0u;
  long long v246 = 0u;
  long long v247 = 0u;
  id v20 = v8;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v246 objects:v264 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v247;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v247 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = *(void **)(*((void *)&v246 + 1) + 8 * j);
        long long v26 = [v25 activityItemIdentifier];
        if (!__71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke((uint64_t)v26, v10, v26))
        {
          if ([v25 activityItemDisappearsWithAnimation]) {
            long long v27 = v159;
          }
          else {
            long long v27 = v158;
          }
          [v27 addObject:v25];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v246 objects:v264 count:16];
    }
    while (v22);
  }
  v142 = v10;

  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v242 = 0u;
  long long v243 = 0u;
  long long v244 = 0u;
  long long v245 = 0u;
  id v29 = v20;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v242 objects:v263 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v243;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v243 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = [*(id *)(*((void *)&v242 + 1) + 8 * k) attachedContactItemIdentifier];
        if ([v34 length]) {
          [v28 addObject:v34];
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v242 objects:v263 count:16];
    }
    while (v31);
  }

  id v172 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v238 = 0u;
  long long v239 = 0u;
  long long v240 = 0u;
  long long v241 = 0u;
  id v35 = v11;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v238 objects:v262 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v239;
    do
    {
      for (uint64_t m = 0; m != v37; ++m)
      {
        if (*(void *)v239 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = [*(id *)(*((void *)&v238 + 1) + 8 * m) attachedContactItemIdentifier];
        if ([v40 length]) {
          [v172 addObject:v40];
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v238 objects:v262 count:16];
    }
    while (v37);
  }
  v143 = v35;
  v144 = v29;

  id v148 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  dispatch_group_t group = (dispatch_group_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v157 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v149 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v151 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v147 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v42 = [(CKPinnedConversationActivityView *)self contactItemViews];
  v170 = (void *)[v42 copy];

  [(CKPinnedConversationActivitySnapshot *)v146 contactItems];
  long long v234 = 0u;
  long long v235 = 0u;
  long long v236 = 0u;
  long long v237 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v43 = [obj countByEnumeratingWithState:&v234 objects:v261 count:16];
  v153 = v28;
  v154 = v41;
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v168 = *(void *)v235;
    do
    {
      uint64_t v45 = 0;
      do
      {
        if (*(void *)v235 != v168) {
          objc_enumerationMutation(obj);
        }
        v46 = *(void **)(*((void *)&v234 + 1) + 8 * v45);
        v47 = [v46 contactItemIdentifier];
        int v48 = [v172 containsObject:v47];
        v49 = [(CKPinnedConversationActivityView *)self contactItemViewMatchingContactItemIdentifier:v47 fromContactItemViews:v170];
        v50 = v49;
        if (v48)
        {
          if (!v49) {
            goto LABEL_55;
          }
          char v51 = [v28 containsObject:v47];
          v52 = [v50 pinnedConversationContactItem];
          uint64_t v53 = [v52 contactItemAlignment];
          uint64_t v54 = [v46 contactItemAlignment];

          if ((v51 & 1) == 0 && v53 != v54)
          {
            [v148 addObject:v50];
            id v28 = v153;
            id v41 = v154;
LABEL_55:
            v55 = [v46 contactItemView];
            [group addObject:v55];
            v56 = v157;
LABEL_62:
            [v56 addObject:v55];

            goto LABEL_63;
          }
          [v157 addObject:v50];
          [v147 addObject:v50];
          id v28 = v153;
          id v41 = v154;
        }
        else
        {
          if (!v49
            || ([v49 pinnedConversationContactItem],
                v57 = objc_claimAutoreleasedReturnValue(),
                uint64_t v58 = [v57 contactItemAlignment],
                v57,
                v58 != [v46 contactItemAlignment]))
          {
            v55 = [v46 contactItemView];
            [group addObject:v55];
            v56 = v41;
            if (v155)
            {
              [v151 addObject:v55];
              v56 = v149;
            }
            goto LABEL_62;
          }
          if (v155) {
            v59 = v151;
          }
          else {
            v59 = v41;
          }
          [v59 addObject:v50];
        }
LABEL_63:

        ++v45;
      }
      while (v44 != v45);
      uint64_t v60 = [obj countByEnumeratingWithState:&v234 objects:v261 count:16];
      uint64_t v44 = v60;
    }
    while (v60);
  }

  id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v61 addObjectsFromArray:v157];
  [v61 addObjectsFromArray:v151];
  [v61 addObjectsFromArray:v41];
  long long v232 = 0u;
  long long v233 = 0u;
  long long v230 = 0u;
  long long v231 = 0u;
  id v62 = v170;
  uint64_t v63 = [v62 countByEnumeratingWithState:&v230 objects:v260 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v231;
    do
    {
      for (uint64_t n = 0; n != v64; ++n)
      {
        if (*(void *)v231 != v65) {
          objc_enumerationMutation(v62);
        }
        uint64_t v67 = *(void *)(*((void *)&v230 + 1) + 8 * n);
        if (([v148 containsObjectIdenticalTo:v67] & 1) == 0
          && ([v61 containsObjectIdenticalTo:v67] & 1) == 0)
        {
          [v148 addObject:v67];
        }
      }
      uint64_t v64 = [v62 countByEnumeratingWithState:&v230 objects:v260 count:16];
    }
    while (v64);
  }
  v141 = v62;

  long long v228 = 0u;
  long long v229 = 0u;
  long long v226 = 0u;
  long long v227 = 0u;
  id v68 = obj;
  uint64_t v69 = [v68 countByEnumeratingWithState:&v226 objects:v259 count:16];
  if (v69)
  {
    uint64_t v70 = v69;
    uint64_t v71 = *(void *)v227;
    do
    {
      for (iuint64_t i = 0; ii != v70; ++ii)
      {
        if (*(void *)v227 != v71) {
          objc_enumerationMutation(v68);
        }
        v73 = *(void **)(*((void *)&v226 + 1) + 8 * ii);
        v74 = [v73 contactItemIdentifier];
        v75 = [(CKPinnedConversationActivityView *)self contactItemViewMatchingContactItemIdentifier:v74 fromContactItemViews:v61];
        [v75 setPinnedConversationContactItem:v73];
      }
      uint64_t v70 = [v68 countByEnumeratingWithState:&v226 objects:v259 count:16];
    }
    while (v70);
  }
  id obja = v61;
  v140 = v68;

  id v169 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v152 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v171 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v150 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v76 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v76 addObjectsFromArray:v158];
  [v76 addObjectsFromArray:v159];
  long long v224 = 0u;
  long long v225 = 0u;
  long long v222 = 0u;
  long long v223 = 0u;
  id v163 = v76;
  uint64_t v77 = [v163 countByEnumeratingWithState:&v222 objects:v258 count:16];
  if (v77)
  {
    uint64_t v78 = v77;
    uint64_t v79 = *(void *)v223;
    do
    {
      for (juint64_t j = 0; jj != v78; ++jj)
      {
        if (*(void *)v223 != v79) {
          objc_enumerationMutation(v163);
        }
        v81 = *(void **)(*((void *)&v222 + 1) + 8 * jj);
        v82 = [v81 activityItemIdentifier];
        v83 = [(CKPinnedConversationActivityView *)self _activityItemViewWithActivityItemIdentifier:v82];
        if (v155 && [v81 activityItemDisappearsWithAnimation])
        {
          [v150 addObject:v83];
        }
        else
        {
          [v83 removeFromSuperview];
          [(NSMutableArray *)self->_activityItemViews removeObject:v83];
        }
      }
      uint64_t v78 = [v163 countByEnumeratingWithState:&v222 objects:v258 count:16];
    }
    while (v78);
  }

  id v84 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v84 addObjectsFromArray:v160];
  [v84 addObjectsFromArray:v161];
  long long v220 = 0u;
  long long v221 = 0u;
  long long v218 = 0u;
  long long v219 = 0u;
  id v162 = v84;
  uint64_t v85 = [v162 countByEnumeratingWithState:&v218 objects:v257 count:16];
  if (v85)
  {
    uint64_t v86 = v85;
    uint64_t v87 = *(void *)v219;
    do
    {
      for (kuint64_t k = 0; kk != v86; ++kk)
      {
        if (*(void *)v219 != v87) {
          objc_enumerationMutation(v162);
        }
        v89 = *(void **)(*((void *)&v218 + 1) + 8 * kk);
        v90 = [v89 activityItemView];
        [v90 setActivityItemViewDelegate:self];
        [(NSMutableArray *)self->_activityItemViews addObject:v90];
        [(CKPinnedConversationActivityView *)self addSubview:v90];
        v91 = v171;
        if (v155)
        {
          int v92 = [v89 activityItemAppearsWithAnimation];
          v91 = v171;
          if (v92)
          {
            [v152 addObject:v90];
            v91 = v169;
          }
        }
        [v91 addObject:v90];
      }
      uint64_t v86 = [v162 countByEnumeratingWithState:&v218 objects:v257 count:16];
    }
    while (v86);
  }

  long long v216 = 0u;
  long long v217 = 0u;
  long long v214 = 0u;
  long long v215 = 0u;
  v93 = group;
  uint64_t v94 = [v93 countByEnumeratingWithState:&v214 objects:v256 count:16];
  if (v94)
  {
    uint64_t v95 = v94;
    uint64_t v96 = *(void *)v215;
    do
    {
      for (muint64_t m = 0; mm != v95; ++mm)
      {
        if (*(void *)v215 != v96) {
          objc_enumerationMutation(v93);
        }
        uint64_t v98 = *(void *)(*((void *)&v214 + 1) + 8 * mm);
        [(CKPinnedConversationActivityView *)self addSubview:v98];
        [(NSMutableArray *)self->_contactItemViews addObject:v98];
      }
      uint64_t v95 = [v93 countByEnumeratingWithState:&v214 objects:v256 count:16];
    }
    while (v95);
  }

  v99 = dispatch_group_create();
  if ([v150 count])
  {
    dispatch_group_enter(v99);
    [(NSMutableArray *)self->_activityItemViews removeObjectsInArray:v150];
    v100 = (void *)MEMORY[0x1E4F42FF0];
    v212[0] = MEMORY[0x1E4F143A8];
    v212[1] = 3221225472;
    v212[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_3;
    v212[3] = &unk_1E5620AF8;
    v212[4] = self;
    id v213 = v150;
    v209[0] = MEMORY[0x1E4F143A8];
    v209[1] = 3221225472;
    v209[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_49;
    v209[3] = &unk_1E5621EA8;
    id v210 = v213;
    v211 = v99;
    [v100 animateWithDuration:4 delay:v212 usingSpringWithDamping:v209 initialSpringVelocity:0.8 options:0.0 animations:0.75 completion:0.0];
  }
  if ([v148 count])
  {
    dispatch_group_enter(v99);
    [(NSMutableArray *)self->_contactItemViews removeObjectsInArray:v148];
    v101 = (void *)MEMORY[0x1E4F42FF0];
    v207[0] = MEMORY[0x1E4F143A8];
    v207[1] = 3221225472;
    v207[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_2_51;
    v207[3] = &unk_1E5620AF8;
    v207[4] = self;
    id v208 = v148;
    v204[0] = MEMORY[0x1E4F143A8];
    v204[1] = 3221225472;
    v204[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_3_52;
    v204[3] = &unk_1E5621EA8;
    id v205 = v208;
    v206 = v99;
    [v101 animateWithDuration:4 delay:v207 usingSpringWithDamping:v204 initialSpringVelocity:0.8 options:0.0 animations:0.75 completion:0.0];
  }
  groupa = v99;
  v156 = v93;
  v102 = [(CKPinnedConversationActivitySnapshot *)v146 contactItems];
  uint64_t v103 = [v102 count];
  p_contactItemViews = &self->_contactItemViews;
  uint64_t v105 = [(NSMutableArray *)self->_contactItemViews count];

  if (v103 != v105)
  {
    v106 = [(CKPinnedConversationActivitySnapshot *)v146 contactItems];
    uint64_t v138 = [v106 count];
    uint64_t v139 = [(NSMutableArray *)*p_contactItemViews count];
    _IMWarn();
  }
  id v107 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v200 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  v108 = [(CKPinnedConversationActivitySnapshot *)v146 contactItems];
  uint64_t v109 = [v108 countByEnumeratingWithState:&v200 objects:v255 count:16];
  if (v109)
  {
    uint64_t v110 = v109;
    uint64_t v111 = *(void *)v201;
    do
    {
      for (nuint64_t n = 0; nn != v110; ++nn)
      {
        if (*(void *)v201 != v111) {
          objc_enumerationMutation(v108);
        }
        v113 = objc_msgSend(*(id *)(*((void *)&v200 + 1) + 8 * nn), "contactItemIdentifier", v138, v139);
        v114 = [(CKPinnedConversationActivityView *)self contactItemViewMatchingContactItemIdentifier:v113 fromContactItemViews:obja];
        if (v114)
        {
          [v107 addObject:v114];
        }
        else
        {
          uint64_t v138 = (uint64_t)v113;
          _IMWarn();
        }
        objc_storeStrong((id *)p_contactItemViews, v107);
      }
      uint64_t v110 = [v108 countByEnumeratingWithState:&v200 objects:v255 count:16];
    }
    while (v110);
  }

  long long v198 = 0u;
  long long v199 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  id v115 = v142;
  uint64_t v116 = [v115 countByEnumeratingWithState:&v196 objects:v254 count:16];
  if (v116)
  {
    uint64_t v117 = v116;
    uint64_t v118 = *(void *)v197;
    do
    {
      for (uint64_t i1 = 0; i1 != v117; ++i1)
      {
        if (*(void *)v197 != v118) {
          objc_enumerationMutation(v115);
        }
        v120 = *(void **)(*((void *)&v196 + 1) + 8 * i1);
        v121 = objc_msgSend(v120, "activityItemIdentifier", v138);
        v122 = [(CKPinnedConversationActivityView *)self _activityItemViewWithActivityItemIdentifier:v121];
        [v122 setActivityItem:v120];
        [v169 addObject:v122];
      }
      uint64_t v117 = [v115 countByEnumeratingWithState:&v196 objects:v254 count:16];
    }
    while (v117);
  }

  if ([v171 count])
  {
    v123 = (void *)MEMORY[0x1E4F42FF0];
    v194[0] = MEMORY[0x1E4F143A8];
    v194[1] = 3221225472;
    v194[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_4;
    v194[3] = &unk_1E5620AF8;
    v194[4] = self;
    id v195 = v171;
    [v123 performWithoutAnimation:v194];
  }
  unint64_t v124 = 0x1E4F42000;
  if (objc_msgSend(v152, "count", v138))
  {
    v125 = (void *)MEMORY[0x1E4F42FF0];
    v191[0] = MEMORY[0x1E4F143A8];
    v191[1] = 3221225472;
    v191[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_5;
    v191[3] = &unk_1E5620AA8;
    v191[4] = self;
    id v192 = v152;
    id v193 = v147;
    v126 = v125;
    unint64_t v124 = 0x1E4F42000;
    [v126 performWithoutAnimation:v191];
  }
  if ([v149 count])
  {
    v127 = (void *)MEMORY[0x1E4F42FF0];
    v189[0] = MEMORY[0x1E4F143A8];
    v189[1] = 3221225472;
    v189[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_61;
    v189[3] = &unk_1E5620AF8;
    v189[4] = self;
    id v190 = v149;
    v128 = v127;
    unint64_t v124 = 0x1E4F42000;
    [v128 performWithoutAnimation:v189];
  }
  if ([v169 count])
  {
    double v129 = 0.0;
    if ([(CKPinnedConversationActivityView *)self haveAttachedContactItemViewsForActivityViews:v169])
    {
      dispatch_group_enter(groupa);
      v130 = (void *)MEMORY[0x1E4F42FF0];
      v187[0] = MEMORY[0x1E4F143A8];
      v187[1] = 3221225472;
      v187[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_64;
      v187[3] = &unk_1E5620AF8;
      v187[4] = self;
      id v188 = v169;
      v185[0] = MEMORY[0x1E4F143A8];
      v185[1] = 3221225472;
      v185[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_2_65;
      v185[3] = &unk_1E5620BF0;
      v186 = groupa;
      double v129 = 0.0;
      [v130 animateWithDuration:4 delay:v187 usingSpringWithDamping:v185 initialSpringVelocity:0.8 options:0.0 animations:0.75 completion:0.0];

      if ([v152 count]) {
        double v129 = 0.25;
      }
    }
    dispatch_group_enter(groupa);
    v131 = (void *)MEMORY[0x1E4F42FF0];
    v183[0] = MEMORY[0x1E4F143A8];
    v183[1] = 3221225472;
    v183[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_3_66;
    v183[3] = &unk_1E5620AF8;
    v183[4] = self;
    id v184 = v169;
    v181[0] = MEMORY[0x1E4F143A8];
    v181[1] = 3221225472;
    v181[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_4_67;
    v181[3] = &unk_1E5620BF0;
    v182 = groupa;
    v132 = v131;
    unint64_t v124 = 0x1E4F42000;
    [v132 animateWithDuration:4 delay:v183 usingSpringWithDamping:v181 initialSpringVelocity:0.8 options:v129 animations:0.75 completion:0.0];
  }
  if ([v151 count])
  {
    dispatch_group_enter(groupa);
    v133 = (void *)MEMORY[0x1E4F42FF0];
    v179[0] = MEMORY[0x1E4F143A8];
    v179[1] = 3221225472;
    v179[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_5_68;
    v179[3] = &unk_1E5620AF8;
    v179[4] = self;
    id v180 = v151;
    v177[0] = MEMORY[0x1E4F143A8];
    v177[1] = 3221225472;
    v177[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_6;
    v177[3] = &unk_1E5620BF0;
    v178 = groupa;
    v134 = v133;
    unint64_t v124 = 0x1E4F42000uLL;
    [v134 animateWithDuration:4 delay:v179 usingSpringWithDamping:v177 initialSpringVelocity:0.8 options:0.0 animations:0.75 completion:0.0];
  }
  if ([v154 count])
  {
    v135 = *(void **)(v124 + 4080);
    v175[0] = MEMORY[0x1E4F143A8];
    v175[1] = 3221225472;
    v175[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_7;
    v175[3] = &unk_1E5620AF8;
    v175[4] = self;
    id v176 = v154;
    [v135 performWithoutAnimation:v175];
  }
  if (v145)
  {
    v136 = MEMORY[0x1E4F14428];
    id v137 = MEMORY[0x1E4F14428];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_8;
    block[3] = &unk_1E5620F48;
    id v174 = v145;
    dispatch_group_notify(groupa, v136, block);
  }
}

BOOL __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_2;
  v8[3] = &unk_1E5623C00;
  id v9 = v4;
  id v5 = v4;
  BOOL v6 = [a2 indexOfObjectPassingTest:v8] != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 activityItemIdentifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutViewsAssociatedWithActivityItemViews:*(void *)(a1 + 40) excludingContactItemViews:MEMORY[0x1E4F1CBF0] withContentScale:&unk_1EDF16FA8 applyingTransform:1 updatingActivityItemViews:1 updatingAttachedContactItemViews:0];
}

void __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_49(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "removeFromSuperview", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_2_51(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutUnattachedContactItemViews:*(void *)(a1 + 40) withContentScale:&unk_1EDF16FA8 applyingTransform:1];
}

void __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_3_52(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "removeFromSuperview", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutViewsAssociatedWithActivityItemViews:*(void *)(a1 + 40) excludingContactItemViews:MEMORY[0x1E4F1CBF0] withContentScale:0 applyingTransform:0 updatingActivityItemViews:1 updatingAttachedContactItemViews:1];
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutViewsAssociatedWithActivityItemViews:*(void *)(a1 + 40) excludingContactItemViews:*(void *)(a1 + 48) withContentScale:&unk_1EDF16FB8 applyingTransform:1 updatingActivityItemViews:1 updatingAttachedContactItemViews:1];
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_61(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutUnattachedContactItemViews:*(void *)(a1 + 40) withContentScale:&unk_1EDF16FC8 applyingTransform:1];
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_64(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutViewsAssociatedWithActivityItemViews:*(void *)(a1 + 40) excludingContactItemViews:MEMORY[0x1E4F1CBF0] withContentScale:0 applyingTransform:1 updatingActivityItemViews:0 updatingAttachedContactItemViews:1];
}

void __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_2_65(uint64_t a1)
{
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_3_66(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutViewsAssociatedWithActivityItemViews:*(void *)(a1 + 40) excludingContactItemViews:MEMORY[0x1E4F1CBF0] withContentScale:0 applyingTransform:1 updatingActivityItemViews:1 updatingAttachedContactItemViews:0];
}

void __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_4_67(uint64_t a1)
{
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_5_68(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutUnattachedContactItemViews:*(void *)(a1 + 40) withContentScale:0 applyingTransform:1];
}

void __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_6(uint64_t a1)
{
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutUnattachedContactItemViews:*(void *)(a1 + 40) withContentScale:0 applyingTransform:1];
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_layoutViewsAssociatedWithActivityItemViews:(id)a3 excludingContactItemViews:(id)a4 withContentScale:(id)a5 applyingTransform:(BOOL)a6 updatingActivityItemViews:(BOOL)a7 updatingAttachedContactItemViews:(BOOL)a8
{
  BOOL v114 = a6;
  BOOL v115 = a8;
  BOOL v124 = a7;
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v106 = a4;
  id v116 = a5;
  [(CKPinnedConversationActivityView *)self avatarFrame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(CKPinnedConversationActivityView *)self activityItemOriginationSubAvatarFrame];
  double v100 = v21;
  double v101 = v20;
  CGFloat v98 = v23;
  CGFloat v99 = v22;
  double v110 = v15;
  double v111 = v13;
  double v122 = v19;
  double v123 = v17;
  -[CKPinnedConversationActivityView contactItemViewDiameterForAvatarFrame:](self, "contactItemViewDiameterForAvatarFrame:", v13, v15, v17, v19);
  double v95 = v24;
  int64_t v121 = [(CKPinnedConversationActivityView *)self activityItemOriginationDirection];
  [(CKPinnedConversationActivityView *)self activityItemOriginationPoint];
  double v104 = v26;
  double v105 = v25;
  p_outerContentAlignmentFrame = &self->_outerContentAlignmentFrame;
  double width = self->_outerContentAlignmentFrame.size.width;
  double height = self->_outerContentAlignmentFrame.size.height;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  obuint64_t j = v11;
  uint64_t v117 = [obj countByEnumeratingWithState:&v127 objects:v131 count:16];
  if (v117)
  {
    uint64_t v112 = *(void *)v128;
    double v96 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v97 = *MEMORY[0x1E4F1DAD8];
    double v109 = v95 * 0.5;
    double v113 = width;
    do
    {
      for (uint64_t i = 0; i != v117; ++i)
      {
        if (*(void *)v128 != v112) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = *(void **)(*((void *)&v127 + 1) + 8 * i);
        uint64_t v31 = [v30 activityItem];
        objc_msgSend(v30, "setParentAvatarViewSize:", v123, v122);
        uint64_t v32 = [v31 attachedContactItemIdentifier];
        if ([v32 length])
        {
          v33 = [(CKPinnedConversationActivityView *)self contactItemViewMatchingContactItemIdentifier:v32 fromContactItemViews:self->_contactItemViews];
          v34 = [v33 pinnedConversationContactItem];
          uint64_t v35 = [v34 contactItemAlignment];

          int64_t v36 = [(CKPinnedConversationActivityView *)self activityViewContentAlignmentForContactItemAlignment:v35];
        }
        else
        {
          v33 = 0;
          int64_t v36 = 1;
        }
        if (v115) {
          int v37 = [v106 containsObjectIdenticalTo:v33] ^ 1;
        }
        else {
          int v37 = 0;
        }
        if (v116) {
          [v116 doubleValue];
        }
        else {
          [v31 activityItemContentScale];
        }
        double v39 = v38;
        if (v114)
        {
          memset(&v126, 0, sizeof(v126));
          CGAffineTransformMakeScale(&v126, v38, v38);
          if (v124)
          {
            CGAffineTransform v125 = v126;
            [v30 setTransform:&v125];
          }
          if (v37)
          {
            CGAffineTransform v125 = v126;
            [v33 setTransform:&v125];
          }
        }
        if ([v30 supportsActivityItemViewContentScale])
        {
          [v30 setActivityItemViewContentScale:1];
          objc_msgSend(v30, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
          if (v40 < width) {
            goto LABEL_24;
          }
          [v30 setActivityItemViewContentScale:0];
        }
        objc_msgSend(v30, "sizeThatFits:", width, height);
LABEL_24:
        double v42 = v40;
        CGFloat v43 = v41;
        if (v124)
        {
          objc_msgSend(v30, "setBounds:", 0.0, 0.0, v40, v41);
          [v30 setOriginationDirection:v121];
        }
        CGFloat x = p_outerContentAlignmentFrame->origin.x;
        CGFloat y = self->_outerContentAlignmentFrame.origin.y;
        CGFloat v46 = self->_outerContentAlignmentFrame.size.width;
        CGFloat v47 = self->_outerContentAlignmentFrame.size.height;
        double v120 = v39;
        if (v121)
        {
          CGRectGetMaxY(*(CGRect *)&x);
          UIRoundToViewScale();
          double v49 = v48;
          v133.origin.CGFloat x = p_outerContentAlignmentFrame->origin.x;
          v133.origin.CGFloat y = self->_outerContentAlignmentFrame.origin.y;
          v133.size.double width = self->_outerContentAlignmentFrame.size.width;
          v133.size.double height = self->_outerContentAlignmentFrame.size.height;
          CGRectGetMaxY(v133);
          UIRoundToViewScale();
          double v51 = v50;
          if (!v33) {
            goto LABEL_35;
          }
          [v30 activityItemToContactItemVerticalOverlap];
          double v53 = v49 + v52;
          [v31 activityItemContentScale];
          double v55 = -(v95 * 0.5);
        }
        else
        {
          CGRectGetMinY(*(CGRect *)&x);
          UIRoundToViewScale();
          double v49 = v56;
          v134.origin.CGFloat x = p_outerContentAlignmentFrame->origin.x;
          v134.origin.CGFloat y = self->_outerContentAlignmentFrame.origin.y;
          v134.size.double width = self->_outerContentAlignmentFrame.size.width;
          v134.size.double height = self->_outerContentAlignmentFrame.size.height;
          CGRectGetMinY(v134);
          UIRoundToViewScale();
          double v51 = v57;
          if (!v33)
          {
LABEL_35:
            v135.size.double width = v100;
            v135.origin.CGFloat x = v101;
            v135.size.double height = v98;
            v135.origin.CGFloat y = v99;
            if (CGRectIsEmpty(v135) || ([v30 supportsAlignmentWithOriginationSubAvatarFrame] & 1) == 0)
            {
              -[CKPinnedConversationActivityView tailAttachmentXCoordinateForYCoordinate:avatarFrame:contentAlignment:](self, "tailAttachmentXCoordinateForYCoordinate:avatarFrame:contentAlignment:", v36, v49, v111, v110, v123, v122);
              double v64 = v65;
              BOOL v118 = v36 != 1;
            }
            else
            {
              BOOL v118 = 0;
              double v64 = v101 + v100 * 0.684210526;
            }
            double v63 = v49 + (v51 - v49) * v39;
            int v119 = 1;
            double v59 = v96;
            double v61 = v97;
            if (v36 == 1) {
              goto LABEL_41;
            }
            goto LABEL_42;
          }
          [v30 activityItemToContactItemVerticalOverlap];
          double v53 = v49 - v58;
          [v31 activityItemContentScale];
          double v55 = v95 * 0.5;
        }
        double v59 = v53 + v55 * v54;
        -[CKPinnedConversationActivityView contactItemViewCenterXCoordinateForYCoordinate:avatarFrame:contentAlignment:](self, "contactItemViewCenterXCoordinateForYCoordinate:avatarFrame:contentAlignment:", v36, v59, v111, v110, v123, v122);
        double v61 = v60;
        if (v37)
        {
          objc_msgSend(v33, "setCenter:", v60, v59);
          objc_msgSend(v33, "setBounds:", 0.0, 0.0, v95, v95);
          id v62 = [v33 layer];
          [v62 setZPosition:1.0];
        }
        double v63 = v49 + (v51 - v49) * v39;
        if (v36 == 1)
        {
          int v119 = 0;
          double v64 = v61 - v109;
          BOOL v118 = 1;
LABEL_41:
          p_innerContentAlignmentFrame = &self->_innerContentAlignmentFrame;
          double v67 = CGRectGetMaxX(self->_innerContentAlignmentFrame) - v64;
          int v68 = 1;
          goto LABEL_43;
        }
        int v119 = 0;
        BOOL v118 = 0;
        double v64 = v109 + v61;
LABEL_42:
        p_innerContentAlignmentFrame = &self->_innerContentAlignmentFrame;
        int v68 = 0;
        double v67 = v64 - CGRectGetMinX(self->_innerContentAlignmentFrame);
LABEL_43:
        double MaxX = CGRectGetMaxX(*p_innerContentAlignmentFrame);
        double MinX = CGRectGetMinX(*p_innerContentAlignmentFrame);
        if (v42 <= v67 + v67)
        {
          double v84 = v64;
          goto LABEL_57;
        }
        double v71 = MaxX - MinX;
        v72 = &self->_innerContentAlignmentFrame;
        CGFloat v73 = self->_innerContentAlignmentFrame.origin.x;
        CGFloat v74 = self->_innerContentAlignmentFrame.origin.y;
        CGFloat v75 = self->_innerContentAlignmentFrame.size.width;
        CGFloat v76 = self->_innerContentAlignmentFrame.size.height;
        if (v42 > v71)
        {
          double v102 = v63;
          double v103 = v59;
          double MidX = CGRectGetMidX(*(CGRect *)&v73);
          v136.origin.CGFloat x = 0.0;
          v136.origin.CGFloat y = 0.0;
          v136.size.double width = v42;
          v136.size.double height = v43;
          CGFloat v78 = MidX + CGRectGetWidth(v136) * -0.5;
          v137.origin.CGFloat x = v72->origin.x;
          v137.origin.CGFloat y = self->_innerContentAlignmentFrame.origin.y;
          v137.size.double width = self->_innerContentAlignmentFrame.size.width;
          v137.size.double height = self->_innerContentAlignmentFrame.size.height;
          double v79 = CGRectGetMidX(v137);
          v138.origin.CGFloat x = 0.0;
          v138.origin.CGFloat y = 0.0;
          v138.size.double width = v42;
          v138.size.double height = v43;
          double v80 = CGRectGetWidth(v138);
          v139.origin.CGFloat x = p_outerContentAlignmentFrame->origin.x;
          v139.origin.CGFloat y = self->_outerContentAlignmentFrame.origin.y;
          v139.size.double width = self->_outerContentAlignmentFrame.size.width;
          v139.size.double height = self->_outerContentAlignmentFrame.size.height;
          if (v78 < CGRectGetMinX(v139))
          {
            v140.origin.CGFloat x = p_outerContentAlignmentFrame->origin.x;
            v140.origin.CGFloat y = self->_outerContentAlignmentFrame.origin.y;
            v140.size.double width = self->_outerContentAlignmentFrame.size.width;
            v140.size.double height = self->_outerContentAlignmentFrame.size.height;
            double v81 = CGRectGetMinX(v140);
            v141.origin.CGFloat x = 0.0;
            v141.origin.CGFloat y = 0.0;
            v141.size.double width = v42;
            v141.size.double height = v43;
            double v82 = CGRectGetWidth(v141);
            double v83 = 0.5;
            goto LABEL_52;
          }
          v143.origin.CGFloat x = p_outerContentAlignmentFrame->origin.x;
          v143.origin.CGFloat y = self->_outerContentAlignmentFrame.origin.y;
          v143.size.double width = self->_outerContentAlignmentFrame.size.width;
          v143.size.double height = self->_outerContentAlignmentFrame.size.height;
          if (v79 + v80 * 0.5 <= CGRectGetMaxX(v143))
          {
            v147.origin.CGFloat x = v72->origin.x;
            v147.origin.CGFloat y = self->_innerContentAlignmentFrame.origin.y;
            v147.size.double width = self->_innerContentAlignmentFrame.size.width;
            v147.size.double height = self->_innerContentAlignmentFrame.size.height;
            double v84 = CGRectGetMidX(v147);
          }
          else
          {
            v144.origin.CGFloat x = p_outerContentAlignmentFrame->origin.x;
            v144.origin.CGFloat y = self->_outerContentAlignmentFrame.origin.y;
            v144.size.double width = self->_outerContentAlignmentFrame.size.width;
            v144.size.double height = self->_outerContentAlignmentFrame.size.height;
            double v81 = CGRectGetMaxX(v144);
            v145.origin.CGFloat x = 0.0;
            v145.origin.CGFloat y = 0.0;
            v145.size.double width = v42;
            v145.size.double height = v43;
            double v82 = CGRectGetWidth(v145);
            double v83 = -0.5;
LABEL_52:
            double v84 = v81 + v82 * v83;
          }
          double v63 = v102;
          double v59 = v103;
          goto LABEL_57;
        }
        if (v68)
        {
          double v85 = CGRectGetMaxX(*(CGRect *)&v73);
          v142.origin.CGFloat x = 0.0;
          v142.origin.CGFloat y = 0.0;
          v142.size.double width = v42;
          v142.size.double height = v43;
          double v86 = CGRectGetWidth(v142);
          double v87 = -0.5;
        }
        else
        {
          double v85 = CGRectGetMinX(*(CGRect *)&v73);
          v146.origin.CGFloat x = 0.0;
          v146.origin.CGFloat y = 0.0;
          v146.size.double width = v42;
          v146.size.double height = v43;
          double v86 = CGRectGetWidth(v146);
          double v87 = 0.5;
        }
        double v84 = v85 + v86 * v87;
LABEL_57:
        v148.origin.CGFloat x = 0.0;
        v148.origin.CGFloat y = 0.0;
        v148.size.double width = v42;
        v148.size.double height = v43;
        double v88 = CGRectGetWidth(v148);
        if (v124)
        {
          double v89 = v59;
          double v90 = v84 + v88 * -0.5;
          [v30 setOriginationHorizontalDirection:v118];
          [v30 setPreferredTailAttachmentPointXCoordinate:v64 - v90];
          [v30 tailAttachmentPoint];
          objc_msgSend(v30, "setCenter:", v90 + v91 + (v84 - (v90 + v91)) * v120, v63);
          int v92 = [v30 layer];
          [v92 setZPosition:2.0];

          double v94 = v104;
          double v93 = v105;
          if (!v119)
          {
            double v93 = v61;
            double v94 = v89;
          }
          -[CKPinnedConversationActivityView _convertPointInOwnCoordinateSpace:toUnscaledCoordinateSpaceOfSubview:](self, "_convertPointInOwnCoordinateSpace:toUnscaledCoordinateSpaceOfSubview:", v30, v93, v94);
          objc_msgSend(v30, "setOriginationPoint:");
          [v30 layoutIfNeeded];
        }

        double width = v113;
      }
      uint64_t v117 = [obj countByEnumeratingWithState:&v127 objects:v131 count:16];
    }
    while (v117);
  }
}

- (CGPoint)_convertPointInOwnCoordinateSpace:(CGPoint)a3 toUnscaledCoordinateSpaceOfSubview:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  [v6 center];
  double v8 = v7;
  double v10 = v9;
  [v6 bounds];
  double v12 = v11;
  double v14 = v13;

  double v15 = x - (v8 - v12 * 0.5);
  double v16 = y - (v10 - v14 * 0.5);
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (void)_layoutUnattachedContactItemViews:(id)a3 withContentScale:(id)a4 applyingTransform:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    [(CKPinnedConversationActivityView *)self avatarFrame];
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    -[CKPinnedConversationActivityView contactItemViewDiameterForAvatarFrame:](self, "contactItemViewDiameterForAvatarFrame:");
    uint64_t v19 = v18;
    double v20 = [(NSMutableArray *)self->_activityItemViews firstObject];
    double v21 = [v20 activityItem];
    double v22 = [v21 attachedContactItemIdentifier];

    double v23 = [(CKPinnedConversationActivityView *)self contactItemViewMatchingContactItemIdentifier:v22 fromContactItemViews:self->_contactItemViews];
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3032000000;
    v51[3] = __Block_byref_object_copy__13;
    v51[4] = __Block_byref_object_dispose__13;
    id v52 = 0;
    uint64_t v45 = 0;
    CGFloat v46 = (id *)&v45;
    uint64_t v47 = 0x3032000000;
    double v48 = __Block_byref_object_copy__13;
    double v49 = __Block_byref_object_dispose__13;
    id v50 = 0;
    uint64_t v39 = 0;
    double v40 = (id *)&v39;
    uint64_t v41 = 0x3032000000;
    double v42 = __Block_byref_object_copy__13;
    CGFloat v43 = __Block_byref_object_dispose__13;
    id v44 = 0;
    if (v23)
    {
      objc_storeStrong(&v52, v23);
      double v24 = [v23 pinnedConversationContactItem];
      uint64_t v25 = [v24 contactItemAlignment];

      if (!v25)
      {
        double v26 = v46;
        goto LABEL_7;
      }
      if (v25 == 1)
      {
        double v26 = v40;
LABEL_7:
        objc_storeStrong(v26 + 5, v23);
      }
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __105__CKPinnedConversationActivityView__layoutUnattachedContactItemViews_withContentScale_applyingTransform___block_invoke;
    v27[3] = &unk_1E5623C28;
    id v28 = v9;
    id v29 = self;
    uint64_t v30 = &v45;
    uint64_t v31 = &v39;
    uint64_t v33 = v11;
    uint64_t v34 = v13;
    uint64_t v35 = v15;
    uint64_t v36 = v17;
    uint64_t v37 = v19;
    uint64_t v32 = v51;
    BOOL v38 = a5;
    [v8 enumerateObjectsUsingBlock:v27];

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v45, 8);

    _Block_object_dispose(v51, 8);
  }
}

void __105__CKPinnedConversationActivityView__layoutUnattachedContactItemViews_withContentScale_applyingTransform___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = [v4 pinnedConversationContactItem];
  id v6 = *(void **)(a1 + 32);
  if (v6) {
    [v6 doubleValue];
  }
  else {
    [v5 contentScale];
  }
  double v8 = v7;
  uint64_t v9 = [v5 contactItemAlignment];
  uint64_t v10 = [*(id *)(a1 + 40) nextContactItemIsClockwiseForOriginationDirection:*(void *)(*(void *)(a1 + 40) + 416) contactItemAlignment:v9];
  uint64_t v11 = [*(id *)(a1 + 40) activityViewContentAlignmentForContactItemAlignment:v9];
  if (v9 == 1)
  {
    uint64_t v12 = *(void *)(a1 + 56);
  }
  else
  {
    if (v9) {
      goto LABEL_10;
    }
    uint64_t v12 = *(void *)(a1 + 48);
  }
  id v13 = *(id *)(*(void *)(v12 + 8) + 40);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = [v13 pinnedConversationContactItem];
    [v15 contentScale];
    double v17 = v16;

    double v18 = *(double *)(a1 + 88) * 0.174532925;
    [v14 bounds];
    double v20 = v18 + v19 * 0.5 * v17 + *(double *)(a1 + 104) * 0.5 * v8;
    double v21 = *(void **)(a1 + 40);
    [v14 center];
    objc_msgSend(v21, "pointAlongCircle:atArcLength:fromPoint:clockwise:", v10, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), v20, v22, v23);
    double v25 = v24;
    double MidY = v26;
    goto LABEL_14;
  }
LABEL_10:
  id v28 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v28)
  {
    [v28 center];
    double v30 = v29;
    objc_msgSend(*(id *)(a1 + 40), "contactItemViewCenterXCoordinateForYCoordinate:avatarFrame:contentAlignment:", v11, v29, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
    objc_msgSend(*(id *)(a1 + 40), "pointAlongCircle:atArcLength:fromPoint:clockwise:", v10, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 88) * 0.0872664626, v31, v30);
    double v25 = v32;
    double MidY = v33;
  }
  else
  {
    double MidY = CGRectGetMidY(*(CGRect *)(*(void *)(a1 + 40) + 496));
    objc_msgSend(*(id *)(a1 + 40), "contactItemViewCenterXCoordinateForYCoordinate:avatarFrame:contentAlignment:", v11, MidY, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
    double v25 = v34;
  }
  uint64_t v14 = 0;
LABEL_14:
  objc_msgSend(v4, "setCenter:", v25, MidY);
  objc_msgSend(v4, "setBounds:", 0.0, 0.0, *(double *)(a1 + 104), *(double *)(a1 + 104));
  uint64_t v35 = [v4 layer];
  [v35 setZPosition:1.0];

  double v36 = v8 * *(double *)(a1 + 104) * 0.5;
  double MidX = CGRectGetMidX(*(CGRect *)(*(void *)(a1 + 40) + 496));
  if (v9 == 1)
  {
    BOOL v38 = v25 - v36 < MidX;
  }
  else if (v9)
  {
    BOOL v38 = 0;
  }
  else
  {
    BOOL v38 = v25 + v36 > MidX;
  }
  objc_msgSend(v4, "setHidden:", v38, MidX);
  if (*(unsigned char *)(a1 + 112))
  {
    memset(&v41, 0, sizeof(v41));
    CGAffineTransformMakeScale(&v41, v8, v8);
    CGAffineTransform v40 = v41;
    [v4 setTransform:&v40];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
  if (v9 == 1)
  {
    uint64_t v39 = *(void *)(a1 + 56);
    goto LABEL_25;
  }
  if (!v9)
  {
    uint64_t v39 = *(void *)(a1 + 48);
LABEL_25:
    objc_storeStrong((id *)(*(void *)(v39 + 8) + 40), a2);
  }
}

- (int64_t)activityViewContentAlignmentForContactItemAlignment:(int64_t)a3
{
  return a3 == 1;
}

- (BOOL)nextContactItemIsClockwiseForOriginationDirection:(int64_t)a3 contactItemAlignment:(int64_t)a4
{
  if (a3) {
    return a4 == 0;
  }
  else {
    return a4 != 0;
  }
}

- (CGPoint)pointAlongCircle:(CGRect)a3 atArcLength:(double)a4 fromPoint:(CGPoint)a5 clockwise:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a5.y;
  double x = a5.x;
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  double MidX = CGRectGetMidX(a3);
  v25.origin.double x = v13;
  v25.origin.double y = v12;
  v25.size.double width = width;
  v25.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v25);
  double v16 = width * 0.5;
  if (v16 != 0.0)
  {
    double v17 = MidX - x;
    double v18 = MidY - y;
    if (v17 == 0.0)
    {
      double v19 = dbl_18F81AF90[v18 > 0.0];
    }
    else
    {
      double v19 = atan(v18 / v17);
      if (v17 >= 0.0) {
        double v19 = v19 + 3.14159265;
      }
    }
    double v20 = a4 / v16;
    if (!v6) {
      double v20 = -(a4 / v16);
    }
    __double2 v21 = __sincos_stret(v20 + v19);
    double MidX = MidX + v16 * v21.__cosval;
    double MidY = MidY + v16 * v21.__sinval;
  }
  double v22 = MidX;
  double v23 = MidY;
  result.double y = v23;
  result.double x = v22;
  return result;
}

- (double)circleXCoordinateForYCoordinate:(double)a3 radius:(double)a4 centerPoint:(CGPoint)a5 contentAlignment:(int64_t)a6
{
  double v6 = sqrt(fmax(a4 * a4 - (a3 - a5.y) * (a3 - a5.y), 0.0));
  if (a6 != 1) {
    double v6 = -v6;
  }
  return a5.x + v6;
}

- (double)tailAttachmentXCoordinateForYCoordinate:(double)a3 avatarFrame:(CGRect)a4 contentAlignment:(int64_t)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v12 = a4.size.width * 0.5;
  -[CKPinnedConversationActivityView activityItemAttachmentCircleRadiusInsetForAvatarFrame:](self, "activityItemAttachmentCircleRadiusInsetForAvatarFrame:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  double v14 = v12 - v13;
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v20);

  -[CKPinnedConversationActivityView circleXCoordinateForYCoordinate:radius:centerPoint:contentAlignment:](self, "circleXCoordinateForYCoordinate:radius:centerPoint:contentAlignment:", a5, a3, v14, MidX, MidY);
  return result;
}

- (double)contactItemViewCenterXCoordinateForYCoordinate:(double)a3 avatarFrame:(CGRect)a4 contentAlignment:(int64_t)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v12 = a4.size.width * 0.5;
  double MidX = CGRectGetMidX(a4);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v17);

  -[CKPinnedConversationActivityView circleXCoordinateForYCoordinate:radius:centerPoint:contentAlignment:](self, "circleXCoordinateForYCoordinate:radius:centerPoint:contentAlignment:", a5, a3, v12, MidX, MidY);
  return result;
}

- (double)activityItemAttachmentCircleRadiusInsetForAvatarFrame:(CGRect)a3
{
  return a3.size.width * 0.0909090909;
}

- (double)contactItemViewDiameterForAvatarFrame:(CGRect)a3
{
  return a3.size.width * 0.295454545;
}

- (NSArray)displayedContacts
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(CKPinnedConversationActivityView *)self contactItemViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) pinnedConversationContactItem];
        uint64_t v11 = [v10 cnContactWithKeys:v8];
        [v3 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  double v12 = (void *)[v3 copy];

  return (NSArray *)v12;
}

- (void)resetToEmptySnapshot
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = [(CKPinnedConversationActivityView *)self activityItemViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }

  uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  activityItemViews = self->_activityItemViews;
  self->_activityItemViews = v8;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [(CKPinnedConversationActivityView *)self contactItemViews];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v14++) removeFromSuperview];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v12);
  }

  long long v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  contactItemViews = self->_contactItemViews;
  self->_contactItemViews = v15;

  long long v17 = +[CKPinnedConversationActivitySnapshot emptySnapshot];
  latestSnapshot = self->_latestSnapshot;
  self->_latestSnapshot = v17;

  self->_suppressingActivitCGFloat y = 0;
}

- (void)setSuppressingActivity:(BOOL)a3
{
}

- (void)setSuppressingActivity:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v9 = v8;
  if (self->_suppressingActivity == v6)
  {
    if (!v8) {
      goto LABEL_6;
    }
    id v10 = v8;
    (*((void (**)(id))v8 + 2))(v8);
  }
  else
  {
    self->_suppressingActivitCGFloat y = v6;
    id v10 = v8;
    [(CKPinnedConversationActivityView *)self _updateSnapshotAnimated:v5 completion:v8];
  }
  uint64_t v9 = v10;
LABEL_6:
}

- (BOOL)haveAttachedContactItemViewsForActivityViews:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "activityItem", (void)v11);
        id v8 = [v7 attachedContactItemIdentifier];
        uint64_t v9 = [v8 length];

        if (v9)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (CGRect)avatarFrame
{
  double x = self->_avatarFrame.origin.x;
  double y = self->_avatarFrame.origin.y;
  double width = self->_avatarFrame.size.width;
  double height = self->_avatarFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAvatarFrame:(CGRect)a3
{
  self->_avatarFrame = a3;
}

- (CGRect)innerContentAlignmentFrame
{
  double x = self->_innerContentAlignmentFrame.origin.x;
  double y = self->_innerContentAlignmentFrame.origin.y;
  double width = self->_innerContentAlignmentFrame.size.width;
  double height = self->_innerContentAlignmentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)outerContentAlignmentFrame
{
  double x = self->_outerContentAlignmentFrame.origin.x;
  double y = self->_outerContentAlignmentFrame.origin.y;
  double width = self->_outerContentAlignmentFrame.size.width;
  double height = self->_outerContentAlignmentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)activityItemOriginationDirection
{
  return self->_activityItemOriginationDirection;
}

- (CGPoint)activityItemOriginationPoint
{
  double x = self->_activityItemOriginationPoint.x;
  double y = self->_activityItemOriginationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)activityItemOriginationSubAvatarFrame
{
  double x = self->_activityItemOriginationSubAvatarFrame.origin.x;
  double y = self->_activityItemOriginationSubAvatarFrame.origin.y;
  double width = self->_activityItemOriginationSubAvatarFrame.size.width;
  double height = self->_activityItemOriginationSubAvatarFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setActivityItemOriginationSubAvatarFrame:(CGRect)a3
{
  self->_activityItemOriginationSubAvatarFrame = a3;
}

- (BOOL)isSuppressingActivity
{
  return self->_suppressingActivity;
}

- (BOOL)showContentAlignmentDebugFrames
{
  return self->_showContentAlignmentDebugFrames;
}

- (NSMutableArray)activityItemViews
{
  return self->_activityItemViews;
}

- (void)setActivityItemViews:(id)a3
{
}

- (NSMutableArray)contactItemViews
{
  return self->_contactItemViews;
}

- (void)setContactItemViews:(id)a3
{
}

- (CKPinnedConversationActivitySnapshot)latestSnapshot
{
  return self->_latestSnapshot;
}

- (void)setLatestSnapshot:(id)a3
{
}

- (CAShapeLayer)innerContentAlignmentDebugLayer
{
  return self->_innerContentAlignmentDebugLayer;
}

- (void)setInnerContentAlignmentDebugLayer:(id)a3
{
}

- (CAShapeLayer)outerContentAlignmentDebugLayer
{
  return self->_outerContentAlignmentDebugLayer;
}

- (void)setOuterContentAlignmentDebugLayer:(id)a3
{
}

- (CAShapeLayer)activityItemAttachmentCircleDebugLayer
{
  return self->_activityItemAttachmentCircleDebugLayer;
}

- (void)setActivityItemAttachmentCircleDebugLayer:(id)a3
{
}

- (CAShapeLayer)originationPointDebugLayer
{
  return self->_originationPointDebugLayer;
}

- (void)setOriginationPointDebugLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originationPointDebugLayer, 0);
  objc_storeStrong((id *)&self->_activityItemAttachmentCircleDebugLayer, 0);
  objc_storeStrong((id *)&self->_outerContentAlignmentDebugLayer, 0);
  objc_storeStrong((id *)&self->_innerContentAlignmentDebugLayer, 0);
  objc_storeStrong((id *)&self->_latestSnapshot, 0);
  objc_storeStrong((id *)&self->_contactItemViews, 0);

  objc_storeStrong((id *)&self->_activityItemViews, 0);
}

@end
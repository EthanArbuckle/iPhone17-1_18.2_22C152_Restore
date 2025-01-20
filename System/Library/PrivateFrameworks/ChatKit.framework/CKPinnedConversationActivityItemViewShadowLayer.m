@interface CKPinnedConversationActivityItemViewShadowLayer
- (CGSize)_offsetForShadowStyle:(int64_t)a3;
- (CKPinnedConversationActivityItemViewShadowLayer)initWithShadowType:(int64_t)a3;
- (double)_opacityForShadowStyle:(int64_t)a3;
- (double)_radiusForShadowStyle:(int64_t)a3;
- (int64_t)_shadowStyleForShadowType:(int64_t)a3 userInterfaceStyle:(int64_t)a4;
- (int64_t)shadowType;
- (int64_t)userInterfaceStyle;
- (void)_updateShadowProperties;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation CKPinnedConversationActivityItemViewShadowLayer

- (CKPinnedConversationActivityItemViewShadowLayer)initWithShadowType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKPinnedConversationActivityItemViewShadowLayer;
  v4 = [(CKPinnedConversationActivityItemViewShadowLayer *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_shadowType = a3;
    v4->_userInterfaceStyle = 0;
    id v6 = [MEMORY[0x1E4F428B8] blackColor];
    -[CKPinnedConversationActivityItemViewShadowLayer setShadowColor:](v5, "setShadowColor:", [v6 CGColor]);

    [(CKPinnedConversationActivityItemViewShadowLayer *)v5 _updateShadowProperties];
  }
  return v5;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    [(CKPinnedConversationActivityItemViewShadowLayer *)self _updateShadowProperties];
  }
}

- (void)_updateShadowProperties
{
  int64_t v3 = [(CKPinnedConversationActivityItemViewShadowLayer *)self _shadowStyleForShadowType:self->_shadowType userInterfaceStyle:self->_userInterfaceStyle];
  [(CKPinnedConversationActivityItemViewShadowLayer *)self _opacityForShadowStyle:v3];
  *(float *)&double v4 = v4;
  [(CKPinnedConversationActivityItemViewShadowLayer *)self setShadowOpacity:v4];
  [(CKPinnedConversationActivityItemViewShadowLayer *)self _radiusForShadowStyle:v3];
  -[CKPinnedConversationActivityItemViewShadowLayer setShadowRadius:](self, "setShadowRadius:");
  [(CKPinnedConversationActivityItemViewShadowLayer *)self _offsetForShadowStyle:v3];

  -[CKPinnedConversationActivityItemViewShadowLayer setShadowOffset:](self, "setShadowOffset:");
}

- (int64_t)_shadowStyleForShadowType:(int64_t)a3 userInterfaceStyle:(int64_t)a4
{
  int64_t v4 = 3;
  if (a3 != 1) {
    int64_t v4 = 0;
  }
  if (!a3) {
    int64_t v4 = 1;
  }
  if (a4 != 2) {
    int64_t v4 = 0;
  }
  if ((unint64_t)a4 >= 2) {
    return v4;
  }
  else {
    return 2 * (a3 == 1);
  }
}

- (double)_opacityForShadowStyle:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      int64_t v3 = +[CKUIBehavior sharedBehaviors];
      [v3 pinnedConversationActivityBroadShadowLightOpacity];
      goto LABEL_7;
    case 1:
      int64_t v3 = +[CKUIBehavior sharedBehaviors];
      [v3 pinnedConversationActivityBroadShadowDarkOpacity];
      goto LABEL_7;
    case 2:
      int64_t v3 = +[CKUIBehavior sharedBehaviors];
      [v3 pinnedConversationActivityTightShadowLightOpacity];
      goto LABEL_7;
    case 3:
      int64_t v3 = +[CKUIBehavior sharedBehaviors];
      [v3 pinnedConversationActivityTightShadowDarkOpacity];
LABEL_7:
      double v5 = v4;

      break;
    default:
      double v5 = 0.0;
      break;
  }
  return v5;
}

- (double)_radiusForShadowStyle:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      int64_t v3 = +[CKUIBehavior sharedBehaviors];
      [v3 pinnedConversationActivityBroadShadowLightRadius];
      goto LABEL_7;
    case 1:
      int64_t v3 = +[CKUIBehavior sharedBehaviors];
      [v3 pinnedConversationActivityBroadShadowDarkRadius];
      goto LABEL_7;
    case 2:
      int64_t v3 = +[CKUIBehavior sharedBehaviors];
      [v3 pinnedConversationActivityTightShadowLightRadius];
      goto LABEL_7;
    case 3:
      int64_t v3 = +[CKUIBehavior sharedBehaviors];
      [v3 pinnedConversationActivityTightShadowDarkRadius];
LABEL_7:
      double v5 = v4;

      break;
    default:
      double v5 = 0.0;
      break;
  }
  return v5;
}

- (CGSize)_offsetForShadowStyle:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      int64_t v3 = +[CKUIBehavior sharedBehaviors];
      [v3 pinnedConversationActivityBroadShadowLightOffset];
      goto LABEL_7;
    case 1:
      int64_t v3 = +[CKUIBehavior sharedBehaviors];
      [v3 pinnedConversationActivityBroadShadowDarkOffset];
      goto LABEL_7;
    case 2:
      int64_t v3 = +[CKUIBehavior sharedBehaviors];
      [v3 pinnedConversationActivityTightShadowLightOffset];
      goto LABEL_7;
    case 3:
      int64_t v3 = +[CKUIBehavior sharedBehaviors];
      [v3 pinnedConversationActivityTightShadowDarkOffset];
LABEL_7:
      double v7 = v4;
      double v6 = v5;

      break;
    default:
      double v6 = 0.0;
      double v7 = 0.0;
      break;
  }
  double v8 = v7;
  double v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (int64_t)shadowType
{
  return self->_shadowType;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

@end
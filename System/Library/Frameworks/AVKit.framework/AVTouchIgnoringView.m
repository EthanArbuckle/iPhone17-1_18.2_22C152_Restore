@interface AVTouchIgnoringView
- (AVLayoutItemAttributes)layoutAttributes;
- (AVTouchIgnoringView)initWithFrame:(CGRect)a3;
- (BOOL)hasAlternateAppearance;
- (BOOL)hasFullScreenAppearance;
- (BOOL)isCollapsed;
- (BOOL)isCollapsedOrExcluded;
- (BOOL)isIncluded;
- (BOOL)isRemoved;
- (CGSize)extrinsicContentSize;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_updateLayoutItem;
- (void)layoutAttributesDidChange;
- (void)setCollapsed:(BOOL)a3;
- (void)setExtrinsicContentSize:(CGSize)a3;
- (void)setHasAlternateAppearance:(BOOL)a3;
- (void)setHasFullScreenAppearance:(BOOL)a3;
- (void)setIncluded:(BOOL)a3;
- (void)setRemoved:(BOOL)a3;
@end

@implementation AVTouchIgnoringView

- (void).cxx_destruct
{
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  self->_hasFullScreenAppearance = a3;
}

- (BOOL)hasFullScreenAppearance
{
  return self->_hasFullScreenAppearance;
}

- (void)setHasAlternateAppearance:(BOOL)a3
{
  self->_hasAlternateAppearance = a3;
}

- (BOOL)hasAlternateAppearance
{
  return self->_hasAlternateAppearance;
}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  self->_extrinsicContentSize = a3;
}

- (CGSize)extrinsicContentSize
{
  double width = self->_extrinsicContentSize.width;
  double height = self->_extrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_updateLayoutItem
{
  v3 = [(AVTouchIgnoringView *)self layoutAttributes];
  if ([(AVTouchIgnoringView *)self isIncluded]) {
    uint64_t v4 = [(AVTouchIgnoringView *)self isRemoved] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }
  [v3 setIncluded:v4];

  id v5 = [(AVTouchIgnoringView *)self layoutAttributes];
  objc_msgSend(v5, "setCollapsed:", -[AVTouchIgnoringView isCollapsed](self, "isCollapsed"));
}

- (void)setIncluded:(BOOL)a3
{
  if (self->_included != a3)
  {
    self->_included = a3;
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
    [(AVTouchIgnoringView *)self _updateLayoutItem];
  }
}

- (void)setRemoved:(BOOL)a3
{
  if (self->_removed != a3)
  {
    self->_removed = a3;
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
    [(AVTouchIgnoringView *)self _updateLayoutItem];
  }
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
    [(AVTouchIgnoringView *)self _updateLayoutItem];
  }
}

- (BOOL)isCollapsedOrExcluded
{
  if ([(AVTouchIgnoringView *)self isCollapsed] || ![(AVTouchIgnoringView *)self isIncluded]) {
    return 1;
  }

  return [(AVTouchIgnoringView *)self isRemoved];
}

- (void)layoutAttributesDidChange
{
  id v3 = [(AVTouchIgnoringView *)self layoutAttributes];
  -[AVTouchIgnoringView setCollapsed:](self, "setCollapsed:", [v3 isCollapsed]);
}

- (AVLayoutItemAttributes)layoutAttributes
{
  layoutAttributes = self->_layoutAttributes;
  if (!layoutAttributes)
  {
    uint64_t v4 = objc_alloc_init(AVLayoutItemAttributes);
    id v5 = self->_layoutAttributes;
    self->_layoutAttributes = v4;

    layoutAttributes = self->_layoutAttributes;
  }

  return layoutAttributes;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVTouchIgnoringView;
  -[AVTouchIgnoringView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (AVTouchIgnoringView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }

  return v7;
}

- (AVTouchIgnoringView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVTouchIgnoringView;
  CGSize result = -[AVTouchIgnoringView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_collapsed = 0;
    result->_included = 1;
    result->_removed = 0;
  }
  return result;
}

@end
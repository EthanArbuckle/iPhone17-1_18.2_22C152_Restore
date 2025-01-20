@interface AVView
- (AVView)init;
- (AVView)initWithCoder:(id)a3;
- (AVView)initWithFrame:(CGRect)a3;
- (BOOL)automaticallyUpdatesSubviewContentIntersections;
- (BOOL)hasBackdropView;
- (BOOL)ignoresTouches;
- (CGRect)contentIntersection;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_commonInit;
- (void)_updateSubviewContentIntersectionsIfNeeded;
- (void)interruptActiveInteractions;
- (void)layoutSubviews;
- (void)setAutomaticallyUpdatesSubviewContentIntersections:(BOOL)a3;
- (void)setContentIntersection:(CGRect)a3;
- (void)setHasBackdropView:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIgnoresTouches:(BOOL)a3;
@end

@implementation AVView

- (AVView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVView;
  v3 = -[AVView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(AVView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  self->_automaticallyUpdatesSubviewContentIntersections = 0;
  CGSize v2 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_contentIntersection.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_contentIntersection.size = v2;
}

- (void).cxx_destruct
{
}

- (void)setIgnoresTouches:(BOOL)a3
{
  self->_ignoresTouches = a3;
}

- (BOOL)ignoresTouches
{
  return self->_ignoresTouches;
}

- (void)setHasBackdropView:(BOOL)a3
{
  self->_hasBackdropView = a3;
}

- (BOOL)hasBackdropView
{
  return self->_hasBackdropView;
}

- (CGRect)contentIntersection
{
  double x = self->_contentIntersection.origin.x;
  double y = self->_contentIntersection.origin.y;
  double width = self->_contentIntersection.size.width;
  double height = self->_contentIntersection.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)automaticallyUpdatesSubviewContentIntersections
{
  return self->_automaticallyUpdatesSubviewContentIntersections;
}

- (void)interruptActiveInteractions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  CGSize v2 = [(AVView *)self subviews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v7 conformsToProtocol:&unk_1F095A538]) {
          [v7 interruptActiveInteractions];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)setContentIntersection:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_contentIntersection = &self->_contentIntersection;
  if (!CGRectEqualToRect(self->_contentIntersection, a3))
  {
    p_contentIntersection->origin.CGFloat x = x;
    p_contentIntersection->origin.CGFloat y = y;
    p_contentIntersection->size.CGFloat width = width;
    p_contentIntersection->size.CGFloat height = height;
    -[AVView _updateSubviewContentIntersectionsIfNeeded](self);
  }
}

- (void)_updateSubviewContentIntersectionsIfNeeded
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a1 && a1[448])
  {
    CGSize v2 = [a1 subviews];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v22 != v5) {
            objc_enumerationMutation(v2);
          }
          v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([(id)objc_opt_class() conformsToProtocol:&unk_1F095A4B8])
          {
            id v8 = v7;
            [a1 contentIntersection];
            CGFloat v10 = v9;
            CGFloat v12 = v11;
            CGFloat v14 = v13;
            CGFloat v16 = v15;
            [v8 frame];
            v29.origin.CGFloat x = v17;
            v29.origin.CGFloat y = v18;
            v29.size.CGFloat width = v19;
            v29.size.CGFloat height = v20;
            v27.origin.CGFloat x = v10;
            v27.origin.CGFloat y = v12;
            v27.size.CGFloat width = v14;
            v27.size.CGFloat height = v16;
            CGRect v28 = CGRectIntersection(v27, v29);
            objc_msgSend(v8, "convertRect:fromView:", a1, v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
            objc_msgSend(v8, "setContentIntersection:");
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v4);
    }
  }
}

- (void)setAutomaticallyUpdatesSubviewContentIntersections:(BOOL)a3
{
  if (a3)
  {
    self->_automaticallyUpdatesSubviewContentIntersections = 1;
    -[AVView _updateSubviewContentIntersectionsIfNeeded](self);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVView;
  [(AVView *)&v3 layoutSubviews];
  -[AVView _updateSubviewContentIntersectionsIfNeeded](self);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AVView;
  -[AVView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  uint64_t v5 = (AVView *)objc_claimAutoreleasedReturnValue();
  if ([(AVView *)self ignoresTouches] && v5 == self)
  {

    uint64_t v5 = 0;
  }

  return v5;
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVView;
  [(AVView *)&v4 setHidden:a3];
  if ([(AVView *)self hasBackdropView]) {
    [(UIView *)self avkit_needsUpdateBackdropCaptureViewHidden];
  }
}

- (AVView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVView;
  objc_super v3 = [(AVView *)&v6 initWithCoder:a3];
  objc_super v4 = v3;
  if (v3) {
    [(AVView *)v3 _commonInit];
  }
  return v4;
}

- (AVView)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVView;
  CGSize v2 = [(AVView *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    [(AVView *)v2 _commonInit];
  }
  return v3;
}

@end
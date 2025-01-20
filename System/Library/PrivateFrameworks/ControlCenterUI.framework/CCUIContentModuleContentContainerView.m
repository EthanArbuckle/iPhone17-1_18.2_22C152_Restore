@interface CCUIContentModuleContentContainerView
- (BOOL)_isContentClippingRequiredForSubview:(id)a3;
- (BOOL)moduleProvidesOwnPlatter;
- (CCUIContentModuleContentContainerView)init;
- (CCUIContentModuleContentContainerView)initWithFrame:(CGRect)a3;
- (double)compactContinuousCornerRadius;
- (double)expandedContinuousCornerRadius;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_configureModuleMaterialViewIfNecessary;
- (void)_setContinuousCornerRadius:(double)a3 ignoreSubviewClipping:(BOOL)a4;
- (void)_transitionToExpandedMode:(BOOL)a3 force:(BOOL)a4;
- (void)_updateContinuousCornerRadiusIgnoringSubviewClipping:(BOOL)a3;
- (void)addSubview:(id)a3;
- (void)didEndTransitionToExpandedMode:(BOOL)a3;
- (void)layoutSubviews;
- (void)setCompactContinuousCornerRadius:(double)a3;
- (void)setExpandedContinuousCornerRadius:(double)a3;
- (void)setModuleProvidesOwnPlatter:(BOOL)a3;
- (void)transitionToExpandedMode:(BOOL)a3;
- (void)updateContinuousCornerRadius;
@end

@implementation CCUIContentModuleContentContainerView

- (CCUIContentModuleContentContainerView)init
{
  return -[CCUIContentModuleContentContainerView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (CCUIContentModuleContentContainerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CCUIContentModuleContentContainerView;
  v3 = -[CCUITouchPassThroughView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(CCUIContentModuleContentContainerView *)v3 setBackgroundColor:v4];

    [(CCUIContentModuleContentContainerView *)v3 setOpaque:0];
    [(CCUIContentModuleContentContainerView *)v3 _transitionToExpandedMode:0 force:1];
  }
  return v3;
}

- (void)_transitionToExpandedMode:(BOOL)a3 force:(BOOL)a4
{
  if (a4 || self->_expanded != a3)
  {
    self->_expanded = a3;
    [(CCUIContentModuleContentContainerView *)self _updateContinuousCornerRadiusIgnoringSubviewClipping:a4];
  }
}

- (void)updateContinuousCornerRadius
{
}

- (void)transitionToExpandedMode:(BOOL)a3
{
}

- (void)didEndTransitionToExpandedMode:(BOOL)a3
{
  if (!a3) {
    [(CCUIContentModuleContentContainerView *)self _setContinuousCornerRadius:1 ignoreSubviewClipping:self->_compactContinuousCornerRadius];
  }
}

- (void)_configureModuleMaterialViewIfNecessary
{
  if (!self->_moduleMaterialView && !self->_moduleProvidesOwnPlatter)
  {
    v3 = [MEMORY[0x1E4F5AE08] _moduleBackgroundMaterialView];
    moduleMaterialView = self->_moduleMaterialView;
    self->_moduleMaterialView = v3;

    v5 = self->_moduleMaterialView;
    [(CCUIContentModuleContentContainerView *)self bounds];
    -[MTMaterialView setFrame:](v5, "setFrame:");
    [(MTMaterialView *)self->_moduleMaterialView setAutoresizingMask:18];
    [(CCUIContentModuleContentContainerView *)self addSubview:self->_moduleMaterialView];
    [(CCUIContentModuleContentContainerView *)self sendSubviewToBack:self->_moduleMaterialView];
    [(CCUIContentModuleContentContainerView *)self setNeedsLayout];
  }
}

- (void)setModuleProvidesOwnPlatter:(BOOL)a3
{
  self->_moduleProvidesOwnPlatter = a3;
  if (a3)
  {
    [(MTMaterialView *)self->_moduleMaterialView removeFromSuperview];
    moduleMaterialView = self->_moduleMaterialView;
    self->_moduleMaterialView = 0;
  }
  else
  {
    [(CCUIContentModuleContentContainerView *)self _configureModuleMaterialViewIfNecessary];
  }
}

- (void)addSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIContentModuleContentContainerView;
  [(CCUIContentModuleContentContainerView *)&v4 addSubview:a3];
  [(CCUIContentModuleContentContainerView *)self _transitionToExpandedMode:self->_expanded force:1];
}

- (void)layoutSubviews
{
  [(CCUIContentModuleContentContainerView *)self _configureModuleMaterialViewIfNecessary];
  v3.receiver = self;
  v3.super_class = (Class)CCUIContentModuleContentContainerView;
  [(CCUIContentModuleContentContainerView *)&v3 layoutSubviews];
}

- (BOOL)_isContentClippingRequiredForSubview:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_opt_respondsToSelector() & 1) != 0 && ([v4 isContentClippingRequired])
  {
    BOOL v5 = 1;
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = objc_msgSend(v4, "subviews", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([(CCUIContentModuleContentContainerView *)self _isContentClippingRequiredForSubview:*(void *)(*((void *)&v12 + 1) + 8 * i)])
          {
            BOOL v5 = 1;
            goto LABEL_14;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v5 = 0;
LABEL_14:
  }
  return v5;
}

- (void)_setContinuousCornerRadius:(double)a3 ignoreSubviewClipping:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v6 = 0;
    double v7 = 0.0;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = [(CCUIContentModuleContentContainerView *)self subviews];
    uint64_t v6 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v8);
          }
          if ([(CCUIContentModuleContentContainerView *)self _isContentClippingRequiredForSubview:*(void *)(*((void *)&v13 + 1) + 8 * v10)])
          {
            uint64_t v6 = 1;
            double v11 = 0.0;
            goto LABEL_13;
          }
          ++v10;
        }
        while (v6 != v10);
        uint64_t v6 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    double v11 = a3;
    a3 = 0.0;
LABEL_13:
    double v7 = a3;

    a3 = v11;
  }
  [(MTMaterialView *)self->_moduleMaterialView _setContinuousCornerRadius:a3];
  v12.receiver = self;
  v12.super_class = (Class)CCUIContentModuleContentContainerView;
  [(CCUIContentModuleContentContainerView *)&v12 _setContinuousCornerRadius:v7];
  [(CCUIContentModuleContentContainerView *)self setClipsToBounds:v6];
}

- (void)_updateContinuousCornerRadiusIgnoringSubviewClipping:(BOOL)a3
{
  if (self->_expanded) {
    objc_super v3 = &OBJC_IVAR___CCUIContentModuleContentContainerView__expandedContinuousCornerRadius;
  }
  else {
    objc_super v3 = &OBJC_IVAR___CCUIContentModuleContentContainerView__compactContinuousCornerRadius;
  }
  [(CCUIContentModuleContentContainerView *)self _setContinuousCornerRadius:a3 ignoreSubviewClipping:*(double *)((char *)&self->super.super.super.super.isa + *v3)];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = v7;
  if (self->_expanded && [v7 type] == 10)
  {
    [(CCUIContentModuleContentContainerView *)self bounds];
    UIRectGetCenter();
    double x = v9;
    double y = v10;
  }
  v13.receiver = self;
  v13.super_class = (Class)CCUIContentModuleContentContainerView;
  double v11 = -[CCUITouchPassThroughView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v8, x, y);

  return v11;
}

- (BOOL)moduleProvidesOwnPlatter
{
  return self->_moduleProvidesOwnPlatter;
}

- (double)compactContinuousCornerRadius
{
  return self->_compactContinuousCornerRadius;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  self->_compactContinuousCornerRadius = a3;
}

- (double)expandedContinuousCornerRadius
{
  return self->_expandedContinuousCornerRadius;
}

- (void)setExpandedContinuousCornerRadius:(double)a3
{
  self->_expandedContinuousCornerRadius = a3;
}

- (void).cxx_destruct
{
}

@end
@interface MPRouteButton
- (BOOL)forcesUppercaseText;
- (BOOL)isRouteLabelHidden;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MPAVRoute)route;
- (MPRouteButton)initWithFrame:(CGRect)a3;
- (NSArray)contentViews;
- (NSString)routeTitle;
- (UIColor)overrideColor;
- (UIEdgeInsets)hitRectInsets;
- (UIFont)font;
- (UIImage)accessoryImage;
- (UIImageSymbolConfiguration)preferredSymbolConfiguration;
- (UIImageView)accessoryImageView;
- (double)accessoryImageSpacing;
- (int64_t)routeLabelAxis;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)_updateAccessoryIcon;
- (void)layoutSubviews;
- (void)routeDidChangeNotification:(id)a3;
- (void)setAccessoryImage:(id)a3;
- (void)setAccessoryImageSpacing:(double)a3;
- (void)setAccessoryImageView:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setFont:(id)a3;
- (void)setForcesUppercaseText:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHitRectInsets:(UIEdgeInsets)a3;
- (void)setOverrideColor:(id)a3;
- (void)setPreferredSymbolConfiguration:(id)a3;
- (void)setRoute:(id)a3;
- (void)setRouteLabelAxis:(int64_t)a3;
- (void)setRouteLabelHidden:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation MPRouteButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_routeTitle, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_accessoryImageView, 0);
  objc_storeStrong((id *)&self->_accessoryImage, 0);

  objc_storeStrong((id *)&self->_routeLabel, 0);
}

- (int64_t)routeLabelAxis
{
  return self->_routeLabelAxis;
}

- (void)setOverrideColor:(id)a3
{
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (BOOL)isRouteLabelHidden
{
  return self->_routeLabelHidden;
}

- (NSString)routeTitle
{
  return self->_routeTitle;
}

- (MPAVRoute)route
{
  return self->_route;
}

- (void)setHitRectInsets:(UIEdgeInsets)a3
{
  self->_hitRectInsets = a3;
}

- (UIEdgeInsets)hitRectInsets
{
  double top = self->_hitRectInsets.top;
  double left = self->_hitRectInsets.left;
  double bottom = self->_hitRectInsets.bottom;
  double right = self->_hitRectInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIFont)font
{
  return self->_font;
}

- (double)accessoryImageSpacing
{
  return self->_accessoryImageSpacing;
}

- (void)setAccessoryImageView:(id)a3
{
}

- (UIImageView)accessoryImageView
{
  return self->_accessoryImageView;
}

- (UIImage)accessoryImage
{
  return self->_accessoryImage;
}

- (void)_updateAccessoryIcon
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = self->_route;
    v4 = [(MPAVRoute *)v3 predictedOutputDevice];
    if ([(MPAVRoute *)v3 isDeviceSpeakerRoute]) {
      BOOL v5 = v4 == 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5)
    {
      [(UIImageView *)self->_accessoryImageView setImage:self->_accessoryImage];
    }
    else
    {
      if (v4)
      {
        v6 = [MEMORY[0x1E4F1CA48] arrayWithObject:v4];
      }
      else
      {
        v19 = v3;
        v7 = [(MPAVRoute *)v3 endpointObject];
        v8 = [v7 outputDevices];

        v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v21 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
              v15 = [MPAVOutputDeviceRoute alloc];
              uint64_t v24 = v14;
              v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
              v17 = [(MPAVOutputDeviceRoute *)v15 initWithOutputDevices:v16];
              [v6 addObject:v17];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
          }
          while (v11);
        }

        v4 = 0;
        v3 = v19;
      }
      v18 = +[MPAVRoutingController _symbolImageForRoutes:v6];
      [(UIImageView *)self->_accessoryImageView setImage:v18];
    }
  }
  else
  {
    [(UIImageView *)self->_accessoryImageView setImage:self->_accessoryImage];
  }
  [(MPRouteButton *)self invalidateIntrinsicContentSize];
  [(MPRouteButton *)self setNeedsLayout];
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  if (self->_routeLabel == a3) {
    [(MPRouteButton *)self invalidateIntrinsicContentSize];
  }
}

- (void)routeDidChangeNotification:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__MPRouteButton_routeDidChangeNotification___block_invoke;
  v6[3] = &unk_1E57F9F98;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __44__MPRouteButton_routeDidChangeNotification___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) object];
  v3 = [*(id *)(a1 + 40) route];
  int v4 = [v2 isEqual:v3];

  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    [v5 _updateAccessoryIcon];
  }
}

- (NSArray)contentViews
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = self->_accessoryImageView;
  v2 = [(MPRouteLabel *)self->_routeLabel titleLabel];
  v5[1] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  return (NSArray *)v3;
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return [(UIImageView *)self->_accessoryImageView preferredSymbolConfiguration];
}

- (void)setRouteLabelAxis:(int64_t)a3
{
  if (self->_routeLabelAxis != a3)
  {
    self->_routeLabelAxis = a3;
    [(MPRouteButton *)self invalidateIntrinsicContentSize];
    [(MPRouteButton *)self setNeedsLayout];
  }
}

- (void)setRouteLabelHidden:(BOOL)a3
{
  if (self->_routeLabelHidden != a3)
  {
    self->_routeLabelHidden = a3;
    -[MPRouteLabel setHidden:](self->_routeLabel, "setHidden:");
    [(MPRouteButton *)self invalidateIntrinsicContentSize];
    [(MPRouteButton *)self setNeedsLayout];
  }
}

- (void)setForcesUppercaseText:(BOOL)a3
{
  [(MPRouteLabel *)self->_routeLabel setForcesUppercaseText:a3];
  [(MPRouteButton *)self invalidateIntrinsicContentSize];

  [(MPRouteButton *)self setNeedsLayout];
}

- (BOOL)forcesUppercaseText
{
  return [(MPRouteLabel *)self->_routeLabel forcesUppercaseText];
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
  id v5 = a3;
  [(MPRouteLabel *)self->_routeLabel setRoute:v5];

  [(MPRouteButton *)self invalidateIntrinsicContentSize];
  [(MPRouteButton *)self setNeedsLayout];

  [(MPRouteButton *)self _updateAccessoryIcon];
}

- (void)setFont:(id)a3
{
  routeLabel = self->_routeLabel;
  id v5 = a3;
  [(MPRouteLabel *)routeLabel setFont:v5];
  LOBYTE(routeLabel) = [(UIFont *)self->_font isEqual:v5];

  if ((routeLabel & 1) == 0)
  {
    [(MPRouteButton *)self invalidateIntrinsicContentSize];
    [(MPRouteButton *)self setNeedsLayout];
  }
}

- (void)setAccessoryImageSpacing:(double)a3
{
  double v3 = self->_accessoryImageSpacing - a3;
  if (v3 < 0.0) {
    double v3 = -v3;
  }
  if (v3 > 0.00000011920929)
  {
    self->_accessoryImageSpacing = a3;
    [(MPRouteButton *)self invalidateIntrinsicContentSize];
    [(MPRouteButton *)self setNeedsLayout];
  }
}

- (void)setAccessoryImage:(id)a3
{
  id v5 = a3;
  if ((-[UIImage isEqual:](self->_accessoryImage, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_accessoryImage, a3);
    [(MPRouteButton *)self _updateAccessoryIcon];
  }
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)MPRouteButton;
  [(MPRouteButton *)&v4 tintColorDidChange];
  double v3 = [(MPRouteButton *)self tintColor];
  [(MPRouteLabel *)self->_routeLabel setTintColor:v3];
}

- (void)setAlpha:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPRouteButton;
  -[MPRouteButton setAlpha:](&v5, sel_setAlpha_);
  self->_alphaOverride = a3;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)MPRouteButton;
  -[MPRouteButton setHighlighted:](&v19, sel_setHighlighted_);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v5 = [(MPRouteButton *)self subviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    if (v3) {
      double v9 = 0.0;
    }
    else {
      double v9 = 0.47;
    }
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        double alphaOverride = 0.2;
        if (!v3) {
          double alphaOverride = self->_alphaOverride;
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) alpha];
        if (alphaOverride != v13)
        {
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __32__MPRouteButton_setHighlighted___block_invoke;
          v14[3] = &unk_1E57F8328;
          v14[4] = v11;
          *(double *)&v14[5] = alphaOverride;
          [MEMORY[0x1E4FB1EB0] animateWithDuration:327684 delay:v14 options:0 animations:v9 completion:0.0];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v7);
  }
}

uint64_t __32__MPRouteButton_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UIImageView sizeThatFits:](self->_accessoryImageView, "sizeThatFits:");
  double v7 = v6;
  double v9 = v8;
  if ([(MPRouteButton *)self isRouteLabelHidden])
  {
    double v10 = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    -[MPRouteLabel sizeThatFits:](self->_routeLabel, "sizeThatFits:", width, height);
  }
  int64_t routeLabelAxis = self->_routeLabelAxis;
  if (routeLabelAxis == 1)
  {
    if (v10 >= v7) {
      double v7 = v10;
    }
    double v15 = -v11;
    if (v11 >= 0.0) {
      double v15 = v11;
    }
    if (v15 > 0.00000011920929) {
      double v9 = v9 + v11 + self->_accessoryImageSpacing;
    }
  }
  else if (!routeLabelAxis)
  {
    double v13 = -v10;
    if (v10 >= 0.0) {
      double v13 = v10;
    }
    if (v13 > 0.00000011920929) {
      double v7 = v7 + v10 + self->_accessoryImageSpacing;
    }
    if (v9 >= v11) {
      double v14 = v9;
    }
    else {
      double v14 = v11;
    }
    if (v14 >= 0.0) {
      double v9 = v14;
    }
    else {
      double v9 = 0.0;
    }
  }
  double v16 = v7;
  double v17 = v9;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(MPRouteButton *)self bounds];
  double top = self->_hitRectInsets.top;
  double left = self->_hitRectInsets.left;
  double v10 = v9 + left;
  double v12 = v11 - (left + self->_hitRectInsets.right);
  double v14 = v13 + top;
  double v16 = v15 - (top + self->_hitRectInsets.bottom);
  CGFloat v17 = x;
  CGFloat v18 = y;

  return CGRectContainsPoint(*(CGRect *)&v10, *(CGPoint *)&v17);
}

- (CGSize)intrinsicContentSize
{
  -[MPRouteButton sizeThatFits:](self, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)layoutSubviews
{
  v41.receiver = self;
  v41.super_class = (Class)MPRouteButton;
  [(MPRouteButton *)&v41 layoutSubviews];
  [(MPRouteButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[UIImageView sizeThatFits:](self->_accessoryImageView, "sizeThatFits:", v3, v5);
  double v8 = v7;
  int64_t v9 = [(MPRouteButton *)self routeLabelAxis];
  if (v9 == 1)
  {
    [(MPRouteButton *)self bounds];
    UIRectCenteredXInRect();
    [(MPRouteButton *)self accessoryImageSpacing];
    UIEdgeInsetsMakeWithEdges();
    double v4 = v4 - (v11 + v12);
    double v6 = v6 - (v13 + v14);
  }
  else if (!v9)
  {
    [(MPRouteButton *)self accessoryImageSpacing];
    double v4 = v4 - (v8 + v10 + 0.0);
  }
  if (![(MPRouteButton *)self isRouteLabelHidden]) {
    -[MPRouteLabel sizeThatFits:](self->_routeLabel, "sizeThatFits:", v4, v6);
  }
  if (![(MPRouteButton *)self isRouteLabelHidden])
  {
    int64_t v15 = [(MPRouteButton *)self routeLabelAxis];
    if (v15 == 1)
    {
      UIRectCenteredXInRect();
    }
    else if (!v15)
    {
      UIRectCenteredYInRect();
    }
  }
  double v16 = [(MPRouteButton *)self traitCollection];
  [v16 displayScale];

  UIRectIntegralWithScale();
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  [(MPRouteButton *)self bounds];
  [(UIImageView *)self->_accessoryImageView setFrame:MPRectByApplyingUserInterfaceLayoutDirectionInRect(v18, v20, v22, v24, v25, v26, v27, v28)];
  UIRectIntegralWithScale();
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  [(MPRouteButton *)self bounds];
  [(MPRouteLabel *)self->_routeLabel setFrame:MPRectByApplyingUserInterfaceLayoutDirectionInRect(v30, v32, v34, v36, v37, v38, v39, v40)];
}

- (MPRouteButton)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)MPRouteButton;
  double v3 = -[MPRouteButton initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    v3->_accessoryImageSpacing = 8.0;
    v3->_double alphaOverride = 1.0;
    v3->_int64_t routeLabelAxis = 0;
    id v5 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    accessoryImageView = v4->_accessoryImageView;
    v4->_accessoryImageView = (UIImageView *)v10;

    [(UIImageView *)v4->_accessoryImageView setUserInteractionEnabled:0];
    double v12 = [MEMORY[0x1E4FB1830] configurationWithPointSize:6 weight:20.0];
    [(UIImageView *)v4->_accessoryImageView setPreferredSymbolConfiguration:v12];

    [(MPRouteButton *)v4 addSubview:v4->_accessoryImageView];
    double v13 = -[MPRouteLabel initWithFrame:]([MPRouteLabel alloc], "initWithFrame:", v6, v7, v8, v9);
    routeLabel = v4->_routeLabel;
    v4->_routeLabel = v13;

    [(MPRouteLabel *)v4->_routeLabel setUserInteractionEnabled:0];
    [(MPRouteLabel *)v4->_routeLabel _setTextColorFollowsTintColor:1];
    [(MPRouteButton *)v4 addSubview:v4->_routeLabel];
    int64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v4 selector:sel_routeDidChangeNotification_ name:@"MPAVRouteDidChangeNotification" object:0];
  }
  return v4;
}

@end
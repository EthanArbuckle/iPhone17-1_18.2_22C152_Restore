@interface HUQuickControlBackgroundEffectView
- (HUQuickControlBackgroundEffectView)initWithEffectType:(unint64_t)a3;
- (unint64_t)effectType;
- (void)_configureForCurrentEffectType;
- (void)tintColorDidChange;
@end

@implementation HUQuickControlBackgroundEffectView

- (HUQuickControlBackgroundEffectView)initWithEffectType:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUQuickControlBackgroundEffectView;
  v4 = [(HUQuickControlBackgroundEffectView *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_effectType = a3;
    [(HUQuickControlBackgroundEffectView *)v4 _configureForCurrentEffectType];
  }
  return v5;
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlBackgroundEffectView;
  [(HUQuickControlBackgroundEffectView *)&v4 tintColorDidChange];
  v3 = [(HUQuickControlBackgroundEffectView *)self tintColor];
  [(HUQuickControlBackgroundEffectView *)self setBackgroundColor:v3];
}

- (void)_configureForCurrentEffectType
{
  id v5 = +[HUQuickControlVisualEffect effectWithType:[(HUQuickControlBackgroundEffectView *)self effectType]];
  v3 = [v5 effectConfig];
  objc_super v4 = [v3 contentConfig];
  [v4 configureLayerView:self];
}

- (unint64_t)effectType
{
  return self->_effectType;
}

@end
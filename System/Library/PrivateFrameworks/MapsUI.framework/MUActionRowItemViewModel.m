@interface MUActionRowItemViewModel
- (BOOL)isEnabled;
- (BOOL)isHidden;
- (BOOL)isSelected;
- (BOOL)titleUsesMonospacedNumbersFont;
- (MUActionRowItemViewModel)init;
- (MUFeatureDiscoveryAnnotationView)featureDiscoveryView;
- (NSString)accessibilityIdentifier;
- (NSString)symbolName;
- (NSString)titleText;
- (UIColor)preferredBackgroundColor;
- (UIColor)preferredTintColor;
- (UIView)accessoryView;
- (id)analyticsButtonValue;
- (id)analyticsButtonValues;
- (id)buildMenuWithPresentationOptions:(id)a3;
- (void)_notifyObservers;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setFeatureDiscoveryView:(id)a3;
@end

@implementation MUActionRowItemViewModel

- (MUActionRowItemViewModel)init
{
  v7.receiver = self;
  v7.super_class = (Class)MUActionRowItemViewModel;
  v2 = [(MUActionRowItemViewModel *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F647B0]);
    uint64_t v4 = [v3 initWithProtocol:&unk_1EE4268D8 queue:MEMORY[0x1E4F14428]];
    observers = v2->_observers;
    v2->_observers = (GEOObserverHashTable *)v4;
  }
  return v2;
}

- (id)buildMenuWithPresentationOptions:(id)a3
{
  return 0;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_notifyObservers
{
}

- (void)setFeatureDiscoveryView:(id)a3
{
  v5 = (MUFeatureDiscoveryAnnotationView *)a3;
  p_featureDiscoveryView = &self->_featureDiscoveryView;
  if (self->_featureDiscoveryView != v5)
  {
    objc_super v7 = v5;
    objc_storeStrong((id *)p_featureDiscoveryView, a3);
    p_featureDiscoveryView = (MUFeatureDiscoveryAnnotationView **)[(GEOObserverHashTable *)self->_observers didUpdateFeatureDiscoveryStatus:self];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_featureDiscoveryView, v5);
}

- (id)analyticsButtonValue
{
  return 0;
}

- (id)analyticsButtonValues
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(MUActionRowItemViewModel *)self analyticsButtonValue];
  id v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (UIColor)preferredTintColor
{
  return self->_preferredTintColor;
}

- (UIColor)preferredBackgroundColor
{
  return self->_preferredBackgroundColor;
}

- (BOOL)titleUsesMonospacedNumbersFont
{
  return self->_titleUsesMonospacedNumbersFont;
}

- (MUFeatureDiscoveryAnnotationView)featureDiscoveryView
{
  return self->_featureDiscoveryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureDiscoveryView, 0);
  objc_storeStrong((id *)&self->_preferredBackgroundColor, 0);
  objc_storeStrong((id *)&self->_preferredTintColor, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
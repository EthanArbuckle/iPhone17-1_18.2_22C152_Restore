@interface NTKKuiperTypographicSizeProvider
+ (double)randomTypographicStyleFraction;
+ (double)typographicStyleFractionForKey:(id)a3;
+ (id)keyForTypographicStyleFraction:(double)a3;
- (BOOL)isCrownInteractionEnabled;
- (BOOL)isEditing;
- (CGSize)typographicSize;
- (NSString)currentTypographicStyleKey;
- (NTKKuiperTypographicSizeProvider)init;
- (NTKKuiperTypographicSizeProviderDelegate)delegate;
- (double)rubberbanding;
- (void)_notifyDelegateUpdateNumeralSizes;
- (void)resetWithTypographicStyleFraction:(double)a3;
- (void)setCrownInteractionEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NTKKuiperTypographicSizeProvider

- (NTKKuiperTypographicSizeProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKKuiperTypographicSizeProvider;
  v2 = [(NTKKuiperTypographicSizeProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    baseTypographicSizeAnimation = v2->_baseTypographicSizeAnimation;
    v2->_baseTypographicSizeAnimation = (NTKKuiperFontTypographicSizeAnimation *)v3;

    objc_storeWeak((id *)&v2->_delegate, 0);
  }
  return v2;
}

- (NSString)currentTypographicStyleKey
{
  return (NSString *)+[NTKKuiperTypographicSizeProvider keyForTypographicStyleFraction:self->_typographicStyleFraction];
}

- (void)resetWithTypographicStyleFraction:(double)a3
{
  self->_typographicStyleFraction = a3;
  [(NTKKuiperTypographicSizeProvider *)self _notifyDelegateUpdateNumeralSizes];
}

- (void)_notifyDelegateUpdateNumeralSizes
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 typographicSizeProviderUpdateNumeralSizes:self];
  }
}

- (CGSize)typographicSize
{
  [(NTKKuiperFontTypographicSizeAnimation *)self->_baseTypographicSizeAnimation typographicSizeForFraction:fmax(fmin(self->_typographicStyleFraction, 1.0), 0.0)];
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)rubberbanding
{
  double typographicStyleFraction = self->_typographicStyleFraction;
  double v3 = fmin(typographicStyleFraction, 0.0);
  if (typographicStyleFraction <= 1.0) {
    return v3;
  }
  else {
    return typographicStyleFraction + -1.0;
  }
}

+ (double)randomTypographicStyleFraction
{
  return (double)(arc4random_uniform(0x15u) / 0x14);
}

+ (double)typographicStyleFractionForKey:(id)a3
{
  [a3 floatValue];
  return v3 / 20.0;
}

+ (id)keyForTypographicStyleFraction:(double)a3
{
  return +[NSString stringWithFormat:@"%lu", vcvtad_u64_f64(a3 * 20.0)];
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isCrownInteractionEnabled
{
  return self->_crownInteractionEnabled;
}

- (void)setCrownInteractionEnabled:(BOOL)a3
{
  self->_crownInteractionEnabled = a3;
}

- (NTKKuiperTypographicSizeProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKKuiperTypographicSizeProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_baseTypographicSizeAnimation, 0);
}

@end
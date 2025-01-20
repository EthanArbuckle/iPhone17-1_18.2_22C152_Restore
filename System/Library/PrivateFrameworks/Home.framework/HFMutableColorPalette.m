@interface HFMutableColorPalette
- (void)setColor:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation HFMutableColorPalette

- (void)setColor:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(HFColorPalette *)self colors];
  unint64_t v8 = [v7 count];

  if (v8 <= a4)
  {
    v9 = NSNumber;
    v10 = [(HFColorPalette *)self colors];
    v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    NSLog(&cfstr_AttemptingToSe.isa, v11);
  }
  BOOL v12 = [(HFColorPalette *)self _isNaturalLightPalette];
  if (a4 || !v12)
  {
    if ([v6 isNaturalLightColor])
    {
      NSLog(&cfstr_YouCanTSetTheN.isa);
    }
    else
    {
      v14 = [(HFColorPalette *)self rawColors];
      v15 = (void *)[v14 mutableCopy];

      [v15 setObject:v6 atIndexedSubscript:a4];
      [(HFColorPalette *)self setRawColors:v15];
    }
  }
  else
  {
    v13 = HFLogForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "Ignoring attempt to change the color position reservered for the natural light swatch.", buf, 2u);
    }
  }
}

@end
@interface HUDynamicFormattingLabel
- (HFDynamicFormattingValue)dynamicFormattingValue;
- (NACancelable)formattedValueObservationCancellationToken;
- (NSArray)preferredFonts;
- (NSDictionary)defaultAttributes;
- (UIFont)preferredFontForCurrentSize;
- (id)_formattedValueWithFont:(id)a3;
- (void)_updateFormattedValueIncludingFont:(BOOL)a3;
- (void)_updateFormattedValueObservation;
- (void)_updatePreferredFontIncludingValue:(BOOL)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setDefaultAttributes:(id)a3;
- (void)setDynamicFormattingValue:(id)a3;
- (void)setFormattedValueObservationCancellationToken:(id)a3;
- (void)setPreferredFontForCurrentSize:(id)a3;
- (void)setPreferredFonts:(id)a3;
@end

@implementation HUDynamicFormattingLabel

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)HUDynamicFormattingLabel;
  [(HUDynamicFormattingLabel *)&v3 didMoveToWindow];
  [(HUDynamicFormattingLabel *)self _updateFormattedValueObservation];
}

- (void)setDynamicFormattingValue:(id)a3
{
  id v5 = a3;
  v6 = self->_dynamicFormattingValue;
  v7 = (HFDynamicFormattingValue *)v5;
  v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_8;
  }
  if (!v6)
  {

    goto LABEL_7;
  }
  char v8 = [(HFDynamicFormattingValue *)v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_dynamicFormattingValue, a3);
    [(HUDynamicFormattingLabel *)self _updateFormattedValueIncludingFont:1];
    [(HUDynamicFormattingLabel *)self _updateFormattedValueObservation];
  }
LABEL_8:
}

- (void)setDefaultAttributes:(id)a3
{
  id v4 = a3;
  id v5 = self->_defaultAttributes;
  v10 = (NSDictionary *)v4;
  if (v5 == v10)
  {

LABEL_8:
    v7 = v10;
    goto LABEL_9;
  }
  if (!v5)
  {

    v7 = v10;
    goto LABEL_7;
  }
  char v6 = [(NSDictionary *)v5 isEqual:v10];

  v7 = v10;
  if ((v6 & 1) == 0)
  {
LABEL_7:
    char v8 = (NSDictionary *)[(NSDictionary *)v7 copy];
    defaultAttributes = self->_defaultAttributes;
    self->_defaultAttributes = v8;

    [(HUDynamicFormattingLabel *)self _updateFormattedValueIncludingFont:1];
    goto LABEL_8;
  }
LABEL_9:
}

- (void)setPreferredFonts:(id)a3
{
  id v5 = a3;
  char v6 = self->_preferredFonts;
  v7 = (NSArray *)v5;
  v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_8;
  }
  if (!v6)
  {

    goto LABEL_7;
  }
  char v8 = [(NSArray *)v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_preferredFonts, a3);
    [(HUDynamicFormattingLabel *)self _updatePreferredFontIncludingValue:1];
  }
LABEL_8:
}

- (void)_updateFormattedValueObservation
{
  objc_super v3 = [(HUDynamicFormattingLabel *)self formattedValueObservationCancellationToken];
  [v3 cancel];

  uint64_t v4 = [(HUDynamicFormattingLabel *)self window];
  if (v4)
  {
    id v5 = (void *)v4;
    char v6 = [(HUDynamicFormattingLabel *)self dynamicFormattingValue];

    if (v6)
    {
      objc_initWeak(&location, self);
      v7 = [(HUDynamicFormattingLabel *)self dynamicFormattingValue];
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      v11 = __60__HUDynamicFormattingLabel__updateFormattedValueObservation__block_invoke;
      v12 = &unk_1E638F318;
      objc_copyWeak(&v13, &location);
      char v8 = [v7 observeFormattedValueChangesWithBlock:&v9];
      -[HUDynamicFormattingLabel setFormattedValueObservationCancellationToken:](self, "setFormattedValueObservationCancellationToken:", v8, v9, v10, v11, v12);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __60__HUDynamicFormattingLabel__updateFormattedValueObservation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateFormattedValueIncludingFont:1];
}

- (id)_formattedValueWithFont:(id)a3
{
  id v4 = a3;
  id v5 = [(HUDynamicFormattingLabel *)self defaultAttributes];
  char v6 = v5;
  if (!v5) {
    id v5 = (void *)MEMORY[0x1E4F1CC08];
  }
  v7 = (void *)[v5 mutableCopy];

  objc_msgSend(v7, "na_safeSetObject:forKey:", v4, *MEMORY[0x1E4F42508]);
  char v8 = [(HUDynamicFormattingLabel *)self dynamicFormattingValue];
  uint64_t v9 = [v8 currentFormattedValue];
  uint64_t v10 = [v9 stringWithAttributes:v7];

  return v10;
}

- (void)_updateFormattedValueIncludingFont:(BOOL)a3
{
  if (a3) {
    [(HUDynamicFormattingLabel *)self _updatePreferredFontIncludingValue:0];
  }
  id v5 = [(HUDynamicFormattingLabel *)self preferredFontForCurrentSize];
  id v4 = [(HUDynamicFormattingLabel *)self _formattedValueWithFont:v5];
  [(HUDynamicFormattingLabel *)self setAttributedText:v4];
}

- (void)_updatePreferredFontIncludingValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = [(HUDynamicFormattingLabel *)self preferredFonts];
  char v6 = [v5 lastObject];

  [(HUDynamicFormattingLabel *)self bounds];
  if (v8 != *MEMORY[0x1E4F1DB30] || v7 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v10 = [(HUDynamicFormattingLabel *)self preferredFonts];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v16 = [(HUDynamicFormattingLabel *)self _formattedValueWithFont:v15];
          objc_msgSend(v16, "boundingRectWithSize:options:context:", 0, 0, 1.79769313e308, 1.79769313e308);
          CGFloat x = v34.origin.x;
          CGFloat y = v34.origin.y;
          CGFloat width = v34.size.width;
          CGFloat height = v34.size.height;
          double MaxX = CGRectGetMaxX(v34);
          [(HUDynamicFormattingLabel *)self bounds];
          if (MaxX <= CGRectGetMaxX(v35))
          {
            v36.origin.CGFloat x = x;
            v36.origin.CGFloat y = y;
            v36.size.CGFloat width = width;
            v36.size.CGFloat height = height;
            double MaxY = CGRectGetMaxY(v36);
            [(HUDynamicFormattingLabel *)self bounds];
            if (MaxY <= CGRectGetMaxY(v37))
            {
              id v23 = v15;

              char v6 = v23;
              goto LABEL_16;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  id v24 = [(HUDynamicFormattingLabel *)self preferredFontForCurrentSize];
  id v25 = v6;
  v26 = v25;
  if (v24 == v25)
  {
  }
  else
  {
    if (v24)
    {
      char v27 = [v24 isEqual:v25];

      if (v27) {
        goto LABEL_25;
      }
    }
    else
    {
    }
    [(HUDynamicFormattingLabel *)self setPreferredFontForCurrentSize:v26];
    if (v3) {
      [(HUDynamicFormattingLabel *)self _updateFormattedValueIncludingFont:0];
    }
  }
LABEL_25:
}

- (void)layoutSubviews
{
  [(HUDynamicFormattingLabel *)self _updatePreferredFontIncludingValue:1];
  v3.receiver = self;
  v3.super_class = (Class)HUDynamicFormattingLabel;
  [(HUDynamicFormattingLabel *)&v3 layoutSubviews];
}

- (HFDynamicFormattingValue)dynamicFormattingValue
{
  return self->_dynamicFormattingValue;
}

- (NSDictionary)defaultAttributes
{
  return self->_defaultAttributes;
}

- (NSArray)preferredFonts
{
  return self->_preferredFonts;
}

- (NACancelable)formattedValueObservationCancellationToken
{
  return self->_formattedValueObservationCancellationToken;
}

- (void)setFormattedValueObservationCancellationToken:(id)a3
{
}

- (UIFont)preferredFontForCurrentSize
{
  return self->_preferredFontForCurrentSize;
}

- (void)setPreferredFontForCurrentSize:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredFontForCurrentSize, 0);
  objc_storeStrong((id *)&self->_formattedValueObservationCancellationToken, 0);
  objc_storeStrong((id *)&self->_preferredFonts, 0);
  objc_storeStrong((id *)&self->_defaultAttributes, 0);

  objc_storeStrong((id *)&self->_dynamicFormattingValue, 0);
}

@end
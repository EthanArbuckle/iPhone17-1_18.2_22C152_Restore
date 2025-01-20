@interface SFDismissButton
+ (id)titleForDismissButtonStyle:(uint64_t)a1;
- (SFDismissButton)init;
- (uint64_t)_updateButtonStyle;
- (uint64_t)setStyle:(uint64_t)result;
- (uint64_t)style;
- (void)setPreferredTraitCollection:(id *)a1;
@end

@implementation SFDismissButton

- (SFDismissButton)init
{
  v9.receiver = self;
  v9.super_class = (Class)SFDismissButton;
  objc_msgSend(-[SFDismissButton class](&v9, sel_class), "buttonWithType:", 1);
  v3 = (SFDismissButton *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v3->_style = 0;
    v4 = (void *)MEMORY[0x1E4FB1798];
    [MEMORY[0x1E4FB1798] labelFontSize];
    v5 = objc_msgSend(v4, "systemFontOfSize:");
    v6 = [(SFDismissButton *)v3 titleLabel];
    [v6 setFont:v5];

    -[SFDismissButton _updateButtonStyle]((uint64_t)v3);
    v7 = v3;
  }

  return v3;
}

- (uint64_t)_updateButtonStyle
{
  if (result)
  {
    v1 = (void *)result;
    v2 = +[SFDismissButton titleForDismissButtonStyle:]((uint64_t)SFDismissButton, *(void *)(result + 744));
    [v1 setTitle:v2 forState:0];

    return [v1 sizeToFit];
  }
  return result;
}

- (uint64_t)setStyle:(uint64_t)result
{
  if (result)
  {
    if (*(void *)(result + 744) != a2)
    {
      *(void *)(result + 744) = a2;
      return -[SFDismissButton _updateButtonStyle](result);
    }
  }
  return result;
}

+ (id)titleForDismissButtonStyle:(uint64_t)a1
{
  v3 = self;
  if (a2 <= 2)
  {
    v3 = _WBSLocalizedString();
  }

  return v3;
}

- (void)setPreferredTraitCollection:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    id v5 = a1[94];
    if (v5 != v4)
    {
      id v12 = v4;
      char v6 = [v5 isEqual:v4];
      id v4 = v12;
      if ((v6 & 1) == 0)
      {
        objc_storeStrong(a1 + 94, a2);
        v7 = [MEMORY[0x1E4FB17A8] defaultMetrics];
        v8 = (void *)MEMORY[0x1E4FB1798];
        [MEMORY[0x1E4FB1798] labelFontSize];
        objc_super v9 = objc_msgSend(v8, "systemFontOfSize:");
        v10 = [v7 scaledFontForFont:v9 compatibleWithTraitCollection:v12];
        v11 = [a1 titleLabel];
        [v11 setFont:v10];

        [a1 sizeToFit];
        id v4 = v12;
      }
    }
  }
}

- (uint64_t)style
{
  if (result) {
    return *(void *)(result + 744);
  }
  return result;
}

- (void).cxx_destruct
{
}

@end
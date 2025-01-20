@interface EKUIClearButton
+ (double)trailingOffsetToMarginForTextFieldClearButtonAlignment;
- (EKUIClearButton)initWithColor:(id)a3;
- (id)_clearImageSymbolConfig;
@end

@implementation EKUIClearButton

+ (double)trailingOffsetToMarginForTextFieldClearButtonAlignment
{
  return 5.0;
}

- (EKUIClearButton)initWithColor:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)EKUIClearButton;
  v5 = [(EKUIClearButton *)&v22 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle.fill"];
    v7 = [(EKUIClearButton *)v5 _clearImageSymbolConfig];
    v8 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    [v8 setImage:v6];
    [v8 setPreferredSymbolConfigurationForImage:v7];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __33__EKUIClearButton_initWithColor___block_invoke;
    v20[3] = &unk_1E6089F38;
    id v21 = v4;
    [v8 setImageColorTransformer:v20];
    v9 = [v8 background];
    [v9 setCornerRadius:0.0];

    objc_msgSend(v8, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
    [(EKUIClearButton *)v5 setConfiguration:v8];
    -[EKUIClearButton _setTouchInsets:](v5, "_setTouchInsets:", -20.0, -20.0, -20.0, -20.0);
    LODWORD(v10) = 1148846080;
    [(EKUIClearButton *)v5 setContentCompressionResistancePriority:0 forAxis:v10];
    LODWORD(v11) = 1148846080;
    [(EKUIClearButton *)v5 setContentCompressionResistancePriority:1 forAxis:v11];
    LODWORD(v12) = 1148846080;
    [(EKUIClearButton *)v5 setContentHuggingPriority:0 forAxis:v12];
    LODWORD(v13) = 1148846080;
    [(EKUIClearButton *)v5 setContentHuggingPriority:1 forAxis:v13];
    objc_initWeak(&location, v5);
    v23[0] = objc_opt_class();
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __33__EKUIClearButton_initWithColor___block_invoke_2;
    v17[3] = &unk_1E60874F8;
    objc_copyWeak(&v18, &location);
    id v15 = (id)[(EKUIClearButton *)v5 registerForTraitChanges:v14 withHandler:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v5;
}

id __33__EKUIClearButton_initWithColor___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __33__EKUIClearButton_initWithColor___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained configuration];

  id v3 = objc_loadWeakRetained(v1);
  id v4 = [v3 _clearImageSymbolConfig];
  [v6 setPreferredSymbolConfigurationForImage:v4];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setConfiguration:v6];
}

- (id)_clearImageSymbolConfig
{
  v2 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v3 = *MEMORY[0x1E4FB28C8];
  id v4 = [(EKUIClearButton *)self traitCollection];
  id v5 = objc_msgSend(v2, "configurationWithTextStyle:scale:", v3, +[EKUIConstrainedFontUtilities tableViewCellCappedSymbolImageScaleWithScale:traitCollection:](EKUIConstrainedFontUtilities, "tableViewCellCappedSymbolImageScaleWithScale:traitCollection:", 2, v4));

  return v5;
}

@end
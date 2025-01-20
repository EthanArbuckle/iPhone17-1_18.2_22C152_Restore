@interface FULoadingView
- (FULabel)loadingLabel;
- (FULoadingView)init;
- (void)setLoadingLabel:(id)a3;
@end

@implementation FULoadingView

- (FULoadingView)init
{
  v18[5] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)FULoadingView;
  v2 = [(FULoadingView *)&v17 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v3 startAnimating];
    v4 = +[TLKLabel secondaryLabel];
    v5 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    [v4 setFont:v5];

    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"Loading Flight Status…" value:@"Loading Flight Status…" table:@"Localizable"];
    [v4 setText:v7];

    [(FULoadingView *)v2 addSubview:v4];
    [(FULoadingView *)v2 addSubview:v3];
    v8 = [MEMORY[0x263F08938] constraintWithItem:v2 attribute:8 relatedBy:0 toItem:v4 attribute:8 multiplier:3.0 constant:0.0];
    LODWORD(v9) = 1128792064;
    [v8 setPriority:v9];
    v10 = [MEMORY[0x263F08938] constraintWithItem:v2 attribute:9 relatedBy:0 toItem:v4 attribute:9 multiplier:1.0 constant:-26.0];
    v18[0] = v10;
    v11 = [MEMORY[0x263F08938] constraintWithItem:v2 attribute:10 relatedBy:0 toItem:v4 attribute:10 multiplier:1.0 constant:0.0];
    v18[1] = v11;
    v12 = [MEMORY[0x263F08938] constraintWithItem:v2 attribute:10 relatedBy:0 toItem:v3 attribute:10 multiplier:1.0 constant:0.0];
    v18[2] = v12;
    v13 = [MEMORY[0x263F08938] constraintWithItem:v4 attribute:5 relatedBy:0 toItem:v3 attribute:6 multiplier:1.0 constant:12.0];
    v18[3] = v13;
    v18[4] = v8;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:5];
    [(FULoadingView *)v2 addConstraints:v14];

    [(FULoadingView *)v2 setLoadingLabel:v4];
    v15 = v2;
  }
  return v2;
}

- (FULabel)loadingLabel
{
  return (FULabel *)objc_getProperty(self, a2, 408, 1);
}

- (void)setLoadingLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
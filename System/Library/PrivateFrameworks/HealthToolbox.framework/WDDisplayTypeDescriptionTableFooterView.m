@interface WDDisplayTypeDescriptionTableFooterView
- (WDDisplayTypeDescriptionTableFooterView)initWithCoder:(id)a3;
- (WDDisplayTypeDescriptionTableFooterView)initWithDisplayType:(id)a3;
- (WDDisplayTypeDescriptionTableFooterView)initWithFrame:(CGRect)a3;
@end

@implementation WDDisplayTypeDescriptionTableFooterView

- (WDDisplayTypeDescriptionTableFooterView)initWithDisplayType:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WDDisplayTypeDescriptionTableFooterView;
  v5 = -[WDDisplayTypeDescriptionTableFooterView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    v6 = [[WDDisplayTypeDescriptionView alloc] initWithDisplayType:v4 showAttributionText:1 style:1];
    descriptionView = v5->_descriptionView;
    v5->_descriptionView = v6;

    [(WDDisplayTypeDescriptionView *)v5->_descriptionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WDDisplayTypeDescriptionTableFooterView *)v5 addSubview:v5->_descriptionView];
    v14 = @"descriptionView";
    v15[0] = v5->_descriptionView;
    v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v9 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"|-M-[descriptionView]-M-|" options:0 metrics:&unk_26D2FD718 views:v8];
    [(WDDisplayTypeDescriptionTableFooterView *)v5 addConstraints:v9];

    v10 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[descriptionView]|" options:0 metrics:&unk_26D2FD718 views:v8];
    [(WDDisplayTypeDescriptionTableFooterView *)v5 addConstraints:v10];

    v11 = [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
    [(WDDisplayTypeDescriptionTableFooterView *)v5 setBackgroundColor:v11];
  }
  return v5;
}

- (WDDisplayTypeDescriptionTableFooterView)initWithFrame:(CGRect)a3
{
  id v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF4A0];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The -%@ method is not available on %@", v6, objc_opt_class() format];

  return 0;
}

- (WDDisplayTypeDescriptionTableFooterView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDDisplayTypeDescriptionTableFooterView;
  return [(WDDisplayTypeDescriptionTableFooterView *)&v4 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end
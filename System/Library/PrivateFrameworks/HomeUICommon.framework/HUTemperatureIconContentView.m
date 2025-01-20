@interface HUTemperatureIconContentView
- (BOOL)shouldFlipForRTL;
- (HUTemperatureIconContentView)initWithFrame:(CGRect)a3;
- (NSString)lastFontFittedText;
- (UIFont)lastFontFittingSize;
- (double)lastFontFittedWidth;
- (void)drawRect:(CGRect)a3;
- (void)setLastFontFittedText:(id)a3;
- (void)setLastFontFittedWidth:(double)a3;
- (void)setLastFontFittingSize:(id)a3;
- (void)tintColorDidChange;
- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5;
@end

@implementation HUTemperatureIconContentView

- (HUTemperatureIconContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUTemperatureIconContentView;
  v3 = -[HUIconContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(HUTemperatureIconContentView *)v3 setContentMode:3];
    [(HUTemperatureIconContentView *)v4 setOpaque:0];
    [(HUIconContentView *)v4 setAspectRatio:1.0];
    [(HUTemperatureIconContentView *)v4 setLastFontFittingSize:0];
    [(HUTemperatureIconContentView *)v4 setLastFontFittedWidth:0.0];
    [(HUTemperatureIconContentView *)v4 setLastFontFittedText:0];
  }
  return v4;
}

- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUTemperatureIconContentView;
  [(HUIconContentView *)&v12 updateWithIconDescriptor:v8 displayStyle:a4 animated:v5];
  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  if (v11) {
    [(HUTemperatureIconContentView *)self setNeedsDisplay];
  }
  else {
    NSLog(&cfstr_NoTemperatureI.isa);
  }
}

- (BOOL)shouldFlipForRTL
{
  return 0;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HUTemperatureIconContentView;
  [(HUTemperatureIconContentView *)&v3 tintColorDidChange];
  [(HUTemperatureIconContentView *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  double width = a3.size.width;
  v79[1] = *MEMORY[0x263EF8340];
  BOOL v5 = [(HUIconContentView *)self iconDescriptor];
  uint64_t v6 = [v5 targetHeatingCoolingMode];

  if (v6)
  {
    v7 = [(HUIconContentView *)self iconDescriptor];
    uint64_t v8 = [v7 heatingCoolingMode];

    switch(v8)
    {
      case 0:
        uint64_t v9 = [MEMORY[0x263F1C550] systemGreenColor];
        goto LABEL_10;
      case 1:
        uint64_t v9 = [MEMORY[0x263F1C550] systemOrangeColor];
        goto LABEL_10;
      case 2:
        uint64_t v9 = [MEMORY[0x263F1C550] systemTealColor];
        goto LABEL_10;
      case 3:
        uint64_t v9 = [MEMORY[0x263F1C550] darkGrayColor];
        goto LABEL_10;
      default:
        v10 = 0;
        break;
    }
  }
  else
  {
    if ([(HUIconContentView *)self displayStyle] != 1)
    {
      v10 = [(HUTemperatureIconContentView *)self tintColor];
      char v11 = 0;
      goto LABEL_12;
    }
    uint64_t v9 = [MEMORY[0x263F1C550] systemGrayColor];
LABEL_10:
    v10 = (void *)v9;
  }
  char v11 = 1;
LABEL_12:
  objc_super v12 = (void *)MEMORY[0x263F1C478];
  [(HUTemperatureIconContentView *)self bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [(HUTemperatureIconContentView *)self bounds];
  v22 = objc_msgSend(v12, "bezierPathWithRoundedRect:cornerRadius:", v14, v16, v18, v20, v21 * 0.5);
  [v10 setFill];
  [v22 fill];
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  if ((v11 & 1) == 0) {
    CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceOut);
  }
  v24 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  v25 = (void *)[v24 mutableCopy];

  [v25 setAlignment:1];
  [v25 setAllowsDefaultTighteningForTruncation:1];
  v26 = [(HUIconContentView *)self iconDescriptor];
  v27 = [v26 formattedTemperature];
  v28 = v27;
  if (v27)
  {
    id v29 = v27;
  }
  else
  {
    HFLocalizedString();
    id v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  v30 = v29;

  v70 = v10;
  id v71 = v30;
  if (!self)
  {
    id v35 = 0;
    goto LABEL_36;
  }
  v31 = [(HUTemperatureIconContentView *)self lastFontFittingSize];
  if (v31 && ([(HUTemperatureIconContentView *)self lastFontFittedWidth], v32 == width))
  {
    v33 = [(HUTemperatureIconContentView *)self lastFontFittedText];
    int v34 = [v33 isEqualToString:v71];

    if (v34)
    {
      id v35 = [(HUTemperatureIconContentView *)self lastFontFittingSize];
      goto LABEL_36;
    }
  }
  else
  {
  }
  v69 = v25;
  v66 = CurrentContext;
  [(HUTemperatureIconContentView *)self bounds];
  double v37 = v36 * 0.03125;
  v68 = [MEMORY[0x263F1C658] boldSystemFontOfSize:13.0];
  v38 = [v68 fontDescriptor];
  uint64_t v39 = +[HUFontUtilities fontDescriptorWithMonospacedDigitsForFontDescriptor:v38];

  v67 = (void *)v39;
  v40 = [MEMORY[0x263F1C658] fontWithDescriptor:v39 size:13.0];
  v41 = [v40 _fontScaledByScaleFactor:v37];

  double v42 = width * 0.75;
  id v43 = v41;
  id v44 = v71;
  v45 = [v43 fontDescriptor];
  uint64_t v46 = *MEMORY[0x263F1C238];
  uint64_t v78 = *MEMORY[0x263F1C238];
  v79[0] = v43;
  v47 = [NSDictionary dictionaryWithObjects:v79 forKeys:&v78 count:1];
  [v44 sizeWithAttributes:v47];
  double v49 = v48;

  if (v49 <= width * 0.75)
  {
    id v35 = v43;
  }
  else
  {
    [v43 pointSize];
    id v35 = [MEMORY[0x263F1C658] fontWithDescriptor:v45 size:floor(v42 / v49 * v50 + v42 / v49 * v50) * 0.5];
    uint64_t v76 = v46;
    id v77 = v35;
    v51 = [NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
    [v44 sizeWithAttributes:v51];
    double v53 = v52;

    if (v53 <= v42) {
      double v54 = 1.0;
    }
    else {
      double v54 = -1.0;
    }
    while (1)
    {
      v55 = (void *)MEMORY[0x263F1C658];
      [v35 pointSize];
      v57 = [v55 fontWithDescriptor:v45 size:v56 + v54 * 0.5];
      uint64_t v74 = v46;
      v75 = v57;
      v58 = [NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      [v44 sizeWithAttributes:v58];
      double v60 = v59;

      if (v53 > v42 && v60 < v42) {
        break;
      }
      if (v54 > 0.0 && v60 > v42) {
        goto LABEL_34;
      }

      id v35 = v57;
    }
    id v61 = v57;

    id v35 = v61;
LABEL_34:
  }
  CurrentContext = v66;

  [(HUTemperatureIconContentView *)self setLastFontFittingSize:v35];
  [(HUTemperatureIconContentView *)self setLastFontFittedWidth:width];
  [(HUTemperatureIconContentView *)self setLastFontFittedText:v44];

  v25 = v69;
LABEL_36:

  uint64_t v62 = *MEMORY[0x263F1C238];
  v73[0] = v35;
  uint64_t v63 = *MEMORY[0x263F1C240];
  v72[0] = v62;
  v72[1] = v63;
  v64 = [MEMORY[0x263F1C550] systemWhiteColor];
  v72[2] = *MEMORY[0x263F1C268];
  v73[1] = v64;
  v73[2] = v25;
  v65 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:3];

  [(HUTemperatureIconContentView *)self bounds];
  [v35 lineHeight];
  [(HUTemperatureIconContentView *)self center];
  [(HUTemperatureIconContentView *)self center];
  UIRectCenteredAboutPoint();
  objc_msgSend(v71, "drawWithRect:options:attributes:context:", 1, v65, 0);

  CGContextRestoreGState(CurrentContext);
}

- (UIFont)lastFontFittingSize
{
  return self->_lastFontFittingSize;
}

- (void)setLastFontFittingSize:(id)a3
{
}

- (double)lastFontFittedWidth
{
  return self->_lastFontFittedWidth;
}

- (void)setLastFontFittedWidth:(double)a3
{
  self->_lastFontFittedWidth = a3;
}

- (NSString)lastFontFittedText
{
  return self->_lastFontFittedText;
}

- (void)setLastFontFittedText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFontFittedText, 0);
  objc_storeStrong((id *)&self->_lastFontFittingSize, 0);
}

@end
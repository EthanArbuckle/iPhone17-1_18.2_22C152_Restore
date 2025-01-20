@interface FMBorderedField
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)isConfigured;
- (FMBorderedField)initWithCoder:(id)a3;
- (FMBorderedField)initWithFrame:(CGRect)a3;
- (FMHorizontalRule)bottomRule;
- (FMHorizontalRule)topRule;
- (UIColor)borderColor;
- (void)awakeFromNib;
- (void)commonSetup;
- (void)prepareForInterfaceBuilder;
- (void)setBorderColor:(id)a3;
- (void)setBottomRule:(id)a3;
- (void)setIsConfigured:(BOOL)a3;
- (void)setTopRule:(id)a3;
@end

@implementation FMBorderedField

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (FMBorderedField)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FMBorderedField;
  v3 = -[FMBorderedField initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(FMBorderedField *)v3 commonSetup];
  }
  return v4;
}

- (FMBorderedField)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FMBorderedField;
  v3 = [(FMBorderedField *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(FMBorderedField *)v3 commonSetup];
  }
  return v4;
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)FMBorderedField;
  [(FMBorderedField *)&v3 awakeFromNib];
  [(FMBorderedField *)self commonSetup];
}

- (void)prepareForInterfaceBuilder
{
  v3.receiver = self;
  v3.super_class = (Class)FMBorderedField;
  [(FMBorderedField *)&v3 prepareForInterfaceBuilder];
  [(FMBorderedField *)self commonSetup];
  [(FMBorderedField *)self setNeedsLayout];
}

- (void)commonSetup
{
  if (!self->_isConfigured)
  {
    [(FMBorderedField *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    v9 = -[FMRule initWithFrame:]([FMHorizontalRule alloc], "initWithFrame:", v3, v5, v7, 1.0);
    topRule = self->_topRule;
    self->_topRule = v9;

    v11 = -[FMRule initWithFrame:]([FMHorizontalRule alloc], "initWithFrame:", v4, v6, v8, 1.0);
    bottomRule = self->_bottomRule;
    self->_bottomRule = v11;

    [(FMHorizontalRule *)self->_topRule setTranslatesAutoresizingMaskIntoConstraints:0];
    [(FMHorizontalRule *)self->_bottomRule setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [MEMORY[0x263F1C550] clearColor];
    [(FMHorizontalRule *)self->_topRule setBackgroundColor:v13];

    v14 = [MEMORY[0x263F1C550] clearColor];
    [(FMHorizontalRule *)self->_bottomRule setBackgroundColor:v14];

    [(FMBorderedField *)self addSubview:self->_topRule];
    [(FMBorderedField *)self addSubview:self->_bottomRule];
    [(FMRule *)self->_topRule setLeading:1];
    v15 = [(FMHorizontalRule *)self->_topRule topAnchor];
    v16 = [(FMBorderedField *)self topAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    [v17 setActive:1];

    v18 = [(FMHorizontalRule *)self->_topRule leftAnchor];
    v19 = [(FMBorderedField *)self leftAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v20 setActive:1];

    v21 = [(FMHorizontalRule *)self->_topRule rightAnchor];
    v22 = [(FMBorderedField *)self rightAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [v23 setActive:1];

    v24 = [(FMHorizontalRule *)self->_topRule heightAnchor];
    v25 = [v24 constraintEqualToConstant:1.0];
    [v25 setActive:1];

    v26 = [(FMHorizontalRule *)self->_bottomRule bottomAnchor];
    v27 = [(FMBorderedField *)self bottomAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    [v28 setActive:1];

    v29 = [(FMHorizontalRule *)self->_bottomRule leftAnchor];
    v30 = [(FMBorderedField *)self leftAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    [v31 setActive:1];

    v32 = [(FMHorizontalRule *)self->_bottomRule rightAnchor];
    v33 = [(FMBorderedField *)self rightAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    [v34 setActive:1];

    v35 = [(FMHorizontalRule *)self->_bottomRule heightAnchor];
    v36 = [v35 constraintEqualToConstant:1.0];
    [v36 setActive:1];

    self->_isConfigured = 1;
  }
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
  id v5 = a3;
  double v6 = [(FMBorderedField *)self topRule];
  [v6 setColor:v5];

  id v7 = [(FMBorderedField *)self bottomRule];
  [v7 setColor:v5];
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (BOOL)isConfigured
{
  return self->_isConfigured;
}

- (void)setIsConfigured:(BOOL)a3
{
  self->_isConfigured = a3;
}

- (FMHorizontalRule)topRule
{
  return self->_topRule;
}

- (void)setTopRule:(id)a3
{
}

- (FMHorizontalRule)bottomRule
{
  return self->_bottomRule;
}

- (void)setBottomRule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomRule, 0);
  objc_storeStrong((id *)&self->_topRule, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end
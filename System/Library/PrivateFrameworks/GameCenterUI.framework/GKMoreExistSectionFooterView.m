@interface GKMoreExistSectionFooterView
+ (BOOL)requiresConstraintBasedLayout;
+ (double)defaultHeight;
- (GKLabel)label;
- (GKMoreExistSectionFooterView)initWithFrame:(CGRect)a3;
- (NSString)text;
- (void)setLabel:(id)a3;
- (void)setText:(id)a3;
@end

@implementation GKMoreExistSectionFooterView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (double)defaultHeight
{
  return 63.0;
}

- (GKMoreExistSectionFooterView)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)GKMoreExistSectionFooterView;
  v3 = -[GKMoreExistSectionFooterView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(GKMoreExistSectionFooterView *)v3 bounds];
    v9 = -[GKLabel initWithFrame:]([GKLabel alloc], "initWithFrame:", v5, v6, v7, v8);
    label = v4->_label;
    v4->_label = v9;

    [(GKLabel *)v4->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKLabel *)v4->_label setBackgroundColor:0];
    [(GKLabel *)v4->_label setOpaque:0];
    v11 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (v12 == 1)
    {
      if (*MEMORY[0x1E4F63830]) {
        BOOL v13 = *MEMORY[0x1E4F63A38] == 0;
      }
      else {
        BOOL v13 = 0;
      }
      uint64_t v14 = v13;
    }
    else
    {
      uint64_t v14 = 1;
    }
    [(GKLabel *)v4->_label setShouldInhibitReplay:v14];
    v15 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4->_label attribute:9 relatedBy:0 toItem:v4 attribute:9 multiplier:1.0 constant:0.0];
    v16 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4->_label attribute:10 relatedBy:0 toItem:v4 attribute:10 multiplier:1.0 constant:0.0];
    [(GKMoreExistSectionFooterView *)v4 addConstraint:v15];
    [(GKMoreExistSectionFooterView *)v4 addConstraint:v16];
    [(GKMoreExistSectionFooterView *)v4 addSubview:v4->_label];
  }
  return v4;
}

- (NSString)text
{
  v2 = [(GKLabel *)self->_label attributedText];
  v3 = [v2 string];

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F639F8];
  id v5 = a3;
  double v6 = [v4 textStyle];
  id v8 = [v6 tableFooterStyle];

  double v7 = [v5 _gkAttributedStringByApplyingStyle:v8];

  [(GKLabel *)self->_label setAttributedText:v7];
}

- (GKLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
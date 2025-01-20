@interface SiriAlternativeParaphraseReusableHeader
+ (double)defaultHeight;
+ (id)elementKind;
+ (id)reuseIdentifier;
- (SiriAlternativeParaphraseReusableHeader)initWithFrame:(CGRect)a3;
- (void)configureWithText:(id)a3 locale:(id)a4;
- (void)layoutSubviews;
@end

@implementation SiriAlternativeParaphraseReusableHeader

- (SiriAlternativeParaphraseReusableHeader)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SiriAlternativeParaphraseReusableHeader;
  v3 = -[SiriAlternativeParaphraseReusableHeader initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (SiriUISashView *)objc_msgSend(objc_alloc((Class)SiriUISashView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    sashView = v3->_sashView;
    v3->_sashView = v4;

    [(SiriAlternativeParaphraseReusableHeader *)v3 addSubview:v3->_sashView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SiriAlternativeParaphraseReusableHeader;
  [(SiriAlternativeParaphraseReusableHeader *)&v4 layoutSubviews];
  sashView = self->_sashView;
  [(SiriAlternativeParaphraseReusableHeader *)self bounds];
  -[SiriUISashView setFrame:](sashView, "setFrame:");
}

- (void)configureWithText:(id)a3 locale:(id)a4
{
  sashView = self->_sashView;
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)SiriUISashItem) initWithTitle:v7 image:0];

  [(SiriUISashView *)sashView setSashItem:v8 locale:v6];
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  objc_super v4 = [v3 stringByAppendingString:@"ReuseIdentifier"];

  return v4;
}

+ (double)defaultHeight
{
  return SiriUIPlatterStyle[3] + SiriUIPlatterStyle[0] * 2.0;
}

+ (id)elementKind
{
  return UICollectionElementKindSectionHeader;
}

- (void).cxx_destruct
{
}

@end
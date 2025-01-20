@interface GKSectionSeparatorView
+ (BOOL)requiresConstraintBasedLayout;
- (GKSectionSeparatorView)initWithFrame:(CGRect)a3;
- (UIView)underlineView;
- (void)setUnderlineView:(id)a3;
@end

@implementation GKSectionSeparatorView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (GKSectionSeparatorView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GKSectionSeparatorView;
  v3 = -[GKSectionSeparatorView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(GKHairlineView);
    underlineView = v3->_underlineView;
    v3->_underlineView = &v4->super;

    [(UIView *)v3->_underlineView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKSectionSeparatorView *)v3 addSubview:v3->_underlineView];
    v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_underlineView attribute:4 relatedBy:0 toItem:v3 attribute:4 multiplier:1.0 constant:0.0];
    [(GKSectionSeparatorView *)v3 addConstraint:v6];

    v7 = (void *)MEMORY[0x1E4F28DC8];
    v8 = _NSDictionaryOfVariableBindings(&cfstr_Underlineview.isa, v3->_underlineView, 0);
    v9 = [v7 constraintsWithVisualFormat:@"|-(15)-[_underlineView]|" options:0 metrics:0 views:v8];
    [(GKSectionSeparatorView *)v3 addConstraints:v9];
  }
  return v3;
}

- (UIView)underlineView
{
  return self->_underlineView;
}

- (void)setUnderlineView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
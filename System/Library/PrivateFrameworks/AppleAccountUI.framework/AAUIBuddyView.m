@interface AAUIBuddyView
+ (BOOL)requiresConstraintBasedLayout;
- (AAUIBuddyView)initWithCoder:(id)a3;
- (AAUIBuddyView)initWithFrame:(CGRect)a3;
- (UILayoutGuide)contentLayoutGuide;
@end

@implementation AAUIBuddyView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (AAUIBuddyView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIBuddyView;
  v3 = -[AAUIBuddyView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    _AAUIBuddyViewCommonInit(v3);
  }
  return v4;
}

- (AAUIBuddyView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIBuddyView;
  v3 = [(AAUIBuddyView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    _AAUIBuddyViewCommonInit(v3);
  }
  return v4;
}

- (UILayoutGuide)contentLayoutGuide
{
  return self->_contentLayoutGuide;
}

- (void).cxx_destruct
{
}

@end
@interface CNContactActionsContainerView
+ (Class)layerClass;
- (CNContactActionsContainerView)initWithArrangedSubviews:(id)a3;
@end

@implementation CNContactActionsContainerView

- (CNContactActionsContainerView)initWithArrangedSubviews:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactActionsContainerView;
  v3 = [(NUIContainerBoxView *)&v6 initWithArrangedSubviews:a3];
  v4 = v3;
  if (v3)
  {
    [(CNContactActionsContainerView *)v3 setLayoutMarginsRelativeArrangement:1];
    [(NUIContainerBoxView *)v4 setHorizontalAlignment:3];
    [(NUIContainerBoxView *)v4 setVerticalAlignment:3];
  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)[MEMORY[0x1E4FB1EB0] layerClass];
}

@end
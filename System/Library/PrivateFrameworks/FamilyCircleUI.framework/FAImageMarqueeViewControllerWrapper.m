@interface FAImageMarqueeViewControllerWrapper
- (FAImageMarqueeViewControllerWrapper)initWithFamilyCircle:(id)a3;
- (FAImageMarqueeViewControllerWrapper)initWithMembersToRender:(id)a3 familyCircle:(id)a4;
- (id)viewController;
@end

@implementation FAImageMarqueeViewControllerWrapper

- (FAImageMarqueeViewControllerWrapper)initWithFamilyCircle:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAImageMarqueeViewControllerWrapper;
  v5 = [(FAImageMarqueeViewControllerWrapper *)&v9 init];
  if (v5)
  {
    v6 = [[_TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl alloc] initWithFamilyCircle:v4];
    impl = v5->_impl;
    v5->_impl = v6;
  }
  return v5;
}

- (FAImageMarqueeViewControllerWrapper)initWithMembersToRender:(id)a3 familyCircle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FAImageMarqueeViewControllerWrapper;
  v8 = [(FAImageMarqueeViewControllerWrapper *)&v12 init];
  if (v8)
  {
    objc_super v9 = [[_TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl alloc] initWithMembersToRender:v6 familyCircle:v7];
    impl = v8->_impl;
    v8->_impl = v9;
  }
  return v8;
}

- (id)viewController
{
  return [(FAImageMarqueeViewWrapperImpl *)self->_impl viewController];
}

- (void).cxx_destruct
{
}

@end
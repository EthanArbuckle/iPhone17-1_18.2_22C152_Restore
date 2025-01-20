@interface AXCCShadowView
- (AXCCShadowView)initWithFrame:(CGRect)a3;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
@end

@implementation AXCCShadowView

- (AXCCShadowView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)AXCCShadowView;
  v3 = -[AXCCShadowView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v3;
  if (v3)
  {
    v8 = objc_msgSend_layer(v3, v4, v5, v6);
    objc_msgSend_setShadowPathIsBounds_(v8, v9, 1, v10);
  }
  return v7;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXCCShadowView;
  if ([(AXCCShadowView *)&v9 _shouldAnimatePropertyWithKey:v4]) {
    char hasPrefix = 1;
  }
  else {
    char hasPrefix = objc_msgSend_hasPrefix_(v4, v5, @"shadow", v6);
  }

  return hasPrefix;
}

@end
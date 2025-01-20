@interface UIView(CCUIAdditions_Private)
- (void)_controlCenterApplyPrimaryContentShadow;
@end

@implementation UIView(CCUIAdditions_Private)

- (void)_controlCenterApplyPrimaryContentShadow
{
  v2 = [a1 layer];
  id v3 = [MEMORY[0x1E4FB1618] blackColor];
  objc_msgSend(v2, "setShadowColor:", objc_msgSend(v3, "CGColor"));

  v4 = [a1 layer];
  LODWORD(v5) = 1045220557;
  [v4 setShadowOpacity:v5];

  v6 = [a1 layer];
  [v6 setShadowRadius:20.0];

  id v7 = [a1 layer];
  objc_msgSend(v7, "setShadowOffset:", 0.0, 2.0);
}

@end
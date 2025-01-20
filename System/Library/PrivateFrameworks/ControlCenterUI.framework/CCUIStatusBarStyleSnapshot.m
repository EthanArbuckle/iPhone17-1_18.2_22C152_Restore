@interface CCUIStatusBarStyleSnapshot
- (BOOL)isHidden;
- (CCUIStatusBarStyleSnapshot)initWithHidden:(BOOL)a3 hiddenPartIdentifier:(id)a4 leadingStyleRequest:(id)a5 trailingStyleRequest:(id)a6 overlayData:(id)a7 actionsByPartIdentifier:(id)a8 statusBarInsets:(UIEdgeInsets)a9 avoidanceFrame:(CGRect)a10;
- (CGRect)avoidanceFrame;
- (NSDictionary)actionsByPartIdentifier;
- (NSString)hiddenPartIdentifier;
- (UIEdgeInsets)statusBarInsets;
- (UIStatusBarStyleRequest)leadingStyleRequest;
- (UIStatusBarStyleRequest)trailingStyleRequest;
- (_UIStatusBarData)overlayData;
@end

@implementation CCUIStatusBarStyleSnapshot

- (CCUIStatusBarStyleSnapshot)initWithHidden:(BOOL)a3 hiddenPartIdentifier:(id)a4 leadingStyleRequest:(id)a5 trailingStyleRequest:(id)a6 overlayData:(id)a7 actionsByPartIdentifier:(id)a8 statusBarInsets:(UIEdgeInsets)a9 avoidanceFrame:(CGRect)a10
{
  CGFloat height = a10.size.height;
  CGFloat width = a10.size.width;
  CGFloat y = a10.origin.y;
  CGFloat x = a10.origin.x;
  CGFloat right = a9.right;
  CGFloat bottom = a9.bottom;
  CGFloat left = a9.left;
  CGFloat top = a9.top;
  id v25 = a4;
  id v26 = a5;
  id v27 = a6;
  id v28 = a7;
  id v29 = a8;
  v41.receiver = self;
  v41.super_class = (Class)CCUIStatusBarStyleSnapshot;
  v30 = [(CCUIStatusBarStyleSnapshot *)&v41 init];
  v31 = v30;
  if (v30)
  {
    v30->_hidden = a3;
    objc_storeStrong((id *)&v30->_hiddenPartIdentifier, a4);
    uint64_t v32 = [v26 copy];
    leadingStyleRequest = v31->_leadingStyleRequest;
    v31->_leadingStyleRequest = (UIStatusBarStyleRequest *)v32;

    uint64_t v34 = [v27 copy];
    trailingStyleRequest = v31->_trailingStyleRequest;
    v31->_trailingStyleRequest = (UIStatusBarStyleRequest *)v34;

    uint64_t v36 = [v28 copy];
    overlayData = v31->_overlayData;
    v31->_overlayData = (_UIStatusBarData *)v36;

    uint64_t v38 = [v29 copy];
    actionsByPartIdentifier = v31->_actionsByPartIdentifier;
    v31->_actionsByPartIdentifier = (NSDictionary *)v38;

    v31->_statusBarInsets.CGFloat top = top;
    v31->_statusBarInsets.CGFloat left = left;
    v31->_statusBarInsets.CGFloat bottom = bottom;
    v31->_statusBarInsets.CGFloat right = right;
    v31->_avoidanceFrame.origin.CGFloat x = x;
    v31->_avoidanceFrame.origin.CGFloat y = y;
    v31->_avoidanceFrame.size.CGFloat width = width;
    v31->_avoidanceFrame.size.CGFloat height = height;
  }

  return v31;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (NSString)hiddenPartIdentifier
{
  return self->_hiddenPartIdentifier;
}

- (CGRect)avoidanceFrame
{
  double x = self->_avoidanceFrame.origin.x;
  double y = self->_avoidanceFrame.origin.y;
  double width = self->_avoidanceFrame.size.width;
  double height = self->_avoidanceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIEdgeInsets)statusBarInsets
{
  double top = self->_statusBarInsets.top;
  double left = self->_statusBarInsets.left;
  double bottom = self->_statusBarInsets.bottom;
  double right = self->_statusBarInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIStatusBarStyleRequest)leadingStyleRequest
{
  return self->_leadingStyleRequest;
}

- (UIStatusBarStyleRequest)trailingStyleRequest
{
  return self->_trailingStyleRequest;
}

- (_UIStatusBarData)overlayData
{
  return self->_overlayData;
}

- (NSDictionary)actionsByPartIdentifier
{
  return self->_actionsByPartIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsByPartIdentifier, 0);
  objc_storeStrong((id *)&self->_overlayData, 0);
  objc_storeStrong((id *)&self->_trailingStyleRequest, 0);
  objc_storeStrong((id *)&self->_leadingStyleRequest, 0);

  objc_storeStrong((id *)&self->_hiddenPartIdentifier, 0);
}

@end
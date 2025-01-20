@interface UIView(MFPopoverPresentationSource)
- (void)mui_setAsSourceForPopoverPresentationController:()MFPopoverPresentationSource;
- (void)mui_setAsSourceWithExtendedRectForPopoverPresentationController:()MFPopoverPresentationSource;
- (void)mui_setAsTargetedSourceOnSceneConfiguration:()MFPopoverPresentationSource;
@end

@implementation UIView(MFPopoverPresentationSource)

- (void)mui_setAsSourceForPopoverPresentationController:()MFPopoverPresentationSource
{
  id v8 = a3;
  [v8 setSourceView:a1];
  [a1 bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGRectGetMidX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRectGetMidY(v11);
  UIRectCenteredAboutPoint();
  objc_msgSend(v8, "setSourceRect:");
}

- (void)mui_setAsSourceWithExtendedRectForPopoverPresentationController:()MFPopoverPresentationSource
{
  id v4 = a3;
  [v4 setSourceView:a1];
  [a1 bounds];
  CGRect v7 = CGRectInset(v6, -5.0, -5.0);
  objc_msgSend(v4, "setSourceRect:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
}

- (void)mui_setAsTargetedSourceOnSceneConfiguration:()MFPopoverPresentationSource
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1D48];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithView:a1];
  [v5 setPreview:v6];
}

@end
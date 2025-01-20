@interface AXSB_SBSpotlightMultiplexingViewController
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AXSB_SBSpotlightMultiplexingViewController

+ (id)safeCategoryTargetClassName
{
  return @"SBSpotlightMultiplexingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSpotlightMultiplexingViewController", @"viewWillAppear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSpotlightMultiplexingViewController", @"viewWillDisappear:", "v", "B", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXSB_SBSpotlightMultiplexingViewController;
  [(AXSB_SBSpotlightMultiplexingViewController *)&v4 viewWillAppear:a3];
  id v3 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  [v3 springBoardActionOccurred:14 withPayload:&unk_26DB203B8];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXSB_SBSpotlightMultiplexingViewController;
  [(AXSB_SBSpotlightMultiplexingViewController *)&v4 viewWillDisappear:a3];
  id v3 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  [v3 springBoardActionOccurred:14 withPayload:&unk_26DB203E0];
}

@end
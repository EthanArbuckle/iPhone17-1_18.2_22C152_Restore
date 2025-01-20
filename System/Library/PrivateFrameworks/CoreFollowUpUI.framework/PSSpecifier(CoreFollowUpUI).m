@interface PSSpecifier(CoreFollowUpUI)
- (void)fl_startSpinner;
- (void)fl_stopSpinner;
@end

@implementation PSSpecifier(CoreFollowUpUI)

- (void)fl_startSpinner
{
  id v2 = [a1 propertyForKey:*MEMORY[0x263F602B0]];
  v1 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
  [v1 startAnimating];
  [v2 setAccessoryView:v1];
}

- (void)fl_stopSpinner
{
  id v1 = [a1 propertyForKey:*MEMORY[0x263F602B0]];
  [v1 setAccessoryView:0];
}

@end
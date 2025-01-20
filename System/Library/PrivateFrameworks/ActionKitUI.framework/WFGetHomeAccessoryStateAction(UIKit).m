@interface WFGetHomeAccessoryStateAction(UIKit)
- (id)localizedFooter;
@end

@implementation WFGetHomeAccessoryStateAction(UIKit)

- (id)localizedFooter
{
  v0 = [MEMORY[0x263F86C08] sharedManager];
  v1 = WFFooterTextForHomeAction();

  return v1;
}

@end
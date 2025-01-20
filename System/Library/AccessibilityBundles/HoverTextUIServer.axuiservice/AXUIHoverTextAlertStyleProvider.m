@interface AXUIHoverTextAlertStyleProvider
- (CGSize)alertBackgroundSizeForType:(unint64_t)a3;
@end

@implementation AXUIHoverTextAlertStyleProvider

- (CGSize)alertBackgroundSizeForType:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXUIHoverTextAlertStyleProvider;
  [(AXUIHoverTextAlertStyleProvider *)&v6 alertBackgroundSizeForType:a3];
  double v5 = v4 * 1.5;
  result.height = v3;
  result.width = v5;
  return result;
}

@end
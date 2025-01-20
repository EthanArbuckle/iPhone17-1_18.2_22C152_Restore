@interface AXBuddySettingsLargeVCPushItem
- (Class)cellClass;
- (id)reuseIdentifier;
@end

@implementation AXBuddySettingsLargeVCPushItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (id)reuseIdentifier
{
  return @"LargeCellReuseIdentifier";
}

@end
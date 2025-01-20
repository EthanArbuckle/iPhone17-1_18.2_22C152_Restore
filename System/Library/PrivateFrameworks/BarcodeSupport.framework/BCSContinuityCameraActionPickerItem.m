@interface BCSContinuityCameraActionPickerItem
- (id)icon;
@end

@implementation BCSContinuityCameraActionPickerItem

- (id)icon
{
  id UIImageClass = getUIImageClass();
  return (id)[UIImageClass _systemImageNamed:@"appletv.fill"];
}

@end
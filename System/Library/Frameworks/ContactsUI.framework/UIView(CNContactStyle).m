@interface UIView(CNContactStyle)
- (id)_cnui_contactStyle;
@end

@implementation UIView(CNContactStyle)

- (id)_cnui_contactStyle
{
  return +[CNContactStyle currentStyle];
}

@end
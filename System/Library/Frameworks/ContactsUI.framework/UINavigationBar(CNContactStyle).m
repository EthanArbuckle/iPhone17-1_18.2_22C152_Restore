@interface UINavigationBar(CNContactStyle)
- (void)_cnui_applyContactStyle;
@end

@implementation UINavigationBar(CNContactStyle)

- (void)_cnui_applyContactStyle
{
  objc_msgSend(a1, "_cnui_contactStyle");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if ([v2 barStyle]) {
    objc_msgSend(a1, "setBarStyle:", objc_msgSend(v2, "barStyle"));
  }
  if ([v2 usesTranslucentBarStyle]) {
    objc_msgSend(a1, "setTranslucent:", objc_msgSend(v2, "usesTranslucentBarStyle"));
  }
}

@end
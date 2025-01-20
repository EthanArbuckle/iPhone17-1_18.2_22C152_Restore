@interface CKUIThemeNotification
- (id)entryFieldPlaceholderColor;
- (id)entryViewBackgroundColor;
@end

@implementation CKUIThemeNotification

- (id)entryFieldPlaceholderColor
{
  if (entryFieldPlaceholderColor_once_1919 != -1) {
    dispatch_once(&entryFieldPlaceholderColor_once_1919, &__block_literal_global_1921);
  }
  return 0;
}

- (id)entryViewBackgroundColor
{
  if (entryViewBackgroundColor_once_1923 != -1) {
    dispatch_once(&entryViewBackgroundColor_once_1923, &__block_literal_global_1925);
  }
  return 0;
}

@end
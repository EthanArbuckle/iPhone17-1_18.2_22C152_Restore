@interface UIResponder
- (uint64_t)_accessibilitySupportsRichTextEditing;
@end

@implementation UIResponder

- (uint64_t)_accessibilitySupportsRichTextEditing
{
  id v5 = a1;
  if (a1)
  {
    char v4 = 0;
    id location = (id)[v5 _accessibilityTextViewTextOperationResponder];
    char v2 = 0;
    if (objc_opt_respondsToSelector()) {
      char v2 = [location hasRichlyEditableSelection];
    }
    char v4 = v2 & 1;
    char v6 = v2 & 1;
    objc_storeStrong(&location, 0);
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

@end
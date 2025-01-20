@interface _CSSuggestionToken(_CSSuggestionToken_MailUI)
- (__CFString)tokenKindAccessibilityDescription;
@end

@implementation _CSSuggestionToken(_CSSuggestionToken_MailUI)

- (__CFString)tokenKindAccessibilityDescription
{
  unint64_t v1 = [a1 tokenKind];
  if (v1 > 0x2E) {
    return @"suggestion";
  }
  else {
    return off_1E6D11460[v1];
  }
}

@end
@interface NSMutableAttributedString(SetAsLinkSupport)
- (BOOL)setAsLink:()SetAsLinkSupport linkURL:;
@end

@implementation NSMutableAttributedString(SetAsLinkSupport)

- (BOOL)setAsLink:()SetAsLinkSupport linkURL:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 mutableString];
  uint64_t v9 = [v8 rangeOfString:v7];
  uint64_t v11 = v10;

  if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(a1, "addAttribute:value:range:", *MEMORY[0x1E4FB0720], v6, v9, v11);
  }

  return v9 != 0x7FFFFFFFFFFFFFFFLL;
}

@end
@interface NSAttributedString(CLKTextProvider)
- (id)_attributedStringWithForegroundColor:()CLKTextProvider;
- (id)_attributedStringWithOtherAttributesFromStyle:()CLKTextProvider;
@end

@implementation NSAttributedString(CLKTextProvider)

- (id)_attributedStringWithOtherAttributesFromStyle:()CLKTextProvider
{
  id v4 = a3;
  v5 = [v4 otherAttributes];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = (id)[a1 mutableCopy];
    v8 = [v4 otherAttributes];
    objc_msgSend(v7, "addAttributes:range:", v8, 0, objc_msgSend(v7, "length"));
  }
  else
  {
    id v7 = a1;
  }

  return v7;
}

- (id)_attributedStringWithForegroundColor:()CLKTextProvider
{
  if (a3)
  {
    id v4 = a3;
    v5 = (void *)[a1 mutableCopy];
    objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x263F82278], v4, 0, objc_msgSend(v5, "length"));

    id v6 = (id)[v5 copy];
  }
  else
  {
    id v6 = a1;
  }

  return v6;
}

@end
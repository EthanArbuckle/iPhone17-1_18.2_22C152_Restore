@interface NSAttributedString(DataDetectorsSupport)
- (id)dd_attributedStringByAppendingAttributedString:()DataDetectorsSupport;
- (id)dd_attributedSubstringFromRange:()DataDetectorsSupport;
@end

@implementation NSAttributedString(DataDetectorsSupport)

- (id)dd_attributedStringByAppendingAttributedString:()DataDetectorsSupport
{
  v4 = (void *)[a1 mutableCopy];
  objc_msgSend(v4, "dd_appendAttributedString:", a3);

  return v4;
}

- (id)dd_attributedSubstringFromRange:()DataDetectorsSupport
{
  v4 = objc_msgSend((id)objc_msgSend(a1, "attributedSubstringFromRange:"), "mutableCopy");
  objc_msgSend(v4, "dd_offsetResultsBy:", -a3);
  objc_msgSend(v4, "dd_chopResults");

  return v4;
}

@end
@interface NSMutableAttributedString(CLKTextProvider)
- (void)addAttributesPreservingOriginals:()CLKTextProvider range:;
@end

@implementation NSMutableAttributedString(CLKTextProvider)

- (void)addAttributesPreservingOriginals:()CLKTextProvider range:
{
  if (a3)
  {
    id v8 = a3;
    v9 = (void *)[a1 copy];
    objc_msgSend(a1, "addAttributes:range:", v8, a4, a5);

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __85__NSMutableAttributedString_CLKTextProvider__addAttributesPreservingOriginals_range___block_invoke;
    v10[3] = &unk_26440ED30;
    v10[4] = a1;
    objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", a4, a5, 0, v10);
  }
}

@end
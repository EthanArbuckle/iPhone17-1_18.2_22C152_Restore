@interface NSMutableAttributedString(ITK)
- (void)itk_appendAttributedSubstring:()ITK fromRange:;
- (void)itk_appendString:()ITK;
- (void)itk_replaceCharactersInRange:()ITK withAttributedSubstring:fromRange:;
@end

@implementation NSMutableAttributedString(ITK)

- (void)itk_appendString:()ITK
{
  v4 = (objc_class *)MEMORY[0x263F086A0];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithString:v5];

  [a1 appendAttributedString:v6];
}

- (void)itk_replaceCharactersInRange:()ITK withAttributedSubstring:fromRange:
{
  id v12 = a5;
  v13 = [v12 string];
  v14 = objc_msgSend(v13, "substringWithRange:", a6, a7);
  objc_msgSend(a1, "replaceCharactersInRange:withString:", a3, a4, v14);

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __97__NSMutableAttributedString_ITK__itk_replaceCharactersInRange_withAttributedSubstring_fromRange___block_invoke;
  v15[3] = &unk_26538CF58;
  v15[6] = a7;
  v15[7] = a3;
  v15[4] = a1;
  v15[5] = a6;
  objc_msgSend(v12, "enumerateAttributesInRange:options:usingBlock:", a6, a7, 0x100000, v15);
}

- (void)itk_appendAttributedSubstring:()ITK fromRange:
{
  id v8 = a3;
  objc_msgSend(a1, "itk_replaceCharactersInRange:withAttributedSubstring:fromRange:", objc_msgSend(a1, "length"), 0, v8, a4, a5);
}

@end
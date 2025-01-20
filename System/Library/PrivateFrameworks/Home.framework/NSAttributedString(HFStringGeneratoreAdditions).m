@interface NSAttributedString(HFStringGeneratoreAdditions)
- (id)_synthesizeAttributedSubstringFromRange:()HFStringGeneratoreAdditions usingDefaultAttributes:;
- (id)stringWithAttributes:()HFStringGeneratoreAdditions;
- (uint64_t)prefersDynamicString;
@end

@implementation NSAttributedString(HFStringGeneratoreAdditions)

- (id)stringWithAttributes:()HFStringGeneratoreAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_synthesizeAttributedSubstringFromRange:usingDefaultAttributes:", 0, objc_msgSend(a1, "length"), v4);

  return v5;
}

- (uint64_t)prefersDynamicString
{
  return 0;
}

- (id)_synthesizeAttributedSubstringFromRange:()HFStringGeneratoreAdditions usingDefaultAttributes:
{
  v8 = (objc_class *)MEMORY[0x263F089B8];
  id v9 = a5;
  id v10 = [v8 alloc];
  v11 = [a1 string];
  v12 = (void *)[v10 initWithString:v11 attributes:v9];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __114__NSAttributedString_HFStringGeneratoreAdditions___synthesizeAttributedSubstringFromRange_usingDefaultAttributes___block_invoke;
  v15[3] = &unk_2640962F0;
  id v13 = v12;
  id v16 = v13;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", a3, a4, 0, v15);

  return v13;
}

@end
@interface NSString
@end

@implementation NSString

void __66__NSString_ABVCardAdditions__abStringByStrippingControlCharacters__block_invoke()
{
  id v0 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B88], "controlCharacterSet"), "mutableCopy");
  [v0 invert];
  objc_msgSend(v0, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet"));
  objc_msgSend(v0, "addCharactersInRange:", 8205, 1);
  [v0 invert];
  abStringByStrippingControlCharacters___invalidChars = [v0 copy];
}

@end
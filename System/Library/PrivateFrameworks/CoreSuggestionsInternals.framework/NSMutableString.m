@interface NSMutableString
@end

@implementation NSMutableString

void __53__NSMutableString_EncodedWord__sg_decodeEncodedWords__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1CB79B230]();
  id v7 = 0;
  objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"=\\?(?:[^\\s()<>@,;:\"\\/\\[\\]?.=]+?)\\?(?:[^\\s()<>@,;:\"\\/\\[\\]?.=]+?)\\?(?:[^?\\s]+)\\?=",
    0,
  uint64_t v3 = &v7);
  id v4 = v7;
  if (v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"NSString+EncodedWord.m", 45, @"error creating encodedWordRegex: %@", v4 object file lineNumber description];
  }
  v5 = (void *)sg_decodeEncodedWords__pasExprOnceResult;
  sg_decodeEncodedWords__pasExprOnceResult = v3;
}

void __53__NSMutableString_EncodedWord__sg_decodeEncodedWords__block_invoke_2()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  v1 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v2 = [v1 invertedSet];
  uint64_t v3 = (void *)sg_decodeEncodedWords__pasExprOnceResult_12;
  sg_decodeEncodedWords__pasExprOnceResult_12 = v2;
}

@end
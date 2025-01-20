@interface NSFileManagerEnumeratorAtURL
@end

@implementation NSFileManagerEnumeratorAtURL

uint64_t ____NSFileManagerEnumeratorAtURL_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2 && !objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"NSURL"))
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"NSFilePath");
    [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  }
  v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v6();
}

@end
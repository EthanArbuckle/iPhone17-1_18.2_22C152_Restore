@interface NSString
@end

@implementation NSString

NSUInteger __79__NSString_CKUtilities____ck_rangeOfSequenceOfCharactersFromSet_options_range___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, NSUInteger *a4, unsigned char *a5)
{
  v8.location = objc_msgSend(*(id *)(a1 + 32), "rangeOfCharacterFromSet:options:range:", *(void *)(a1 + 40), *(void *)(a1 + 56), a2, a3);
  *a4 = v8.location;
  a4[1] = v10.length;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10.location = *(void *)(v9 + 32);
  if (v10.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8.length = v10.length;
    if (*(unsigned char *)(a1 + 64))
    {
      if (v10.length + v8.location == v10.location)
      {
        v10.length = *(void *)(v9 + 40);
LABEL_7:
        NSRange v10 = NSUnionRange(v10, v8);
        *(NSRange *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v10;
        return v10.location;
      }
    }
    else
    {
      v10.length = *(void *)(v9 + 40);
      if (v10.length + v10.location == v8.location) {
        goto LABEL_7;
      }
    }
    *a5 = 1;
    return v10.location;
  }
  *(_OWORD *)(v9 + 32) = *(_OWORD *)a4;
  return v10.location;
}

@end
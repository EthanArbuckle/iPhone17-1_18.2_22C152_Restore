@interface NSString
@end

@implementation NSString

BOOL __82__NSString_GKTextStyle___gkAttributedStringByApplyingStylesForTags_untaggedStyle___block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= *(void *)(a1 + 48);
}

BOOL __82__NSString_GKTextStyle___gkAttributedStringByApplyingStylesForTags_untaggedStyle___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(a1 + 40) + 8 * (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))++) = a2;
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) > 19;
}

BOOL __82__NSString_GKTextStyle___gkAttributedStringByApplyingStylesForTags_untaggedStyle___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  do
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    int64_t v8 = *(void *)(v7 + 24);
    if (v8 < 0 || (uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8), v10 = *(void *)(v9 + 192), v10 <= v8))
    {
      unsigned __int16 v12 = 0;
    }
    else
    {
      uint64_t v11 = *(void *)(v9 + 168);
      if (v11)
      {
        unsigned __int16 v12 = *(_WORD *)(v11 + 2 * (*(void *)(v9 + 184) + v8));
      }
      else
      {
        uint64_t v13 = *(void *)(v9 + 176);
        if (v13)
        {
          unsigned __int16 v12 = *(char *)(v13 + *(void *)(v9 + 184) + v8);
        }
        else
        {
          if (*(void *)(v9 + 208) <= v8 || (int64_t v14 = *(void *)(v9 + 200), v15 = *(void *)(v7 + 24), v14 > v8))
          {
            int64_t v16 = v8 - 4;
            if ((unint64_t)v8 < 4) {
              int64_t v16 = 0;
            }
            if (v16 + 64 < v10) {
              int64_t v10 = v16 + 64;
            }
            *(void *)(v9 + 200) = v16;
            *(void *)(v9 + 208) = v10;
            v18.location = *(void *)(v9 + 184) + v16;
            v18.length = v10 - v16;
            CFStringGetCharacters(*(CFStringRef *)(v9 + 160), v18, (UniChar *)(v9 + 32));
            int64_t v14 = *(void *)(v9 + 200);
            uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
            int64_t v15 = *(void *)(v7 + 24);
          }
          unsigned __int16 v12 = *(_WORD *)(v9 + 32 + 2 * (v8 - v14));
          int64_t v8 = v15;
        }
      }
    }
    *(void *)(v7 + 24) = v8 + 1;
  }
  while (a2 != v12 && !(*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))());
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v6, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + ~v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a2 == v12;
}

@end
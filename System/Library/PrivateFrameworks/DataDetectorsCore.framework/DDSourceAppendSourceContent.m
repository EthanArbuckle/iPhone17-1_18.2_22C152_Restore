@interface DDSourceAppendSourceContent
@end

@implementation DDSourceAppendSourceContent

void ___DDSourceAppendSourceContent_block_invoke(void *a1, const __CFString *a2, char *a3, uint64_t a4)
{
  DDLookupTrieInsertKeyWithExtra(*(unsigned int **)(a1[5] + 56), a2, a1[6], a3);
  if (a4)
  {
    if (a2)
    {
      uint64_t v7 = a1[4];
      if (v7)
      {
        v8 = *(void (**)(void))(v7 + 16);
        v8();
      }
    }
  }
}

void ___DDSourceAppendSourceContent_block_invoke_2(uint64_t a1, CFStringRef theString, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v7 = *(unsigned int **)(v6 + 64);
  if (!v7)
  {
    uint64_t v7 = (unsigned int *)malloc_type_calloc(1uLL, 0x38uLL, 0x1022040E9E2EC27uLL);
    *v7 |= 0x1000u;
    *((void *)v7 + 2) = 0;
    *((void *)v7 + 4) = 0;
    *(void *)(v6 + 64) = v7;
  }

  DDLookupTrieInsertKeyWithExtra(v7, theString, v5, a3);
}

@end
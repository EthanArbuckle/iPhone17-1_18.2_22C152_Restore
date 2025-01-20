@interface NSRunLoop
@end

@implementation NSRunLoop

uint64_t __41__NSRunLoop_NSRunLoop___portInvalidated___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(result + 32) == a2)
  {
    uint64_t v5 = result;
    objc_msgSend(*(id *)(result + 40), "addObject:");
    v6 = *(void **)(v5 + 48);
    return objc_msgSend(v6, "addIndexesInRange:", a4, 2);
  }
  return result;
}

uint64_t __46__NSRunLoop_NSRunLoop___containsPort_forMode___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (*(void *)(result + 32) == a2)
  {
    uint64_t v6 = result;
    result = objc_msgSend(*(id *)(result + 40), "isEqual:");
    if (result)
    {
      *(unsigned char *)(*(void *)(*(void *)(v6 + 48) + 8) + 24) = 1;
      *a5 = 1;
    }
  }
  return result;
}

uint64_t __44__NSRunLoop_NSRunLoop___removePort_forMode___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (*(void *)(result + 32) == a2)
  {
    uint64_t v7 = result;
    result = objc_msgSend(*(id *)(result + 40), "isEqual:");
    if (result)
    {
      uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 8);
      if (*(void *)(*(void *)(*(void *)(v7 + 48) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
      {
        *(unsigned char *)(v8 + 24) = 1;
        *(void *)(*(void *)(*(void *)(v7 + 48) + 8) + 24) = a4;
      }
      else
      {
        *(unsigned char *)(v8 + 24) = 0;
        *a5 = 1;
      }
    }
  }
  return result;
}

@end
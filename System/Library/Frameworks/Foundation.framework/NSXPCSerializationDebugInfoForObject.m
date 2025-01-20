@interface NSXPCSerializationDebugInfoForObject
@end

@implementation NSXPCSerializationDebugInfoForObject

uint64_t ___NSXPCSerializationDebugInfoForObject_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 48))
  {
    unint64_t v4 = 0;
    do
    {
      [*(id *)(a1 + 32) appendString:@" "];
      ++v4;
    }
    while (v4 < *(void *)(a1 + 48));
  }
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void *)(v6 + 24);
  *(void *)(v6 + 24) = v7 + 1;
  objc_msgSend(v5, "appendFormat:", @"%lld => ", v7);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", _NSXPCSerializationDebugInfoForObject(*(void *)(a1 + 56), a2, *(void *)(a1 + 64) + *(void *)(a1 + 48)));
  [*(id *)(a1 + 32) appendString:@"\n"];
  return 1;
}

uint64_t ___NSXPCSerializationDebugInfoForObject_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(void *)(a1 + 40))
  {
    unint64_t v6 = 0;
    do
    {
      [*(id *)(a1 + 32) appendString:@" "];
      ++v6;
    }
    while (v6 < *(void *)(a1 + 40));
  }
  if ((*((_DWORD *)a2 + 2) | 0x10) == 0x70)
  {
    uint64_t v7 = _NSXPCSerializationDebugInfoForObject(*(void *)(a1 + 48), a2, 0);
    v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 appendFormat:@"%@ => ", v7, v10];
    }
    else {
      objc_msgSend(v8, "appendFormat:", @"<bad dictionary key @%lld>", *a2, v10);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"<unexpected dictionary key type %d @%lld>", *((unsigned int *)a2 + 2), *a2);
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", _NSXPCSerializationDebugInfoForObject(*(void *)(a1 + 48), a3, *(void *)(a1 + 56) + *(void *)(a1 + 40)));
  [*(id *)(a1 + 32) appendString:@"\n"];
  return 1;
}

@end
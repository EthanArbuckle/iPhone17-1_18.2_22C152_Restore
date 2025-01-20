@interface NSXPCSerializationDebugSizeForObject
@end

@implementation NSXPCSerializationDebugSizeForObject

uint64_t ___NSXPCSerializationDebugSizeForObject_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += _NSXPCSerializationDebugSizeForObject(*(void *)(a1 + 40));
  return 1;
}

uint64_t ___NSXPCSerializationDebugSizeForObject_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = _NSXPCSerializationDebugSizeForObject(*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += _NSXPCSerializationDebugSizeForObject(v3);
  return 1;
}

@end
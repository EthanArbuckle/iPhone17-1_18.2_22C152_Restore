@interface NSData(ISMutableStoreIndex_HashTable_Internal)
- (uint64_t)_ISStoreIndex_setNodeRef:()ISMutableStoreIndex_HashTable_Internal forKey:;
@end

@implementation NSData(ISMutableStoreIndex_HashTable_Internal)

- (uint64_t)_ISStoreIndex_setNodeRef:()ISMutableStoreIndex_HashTable_Internal forKey:
{
  uint64_t v7 = objc_msgSend(a1, "_ISStoreIndex_hashTable");
  uint64_t result = objc_msgSend(a1, "_ISStoreIndex_hashTableHeader");
  if (result)
  {
    uint64_t v9 = result;
    uint64_t result = 0;
    if (v7)
    {
      unint64_t v10 = *(unsigned int *)(v9 + 12);
      if (v10)
      {
        *(void *)(v7 + 8 * (a4 % v10)) = a3;
        return 1;
      }
    }
  }
  return result;
}

@end
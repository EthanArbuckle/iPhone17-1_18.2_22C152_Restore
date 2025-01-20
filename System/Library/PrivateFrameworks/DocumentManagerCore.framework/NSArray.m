@interface NSArray
@end

@implementation NSArray

void __45__NSArray_DOCNode__fpfs_syncFPItemsFromNodes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3 == 0;
  id v4 = v3;
  if (v3 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

@end
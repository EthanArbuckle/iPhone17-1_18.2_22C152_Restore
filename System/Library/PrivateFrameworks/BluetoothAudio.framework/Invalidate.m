@interface Invalidate
@end

@implementation Invalidate

void __manager_Invalidate_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)v1)
  {
    *(unsigned char *)uint64_t v1 = 1;
    BluetoothEndpointCollectionDelete(*(CFMutableArrayRef **)(v1 + 32));
    *(void *)(*(void *)(a1 + 32) + 32) = 0;
  }
}

@end
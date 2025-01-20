@interface LSGetBRDisplayNameForContainerNode
@end

@implementation LSGetBRDisplayNameForContainerNode

void ___LSGetBRDisplayNameForContainerNode_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  CFStringRef v6 = a2;
  v10 = (__CFString *)v6;
  if (softLinkBRCopyDisplayNameForContainerAtURL) {
    uint64_t v7 = softLinkBRCopyDisplayNameForContainerAtURL(*(const __CFURL **)(a1 + 40), v6);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    *a4 = 1;
  }
}

@end
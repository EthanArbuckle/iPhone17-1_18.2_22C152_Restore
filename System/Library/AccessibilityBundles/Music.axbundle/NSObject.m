@interface NSObject
@end

@implementation NSObject

void __78__NSObject_AXPrivResponse__accessibilityIsSeekEnabledInDirection_forResponse___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  [MEMORY[0x263F8C6D0] _accessibilitySkipIntervalInDirection:a1[7] forResponse:a1[5]];
  v3 = objc_msgSend(v2, "jumpByInterval:");
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v3 != 0;
}

@end
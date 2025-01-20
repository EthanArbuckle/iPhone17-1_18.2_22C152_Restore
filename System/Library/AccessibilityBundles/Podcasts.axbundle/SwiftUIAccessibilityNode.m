@interface SwiftUIAccessibilityNode
@end

@implementation SwiftUIAccessibilityNode

uint64_t __96__SwiftUIAccessibilityNode__Podcasts__SwiftUI__accessibilityHitTestShouldFallbackToNearestChild__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) accessibilityCustomAttribute:@"AXHitTestShouldFallbackToNearestChild"];

  return MEMORY[0x270F9A758]();
}

@end
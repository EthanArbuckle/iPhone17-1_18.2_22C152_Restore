@interface AccessibilityNodeAccessibility
@end

@implementation AccessibilityNodeAccessibility

uint64_t __92__AccessibilityNodeAccessibility__LiveTranscriptionUI__SwiftUI__accessibilityExpandedStatus__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) accessibilityCustomAttribute:@"AXExpanded"];

  return MEMORY[0x270F9A758]();
}

@end
@interface PSTableCellAccessibility
@end

@implementation PSTableCellAccessibility

uint64_t __76__PSTableCellAccessibility__ScreenTimeUI__Preferences_accessibilityActivate__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) sendActionsForControlEvents:64];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void __76__PSTableCellAccessibility__ScreenTimeUI__Preferences_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) handler];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __76__PSTableCellAccessibility__ScreenTimeUI__Preferences_accessibilityActivate__block_invoke_3;
  v5[3] = &unk_26514C2F8;
  v5[4] = *(void *)(a1 + 48);
  ((void (**)(void, uint64_t, uint64_t, void *))v2)[2](v2, v3, v4, v5);
}

uint64_t __76__PSTableCellAccessibility__ScreenTimeUI__Preferences_accessibilityActivate__block_invoke_3(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

@end
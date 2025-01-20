@interface GCLogitechRacingWheel
@end

@implementation GCLogitechRacingWheel

void __47___GCLogitechRacingWheel_observeGamepadEvents___block_invoke(uint64_t a1, const char *a2)
{
  while (1)
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, a2, 144, 1);
    }
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = Property;
    v6 = (void *)MEMORY[0x223C6E420](v4);
    int v7 = [v5 containsObject:v6];

    if (!v7) {
      break;
    }
    id v9 = *(id *)(a1 + 32);
    if (v9) {
      id v9 = objc_getProperty(v9, v8, 144, 1);
    }
    v10 = (void *)[v9 mutableCopy];
    v11 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
    [v10 removeObject:v11];

    v13 = *(void **)(a1 + 32);
    if (v13) {
      objc_setProperty_atomic_copy(v13, v12, v10, 144);
    }
  }
}

@end
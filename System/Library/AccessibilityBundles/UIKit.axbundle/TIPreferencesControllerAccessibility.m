@interface TIPreferencesControllerAccessibility
@end

@implementation TIPreferencesControllerAccessibility

void __62__TIPreferencesControllerAccessibility__UIKit__TextInput_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[TIPreferencesControllerAccessibility__UIKit__TextInput _accessibilitySetMouseKeysEnabled:]((uint64_t)WeakRetained, 0);
}

@end
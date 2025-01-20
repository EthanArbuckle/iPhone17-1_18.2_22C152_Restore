@interface BKSKeyboardDefaults
- (BKSKeyboardDefaults)init;
- (void)_bindAndRegisterDefaults;
- (void)migrateIfNeeded;
@end

@implementation BKSKeyboardDefaults

- (void)migrateIfNeeded
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(BKSKeyboardDefaults *)self oldModifierKeyRemapping];
  v4 = BKLogKeyboard();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = [MEMORY[0x1E4F4F720] descriptionForRootObject:v3];
      int v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_18AA0B000, v4, OS_LOG_TYPE_DEFAULT, "migrating key modifiers %{public}@", (uint8_t *)&v8, 0xCu);
    }
    v7 = (void *)[v3 copy];
    [(BKSKeyboardDefaults *)self setModifierKeyRemapping:v7];

    [(BKSKeyboardDefaults *)self setOldModifierKeyRemapping:0];
  }
  else
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_18AA0B000, v4, OS_LOG_TYPE_DEFAULT, "nothing to migrate", (uint8_t *)&v8, 2u);
    }
  }
}

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"oldModifierKeyRemapping"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"com.apple.keyboard.modifierKeysRemapping" toDefaultValue:0 options:1];

  id v4 = [NSString stringWithUTF8String:"modifierKeyRemapping"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"ModifierKeysRemapping" toDefaultValue:0 options:1];
}

- (BKSKeyboardDefaults)init
{
  return (BKSKeyboardDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.keyboard.preferences"];
}

@end
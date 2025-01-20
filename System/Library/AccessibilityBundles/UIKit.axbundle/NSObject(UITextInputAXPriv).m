@interface NSObject(UITextInputAXPriv)
- (uint64_t)__accessibilityRespondsToTextInput;
@end

@implementation NSObject(UITextInputAXPriv)

- (uint64_t)__accessibilityRespondsToTextInput
{
  id v5 = a1;
  v4[1] = a2;
  if (objc_opt_respondsToSelector())
  {
    if ((_UIApplicationIsWebKitLoaded() & 1) == 0) {
      goto LABEL_8;
    }
    v8 = (dispatch_once_t *)&__accessibilityRespondsToTextInput_onceToken;
    id location = 0;
    objc_storeStrong(&location, &__block_literal_global_48);
    if (*v8 != -1) {
      dispatch_once(v8, location);
    }
    objc_storeStrong(&location, 0);
    if (objc_opt_isKindOfClass())
    {
      char v6 = 0;
    }
    else
    {
LABEL_8:
      v4[0] = (id)[v5 _accessibilityValueForKey:@"AXRespondsToTextInput"];
      if (v4[0])
      {
        char v6 = [v4[0] BOOLValue] & 1;
      }
      else
      {
        unsigned __int8 v3 = [v5 conformsToProtocol:&unk_26F4BCAA8] & 1;
        [v5 _accessibilitySetBoolValue:v3 forKey:@"AXRespondsToTextInput"];
        char v6 = v3 & 1;
      }
      objc_storeStrong(v4, 0);
    }
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

@end
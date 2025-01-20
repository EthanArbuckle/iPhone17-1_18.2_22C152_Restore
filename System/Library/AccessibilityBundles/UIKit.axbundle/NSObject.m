@interface NSObject
- (uint64_t)__accessibilityRespondsToKeyInput;
- (void)_accessibilitySetTextSelection:(uint64_t)a3;
@end

@implementation NSObject

- (uint64_t)__accessibilityRespondsToKeyInput
{
  id v4 = a1;
  if (a1)
  {
    if (objc_opt_respondsToSelector())
    {
      id location = (id)[v4 _accessibilityValueForKey:@"AXRespondsToKeyInput"];
      if (location)
      {
        char v5 = [location BOOLValue] & 1;
      }
      else
      {
        unsigned __int8 v2 = [v4 conformsToProtocol:&unk_26F4B1658] & 1;
        [v4 _accessibilitySetBoolValue:v2 forKey:@"AXRespondsToKeyInput"];
        char v5 = v2 & 1;
      }
      objc_storeStrong(&location, 0);
    }
    else
    {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (void)_accessibilitySetTextSelection:(uint64_t)a3
{
  uint64_t v10 = a2;
  uint64_t v11 = a3;
  id v9 = a1;
  if (a1)
  {
    if (([v9 conformsToProtocol:&unk_26F4BCAA8] & 1) == 0) {
      _AXAssert();
    }
    if ([v9 conformsToProtocol:&unk_26F4BCAA8])
    {
      id v8 = v9;
      id v7 = (id)[v8 safeValueForKey:@"beginningOfDocument"];
      id v6 = (id)[v8 positionFromPosition:v7 offset:v10];
      id v5 = (id)[v8 positionFromPosition:v6 offset:v11];
      if (v6 && v5)
      {
        char v4 = 0;
        if (AXIsDictationListening())
        {
          AXHandleUserInteractionForDictation(1);
          char v4 = 1;
        }
        id location = (id)[v8 textRangeFromPosition:v6 toPosition:v5];
        [v8 setSelectedTextRange:location];
        if (v4) {
          AXHandleUserInteractionForDictation(0);
        }
        objc_storeStrong(&location, 0);
      }
      objc_storeStrong(&v5, 0);
      objc_storeStrong(&v6, 0);
      objc_storeStrong(&v7, 0);
      objc_storeStrong(&v8, 0);
    }
  }
}

Class __65__NSObject_UITextInputAXPriv____accessibilityRespondsToTextInput__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Uiwebbrowservi.isa);
  __accessibilityRespondsToTextInput_WebBrowserView = (uint64_t)result;
  return result;
}

@end
id AXMapsAssistantUILocString(void *a1)
{
  id v1;
  void *v2;
  uint64_t vars8;

  v1 = a1;
  if (AXMapsAssistantUILocString_onceToken != -1) {
    dispatch_once(&AXMapsAssistantUILocString_onceToken, &__block_literal_global);
  }
  if (AXMapsAssistantUILocString_bundle)
  {
    v2 = [(id)AXMapsAssistantUILocString_bundle localizedStringForKey:v1 value:&stru_26F756018 table:@"Accessibility-MapsAssistantUI"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t __AXMapsAssistantUILocString_block_invoke()
{
  AXMapsAssistantUILocString_bundle = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.Maps-Assistant.axbundle"];

  return MEMORY[0x270F9A758]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x270F80AF8]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F0A418]();
}

void abort(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}
uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F09440]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x270F05F48]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}
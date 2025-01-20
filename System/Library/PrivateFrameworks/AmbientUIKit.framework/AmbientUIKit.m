double AMUIRedModeAnimationDuration()
{
  return 1.2;
}

uint64_t AMUIRedModeAnimationCurve()
{
  return 0;
}

id AMUIRedModeAnimationSettings()
{
  v0 = (void *)MEMORY[0x263F29BC8];
  v1 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  v2 = [v0 settingsWithDuration:v1 timingFunction:1.2];

  return v2;
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}
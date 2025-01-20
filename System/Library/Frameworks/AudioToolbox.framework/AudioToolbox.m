uint64_t VibeSynthEngineHasHardwareSupport(PlatformUtilities_iOS *a1)
{
  return PlatformUtilities_iOS::ProductSupportsClosedLoopHaptics(a1);
}

uint64_t VibeSynthEngineInitialize()
{
  return MEMORY[0x270EE2420]();
}

uint64_t VibeSynthEngineStartPrewarm()
{
  return MEMORY[0x270EE2430]();
}

uint64_t VibeSynthEnginePlay()
{
  return MEMORY[0x270EE2428]();
}

uint64_t VibeSynthEngineCancelWithOptions()
{
  return MEMORY[0x270EE2418]();
}

uint64_t VibeSynthEngineStopPrewarm()
{
  return MEMORY[0x270EE2438]();
}
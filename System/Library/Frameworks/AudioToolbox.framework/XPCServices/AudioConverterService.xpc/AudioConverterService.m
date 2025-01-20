int main(int argc, const char **argv, const char **envp)
{
  _CFPrefsSetDirectModeEnabled();
  _CFPrefsSetReadOnly();
  AudioConverterServiceRun();
  return 0;
}

uint64_t _CFPrefsSetDirectModeEnabled()
{
  return __CFPrefsSetDirectModeEnabled();
}

uint64_t _CFPrefsSetReadOnly()
{
  return __CFPrefsSetReadOnly();
}

uint64_t AudioConverterServiceRun(void)
{
  return AudioConverterServiceRun();
}
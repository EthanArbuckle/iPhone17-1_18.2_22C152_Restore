void ADClientAddValueForScalarKey()
{
  if (ADClientReportRemoval_onceToken != -1) {
    dispatch_once(&ADClientReportRemoval_onceToken, &__block_literal_global);
  }
}

void ADClientPushValueForDistributionKey()
{
  if (ADClientReportRemoval_onceToken != -1) {
    dispatch_once(&ADClientReportRemoval_onceToken, &__block_literal_global);
  }
}

void ADClientBatchKeys()
{
  if (ADClientReportRemoval_onceToken != -1) {
    dispatch_once(&ADClientReportRemoval_onceToken, &__block_literal_global);
  }
}

void __ADClientReportRemoval_block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_18AA09000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AggregateDictionary is deprecated and has been removed. Please migrate to Core Analytics.", v0, 2u);
  }
}

void ADClientSetValueForScalarKey()
{
  if (ADClientReportRemoval_onceToken != -1) {
    dispatch_once(&ADClientReportRemoval_onceToken, &__block_literal_global);
  }
}

double ADPushTimeIntervalForDistributionKeySinceStartTime(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = mach_absolute_time();
  double v4 = *(double *)&__timeIntervalBetweenMonotonicTimes___timebaseFactor;
  if (*(double *)&__timeIntervalBetweenMonotonicTimes___timebaseFactor == 0.0)
  {
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    LODWORD(v6) = info.denom;
    LODWORD(v5) = info.numer;
    double v4 = (double)v5 / (double)v6 * 0.000000001;
    *(double *)&__timeIntervalBetweenMonotonicTimes___timebaseFactor = v4;
  }
  if (ADClientReportRemoval_onceToken != -1) {
    dispatch_once(&ADClientReportRemoval_onceToken, &__block_literal_global);
  }
  return v4 * (double)(v3 - a2);
}

time_t ADDaysSince1970()
{
  time_t result = time(0);
  if (result >= 0) {
    return (result / 0x15180uLL);
  }
  else {
    return result;
  }
}

uint64_t ADClientIsEnabled()
{
  if (ADClientReportRemoval_onceToken != -1) {
    dispatch_once(&ADClientReportRemoval_onceToken, &__block_literal_global);
  }
  return 0;
}

uint64_t ADClientCommit()
{
  if (ADClientReportRemoval_onceToken != -1) {
    dispatch_once(&ADClientReportRemoval_onceToken, &__block_literal_global);
  }
  return 0;
}

uint64_t ADClientCheckpoint()
{
  if (ADClientReportRemoval_onceToken != -1) {
    dispatch_once(&ADClientReportRemoval_onceToken, &__block_literal_global);
  }
  return 0;
}

void ADClientSignificantTimeChanged()
{
  if (ADClientReportRemoval_onceToken != -1) {
    dispatch_once(&ADClientReportRemoval_onceToken, &__block_literal_global);
  }
}

void ADClientClearScalarKey()
{
  if (ADClientReportRemoval_onceToken != -1) {
    dispatch_once(&ADClientReportRemoval_onceToken, &__block_literal_global);
  }
}

void ADClientClearDistributionKey()
{
  if (ADClientReportRemoval_onceToken != -1) {
    dispatch_once(&ADClientReportRemoval_onceToken, &__block_literal_global);
  }
}

void ADClientSetValueForDistributionKey()
{
  if (ADClientReportRemoval_onceToken != -1) {
    dispatch_once(&ADClientReportRemoval_onceToken, &__block_literal_global);
  }
}

double ADPushTimeIntervalForDistributionKeyTimingBlock(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = mach_absolute_time();
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);

  return ADPushTimeIntervalForDistributionKeySinceStartTime(v4, v3);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}
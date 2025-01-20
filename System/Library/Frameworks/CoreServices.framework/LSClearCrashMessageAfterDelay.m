@interface LSClearCrashMessageAfterDelay
@end

@implementation LSClearCrashMessageAfterDelay

void ___LSClearCrashMessageAfterDelay_block_invoke()
{
  uint64_t v0 = _LSSetCrashReporterMessage_messagePtr;
  uint64_t v1 = _LSSetCrashReporterMessage_messagePtr;
  atomic_compare_exchange_strong_explicit(&_LSSetCrashReporterMessage_messagePtr, (unint64_t *)&v1, 0, memory_order_relaxed, memory_order_relaxed);
  if (v1 == v0) {
    v2 = (void *)v0;
  }
  else {
    v2 = 0;
  }
  free(v2);
  qword_1EB20D5F0 = _LSSetCrashReporterMessage_messagePtr;
}

@end
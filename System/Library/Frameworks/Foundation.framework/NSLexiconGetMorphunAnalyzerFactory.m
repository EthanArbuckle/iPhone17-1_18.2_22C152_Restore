@interface NSLexiconGetMorphunAnalyzerFactory
@end

@implementation NSLexiconGetMorphunAnalyzerFactory

void ___NSLexiconGetMorphunAnalyzerFactory_block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  qword_1EB1ED570 = off_1EB1ED538(33, &cf);
  if (qword_1EB1ED570) {
    BOOL v0 = 1;
  }
  else {
    BOOL v0 = cf == 0;
  }
  if (!v0)
  {
    if (_NSInflectionLog_onceToken != -1) {
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    }
    v1 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFTypeRef v4 = cf;
      _os_log_error_impl(&dword_181795000, v1, OS_LOG_TYPE_ERROR, "Cannot initialize analyzer factory: %{public}@", buf, 0xCu);
    }
    CFRelease(cf);
  }
}

@end
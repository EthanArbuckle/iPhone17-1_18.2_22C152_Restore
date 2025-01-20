@interface LSDefaultsInXCTestRigInsecure
@end

@implementation LSDefaultsInXCTestRigInsecure

void ___LSDefaultsInXCTestRigInsecure_block_invoke()
{
  if (_LSDefaultsIsAppleInternal_once != -1) {
    dispatch_once(&_LSDefaultsIsAppleInternal_once, &__block_literal_global_469);
  }
  char v0 = _LSDefaultsIsAppleInternal_appleInternal;
  if (_LSDefaultsIsAppleInternal_appleInternal)
  {
    v1 = getprogname();
    char v0 = strcasecmp(v1, "xctest") == 0;
  }
  _LSDefaultsInXCTestRigInsecure_inXCTestRigInsecure = v0;
}

@end
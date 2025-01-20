@interface LSIsCurrentProcessSandboxed
@end

@implementation LSIsCurrentProcessSandboxed

void ___LSIsCurrentProcessSandboxed_block_invoke()
{
  if (_LSGetAuditTokenForSelf::once != -1) {
    dispatch_once(&_LSGetAuditTokenForSelf::once, &__block_literal_global_183);
  }
  uint64_t v0 = _LSGetAuditTokenForSelf::result;

  _LSIsAuditTokenSandboxed(v0, &_LSIsCurrentProcessSandboxed::sSandbox, (BOOL *)&_LSIsCurrentProcessSandboxed::sAppSandbox);
}

@end
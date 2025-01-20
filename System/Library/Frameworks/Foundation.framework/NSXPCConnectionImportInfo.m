@interface NSXPCConnectionImportInfo
@end

@implementation NSXPCConnectionImportInfo

void *__62___NSXPCConnectionImportInfo__valueForEntitlement_auditToken___block_invoke()
{
  result = dlopen("/System/Library/Frameworks/Security.framework/Security", 256);
  if (result)
  {
    v1 = result;
    _MergedGlobals_157 = (uint64_t (*)(void, void))dlsym(result, "SecTaskCreateWithAuditToken");
    result = dlsym(v1, "SecTaskCopyValueForEntitlement");
    off_1EB1EDF50 = (uint64_t (*)(void, void, void))result;
  }
  return result;
}

@end
@interface _BEUtil
+ (const)auditTokenForCurrentProcess;
@end

@implementation _BEUtil

+ (const)auditTokenForCurrentProcess
{
  if (auditTokenForCurrentProcess_onceToken[0] != -1) {
    dispatch_once(auditTokenForCurrentProcess_onceToken, &__block_literal_global);
  }
  return (const $115C4C562B26FF47E01F9F4EA65B5887 *)&auditTokenForCurrentProcess_currentAuditToken;
}

@end
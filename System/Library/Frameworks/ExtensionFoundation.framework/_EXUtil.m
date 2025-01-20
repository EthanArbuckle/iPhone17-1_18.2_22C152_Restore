@interface _EXUtil
+ (const)auditTokenForCurrentProcess;
+ (void)queryControllerDelegate:(id)a3 didUpdateController:(id)a4;
@end

@implementation _EXUtil

+ (const)auditTokenForCurrentProcess
{
  if (auditTokenForCurrentProcess_onceToken != -1) {
    dispatch_once(&auditTokenForCurrentProcess_onceToken, &__block_literal_global_10);
  }
  return (const $115C4C562B26FF47E01F9F4EA65B5887 *)&auditTokenForCurrentProcess_currentAuditToken;
}

+ (void)queryControllerDelegate:(id)a3 didUpdateController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v9 = v5;
  if (objc_opt_respondsToSelector())
  {
    v7 = objc_opt_new();
    [v9 queryControllerDidUpdate:v6 resultDifference:v7];
  }
  if (objc_opt_respondsToSelector())
  {
    v8 = objc_opt_new();
    [v9 queryControllerDidUpdate:v6 difference:v8];
  }
}

@end
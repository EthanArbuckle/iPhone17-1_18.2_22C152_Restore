@interface AAUIServerHookHandlerDelegate
- (BOOL)serverHookHandler:(id)a3 isUserCancelError:(id)a4;
@end

@implementation AAUIServerHookHandlerDelegate

- (BOOL)serverHookHandler:(id)a3 isUserCancelError:(id)a4
{
  id v4 = a4;
  if ((objc_msgSend(v4, "aa_isAAErrorWithCode:", -1) & 1) != 0
    || (objc_msgSend(v4, "ak_isUserCancelError") & 1) != 0
    || (objc_msgSend(v4, "cdp_isCDPErrorWithCode:", -5307) & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = objc_msgSend(v4, "ak_isLAUserCancelError");
  }

  return v5;
}

@end
@interface MFMailSignatureController
- (BOOL)hasCustomSigntureForSender:(id)a3;
- (BOOL)isDefaultSignatureForSender:(id)a3;
- (id)_getSignatureStringForSender:(id)a3;
- (id)_signatureStringForSender:(id)a3;
- (void)addSignatureForSender:(id)a3 bodyField:(id)a4 prepend:(BOOL)a5;
- (void)finalizeSignatureForBodyField:(id)a3 completionHandler:(id)a4;
- (void)removeSignatureForSender:(id)a3 bodyField:(id)a4;
- (void)updateSignatureForSender:(id)a3 bodyField:(id)a4;
@end

@implementation MFMailSignatureController

- (id)_signatureStringForSender:(id)a3
{
  id v3 = a3;
  if (MFIsMobileMail())
  {
    v4 = [MEMORY[0x1E4F77C50] sharedInstance];
    v5 = [v4 signatureForSendingEmailAddress:v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F73B40] customSignatureForSendingEmailAddress:v3];
  }

  return v5;
}

- (BOOL)isDefaultSignatureForSender:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F77C50] sharedInstance];
  v6 = [v5 defaultSignature];

  v7 = [(MFMailSignatureController *)self _signatureStringForSender:v4];
  LOBYTE(v5) = [v7 isEqualToString:v6];

  return (char)v5;
}

- (void)addSignatureForSender:(id)a3 bodyField:(id)a4 prepend:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  v8 = [a4 signatureControllerProxy];
  v9 = [(MFMailSignatureController *)self _getSignatureStringForSender:v10];
  [v8 addSignature:v9 prepend:v5];
}

- (void)removeSignatureForSender:(id)a3 bodyField:(id)a4
{
  objc_msgSend(a4, "signatureControllerProxy", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 removeSignature];
}

- (void)updateSignatureForSender:(id)a3 bodyField:(id)a4
{
  id v8 = a3;
  v6 = [a4 signatureControllerProxy];
  v7 = [(MFMailSignatureController *)self _getSignatureStringForSender:v8];
  [v6 updateSignature:v7];
}

- (void)finalizeSignatureForBodyField:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  BOOL v5 = [a3 signatureControllerProxy];
  [v5 finalizeSignature:v6];
}

- (id)_getSignatureStringForSender:(id)a3
{
  id v3 = [(MFMailSignatureController *)self _signatureStringForSender:a3];
  id v4 = objc_msgSend(NSString, "ef_emptyStringIfNil:", v3);

  return v4;
}

- (BOOL)hasCustomSigntureForSender:(id)a3
{
  id v3 = [(MFMailSignatureController *)self _signatureStringForSender:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F77C50] sharedInstance];
    BOOL v5 = [v4 defaultSignature];

    int v6 = [v3 isEqualToString:v5] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

@end
@interface AKGrandSlamResponseHandler
- (AKAuthenticatedServerRequest)context;
- (AKGrandSlamResponseHandler)initWithContext:(id)a3;
- (void)_handleInvalidMasterTokenWithSubErrorCode:(int64_t)a3;
- (void)_revokeDeviceTrust;
- (void)handleResponseError:(id)a3;
- (void)setContext:(id)a3;
@end

@implementation AKGrandSlamResponseHandler

- (AKGrandSlamResponseHandler)initWithContext:(id)a3
{
  id v5 = a3;
  v6 = [(AKGrandSlamResponseHandler *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (void)handleResponseError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v10 = [v5 objectForKeyedSubscript:AKErrorStatusCodeKey];

  v6 = [v4 userInfo];
  v7 = [v6 objectForKeyedSubscript:AKSubErrorStatusCodeKey];

  v8 = [v4 domain];

  if (v8 != (void *)AKAppleIDAuthenticationErrorDomain || v10 == 0)
  {
  }
  else
  {

    if (v7 && [v10 integerValue] == (id)-22411) {
      -[AKGrandSlamResponseHandler _handleInvalidMasterTokenWithSubErrorCode:](self, "_handleInvalidMasterTokenWithSubErrorCode:", [v7 integerValue]);
    }
  }
}

- (void)_handleInvalidMasterTokenWithSubErrorCode:(int64_t)a3
{
  if (a3 == -22423 || a3 == -42333) {
    [(AKGrandSlamResponseHandler *)self _revokeDeviceTrust];
  }
}

- (void)_revokeDeviceTrust
{
  id v6 = +[AKAccountManager sharedInstance];
  v3 = [(AKGrandSlamResponseHandler *)self context];
  id v4 = [v3 altDSID];
  id v5 = [v6 authKitAccountWithAltDSID:v4 error:0];

  if (v5)
  {
    [v6 setDeviceRemovalReason:0 onAccount:v5];
    [v6 saveAccount:v5 error:0];
  }
}

- (AKAuthenticatedServerRequest)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
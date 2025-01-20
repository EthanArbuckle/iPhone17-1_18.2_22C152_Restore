@interface AKCATiburonRequestReporter
- (AKCATiburonRequestReporter)initWithRequestContext:(id)a3;
- (void)didCompleteWithAuthorization:(id)a3 error:(id)a4;
@end

@implementation AKCATiburonRequestReporter

- (AKCATiburonRequestReporter)initWithRequestContext:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)AKCATiburonRequestReporter;
  v5 = [(AKCAReporter *)&v24 initWithEvent:@"com.apple.AuthKit.TiburonRequest"];
  if (v5)
  {
    v6 = [v4 requestIdentifier];
    v7 = [v6 UUIDString];
    [(AKCAReporter *)v5 setObject:v7 forKeyedSubscript:@"requestID"];

    v8 = [v4 authorizationRequest];
    if (v8) {
      v9 = &__kCFBooleanTrue;
    }
    else {
      v9 = &__kCFBooleanFalse;
    }
    [(AKCAReporter *)v5 setObject:v9 forKeyedSubscript:@"includesAuthorizationRequest"];

    v10 = [v4 passwordRequest];
    if (v10) {
      v11 = &__kCFBooleanTrue;
    }
    else {
      v11 = &__kCFBooleanFalse;
    }
    [(AKCAReporter *)v5 setObject:v11 forKeyedSubscript:@"includesPasswordRequest"];

    if ([v4 _isRapportLogin])
    {
      CFStringRef v12 = @"tv";
    }
    else if ([v4 _isFirstPartyLogin] {
           && ([v4 _isWebLogin] & 1) != 0)
    }
    {
      CFStringRef v12 = @"appleweb";
    }
    else if ([v4 _isWebLogin])
    {
      CFStringRef v12 = @"web";
    }
    else if ([v4 _isFirstPartyLogin])
    {
      CFStringRef v12 = @"apple";
    }
    else
    {
      CFStringRef v12 = @"app";
    }
    [(AKCAReporter *)v5 setObject:v12 forKeyedSubscript:@"originClientType"];
    v13 = [v4 authorizationRequest];

    if (v13)
    {
      v14 = [v4 authorizationRequest];
      v15 = [v14 clientID];
      [(AKCAReporter *)v5 setObject:v15 forKeyedSubscript:@"clientID"];

      v16 = [v4 _proxiedClientAppID];
      [(AKCAReporter *)v5 setObject:v16 forKeyedSubscript:@"appID"];

      v17 = [v4 authorizationRequest];
      v18 = [v17 teamID];
      [(AKCAReporter *)v5 setObject:v18 forKeyedSubscript:@"teamID"];

      v19 = [v4 authorizationRequest];
      BOOL v20 = [v19 existingStatus] != (id)1;

      v21 = +[NSNumber numberWithInt:v20];
      [(AKCAReporter *)v5 setObject:v21 forKeyedSubscript:@"isFirstTimeAuth"];

      v22 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 _isEligibleForUpgradeFromPassword]);
      [(AKCAReporter *)v5 setObject:v22 forKeyedSubscript:@"isUpgradeFromPassword"];
    }
  }

  return v5;
}

- (void)didCompleteWithAuthorization:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 authorizedRequest];
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();

  v10 = [v7 authorizedRequest];

  objc_opt_class();
  int v11 = objc_opt_isKindOfClass();

  CFStringRef v12 = +[NSNumber numberWithBool:isKindOfClass & 1];
  [(AKCAReporter *)self setObject:v12 forKeyedSubscript:@"authorizationRequestSuccess"];

  v13 = +[NSNumber numberWithBool:v11 & 1];
  [(AKCAReporter *)self setObject:v13 forKeyedSubscript:@"passwordRequestSuccess"];

  v14 = [v6 domain];
  [(AKCAReporter *)self setObject:v14 forKeyedSubscript:@"errorDomain"];

  v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
  [(AKCAReporter *)self setObject:v15 forKeyedSubscript:@"errorCode"];

  AKErrorUnderlyingError();
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  v16 = v22;
  if (v22)
  {
    v17 = [v22 domain];
    [(AKCAReporter *)self setObject:v17 forKeyedSubscript:@"underlyingErrorDomain"];

    v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v22 code]);
    [(AKCAReporter *)self setObject:v18 forKeyedSubscript:@"underlyingErrorCode"];

    v16 = v22;
  }
  if ((isKindOfClass | v11))
  {
    v19 = [(AKCAReporter *)self objectForKeyedSubscript:@"clientID"];

    if (v19) {
      [(AKCAReporter *)self setObject:@"<akredacted>" forKeyedSubscript:@"clientID"];
    }
    BOOL v20 = [(AKCAReporter *)self objectForKeyedSubscript:@"appID"];

    if (v20) {
      [(AKCAReporter *)self setObject:@"<akredacted>" forKeyedSubscript:@"appID"];
    }
    v21 = [(AKCAReporter *)self objectForKeyedSubscript:@"teamID"];

    v16 = v22;
    if (v21)
    {
      [(AKCAReporter *)self setObject:@"<akredacted>" forKeyedSubscript:@"teamID"];
      v16 = v22;
    }
  }
}

@end
@interface AKCATiburonRequestReporter
- (AKCATiburonRequestReporter)initWithRequestContext:(id)a3;
- (void)didCompleteWithAuthorization:(id)a3 error:(id)a4;
@end

@implementation AKCATiburonRequestReporter

- (AKCATiburonRequestReporter)initWithRequestContext:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AKCATiburonRequestReporter;
  v5 = [(AKCAReporter *)&v26 initWithEvent:@"com.apple.AuthKit.TiburonRequest"];
  if (v5)
  {
    v6 = [v4 requestIdentifier];
    v7 = [v6 UUIDString];
    [(AKCAReporter *)v5 setObject:v7 forKeyedSubscript:@"requestID"];

    v8 = [v4 authorizationRequest];
    uint64_t v9 = MEMORY[0x1E4F1CC38];
    uint64_t v10 = MEMORY[0x1E4F1CC28];
    if (v8) {
      uint64_t v11 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v11 = MEMORY[0x1E4F1CC28];
    }
    [(AKCAReporter *)v5 setObject:v11 forKeyedSubscript:@"includesAuthorizationRequest"];

    v12 = [v4 passwordRequest];
    if (v12) {
      uint64_t v13 = v9;
    }
    else {
      uint64_t v13 = v10;
    }
    [(AKCAReporter *)v5 setObject:v13 forKeyedSubscript:@"includesPasswordRequest"];

    if ([v4 _isRapportLogin])
    {
      v14 = @"tv";
    }
    else if [v4 _isFirstPartyLogin] && (objc_msgSend(v4, "_isWebLogin"))
    {
      v14 = @"appleweb";
    }
    else if ([v4 _isWebLogin])
    {
      v14 = @"web";
    }
    else if ([v4 _isFirstPartyLogin])
    {
      v14 = @"apple";
    }
    else
    {
      v14 = @"app";
    }
    [(AKCAReporter *)v5 setObject:v14 forKeyedSubscript:@"originClientType"];
    v15 = [v4 authorizationRequest];

    if (v15)
    {
      v16 = [v4 authorizationRequest];
      v17 = [v16 clientID];
      [(AKCAReporter *)v5 setObject:v17 forKeyedSubscript:@"clientID"];

      v18 = [v4 _proxiedClientAppID];
      [(AKCAReporter *)v5 setObject:v18 forKeyedSubscript:@"appID"];

      v19 = [v4 authorizationRequest];
      v20 = [v19 teamID];
      [(AKCAReporter *)v5 setObject:v20 forKeyedSubscript:@"teamID"];

      v21 = [v4 authorizationRequest];
      BOOL v22 = [v21 existingStatus] != 1;

      v23 = [NSNumber numberWithInt:v22];
      [(AKCAReporter *)v5 setObject:v23 forKeyedSubscript:@"isFirstTimeAuth"];

      v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "_isEligibleForUpgradeFromPassword"));
      [(AKCAReporter *)v5 setObject:v24 forKeyedSubscript:@"isUpgradeFromPassword"];
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

  uint64_t v10 = [v7 authorizedRequest];

  objc_opt_class();
  int v11 = objc_opt_isKindOfClass();

  v12 = [NSNumber numberWithBool:isKindOfClass & 1];
  [(AKCAReporter *)self setObject:v12 forKeyedSubscript:@"authorizationRequestSuccess"];

  uint64_t v13 = [NSNumber numberWithBool:v11 & 1];
  [(AKCAReporter *)self setObject:v13 forKeyedSubscript:@"passwordRequestSuccess"];

  v14 = [v6 domain];
  [(AKCAReporter *)self setObject:v14 forKeyedSubscript:@"errorDomain"];

  v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
  [(AKCAReporter *)self setObject:v15 forKeyedSubscript:@"errorCode"];

  AKErrorUnderlyingError();
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  v16 = v22;
  if (v22)
  {
    v17 = [v22 domain];
    [(AKCAReporter *)self setObject:v17 forKeyedSubscript:@"underlyingErrorDomain"];

    v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v22, "code"));
    [(AKCAReporter *)self setObject:v18 forKeyedSubscript:@"underlyingErrorCode"];

    v16 = v22;
  }
  if ((isKindOfClass | v11))
  {
    v19 = [(AKCAReporter *)self objectForKeyedSubscript:@"clientID"];

    if (v19) {
      [(AKCAReporter *)self setObject:@"<akredacted>" forKeyedSubscript:@"clientID"];
    }
    v20 = [(AKCAReporter *)self objectForKeyedSubscript:@"appID"];

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
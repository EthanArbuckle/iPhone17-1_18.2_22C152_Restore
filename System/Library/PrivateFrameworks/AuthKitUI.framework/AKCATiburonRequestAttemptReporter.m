@interface AKCATiburonRequestAttemptReporter
- (AKCATiburonRequestAttemptReporter)initWithRequestID:(id)a3;
- (void)didCompleteWithAuthorization:(id)a3 error:(id)a4;
@end

@implementation AKCATiburonRequestAttemptReporter

- (AKCATiburonRequestAttemptReporter)initWithRequestID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKCATiburonRequestAttemptReporter;
  v5 = [(AKCAReporter *)&v8 initWithEvent:@"com.apple.AuthKit.TiburonAttempt"];
  v6 = v5;
  if (v5) {
    [(AKCAReporter *)v5 setObject:v4 forKeyedSubscript:@"requestID"];
  }

  return v6;
}

- (void)didCompleteWithAuthorization:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [v7 authorizedRequest];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v10 = [v7 authorizedRequest];

  objc_opt_class();
  LOBYTE(v7) = objc_opt_isKindOfClass();

  v11 = [NSNumber numberWithBool:isKindOfClass & 1];
  [(AKCAReporter *)self setObject:v11 forKeyedSubscript:@"authorizationRequestSuccess"];

  v12 = [NSNumber numberWithBool:v7 & 1];
  [(AKCAReporter *)self setObject:v12 forKeyedSubscript:@"passwordRequestSuccess"];

  v13 = [v6 domain];
  [(AKCAReporter *)self setObject:v13 forKeyedSubscript:@"errorDomain"];

  v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
  [(AKCAReporter *)self setObject:v14 forKeyedSubscript:@"errorCode"];

  AKErrorUnderlyingError();
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v15 = [v17 domain];
    [(AKCAReporter *)self setObject:v15 forKeyedSubscript:@"underlyingErrorDomain"];

    v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "code"));
    [(AKCAReporter *)self setObject:v16 forKeyedSubscript:@"underlyingErrorCode"];
  }
}

@end
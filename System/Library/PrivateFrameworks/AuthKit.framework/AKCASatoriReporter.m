@interface AKCASatoriReporter
- (AKCASatoriReporter)initWithRequestID:(id)a3;
- (void)didCompleteVerificationWithSuccess:(BOOL)a3 duration:(unint64_t)a4;
- (void)didCompleteWithSuccess:(BOOL)a3 authorizationAlreadyComplete:(BOOL)a4;
- (void)didPerformVerificationWithSuccess:(BOOL)a3 duration:(unint64_t)a4;
@end

@implementation AKCASatoriReporter

- (AKCASatoriReporter)initWithRequestID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKCASatoriReporter;
  v5 = [(AKCAReporter *)&v8 initWithEvent:@"com.apple.AuthKit.TiburonSatori"];
  v6 = v5;
  if (v5) {
    [(AKCAReporter *)v5 setObject:v4 forKeyedSubscript:@"requestID"];
  }

  return v6;
}

- (void)didCompleteWithSuccess:(BOOL)a3 authorizationAlreadyComplete:(BOOL)a4
{
  BOOL v4 = a3;
  v6 = +[NSNumber numberWithBool:a4];
  [(AKCAReporter *)self setObject:v6 forKeyedSubscript:@"availableLateAfterAuthComplete"];

  id v7 = +[NSNumber numberWithBool:v4];
  [(AKCAReporter *)self setObject:v7 forKeyedSubscript:@"wasSuccess"];
}

- (void)didPerformVerificationWithSuccess:(BOOL)a3 duration:(unint64_t)a4
{
  v6 = +[NSNumber numberWithBool:a3];
  [(AKCAReporter *)self setObject:v6 forKeyedSubscript:@"performVerificationSuccess"];

  [(AKCAReporter *)self machAbsoluteTimeToTimeInterval:a4];
  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(AKCAReporter *)self setObject:v7 forKeyedSubscript:@"performVerificationDuration"];
}

- (void)didCompleteVerificationWithSuccess:(BOOL)a3 duration:(unint64_t)a4
{
  v6 = +[NSNumber numberWithBool:a3];
  [(AKCAReporter *)self setObject:v6 forKeyedSubscript:@"verificationResults"];

  [(AKCAReporter *)self machAbsoluteTimeToTimeInterval:a4];
  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(AKCAReporter *)self setObject:v7 forKeyedSubscript:@"verificationResultsDuration"];
}

@end
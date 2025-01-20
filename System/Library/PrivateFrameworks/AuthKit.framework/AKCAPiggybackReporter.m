@interface AKCAPiggybackReporter
- (AKCAPiggybackReporter)initWithRequestID:(id)a3;
- (id)piggybackResultString:(unint64_t)a3;
- (void)didCancelRequesting;
- (void)didCircleTimeout;
- (void)didEscapeRequesting;
- (void)didFinishAccepting;
@end

@implementation AKCAPiggybackReporter

- (AKCAPiggybackReporter)initWithRequestID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKCAPiggybackReporter;
  v5 = [(AKCAReporter *)&v8 initWithEvent:@"com.apple.AuthKit.Piggyback"];
  v6 = v5;
  if (v5) {
    [(AKCAReporter *)v5 setObject:v4 forKeyedSubscript:@"requestID"];
  }

  return v6;
}

- (void)didCircleTimeout
{
  v3 = [(AKCAPiggybackReporter *)self piggybackResultString:0];
  [(AKCAReporter *)self setObject:v3 forKeyedSubscript:@"piggybackResult"];

  [(AKCAReporter *)self sendReport];
}

- (void)didFinishAccepting
{
  v3 = [(AKCAPiggybackReporter *)self piggybackResultString:1];
  [(AKCAReporter *)self setObject:v3 forKeyedSubscript:@"piggybackResult"];

  [(AKCAReporter *)self sendReport];
}

- (void)didCancelRequesting
{
  v3 = [(AKCAPiggybackReporter *)self piggybackResultString:2];
  [(AKCAReporter *)self setObject:v3 forKeyedSubscript:@"piggybackResult"];

  [(AKCAReporter *)self sendReport];
}

- (void)didEscapeRequesting
{
  v3 = [(AKCAPiggybackReporter *)self piggybackResultString:3];
  [(AKCAReporter *)self setObject:v3 forKeyedSubscript:@"piggybackResult"];

  [(AKCAReporter *)self sendReport];
}

- (id)piggybackResultString:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"circleTimeout";
  }
  else {
    return off_10022A7B0[a3 - 1];
  }
}

@end
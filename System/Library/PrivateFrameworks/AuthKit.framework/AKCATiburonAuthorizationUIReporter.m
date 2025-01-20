@interface AKCATiburonAuthorizationUIReporter
- (AKCATiburonAuthorizationUIReporter)initWithRequestID:(id)a3;
- (void)didSelectAnonymousEmail:(BOOL)a3 didCancel:(BOOL)a4;
- (void)setModifiedName;
@end

@implementation AKCATiburonAuthorizationUIReporter

- (AKCATiburonAuthorizationUIReporter)initWithRequestID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKCATiburonAuthorizationUIReporter;
  v5 = [(AKCAReporter *)&v8 initWithEvent:@"com.apple.AuthKit.TiburonAuthorizationUI"];
  v6 = v5;
  if (v5)
  {
    [(AKCAReporter *)v5 setObject:v4 forKeyedSubscript:@"requestID"];
    [(AKCAReporter *)v6 setObject:&__kCFBooleanFalse forKeyedSubscript:@"modifiedName"];
  }

  return v6;
}

- (void)setModifiedName
{
}

- (void)didSelectAnonymousEmail:(BOOL)a3 didCancel:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = +[NSNumber numberWithBool:a3];
  [(AKCAReporter *)self setObject:v6 forKeyedSubscript:@"useAnonymous"];

  id v7 = +[NSNumber numberWithBool:v4];
  [(AKCAReporter *)self setObject:v7 forKeyedSubscript:@"didCancel"];
}

@end
@interface AKCATiburonInputUIReporter
- (AKCATiburonInputUIReporter)initWithRequestID:(id)a3;
- (void)_clearMutuallyExclusiveProperties:(BOOL)a3;
- (void)didComplete:(BOOL)a3;
- (void)didModifyName:(BOOL)a3;
- (void)didSelectAnonymousEmail:(BOOL)a3;
- (void)didSelectAppleID:(BOOL)a3;
- (void)didSelectPasswordCredential:(BOOL)a3;
- (void)didShowAppleID:(BOOL)a3;
- (void)setPasswordCredentialCount:(unint64_t)a3;
@end

@implementation AKCATiburonInputUIReporter

- (AKCATiburonInputUIReporter)initWithRequestID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKCATiburonInputUIReporter;
  v5 = [(AKCAReporter *)&v8 initWithEvent:@"com.apple.AuthKit.TiburonAuthorizationUI"];
  v6 = v5;
  if (v5)
  {
    [(AKCAReporter *)v5 setObject:v4 forKeyedSubscript:@"requestID"];
    [(AKCAReporter *)v6 setObject:&off_10023AF48 forKeyedSubscript:@"passwordCredentialCount"];
    [(AKCAReporter *)v6 setObject:&__kCFBooleanFalse forKeyedSubscript:@"didShowAppleID"];
    [(AKCAReporter *)v6 setObject:&__kCFBooleanFalse forKeyedSubscript:@"useAnonymous"];
    [(AKCAReporter *)v6 setObject:&__kCFBooleanFalse forKeyedSubscript:@"useAppleID"];
    [(AKCAReporter *)v6 setObject:&__kCFBooleanFalse forKeyedSubscript:@"usePasswordCredential"];
    [(AKCAReporter *)v6 setObject:&__kCFBooleanFalse forKeyedSubscript:@"modifiedName"];
    [(AKCAReporter *)v6 setObject:&__kCFBooleanTrue forKeyedSubscript:@"didCancel"];
  }

  return v6;
}

- (void)setPasswordCredentialCount:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [(AKCAReporter *)self setObject:v4 forKeyedSubscript:@"passwordCredentialCount"];
}

- (void)didShowAppleID:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(AKCAReporter *)self setObject:v4 forKeyedSubscript:@"didShowAppleID"];
}

- (void)didSelectAnonymousEmail:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(AKCAReporter *)self setObject:v4 forKeyedSubscript:@"useAnonymous"];
}

- (void)didSelectAppleID:(BOOL)a3
{
  BOOL v3 = a3;
  -[AKCATiburonInputUIReporter _clearMutuallyExclusiveProperties:](self, "_clearMutuallyExclusiveProperties:");
  id v5 = +[NSNumber numberWithBool:v3];
  [(AKCAReporter *)self setObject:v5 forKeyedSubscript:@"useAppleID"];
}

- (void)didSelectPasswordCredential:(BOOL)a3
{
  BOOL v3 = a3;
  -[AKCATiburonInputUIReporter _clearMutuallyExclusiveProperties:](self, "_clearMutuallyExclusiveProperties:");
  id v5 = +[NSNumber numberWithBool:v3];
  [(AKCAReporter *)self setObject:v5 forKeyedSubscript:@"usePasswordCredential"];
}

- (void)didModifyName:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(AKCAReporter *)self setObject:v4 forKeyedSubscript:@"modifiedName"];
}

- (void)didComplete:(BOOL)a3
{
  id v4 = +[NSNumber numberWithInt:!a3];
  [(AKCAReporter *)self setObject:v4 forKeyedSubscript:@"didCancel"];
}

- (void)_clearMutuallyExclusiveProperties:(BOOL)a3
{
  if (a3)
  {
    [(AKCAReporter *)self setObject:&__kCFBooleanFalse forKeyedSubscript:@"useAppleID"];
    [(AKCAReporter *)self setObject:&__kCFBooleanFalse forKeyedSubscript:@"usePasswordCredential"];
  }
}

@end
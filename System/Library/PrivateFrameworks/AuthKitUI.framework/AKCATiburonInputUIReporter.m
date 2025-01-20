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
  v9.receiver = self;
  v9.super_class = (Class)AKCATiburonInputUIReporter;
  v5 = [(AKCAReporter *)&v9 initWithEvent:@"com.apple.AuthKit.TiburonAuthorizationUI"];
  v6 = v5;
  if (v5)
  {
    [(AKCAReporter *)v5 setObject:v4 forKeyedSubscript:@"requestID"];
    [(AKCAReporter *)v6 setObject:&unk_1F1F03690 forKeyedSubscript:@"passwordCredentialCount"];
    uint64_t v7 = MEMORY[0x1E4F1CC28];
    [(AKCAReporter *)v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"didShowAppleID"];
    [(AKCAReporter *)v6 setObject:v7 forKeyedSubscript:@"useAnonymous"];
    [(AKCAReporter *)v6 setObject:v7 forKeyedSubscript:@"useAppleID"];
    [(AKCAReporter *)v6 setObject:v7 forKeyedSubscript:@"usePasswordCredential"];
    [(AKCAReporter *)v6 setObject:v7 forKeyedSubscript:@"modifiedName"];
    [(AKCAReporter *)v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"didCancel"];
  }

  return v6;
}

- (void)setPasswordCredentialCount:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(AKCAReporter *)self setObject:v4 forKeyedSubscript:@"passwordCredentialCount"];
}

- (void)didShowAppleID:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AKCAReporter *)self setObject:v4 forKeyedSubscript:@"didShowAppleID"];
}

- (void)didSelectAnonymousEmail:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AKCAReporter *)self setObject:v4 forKeyedSubscript:@"useAnonymous"];
}

- (void)didSelectAppleID:(BOOL)a3
{
  BOOL v3 = a3;
  -[AKCATiburonInputUIReporter _clearMutuallyExclusiveProperties:](self, "_clearMutuallyExclusiveProperties:");
  id v5 = [NSNumber numberWithBool:v3];
  [(AKCAReporter *)self setObject:v5 forKeyedSubscript:@"useAppleID"];
}

- (void)didSelectPasswordCredential:(BOOL)a3
{
  BOOL v3 = a3;
  -[AKCATiburonInputUIReporter _clearMutuallyExclusiveProperties:](self, "_clearMutuallyExclusiveProperties:");
  id v5 = [NSNumber numberWithBool:v3];
  [(AKCAReporter *)self setObject:v5 forKeyedSubscript:@"usePasswordCredential"];
}

- (void)didModifyName:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AKCAReporter *)self setObject:v4 forKeyedSubscript:@"modifiedName"];
}

- (void)didComplete:(BOOL)a3
{
  id v4 = [NSNumber numberWithInt:!a3];
  [(AKCAReporter *)self setObject:v4 forKeyedSubscript:@"didCancel"];
}

- (void)_clearMutuallyExclusiveProperties:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = MEMORY[0x1E4F1CC28];
    [(AKCAReporter *)self setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"useAppleID"];
    [(AKCAReporter *)self setObject:v4 forKeyedSubscript:@"usePasswordCredential"];
  }
}

@end
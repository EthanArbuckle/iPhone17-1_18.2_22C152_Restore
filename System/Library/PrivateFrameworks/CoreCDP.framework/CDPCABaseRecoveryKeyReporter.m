@interface CDPCABaseRecoveryKeyReporter
- (void)reportRecoveryKeyTaskFinishedWithSuccess:(BOOL)a3 error:(id)a4;
@end

@implementation CDPCABaseRecoveryKeyReporter

- (void)reportRecoveryKeyTaskFinishedWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  v6 = [NSNumber numberWithBool:v4];
  [(CDPCAReporter *)self setObject:v6 forKeyedSubscript:@"wasSuccess"];

  if (v7) {
    [(CDPCAReporter *)self populateUnderlyingErrorsStartingWithRootError:v7 maxDepth:3];
  }
  [(CDPCAReporter *)self sendReport];
}

@end
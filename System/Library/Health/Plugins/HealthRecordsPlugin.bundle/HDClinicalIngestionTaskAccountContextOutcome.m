@interface HDClinicalIngestionTaskAccountContextOutcome
+ (id)new;
- (BOOL)accountMustLimitRequests;
- (BOOL)atLeastOneFetchSucceeded;
- (HDClinicalIngestionTaskAccountContextOutcome)init;
- (HDClinicalIngestionTaskAccountContextOutcome)initWithOneFetchSucceeded:(BOOL)a3 accountMustLimitRequests:(BOOL)a4;
@end

@implementation HDClinicalIngestionTaskAccountContextOutcome

+ (id)new
{
  v2 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v2, objc_opt_class() format];

  return 0;
}

- (HDClinicalIngestionTaskAccountContextOutcome)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDClinicalIngestionTaskAccountContextOutcome)initWithOneFetchSucceeded:(BOOL)a3 accountMustLimitRequests:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HDClinicalIngestionTaskAccountContextOutcome;
  result = [(HDClinicalIngestionTaskAccountContextOutcome *)&v7 init];
  if (result)
  {
    result->_atLeastOneFetchSucceeded = a3;
    result->_accountMustLimitRequests = a4;
  }
  return result;
}

- (BOOL)atLeastOneFetchSucceeded
{
  return self->_atLeastOneFetchSucceeded;
}

- (BOOL)accountMustLimitRequests
{
  return self->_accountMustLimitRequests;
}

@end
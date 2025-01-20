@interface BLSHNullInactiveBudgetPolicy
- (id)validateAndChargeFutureSpecifier:(id)a3 nextSpecifier:(id)a4 forEnvironment:(id)a5;
- (int64_t)allowedFidelityAtDate:(id)a3 forEnvironment:(id)a4 expectedFidelity:(int64_t)a5;
- (void)invalidateAtRequestDate:(id)a3 forEnvironment:(id)a4 invalidationBlock:(id)a5;
@end

@implementation BLSHNullInactiveBudgetPolicy

- (int64_t)allowedFidelityAtDate:(id)a3 forEnvironment:(id)a4 expectedFidelity:(int64_t)a5
{
  if (a5 == 1) {
    return 2;
  }
  else {
    return a5;
  }
}

- (id)validateAndChargeFutureSpecifier:(id)a3 nextSpecifier:(id)a4 forEnvironment:(id)a5
{
  id v5 = a3;

  return v5;
}

- (void)invalidateAtRequestDate:(id)a3 forEnvironment:(id)a4 invalidationBlock:(id)a5
{
}

@end
@interface BLSHNullInactiveProcessBudget
- (BOOL)stillTrackingAfterPurgingStaleDataForNowDate:(id)a3;
- (id)validateAndChargeFutureSpecifier:(id)a3 nextSpecifier:(id)a4 expectedFidelity:(int64_t)a5;
- (int64_t)allowedFidelityAtDate:(id)a3 expectedFidelity:(int64_t)a4;
- (void)invalidateAtRequestDate:(id)a3 expectedFidelity:(int64_t)a4 invalidationBlock:(id)a5;
@end

@implementation BLSHNullInactiveProcessBudget

- (int64_t)allowedFidelityAtDate:(id)a3 expectedFidelity:(int64_t)a4
{
  if (a4 == 1) {
    return 2;
  }
  else {
    return a4;
  }
}

- (id)validateAndChargeFutureSpecifier:(id)a3 nextSpecifier:(id)a4 expectedFidelity:(int64_t)a5
{
  id v5 = a3;

  return v5;
}

- (void)invalidateAtRequestDate:(id)a3 expectedFidelity:(int64_t)a4 invalidationBlock:(id)a5
{
}

- (BOOL)stillTrackingAfterPurgingStaleDataForNowDate:(id)a3
{
  return 1;
}

@end
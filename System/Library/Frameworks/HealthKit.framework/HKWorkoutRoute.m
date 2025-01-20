@interface HKWorkoutRoute
+ (BOOL)_isConcreteObjectClass;
+ (id)_workoutRouteWithDevice:(id)a3 metadata:(id)a4;
- (BOOL)_isSmoothed;
- (BOOL)_requiresPrivateEntitlementForQueries;
- (HDCodableLocationSeries)_codableWorkoutRoute;
- (id)_validateSample;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)_valueDescription;
- (void)_setCodableWorkoutRoute:(id)a3;
@end

@implementation HKWorkoutRoute

+ (id)_workoutRouteWithDevice:(id)a3 metadata:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[HKSeriesType workoutRouteType];
  v9 = (void *)[a1 _newSampleWithType:v8 startDate:v7 endDate:v6 device:&__block_literal_global_3 metadata:2.22507386e-308 config:2.22507386e-308];

  return v9;
}

uint64_t __51__HKWorkoutRoute__workoutRouteWithDevice_metadata___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setCount:0];
}

- (HDCodableLocationSeries)_codableWorkoutRoute
{
  return self->__codableWorkoutRoute;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HKWorkoutRoute;
  id v4 = -[HKSeriesSample _validateWithConfiguration:](&v9, sel__validateWithConfiguration_, a3.var0, a3.var1);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = 0;
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = objc_opt_class();
    v5 = objc_msgSend(v6, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v7, a2, @"Invalid data type %@"", objc_opt_class());
  }

  return v5;
}

- (id)_validateSample
{
  v4.receiver = self;
  v4.super_class = (Class)HKWorkoutRoute;
  v2 = [(HKSeriesSample *)&v4 _validateSample];

  return v2;
}

- (id)_valueDescription
{
  v3 = NSString;
  NSUInteger v4 = [(HKSeriesSample *)self count];
  BOOL v5 = [(HKSeriesSample *)self _isFrozen];
  id v6 = @"N";
  if (v5) {
    id v6 = @"Y";
  }
  return (id)[v3 stringWithFormat:@"\ncount=%d, frozen=%@", v4, v6];
}

- (BOOL)_requiresPrivateEntitlementForQueries
{
  v3 = [(HKObject *)self sourceRevision];
  NSUInteger v4 = [v3 source];
  int v5 = [v4 _isAppleWatch];

  if (v5) {
    int v6 = ![(HKWorkoutRoute *)self _isSmoothed];
  }
  else {
    LOBYTE(v6) = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)HKWorkoutRoute;
  return [(HKSample *)&v8 _requiresPrivateEntitlementForQueries] | v6;
}

- (BOOL)_isSmoothed
{
  v2 = [(HKObject *)self metadata];
  v3 = [v2 objectForKeyedSubscript:@"HKMetadataKeySyncVersion"];

  if (v3) {
    BOOL v4 = [v3 integerValue] > 1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_setCodableWorkoutRoute:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
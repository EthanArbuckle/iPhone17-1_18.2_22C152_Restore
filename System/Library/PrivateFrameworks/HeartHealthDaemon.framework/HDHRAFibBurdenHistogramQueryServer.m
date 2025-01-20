@interface HDHRAFibBurdenHistogramQueryServer
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (HDHRAFibBurdenHistogramQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)_makeEmptyHistogramResult;
- (id)objectTypes;
- (void)_queue_start;
@end

@implementation HDHRAFibBurdenHistogramQueryServer

- (HDHRAFibBurdenHistogramQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HDHRAFibBurdenHistogramQueryServer;
  v11 = [(HDQueryServer *)&v18 initWithUUID:a3 configuration:a4 client:v10 delegate:a6];
  if (v11)
  {
    v12 = [v10 profile];
    v13 = [v12 profileExtensionWithIdentifier:*MEMORY[0x1E4F67D70]];

    v14 = [v13 aFibBurdenComponents];
    uint64_t v15 = [v14 analyzer];
    analyzer = v11->_analyzer;
    v11->_analyzer = (HKHRAFibBurdenAnalyzer *)v15;
  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)objectTypes
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5F0]];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = [v2 setWithArray:v4];

  return v5;
}

- (void)_queue_start
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)HDHRAFibBurdenHistogramQueryServer;
  [(HDQueryServer *)&v30 _queue_start];
  v3 = [(HDQueryServer *)self clientProxy];
  v4 = [v3 remoteObjectProxy];

  v5 = [(HDQueryServer *)self client];
  v6 = [v5 authorizationOracle];
  v7 = [(HDHRAFibBurdenHistogramQueryServer *)self objectTypes];
  id v29 = 0;
  v8 = [v6 readAuthorizationStatusesForTypes:v7 error:&v29];
  id v9 = v29;

  if (!v8)
  {
    v19 = [(HDQueryServer *)self queryUUID];
    objc_msgSend(v4, "client_deliverError:forQuery:", v9, v19);
    goto LABEL_22;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = [v8 allValues];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (!v11)
  {

LABEL_18:
    analyzer = self->_analyzer;
    id v24 = v9;
    v19 = [(HKHRAFibBurdenAnalyzer *)analyzer generateSixWeekBurdenHistogramsWithError:&v24];
    id v22 = v24;

    v23 = [(HDQueryServer *)self queryUUID];
    if (v19) {
      objc_msgSend(v4, "client_deliverHistogramResult:queryUUID:", v19, v23);
    }
    else {
      objc_msgSend(v4, "client_deliverError:forQuery:", v22, v23);
    }

    id v9 = v22;
    goto LABEL_22;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v26;
  char v14 = 1;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v26 != v13) {
        objc_enumerationMutation(v10);
      }
      if (v14) {
        char v14 = [*(id *)(*((void *)&v25 + 1) + 8 * i) canRead];
      }
      else {
        char v14 = 0;
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v35 count:16];
  }
  while (v12);

  if (v14) {
    goto LABEL_18;
  }
  _HKInitializeLogging();
  v16 = HKHRAFibBurdenLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v32 = v17;
    __int16 v33 = 2112;
    v34 = v8;
    id v18 = v17;
    _os_log_impl(&dword_1D3AC6000, v16, OS_LOG_TYPE_DEFAULT, "[%@] Avoiding exposing health data due to missing authorization: %@", buf, 0x16u);
  }
  v19 = [(HDHRAFibBurdenHistogramQueryServer *)self _makeEmptyHistogramResult];
  v20 = [(HDQueryServer *)self queryUUID];
  objc_msgSend(v4, "client_deliverHistogramResult:queryUUID:", v19, v20);

LABEL_22:
}

- (id)_makeEmptyHistogramResult
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F67D88]) initWithBurdenPercentage:0 burdenPercentageWasClampedToLowerBound:0 unavailabilityReason:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F67D90]) initWithSundayBurden:v2 mondayBurden:v2 tuesdayBurden:v2 wednesdayBurden:v2 thursdayBurden:v2 fridayBurden:v2 saturdayBurden:v2];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F67DC8]) initWithMidnightToFourAMBurden:v2 fourAMtoEightAMBurden:v2 eightAMToNoonBurden:v2 noonToFourPMBurden:v2 fourPMToEightPMBurden:v2 eightPMToMidnightBurden:v2];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F67DA8]) initWithDayOfWeekHistogram:v3 timeOfDayHistogram:v4];

  return v5;
}

- (void).cxx_destruct
{
}

@end
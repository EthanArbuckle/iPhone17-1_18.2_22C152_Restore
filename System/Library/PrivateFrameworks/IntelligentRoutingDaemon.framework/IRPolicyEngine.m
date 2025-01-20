@interface IRPolicyEngine
- (BOOL)shouldAskForLowLatencyMiLo:(id)a3 historyEventsContainer:(id)a4;
- (BOOL)shouldRejectEvent:(id)a3 withHistoryEventsContainer:(id)a4 withSystemState:(id)a5 forCandidate:(id)a6 date:(id)a7;
- (BOOL)updateBundlesWithSignificantInteractionForEvent:(id)a3 candidatesContainer:(id)a4 historyEventsContainer:(id)a5;
- (BOOL)updateContextWithDate:(id)a3 candidatesContainer:(id)a4 historyEventsContainer:(id)a5 systemState:(id)a6 miloProviderLslPredictionResults:(id)a7 nearbyDeviceContainer:(id)a8 fillInspection:(BOOL)a9;
- (IRPolicyEngine)initWithServicePackage:(int64_t)a3;
- (IRServicePackageAdapter)servicePackageAdapter;
- (NSDictionary)contexts;
- (NSDictionary)policyInspections;
- (NSSet)bundlesWithSignificantInteraction;
- (NSString)lastEventsString;
- (id)_lastEventsStringFromHistoryContainer:(id)a3 candidatesContainer:(id)a4 miloResults:(id)a5;
- (int64_t)servicePackage;
- (void)setBundlesWithSignificantInteraction:(id)a3;
- (void)setLastEventsString:(id)a3;
- (void)setServicePackage:(int64_t)a3;
- (void)setServicePackageAdapter:(id)a3;
@end

@implementation IRPolicyEngine

- (NSDictionary)contexts
{
  v2 = [(IRPolicyEngine *)self servicePackageAdapter];
  v3 = [v2 contexts];

  return (NSDictionary *)v3;
}

- (NSString)lastEventsString
{
  return self->_lastEventsString;
}

- (BOOL)updateContextWithDate:(id)a3 candidatesContainer:(id)a4 historyEventsContainer:(id)a5 systemState:(id)a6 miloProviderLslPredictionResults:(id)a7 nearbyDeviceContainer:(id)a8 fillInspection:(BOOL)a9
{
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = [(IRPolicyEngine *)self servicePackageAdapter];
  v22 = [v21 filterHistory:v18 withCandidatesContainer:v19];

  v23 = [(IRPolicyEngine *)self _lastEventsStringFromHistoryContainer:v22 candidatesContainer:v19 miloResults:v16];
  [(IRPolicyEngine *)self setLastEventsString:v23];

  v24 = [(IRPolicyEngine *)self servicePackageAdapter];
  char v25 = [v24 generateClassificationsWithCandiatesContainer:v19 systemState:v17 historyEventsContainer:v22 miloPrediction:v16 nearbyDeviceContainer:v15 fillInspection:a9 date:v20];

  return v25;
}

- (IRServicePackageAdapter)servicePackageAdapter
{
  return self->_servicePackageAdapter;
}

- (void)setLastEventsString:(id)a3
{
}

- (id)_lastEventsStringFromHistoryContainer:(id)a3 candidatesContainer:(id)a4 miloResults:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x263F08790]);
  [v11 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  id v12 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v12 setNumberStyle:1];
  [v12 setMaximumFractionDigits:2];
  v13 = [MEMORY[0x263EFF980] array];
  v14 = [v8 historyEvents];
  if ((unint64_t)[v14 count] < 0xF)
  {
    uint64_t v16 = 0;
  }
  else
  {
    id v15 = [v8 historyEvents];
    uint64_t v16 = [v15 count] - 15;
  }
  id v17 = [v8 historyEvents];
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = __88__IRPolicyEngine__lastEventsStringFromHistoryContainer_candidatesContainer_miloResults___block_invoke;
  v30 = &unk_2653A0328;
  id v36 = v13;
  uint64_t v37 = v16;
  id v31 = v11;
  id v32 = v12;
  id v33 = v10;
  v34 = self;
  id v35 = v9;
  id v18 = v13;
  id v19 = v9;
  id v20 = v10;
  id v21 = v12;
  id v22 = v11;
  [v17 enumerateObjectsWithOptions:2 usingBlock:&v27];

  v23 = [MEMORY[0x263F29C40] builderWithObject:0];
  v24 = [NSString stringWithFormat:@"Last %@ events", &unk_2703AF0E0, v27, v28, v29, v30];
  [v23 appendArraySection:v18 withName:v24 multilinePrefix:0 skipIfEmpty:0];

  char v25 = [v23 build];

  return v25;
}

- (IRPolicyEngine)initWithServicePackage:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IRPolicyEngine;
  v4 = [(IRPolicyEngine *)&v9 init];
  v5 = v4;
  if (v4)
  {
    [(IRPolicyEngine *)v4 setServicePackage:a3];
    v6 = IRCreateServicePackageAdapter(a3);
    [(IRPolicyEngine *)v5 setServicePackageAdapter:v6];

    v7 = objc_opt_new();
    [(IRPolicyEngine *)v5 setBundlesWithSignificantInteraction:v7];
  }
  return v5;
}

- (BOOL)updateBundlesWithSignificantInteractionForEvent:(id)a3 candidatesContainer:(id)a4 historyEventsContainer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8
    && ([(IRPolicyEngine *)self servicePackageAdapter],
        id v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 shouldConsiderEventForSignificantBundles:v8],
        v11,
        !v12))
  {
    char v17 = 0;
  }
  else
  {
    v13 = [(IRPolicyEngine *)self servicePackageAdapter];
    v14 = [v13 getSignificantBundlesWithCandidates:v9 fromHistory:v10];

    id v15 = [(IRPolicyEngine *)self bundlesWithSignificantInteraction];
    char v16 = [v15 isEqual:v14];

    if ((v16 & 1) == 0) {
      [(IRPolicyEngine *)self setBundlesWithSignificantInteraction:v14];
    }
    char v17 = v16 ^ 1;
  }
  return v17;
}

- (BOOL)shouldRejectEvent:(id)a3 withHistoryEventsContainer:(id)a4 withSystemState:(id)a5 forCandidate:(id)a6 date:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  char v17 = [(IRPolicyEngine *)self servicePackageAdapter];
  char v18 = [v17 shouldRejectEvent:v16 withHistoryEventsContainer:v15 withSystemState:v14 forCandidate:v13 date:v12];

  return v18;
}

- (NSDictionary)policyInspections
{
  v2 = [(IRPolicyEngine *)self servicePackageAdapter];
  v3 = [v2 policyInspections];

  return (NSDictionary *)v3;
}

- (BOOL)shouldAskForLowLatencyMiLo:(id)a3 historyEventsContainer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IRPolicyEngine *)self servicePackageAdapter];
  id v9 = [v6 historyEvents];

  LOBYTE(v6) = [v8 shouldAskForLowLatencyMiLo:v7 historyEventsAsc:v9];
  return (char)v6;
}

void __88__IRPolicyEngine__lastEventsStringFromHistoryContainer_candidatesContainer_miloResults___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(void *)(a1 + 80) >= a3) {
    *a4 = 1;
  }
  id v8 = *(void **)(a1 + 32);
  id v9 = (void *)MEMORY[0x263EFFA18];
  id v36 = v7;
  id v10 = [v7 systemState];
  id v11 = objc_msgSend(v9, "timeZoneForSecondsFromGMT:", objc_msgSend(v10, "timeZoneSeconds"));
  [v8 setTimeZone:v11];

  id v12 = NSNumber;
  id v13 = *(void **)(a1 + 40);
  id v14 = *(void **)(a1 + 48);
  id v15 = [v36 miloPredictionEvent];
  id v16 = [v15 predictionId];
  char v17 = [v36 miloPredictionEvent];
  char v18 = [v17 label];
  [v14 scoreForPredictionId:v16 andLabel:v18];
  id v19 = objc_msgSend(v12, "numberWithDouble:");
  id v35 = [v13 stringFromNumber:v19];

  id v20 = NSString;
  id v21 = *(void **)(a1 + 32);
  v34 = [v36 date];
  uint64_t v22 = objc_msgSend(v21, "stringFromDate:");
  uint64_t v23 = [*(id *)(a1 + 56) servicePackage];
  id v33 = [v36 event];
  [v33 eventType];
  if (v23) {
    IRAppleTVControlEventTypeToString();
  }
  else {
  v24 = IRMediaEventTypeToString();
  }
  char v25 = [v36 event];
  v26 = [v25 bundleID];
  uint64_t v27 = [v36 candidateIdentifier];
  uint64_t v28 = *(void **)(a1 + 64);
  v29 = [v36 candidateIdentifier];
  v30 = [v28 candidateNameForCandidateIdentifier:v29];
  [v20 stringWithFormat:@"date: %@, event: %@, appInFocus: %@, candidateIdentifier: %@, candidateName: %@, miloScore: %@", v22, v24, v26, v27, v30, v35];
  v32 = id v31 = (void *)v22;

  [*(id *)(a1 + 72) addObject:v32];
}

- (int64_t)servicePackage
{
  return self->_servicePackage;
}

- (void)setServicePackage:(int64_t)a3
{
  self->_servicePackage = a3;
}

- (NSSet)bundlesWithSignificantInteraction
{
  return self->_bundlesWithSignificantInteraction;
}

- (void)setBundlesWithSignificantInteraction:(id)a3
{
}

- (void)setServicePackageAdapter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servicePackageAdapter, 0);
  objc_storeStrong((id *)&self->_lastEventsString, 0);

  objc_storeStrong((id *)&self->_bundlesWithSignificantInteraction, 0);
}

@end
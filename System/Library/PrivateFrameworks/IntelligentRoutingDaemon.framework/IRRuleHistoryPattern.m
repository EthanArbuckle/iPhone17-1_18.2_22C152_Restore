@interface IRRuleHistoryPattern
+ (BOOL)_filterHistoryBySameApp:(id)a3 withSystemState:(id)a4;
+ (BOOL)filterHistoryByBrokeredDeviceScan:(id)a3;
+ (BOOL)filterHistoryBySimilarApp:(id)a3 withSystemState:(id)a4;
- (BOOL)_filterHistoryByEventsToWatch:(id)a3;
- (BOOL)_filterHistoryByMilo:(id)a3 withMiloPrediction:(id)a4;
- (BOOL)_filterHistoryBySameDay:(id)a3 comparedToDate:(id)a4 withSystemState:(id)a5;
- (BOOL)_filterHistoryBySameLoi:(id)a3 withSystemState:(id)a4;
- (BOOL)_filterHistoryByTimeInterval:(id)a3 comparedToDate:(id)a4;
- (BOOL)_filterHistorywithSameCandidates:(id)a3 withSameCandidates:(id)a4;
- (BOOL)calculateScoreWithoutPortion;
- (IRRuleHistoryPattern)init;
- (IRRuleHistoryPattern)initWithEventsToWatch:(id)a3 filters:(id)a4 timeInterval:(double)a5 maxNumberOfEventsInHistory:(unint64_t)a6 minNumberOfEventsInHistory:(unint64_t)a7 threshold:(double)a8;
- (NSSet)eventsToWatch;
- (NSSet)filters;
- (double)threshold;
- (double)timeInterval;
- (id)_filterHistoryEvents:(id)a3 withSystemState:(id)a4 date:(id)a5 miloPrediction:(id)a6 candiatesContainer:(id)a7;
- (id)executeRuleWithCandiatesContainer:(id)a3 systemStatus:(id)a4 historyContainer:(id)a5 miloPrediction:(id)a6 nearbyDeviceContainer:(id)a7 date:(id)a8;
- (unint64_t)maxNumberOfEventsInHistory;
- (unint64_t)minNumberOfEventsInHistory;
- (void)setCalculateScoreWithoutPortion:(BOOL)a3;
- (void)setEventsToWatch:(id)a3;
- (void)setFilters:(id)a3;
- (void)setMaxNumberOfEventsInHistory:(unint64_t)a3;
- (void)setMinNumberOfEventsInHistory:(unint64_t)a3;
- (void)setThreshold:(double)a3;
- (void)setTimeInterval:(double)a3;
@end

@implementation IRRuleHistoryPattern

+ (BOOL)filterHistoryBySimilarApp:(id)a3 withSystemState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 _filterHistoryBySameApp:v6 withSystemState:v7])
  {
    char v8 = 1;
  }
  else
  {
    v9 = [v6 sharingPolicy];
    v10 = [v7 avInitialRouteSharingPolicy];
    char v8 = [v9 isEqual:v10];
  }
  return v8;
}

+ (BOOL)_filterHistoryBySameApp:(id)a3 withSystemState:(id)a4
{
  id v5 = a4;
  id v6 = [a3 event];
  id v7 = [v6 bundleID];
  char v8 = [v5 appInFocusBundleID];

  LOBYTE(v5) = [v7 isEqual:v8];
  return (char)v5;
}

- (BOOL)_filterHistoryByMilo:(id)a3 withMiloPrediction:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 miloPredictionEvent];
  char v8 = [v7 predictionId];
  v9 = [v6 miloPredictionEvent];

  v10 = [v9 label];
  [v5 scoreForPredictionId:v8 andLabel:v10];
  double v12 = v11;

  v13 = +[IRPreferences shared];
  v14 = [v13 miloLslIsSameMiloThreshold];
  [v14 doubleValue];
  double v16 = v15;

  return v12 > v16;
}

+ (BOOL)filterHistoryByBrokeredDeviceScan:(id)a3
{
  id v3 = a3;
  v4 = [v3 event];
  if ([v4 eventType] == 9)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v3 event];
    BOOL v5 = [v6 eventType] == 10;
  }
  return v5;
}

- (BOOL)_filterHistoryByEventsToWatch:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IRRuleHistoryPattern *)self eventsToWatch];
  id v6 = [v4 event];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (BOOL)_filterHistoryByTimeInterval:(id)a3 comparedToDate:(id)a4
{
  id v6 = a4;
  id v7 = [a3 date];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  [(IRRuleHistoryPattern *)self timeInterval];
  LOBYTE(self) = v9 < v10;

  return (char)self;
}

- (BOOL)_filterHistoryBySameLoi:(id)a3 withSystemState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 systemState];
  if ([v7 locationSemanticUserSpecificPlaceType])
  {

LABEL_4:
    double v9 = [v5 systemState];
    int v10 = [v9 locationSemanticUserSpecificPlaceType];
    char v11 = v10 == [v6 locationSemanticUserSpecificPlaceType];
    goto LABEL_5;
  }
  int v8 = [v6 locationSemanticUserSpecificPlaceType];

  if (v8) {
    goto LABEL_4;
  }
  double v9 = [v5 systemState];
  v13 = [v9 locationSemanticLoiIdentifier];
  if (v13)
  {
    v14 = [v5 systemState];
    double v15 = [v14 locationSemanticLoiIdentifier];
    double v16 = [v6 locationSemanticLoiIdentifier];
    char v11 = [v15 isEqual:v16];
  }
  else
  {
    char v11 = 0;
  }

LABEL_5:
  return v11;
}

- (BOOL)_filterHistoryBySameDay:(id)a3 comparedToDate:(id)a4 withSystemState:(id)a5
{
  id v7 = (void *)MEMORY[0x263EFF910];
  id v8 = a5;
  id v9 = a4;
  int v10 = [a3 date];
  uint64_t v11 = [v8 timeZoneSeconds];

  LOBYTE(v7) = [v7 isDate:v10 inSameDayAsDate:v9 forTimeZoneInSeconds:v11];
  return (char)v7;
}

- (BOOL)_filterHistorywithSameCandidates:(id)a3 withSameCandidates:(id)a4
{
  id v5 = a4;
  id v6 = [a3 candidateIdentifier];
  id v7 = [v5 candidateForCandidateIdentifier:v6];

  return v7 != 0;
}

- (id)_filterHistoryEvents:(id)a3 withSystemState:(id)a4 date:(id)a5 miloPrediction:(id)a6 candiatesContainer:(id)a7
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v38 = a6;
  id v36 = a7;
  BOOL v42 = [(NSSet *)self->_filters containsObject:@"kIRRuleHistoryPatternFilterIsSameMilo"];
  BOOL v41 = [(NSSet *)self->_filters containsObject:@"kIRRuleHistoryPatternFilterIsSameApp"];
  BOOL v40 = [(NSSet *)self->_filters containsObject:@"kIRRuleHistoryPatternFilterIsSimilarApp"];
  BOOL v39 = [(NSSet *)self->_filters containsObject:@"kIRRuleHistoryPatternFilterIsSameLoi"];
  BOOL v15 = [(NSSet *)self->_filters containsObject:@"kIRRuleHistoryPatternFilterIsSameDay"];
  BOOL v16 = [(NSSet *)self->_filters containsObject:@"kIRRuleHistoryPatternFilterOnlyTestedCandidates"];
  v37 = objc_opt_new();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v17 = v12;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (!v18) {
    goto LABEL_29;
  }
  uint64_t v19 = v18;
  uint64_t v20 = *(void *)v44;
  do
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v44 != v20) {
        objc_enumerationMutation(v17);
      }
      uint64_t v22 = *(void *)(*((void *)&v43 + 1) + 8 * i);
      if (![(IRRuleHistoryPattern *)self _filterHistoryByEventsToWatch:v22]) {
        continue;
      }
      BOOL v23 = [(IRRuleHistoryPattern *)self _filterHistoryByTimeInterval:v22 comparedToDate:v14];
      if (v42 && v23) {
        int v24 = [(IRRuleHistoryPattern *)self _filterHistoryByMilo:v22 withMiloPrediction:v38];
      }
      else {
        int v24 = !v42 && v23;
      }
      if ((v41 & v24) == 1) {
        int v25 = +[IRRuleHistoryPattern _filterHistoryBySameApp:v22 withSystemState:v13];
      }
      else {
        int v25 = !v41 & v24;
      }
      if ((v40 & v25) == 1) {
        int v26 = +[IRRuleHistoryPattern filterHistoryBySimilarApp:v22 withSystemState:v13];
      }
      else {
        int v26 = !v40 & v25;
      }
      if ((v39 & v26) == 1) {
        int v27 = [(IRRuleHistoryPattern *)self _filterHistoryBySameLoi:v22 withSystemState:v13];
      }
      else {
        int v27 = !v39 & v26;
      }
      if ((v15 & v27) == 1)
      {
        int v28 = [(IRRuleHistoryPattern *)self _filterHistoryBySameDay:v22 comparedToDate:v14 withSystemState:v13];
        if (!v16) {
          goto LABEL_21;
        }
      }
      else
      {
        int v28 = !v15 & v27;
        if (!v16)
        {
LABEL_21:
          if (v28) {
            goto LABEL_26;
          }
          continue;
        }
      }
      if (v28
        && [(IRRuleHistoryPattern *)self _filterHistorywithSameCandidates:v22 withSameCandidates:v36])
      {
LABEL_26:
        [v37 addObject:v22];
        continue;
      }
    }
    uint64_t v19 = [v17 countByEnumeratingWithState:&v43 objects:v47 count:16];
  }
  while (v19);
LABEL_29:

  unint64_t v29 = [v37 count];
  unint64_t v30 = [(IRRuleHistoryPattern *)self maxNumberOfEventsInHistory];
  uint64_t v31 = (v29 - v30) & ~((uint64_t)(v29 - v30) >> 63);
  unint64_t v32 = [(IRRuleHistoryPattern *)self maxNumberOfEventsInHistory];
  if (v29 >= v32) {
    unint64_t v33 = v32;
  }
  else {
    unint64_t v33 = v29;
  }
  v34 = objc_msgSend(v37, "subarrayWithRange:", v31, v33);

  return v34;
}

- (id)executeRuleWithCandiatesContainer:(id)a3 systemStatus:(id)a4 historyContainer:(id)a5 miloPrediction:(id)a6 nearbyDeviceContainer:(id)a7 date:(id)a8
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  id v17 = [a5 historyEvents];
  v50 = self;
  v47 = v15;
  uint64_t v48 = v14;
  long long v46 = v16;
  uint64_t v18 = [(IRRuleHistoryPattern *)self _filterHistoryEvents:v17 withSystemState:v14 date:v16 miloPrediction:v15 candiatesContainer:v13];

  uint64_t v19 = [MEMORY[0x263F08760] set];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v20 = v18;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v56 != v23) {
          objc_enumerationMutation(v20);
        }
        int v25 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        int v26 = [v25 candidateIdentifier];

        if (v26)
        {
          int v27 = [v25 candidateIdentifier];
          [v19 addObject:v27];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v55 objects:v60 count:16];
    }
    while (v22);
  }

  long long v45 = v20;
  unint64_t v28 = [v20 count];
  unint64_t v29 = objc_opt_new();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v49 = v13;
  unint64_t v30 = [v13 candidates];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v52 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v51 + 1) + 8 * j);
        id v36 = [v35 candidateIdentifier];
        double v37 = (double)(unint64_t)[v19 countForObject:v36];

        BOOL v38 = [(IRRuleHistoryPattern *)v50 calculateScoreWithoutPortion];
        double v39 = v37 / (double)v28;
        if (!v28) {
          double v39 = 0.0;
        }
        if (v38) {
          double v39 = v37;
        }
        BOOL v40 = [NSNumber numberWithDouble:v39];
        BOOL v41 = [v35 candidateIdentifier];
        [v29 setObject:v40 forKeyedSubscript:v41];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v32);
  }

  BOOL v42 = [[IRRuleOutputHistoryPattern alloc] initWithRule:v50];
  [(IRRuleOutputHistoryPattern *)v42 setNumberOfEventsInHistory:v28];
  long long v43 = (void *)[v29 copy];
  [(IRRuleOutputHistoryPattern *)v42 setScoreForCandidates:v43];

  return v42;
}

- (IRRuleHistoryPattern)init
{
  v3.receiver = self;
  v3.super_class = (Class)IRRuleHistoryPattern;
  return [(IRRuleHistoryPattern *)&v3 init];
}

- (IRRuleHistoryPattern)initWithEventsToWatch:(id)a3 filters:(id)a4 timeInterval:(double)a5 maxNumberOfEventsInHistory:(unint64_t)a6 minNumberOfEventsInHistory:(unint64_t)a7 threshold:(double)a8
{
  id v14 = a3;
  id v15 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IRRuleHistoryPattern;
  id v16 = [(IRRuleHistoryPattern *)&v19 init];
  id v17 = v16;
  if (v16)
  {
    [(IRRuleHistoryPattern *)v16 setEventsToWatch:v14];
    [(IRRuleHistoryPattern *)v17 setFilters:v15];
    [(IRRuleHistoryPattern *)v17 setTimeInterval:a5];
    [(IRRuleHistoryPattern *)v17 setMaxNumberOfEventsInHistory:a6];
    [(IRRuleHistoryPattern *)v17 setMinNumberOfEventsInHistory:a7];
    [(IRRuleHistoryPattern *)v17 setThreshold:a8];
  }

  return v17;
}

- (NSSet)eventsToWatch
{
  return self->_eventsToWatch;
}

- (void)setEventsToWatch:(id)a3
{
}

- (NSSet)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
}

- (unint64_t)maxNumberOfEventsInHistory
{
  return self->_maxNumberOfEventsInHistory;
}

- (void)setMaxNumberOfEventsInHistory:(unint64_t)a3
{
  self->_maxNumberOfEventsInHistory = a3;
}

- (unint64_t)minNumberOfEventsInHistory
{
  return self->_minNumberOfEventsInHistory;
}

- (void)setMinNumberOfEventsInHistory:(unint64_t)a3
{
  self->_minNumberOfEventsInHistory = a3;
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

- (BOOL)calculateScoreWithoutPortion
{
  return self->_calculateScoreWithoutPortion;
}

- (void)setCalculateScoreWithoutPortion:(BOOL)a3
{
  self->_calculateScoreWithoutPortion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);

  objc_storeStrong((id *)&self->_eventsToWatch, 0);
}

@end
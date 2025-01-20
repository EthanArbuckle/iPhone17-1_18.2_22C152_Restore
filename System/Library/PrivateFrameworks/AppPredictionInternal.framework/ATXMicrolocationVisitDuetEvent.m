@interface ATXMicrolocationVisitDuetEvent
- (ATXMicrolocationVisitDuetEvent)initWithCurrentContextStoreValues;
- (ATXMicrolocationVisitDuetEvent)initWithCurrentContextStoreValuesWithTwoHourLimit:(BOOL)a3;
- (ATXMicrolocationVisitDuetEvent)initWithDKEvent:(id)a3;
- (ATXMicrolocationVisitDuetEvent)initWithDominantMicrolocationUUID:(id)a3 microlocationProbabilities:(id)a4 startDate:(id)a5 endDate:(id)a6;
- (NSDictionary)microlocationUUIDProbabilities;
- (NSUUID)dominantMicrolocationUUID;
- (id)description;
- (id)identifier;
@end

@implementation ATXMicrolocationVisitDuetEvent

- (ATXMicrolocationVisitDuetEvent)initWithDominantMicrolocationUUID:(id)a3 microlocationProbabilities:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXMicrolocationVisitDuetEvent;
  v13 = [(ATXDuetEvent *)&v16 initWithStartDate:a5 endDate:a6];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_dominantMicrolocationUUID, a3);
    objc_storeStrong((id *)&v14->_microlocationUUIDProbabilities, a4);
  }

  return v14;
}

- (ATXMicrolocationVisitDuetEvent)initWithDKEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"ATXMicrolocationVisitDuetEvent.m", 38, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  v6 = [v5 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F29128]);
    v9 = [v5 value];
    v10 = [v9 stringValue];
    id v11 = [v8 initWithUUIDString:v10];

    id v12 = [v5 metadata];
    v13 = [MEMORY[0x1E4F5B588] probabilityVector];
    v14 = [v12 objectForKeyedSubscript:v13];

    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v18 = __atxlog_handle_default();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[ATXMicrolocationVisitDuetEvent initWithDKEvent:]((uint64_t)v14, v18);
        }
        goto LABEL_15;
      }
      if (v11)
      {
        v15 = [v5 startDate];
        objc_super v16 = [v5 endDate];
        self = [(ATXMicrolocationVisitDuetEvent *)self initWithDominantMicrolocationUUID:v11 microlocationProbabilities:v14 startDate:v15 endDate:v16];

        v17 = self;
LABEL_16:

        goto LABEL_17;
      }
    }
    v18 = __atxlog_handle_default();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      [(ATXMicrolocationVisitDuetEvent *)(uint64_t)v11 initWithDKEvent:v18];
    }
LABEL_15:

    v17 = 0;
    goto LABEL_16;
  }
  id v11 = __atxlog_handle_default();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[ATXNowPlayingDuetEvent initWithDKEvent:].cold.5(v5, v11);
  }
  v17 = 0;
LABEL_17:

  return v17;
}

- (ATXMicrolocationVisitDuetEvent)initWithCurrentContextStoreValues
{
  return [(ATXMicrolocationVisitDuetEvent *)self initWithCurrentContextStoreValuesWithTwoHourLimit:1];
}

- (ATXMicrolocationVisitDuetEvent)initWithCurrentContextStoreValuesWithTwoHourLimit:(BOOL)a3
{
  BOOL v3 = a3;
  v40[1] = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F5B5F8] microLocationVisitStream];
  v40[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];

  v7 = [MEMORY[0x1E4F5B5D0] startDateSortDescriptorAscending:0];
  v39 = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];

  v9 = (void *)MEMORY[0x1E4F5B518];
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"confidence >= %@", &unk_1F27F3CA8];
  id v11 = [v9 eventQueryWithPredicate:v10 eventStreams:v6 offset:0 limit:1 sortDescriptors:v8];

  [v11 setExecuteConcurrently:1];
  id v12 = __atxlog_handle_default();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v11 eventStreams];
    v14 = [v13 firstObject];
    v15 = [v14 name];
    *(_DWORD *)buf = 138543874;
    double v34 = *(double *)&v15;
    __int16 v35 = 2080;
    v36 = "-[ATXMicrolocationVisitDuetEvent initWithCurrentContextStoreValuesWithTwoHourLimit:]";
    __int16 v37 = 2112;
    v38 = v11;
    _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "Duet query: %{public}@, %s, %@", buf, 0x20u);
  }
  objc_super v16 = [MEMORY[0x1E4F5B560] knowledgeStore];
  id v32 = 0;
  v17 = [v16 executeQuery:v11 error:&v32];
  id v18 = v32;

  if (v18)
  {
    v19 = __atxlog_handle_default();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ATXMicrolocationVisitDuetEvent initWithCurrentContextStoreValuesWithTwoHourLimit:]((uint64_t)v18, v19);
    }
  }
  else
  {
    v19 = [v17 firstObject];
    if (v19)
    {
      v20 = objc_opt_new();
      [v20 timeIntervalSince1970];
      double v22 = v21;
      v23 = [v19 startDate];
      [v23 timeIntervalSince1970];
      double v25 = v24;

      if (!v3 || (double v26 = v22 - v25, v26 <= 2.0))
      {
        self = [(ATXMicrolocationVisitDuetEvent *)self initWithDKEvent:v19];
        v30 = self;
        goto LABEL_15;
      }
      v27 = __atxlog_handle_default();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v34 = v26;
        _os_log_impl(&dword_1D0FA3000, v27, OS_LOG_TYPE_DEFAULT, "Skipping microlocation event because it happened too long ago (%.2f seconds ago)", buf, 0xCu);
      }
    }
    else
    {
      v27 = __atxlog_handle_default();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        *(_DWORD *)buf = 138412290;
        double v34 = *(double *)&v29;
        _os_log_impl(&dword_1D0FA3000, v27, OS_LOG_TYPE_DEFAULT, "%@ - No microlocation event found.", buf, 0xCu);
      }
    }
  }
  v30 = 0;
LABEL_15:

  return v30;
}

- (id)identifier
{
  BOOL v3 = [(ATXDuetEvent *)self startDate];
  uint64_t v4 = +[_ATXActionUtils localHourOfDayFromDate:v3];

  id v5 = @"6_to_12";
  v6 = @"18_to_24";
  if ((unint64_t)v4 < 0x12) {
    v6 = @"12_to_18";
  }
  if ((unint64_t)v4 >= 0xC) {
    id v5 = v6;
  }
  if (v4 >= 6) {
    v7 = v5;
  }
  else {
    v7 = @"0_to_6";
  }
  id v8 = (void *)[[NSString alloc] initWithFormat:@"Microlocation_%@_%@", self->_dominantMicrolocationUUID, v7];
  return v8;
}

- (id)description
{
  id v3 = [NSString alloc];
  dominantMicrolocationUUID = self->_dominantMicrolocationUUID;
  id v5 = [(ATXDuetEvent *)self startDate];
  v6 = [(ATXDuetEvent *)self endDate];
  v7 = (void *)[v3 initWithFormat:@"Dominant microlocation: %@, start date: %@, end date: %@", dominantMicrolocationUUID, v5, v6];

  return v7;
}

- (NSUUID)dominantMicrolocationUUID
{
  return self->_dominantMicrolocationUUID;
}

- (NSDictionary)microlocationUUIDProbabilities
{
  return self->_microlocationUUIDProbabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_microlocationUUIDProbabilities, 0);
  objc_storeStrong((id *)&self->_dominantMicrolocationUUID, 0);
}

- (void)initWithDKEvent:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "While fetching microlocations, dominantMicrolocationUUID (%@) or microlocationUUIDProbabilities (%@) was nil.", (uint8_t *)&v3, 0x16u);
}

- (void)initWithDKEvent:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Value for metadata key for Microlocation 'probabilityVector' is not an NSDictionary, %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithCurrentContextStoreValuesWithTwoHourLimit:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Error fetching latest microlocation %@", (uint8_t *)&v2, 0xCu);
}

@end
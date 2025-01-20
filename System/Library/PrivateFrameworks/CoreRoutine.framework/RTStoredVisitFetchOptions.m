@interface RTStoredVisitFetchOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)ascending;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFetchOptions:(id)a3;
- (BOOL)labelVisit;
- (NSDateInterval)dateInterval;
- (NSNumber)confidence;
- (NSNumber)limit;
- (NSSet)sources;
- (RTStoredVisitFetchOptions)init;
- (RTStoredVisitFetchOptions)initWithAscending:(BOOL)a3 confidence:(id)a4 dateInterval:(id)a5 labelVisit:(BOOL)a6 limit:(id)a7;
- (RTStoredVisitFetchOptions)initWithAscending:(BOOL)a3 confidence:(id)a4 dateInterval:(id)a5 labelVisit:(BOOL)a6 limit:(id)a7 sources:(id)a8;
- (RTStoredVisitFetchOptions)initWithAscending:(BOOL)a3 confidence:(id)a4 dateInterval:(id)a5 limit:(id)a6;
- (RTStoredVisitFetchOptions)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDateInterval:(id)a3;
@end

@implementation RTStoredVisitFetchOptions

- (NSSet)sources
{
  return self->_sources;
}

- (NSNumber)limit
{
  return self->_limit;
}

- (NSNumber)confidence
{
  return self->_confidence;
}

- (RTStoredVisitFetchOptions)initWithAscending:(BOOL)a3 confidence:(id)a4 dateInterval:(id)a5 labelVisit:(BOOL)a6 limit:(id)a7 sources:(id)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (v15)
  {
    [v15 doubleValue];
    if (v19 != 0.0)
    {
      [v15 doubleValue];
      if (v20 != 1.0)
      {
        v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v27 = "Invalid parameter not satisfying: !confidence || (confidence && (confidence.doubleValue == RTVisitConfid"
                "enceLow || confidence.doubleValue == RTVisitConfidenceHigh))";
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
  }
  if (v17 && ![v17 unsignedIntegerValue])
  {
    v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v27 = "Invalid parameter not satisfying: !limit || (limit && limit.unsignedIntegerValue > 0)";
      goto LABEL_17;
    }
LABEL_18:

    v25 = 0;
    goto LABEL_19;
  }
  if (v18 && !+[RTVisit validVisitSources:v18])
  {
    v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v27 = "Invalid parameter not satisfying: !sources || (sources && [RTVisit validVisitSources:sources])";
LABEL_17:
      _os_log_error_impl(&dword_1A8FEF000, v26, OS_LOG_TYPE_ERROR, v27, buf, 2u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  v29.receiver = self;
  v29.super_class = (Class)RTStoredVisitFetchOptions;
  v21 = [(RTStoredVisitFetchOptions *)&v29 init];
  v22 = v21;
  if (v21)
  {
    v21->_ascending = a3;
    objc_storeStrong((id *)&v21->_confidence, a4);
    objc_storeStrong((id *)&v22->_dateInterval, a5);
    v22->_labelVisit = a6;
    objc_storeStrong((id *)&v22->_limit, a7);
    uint64_t v23 = [v18 copy];
    sources = v22->_sources;
    v22->_sources = (NSSet *)v23;
  }
  self = v22;
  v25 = self;
LABEL_19:

  return v25;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_confidence, 0);
}

- (RTStoredVisitFetchOptions)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAscending_confidence_dateInterval_labelVisit_limit_sources_);
}

- (RTStoredVisitFetchOptions)initWithAscending:(BOOL)a3 confidence:(id)a4 dateInterval:(id)a5 limit:(id)a6
{
  return [(RTStoredVisitFetchOptions *)self initWithAscending:a3 confidence:a4 dateInterval:a5 labelVisit:0 limit:a6];
}

- (RTStoredVisitFetchOptions)initWithAscending:(BOOL)a3 confidence:(id)a4 dateInterval:(id)a5 labelVisit:(BOOL)a6 limit:(id)a7
{
  BOOL v7 = a6;
  BOOL v10 = a3;
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = [v12 setWithObject:&unk_1EFF91AA8];
  id v17 = [(RTStoredVisitFetchOptions *)self initWithAscending:v10 confidence:v15 dateInterval:v14 labelVisit:v7 limit:v13 sources:v16];

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  BOOL ascending = self->_ascending;
  id v8 = a3;
  v6 = [v4 numberWithBool:ascending];
  [v8 encodeObject:v6 forKey:@"ascending"];

  [v8 encodeObject:self->_confidence forKey:@"confidence"];
  [v8 encodeObject:self->_dateInterval forKey:@"dateInterval"];
  BOOL v7 = [NSNumber numberWithBool:self->_labelVisit];
  [v8 encodeObject:v7 forKey:@"labelVisit"];

  [v8 encodeObject:self->_limit forKey:@"limit"];
  [v8 encodeObject:self->_sources forKey:@"sources"];
}

- (RTStoredVisitFetchOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ascending"];
  uint64_t v6 = [v5 BOOLValue];

  BOOL v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confidence"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"labelVisit"];
  uint64_t v10 = [v9 BOOLValue];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"limit"];
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  id v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  id v15 = [v4 decodeObjectOfClasses:v14 forKey:@"sources"];

  id v16 = [(RTStoredVisitFetchOptions *)self initWithAscending:v6 confidence:v7 dateInterval:v8 labelVisit:v10 limit:v11 sources:v15];
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTStoredVisitFetchOptions *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTStoredVisitFetchOptions *)self isEqualToFetchOptions:v5];

  return v6;
}

- (BOOL)isEqualToFetchOptions:(id)a3
{
  id v6 = a3;
  int ascending = self->_ascending;
  int v8 = [v6 ascending];
  confidence = self->_confidence;
  if (!confidence)
  {
    v3 = [v6 confidence];
    if (v3)
    {
      if (self->_confidence) {
        goto LABEL_2;
      }
      char v49 = 0;
    }
    else
    {
      char v49 = 1;
    }
LABEL_11:

    goto LABEL_12;
  }
LABEL_2:
  uint64_t v10 = [v6 confidence];
  if (v10)
  {
    id v4 = (void *)v10;
    v11 = self->_confidence;
    v12 = [v6 confidence];
    char v49 = [(NSNumber *)v11 isEqualToNumber:v12];

    if (!confidence) {
      goto LABEL_11;
    }
  }
  else
  {
    char v49 = 0;
    if (!confidence) {
      goto LABEL_11;
    }
  }
LABEL_12:
  dateInterval = self->_dateInterval;
  int v50 = v8;
  if (dateInterval) {
    goto LABEL_13;
  }
  id v4 = [v6 dateInterval];
  if (!v4)
  {
    char v18 = 1;
    goto LABEL_22;
  }
  if (self->_dateInterval)
  {
LABEL_13:
    uint64_t v14 = [v6 dateInterval];
    if (v14)
    {
      id v15 = (void *)v14;
      id v16 = self->_dateInterval;
      id v17 = [v6 dateInterval];
      char v18 = [(NSDateInterval *)v16 isEqualToDateInterval:v17];

      if (dateInterval) {
        goto LABEL_23;
      }
    }
    else
    {
      char v18 = 0;
      if (dateInterval) {
        goto LABEL_23;
      }
    }
  }
  else
  {
    char v18 = 0;
  }
LABEL_22:

LABEL_23:
  int labelVisit = self->_labelVisit;
  int v20 = [v6 labelVisit];
  limit = self->_limit;
  if (limit) {
    goto LABEL_24;
  }
  uint64_t v31 = [v6 limit];
  if (!v31)
  {
    v48 = 0;
    char v30 = 1;
    goto LABEL_33;
  }
  v48 = (void *)v31;
  if (!self->_limit)
  {
    char v30 = 0;
LABEL_33:

    goto LABEL_34;
  }
LABEL_24:
  uint64_t v22 = objc_msgSend(v6, "limit", v48);
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    v24 = self->_limit;
    [v6 limit];
    int v25 = v20;
    int v26 = labelVisit;
    char v27 = v18;
    objc_super v29 = v28 = ascending;
    char v30 = [(NSNumber *)v24 isEqualToNumber:v29];

    int ascending = v28;
    char v18 = v27;
    int labelVisit = v26;
    int v20 = v25;

    if (!limit) {
      goto LABEL_33;
    }
  }
  else
  {
    char v30 = 0;
    if (!limit) {
      goto LABEL_33;
    }
  }
LABEL_34:
  sources = self->_sources;
  if (sources) {
    goto LABEL_35;
  }
  uint64_t v43 = [v6 sources];
  if (!v43)
  {
    v48 = 0;
    char v42 = 1;
    goto LABEL_44;
  }
  v48 = (void *)v43;
  if (self->_sources)
  {
LABEL_35:
    uint64_t v33 = objc_msgSend(v6, "sources", v48);
    if (v33)
    {
      v34 = (void *)v33;
      v35 = self->_sources;
      [v6 sources];
      char v36 = v30;
      int v37 = v20;
      int v38 = labelVisit;
      char v39 = v18;
      v41 = int v40 = ascending;
      char v42 = [(NSSet *)v35 isEqual:v41];

      int ascending = v40;
      char v18 = v39;
      int labelVisit = v38;
      int v20 = v37;
      char v30 = v36;

      if (sources) {
        goto LABEL_45;
      }
    }
    else
    {
      char v42 = 0;
      if (sources) {
        goto LABEL_45;
      }
    }
  }
  else
  {
    char v42 = 0;
  }
LABEL_44:

LABEL_45:
  char v44 = v49;
  if (ascending != v50) {
    char v44 = 0;
  }
  char v45 = v44 & v18;
  if (labelVisit != v20) {
    char v45 = 0;
  }
  char v46 = v45 & v30 & v42;

  return v46;
}

- (unint64_t)hash
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [NSNumber numberWithBool:self->_ascending];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(NSNumber *)self->_confidence hash];
  uint64_t v6 = v5 ^ [(NSDateInterval *)self->_dateInterval hash] ^ v4;
  BOOL v7 = [NSNumber numberWithBool:self->_labelVisit];
  uint64_t v8 = [v7 hash];
  unint64_t v9 = v6 ^ v8 ^ [(NSNumber *)self->_limit hash];

  if ([(NSSet *)self->_sources count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = self->_sources;
    uint64_t v11 = [(NSSet *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          v9 ^= objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14++), "hash", (void)v16);
        }
        while (v12 != v14);
        uint64_t v12 = [(NSSet *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
  return v9;
}

- (id)description
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  if (self->_ascending) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  confidence = self->_confidence;
  uint64_t v6 = [(NSDateInterval *)self->_dateInterval startDate];
  BOOL v7 = [v6 stringFromDate];
  uint64_t v8 = [(NSDateInterval *)self->_dateInterval endDate];
  uint64_t v9 = [v8 stringFromDate];
  uint64_t v10 = (void *)v9;
  if (self->_labelVisit) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  uint64_t v12 = [v3 stringWithFormat:@"ascending, %@, confidence, %@, startDate, %@, endDate, %@, labelVisit, %@, limit, %@", v4, confidence, v7, v9, v11, self->_limit];

  if ([(NSSet *)self->_sources count])
  {
    [v12 appendString:@", sources, ["];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v13 = self->_sources;
    uint64_t v14 = [(NSSet *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = [NSString stringWithFormat:@"%@, ", *(void *)(*((void *)&v20 + 1) + 8 * i)];
          [v12 appendString:v18];
        }
        uint64_t v15 = [(NSSet *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v15);
    }

    objc_msgSend(v12, "deleteCharactersInRange:", objc_msgSend(v12, "length") - 2, 2);
    [v12 appendString:@"]"];
  }
  return v12;
}

- (void)setDateInterval:(id)a3
{
}

- (BOOL)labelVisit
{
  return self->_labelVisit;
}

@end
@interface RTProximityEvent
+ (BOOL)supportsSecureCoding;
+ (id)convertContactFrequencyToString:(int64_t)a3;
+ (id)convertContactRecencyToString:(int64_t)a3;
+ (id)convertContactSignificanceToString:(int64_t)a3;
+ (id)convertPersonRelationshipToString:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)combinedFrequencyScores;
- (NSArray)combinedRecencyScores;
- (NSArray)combinedSignificanceScores;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSUUID)eventID;
- (RTProximityEvent)init;
- (RTProximityEvent)initWithCoder:(id)a3;
- (RTProximityEvent)initWithEventID:(id)a3 startDate:(id)a4 endDate:(id)a5 relationship:(int64_t)a6 socialScore:(double)a7 combinedFrequencyScores:(id)a8 combinedRecencyScores:(id)a9 combinedSignificanceScores:(id)a10;
- (double)socialScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionDictionary;
- (int64_t)relationship;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTProximityEvent

- (RTProximityEvent)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithEventID_startDate_endDate_relationship_socialScore_combinedFrequencyScores_combinedRecencyScores_combinedSignificanceScores_);
}

- (RTProximityEvent)initWithEventID:(id)a3 startDate:(id)a4 endDate:(id)a5 relationship:(int64_t)a6 socialScore:(double)a7 combinedFrequencyScores:(id)a8 combinedRecencyScores:(id)a9 combinedSignificanceScores:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v35 = a8;
  id v34 = a9;
  id v20 = a10;
  if (v17)
  {
    id v32 = v20;
    id v33 = v18;
    if (v18)
    {
      v36.receiver = self;
      v36.super_class = (Class)RTProximityEvent;
      v21 = [(RTProximityEvent *)&v36 init];
      v22 = v21;
      if (v21)
      {
        objc_storeStrong((id *)&v21->_eventID, a3);
        objc_storeStrong((id *)&v22->_startDate, a4);
        objc_storeStrong((id *)&v22->_endDate, a5);
        v22->_relationship = a6;
        v22->_socialScore = a7;
        objc_storeStrong((id *)&v22->_combinedFrequencyScores, a8);
        objc_storeStrong((id *)&v22->_combinedRecencyScores, a9);
        objc_storeStrong((id *)&v22->_combinedSignificanceScores, a10);
      }
      self = v22;
      v23 = self;
      v24 = v33;
      v25 = v34;
      v26 = v35;
    }
    else
    {
      v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v25 = v34;
      v26 = v35;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A8FEF000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
      }

      v23 = 0;
      v24 = 0;
    }
    v27 = v32;
  }
  else
  {
    v27 = v20;
    v24 = v18;
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventID", buf, 2u);
    }

    v23 = 0;
    v25 = v34;
    v26 = v35;
  }

  return v23;
}

+ (id)convertPersonRelationshipToString:(int64_t)a3
{
  v3 = @"Unknown";
  if (a3 == 1) {
    v3 = @"Family";
  }
  if (a3 == 2) {
    return @"Friend";
  }
  else {
    return v3;
  }
}

+ (id)convertContactFrequencyToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_1E5D74788[a3 - 1];
  }
}

+ (id)convertContactRecencyToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_1E5D747A0[a3 - 1];
  }
}

+ (id)convertContactSignificanceToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_1E5D747A0[a3 - 1];
  }
}

- (BOOL)isEqual:(id)a3
{
  v5 = (RTProximityEvent *)a3;
  if (v5 == self)
  {
    BOOL v11 = 1;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v11 = 0;
    goto LABEL_18;
  }
  v6 = v5;
  v7 = [(RTProximityEvent *)self endDate];
  if (!v7)
  {
    v3 = [(RTProximityEvent *)v6 endDate];
    if (!v3)
    {
      int v10 = 1;
LABEL_10:

      goto LABEL_11;
    }
  }
  v8 = [(RTProximityEvent *)self endDate];
  v9 = [(RTProximityEvent *)v6 endDate];
  int v10 = [v8 isEqualToDate:v9];

  if (!v7) {
    goto LABEL_10;
  }
LABEL_11:

  v12 = [(RTProximityEvent *)self eventID];
  v13 = [(RTProximityEvent *)v6 eventID];
  if ([v12 isEqual:v13])
  {
    v14 = [(RTProximityEvent *)self startDate];
    v15 = [(RTProximityEvent *)v6 startDate];
    if (([v14 isEqualToDate:v15] & v10) == 1)
    {
      int64_t v16 = [(RTProximityEvent *)self relationship];
      BOOL v11 = v16 == [(RTProximityEvent *)v6 relationship];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

LABEL_18:
  return v11;
}

- (id)descriptionDictionary
{
  v3 = objc_opt_new();
  v4 = [(NSUUID *)self->_eventID UUIDString];
  [v3 setObject:v4 forKey:@"EventID"];

  startDate = self->_startDate;
  if (startDate)
  {
    v6 = [(NSDate *)startDate getFormattedDateString];
    [v3 setObject:v6 forKey:@"StartDate"];
  }
  else
  {
    [v3 setObject:@"-" forKey:@"StartDate"];
  }
  endDate = self->_endDate;
  if (endDate)
  {
    v8 = [(NSDate *)endDate getFormattedDateString];
    [v3 setObject:v8 forKey:@"EndDate"];
  }
  else
  {
    [v3 setObject:@"-" forKey:@"EndDate"];
  }
  v9 = [NSNumber numberWithDouble:self->_socialScore];
  int v10 = [v9 stringValue];
  [v3 setObject:v10 forKey:@"SocialScore"];

  BOOL v11 = [(id)objc_opt_class() convertPersonRelationshipToString:self->_relationship];
  [v3 setObject:v11 forKey:@"Relationship"];

  v12 = [(RTProximityEvent *)self combinedFrequencyScores];

  if (v12)
  {
    v13 = [(RTProximityEvent *)self combinedFrequencyScores];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      unint64_t v15 = 0;
      do
      {
        int64_t v16 = [(id)objc_opt_class() convertContactFrequencyToString:v15];
        id v17 = [(RTProximityEvent *)self combinedFrequencyScores];
        id v18 = [v17 objectAtIndexedSubscript:v15];
        int v19 = [v18 intValue];

        if (v19 >= 1)
        {
          id v20 = [(RTProximityEvent *)self combinedFrequencyScores];
          v21 = [v20 objectAtIndexedSubscript:v15];
          v22 = [v21 stringValue];
          v23 = [NSString stringWithFormat:@"Frequency:%@", v16];
          [v3 setObject:v22 forKey:v23];
        }
        ++v15;
        v24 = [(RTProximityEvent *)self combinedFrequencyScores];
        unint64_t v25 = [v24 count];
      }
      while (v25 > v15);
    }
  }
  v26 = [(RTProximityEvent *)self combinedRecencyScores];

  if (v26)
  {
    v27 = [(RTProximityEvent *)self combinedRecencyScores];
    uint64_t v28 = [v27 count];

    if (v28)
    {
      unint64_t v29 = 0;
      do
      {
        v30 = +[RTProximityEvent convertContactRecencyToString:v29];
        v31 = [(RTProximityEvent *)self combinedRecencyScores];
        id v32 = [v31 objectAtIndexedSubscript:v29];
        int v33 = [v32 intValue];

        if (v33 >= 1)
        {
          id v34 = [(RTProximityEvent *)self combinedRecencyScores];
          id v35 = [v34 objectAtIndexedSubscript:v29];
          objc_super v36 = [v35 stringValue];
          v37 = [NSString stringWithFormat:@"Recency:%@", v30];
          [v3 setObject:v36 forKey:v37];
        }
        ++v29;
        v38 = [(RTProximityEvent *)self combinedRecencyScores];
        unint64_t v39 = [v38 count];
      }
      while (v39 > v29);
    }
  }
  v40 = [(RTProximityEvent *)self combinedSignificanceScores];

  if (v40)
  {
    v41 = [(RTProximityEvent *)self combinedSignificanceScores];
    uint64_t v42 = [v41 count];

    if (v42)
    {
      unint64_t v43 = 0;
      do
      {
        v44 = +[RTProximityEvent convertContactSignificanceToString:v43];
        v45 = [(RTProximityEvent *)self combinedSignificanceScores];
        v46 = [v45 objectAtIndexedSubscript:v43];
        int v47 = [v46 intValue];

        if (v47 >= 1)
        {
          v48 = [(RTProximityEvent *)self combinedSignificanceScores];
          v49 = [v48 objectAtIndexedSubscript:v43];
          v50 = [v49 stringValue];
          v51 = [NSString stringWithFormat:@"Significance:%@", v44];
          [v3 setObject:v50 forKey:v51];
        }
        ++v43;
        v52 = [(RTProximityEvent *)self combinedSignificanceScores];
        unint64_t v53 = [v52 count];
      }
      while (v53 > v43);
    }
  }
  return v3;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(RTProximityEvent *)self descriptionDictionary];
  id v11 = 0;
  v3 = [MEMORY[0x1E4F28D90] JSONStringFromNSDictionary:v2 error:&v11];
  id v4 = v11;
  if (v4)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      int v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl(&dword_1A8FEF000, v5, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", buf, 0x16u);
    }
    id v6 = [NSString string];
  }
  else
  {
    id v6 = v3;
  }
  v7 = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(RTProximityEvent *)self eventID];
  id v6 = [(RTProximityEvent *)self startDate];
  v7 = [(RTProximityEvent *)self endDate];
  int64_t v8 = [(RTProximityEvent *)self relationship];
  [(RTProximityEvent *)self socialScore];
  double v10 = v9;
  id v11 = [(RTProximityEvent *)self combinedFrequencyScores];
  v12 = [(RTProximityEvent *)self combinedRecencyScores];
  v13 = [(RTProximityEvent *)self combinedSignificanceScores];
  __int16 v14 = (void *)[v4 initWithEventID:v5 startDate:v6 endDate:v7 relationship:v8 socialScore:v11 combinedFrequencyScores:v12 combinedRecencyScores:v10 combinedSignificanceScores:v13];

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTProximityEvent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  int64_t v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"EventID"];
  double v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"StartDate"];
  double v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"EndDate"];
  uint64_t v11 = [v5 decodeInt64ForKey:@"Relationship"];
  [v5 decodeDoubleForKey:@"SocialScore"];
  double v13 = v12;
  __int16 v14 = [v5 decodeObjectOfClasses:v7 forKey:@"CombinedFrequency"];
  id v15 = [v5 decodeObjectOfClasses:v7 forKey:@"CombinedRecency"];
  uint64_t v16 = [v5 decodeObjectOfClasses:v7 forKey:@"ContactSignificance"];

  id v17 = [(RTProximityEvent *)self initWithEventID:v8 startDate:v9 endDate:v10 relationship:v11 socialScore:v14 combinedFrequencyScores:v15 combinedRecencyScores:v13 combinedSignificanceScores:v16];
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  eventID = self->_eventID;
  id v5 = a3;
  [v5 encodeObject:eventID forKey:@"EventID"];
  [v5 encodeObject:self->_startDate forKey:@"StartDate"];
  [v5 encodeObject:self->_endDate forKey:@"EndDate"];
  [v5 encodeInt64:self->_relationship forKey:@"Relationship"];
  [v5 encodeDouble:@"SocialScore" forKey:self->_socialScore];
  [v5 encodeObject:self->_combinedFrequencyScores forKey:@"CombinedFrequency"];
  [v5 encodeObject:self->_combinedRecencyScores forKey:@"CombinedRecency"];
  [v5 encodeObject:self->_combinedSignificanceScores forKey:@"ContactSignificance"];
}

- (NSUUID)eventID
{
  return self->_eventID;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (double)socialScore
{
  return self->_socialScore;
}

- (NSArray)combinedFrequencyScores
{
  return self->_combinedFrequencyScores;
}

- (NSArray)combinedRecencyScores
{
  return self->_combinedRecencyScores;
}

- (NSArray)combinedSignificanceScores
{
  return self->_combinedSignificanceScores;
}

- (int64_t)relationship
{
  return self->_relationship;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedSignificanceScores, 0);
  objc_storeStrong((id *)&self->_combinedRecencyScores, 0);
  objc_storeStrong((id *)&self->_combinedFrequencyScores, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
}

@end
@interface RTContactScore
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)contactID;
- (RTContactScore)init;
- (RTContactScore)initWithCoder:(id)a3;
- (RTContactScore)initWithContactID:(id)a3 frequencyScore:(double)a4 recencyScore:(double)a5 significanceScore:(double)a6 frequencyCount:(unint64_t)a7 runningMean:(double)a8 runningMeanOfSquares:(double)a9;
- (double)frequencyScore;
- (double)recencyScore;
- (double)runningMean;
- (double)runningMeanOfSquares;
- (double)significanceScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionDictionary;
- (unint64_t)frequencyCount;
- (void)encodeWithCoder:(id)a3;
- (void)mergeWithAnotherContactScore:(id)a3;
- (void)setFrequencyCount:(unint64_t)a3;
- (void)setFrequencyScore:(double)a3;
- (void)setRecencyScore:(double)a3;
- (void)setRunningMean:(double)a3;
- (void)setRunningMeanOfSquares:(double)a3;
- (void)setSignificanceScore:(double)a3;
@end

@implementation RTContactScore

- (RTContactScore)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithContactID_frequencyScore_recencyScore_significanceScore_frequencyCount_runningMean_runningMeanOfSquares_);
}

- (RTContactScore)initWithContactID:(id)a3 frequencyScore:(double)a4 recencyScore:(double)a5 significanceScore:(double)a6 frequencyCount:(unint64_t)a7 runningMean:(double)a8 runningMeanOfSquares:(double)a9
{
  id v17 = a3;
  if (v17)
  {
    v23.receiver = self;
    v23.super_class = (Class)RTContactScore;
    v18 = [(RTContactScore *)&v23 init];
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_contactID, a3);
      v19->_frequencyScore = a4;
      v19->_recencyScore = a5;
      v19->_significanceScore = a6;
      v19->_frequencyCount = a7;
      v19->_runningMean = a8;
      v19->_runningMeanOfSquares = a9;
    }
    self = v19;
    v20 = self;
  }
  else
  {
    v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactID", buf, 2u);
    }

    v20 = 0;
  }

  return v20;
}

- (void)mergeWithAnotherContactScore:(id)a3
{
  id v4 = a3;
  contactID = self->_contactID;
  id v12 = v4;
  v6 = [v4 contactID];

  if (contactID == v6)
  {
    self->_frequencyCount += [v12 frequencyCount];
    [v12 frequencyScore];
    self->_frequencyScore = v7;
    [v12 recencyScore];
    self->_recencyScore = v8;
    [v12 significanceScore];
    self->_significanceScore = v9;
    [v12 runningMean];
    self->_runningMean = v10;
    [v12 runningMeanOfSquares];
    self->_runningMeanOfSquares = v11;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTContactScore *)a3;
  if (v4 == self)
  {
    BOOL v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(RTContactScore *)self contactID];
      double v7 = [(RTContactScore *)v5 contactID];
      if ([v6 isEqual:v7]
        && ([(RTContactScore *)self frequencyScore],
            double v9 = v8,
            [(RTContactScore *)v5 frequencyScore],
            v9 == v10)
        && ([(RTContactScore *)self recencyScore],
            double v12 = v11,
            [(RTContactScore *)v5 recencyScore],
            v12 == v13))
      {
        [(RTContactScore *)self significanceScore];
        double v15 = v14;
        [(RTContactScore *)v5 significanceScore];
        BOOL v17 = v15 == v16;
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }

  return v17;
}

- (id)descriptionDictionary
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v9[0] = self->_contactID;
  v8[0] = @"ContactID";
  v8[1] = @"FrequencyScore";
  v3 = [NSNumber numberWithDouble:self->_frequencyScore];
  v9[1] = v3;
  v8[2] = @"RecencyScore";
  id v4 = [NSNumber numberWithDouble:self->_recencyScore];
  v9[2] = v4;
  v8[3] = @"SignificanceScore";
  v5 = [NSNumber numberWithDouble:self->_significanceScore];
  v9[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(RTContactScore *)self descriptionDictionary];
  id v11 = 0;
  v3 = [MEMORY[0x1E4F28D90] JSONStringFromNSDictionary:v2 error:&v11];
  id v4 = v11;
  if (v4)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      double v9 = (objc_class *)objc_opt_class();
      double v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138412546;
      double v13 = v10;
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
  double v7 = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  contactID = self->_contactID;
  double frequencyScore = self->_frequencyScore;
  double recencyScore = self->_recencyScore;
  double significanceScore = self->_significanceScore;
  unint64_t frequencyCount = self->_frequencyCount;
  double runningMean = self->_runningMean;
  double runningMeanOfSquares = self->_runningMeanOfSquares;
  return (id)[v4 initWithContactID:contactID frequencyScore:frequencyCount recencyScore:frequencyScore significanceScore:recencyScore frequencyCount:significanceScore runningMean:runningMean runningMeanOfSquares:runningMeanOfSquares];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTContactScore)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ContactID"];
  [v4 decodeDoubleForKey:@"FrequencyScore"];
  double v7 = v6;
  [v4 decodeDoubleForKey:@"RecencyScore"];
  double v9 = v8;
  [v4 decodeDoubleForKey:@"SignificanceScore"];
  double v11 = v10;
  uint64_t v12 = [v4 decodeIntegerForKey:@"FrequencyCount"];
  [v4 decodeDoubleForKey:@"RunningMean"];
  double v14 = v13;
  [v4 decodeDoubleForKey:@"RunningMeanOfSquares"];
  double v16 = v15;

  BOOL v17 = [(RTContactScore *)self initWithContactID:v5 frequencyScore:v12 recencyScore:v7 significanceScore:v9 frequencyCount:v11 runningMean:v14 runningMeanOfSquares:v16];
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  contactID = self->_contactID;
  id v5 = a3;
  [v5 encodeObject:contactID forKey:@"ContactID"];
  [v5 encodeDouble:@"FrequencyScore" forKey:self->_frequencyScore];
  [v5 encodeDouble:@"RecencyScore" forKey:self->_recencyScore];
  [v5 encodeDouble:@"SignificanceScore" forKey:self->_significanceScore];
  [v5 encodeInteger:self->_frequencyCount forKey:@"FrequencyCount"];
  [v5 encodeDouble:@"RunningMean" forKey:self->_runningMean];
  [v5 encodeDouble:@"RunningMeanOfSquares" forKey:self->_runningMeanOfSquares];
}

- (NSString)contactID
{
  return self->_contactID;
}

- (double)frequencyScore
{
  return self->_frequencyScore;
}

- (void)setFrequencyScore:(double)a3
{
  self->_double frequencyScore = a3;
}

- (double)recencyScore
{
  return self->_recencyScore;
}

- (void)setRecencyScore:(double)a3
{
  self->_double recencyScore = a3;
}

- (double)significanceScore
{
  return self->_significanceScore;
}

- (void)setSignificanceScore:(double)a3
{
  self->_double significanceScore = a3;
}

- (unint64_t)frequencyCount
{
  return self->_frequencyCount;
}

- (void)setFrequencyCount:(unint64_t)a3
{
  self->_unint64_t frequencyCount = a3;
}

- (double)runningMean
{
  return self->_runningMean;
}

- (void)setRunningMean:(double)a3
{
  self->_double runningMean = a3;
}

- (double)runningMeanOfSquares
{
  return self->_runningMeanOfSquares;
}

- (void)setRunningMeanOfSquares:(double)a3
{
  self->_double runningMeanOfSquares = a3;
}

- (void).cxx_destruct
{
}

@end
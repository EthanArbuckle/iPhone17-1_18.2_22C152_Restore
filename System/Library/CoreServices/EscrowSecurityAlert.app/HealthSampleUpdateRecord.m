@interface HealthSampleUpdateRecord
+ (BOOL)supportsSecureCoding;
- (HealthSample)currentStateFirstSample;
- (HealthSample)currentStateMostRecentSample;
- (HealthSample)previousStateFirstSample;
- (HealthSample)previousStateLastSample;
- (HealthSampleUpdateRecord)initWithCoder:(id)a3;
- (HealthSampleUpdateRecord)initWithRecordType:(unint64_t)a3 initialSample:(id)a4;
- (NSDateInterval)currentStateDuration;
- (NSDateInterval)previousStateDuration;
- (NSError)currentStateError;
- (NSError)previousStateError;
- (NSNumber)currentState;
- (NSNumber)previousState;
- (id)dict;
- (id)updatedRecordWithHealthSample:(id)a3;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HealthSampleUpdateRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HealthSampleUpdateRecord)initWithRecordType:(unint64_t)a3 initialSample:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HealthSampleUpdateRecord;
  v8 = [(HealthSampleUpdateRecord *)&v13 init];
  v9 = v8;
  if (v8)
  {
    previousStateFirstSample = v8->_previousStateFirstSample;
    v8->_type = a3;
    v8->_previousStateFirstSample = 0;

    previousStateLastSample = v9->_previousStateLastSample;
    v9->_previousStateLastSample = 0;

    objc_storeStrong((id *)&v9->_currentStateFirstSample, a4);
    objc_storeStrong((id *)&v9->_currentStateMostRecentSample, a4);
  }

  return v9;
}

- (id)updatedRecordWithHealthSample:(id)a3
{
  v4 = (HealthSample *)a3;
  v5 = objc_alloc_init(HealthSampleUpdateRecord);
  v5->_type = [(HealthSampleUpdateRecord *)self type];
  v6 = [(HealthSampleUpdateRecord *)self currentStateMostRecentSample];
  unsigned int v7 = objc_msgSend(v6, "sameValueAndErrorAsHealthSample:forType:", v4, -[HealthSampleUpdateRecord type](self, "type"));

  if (v7)
  {
    uint64_t v8 = [(HealthSampleUpdateRecord *)self previousStateFirstSample];
    previousStateFirstSample = v5->_previousStateFirstSample;
    v5->_previousStateFirstSample = (HealthSample *)v8;

    uint64_t v10 = [(HealthSampleUpdateRecord *)self previousStateLastSample];
    previousStateLastSample = v5->_previousStateLastSample;
    v5->_previousStateLastSample = (HealthSample *)v10;

    v12 = [(HealthSampleUpdateRecord *)self currentStateFirstSample];
  }
  else
  {
    uint64_t v13 = [(HealthSampleUpdateRecord *)self currentStateFirstSample];
    v14 = v5->_previousStateFirstSample;
    v5->_previousStateFirstSample = (HealthSample *)v13;

    uint64_t v15 = [(HealthSampleUpdateRecord *)self currentStateMostRecentSample];
    v16 = v5->_previousStateLastSample;
    v5->_previousStateLastSample = (HealthSample *)v15;

    v12 = v4;
  }
  currentStateFirstSample = v5->_currentStateFirstSample;
  v5->_currentStateFirstSample = v12;

  currentStateMostRecentSample = v5->_currentStateMostRecentSample;
  v5->_currentStateMostRecentSample = v4;

  return v5;
}

- (HealthSampleUpdateRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HealthSampleUpdateRecord;
  v5 = [(HealthSampleUpdateRecord *)&v15 init];
  if (v5)
  {
    v5->_type = (unint64_t)[v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previousStateFirstSample"];
    previousStateFirstSample = v5->_previousStateFirstSample;
    v5->_previousStateFirstSample = (HealthSample *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previousStateLastSample"];
    previousStateLastSample = v5->_previousStateLastSample;
    v5->_previousStateLastSample = (HealthSample *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentStateFirstSample"];
    currentStateFirstSample = v5->_currentStateFirstSample;
    v5->_currentStateFirstSample = (HealthSample *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentStateMostRecentSample"];
    currentStateMostRecentSample = v5->_currentStateMostRecentSample;
    v5->_currentStateMostRecentSample = (HealthSample *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HealthSampleUpdateRecord type](self, "type"), @"type");
  v5 = [(HealthSampleUpdateRecord *)self previousStateFirstSample];
  [v4 encodeObject:v5 forKey:@"previousStateFirstSample"];

  uint64_t v6 = [(HealthSampleUpdateRecord *)self previousStateLastSample];
  [v4 encodeObject:v6 forKey:@"previousStateLastSample"];

  unsigned int v7 = [(HealthSampleUpdateRecord *)self currentStateFirstSample];
  [v4 encodeObject:v7 forKey:@"currentStateFirstSample"];

  id v8 = [(HealthSampleUpdateRecord *)self currentStateMostRecentSample];
  [v4 encodeObject:v8 forKey:@"currentStateMostRecentSample"];
}

- (NSNumber)previousState
{
  v3 = (char *)[(HealthSampleUpdateRecord *)self type] - 3;
  if ((unint64_t)v3 > 2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = (uint64_t)*(&off_1000107A0 + (void)v3);
  }
  v5 = [(HealthSampleUpdateRecord *)self previousStateLastSample];
  uint64_t v6 = [v5 valueForKeyPath:v4];

  return (NSNumber *)v6;
}

- (NSError)previousStateError
{
  v3 = sub_1000088B4([(HealthSampleUpdateRecord *)self type]);
  uint64_t v4 = [(HealthSampleUpdateRecord *)self previousStateLastSample];
  v5 = [v4 valueForKeyPath:v3];

  return (NSError *)v5;
}

- (NSDateInterval)previousStateDuration
{
  uint64_t v3 = [(HealthSampleUpdateRecord *)self previousStateFirstSample];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [(HealthSampleUpdateRecord *)self previousStateLastSample],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = objc_alloc((Class)NSDateInterval);
    unsigned int v7 = [(HealthSampleUpdateRecord *)self previousStateFirstSample];
    id v8 = [v7 timestamp];
    v9 = [(HealthSampleUpdateRecord *)self previousStateLastSample];
    uint64_t v10 = [v9 timestamp];
    id v11 = [v6 initWithStartDate:v8 endDate:v10];
  }
  else
  {
    id v11 = 0;
  }

  return (NSDateInterval *)v11;
}

- (NSNumber)currentState
{
  uint64_t v3 = (char *)[(HealthSampleUpdateRecord *)self type] - 3;
  if ((unint64_t)v3 > 2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = (uint64_t)*(&off_1000107A0 + (void)v3);
  }
  v5 = [(HealthSampleUpdateRecord *)self currentStateMostRecentSample];
  id v6 = [v5 valueForKeyPath:v4];

  return (NSNumber *)v6;
}

- (NSError)currentStateError
{
  uint64_t v3 = sub_1000088B4([(HealthSampleUpdateRecord *)self type]);
  uint64_t v4 = [(HealthSampleUpdateRecord *)self currentStateMostRecentSample];
  v5 = [v4 valueForKeyPath:v3];

  return (NSError *)v5;
}

- (NSDateInterval)currentStateDuration
{
  id v3 = objc_alloc((Class)NSDateInterval);
  uint64_t v4 = [(HealthSampleUpdateRecord *)self currentStateFirstSample];
  v5 = [v4 timestamp];
  id v6 = [(HealthSampleUpdateRecord *)self currentStateMostRecentSample];
  unsigned int v7 = [v6 timestamp];
  id v8 = [v3 initWithStartDate:v5 endDate:v7];

  return (NSDateInterval *)v8;
}

- (id)dict
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);

  return v2;
}

- (unint64_t)type
{
  return self->_type;
}

- (HealthSample)previousStateFirstSample
{
  return self->_previousStateFirstSample;
}

- (HealthSample)previousStateLastSample
{
  return self->_previousStateLastSample;
}

- (HealthSample)currentStateFirstSample
{
  return self->_currentStateFirstSample;
}

- (HealthSample)currentStateMostRecentSample
{
  return self->_currentStateMostRecentSample;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStateMostRecentSample, 0);
  objc_storeStrong((id *)&self->_currentStateFirstSample, 0);
  objc_storeStrong((id *)&self->_previousStateLastSample, 0);

  objc_storeStrong((id *)&self->_previousStateFirstSample, 0);
}

@end
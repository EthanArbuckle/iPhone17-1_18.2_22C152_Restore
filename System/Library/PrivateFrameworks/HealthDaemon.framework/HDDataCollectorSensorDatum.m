@interface HDDataCollectorSensorDatum
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HDDataCollectorSensorDatum)initWithCoder:(id)a3;
- (HDDataCollectorSensorDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 resumeContext:(id)a5;
- (HDDataCollectorSensorDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 resumeContextProvider:(id)a5;
- (NSData)resumeContext;
- (NSDateInterval)dateInterval;
- (NSString)description;
- (NSUUID)datumIdentifier;
- (id)resumeContextProvider;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDDataCollectorSensorDatum

- (HDDataCollectorSensorDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 resumeContext:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v11)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HDDataAggregator.m", 684, @"Invalid parameter not satisfying: %@", @"dateInterval != nil" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)HDDataCollectorSensorDatum;
  v13 = [(HDDataCollectorSensorDatum *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_datumIdentifier, a3);
    objc_storeStrong((id *)&v14->_dateInterval, a4);
    objc_storeStrong((id *)&v14->_resumeContext, a5);
  }

  return v14;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSUUID)datumIdentifier
{
  return self->_datumIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  datumIdentifier = self->_datumIdentifier;
  id v5 = a3;
  [v5 encodeObject:datumIdentifier forKey:@"HDDCR_id"];
  [v5 encodeObject:self->_dateInterval forKey:@"HDDCR_ts"];
  id v6 = [(HDDataCollectorSensorDatum *)self resumeContext];
  [v5 encodeObject:v6 forKey:@"HDDCR_ctx"];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resumeContextProvider, 0);
  objc_storeStrong((id *)&self->_resumeContext, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);

  objc_storeStrong((id *)&self->_datumIdentifier, 0);
}

- (HDDataCollectorSensorDatum)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDDataCollectorSensorDatum;
  id v5 = [(HDDataCollectorSensorDatum *)&v14 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDDCR_id"];
  datumIdentifier = v5->_datumIdentifier;
  v5->_datumIdentifier = (NSUUID *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDDCR_ts"];
  dateInterval = v5->_dateInterval;
  v5->_dateInterval = (NSDateInterval *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDDCR_ctx"];
  resumeContext = v5->_resumeContext;
  v5->_resumeContext = (NSData *)v10;

  if (!v5->_datumIdentifier) {
    goto LABEL_5;
  }
  if (v5->_dateInterval) {
LABEL_4:
  }
    id v12 = v5;
  else {
LABEL_5:
  }
    id v12 = 0;

  return v12;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %@, context: %@>", self->_datumIdentifier, self->_dateInterval, self->_resumeContext];
}

- (NSData)resumeContext
{
  resumeContextProvider = (void (**)(id, SEL))self->_resumeContextProvider;
  if (resumeContextProvider)
  {
    resumeContextProvider[2](resumeContextProvider, a2);
    id v4 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = self->_resumeContext;
  }

  return v4;
}

- (HDDataCollectorSensorDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 resumeContextProvider:(id)a5
{
  id v8 = a5;
  v9 = [(HDDataCollectorSensorDatum *)self initWithIdentifier:a3 dateInterval:a4 resumeContext:0];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id resumeContextProvider = v9->_resumeContextProvider;
    v9->_id resumeContextProvider = (id)v10;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(NSUUID *)self->_datumIdentifier isEqual:v4[1]])
  {
    id v5 = [(NSDateInterval *)self->_dateInterval startDate];
    uint64_t v6 = [v4[2] startDate];
    if ([v5 isEqual:v6]
      && ([(NSDateInterval *)self->_dateInterval duration],
          double v8 = v7,
          [v4[2] duration],
          vabdd_f64(v8, v9) <= 0.00000005))
    {
      id v11 = [(HDDataCollectorSensorDatum *)self resumeContext];
      id v12 = [v4 resumeContext];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        v13 = [v4 resumeContext];
        if (v13)
        {
          objc_super v14 = [(HDDataCollectorSensorDatum *)self resumeContext];
          v15 = [v4 resumeContext];
          char v10 = [v14 isEqual:v15];
        }
        else
        {
          char v10 = 0;
        }
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)resumeContextProvider
{
  return self->_resumeContextProvider;
}

@end
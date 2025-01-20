@interface FHAggregateFeature
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FHAggregateFeature)initWithCoder:(id)a3;
- (NSDate)processingWindowEndDate;
- (NSDate)processingWindowStartDate;
- (NSString)name;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setProcessingWindowEndDate:(id)a3;
- (void)setProcessingWindowStartDate:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation FHAggregateFeature

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"aggregateType"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_processingWindowStartDate forKey:@"processingWindowStartDate"];
  [v5 encodeObject:self->_processingWindowEndDate forKey:@"processingWindowEndDate"];
}

- (FHAggregateFeature)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FHAggregateFeature;
  id v5 = [(FHAggregateFeature *)&v13 init];
  if (v5)
  {
    v5->_unint64_t type = [v4 decodeIntegerForKey:@"aggregateType"];
    uint64_t v6 = [v4 decodeObjectForKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"processingWindowStartDate"];
    processingWindowStartDate = v5->_processingWindowStartDate;
    v5->_processingWindowStartDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"processingWindowEndDate"];
    processingWindowEndDate = v5->_processingWindowEndDate;
    v5->_processingWindowEndDate = (NSDate *)v10;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%lu'; ", @"aggregateType", self->_type];
  [v3 appendFormat:@"%@: '%@'; ", @"name", self->_name];
  objc_msgSend(v3, "appendFormat:", @"%@: '%@'; ",
    @"processingWindowStartDate",
    self->_processingWindowStartDate);
  objc_msgSend(v3, "appendFormat:", @"%@: '%@'; ",
    @"processingWindowEndDate",
    self->_processingWindowEndDate);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FHAggregateFeature *)self type];
  id v4 = [(FHAggregateFeature *)self name];
  uint64_t v5 = [v4 hash] - v3 + 32 * v3;

  uint64_t v6 = [(FHAggregateFeature *)self processingWindowStartDate];
  uint64_t v7 = [v6 hash] - v5 + 32 * v5;

  uint64_t v8 = [(FHAggregateFeature *)self processingWindowEndDate];
  unint64_t v9 = [v8 hash] - v7 + 32 * v7 + 923521;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FHAggregateFeature *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else if (v4 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && (unint64_t v6 = [(FHAggregateFeature *)self type], v6 == [(FHAggregateFeature *)v5 type]))
  {
    uint64_t v7 = [(FHAggregateFeature *)self name];
    uint64_t v8 = [(FHAggregateFeature *)v5 name];
    if ([v7 isEqual:v8])
    {
      unint64_t v9 = [(FHAggregateFeature *)self processingWindowStartDate];
      uint64_t v10 = [(FHAggregateFeature *)v5 processingWindowStartDate];
      if ([v9 isEqual:v10])
      {
        v11 = [(FHAggregateFeature *)self processingWindowEndDate];
        v12 = [(FHAggregateFeature *)v5 processingWindowEndDate];
        char v13 = [v11 isEqual:v12];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDate)processingWindowStartDate
{
  return self->_processingWindowStartDate;
}

- (void)setProcessingWindowStartDate:(id)a3
{
}

- (NSDate)processingWindowEndDate
{
  return self->_processingWindowEndDate;
}

- (void)setProcessingWindowEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingWindowEndDate, 0);
  objc_storeStrong((id *)&self->_processingWindowStartDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
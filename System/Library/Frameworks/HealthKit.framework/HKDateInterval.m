@interface HKDateInterval
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKDateInterval)init;
- (HKDateInterval)initWithCoder:(id)a3;
- (HKDateInterval)initWithStartDate:(id)a3 endDate:(id)a4;
- (NSDate)endDate;
- (NSDate)startDate;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKDateInterval

- (HKDateInterval)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKDateInterval)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ((objc_msgSend(v7, "hk_isBeforeOrEqualToDate:", v8) & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HKDateInterval.m", 27, @"Invalid parameter not satisfying: %@", @"[startDate hk_isBeforeOrEqualToDate:endDate]" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)HKDateInterval;
  v9 = [(HKDateInterval *)&v16 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    startDate = v9->_startDate;
    v9->_startDate = (NSDate *)v10;

    uint64_t v12 = [v8 copy];
    endDate = v9->_endDate;
    v9->_endDate = (NSDate *)v12;
  }
  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_startDate hash];
  return [(NSDate *)self->_endDate hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1EED0B580])
  {
    startDate = self->_startDate;
    v6 = [v4 startDate];
    if ([(NSDate *)startDate isEqualToDate:v6])
    {
      endDate = self->_endDate;
      id v8 = [v4 endDate];
      BOOL v9 = [(NSDate *)endDate isEqualToDate:v8];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  startDate = self->_startDate;
  v6 = [v4 startDate];
  int64_t v7 = [(NSDate *)startDate compare:v6];

  if (!v7)
  {
    endDate = self->_endDate;
    BOOL v9 = [v4 endDate];
    int64_t v7 = [(NSDate *)endDate compare:v9];
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  [v5 encodeObject:startDate forKey:@"start"];
  [v5 encodeObject:self->_endDate forKey:@"end"];
}

- (HKDateInterval)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"start"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"end"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7 || !objc_msgSend(v5, "hk_isBeforeOrEqualToDate:", v6))
  {
    id v8 = 0;
  }
  else
  {
    self = [(HKDateInterval *)self initWithStartDate:v5 endDate:v6];
    id v8 = self;
  }

  return v8;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
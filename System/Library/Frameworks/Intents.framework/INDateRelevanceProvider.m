@interface INDateRelevanceProvider
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INDateRelevanceProvider)initWithCoder:(id)a3;
- (INDateRelevanceProvider)initWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;
- (NSDate)endDate;
- (NSDate)startDate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INDateRelevanceProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INDateRelevanceProvider *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      startDate = self->_startDate;
      BOOL v8 = 0;
      if (startDate == v5->_startDate || -[NSDate isEqual:](startDate, "isEqual:"))
      {
        endDate = self->_endDate;
        if (endDate == v5->_endDate || -[NSDate isEqual:](endDate, "isEqual:")) {
          BOOL v8 = 1;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_startDate hash];
  return [(NSDate *)self->_endDate hash] ^ v3;
}

- (INDateRelevanceProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];

  if (v5)
  {
    self = [(INDateRelevanceProvider *)self initWithStartDate:v5 endDate:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  [v5 encodeObject:startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
}

- (INDateRelevanceProvider)initWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
  v7 = startDate;
  BOOL v8 = endDate;
  v13.receiver = self;
  v13.super_class = (Class)INDateRelevanceProvider;
  v9 = [(INRelevanceProvider *)&v13 _init];
  v10 = (INDateRelevanceProvider *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, startDate);
    objc_storeStrong((id *)&v10->_endDate, endDate);
    v11 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
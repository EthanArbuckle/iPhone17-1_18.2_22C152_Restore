@interface FUFlightCodeShare
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FUAirline)airline;
- (FUFlightCodeShare)initWithCoder:(id)a3;
- (unint64_t)flightNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setAirline:(id)a3;
- (void)setFlightNumber:(unint64_t)a3;
@end

@implementation FUFlightCodeShare

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [(FUFlightCodeShare *)self airline];
    v8 = [v6 airline];
    if (v7 == v8
      || ([(FUFlightCodeShare *)self airline],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v6 airline],
          v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      unint64_t v10 = [(FUFlightCodeShare *)self flightNumber];
      BOOL v9 = v10 == [v6 flightNumber];
      if (v7 == v8)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      BOOL v9 = 0;
    }

    goto LABEL_8;
  }
  BOOL v9 = 0;
LABEL_9:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(FUFlightCodeShare *)self airline];

  if (v4)
  {
    v5 = [(FUFlightCodeShare *)self airline];
    [v6 encodeObject:v5 forKey:@"airline"];
  }
  objc_msgSend(v6, "encodeInteger:forKey:", -[FUFlightCodeShare flightNumber](self, "flightNumber"), @"flightNumber");
}

- (FUFlightCodeShare)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FUFlightCodeShare;
  v5 = [(FUFlightCodeShare *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"airline"];
    airline = v5->_airline;
    v5->_airline = (FUAirline *)v6;

    v5->_flightNumber = [v4 decodeIntegerForKey:@"flightNumber"];
    v8 = v5;
  }

  return v5;
}

- (FUAirline)airline
{
  return (FUAirline *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAirline:(id)a3
{
}

- (unint64_t)flightNumber
{
  return self->_flightNumber;
}

- (void)setFlightNumber:(unint64_t)a3
{
  self->_flightNumber = a3;
}

- (void).cxx_destruct
{
}

@end
@interface CLSLocationOfInterestVisit
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLSLocationOfInterest)locationOfInterest;
- (CLSLocationOfInterestVisit)initWithCoder:(id)a3;
- (CLSLocationOfInterestVisit)initWithIdentifier:(id)a3 visitInterval:(id)a4 confidence:(double)a5;
- (NSDateInterval)visitInterval;
- (NSUUID)identifier;
- (double)confidence;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLocationOfInterest:(id)a3;
@end

@implementation CLSLocationOfInterestVisit

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_locationOfInterest);
  objc_storeStrong((id *)&self->_visitInterval, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (CLSLocationOfInterest)locationOfInterest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationOfInterest);
  return (CLSLocationOfInterest *)WeakRetained;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSDateInterval)visitInterval
{
  return self->_visitInterval;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CLSLocationOfInterestVisit;
  v4 = [(CLSLocationOfInterestVisit *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ - %@", v4, self->_visitInterval];

  return v5;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CLSLocationOfInterestVisit *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      identifier = self->_identifier;
      v6 = [(CLSLocationOfInterestVisit *)v4 identifier];
      char v7 = [(NSUUID *)identifier isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (void)setLocationOfInterest:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationOfInterest);
  if (WeakRetained != obj || ([obj isEqual:obj] & 1) == 0)
  {
    [WeakRetained removeVisit:self];
    objc_storeWeak((id *)&self->_locationOfInterest, obj);
    [obj addVisit:self];
  }
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_visitInterval forKey:@"visitInterval"];
  [v5 encodeDouble:@"confidence" forKey:self->_confidence];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationOfInterest);
  [v5 encodeObject:WeakRetained forKey:@"locationOfInterest"];
}

- (CLSLocationOfInterestVisit)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"visitInterval"];
  [v4 decodeDoubleForKey:@"confidence"];
  char v7 = -[CLSLocationOfInterestVisit initWithIdentifier:visitInterval:confidence:](self, "initWithIdentifier:visitInterval:confidence:", v5, v6);
  if (v7)
  {
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationOfInterest"];
    [v8 addVisit:v7];
  }
  return v7;
}

- (CLSLocationOfInterestVisit)initWithIdentifier:(id)a3 visitInterval:(id)a4 confidence:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLSLocationOfInterestVisit;
  v11 = [(CLSLocationOfInterestVisit *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_visitInterval, a4);
    v12->_confidence = a5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
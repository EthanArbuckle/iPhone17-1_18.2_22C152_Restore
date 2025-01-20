@interface CLSLocationOfInterestTransition
- (BOOL)isEqual:(id)a3;
- (CLSLocationOfInterestTransition)initWithIdentifier:(id)a3 transitionInterval:(id)a4 transportationMode:(int64_t)a5;
- (NSDateInterval)transitionInterval;
- (NSUUID)identifier;
- (id)description;
- (int64_t)transportationMode;
- (unint64_t)hash;
@end

@implementation CLSLocationOfInterestTransition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionInterval, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (int64_t)transportationMode
{
  return self->_transportationMode;
}

- (NSDateInterval)transitionInterval
{
  return self->_transitionInterval;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CLSLocationOfInterestTransition *)a3;
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
      v6 = [(CLSLocationOfInterestTransition *)v4 identifier];
      char v7 = [(NSUUID *)identifier isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)CLSLocationOfInterestTransition;
  uint64_t v4 = [(CLSLocationOfInterestTransition *)&v10 description];
  v5 = (void *)v4;
  unint64_t transportationMode = self->_transportationMode;
  if (transportationMode > 2) {
    char v7 = @"Unknown";
  }
  else {
    char v7 = off_1E6910248[transportationMode];
  }
  v8 = [v3 stringWithFormat:@"%@ - %@ - %@", v4, self->_transitionInterval, v7];

  return v8;
}

- (CLSLocationOfInterestTransition)initWithIdentifier:(id)a3 transitionInterval:(id)a4 transportationMode:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLSLocationOfInterestTransition;
  v11 = [(CLSLocationOfInterestTransition *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_transitionInterval, a4);
    v12->_unint64_t transportationMode = a5;
  }

  return v12;
}

@end
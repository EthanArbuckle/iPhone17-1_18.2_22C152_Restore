@interface PKStrokeProviderSliceIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSUUID)strokeUUID;
- (PKStrokeProviderSliceIdentifier)initWithCoder:(id)a3;
- (PKStrokeProviderSliceIdentifier)initWithUUID:(id)a3 tStart:(double)a4 tEnd:(double)a5;
- (double)tEnd;
- (double)tStart;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKStrokeProviderSliceIdentifier

- (PKStrokeProviderSliceIdentifier)initWithUUID:(id)a3 tStart:(double)a4 tEnd:(double)a5
{
  v8 = (NSUUID *)a3;
  v12.receiver = self;
  v12.super_class = (Class)PKStrokeProviderSliceIdentifier;
  v9 = [(PKStrokeProviderSliceIdentifier *)&v12 init];
  strokeUUID = v9->_strokeUUID;
  v9->_strokeUUID = v8;

  v9->_tStart = a4;
  v9->_tEnd = a5;
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKStrokeProviderSliceIdentifier *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v15 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(PKStrokeProviderSliceIdentifier *)self strokeUUID];
      v8 = [(PKStrokeProviderSliceIdentifier *)v6 strokeUUID];
      if ([v7 isEqual:v8]
        && (([(PKStrokeProviderSliceIdentifier *)self tStart],
             double v10 = v9,
             [(PKStrokeProviderSliceIdentifier *)v6 tStart],
             v10 == v11)
         || vabdd_f64(v10, v11) < fabs(v11 * 0.000000999999997)))
      {
        [(PKStrokeProviderSliceIdentifier *)self tEnd];
        double v13 = v12;
        [(PKStrokeProviderSliceIdentifier *)v6 tEnd];
        BOOL v15 = v13 == v14 || vabdd_f64(v13, v14) < fabs(v14 * 0.000000999999997);
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  return v15;
}

- (unint64_t)hash
{
  v3 = [(PKStrokeProviderSliceIdentifier *)self strokeUUID];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = PKHashBytes((uint64_t)&self->_tStart, 8);
  unint64_t v6 = v5 ^ v4 ^ PKHashBytes((uint64_t)&self->_tEnd, 8);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(PKStrokeProviderSliceIdentifier *)self strokeUUID];
  [v5 encodeObject:v4 forKey:@"strokeUUIDKey"];

  [(PKStrokeProviderSliceIdentifier *)self tStart];
  objc_msgSend(v5, "encodeDouble:forKey:", @"tStart");
  [(PKStrokeProviderSliceIdentifier *)self tEnd];
  objc_msgSend(v5, "encodeDouble:forKey:", @"tEnd");
}

- (PKStrokeProviderSliceIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"strokeUUIDKey"];
  [v4 decodeDoubleForKey:@"tStart"];
  double v7 = v6;
  [v4 decodeDoubleForKey:@"tEnd"];
  double v9 = v8;
  strokeUUID = self->_strokeUUID;
  self->_strokeUUID = v5;

  self->_tStart = v7;
  self->_tEnd = v9;

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)strokeUUID
{
  return self->_strokeUUID;
}

- (double)tStart
{
  return self->_tStart;
}

- (double)tEnd
{
  return self->_tEnd;
}

- (void).cxx_destruct
{
}

@end
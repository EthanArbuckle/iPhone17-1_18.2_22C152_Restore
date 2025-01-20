@interface SKGTrackingNumber
- (BOOL)isEqual:(id)a3;
- (NSString)carrier;
- (NSString)trackingNumber;
- (id)description;
- (void)setCarrier:(id)a3;
- (void)setTrackingNumber:(id)a3;
@end

@implementation SKGTrackingNumber

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(SKGTrackingNumber *)self trackingNumber];
    v7 = [v5 trackingNumber];
    if ([v6 isEqualToString:v7])
    {
      v10.receiver = self;
      v10.super_class = (Class)SKGTrackingNumber;
      BOOL v8 = [(SKGEntity *)&v10 isEqual:v5];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(SKGTrackingNumber *)self trackingNumber];
  [(SKGEntity *)self score];
  v6 = +[NSString stringWithFormat:@"<%@: %@ %f", v3, v4, v5];

  return v6;
}

- (NSString)trackingNumber
{
  return self->_trackingNumber;
}

- (void)setTrackingNumber:(id)a3
{
}

- (NSString)carrier
{
  return self->_carrier;
}

- (void)setCarrier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrier, 0);

  objc_storeStrong((id *)&self->_trackingNumber, 0);
}

@end
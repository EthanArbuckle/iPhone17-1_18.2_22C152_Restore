@interface ADPrimeTokenWrapper
+ (BOOL)supportsSecureCoding;
- (ADPrimeTokenWrapper)initWithCoder:(id)a3;
- (NSString)primeToken;
- (double)lastPrimeTokenTimestamp;
- (id)init:(id)a3 timeStamp:(double)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setLastPrimeTokenTimestamp:(double)a3;
- (void)setPrimeToken:(id)a3;
@end

@implementation ADPrimeTokenWrapper

- (void).cxx_destruct
{
}

- (void)setLastPrimeTokenTimestamp:(double)a3
{
  self->_lastPrimeTokenTimestamp = a3;
}

- (double)lastPrimeTokenTimestamp
{
  return self->_lastPrimeTokenTimestamp;
}

- (void)setPrimeToken:(id)a3
{
}

- (NSString)primeToken
{
  return self->_primeToken;
}

- (ADPrimeTokenWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primeToken"];
  [v4 decodeDoubleForKey:@"lastPrimeTokenTimestamp"];
  double v8 = v7;

  v12.receiver = self;
  v12.super_class = (Class)ADPrimeTokenWrapper;
  v9 = [(ADPrimeTokenWrapper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_primeToken, v6);
    v10->_lastPrimeTokenTimestamp = v8;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ADPrimeTokenWrapper *)self primeToken];
  [v4 encodeObject:v5 forKey:@"primeToken"];
  [v4 encodeDouble:@"lastPrimeTokenTimestamp" forKey:self->_lastPrimeTokenTimestamp];
}

- (id)init:(id)a3 timeStamp:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ADPrimeTokenWrapper;
  double v8 = [(ADPrimeTokenWrapper *)&v11 init];
  v9 = (double *)v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_primeToken, a3);
    v9[2] = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
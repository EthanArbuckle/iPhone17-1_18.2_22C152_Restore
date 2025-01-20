@interface AMSMediaToken
+ (BOOL)supportsSecureCoding;
- (AMSMediaToken)initWithCoder:(id)a3;
- (AMSMediaToken)initWithString:(id)a3 expirationDate:(id)a4 lifetime:(double)a5;
- (AMSMediaToken)initWithString:(id)a3 expirationDate:(id)a4 lifetime:(double)a5 valid:(BOOL)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpired;
- (BOOL)isValid;
- (BOOL)willExpireWithin:(double)a3;
- (NSDate)expirationDate;
- (NSString)tokenString;
- (double)lifetime;
- (double)percentageOfLifetimeRemaining;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)invalidCopy;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSMediaToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSMediaToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSMediaToken;
  v5 = [(AMSMediaToken *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"e"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

    [v4 decodeDoubleForKey:@"l"];
    v5->_lifetime = v8;
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"t"];
    tokenString = v5->_tokenString;
    v5->_tokenString = (NSString *)v9;

    v5->_valid = [v4 decodeBoolForKey:@"v"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [AMSMediaToken alloc];
  uint64_t v6 = [(AMSMediaToken *)self tokenString];
  v7 = (void *)[v6 copyWithZone:a3];
  double v8 = [(AMSMediaToken *)self expirationDate];
  uint64_t v9 = (void *)[v8 copyWithZone:a3];
  [(AMSMediaToken *)self lifetime];
  v11 = [(AMSMediaToken *)v5 initWithString:v7 expirationDate:v9 lifetime:[(AMSMediaToken *)self isValid] valid:v10];

  return v11;
}

- (NSString)tokenString
{
  return self->_tokenString;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (BOOL)willExpireWithin:(double)a3
{
  id v4 = [(AMSMediaToken *)self expirationDate];
  [v4 timeIntervalSinceNow];
  BOOL v6 = v5 < a3;

  return v6;
}

- (double)percentageOfLifetimeRemaining
{
  v3 = [(AMSMediaToken *)self expirationDate];
  [v3 timeIntervalSinceNow];
  double v5 = v4;
  [(AMSMediaToken *)self lifetime];
  double v7 = v5 / v6;

  return v7;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (double)lifetime
{
  return self->_lifetime;
}

- (BOOL)isExpired
{
  v2 = [(AMSMediaToken *)self expirationDate];
  [v2 timeIntervalSinceNow];
  BOOL v4 = v3 < 0.0;

  return v4;
}

- (AMSMediaToken)initWithString:(id)a3 expirationDate:(id)a4 lifetime:(double)a5 valid:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSMediaToken;
  objc_super v12 = [(AMSMediaToken *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    tokenString = v12->_tokenString;
    v12->_tokenString = (NSString *)v13;

    objc_storeStrong((id *)&v12->_expirationDate, a4);
    v12->_lifetime = a5;
    v12->_valid = a6;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenString, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

- (AMSMediaToken)initWithString:(id)a3 expirationDate:(id)a4 lifetime:(double)a5
{
  return [(AMSMediaToken *)self initWithString:a3 expirationDate:a4 lifetime:1 valid:a5];
}

- (id)invalidCopy
{
  v2 = (unsigned char *)[(AMSMediaToken *)self copy];
  v2[8] = 0;
  return v2;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  BOOL v4 = [(AMSMediaToken *)self tokenString];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, @"tokenString");

  double v5 = [(AMSMediaToken *)self expirationDate];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v5, @"expirationDate");

  double v6 = (void *)MEMORY[0x1E4F28ED0];
  [(AMSMediaToken *)self lifetime];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, @"lifetime");

  if ([(AMSMediaToken *)self isValid]) {
    double v8 = @"true";
  }
  else {
    double v8 = @"false";
  }
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v8, @"valid");
  uint64_t v9 = [self ams_generateDescriptionWithSubObjects:v3];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = 0;
    BOOL v13 = 0;
    double v6 = v4;
LABEL_12:

    goto LABEL_13;
  }
  id v5 = v4;

  if (v5)
  {
    double v6 = [(AMSMediaToken *)self tokenString];
    double v7 = [v5 tokenString];
    if ([v6 isEqualToString:v7])
    {
      double v8 = [(AMSMediaToken *)self expirationDate];
      uint64_t v9 = [v5 expirationDate];
      if ([v8 isEqualToDate:v9])
      {
        [(AMSMediaToken *)self lifetime];
        double v11 = v10;
        [v5 lifetime];
        BOOL v13 = v11 == v12;
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }

    goto LABEL_12;
  }
  BOOL v13 = 0;
LABEL_13:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(AMSMediaToken *)self expirationDate];
  [v6 encodeObject:v4 forKey:@"e"];

  [(AMSMediaToken *)self lifetime];
  objc_msgSend(v6, "encodeDouble:forKey:", @"l");
  id v5 = [(AMSMediaToken *)self tokenString];
  [v6 encodeObject:v5 forKey:@"t"];

  objc_msgSend(v6, "encodeBool:forKey:", -[AMSMediaToken isValid](self, "isValid"), @"v");
}

@end
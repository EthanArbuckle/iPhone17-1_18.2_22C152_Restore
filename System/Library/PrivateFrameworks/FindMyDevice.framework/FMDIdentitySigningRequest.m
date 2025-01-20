@interface FMDIdentitySigningRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)useSCRT;
- (FMDIdentitySigningRequest)initWithCoder:(id)a3;
- (FMDIdentitySigningRequest)initWithData:(id)a3;
- (NSData)dataToSign;
- (int64_t)validityInMinutes;
- (void)encodeWithCoder:(id)a3;
- (void)setDataToSign:(id)a3;
- (void)setUseSCRT:(BOOL)a3;
- (void)setValidityInMinutes:(int64_t)a3;
@end

@implementation FMDIdentitySigningRequest

- (FMDIdentitySigningRequest)initWithData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMDIdentitySigningRequest;
  v5 = [(FMDIdentitySigningRequest *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(FMDIdentitySigningRequest *)v5 setDataToSign:v4];
    [(FMDIdentitySigningRequest *)v6 setValidityInMinutes:10];
  }

  return v6;
}

- (FMDIdentitySigningRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDIdentitySigningRequest;
  v5 = [(FMDIdentitySigningRequest *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataToSign"];
    [(FMDIdentitySigningRequest *)v5 setDataToSign:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"validityInMinutes"];
    -[FMDIdentitySigningRequest setValidityInMinutes:](v5, "setValidityInMinutes:", [v7 integerValue]);

    -[FMDIdentitySigningRequest setUseSCRT:](v5, "setUseSCRT:", [v4 decodeBoolForKey:@"useSCRT"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(FMDIdentitySigningRequest *)self dataToSign];
  [v6 encodeObject:v4 forKey:@"dataToSign"];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[FMDIdentitySigningRequest validityInMinutes](self, "validityInMinutes"));
  [v6 encodeObject:v5 forKey:@"validityInMinutes"];

  objc_msgSend(v6, "encodeBool:forKey:", -[FMDIdentitySigningRequest useSCRT](self, "useSCRT"), @"useSCRT");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)dataToSign
{
  return self->_dataToSign;
}

- (void)setDataToSign:(id)a3
{
}

- (BOOL)useSCRT
{
  return self->_useSCRT;
}

- (void)setUseSCRT:(BOOL)a3
{
  self->_useSCRT = a3;
}

- (int64_t)validityInMinutes
{
  return self->_validityInMinutes;
}

- (void)setValidityInMinutes:(int64_t)a3
{
  self->_validityInMinutes = a3;
}

- (void).cxx_destruct
{
}

@end
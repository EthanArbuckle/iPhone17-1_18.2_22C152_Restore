@interface ATResponse
+ (BOOL)supportsSecureCoding;
- (ATResponse)initWithCoder:(id)a3;
- (BOOL)isPartial;
- (NSError)error;
- (id)additionalDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setPartial:(BOOL)a3;
@end

@implementation ATResponse

- (void).cxx_destruct
{
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setPartial:(BOOL)a3
{
  self->_partial = a3;
}

- (BOOL)isPartial
{
  return self->_partial;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ATResponse;
  id v4 = a3;
  [(ATMessage *)&v6 encodeWithCoder:v4];
  v5 = [(NSError *)self->_error msv_errorByRemovingUnsafeUserInfo];
  [v4 encodeObject:v5 forKey:@"error"];

  [v4 encodeBool:self->_partial forKey:@"isPartial"];
}

- (ATResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATResponse;
  v5 = [(ATMessage *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v6;

    v5->_partial = [v4 decodeBoolForKey:@"isPartial"];
  }

  return v5;
}

- (id)additionalDescription
{
  v2 = NSString;
  v3 = [(ATResponse *)self error];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
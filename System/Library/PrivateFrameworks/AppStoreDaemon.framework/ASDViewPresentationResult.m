@interface ASDViewPresentationResult
+ (BOOL)supportsSecureCoding;
- (ASDViewPresentationResult)initWithCoder:(id)a3;
- (ASDViewPresentationResult)initWithError:(id)a3;
- (ASDViewPresentationResult)initWithNumber:(id)a3;
- (ASDViewPresentationResult)initWithString:(id)a3;
- (NSError)error;
- (NSNumber)numberResult;
- (NSString)stringResult;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDViewPresentationResult

- (ASDViewPresentationResult)initWithError:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDViewPresentationResult;
  v5 = [(ASDViewPresentationResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    error = v5->_error;
    v5->_error = (NSError *)v6;
  }
  return v5;
}

- (ASDViewPresentationResult)initWithNumber:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDViewPresentationResult;
  v5 = [(ASDViewPresentationResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    numberResult = v5->_numberResult;
    v5->_numberResult = (NSNumber *)v6;
  }
  return v5;
}

- (ASDViewPresentationResult)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDViewPresentationResult;
  v5 = [(ASDViewPresentationResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    stringResult = v5->_stringResult;
    v5->_stringResult = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDViewPresentationResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDViewPresentationResult;
  v5 = [(ASDViewPresentationResult *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"E"];
    error = v5->_error;
    v5->_error = (NSError *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"N"];
    numberResult = v5->_numberResult;
    v5->_numberResult = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"S"];
    stringResult = v5->_stringResult;
    v5->_stringResult = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  error = self->_error;
  id v5 = a3;
  [v5 encodeObject:error forKey:@"E"];
  [v5 encodeObject:self->_numberResult forKey:@"N"];
  [v5 encodeObject:self->_stringResult forKey:@"S"];
}

- (NSError)error
{
  return self->_error;
}

- (NSNumber)numberResult
{
  return self->_numberResult;
}

- (NSString)stringResult
{
  return self->_stringResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringResult, 0);
  objc_storeStrong((id *)&self->_numberResult, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
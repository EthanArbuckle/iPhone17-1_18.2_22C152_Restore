@interface IDSFeatureToggleUpdateResult
+ (BOOL)supportsSecureCoding;
+ (id)resultWithError:(unint64_t)a3;
+ (id)successfulResult;
- (BOOL)success;
- (IDSFeatureToggleUpdateResult)initWithCoder:(id)a3;
- (IDSFeatureToggleUpdateResult)initWithError:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)error;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(unint64_t)a3;
@end

@implementation IDSFeatureToggleUpdateResult

+ (id)successfulResult
{
  v2 = [[IDSFeatureToggleUpdateResult alloc] initWithError:0];

  return v2;
}

+ (id)resultWithError:(unint64_t)a3
{
  v3 = [[IDSFeatureToggleUpdateResult alloc] initWithError:a3];

  return v3;
}

- (IDSFeatureToggleUpdateResult)initWithError:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IDSFeatureToggleUpdateResult;
  result = [(IDSFeatureToggleUpdateResult *)&v5 init];
  if (result) {
    result->_error = a3;
  }
  return result;
}

- (BOOL)success
{
  return [(IDSFeatureToggleUpdateResult *)self error] == 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [IDSFeatureToggleUpdateResult alloc];
  unint64_t v5 = [(IDSFeatureToggleUpdateResult *)self error];

  return [(IDSFeatureToggleUpdateResult *)v4 initWithError:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSFeatureToggleUpdateResult)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"err"];

  return [(IDSFeatureToggleUpdateResult *)self initWithError:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[IDSFeatureToggleUpdateResult error](self, "error"), @"err");
}

- (unint64_t)error
{
  return self->_error;
}

- (void)setError:(unint64_t)a3
{
  self->_error = a3;
}

@end
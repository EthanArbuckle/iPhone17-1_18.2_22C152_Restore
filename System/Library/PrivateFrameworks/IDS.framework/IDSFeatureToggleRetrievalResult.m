@interface IDSFeatureToggleRetrievalResult
+ (BOOL)supportsSecureCoding;
+ (id)resultWithError:(unint64_t)a3;
+ (id)resultWithState:(unint64_t)a3;
- (BOOL)success;
- (IDSFeatureToggleRetrievalResult)initWithCoder:(id)a3;
- (IDSFeatureToggleRetrievalResult)initWithState:(unint64_t)a3 error:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)error;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(unint64_t)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation IDSFeatureToggleRetrievalResult

+ (id)resultWithState:(unint64_t)a3
{
  v3 = [[IDSFeatureToggleRetrievalResult alloc] initWithState:a3 error:0];

  return v3;
}

+ (id)resultWithError:(unint64_t)a3
{
  v3 = [[IDSFeatureToggleRetrievalResult alloc] initWithState:0 error:a3];

  return v3;
}

- (IDSFeatureToggleRetrievalResult)initWithState:(unint64_t)a3 error:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IDSFeatureToggleRetrievalResult;
  result = [(IDSFeatureToggleRetrievalResult *)&v7 init];
  if (result)
  {
    result->_state = a3;
    result->_error = a4;
  }
  return result;
}

- (BOOL)success
{
  return [(IDSFeatureToggleRetrievalResult *)self error] == 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [IDSFeatureToggleRetrievalResult alloc];
  unint64_t v5 = [(IDSFeatureToggleRetrievalResult *)self state];
  unint64_t v6 = [(IDSFeatureToggleRetrievalResult *)self error];

  return [(IDSFeatureToggleRetrievalResult *)v4 initWithState:v5 error:v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSFeatureToggleRetrievalResult)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"st"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"err"];

  return [(IDSFeatureToggleRetrievalResult *)self initWithState:v5 error:v6];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[IDSFeatureToggleRetrievalResult state](self, "state"), @"st");
  objc_msgSend(v4, "encodeInteger:forKey:", -[IDSFeatureToggleRetrievalResult error](self, "error"), @"err");
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
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
@interface AFSiriResponse
+ (BOOL)supportsSecureCoding;
- (AFSiriResponse)initWithCoder:(id)a3;
- (BOOL)_isForRequest:(id)a3;
- (id)_initWithRequest:(id)a3;
- (id)_initWithRequestIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSiriResponse

- (void).cxx_destruct
{
}

- (AFSiriResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SiriResponseRequestIdentifier"];

  v6 = [(AFSiriResponse *)self _initWithRequestIdentifier:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)_isForRequest:(id)a3
{
  requestIdentifier = self->_requestIdentifier;
  id v4 = [a3 _identifier];
  LOBYTE(requestIdentifier) = [(NSUUID *)requestIdentifier isEqual:v4];

  return (char)requestIdentifier;
}

- (id)_initWithRequest:(id)a3
{
  id v4 = [a3 _identifier];
  id v5 = [(AFSiriResponse *)self _initWithRequestIdentifier:v4];

  return v5;
}

- (id)_initWithRequestIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSiriResponse;
  id v5 = [(AFSiriResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSUUID *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface AFSiriTaskUsageResult
+ (BOOL)supportsSecureCoding;
- (AFSiriTaskUsageResult)initWithCoder:(id)a3;
- (id)_initWithOriginatingAceID:(id)a3;
- (id)_originatingAceID;
- (id)_resultDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSiriTaskUsageResult

- (void).cxx_destruct
{
}

- (AFSiriTaskUsageResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OriginatingAceIDKeyIdentifier"];

  v6 = [(AFSiriTaskUsageResult *)self _initWithOriginatingAceID:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"<"];
  id v4 = [(id)objc_opt_class() description];
  [v3 appendString:v4];

  objc_msgSend(v3, "appendFormat:", @": %p;", self);
  if ([(NSString *)self->_originatingAceID length])
  {
    [v3 appendString:@" originatingAceID="];
    [v3 appendString:self->_originatingAceID];
  }
  [v3 appendString:@">"];
  return v3;
}

- (id)_resultDescription
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"AFSiriTaskUsageResult.m" lineNumber:33 description:@"_resultDescription must be overridden in subclasses."];

  return 0;
}

- (id)_originatingAceID
{
  return self->_originatingAceID;
}

- (id)_initWithOriginatingAceID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSiriTaskUsageResult;
  v5 = [(AFSiriTaskUsageResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    originatingAceID = v5->_originatingAceID;
    v5->_originatingAceID = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
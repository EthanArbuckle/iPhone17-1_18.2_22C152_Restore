@interface AFSiriRequest
+ (BOOL)supportsSecureCoding;
- (AFSiriRequest)init;
- (AFSiriRequest)initWithCoder:(id)a3;
- (BOOL)_makeAppFrontmost;
- (NSString)_originatingAceID;
- (NSString)_refId;
- (NSUUID)_turnId;
- (id)_af_analyticsContextDescription;
- (id)_descriptionWithProperties:(id)a3;
- (id)_identifier;
- (id)_initWithOriginatingAceID:(id)a3;
- (id)_initWithOriginatingAceID:(id)a3 identifier:(id)a4 turnId:(id)a5;
- (id)description;
- (id)requestName;
- (void)_setOriginatingAceID:(id)a3;
- (void)_setRefId:(id)a3;
- (void)_setTurnId:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSiriRequest

- (id)_af_analyticsContextDescription
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:7];
  v4 = [(AFSiriRequest *)self _originatingAceID];
  if (v4) {
    [v3 setObject:v4 forKey:@"intentRequestId"];
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__refId, 0);
  objc_storeStrong((id *)&self->_turnId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_originatingAceID, 0);
}

- (void)_setRefId:(id)a3
{
}

- (NSString)_refId
{
  return self->__refId;
}

- (void)_setTurnId:(id)a3
{
}

- (void)_setOriginatingAceID:(id)a3
{
}

- (NSString)_originatingAceID
{
  return self->_originatingAceID;
}

- (BOOL)_makeAppFrontmost
{
  return 1;
}

- (AFSiriRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SiriRequestIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SiriRequestOriginatingTurnIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SiriRequestOriginatingAceIDIdentifier"];

  v8 = [(AFSiriRequest *)self _initWithOriginatingAceID:v7 identifier:v5 turnId:v6];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"SiriRequestIdentifier"];
  [v5 encodeObject:self->_originatingAceID forKey:@"SiriRequestOriginatingAceIDIdentifier"];
  [v5 encodeObject:self->_turnId forKey:@"SiriRequestOriginatingTurnIdentifier"];
}

- (NSUUID)_turnId
{
  return self->_turnId;
}

- (id)_identifier
{
  return self->_identifier;
}

- (id)requestName
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  id v4 = objc_msgSend(v3, "_af_stringByRemovingPrefixWithLength:", 2);
  id v5 = objc_msgSend(v4, "_af_stringByRemovingSuffix:", @"Request");

  return v5;
}

- (id)_descriptionWithProperties:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"<"];
  v6 = [(id)objc_opt_class() description];
  [v5 appendString:v6];

  objc_msgSend(v5, "appendFormat:", @": %p;", self);
  [v5 appendString:@" \""];
  v7 = [(AFSiriRequest *)self requestName];
  [v5 appendString:v7];

  [v5 appendString:@"\""];
  [v5 appendString:@" "];
  v8 = [(NSUUID *)self->_identifier UUIDString];
  [v5 appendString:v8];

  [v5 appendString:@"\""];
  if (self->_turnId)
  {
    [v5 appendString:@"turnId: \""];
    v9 = [(NSUUID *)self->_turnId UUIDString];
    [v5 appendString:v9];

    [v5 appendString:@"\""];
  }
  if ([(NSString *)self->_originatingAceID length])
  {
    [v5 appendString:@"OriginatingAceID: "];
    [v5 appendString:self->_originatingAceID];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__AFSiriRequest__descriptionWithProperties___block_invoke;
  v12[3] = &unk_1E5928888;
  id v10 = v5;
  id v13 = v10;
  [v4 enumerateKeysAndObjectsUsingBlock:v12];
  [v10 appendString:@">"];

  return v10;
}

void __44__AFSiriRequest__descriptionWithProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 appendString:@"; "];
  [*(id *)(a1 + 32) appendString:v7];

  [*(id *)(a1 + 32) appendString:@"="];
  v8 = *(void **)(a1 + 32);
  id v9 = [v6 description];

  [v8 appendString:v9];
}

- (id)description
{
  return [(AFSiriRequest *)self _descriptionWithProperties:MEMORY[0x1E4F1CC08]];
}

- (AFSiriRequest)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F29128]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F29128]);
  id v5 = [(AFSiriRequest *)self _initWithOriginatingAceID:0 identifier:v3 turnId:v4];

  return v5;
}

- (id)_initWithOriginatingAceID:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_alloc_init(MEMORY[0x1E4F29128]);
  id v8 = [(AFSiriRequest *)self _initWithOriginatingAceID:v5 identifier:v6 turnId:v7];

  return v8;
}

- (id)_initWithOriginatingAceID:(id)a3 identifier:(id)a4 turnId:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"AFSiriRequest.m", 31, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)AFSiriRequest;
  v12 = [(AFSiriRequest *)&v21 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    originatingAceID = v12->_originatingAceID;
    v12->_originatingAceID = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v15;

    uint64_t v17 = [v11 copy];
    turnId = v12->_turnId;
    v12->_turnId = (NSUUID *)v17;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
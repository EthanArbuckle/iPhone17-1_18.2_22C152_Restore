@interface AKAttestationRequestData
+ (BOOL)supportsSecureCoding;
- (AKAttestationRequestData)initWithCoder:(id)a3;
- (AKAttestationRequestData)initWithRequest:(id)a3 requiredHeaders:(id)a4;
- (NSData)bodyDataHash;
- (NSDictionary)headers;
- (NSURL)requestURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AKAttestationRequestData

- (AKAttestationRequestData)initWithRequest:(id)a3 requiredHeaders:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AKAttestationRequestData;
  v8 = [(AKAttestationRequestData *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 URL];
    requestURL = v8->_requestURL;
    v8->_requestURL = (NSURL *)v9;

    v11 = [v6 HTTPBody];
    uint64_t v12 = objc_msgSend(v11, "ak_SHA256Data");
    bodyDataHash = v8->_bodyDataHash;
    v8->_bodyDataHash = (NSData *)v12;

    v14 = [v6 allHTTPHeaderFields];
    uint64_t v15 = objc_msgSend(v14, "ak_dictionaryWithKeysFromArray:", v7);
    headers = v8->_headers;
    v8->_headers = (NSDictionary *)v15;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = [(NSData *)self->_bodyDataHash copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  id v7 = [(NSDictionary *)self->_headers copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAttestationRequestData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAttestationRequestData *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_requestURL"];
    requestURL = v5->_requestURL;
    v5->_requestURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bodyDataHash"];
    bodyDataHash = v5->_bodyDataHash;
    v5->_bodyDataHash = (NSData *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"_headers"];
    headers = v5->_headers;
    v5->_headers = (NSDictionary *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  requestURL = self->_requestURL;
  id v5 = a3;
  [v5 encodeObject:requestURL forKey:@"_requestURL"];
  [v5 encodeObject:self->_bodyDataHash forKey:@"_bodyDataHash"];
  [v5 encodeObject:self->_headers forKey:@"_headers"];
}

- (id)description
{
  return +[NSString stringWithFormat:@"AKAttestationRequestData: bodyHash: %@, headers: %@", self->_bodyDataHash, self->_headers];
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (NSData)bodyDataHash
{
  return self->_bodyDataHash;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_bodyDataHash, 0);

  objc_storeStrong((id *)&self->_requestURL, 0);
}

@end
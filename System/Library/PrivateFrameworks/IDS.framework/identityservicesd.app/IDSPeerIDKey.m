@interface IDSPeerIDKey
+ (BOOL)supportsSecureCoding;
+ (id)peerIDKeyWithService:(id)a3 fromURI:(id)a4 toURI:(id)a5;
- (BOOL)hasMatchingURIs;
- (BOOL)isEqual:(id)a3;
- (IDSPeerIDKey)initWithCoder:(id)a3;
- (IDSPeerIDKey)initWithService:(id)a3 fromURI:(id)a4 toURI:(id)a5;
- (IDSURI)fromURI;
- (IDSURI)toURI;
- (NSString)service;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasMatchingURIs:(BOOL)a3;
@end

@implementation IDSPeerIDKey

+ (id)peerIDKeyWithService:(id)a3 fromURI:(id)a4 toURI:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithService:v10 fromURI:v9 toURI:v8];

  return v11;
}

- (IDSPeerIDKey)initWithService:(id)a3 fromURI:(id)a4 toURI:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  v12 = 0;
  if (v8 && v9 && v10)
  {
    v17.receiver = self;
    v17.super_class = (Class)IDSPeerIDKey;
    v13 = [(IDSPeerIDKey *)&v17 init];
    if (v13)
    {
      v14 = (NSString *)[v8 copy];
      service = v13->_service;
      v13->_service = v14;

      objc_storeStrong((id *)&v13->_fromURI, a4);
      objc_storeStrong((id *)&v13->_toURI, a5);
      v13->_hasMatchingURIs = [v9 isEqualToURI:v11];
    }
    self = v13;
    v12 = self;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 service];
    v7 = [(IDSPeerIDKey *)self service];
    if ([v6 isEqualToString:v7])
    {
      id v8 = [v5 fromURI];
      id v9 = [(IDSPeerIDKey *)self fromURI];
      if ([v8 isEqual:v9])
      {
        id v10 = [v5 toURI];
        id v11 = [(IDSPeerIDKey *)self toURI];
        unsigned __int8 v12 = [v10 isEqual:v11];
      }
      else
      {
        unsigned __int8 v12 = 0;
      }
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(IDSPeerIDKey *)self service];
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = [(IDSPeerIDKey *)self fromURI];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  v7 = [(IDSPeerIDKey *)self toURI];
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];

  return v8;
}

- (id)description
{
  v3 = [(IDSPeerIDKey *)self service];
  unint64_t v4 = [(IDSPeerIDKey *)self fromURI];
  id v5 = [(IDSPeerIDKey *)self toURI];
  unint64_t v6 = +[NSString stringWithFormat:@"<service:%@,from:%@,to:%@>", v3, v4, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPeerIDKey)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"service"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fromURI"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"toURI"];

  unint64_t v8 = [(IDSPeerIDKey *)self initWithService:v5 fromURI:v6 toURI:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSPeerIDKey *)self service];
  [v4 encodeObject:v5 forKey:@"service"];

  unint64_t v6 = [(IDSPeerIDKey *)self fromURI];
  [v4 encodeObject:v6 forKey:@"fromURI"];

  id v7 = [(IDSPeerIDKey *)self toURI];
  [v4 encodeObject:v7 forKey:@"toURI"];
}

- (NSString)service
{
  return self->_service;
}

- (IDSURI)fromURI
{
  return self->_fromURI;
}

- (IDSURI)toURI
{
  return self->_toURI;
}

- (BOOL)hasMatchingURIs
{
  return self->_hasMatchingURIs;
}

- (void)setHasMatchingURIs:(BOOL)a3
{
  self->_hasMatchingURIs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toURI, 0);
  objc_storeStrong((id *)&self->_fromURI, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end
@interface IDSPeerIDValue
+ (BOOL)supportsSecureCoding;
+ (id)peerIDValueWithEndpoints:(id)a3 keyTransparencyContext:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPeerIDValue:(id)a3;
- (IDSPeerIDValue)initWithCoder:(id)a3;
- (IDSPeerIDValue)initWithEndpoints:(id)a3 keyTransparencyContext:(id)a4;
- (IDSQueryKeyTransparencyContext)keyTransparencyContext;
- (NSArray)endpoints;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSPeerIDValue

+ (id)peerIDValueWithEndpoints:(id)a3 keyTransparencyContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithEndpoints:v7 keyTransparencyContext:v6];

  return v8;
}

- (IDSPeerIDValue)initWithEndpoints:(id)a3 keyTransparencyContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSPeerIDValue;
  id v8 = [(IDSPeerIDValue *)&v14 init];
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    endpoints = v8->_endpoints;
    v8->_endpoints = v9;

    v11 = (IDSQueryKeyTransparencyContext *)[v7 copy];
    keyTransparencyContext = v8->_keyTransparencyContext;
    v8->_keyTransparencyContext = v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IDSPeerIDValue *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(IDSPeerIDValue *)self isEqualToPeerIDValue:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToPeerIDValue:(id)a3
{
  id v6 = (IDSPeerIDValue *)a3;
  id v7 = v6;
  if (self == v6)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    if (v6)
    {
      id v8 = [(IDSPeerIDValue *)self endpoints];
      v9 = [(IDSPeerIDValue *)v7 endpoints];
      if (v8 == v9
        || ([(IDSPeerIDValue *)self endpoints],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(IDSPeerIDValue *)v7 endpoints],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        v11 = [(IDSPeerIDValue *)self keyTransparencyContext];
        v12 = [(IDSPeerIDValue *)v7 keyTransparencyContext];
        if (v11 == v12)
        {
          unsigned __int8 v10 = 1;
        }
        else
        {
          v13 = [(IDSPeerIDValue *)self keyTransparencyContext];
          objc_super v14 = [(IDSPeerIDValue *)v7 keyTransparencyContext];
          unsigned __int8 v10 = [v13 isEqual:v14];
        }
        if (v8 == v9) {
          goto LABEL_13;
        }
      }
      else
      {
        unsigned __int8 v10 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    unsigned __int8 v10 = 0;
  }
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  v2 = [(IDSPeerIDValue *)self endpoints];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(IDSPeerIDValue *)self endpoints];
  id v5 = [v4 count];
  id v6 = [(IDSPeerIDValue *)self keyTransparencyContext];
  id v7 = +[NSString stringWithFormat:@"<%@: %p endpoints.count: %lu, keyTransparencyContext: %@>", v3, self, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPeerIDValue)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
  id v7 = [v4 decodeObjectOfClasses:v6 forKey:@"endpoints"];

  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyTransparencyContext"];

  v9 = [(IDSPeerIDValue *)self initWithEndpoints:v7 keyTransparencyContext:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IDSPeerIDValue *)self endpoints];
  [v4 encodeObject:v5 forKey:@"endpoints"];

  id v6 = [(IDSPeerIDValue *)self keyTransparencyContext];
  [v4 encodeObject:v6 forKey:@"keyTransparencyContext"];
}

- (NSArray)endpoints
{
  return self->_endpoints;
}

- (IDSQueryKeyTransparencyContext)keyTransparencyContext
{
  return self->_keyTransparencyContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyTransparencyContext, 0);

  objc_storeStrong((id *)&self->_endpoints, 0);
}

@end
@interface _BMXPCConnectionCacheKey
- (BOOL)isEqual:(id)a3;
- (NSString)useCase;
- (_BMXPCConnectionCacheKey)initWithServiceType:(unint64_t)a3 domain:(unint64_t)a4 user:(unsigned int)a5 useCase:(id)a6 flags:(unint64_t)a7;
- (unint64_t)domain;
- (unint64_t)flags;
- (unint64_t)hash;
- (unint64_t)serviceType;
- (unsigned)user;
@end

@implementation _BMXPCConnectionCacheKey

- (unint64_t)hash
{
  v3 = [NSNumber numberWithUnsignedInteger:self->_serviceType];
  uint64_t v4 = [v3 hash];
  v5 = [NSNumber numberWithUnsignedInteger:self->_domain];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [NSNumber numberWithUnsignedInt:self->_user];
  uint64_t v8 = [v7 hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_useCase hash];
  v10 = [NSNumber numberWithUnsignedInteger:self->_flags];
  unint64_t v11 = v9 ^ [v10 hash];

  return v11;
}

- (void).cxx_destruct
{
}

- (_BMXPCConnectionCacheKey)initWithServiceType:(unint64_t)a3 domain:(unint64_t)a4 user:(unsigned int)a5 useCase:(id)a6 flags:(unint64_t)a7
{
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_BMXPCConnectionCacheKey;
  v14 = [(_BMXPCConnectionCacheKey *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_serviceType = a3;
    v14->_domain = a4;
    v14->_user = a5;
    objc_storeStrong((id *)&v14->_useCase, a6);
    v15->_flags = a7;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_BMXPCConnectionCacheKey *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = v5;
      BOOL v8 = self->_serviceType == v5->_serviceType
        && self->_domain == v5->_domain
        && self->_user == v5->_user
        && ((useCase = self->_useCase, useCase == v6->_useCase)
         || -[NSString isEqual:](useCase, "isEqual:"))
        && self->_flags == v6->_flags;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (unsigned)user
{
  return self->_user;
}

- (NSString)useCase
{
  return self->_useCase;
}

- (unint64_t)flags
{
  return self->_flags;
}

@end
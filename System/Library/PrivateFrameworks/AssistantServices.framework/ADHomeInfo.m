@interface ADHomeInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)personalDomainsIsEnabled;
- (BOOL)securePersonalDomainsRequireAuth;
- (NSUUID)currentHomeIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setCurrentHomeIdentifier:(id)a3;
- (void)setPersonalDomainsIsEnabled:(BOOL)a3;
- (void)setSecurePersonalDomainsRequireAuth:(BOOL)a3;
@end

@implementation ADHomeInfo

- (void).cxx_destruct
{
}

- (void)setCurrentHomeIdentifier:(id)a3
{
}

- (NSUUID)currentHomeIdentifier
{
  return self->_currentHomeIdentifier;
}

- (void)setSecurePersonalDomainsRequireAuth:(BOOL)a3
{
  self->_securePersonalDomainsRequireAuth = a3;
}

- (BOOL)securePersonalDomainsRequireAuth
{
  return self->_securePersonalDomainsRequireAuth;
}

- (void)setPersonalDomainsIsEnabled:(BOOL)a3
{
  self->_personalDomainsIsEnabled = a3;
}

- (BOOL)personalDomainsIsEnabled
{
  return self->_personalDomainsIsEnabled;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ADHomeInfo);
  [(ADHomeInfo *)v4 setPersonalDomainsIsEnabled:[(ADHomeInfo *)self personalDomainsIsEnabled]];
  [(ADHomeInfo *)v4 setSecurePersonalDomainsRequireAuth:[(ADHomeInfo *)self securePersonalDomainsRequireAuth]];
  v5 = [(ADHomeInfo *)self currentHomeIdentifier];
  [(ADHomeInfo *)v4 setCurrentHomeIdentifier:v5];

  return v4;
}

- (unint64_t)hash
{
  v3 = +[NSNumber numberWithBool:self->_personalDomainsIsEnabled];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = +[NSNumber numberWithBool:self->_securePersonalDomainsRequireAuth];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  unint64_t v7 = v6 ^ (unint64_t)[(NSUUID *)self->_currentHomeIdentifier hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    unint64_t v6 = v5;
    if (self->_personalDomainsIsEnabled == *((unsigned __int8 *)v5 + 8)
      && self->_securePersonalDomainsRequireAuth == *((unsigned __int8 *)v5 + 9))
    {
      currentHomeIdentifier = self->_currentHomeIdentifier;
      if ((unint64_t)currentHomeIdentifier | v6[2]) {
        unsigned __int8 v8 = -[NSUUID isEqual:](currentHomeIdentifier, "isEqual:");
      }
      else {
        unsigned __int8 v8 = 1;
      }
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v10.receiver = self;
  v10.super_class = (Class)ADHomeInfo;
  id v4 = [(ADHomeInfo *)&v10 description];
  unsigned int v5 = [(ADHomeInfo *)self personalDomainsIsEnabled];
  unsigned int v6 = [(ADHomeInfo *)self securePersonalDomainsRequireAuth];
  unint64_t v7 = [(ADHomeInfo *)self currentHomeIdentifier];
  id v8 = [v3 initWithFormat:@"%@ Personal Domains Enabled: %d Auth Required: %d, currentHomeIdentifier: %@", v4, v5, v6, v7];

  return v8;
}

@end
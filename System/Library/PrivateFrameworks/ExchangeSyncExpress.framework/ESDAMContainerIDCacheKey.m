@interface ESDAMContainerIDCacheKey
- (BOOL)isEqual:(id)a3;
- (ESDAMContainerIDCacheKey)initWithAccountID:(id)a3 andDataclass:(int64_t)a4;
- (NSString)accountID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)dataclass;
- (unint64_t)hash;
@end

@implementation ESDAMContainerIDCacheKey

- (ESDAMContainerIDCacheKey)initWithAccountID:(id)a3 andDataclass:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ESDAMContainerIDCacheKey;
  v8 = [(ESDAMContainerIDCacheKey *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accountID, a3);
    v9->_dataclass = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    accountID = self->_accountID;
    v6 = [v4 accountID];
    if ([(NSString *)accountID isEqualToString:v6])
    {
      int64_t dataclass = self->_dataclass;
      BOOL v8 = dataclass == [v4 dataclass];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_dataclass + [(NSString *)self->_accountID hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ESDAMContainerIDCacheKey allocWithZone:a3];
  accountID = self->_accountID;
  int64_t dataclass = self->_dataclass;
  return [(ESDAMContainerIDCacheKey *)v4 initWithAccountID:accountID andDataclass:dataclass];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p> Account ID: %@, data class: %ld", objc_opt_class(), self, self->_accountID, self->_dataclass];
}

- (NSString)accountID
{
  return self->_accountID;
}

- (int64_t)dataclass
{
  return self->_dataclass;
}

- (void).cxx_destruct
{
}

@end
@interface DKComponentPredicate
+ (id)componentPredicateMatchingComponentIdentity:(id)a3;
+ (id)componentPredicateWithDomain:(id)a3 exactMatch:(BOOL)a4;
+ (id)componentPredicateWithType:(id)a3 identifier:(id)a4;
- (BOOL)exactMatch;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToComponentPredicate:(id)a3;
- (BOOL)matchesComponentIdentity:(id)a3;
- (DKComponentPredicate)initWithDomain:(id)a3 exactMatch:(BOOL)a4;
- (DKComponentPredicate)initWithType:(id)a3 identifier:(id)a4;
- (NSString)domain;
- (NSString)identifier;
- (NSString)type;
- (unint64_t)hash;
@end

@implementation DKComponentPredicate

+ (id)componentPredicateWithDomain:(id)a3 exactMatch:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithDomain:v6 exactMatch:v4];

  return v7;
}

- (DKComponentPredicate)initWithDomain:(id)a3 exactMatch:(BOOL)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DKComponentPredicate;
  v8 = [(DKComponentPredicate *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_domain, a3);
    v10 = [v7 componentsSeparatedByString:@"."];
    uint64_t v11 = [v10 objectAtIndexedSubscript:0];
    type = v9->_type;
    v9->_type = (NSString *)v11;

    if ((unint64_t)[v10 count] >= 2)
    {
      uint64_t v13 = [v10 objectAtIndexedSubscript:1];
      identifier = v9->_identifier;
      v9->_identifier = (NSString *)v13;
    }
    v9->_exactMatch = a4;
  }
  return v9;
}

+ (id)componentPredicateWithType:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithType:v7 identifier:v6];

  return v8;
}

- (DKComponentPredicate)initWithType:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DKComponentPredicate;
  v9 = [(DKComponentPredicate *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
    p_domain = (id *)&v10->_domain;
    objc_storeStrong((id *)&v10->_domain, a3);
    if (v8)
    {
      v12 = [*p_domain stringByAppendingString:@"."];
      uint64_t v13 = [v12 stringByAppendingString:v8];
      id v14 = *p_domain;
      id *p_domain = (id)v13;
    }
  }

  return v10;
}

+ (id)componentPredicateMatchingComponentIdentity:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [v4 domain];

  id v7 = (void *)[v5 initWithDomain:v6 exactMatch:1];
  return v7;
}

- (BOOL)matchesComponentIdentity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domain];
  id v6 = [(DKComponentPredicate *)self domain];
  char v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    char v8 = 1;
  }
  else if ([(DKComponentPredicate *)self exactMatch])
  {
    char v8 = 0;
  }
  else
  {
    v9 = [v4 domain];
    v10 = [v9 stringByAppendingString:@"."];

    uint64_t v11 = [(DKComponentPredicate *)self domain];
    char v8 = [v10 hasPrefix:v11];
  }
  return v8;
}

- (unint64_t)hash
{
  v3 = [(DKComponentPredicate *)self domain];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = v4 + ([(DKComponentPredicate *)self exactMatch] ^ 1);

  return v5;
}

- (BOOL)isEqualToComponentPredicate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(DKComponentPredicate *)self domain];
  id v6 = [v4 domain];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DKComponentPredicate *)a3;
  BOOL v5 = self == v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(DKComponentPredicate *)self isEqualToComponentPredicate:v4];
  }

  return v5;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)domain
{
  return self->_domain;
}

- (BOOL)exactMatch
{
  return self->_exactMatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
@interface ILMessageFilterCapabilitiesQueryResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCapabilitiesResponse:(id)a3;
- (ILMessageFilterCapabilitiesQueryResponse)init;
- (ILMessageFilterCapabilitiesQueryResponse)initWithCoder:(id)a3;
- (NSArray)promotionalSubActions;
- (NSArray)transactionalSubActions;
- (NSString)version;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPromotionalSubActions:(NSArray *)promotionalSubActions;
- (void)setTransactionalSubActions:(NSArray *)transactionalSubActions;
- (void)setVersion:(id)a3;
@end

@implementation ILMessageFilterCapabilitiesQueryResponse

- (ILMessageFilterCapabilitiesQueryResponse)init
{
  v8.receiver = self;
  v8.super_class = (Class)ILMessageFilterCapabilitiesQueryResponse;
  v2 = [(ILMessageFilterCapabilitiesQueryResponse *)&v8 init];
  v3 = v2;
  if (v2)
  {
    promotionalSubActions = v2->_promotionalSubActions;
    v5 = (NSArray *)MEMORY[0x263EFFA68];
    v2->_promotionalSubActions = (NSArray *)MEMORY[0x263EFFA68];

    transactionalSubActions = v3->_transactionalSubActions;
    v3->_transactionalSubActions = v5;
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(ILMessageFilterCapabilitiesQueryResponse *)self transactionalSubActions];
  v6 = [(ILMessageFilterCapabilitiesQueryResponse *)self promotionalSubActions];
  v7 = [(ILMessageFilterCapabilitiesQueryResponse *)self version];
  objc_super v8 = [v3 stringWithFormat:@"<%@ %p subActions transactionalSubActions=%p promotionalSubActions=%p version=%@>", v4, self, v5, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(ILMessageFilterCapabilitiesQueryResponse *)self isEqualToCapabilitiesResponse:v4];

  return v5;
}

- (BOOL)isEqualToCapabilitiesResponse:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F08760]);
  v6 = [(ILMessageFilterCapabilitiesQueryResponse *)self transactionalSubActions];
  v7 = (void *)[v5 initWithArray:v6];

  id v8 = objc_alloc(MEMORY[0x263F08760]);
  v9 = [v4 transactionalSubActions];
  v10 = (void *)[v8 initWithArray:v9];

  id v11 = objc_alloc(MEMORY[0x263F08760]);
  v12 = [(ILMessageFilterCapabilitiesQueryResponse *)self promotionalSubActions];
  v13 = (void *)[v11 initWithArray:v12];

  id v14 = objc_alloc(MEMORY[0x263F08760]);
  v15 = [v4 promotionalSubActions];
  v16 = (void *)[v14 initWithArray:v15];

  if ([v7 isEqualToSet:v10] && objc_msgSend(v13, "isEqualToSet:", v16))
  {
    v17 = [(ILMessageFilterCapabilitiesQueryResponse *)self version];
    v18 = [v4 version];
    char v19 = [v17 isEqualToString:v18];
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  v3 = [(ILMessageFilterCapabilitiesQueryResponse *)self transactionalSubActions];
  uint64_t v4 = [v3 hash];
  id v5 = [(ILMessageFilterCapabilitiesQueryResponse *)self promotionalSubActions];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(ILMessageFilterCapabilitiesQueryResponse *)self version];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILMessageFilterCapabilitiesQueryResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ILMessageFilterCapabilitiesQueryResponse;
  id v5 = [(ILMessageFilterCapabilitiesQueryResponse *)&v19 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_promotionalSubActions);
    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:v6 forKey:v7];
    promotionalSubActions = v5->_promotionalSubActions;
    v5->_promotionalSubActions = (NSArray *)v8;

    uint64_t v10 = objc_opt_class();
    id v11 = NSStringFromSelector(sel_transactionalSubActions);
    uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:v10 forKey:v11];
    transactionalSubActions = v5->_transactionalSubActions;
    v5->_transactionalSubActions = (NSArray *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_version);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    version = v5->_version;
    v5->_version = (NSString *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  promotionalSubActions = self->_promotionalSubActions;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_promotionalSubActions);
  [v5 encodeObject:promotionalSubActions forKey:v6];

  transactionalSubActions = self->_transactionalSubActions;
  uint64_t v8 = NSStringFromSelector(sel_transactionalSubActions);
  [v5 encodeObject:transactionalSubActions forKey:v8];

  version = self->_version;
  NSStringFromSelector(sel_version);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:version forKey:v10];
}

- (NSArray)transactionalSubActions
{
  return self->_transactionalSubActions;
}

- (void)setTransactionalSubActions:(NSArray *)transactionalSubActions
{
}

- (NSArray)promotionalSubActions
{
  return self->_promotionalSubActions;
}

- (void)setPromotionalSubActions:(NSArray *)promotionalSubActions
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_promotionalSubActions, 0);

  objc_storeStrong((id *)&self->_transactionalSubActions, 0);
}

@end
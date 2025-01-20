@interface BCSDomainItemIdentifier
+ (id)identifierWithType:(int64_t)a3 domain:(id)a4;
- (BCSDomainItemIdentifier)initWithType:(int64_t)a3 domain:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)domain;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)setDomain:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation BCSDomainItemIdentifier

+ (id)identifierWithType:(int64_t)a3 domain:(id)a4
{
  id v5 = a4;
  v6 = [[BCSDomainItemIdentifier alloc] initWithType:a3 domain:v5];

  return v6;
}

- (BCSDomainItemIdentifier)initWithType:(int64_t)a3 domain:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BCSDomainItemIdentifier;
  v8 = [(BCSDomainItemIdentifier *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_domain, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int64_t v6 = [(BCSDomainItemIdentifier *)self type];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __35__BCSDomainItemIdentifier_isEqual___block_invoke;
  v18[3] = &unk_264248A78;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendInteger:v6 counterpart:v18];
  v9 = [(BCSDomainItemIdentifier *)self domain];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __35__BCSDomainItemIdentifier_isEqual___block_invoke_2;
  v16 = &unk_264248AA0;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendString:v9 counterpart:&v13];

  LOBYTE(v9) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);
  return (char)v9;
}

uint64_t __35__BCSDomainItemIdentifier_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) type];
}

uint64_t __35__BCSDomainItemIdentifier_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) domain];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:", -[BCSDomainItemIdentifier type](self, "type"));
  id v5 = [(BCSDomainItemIdentifier *)self domain];
  id v6 = (id)[v3 appendString:v5];

  unint64_t v7 = [v3 hash];
  return v7;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[BCSDomainItemIdentifier type](self, "type"), @"type");
  id v5 = [(BCSDomainItemIdentifier *)self domain];
  [v3 appendString:v5 withName:@"domain"];

  id v6 = [v3 build];

  return (NSString *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[BCSDomainItemIdentifier allocWithZone:a3];
  int64_t v5 = [(BCSDomainItemIdentifier *)self type];
  id v6 = [(BCSDomainItemIdentifier *)self domain];
  unint64_t v7 = [(BCSDomainItemIdentifier *)v4 initWithType:v5 domain:v6];

  return v7;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
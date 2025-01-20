@interface AFCreditCard
- (AFCreditCard)initWithName:(id)a3 number:(id)a4 expiration:(id)a5 securityCode:(id)a6 type:(id)a7 nickname:(id)a8 suffix:(id)a9;
- (NSString)expiration;
- (NSString)name;
- (NSString)nickname;
- (NSString)number;
- (NSString)securityCode;
- (NSString)suffix;
- (NSString)type;
- (id)description;
- (void)setExpiration:(id)a3;
- (void)setName:(id)a3;
- (void)setNickname:(id)a3;
- (void)setNumber:(id)a3;
- (void)setSecurityCode:(id)a3;
- (void)setSuffix:(id)a3;
- (void)setType:(id)a3;
@end

@implementation AFCreditCard

- (AFCreditCard)initWithName:(id)a3 number:(id)a4 expiration:(id)a5 securityCode:(id)a6 type:(id)a7 nickname:(id)a8 suffix:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)AFCreditCard;
  v22 = [(AFCreditCard *)&v38 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    name = v22->_name;
    v22->_name = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    number = v22->_number;
    v22->_number = (NSString *)v25;

    uint64_t v27 = [v18 copy];
    securityCode = v22->_securityCode;
    v22->_securityCode = (NSString *)v27;

    uint64_t v29 = [v17 copy];
    expiration = v22->_expiration;
    v22->_expiration = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    type = v22->_type;
    v22->_type = (NSString *)v31;

    uint64_t v33 = [v20 copy];
    nickname = v22->_nickname;
    v22->_nickname = (NSString *)v33;

    uint64_t v35 = [v21 copy];
    suffix = v22->_suffix;
    v22->_suffix = (NSString *)v35;
  }
  return v22;
}

- (id)description
{
  v3 = NSString;
  v4 = [(AFCreditCard *)self name];
  v5 = [(AFCreditCard *)self number];
  v6 = [(AFCreditCard *)self expiration];
  v7 = [(AFCreditCard *)self securityCode];
  v8 = [(AFCreditCard *)self type];
  v9 = [(AFCreditCard *)self nickname];
  v10 = [(AFCreditCard *)self suffix];
  v11 = [v3 stringWithFormat:@"<CreditCard: %p, name: %@, number: %@, expiration: %@, securityCode: %@, type: %@, nickname: %@, suffix: %@>", self, v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
}

- (NSString)securityCode
{
  return self->_securityCode;
}

- (void)setSecurityCode:(id)a3
{
}

- (NSString)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
}

- (NSString)suffix
{
  return self->_suffix;
}

- (void)setSuffix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_securityCode, 0);
  objc_storeStrong((id *)&self->_number, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end
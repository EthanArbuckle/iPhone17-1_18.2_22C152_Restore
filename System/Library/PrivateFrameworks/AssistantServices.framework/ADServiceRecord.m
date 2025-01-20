@interface ADServiceRecord
- (ADServiceRecord)initWithService:(id)a3 precedence:(int64_t)a4;
- (BOOL)hasEqualOrHigherPrecedenceThanServiceRecord:(id)a3;
- (id)description;
- (id)service;
- (int64_t)precedence;
@end

@implementation ADServiceRecord

- (void).cxx_destruct
{
}

- (BOOL)hasEqualOrHigherPrecedenceThanServiceRecord:(id)a3
{
  if (!a3) {
    return 1;
  }
  id v4 = a3;
  int64_t v5 = [(ADServiceRecord *)self precedence];
  id v6 = [v4 precedence];

  return v5 != 1 || v6 != 0;
}

- (int64_t)precedence
{
  return self->_precedence;
}

- (id)service
{
  return self->_service;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(ADService *)self->_service identifier];
  id v6 = [v3 initWithFormat:@"<%@: Identifier: %@>", v4, v5];

  return v6;
}

- (ADServiceRecord)initWithService:(id)a3 precedence:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ADServiceRecord;
  v8 = [(ADServiceRecord *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_service, a3);
    v9->_precedence = a4;
  }

  return v9;
}

@end
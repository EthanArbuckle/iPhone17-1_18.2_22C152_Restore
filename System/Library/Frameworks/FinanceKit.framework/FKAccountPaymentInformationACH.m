@interface FKAccountPaymentInformationACH
- (BOOL)isEqual:(id)a3;
- (FKAccountPaymentInformationACH)initWithAccountNumber:(id)a3 routingNumber:(id)a4;
- (NSString)accountNumber;
- (NSString)routingNumber;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation FKAccountPaymentInformationACH

- (FKAccountPaymentInformationACH)initWithAccountNumber:(id)a3 routingNumber:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FKAccountPaymentInformationACH;
  v9 = [(FKAccountPaymentInformationACH *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountNumber, a3);
    objc_storeStrong((id *)&v10->_routingNumber, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [FKAccountPaymentInformationACH alloc];
  v6 = (void *)[(NSString *)self->_accountNumber copyWithZone:a3];
  id v7 = (void *)[(NSString *)self->_routingNumber copyWithZone:a3];
  id v8 = [(FKAccountPaymentInformationACH *)v5 initWithAccountNumber:v6 routingNumber:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FKAccountPaymentInformationACH *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (FKEqualObjects(self->_accountNumber, v6[1])) {
      char v7 = FKEqualObjects(self->_routingNumber, v6[2]);
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (NSString)routingNumber
{
  return self->_routingNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingNumber, 0);

  objc_storeStrong((id *)&self->_accountNumber, 0);
}

@end
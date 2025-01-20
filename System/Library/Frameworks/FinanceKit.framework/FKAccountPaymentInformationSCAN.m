@interface FKAccountPaymentInformationSCAN
- (BOOL)isEqual:(id)a3;
- (FKAccountPaymentInformationSCAN)initWithAccountNumber:(id)a3 sortCode:(id)a4;
- (NSString)accountNumber;
- (NSString)sortCode;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation FKAccountPaymentInformationSCAN

- (FKAccountPaymentInformationSCAN)initWithAccountNumber:(id)a3 sortCode:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FKAccountPaymentInformationSCAN;
  v9 = [(FKAccountPaymentInformationSCAN *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountNumber, a3);
    objc_storeStrong((id *)&v10->_sortCode, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [FKAccountPaymentInformationSCAN alloc];
  v6 = (void *)[(NSString *)self->_accountNumber copyWithZone:a3];
  id v7 = (void *)[(NSString *)self->_sortCode copyWithZone:a3];
  id v8 = [(FKAccountPaymentInformationSCAN *)v5 initWithAccountNumber:v6 sortCode:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FKAccountPaymentInformationSCAN *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (FKEqualObjects(self->_accountNumber, v6[1])) {
      char v7 = FKEqualObjects(self->_sortCode, v6[2]);
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

- (NSString)sortCode
{
  return self->_sortCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortCode, 0);

  objc_storeStrong((id *)&self->_accountNumber, 0);
}

@end
@interface FHTransactionMerchantGroup
+ (BOOL)supportsSecureCoding;
- (FHTransactionMerchantGroup)initWithCoder:(id)a3;
- (FHTransactionMerchantGroup)initWithMerchantMuid:(unint64_t)a3 groupIdentifier:(id)a4 transactionIds:(id)a5 creditDebitType:(unint64_t)a6 category:(id)a7;
- (unint64_t)merchantMuid;
- (void)encodeWithCoder:(id)a3;
- (void)setMerchantMuid:(unint64_t)a3;
@end

@implementation FHTransactionMerchantGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FHTransactionMerchantGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FHTransactionMerchantGroup;
  v5 = [(FHTransactionGroup *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_merchantMuid = [v4 decodeIntegerForKey:@"merchantMuid"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FHTransactionMerchantGroup;
  id v4 = a3;
  [(FHTransactionGroup *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_merchantMuid, @"merchantMuid", v5.receiver, v5.super_class);
}

- (FHTransactionMerchantGroup)initWithMerchantMuid:(unint64_t)a3 groupIdentifier:(id)a4 transactionIds:(id)a5 creditDebitType:(unint64_t)a6 category:(id)a7
{
  v11.receiver = self;
  v11.super_class = (Class)FHTransactionMerchantGroup;
  v8 = [(FHTransactionGroup *)&v11 initWithGroupIdentifier:a4 transactionIds:a5 groupingMethod:2 creditDebitType:a6 category:a7];
  v9 = v8;
  if (v8) {
    [(FHTransactionMerchantGroup *)v8 setMerchantMuid:a3];
  }
  return v9;
}

- (unint64_t)merchantMuid
{
  return self->_merchantMuid;
}

- (void)setMerchantMuid:(unint64_t)a3
{
  self->_merchantMuid = a3;
}

@end
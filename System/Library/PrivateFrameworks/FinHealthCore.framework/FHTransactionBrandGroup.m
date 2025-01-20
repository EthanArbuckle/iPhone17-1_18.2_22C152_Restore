@interface FHTransactionBrandGroup
+ (BOOL)supportsSecureCoding;
- (FHTransactionBrandGroup)initWithBrandMuid:(unint64_t)a3 groupIdentifier:(id)a4 transactionIds:(id)a5 creditDebitType:(unint64_t)a6 category:(id)a7;
- (FHTransactionBrandGroup)initWithCoder:(id)a3;
- (unint64_t)brandMuid;
- (void)encodeWithCoder:(id)a3;
- (void)setBrandMuid:(unint64_t)a3;
@end

@implementation FHTransactionBrandGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FHTransactionBrandGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FHTransactionBrandGroup;
  v5 = [(FHTransactionGroup *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_brandMuid = [v4 decodeIntegerForKey:@"brandMuid"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FHTransactionBrandGroup;
  id v4 = a3;
  [(FHTransactionGroup *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_brandMuid, @"brandMuid", v5.receiver, v5.super_class);
}

- (FHTransactionBrandGroup)initWithBrandMuid:(unint64_t)a3 groupIdentifier:(id)a4 transactionIds:(id)a5 creditDebitType:(unint64_t)a6 category:(id)a7
{
  v11.receiver = self;
  v11.super_class = (Class)FHTransactionBrandGroup;
  v8 = [(FHTransactionGroup *)&v11 initWithGroupIdentifier:a4 transactionIds:a5 groupingMethod:1 creditDebitType:a6 category:a7];
  v9 = v8;
  if (v8) {
    [(FHTransactionBrandGroup *)v8 setBrandMuid:a3];
  }
  return v9;
}

- (unint64_t)brandMuid
{
  return self->_brandMuid;
}

- (void)setBrandMuid:(unint64_t)a3
{
  self->_brandMuid = a3;
}

@end
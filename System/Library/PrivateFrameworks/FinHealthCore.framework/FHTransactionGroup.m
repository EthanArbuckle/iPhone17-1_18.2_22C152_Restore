@interface FHTransactionGroup
+ (BOOL)supportsSecureCoding;
- (FHTransactionGroup)initWithCoder:(id)a3;
- (FHTransactionGroup)initWithGroupIdentifier:(id)a3 transactionIds:(id)a4 groupingMethod:(unint64_t)a5 creditDebitType:(unint64_t)a6 category:(id)a7;
- (NSArray)transactionIds;
- (NSString)category;
- (NSString)groupIdentifier;
- (unint64_t)creditDebitType;
- (unint64_t)groupingMethod;
- (void)encodeWithCoder:(id)a3;
- (void)setCategory:(id)a3;
- (void)setCreditDebitType:(unint64_t)a3;
- (void)setGroupingMethod:(unint64_t)a3;
- (void)setTransactionIds:(id)a3;
@end

@implementation FHTransactionGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FHTransactionGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FHTransactionGroup;
  v5 = [(FHTransactionGroup *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupIdentifier"];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"transactionIds"];
    transactionIds = v5->_transactionIds;
    v5->_transactionIds = (NSArray *)v11;

    v5->_groupingMethod = [v4 decodeIntegerForKey:@"groupingMethod"];
    v5->_creditDebitType = [v4 decodeIntegerForKey:@"creditDebitType"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
    category = v5->_category;
    v5->_category = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  groupIdentifier = self->_groupIdentifier;
  id v5 = a3;
  [v5 encodeObject:groupIdentifier forKey:@"groupIdentifier"];
  [v5 encodeObject:self->_transactionIds forKey:@"transactionIds"];
  [v5 encodeInteger:self->_groupingMethod forKey:@"groupingMethod"];
  [v5 encodeInteger:self->_creditDebitType forKey:@"creditDebitType"];
  [v5 encodeObject:self->_category forKey:@"category"];
}

- (FHTransactionGroup)initWithGroupIdentifier:(id)a3 transactionIds:(id)a4 groupingMethod:(unint64_t)a5 creditDebitType:(unint64_t)a6 category:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)FHTransactionGroup;
  objc_super v16 = [(FHTransactionGroup *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_groupIdentifier, a3);
    objc_storeStrong((id *)&v17->_transactionIds, a4);
    v17->_groupingMethod = a5;
    v17->_creditDebitType = a6;
    objc_storeStrong((id *)&v17->_category, a7);
  }

  return v17;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSArray)transactionIds
{
  return self->_transactionIds;
}

- (void)setTransactionIds:(id)a3
{
}

- (unint64_t)groupingMethod
{
  return self->_groupingMethod;
}

- (void)setGroupingMethod:(unint64_t)a3
{
  self->_groupingMethod = a3;
}

- (unint64_t)creditDebitType
{
  return self->_creditDebitType;
}

- (void)setCreditDebitType:(unint64_t)a3
{
  self->_creditDebitType = a3;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_transactionIds, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end
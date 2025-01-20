@interface FHTransactionDescriptionGroup
+ (BOOL)supportsSecureCoding;
- (FHTransactionDescriptionGroup)initWithCoder:(id)a3;
- (FHTransactionDescriptionGroup)initWithExemplarDescription:(id)a3 groupIdentifier:(id)a4 transactionIds:(id)a5 creditDebitType:(unint64_t)a6 category:(id)a7;
- (NSString)exemplarDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setExemplarDescription:(id)a3;
@end

@implementation FHTransactionDescriptionGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FHTransactionDescriptionGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FHTransactionDescriptionGroup;
  v5 = [(FHTransactionGroup *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_exemplarDescription = (NSString *)(id)[v4 decodeObjectOfClass:objc_opt_class() forKey:@"exemplarDescription"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FHTransactionDescriptionGroup;
  id v4 = a3;
  [(FHTransactionGroup *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_exemplarDescription, @"exemplarDescription", v5.receiver, v5.super_class);
}

- (FHTransactionDescriptionGroup)initWithExemplarDescription:(id)a3 groupIdentifier:(id)a4 transactionIds:(id)a5 creditDebitType:(unint64_t)a6 category:(id)a7
{
  id v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FHTransactionDescriptionGroup;
  v13 = [(FHTransactionGroup *)&v16 initWithGroupIdentifier:a4 transactionIds:a5 groupingMethod:3 creditDebitType:a6 category:a7];
  v14 = v13;
  if (v13) {
    [(FHTransactionDescriptionGroup *)v13 setExemplarDescription:v12];
  }

  return v14;
}

- (NSString)exemplarDescription
{
  return self->_exemplarDescription;
}

- (void)setExemplarDescription:(id)a3
{
  self->_exemplarDescription = (NSString *)a3;
}

@end
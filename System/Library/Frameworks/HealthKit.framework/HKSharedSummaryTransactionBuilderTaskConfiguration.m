@interface HKSharedSummaryTransactionBuilderTaskConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)allowCommitted;
- (HKSharedSummaryTransactionBuilderTaskConfiguration)initWithCoder:(id)a3;
- (NSUUID)transactionUUID;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowCommitted:(BOOL)a3;
- (void)setTransactionUUID:(id)a3;
@end

@implementation HKSharedSummaryTransactionBuilderTaskConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSharedSummaryTransactionBuilderTaskConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSharedSummaryTransactionBuilderTaskConfiguration;
  v5 = [(HKTaskConfiguration *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionUUID"];
    transactionUUID = v5->_transactionUUID;
    v5->_transactionUUID = (NSUUID *)v6;

    v5->_allowCommitted = [v4 decodeBoolForKey:@"allowCommitted"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKSharedSummaryTransactionBuilderTaskConfiguration;
  id v4 = a3;
  [(HKTaskConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionUUID, @"transactionUUID", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_allowCommitted forKey:@"allowCommitted"];
}

- (NSUUID)transactionUUID
{
  return self->_transactionUUID;
}

- (void)setTransactionUUID:(id)a3
{
}

- (BOOL)allowCommitted
{
  return self->_allowCommitted;
}

- (void)setAllowCommitted:(BOOL)a3
{
  self->_allowCommitted = a3;
}

- (void).cxx_destruct
{
}

@end
@interface _HKSharedSummaryTransactionQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)committedTransactions;
- (_HKSharedSummaryTransactionQueryServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCommittedTransactions:(BOOL)a3;
@end

@implementation _HKSharedSummaryTransactionQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKSharedSummaryTransactionQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setCommittedTransactions:self->_committedTransactions];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKSharedSummaryTransactionQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_HKSharedSummaryTransactionQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_committedTransactions = [v4 decodeBoolForKey:@"committed-transactions"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKSharedSummaryTransactionQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_committedTransactions, @"committed-transactions", v5.receiver, v5.super_class);
}

- (BOOL)committedTransactions
{
  return self->_committedTransactions;
}

- (void)setCommittedTransactions:(BOOL)a3
{
  self->_committedTransactions = a3;
}

@end
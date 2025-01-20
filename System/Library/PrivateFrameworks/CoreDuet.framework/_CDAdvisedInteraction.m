@interface _CDAdvisedInteraction
+ (BOOL)supportsSecureCoding;
- (NSSet)reasons;
- (NSString)account;
- (NSString)bundleId;
- (_CDAdvisedInteraction)initWithCoder:(id)a3;
- (_CDContact)contact;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionOfReasons:(id)a3;
- (int64_t)mechanism;
- (int64_t)similarBidirectionalInteractionsCount;
- (int64_t)similarIncomingInteractionsCount;
- (int64_t)similarOutgoingInteractionsCount;
- (void)addReason:(int64_t)a3;
- (void)addReasons:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccount:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setContact:(id)a3;
- (void)setMechanism:(int64_t)a3;
- (void)setReasons:(id)a3;
- (void)setScore:(double)a3;
- (void)setSimilarBidirectionalInteractionsCount:(int64_t)a3;
- (void)setSimilarIncomingInteractionsCount:(int64_t)a3;
- (void)setSimilarOutgoingInteractionsCount:(int64_t)a3;
@end

@implementation _CDAdvisedInteraction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CDAdvisedInteraction)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_CDAdvisedInteraction;
  v5 = [(_CDAdvisedInteraction *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contact"];
    contact = v5->_contact;
    v5->_contact = (_CDContact *)v6;

    [v4 decodeDoubleForKey:@"score"];
    v5->_score = v8;
    v5->_mechanism = [v4 decodeInt64ForKey:@"mechanism"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"account"];
    account = v5->_account;
    v5->_account = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectForKey:@"reasons"];
    reasons = v5->_reasons;
    v5->_reasons = (NSMutableSet *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  contact = self->_contact;
  id v5 = a3;
  [v5 encodeObject:contact forKey:@"contact"];
  [v5 encodeDouble:@"score" forKey:self->_score];
  [v5 encodeInt64:self->_mechanism forKey:@"mechanism"];
  [v5 encodeObject:self->_bundleId forKey:@"bundleId"];
  [v5 encodeObject:self->_account forKey:@"account"];
  [v5 encodeObject:self->_reasons forKey:@"reasons"];
}

- (id)descriptionOfReasons:(id)a3
{
  if (a3)
  {
    v3 = [a3 allObjects];
    id v4 = [MEMORY[0x1E4F28E78] stringWithString:@"["];
    if ([v3 count])
    {
      unint64_t v5 = 0;
      do
      {
        uint64_t v6 = [v3 objectAtIndexedSubscript:v5];
        uint64_t v7 = [v6 integerValue];

        double v8 = reasonToString(v7);
        [(__CFString *)v4 appendFormat:@"%@(%ld)", v8, v7];

        if (v5 != [v3 count] - 1) {
          [(__CFString *)v4 appendString:@","];
        }
        ++v5;
      }
      while ([v3 count] > v5);
    }
    [(__CFString *)v4 appendString:@"]"];
  }
  else
  {
    id v4 = @"nil";
  }
  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendString:@"Advice { \n"];
  id v4 = [(_CDAdvisedInteraction *)self contact];
  [v3 appendFormat:@"    contact: %@\n", v4];

  [(_CDAdvisedInteraction *)self score];
  objc_msgSend(v3, "appendFormat:", @"      score: %f\n", v5);
  uint64_t v6 = mechanismToString([(_CDAdvisedInteraction *)self mechanism]);
  [v3 appendFormat:@"  mechanism: %@(%ld)\n", v6, -[_CDAdvisedInteraction mechanism](self, "mechanism")];

  uint64_t v7 = [(_CDAdvisedInteraction *)self reasons];
  double v8 = [(_CDAdvisedInteraction *)self descriptionOfReasons:v7];
  [v3 appendFormat:@"    reasons: %@\n", v8];

  uint64_t v9 = [(_CDAdvisedInteraction *)self bundleId];
  [v3 appendFormat:@"   bundleId: %@\n", v9];

  v10 = [(_CDAdvisedInteraction *)self account];
  [v3 appendFormat:@"    account: %@\n", v10];

  [v3 appendString:@"}\n"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(_CDAdvisedInteraction);
  uint64_t v5 = [(_CDAdvisedInteraction *)self contact];
  uint64_t v6 = (void *)[v5 copy];
  [(_CDAdvisedInteraction *)v4 setContact:v6];

  [(_CDAdvisedInteraction *)self score];
  -[_CDAdvisedInteraction setScore:](v4, "setScore:");
  [(_CDAdvisedInteraction *)v4 setMechanism:[(_CDAdvisedInteraction *)self mechanism]];
  uint64_t v7 = [(_CDAdvisedInteraction *)self reasons];
  double v8 = (void *)[v7 copy];
  [(_CDAdvisedInteraction *)v4 setReasons:v8];

  uint64_t v9 = [(_CDAdvisedInteraction *)self bundleId];
  [(_CDAdvisedInteraction *)v4 setBundleId:v9];

  v10 = [(_CDAdvisedInteraction *)self account];
  [(_CDAdvisedInteraction *)v4 setAccount:v10];

  return v4;
}

- (NSSet)reasons
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_reasons;
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)setReasons:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 mutableCopy];
  reasons = v4->_reasons;
  v4->_reasons = (NSMutableSet *)v5;

  objc_sync_exit(v4);
}

- (void)addReason:(int64_t)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [NSNumber numberWithInteger:a3];
  uint64_t v5 = [v4 setWithObject:v6];
  [(_CDAdvisedInteraction *)self addReasons:v5];
}

- (void)addReasons:(id)a3
{
  id v8 = a3;
  if ([v8 count])
  {
    id v4 = self;
    objc_sync_enter(v4);
    reasons = v4->_reasons;
    if (reasons)
    {
      [(NSMutableSet *)reasons unionSet:v8];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA80] setWithSet:v8];
      id v7 = v4->_reasons;
      v4->_reasons = (NSMutableSet *)v6;
    }
    objc_sync_exit(v4);
  }
}

- (_CDContact)contact
{
  return (_CDContact *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContact:(id)a3
{
}

- (NSString)account
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccount:(id)a3
{
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBundleId:(id)a3
{
}

- (int64_t)mechanism
{
  return self->_mechanism;
}

- (void)setMechanism:(int64_t)a3
{
  self->_mechanism = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (int64_t)similarOutgoingInteractionsCount
{
  return self->_similarOutgoingInteractionsCount;
}

- (void)setSimilarOutgoingInteractionsCount:(int64_t)a3
{
  self->_similarOutgoingInteractionsCount = a3;
}

- (int64_t)similarIncomingInteractionsCount
{
  return self->_similarIncomingInteractionsCount;
}

- (void)setSimilarIncomingInteractionsCount:(int64_t)a3
{
  self->_similarIncomingInteractionsCount = a3;
}

- (int64_t)similarBidirectionalInteractionsCount
{
  return self->_similarBidirectionalInteractionsCount;
}

- (void)setSimilarBidirectionalInteractionsCount:(int64_t)a3
{
  self->_similarBidirectionalInteractionsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_reasons, 0);
}

@end
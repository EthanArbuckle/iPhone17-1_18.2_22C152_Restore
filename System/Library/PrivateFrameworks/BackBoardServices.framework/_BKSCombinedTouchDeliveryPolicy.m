@interface _BKSCombinedTouchDeliveryPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)policies;
- (_BKSCombinedTouchDeliveryPolicy)initWithCoder:(id)a3;
- (_BKSCombinedTouchDeliveryPolicy)initWithPolicies:(id)a3;
- (id)assertionEndpoint;
- (id)matchSharingTouchesPolicy:(id)a3 orCancelTouchesPolicy:(id)a4 orCombinedPolicy:(id)a5;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAssertionEndpoint:(id)a3;
@end

@implementation _BKSCombinedTouchDeliveryPolicy

- (void).cxx_destruct
{
}

- (id)matchSharingTouchesPolicy:(id)a3 orCancelTouchesPolicy:(id)a4 orCombinedPolicy:(id)a5
{
  return (id)(*((uint64_t (**)(id, NSArray *))a5 + 2))(a5, self->_policies);
}

- (_BKSCombinedTouchDeliveryPolicy)initWithPolicies:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_BKSCombinedTouchDeliveryPolicy;
  v6 = [(_BKSCombinedTouchDeliveryPolicy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_policies, a3);
  }

  return v7;
}

- (NSArray)policies
{
  return self->_policies;
}

- (void)setAssertionEndpoint:(id)a3
{
}

- (id)assertionEndpoint
{
  return 0;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v6 = a3;
  v4 = [(_BKSCombinedTouchDeliveryPolicy *)self policies];
  id v5 = (id)[v6 appendObject:v4 withName:@"combination"];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_BKSCombinedTouchDeliveryPolicy *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(NSArray *)self->_policies isEqualToArray:v5->_policies];

  return v6;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  v4 = [(_BKSCombinedTouchDeliveryPolicy *)self policies];
  id v5 = (id)[v3 appendObject:v4];

  unint64_t v6 = [v3 hash];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"<%@: %p> may only be encoded by an NSXPCCoder.", objc_opt_class(), self format];
  }
  v4 = [(_BKSCombinedTouchDeliveryPolicy *)self policies];
  id v5 = [@"BKSTouchDeliveryPolicy" stringByAppendingString:@"Policies"];
  [v6 encodeObject:v4 forKey:v5];
}

- (_BKSCombinedTouchDeliveryPolicy)initWithCoder:(id)a3
{
  v12[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"<%@: %p> may only be decoded by an NSXPCCoder.", objc_opt_class(), self format];
  }
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
  v7 = [v5 setWithArray:v6];
  v8 = [@"BKSTouchDeliveryPolicy" stringByAppendingString:@"Policies"];
  objc_super v9 = [v4 decodeObjectOfClasses:v7 forKey:v8];

  v10 = [(_BKSCombinedTouchDeliveryPolicy *)self initWithPolicies:v9];
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
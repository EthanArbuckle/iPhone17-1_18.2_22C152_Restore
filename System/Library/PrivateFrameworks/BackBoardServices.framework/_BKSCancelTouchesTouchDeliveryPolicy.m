@interface _BKSCancelTouchesTouchDeliveryPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_BKSCancelTouchesTouchDeliveryPolicy)initWithCoder:(id)a3;
- (_BKSCancelTouchesTouchDeliveryPolicy)initWithContextId:(unsigned int)a3 initialTouchTimestamp:(double)a4;
- (double)initialTouchTimestamp;
- (id)assertionEndpoint;
- (id)matchSharingTouchesPolicy:(id)a3 orCancelTouchesPolicy:(id)a4 orCombinedPolicy:(id)a5;
- (unint64_t)hash;
- (unsigned)contextId;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAssertionEndpoint:(id)a3;
@end

@implementation _BKSCancelTouchesTouchDeliveryPolicy

- (void).cxx_destruct
{
}

- (double)initialTouchTimestamp
{
  return self->_initialTouchTimestamp;
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (void)setAssertionEndpoint:(id)a3
{
}

- (id)assertionEndpoint
{
  return self->_assertionEndpoint;
}

- (id)matchSharingTouchesPolicy:(id)a3 orCancelTouchesPolicy:(id)a4 orCombinedPolicy:(id)a5
{
  return (id)(*((uint64_t (**)(id, void, double))a4 + 2))(a4, self->_contextId, self->_initialTouchTimestamp);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69___BKSCancelTouchesTouchDeliveryPolicy_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E5441BB0;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_BKSCancelTouchesTouchDeliveryPolicy *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_contextId == v5->_contextId
      && self->_initialTouchTimestamp == v5->_initialTouchTimestamp;

  return v6;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendInteger:self->_contextId];
  id v5 = (id)[v3 appendDouble:self->_initialTouchTimestamp];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"<%@: %p> may only be encoded by an NSXPCCoder.", objc_opt_class(), self format];
  }
  uint64_t contextId = self->_contextId;
  id v5 = [@"BKSTouchDeliveryPolicy" stringByAppendingString:@"ContextId"];
  [v10 encodeInt32:contextId forKey:v5];

  double initialTouchTimestamp = self->_initialTouchTimestamp;
  id v7 = [@"BKSTouchDeliveryPolicy" stringByAppendingString:@"InitialTouchTimestamp"];
  [v10 encodeDouble:v7 forKey:initialTouchTimestamp];

  assertionEndpoint = self->_assertionEndpoint;
  v9 = [@"BKSTouchDeliveryPolicy" stringByAppendingString:@"AssertionEndpoint"];
  [v10 encodeXPCObject:assertionEndpoint forKey:v9];
}

- (_BKSCancelTouchesTouchDeliveryPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"<%@: %p> may only be decoded by an NSXPCCoder.", objc_opt_class(), self format];
  }
  id v5 = [@"BKSTouchDeliveryPolicy" stringByAppendingString:@"ContextId"];
  uint64_t v6 = [v4 decodeInt32ForKey:v5];

  id v7 = [@"BKSTouchDeliveryPolicy" stringByAppendingString:@"InitialTouchTimestamp"];
  [v4 decodeDoubleForKey:v7];
  double v9 = v8;

  id v10 = [@"BKSTouchDeliveryPolicy" stringByAppendingString:@"AssertionEndpoint"];
  v11 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F145A0] forKey:v10];

  v12 = [(_BKSCancelTouchesTouchDeliveryPolicy *)self initWithContextId:v6 initialTouchTimestamp:v9];
  [(_BKSCancelTouchesTouchDeliveryPolicy *)v12 setAssertionEndpoint:v11];

  return v12;
}

- (_BKSCancelTouchesTouchDeliveryPolicy)initWithContextId:(unsigned int)a3 initialTouchTimestamp:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_BKSCancelTouchesTouchDeliveryPolicy;
  result = [(_BKSCancelTouchesTouchDeliveryPolicy *)&v7 init];
  if (result)
  {
    result->_uint64_t contextId = a3;
    result->_double initialTouchTimestamp = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
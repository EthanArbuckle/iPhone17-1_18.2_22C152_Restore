@interface _BKSShareTouchesTouchDeliveryPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_BKSShareTouchesTouchDeliveryPolicy)initWithChildContextId:(unsigned int)a3 hostContextId:(unsigned int)a4;
- (_BKSShareTouchesTouchDeliveryPolicy)initWithCoder:(id)a3;
- (id)assertionEndpoint;
- (id)matchSharingTouchesPolicy:(id)a3 orCancelTouchesPolicy:(id)a4 orCombinedPolicy:(id)a5;
- (unint64_t)hash;
- (unsigned)childContextId;
- (unsigned)hostContextId;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAssertionEndpoint:(id)a3;
@end

@implementation _BKSShareTouchesTouchDeliveryPolicy

- (void).cxx_destruct
{
}

- (unsigned)hostContextId
{
  return self->_hostContextId;
}

- (unsigned)childContextId
{
  return self->_childContextId;
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
  return (id)(*((uint64_t (**)(id, void, void))a3 + 2))(a3, self->_childContextId, self->_hostContextId);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68___BKSShareTouchesTouchDeliveryPolicy_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E5441BB0;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_BKSShareTouchesTouchDeliveryPolicy *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_childContextId == v5->_childContextId
      && self->_hostContextId == v5->_hostContextId;

  return v6;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendInteger:self->_childContextId];
  id v5 = (id)[v3 appendInteger:self->_hostContextId];
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
  uint64_t childContextId = self->_childContextId;
  id v5 = [@"BKSTouchDeliveryPolicy" stringByAppendingString:@"ChildContextId"];
  [v10 encodeInt32:childContextId forKey:v5];

  uint64_t hostContextId = self->_hostContextId;
  id v7 = [@"BKSTouchDeliveryPolicy" stringByAppendingString:@"HostContextId"];
  [v10 encodeInt32:hostContextId forKey:v7];

  assertionEndpoint = self->_assertionEndpoint;
  v9 = [@"BKSTouchDeliveryPolicy" stringByAppendingString:@"AssertionEndpoint"];
  [v10 encodeXPCObject:assertionEndpoint forKey:v9];
}

- (_BKSShareTouchesTouchDeliveryPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"<%@: %p> may only be decoded by an NSXPCCoder.", objc_opt_class(), self format];
  }
  id v5 = [@"BKSTouchDeliveryPolicy" stringByAppendingString:@"ChildContextId"];
  uint64_t v6 = [v4 decodeInt32ForKey:v5];

  id v7 = [@"BKSTouchDeliveryPolicy" stringByAppendingString:@"HostContextId"];
  uint64_t v8 = [v4 decodeInt32ForKey:v7];

  v9 = [@"BKSTouchDeliveryPolicy" stringByAppendingString:@"AssertionEndpoint"];
  id v10 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F145A0] forKey:v9];

  v11 = [(_BKSShareTouchesTouchDeliveryPolicy *)self initWithChildContextId:v6 hostContextId:v8];
  [(_BKSShareTouchesTouchDeliveryPolicy *)v11 setAssertionEndpoint:v10];

  return v11;
}

- (_BKSShareTouchesTouchDeliveryPolicy)initWithChildContextId:(unsigned int)a3 hostContextId:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_BKSShareTouchesTouchDeliveryPolicy;
  result = [(_BKSShareTouchesTouchDeliveryPolicy *)&v7 init];
  if (result)
  {
    result->_uint64_t childContextId = a3;
    result->_uint64_t hostContextId = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
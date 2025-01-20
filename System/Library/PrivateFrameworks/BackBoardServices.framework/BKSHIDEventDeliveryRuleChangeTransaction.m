@interface BKSHIDEventDeliveryRuleChangeTransaction
+ (BOOL)supportsSecureCoding;
- (BKSHIDEventDeliveryRuleChangeTransaction)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)activeUIResponders;
- (NSArray)bufferingPredicates;
- (NSArray)deferringRules;
- (NSArray)discreteDispatchingRules;
- (NSArray)keyCommandDispatchingRules;
- (NSArray)keyCommandsRegistrations;
- (NSString)description;
- (unint64_t)contentsMask;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveUIResponders:(id)a3;
- (void)setBufferingPredicates:(id)a3;
- (void)setContentsMask:(unint64_t)a3;
- (void)setDeferringRules:(id)a3;
- (void)setDiscreteDispatchingRules:(id)a3;
- (void)setKeyCommandDispatchingRules:(id)a3;
- (void)setKeyCommandsRegistrations:(id)a3;
@end

@implementation BKSHIDEventDeliveryRuleChangeTransaction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__BKSHIDEventDeliveryRuleChangeTransaction_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E5441BB0;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

id __73__BKSHIDEventDeliveryRuleChangeTransaction_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendUInt64:*(void *)(*(void *)(a1 + 40) + 8) withName:@"contentsMask" format:1];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"discreteDispatchingRules"];
  id v4 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"deferringRules"];
  id v5 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"keyCommandDispatchingRules"];
  id v6 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"keyCommandsRegistrations"];
  id v7 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"bufferingPredicates"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 56) withName:@"activeUIResponders"];
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  [v11 encodeInteger:self->_contentsMask forKey:@"contentsMask"];
  discreteDispatchingRules = self->_discreteDispatchingRules;
  if (discreteDispatchingRules) {
    [v11 encodeObject:discreteDispatchingRules forKey:@"discreteDispatchingRules"];
  }
  deferringRules = self->_deferringRules;
  if (deferringRules) {
    [v11 encodeObject:deferringRules forKey:@"deferringRules"];
  }
  keyCommandDispatchingRules = self->_keyCommandDispatchingRules;
  id v7 = v11;
  if (keyCommandDispatchingRules)
  {
    [v11 encodeObject:keyCommandDispatchingRules forKey:@"keyCommandDispatchingRules"];
    id v7 = v11;
  }
  keyCommandsRegistrations = self->_keyCommandsRegistrations;
  if (keyCommandsRegistrations)
  {
    [v11 encodeObject:keyCommandsRegistrations forKey:@"keyCommandsRegistrations"];
    id v7 = v11;
  }
  bufferingPredicates = self->_bufferingPredicates;
  if (bufferingPredicates)
  {
    [v11 encodeObject:bufferingPredicates forKey:@"bufferingPredicates"];
    id v7 = v11;
  }
  activeUIResponders = self->_activeUIResponders;
  if (activeUIResponders)
  {
    [v11 encodeObject:activeUIResponders forKey:@"activeUIResponders"];
    id v7 = v11;
  }
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (NSArray)bufferingPredicates
{
  return self->_bufferingPredicates;
}

- (NSArray)deferringRules
{
  return self->_deferringRules;
}

- (BKSHIDEventDeliveryRuleChangeTransaction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BKSHIDEventDeliveryRuleChangeTransaction *)self init];
  if (v5)
  {
    v5->_contentsMask = [v4 decodeIntegerForKey:@"contentsMask"];
    id v6 = objc_opt_class();
    uint64_t v7 = _BKDecodeArrayOfClass(v4, v6, @"discreteDispatchingRules");
    discreteDispatchingRules = v5->_discreteDispatchingRules;
    v5->_discreteDispatchingRules = (NSArray *)v7;

    v9 = objc_opt_class();
    uint64_t v10 = _BKDecodeArrayOfClass(v4, v9, @"deferringRules");
    deferringRules = v5->_deferringRules;
    v5->_deferringRules = (NSArray *)v10;

    v12 = objc_opt_class();
    uint64_t v13 = _BKDecodeArrayOfClass(v4, v12, @"keyCommandDispatchingRules");
    keyCommandDispatchingRules = v5->_keyCommandDispatchingRules;
    v5->_keyCommandDispatchingRules = (NSArray *)v13;

    v15 = objc_opt_class();
    uint64_t v16 = _BKDecodeArrayOfClass(v4, v15, @"keyCommandsRegistrations");
    keyCommandsRegistrations = v5->_keyCommandsRegistrations;
    v5->_keyCommandsRegistrations = (NSArray *)v16;

    v18 = objc_opt_class();
    uint64_t v19 = _BKDecodeArrayOfClass(v4, v18, @"bufferingPredicates");
    bufferingPredicates = v5->_bufferingPredicates;
    v5->_bufferingPredicates = (NSArray *)v19;

    v21 = objc_opt_class();
    uint64_t v22 = _BKDecodeArrayOfClass(v4, v21, @"activeUIResponders");
    activeUIResponders = v5->_activeUIResponders;
    v5->_activeUIResponders = (NSArray *)v22;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeUIResponders, 0);
  objc_storeStrong((id *)&self->_bufferingPredicates, 0);
  objc_storeStrong((id *)&self->_keyCommandsRegistrations, 0);
  objc_storeStrong((id *)&self->_keyCommandDispatchingRules, 0);
  objc_storeStrong((id *)&self->_deferringRules, 0);
  objc_storeStrong((id *)&self->_discreteDispatchingRules, 0);
}

- (unint64_t)contentsMask
{
  return self->_contentsMask;
}

- (void)setBufferingPredicates:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  bufferingPredicates = self->_bufferingPredicates;
  self->_bufferingPredicates = v4;

  self->_contentsMask |= 0x10uLL;
}

- (void)setDeferringRules:(id)a3
{
  self->_contentsMask |= 2uLL;
}

- (NSArray)activeUIResponders
{
  return self->_activeUIResponders;
}

- (NSArray)keyCommandsRegistrations
{
  return self->_keyCommandsRegistrations;
}

- (NSArray)keyCommandDispatchingRules
{
  return self->_keyCommandDispatchingRules;
}

- (NSArray)discreteDispatchingRules
{
  return self->_discreteDispatchingRules;
}

- (void)setContentsMask:(unint64_t)a3
{
  self->_contentsMask = a3;
}

- (void)setKeyCommandDispatchingRules:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  keyCommandDispatchingRules = self->_keyCommandDispatchingRules;
  self->_keyCommandDispatchingRules = v4;

  self->_contentsMask |= 4uLL;
}

- (void)setKeyCommandsRegistrations:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  keyCommandsRegistrations = self->_keyCommandsRegistrations;
  self->_keyCommandsRegistrations = v4;

  self->_contentsMask |= 8uLL;
}

- (void)setActiveUIResponders:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  activeUIResponders = self->_activeUIResponders;
  self->_activeUIResponders = v4;

  self->_contentsMask |= 0x20uLL;
}

- (void)setDiscreteDispatchingRules:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  discreteDispatchingRules = self->_discreteDispatchingRules;
  self->_discreteDispatchingRules = v4;

  self->_contentsMask |= 1uLL;
}

- (unint64_t)hash
{
  return BSHashPurifyNS();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKSHIDEventDeliveryRuleChangeTransaction *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    id v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    v9 = v7;

    if (v9
      && self->_contentsMask == v9->_contentsMask
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects())
    {
      char v8 = BSEqualObjects();
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

@end
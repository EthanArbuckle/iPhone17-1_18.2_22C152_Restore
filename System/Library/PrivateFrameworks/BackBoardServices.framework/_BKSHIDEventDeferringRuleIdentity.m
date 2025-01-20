@interface _BKSHIDEventDeferringRuleIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_BKSHIDEventDeferringRuleIdentity)initWithCoder:(id)a3;
- (_BKSHIDEventDeferringRuleIdentity)initWithSeed:(unsigned int)a3 pid:(int)a4;
- (int)pid;
- (unint64_t)hash;
- (unsigned)seed;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _BKSHIDEventDeferringRuleIdentity

- (unint64_t)hash
{
  return self->_pid ^ self->_seed;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_BKSHIDEventDeferringRuleIdentity *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class() && self->_seed == v4->_seed && self->_pid == v4->_pid;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66___BKSHIDEventDeferringRuleIdentity_appendDescriptionToFormatter___block_invoke;
  v3[3] = &unk_1E54410D0;
  v3[4] = self;
  [a3 appendCustomFormatWithName:0 block:v3];
}

- (_BKSHIDEventDeferringRuleIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_BKSHIDEventDeferringRuleIdentity;
  uint64_t v5 = [(_BKSHIDEventDeferringRuleIdentity *)&v7 init];
  if (v5)
  {
    v5->_pid = [v4 decodeIntForKey:@"pid"];
    v5->_seed = [v4 decodeInt32ForKey:@"seed"];
  }

  return v5;
}

- (unsigned)seed
{
  return self->_seed;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t pid = self->_pid;
  id v5 = a3;
  [v5 encodeInt:pid forKey:@"pid"];
  [v5 encodeInt32:self->_seed forKey:@"seed"];
}

- (_BKSHIDEventDeferringRuleIdentity)initWithSeed:(unsigned int)a3 pid:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_BKSHIDEventDeferringRuleIdentity;
  result = [(_BKSHIDEventDeferringRuleIdentity *)&v7 init];
  if (result)
  {
    result->_seed = a3;
    result->_uint64_t pid = a4;
  }
  return result;
}

- (int)pid
{
  return self->_pid;
}

@end
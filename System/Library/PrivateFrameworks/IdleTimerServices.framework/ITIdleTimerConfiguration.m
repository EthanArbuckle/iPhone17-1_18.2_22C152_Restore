@interface ITIdleTimerConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)configurationToDisableIdleTimer;
- (BOOL)disablesTimer;
- (ITIdleTimerConfiguration)initWithBSXPCCoder:(id)a3;
- (ITIdleTimerConfiguration)initWithConfiguration:(id)a3;
- (NSString)_identifier;
- (NSString)description;
- (id)_copyWithNewIdentifier;
- (id)_idleEventHandlerBlock;
- (id)_uniquedReason:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)_idleEventMask;
- (void)_setIdleEventHandlerBlock:(id)a3;
- (void)_setIdleEventMask:(unint64_t)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setDisablesTimer:(BOOL)a3;
@end

@implementation ITIdleTimerConfiguration

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)[(ITIdleTimerConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (ITIdleTimerConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ITIdleTimerConfiguration;
  v5 = [(ITIdleTimerConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_disablesTimer = [v4 decodeBoolForKey:@"disablesIdleTimer"];
    v5->_idleEventMask = [v4 decodeUInt64ForKey:@"idleEventMask"];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_idleEventHandlerBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(ITIdleTimerConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = v3;
  if (self->_disablesTimer)
  {
    id v5 = (id)[v3 appendObject:self->_identifier withName:@"identifier"];
    id v6 = (id)[v4 appendBool:self->_disablesTimer withName:@"disablesTimer"];
    id v7 = (id)[v4 appendUnsignedInteger:self->_idleEventMask withName:@"idleEventMask"];
  }
  return v4;
}

- (id)_copyWithNewIdentifier
{
  v2 = (void *)[(ITIdleTimerConfiguration *)self copy];
  v3 = [MEMORY[0x263F08C38] UUID];
  uint64_t v4 = [v3 UUIDString];
  id v5 = (void *)v2[2];
  v2[2] = v4;

  return v2;
}

+ (id)configurationToDisableIdleTimer
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setDisablesTimer:1];
  return v2;
}

- (void)setDisablesTimer:(BOOL)a3
{
  self->_disablesTimer = a3;
}

- (ITIdleTimerConfiguration)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ITIdleTimerConfiguration;
  id v5 = [(ITIdleTimerConfiguration *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 _identifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_disablesTimer = [v4 disablesTimer];
    v5->_idleEventMask = [v4 _idleEventMask];
    v8 = [v4 _idleEventHandlerBlock];
    uint64_t v9 = [v8 copy];
    id idleEventHandlerBlock = v5->_idleEventHandlerBlock;
    v5->_id idleEventHandlerBlock = (id)v9;
  }
  return v5;
}

- (NSString)_identifier
{
  return self->_identifier;
}

- (BOOL)disablesTimer
{
  return self->_disablesTimer;
}

- (unint64_t)_idleEventMask
{
  return self->_idleEventMask;
}

- (id)_idleEventHandlerBlock
{
  return self->_idleEventHandlerBlock;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithConfiguration:self];
}

- (id)_uniquedReason:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  uint64_t v6 = [(ITIdleTimerConfiguration *)self _identifier];
  id v7 = [v4 stringWithFormat:@"%@-%@", v5, v6];

  return v7;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  if (a3)
  {
    identifier = self->_identifier;
    id v5 = a3;
    [v5 encodeObject:identifier forKey:@"identifier"];
    [v5 encodeBool:self->_disablesTimer forKey:@"disablesIdleTimer"];
    [v5 encodeUInt64:self->_idleEventMask forKey:@"idleEventMask"];
  }
}

- (id)succinctDescription
{
  id v2 = [(ITIdleTimerConfiguration *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (void)_setIdleEventMask:(unint64_t)a3
{
  self->_idleEventMask = a3;
}

- (void)_setIdleEventHandlerBlock:(id)a3
{
}

@end
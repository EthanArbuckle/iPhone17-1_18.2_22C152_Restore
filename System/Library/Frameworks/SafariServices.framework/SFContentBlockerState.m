@interface SFContentBlockerState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (SFContentBlockerState)initWithCoder:(id)a3;
- (SFContentBlockerState)initWithEnabledState:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation SFContentBlockerState

- (SFContentBlockerState)initWithEnabledState:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFContentBlockerState;
  v4 = [(SFContentBlockerState *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_enabled = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFContentBlockerState)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"enabled"];

  return [(SFContentBlockerState *)self initWithEnabledState:v4];
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end
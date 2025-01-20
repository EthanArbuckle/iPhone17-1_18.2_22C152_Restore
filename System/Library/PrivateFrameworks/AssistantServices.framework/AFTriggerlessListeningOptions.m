@interface AFTriggerlessListeningOptions
+ (BOOL)supportsSecureCoding;
- (AFTriggerlessListeningOptions)initWithCoder:(id)a3;
- (BOOL)beepBeforeListening;
- (BOOL)playAlertBeforeListening;
- (BOOL)showUIBeforeListening;
- (BOOL)showUIDuringListening;
- (double)delay;
- (double)endpointDelay;
- (id)_initWithShowUIDuringListening:(BOOL)a3 playAlertBeforeListening:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setPlayAlertBeforeListening:(BOOL)a3;
- (void)setShowUIDuringListening:(BOOL)a3;
@end

@implementation AFTriggerlessListeningOptions

- (double)endpointDelay
{
  return self->_endpointDelay;
}

- (void)setPlayAlertBeforeListening:(BOOL)a3
{
  self->_playAlertBeforeListening = a3;
}

- (BOOL)playAlertBeforeListening
{
  return self->_playAlertBeforeListening;
}

- (void)setShowUIDuringListening:(BOOL)a3
{
  self->_showUIDuringListening = a3;
}

- (BOOL)showUIDuringListening
{
  return self->_showUIDuringListening;
}

- (double)delay
{
  return 0.0;
}

- (BOOL)beepBeforeListening
{
  return self->_playAlertBeforeListening;
}

- (BOOL)showUIBeforeListening
{
  return self->_showUIDuringListening;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)AFTriggerlessListeningOptions;
  v3 = [(AFTriggerlessListeningOptions *)&v8 description];
  v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_showUIDuringListening];
  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_playAlertBeforeListening];
  v6 = [v3 stringByAppendingFormat:@"showUIBeforeListening: %@, playAlertBeforeListening: %@", v4, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setShowUIDuringListening:self->_showUIDuringListening];
  [v4 setPlayAlertBeforeListening:self->_playAlertBeforeListening];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL showUIDuringListening = self->_showUIDuringListening;
  id v5 = a3;
  [v5 encodeBool:showUIDuringListening forKey:@"_showUIDuringListening"];
  [v5 encodeBool:self->_playAlertBeforeListening forKey:@"_playAlertBeforeListening"];
}

- (AFTriggerlessListeningOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AFTriggerlessListeningOptions *)self init];
  if (v5)
  {
    v5->_BOOL showUIDuringListening = [v4 decodeBoolForKey:@"_showUIDuringListening"];
    v5->_playAlertBeforeListening = [v4 decodeBoolForKey:@"_playAlertBeforeListening"];
  }

  return v5;
}

- (id)_initWithShowUIDuringListening:(BOOL)a3 playAlertBeforeListening:(BOOL)a4
{
  id result = [(AFTriggerlessListeningOptions *)self init];
  if (result)
  {
    *((unsigned char *)result + 8) = a3;
    *((unsigned char *)result + 9) = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
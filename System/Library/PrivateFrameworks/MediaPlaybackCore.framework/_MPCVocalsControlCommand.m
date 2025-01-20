@interface _MPCVocalsControlCommand
- (BOOL)isActive;
- (BOOL)isContinuous;
- (BOOL)isDisabled;
- (float)level;
- (float)maxLevel;
- (float)minLevel;
- (id)activateVocalsControl:(BOOL)a3;
- (id)setVocalsLevel:(float)a3;
- (int64_t)disabledReason;
- (void)setActive:(BOOL)a3;
- (void)setContinuous:(BOOL)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDisabledReason:(int64_t)a3;
- (void)setLevel:(float)a3;
- (void)setMaxLevel:(float)a3;
- (void)setMinLevel:(float)a3;
@end

@implementation _MPCVocalsControlCommand

- (void)setDisabledReason:(int64_t)a3
{
  self->_disabledReason = a3;
}

- (int64_t)disabledReason
{
  return self->_disabledReason;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setContinuous:(BOOL)a3
{
  self->_continuous = a3;
}

- (BOOL)isContinuous
{
  return self->_continuous;
}

- (void)setMaxLevel:(float)a3
{
  self->_maxLevel = a3;
}

- (float)maxLevel
{
  return self->_maxLevel;
}

- (void)setMinLevel:(float)a3
{
  self->_minLevel = a3;
}

- (float)minLevel
{
  return self->_minLevel;
}

- (void)setLevel:(float)a3
{
  self->_level = a3;
}

- (float)level
{
  return self->_level;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (id)setVocalsLevel:(float)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  float v4 = roundf(a3 / 5.0) * 5.0;
  [(_MPCVocalsControlCommand *)self level];
  if (v4 == *(float *)&v5 && [(_MPCVocalsControlCommand *)self isActive])
  {
    v6 = 0;
  }
  else
  {
    uint64_t v7 = *MEMORY[0x263F54DC8];
    v16[0] = *MEMORY[0x263F54DC0];
    v16[1] = v7;
    v17[0] = MEMORY[0x263EFFA88];
    *(float *)&double v5 = v4;
    v8 = [NSNumber numberWithFloat:v5];
    v17[1] = v8;
    v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

    v10 = [(_MPCPlayerCommand *)self response];
    v11 = [MPCPlayerCommandRequest alloc];
    v12 = [v10 controller];
    v13 = [v10 request];
    v14 = [v13 label];
    v6 = [(MPCPlayerCommandRequest *)v11 initWithMediaRemoteCommand:142 options:v9 controller:v12 label:v14];
  }

  return v6;
}

- (id)activateVocalsControl:(BOOL)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v13 = *MEMORY[0x263F54DC0];
  float v4 = [NSNumber numberWithBool:a3];
  v14[0] = v4;
  double v5 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

  v6 = [(_MPCPlayerCommand *)self response];
  uint64_t v7 = [MPCPlayerCommandRequest alloc];
  v8 = [v6 controller];
  v9 = [v6 request];
  v10 = [v9 label];
  v11 = [(MPCPlayerCommandRequest *)v7 initWithMediaRemoteCommand:142 options:v5 controller:v8 label:v10];

  return v11;
}

@end
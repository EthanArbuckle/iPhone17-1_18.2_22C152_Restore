@interface _AFAccessibilityStateMutation
- (BOOL)isDirty;
- (_AFAccessibilityStateMutation)initWithBase:(id)a3;
- (int64_t)getIsVibrationDisabled;
- (int64_t)getIsVoiceOverTouchEnabled;
- (void)setIsVibrationDisabled:(int64_t)a3;
- (void)setIsVoiceOverTouchEnabled:(int64_t)a3;
@end

@implementation _AFAccessibilityStateMutation

- (void).cxx_destruct
{
}

- (void)setIsVibrationDisabled:(int64_t)a3
{
  self->_isVibrationDisabled = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (int64_t)getIsVibrationDisabled
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_isVibrationDisabled;
  }
  else {
    return [(AFAccessibilityState *)self->_base isVibrationDisabled];
  }
}

- (void)setIsVoiceOverTouchEnabled:(int64_t)a3
{
  self->_isVoiceOverTouchEnabled = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (int64_t)getIsVoiceOverTouchEnabled
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_isVoiceOverTouchEnabled;
  }
  else {
    return [(AFAccessibilityState *)self->_base isVoiceOverTouchEnabled];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFAccessibilityStateMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFAccessibilityStateMutation;
  v6 = [(_AFAccessibilityStateMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
@interface BWNodeInputMediaConfiguration
- (BOOL)conversionToPassthroughModeNeverAllowed;
- (BWFormatRequirements)formatRequirements;
- (BWNodeInputMediaConfiguration)init;
- (int)delayedBufferCount;
- (int)indefinitelyHeldBufferCount;
- (int)passthroughMode;
- (int)retainedBufferCount;
- (void)_setAssociatedAttachedMediaKey:(id)a3;
- (void)dealloc;
- (void)setConversionToPassthroughModeNeverAllowed:(BOOL)a3;
- (void)setDelayedBufferCount:(int)a3;
- (void)setFormatRequirements:(id)a3;
- (void)setIndefinitelyHeldBufferCount:(int)a3;
- (void)setPassthroughMode:(int)a3;
- (void)setRetainedBufferCount:(int)a3;
@end

@implementation BWNodeInputMediaConfiguration

- (BWFormatRequirements)formatRequirements
{
  return self->_formatRequirements;
}

- (int)retainedBufferCount
{
  return self->_retainedBufferCount;
}

- (int)delayedBufferCount
{
  return self->_delayedBufferCount;
}

- (int)passthroughMode
{
  return self->_passthroughMode;
}

- (int)indefinitelyHeldBufferCount
{
  return self->_indefinitelyHeldBufferCount;
}

- (BOOL)conversionToPassthroughModeNeverAllowed
{
  return self->_conversionToPassthroughModeNeverAllowed;
}

- (void)setPassthroughMode:(int)a3
{
  self->_passthroughMode = a3;
}

- (void)setFormatRequirements:(id)a3
{
}

- (BWNodeInputMediaConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)BWNodeInputMediaConfiguration;
  result = [(BWNodeInputMediaConfiguration *)&v3 init];
  if (result) {
    result->_passthroughMode = 0;
  }
  return result;
}

- (void)_setAssociatedAttachedMediaKey:(id)a3
{
  if (!a3)
  {
    objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3C8];
    v5 = @"Associated attached media key must not be nil";
    goto LABEL_6;
  }
  if (self->_associatedAttachedMediaKey)
  {
    objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3C8];
    v5 = @"Associated attached media key can only be set once";
LABEL_6:
    objc_exception_throw((id)[v3 exceptionWithName:v4 reason:v5 userInfo:0]);
  }
  self->_associatedAttachedMediaKey = (NSString *)[a3 copy];
}

- (void)setIndefinitelyHeldBufferCount:(int)a3
{
  self->_indefinitelyHeldBufferCount = a3;
}

- (void)setConversionToPassthroughModeNeverAllowed:(BOOL)a3
{
  self->_conversionToPassthroughModeNeverAllowed = a3;
}

- (void)setDelayedBufferCount:(int)a3
{
  self->_delayedBufferCount = a3;
}

- (void)setRetainedBufferCount:(int)a3
{
  self->_retainedBufferCount = a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWNodeInputMediaConfiguration;
  [(BWNodeInputMediaConfiguration *)&v3 dealloc];
}

@end
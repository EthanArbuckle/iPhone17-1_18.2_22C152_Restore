@interface BWNodeInputMediaProperties
- (BWFormat)liveFormat;
- (BWFormat)resolvedFormat;
- (BWVideoFormat)liveVideoFormat;
- (BWVideoFormat)resolvedVideoFormat;
- (void)_setOwningNodeInput:(id)a3 associatedAttachedMediaKey:(id)a4;
- (void)dealloc;
- (void)setLiveFormat:(id)a3;
- (void)setResolvedFormat:(id)a3;
@end

@implementation BWNodeInputMediaProperties

- (void)setResolvedFormat:(id)a3
{
  resolvedFormat = self->_resolvedFormat;
  if (resolvedFormat != a3)
  {

    self->_resolvedFormat = (BWFormat *)a3;
    v6 = [(BWNodeInput *)self->_owningNodeInput node];
    associatedAttachedMediaKey = self->_associatedAttachedMediaKey;
    owningNodeInput = self->_owningNodeInput;
    [(BWNode *)v6 didSelectFormat:a3 forInput:owningNodeInput forAttachedMediaKey:associatedAttachedMediaKey];
  }
}

- (void)_setOwningNodeInput:(id)a3 associatedAttachedMediaKey:(id)a4
{
  if (!a3)
  {
    v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3A8];
    v6 = @"Owning BWNodeInput must not be nil";
    goto LABEL_8;
  }
  if (self->_owningNodeInput)
  {
    v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3A8];
    v6 = @"Can only be owned by one BWNodeInput";
    goto LABEL_8;
  }
  if (!a4)
  {
    v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    v6 = @"Associated attached media key must not be nil";
LABEL_8:
    objc_exception_throw((id)[v4 exceptionWithName:v5 reason:v6 userInfo:0]);
  }
  self->_owningNodeInput = (BWNodeInput *)a3;
  self->_associatedAttachedMediaKey = (NSString *)[a4 copy];
}

- (BWVideoFormat)resolvedVideoFormat
{
  if ([(BWNodeInput *)self->_owningNodeInput mediaTypeIsVideo]) {
    return (BWVideoFormat *)self->_resolvedFormat;
  }
  else {
    return 0;
  }
}

- (BWFormat)liveFormat
{
  return self->_liveFormat;
}

- (BWFormat)resolvedFormat
{
  return self->_resolvedFormat;
}

- (void)setLiveFormat:(id)a3
{
  liveFormat = self->_liveFormat;
  if (liveFormat != a3)
  {

    self->_liveFormat = (BWFormat *)a3;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWNodeInputMediaProperties;
  [(BWNodeInputMediaProperties *)&v3 dealloc];
}

- (BWVideoFormat)liveVideoFormat
{
  if ([(BWNodeInput *)self->_owningNodeInput mediaTypeIsVideo]) {
    return (BWVideoFormat *)self->_liveFormat;
  }
  else {
    return 0;
  }
}

@end
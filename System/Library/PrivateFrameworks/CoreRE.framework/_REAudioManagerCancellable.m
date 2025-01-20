@interface _REAudioManagerCancellable
- (AudioService)audioService;
- (BOOL)isCancelled;
- (_REAudioManagerCancellable)init;
- (void)cancel;
- (void)setAudioService:(AudioService *)a3;
@end

@implementation _REAudioManagerCancellable

- (_REAudioManagerCancellable)init
{
  v3.receiver = self;
  v3.super_class = (Class)_REAudioManagerCancellable;
  result = [(_REAudioManagerCancellable *)&v3 init];
  if (result)
  {
    result->_audioService = 0;
    atomic_store(0, (unsigned __int8 *)&result->_cancelled);
  }
  return result;
}

- (void)cancel
{
}

- (BOOL)isCancelled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_cancelled);
  return v2 & 1;
}

- (AudioService)audioService
{
  return self->_audioService;
}

- (void)setAudioService:(AudioService *)a3
{
  self->_audioService = a3;
}

@end
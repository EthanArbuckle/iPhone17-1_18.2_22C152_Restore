@interface REAudioSourceStateWrapper
- (REAudioSourceStateWrapper)init;
- (REAudioSourceStateWrapper)initWithState:(void *)a3;
- (void)setState:(void *)a3;
- (void)state;
@end

@implementation REAudioSourceStateWrapper

- (REAudioSourceStateWrapper)init
{
  return 0;
}

- (REAudioSourceStateWrapper)initWithState:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REAudioSourceStateWrapper;
  result = [(REAudioSourceStateWrapper *)&v5 init];
  if (result) {
    result->_state = a3;
  }
  return result;
}

- (void)state
{
  return self->_state;
}

- (void)setState:(void *)a3
{
  self->_state = a3;
}

@end
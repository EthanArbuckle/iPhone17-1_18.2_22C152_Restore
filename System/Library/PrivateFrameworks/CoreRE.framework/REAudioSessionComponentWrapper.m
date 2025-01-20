@interface REAudioSessionComponentWrapper
- (REAudioSessionComponentWrapper)initWithComponent:(void *)a3;
- (void)component;
- (void)setComponent:(void *)a3;
@end

@implementation REAudioSessionComponentWrapper

- (REAudioSessionComponentWrapper)initWithComponent:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REAudioSessionComponentWrapper;
  result = [(REAudioSessionComponentWrapper *)&v5 init];
  if (result) {
    result->_component = a3;
  }
  return result;
}

- (void)component
{
  return self->_component;
}

- (void)setComponent:(void *)a3
{
  self->_component = a3;
}

@end
@interface SKRequestInternal
- (SKRequestInternal)init;
- (void)dealloc;
@end

@implementation SKRequestInternal

- (SKRequestInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKRequestInternal;
  result = [(SKRequestInternal *)&v3 init];
  if (result) {
    result->_backgroundTaskIdentifier = *MEMORY[0x1E4FB2748];
  }
  return result;
}

- (void)dealloc
{
  int64_t v3 = *MEMORY[0x1E4FB2748];
  if (self->_backgroundTaskIdentifier != *MEMORY[0x1E4FB2748])
  {
    v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v4 endBackgroundTask:self->_backgroundTaskIdentifier];

    self->_backgroundTaskIdentifier = v3;
  }
  v5.receiver = self;
  v5.super_class = (Class)SKRequestInternal;
  [(SKRequestInternal *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_client, 0);
}

@end
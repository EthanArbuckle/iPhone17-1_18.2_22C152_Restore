@interface JPCallbackStream
- (JPCallbackStream)initWithReadCallback:(id)a3 seekForwardCallback:(id)a4 seekToEndCallback:(id)a5;
- (id)readCallback;
- (id)seekForwardCallback;
- (id)seekToEndCallback;
- (void)setReadCallback:(id)a3;
- (void)setSeekForwardCallback:(id)a3;
- (void)setSeekToEndCallback:(id)a3;
@end

@implementation JPCallbackStream

- (JPCallbackStream)initWithReadCallback:(id)a3 seekForwardCallback:(id)a4 seekToEndCallback:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  JetPackStreamCreate();
}

- (id)readCallback
{
  return self->_readCallback;
}

- (void)setReadCallback:(id)a3
{
}

- (id)seekForwardCallback
{
  return self->_seekForwardCallback;
}

- (void)setSeekForwardCallback:(id)a3
{
}

- (id)seekToEndCallback
{
  return self->_seekToEndCallback;
}

- (void)setSeekToEndCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_seekToEndCallback, 0);
  objc_storeStrong(&self->_seekForwardCallback, 0);
  objc_storeStrong(&self->_readCallback, 0);
}

@end
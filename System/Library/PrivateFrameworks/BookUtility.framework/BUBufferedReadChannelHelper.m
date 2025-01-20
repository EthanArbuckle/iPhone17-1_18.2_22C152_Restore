@interface BUBufferedReadChannelHelper
- (BUBufferedReadChannel)bufferedReadChannel;
- (BUBufferedReadChannelHelper)init;
- (BUBufferedReadChannelHelper)initWithBufferedReadChannel:(id)a3;
- (void)readWithHandler:(id)a3;
- (void)setBufferedReadChannel:(id)a3;
@end

@implementation BUBufferedReadChannelHelper

- (BUBufferedReadChannelHelper)initWithBufferedReadChannel:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BUBufferedReadChannelHelper;
  v5 = [(BUBufferedReadChannelHelper *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_bufferedReadChannel, v4);
  }

  return v6;
}

- (BUBufferedReadChannelHelper)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = objc_msgSend_stringWithFormat_(NSString, a2, @"%@: %s", @"Do not call method", "-[BUBufferedReadChannelHelper init]");
  objc_msgSend_exceptionWithName_reason_userInfo_(v2, v5, v3, v4, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)readWithHandler:(id)a3
{
  p_bufferedReadChannel = &self->_bufferedReadChannel;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_bufferedReadChannel);
  objc_msgSend_setStreamReadChannelSourceHandler_(WeakRetained, v5, (uint64_t)v4);
}

- (BUBufferedReadChannel)bufferedReadChannel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bufferedReadChannel);

  return (BUBufferedReadChannel *)WeakRetained;
}

- (void)setBufferedReadChannel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
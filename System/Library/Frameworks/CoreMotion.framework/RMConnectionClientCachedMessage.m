@interface RMConnectionClientCachedMessage
@end

@implementation RMConnectionClientCachedMessage

- (void).cxx_destruct
{
  objc_storeStrong(&self->_streamingCallback, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end
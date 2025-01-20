@interface XPCNotificationSource
@end

@implementation XPCNotificationSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_mergeHandler, 0);
}

@end
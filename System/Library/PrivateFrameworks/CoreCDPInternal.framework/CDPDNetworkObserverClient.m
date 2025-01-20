@interface CDPDNetworkObserverClient
- (id)eventHandler;
- (void)setEventHandler:(id)a3;
@end

@implementation CDPDNetworkObserverClient

- (id)eventHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
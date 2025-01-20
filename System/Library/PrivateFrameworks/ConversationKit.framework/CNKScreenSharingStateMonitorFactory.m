@interface CNKScreenSharingStateMonitorFactory
- (CNKScreenSharingStateMonitorFactory)init;
- (CNKScreenSharingStateMonitorProtocol)sharedMonitor;
- (id)makeScreenSharingStateMonitorWithCall:(id)a3;
@end

@implementation CNKScreenSharingStateMonitorFactory

- (id)makeScreenSharingStateMonitorWithCall:(id)a3
{
  id v5 = a3;
  v6 = self;
  id v7 = CNKScreenSharingStateMonitorFactory.makeScreenSharingStateMonitor(using:)(a3);

  return v7;
}

- (CNKScreenSharingStateMonitorProtocol)sharedMonitor
{
  v2 = self;
  v3 = (void *)static ScreenSharingStateMonitor.sharedMonitor.getter();

  return (CNKScreenSharingStateMonitorProtocol *)v3;
}

- (CNKScreenSharingStateMonitorFactory)init
{
  return (CNKScreenSharingStateMonitorFactory *)CNKScreenSharingStateMonitorFactory.init()();
}

@end
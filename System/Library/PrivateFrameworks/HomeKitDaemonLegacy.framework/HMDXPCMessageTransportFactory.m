@interface HMDXPCMessageTransportFactory
- (HMDXPCMessageTransport)defaultTransport;
@end

@implementation HMDXPCMessageTransportFactory

- (HMDXPCMessageTransport)defaultTransport
{
  return +[HMDXPCMessageTransport defaultTransport];
}

@end
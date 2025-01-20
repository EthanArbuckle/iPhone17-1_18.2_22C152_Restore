@interface MFDFocusedMessages
+ (id)exportedInterface;
@end

@implementation MFDFocusedMessages

+ (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MSDFocusedMessagesProtocol];
}

@end
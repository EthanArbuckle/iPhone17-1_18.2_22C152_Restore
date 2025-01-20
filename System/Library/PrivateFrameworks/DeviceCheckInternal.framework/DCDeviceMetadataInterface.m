@interface DCDeviceMetadataInterface
+ (id)XPCInterface;
@end

@implementation DCDeviceMetadataInterface

+ (id)XPCInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DCDeviceMetadataProtocol];
}

@end
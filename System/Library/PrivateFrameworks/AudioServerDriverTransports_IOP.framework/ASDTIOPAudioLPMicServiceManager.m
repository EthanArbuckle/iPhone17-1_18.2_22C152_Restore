@interface ASDTIOPAudioLPMicServiceManager
+ (id)ioServiceClassName;
+ (id)ioServiceIDProperty;
@end

@implementation ASDTIOPAudioLPMicServiceManager

+ (id)ioServiceClassName
{
  return (id)[NSString stringWithUTF8String:"IOPAudioLPMicDevice"];
}

+ (id)ioServiceIDProperty
{
  return (id)[NSString stringWithUTF8String:"identifier"];
}

@end
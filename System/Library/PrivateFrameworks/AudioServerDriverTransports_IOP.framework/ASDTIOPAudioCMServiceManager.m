@interface ASDTIOPAudioCMServiceManager
+ (id)ioServiceClassName;
+ (id)ioServiceIDProperty;
- (id)serviceForIOObject:(unsigned int)a3 andIDValue:(id)a4;
@end

@implementation ASDTIOPAudioCMServiceManager

+ (id)ioServiceClassName
{
  return (id)[NSString stringWithUTF8String:"IOPAudioClientManagerDevice"];
}

+ (id)ioServiceIDProperty
{
  return (id)[NSString stringWithUTF8String:"identifier"];
}

- (id)serviceForIOObject:(unsigned int)a3 andIDValue:(id)a4
{
  v4 = +[ASDTIOPAudioCMDevice forIOObject:*(void *)&a3 andIDValue:a4];
  return v4;
}

@end
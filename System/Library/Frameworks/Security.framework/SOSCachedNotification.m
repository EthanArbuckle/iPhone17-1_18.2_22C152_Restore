@interface SOSCachedNotification
+ (id)notificationName:(const char *)a3;
@end

@implementation SOSCachedNotification

+ (id)notificationName:(const char *)a3
{
  return (id)[NSString stringWithUTF8String:a3];
}

@end
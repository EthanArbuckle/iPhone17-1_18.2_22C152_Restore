@interface IDSSenderKeySendContext
+ (NSString)handleDonation;
+ (NSString)iMessageReceive;
+ (NSString)iMessageSend;
+ (NSString)idstool;
+ (NSString)keyRecovery;
+ (NSString)keyRoll;
+ (NSString)remoteDeviceUpdate;
- (_TtC17identityservicesd23IDSSenderKeySendContext)init;
@end

@implementation IDSSenderKeySendContext

+ (NSString)idstool
{
  return (NSString *)sub_10044D9B0((uint64_t)a1, (uint64_t)a2, &qword_100A4FBC0);
}

+ (NSString)iMessageSend
{
  return (NSString *)sub_10044D9B0((uint64_t)a1, (uint64_t)a2, &qword_100A4FBC8);
}

+ (NSString)iMessageReceive
{
  return (NSString *)sub_10044D9B0((uint64_t)a1, (uint64_t)a2, &qword_100A4FBD0);
}

+ (NSString)handleDonation
{
  return (NSString *)sub_10044D9B0((uint64_t)a1, (uint64_t)a2, &qword_100A4FBD8);
}

+ (NSString)keyRoll
{
  return (NSString *)sub_10044D9B0((uint64_t)a1, (uint64_t)a2, &qword_100A4FBE0);
}

+ (NSString)keyRecovery
{
  return (NSString *)sub_10044D9B0((uint64_t)a1, (uint64_t)a2, &qword_100A4FBE8);
}

+ (NSString)remoteDeviceUpdate
{
  NSString v2 = sub_100726420();

  return (NSString *)v2;
}

- (_TtC17identityservicesd23IDSSenderKeySendContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IDSSenderKeySendContext();
  return [(IDSSenderKeySendContext *)&v3 init];
}

@end
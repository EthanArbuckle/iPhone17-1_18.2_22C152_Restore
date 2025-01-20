@interface NSXPCConnection
- (BOOL)sk_allowArcade;
- (BOOL)sk_allowClientOverride;
- (BOOL)sk_allowPaymentRequestData;
- (BOOL)sk_connectionIsOctaneService;
- (BOOL)sk_getTaskAllowed;
- (BOOL)sk_isOctanePrivileged;
- (NSData)sk_auditTokenData;
- (NSString)sk_clientID;
- (NSString)sk_executablePath;
- (NSString)sk_processName;
@end

@implementation NSXPCConnection

- (BOOL)sk_allowClientOverride
{
  v2 = self;
  char v3 = sub_100017B04();

  return v3 & 1;
}

- (NSString)sk_processName
{
  return (NSString *)sub_1000181C0(self, (uint64_t)a2, (void (*)(void))sub_100018240);
}

- (BOOL)sk_allowArcade
{
  v2 = self;
  char v3 = sub_10012DB4C();

  return v3 & 1;
}

- (BOOL)sk_allowPaymentRequestData
{
  v2 = self;
  char v3 = sub_10012DBE4();

  return v3 & 1;
}

- (BOOL)sk_isOctanePrivileged
{
  v2 = self;
  char v3 = sub_10012E598();

  return v3 & 1;
}

- (BOOL)sk_getTaskAllowed
{
  v2 = self;
  char v3 = sub_10012E634();

  return v3 & 1;
}

- (NSString)sk_clientID
{
  return (NSString *)sub_1000181C0(self, (uint64_t)a2, sub_10012E6B4);
}

- (NSString)sk_executablePath
{
  return (NSString *)sub_1000181C0(self, (uint64_t)a2, (void (*)(void))sub_10012EBDC);
}

- (NSData)sk_auditTokenData
{
  v2 = self;
  uint64_t v3 = sub_10012EC7C();
  unint64_t v5 = v4;

  v6.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100012EB8(v3, v5);

  return (NSData *)v6.super.isa;
}

- (BOOL)sk_connectionIsOctaneService
{
  v2 = self;
  char v3 = sub_10012ED38();

  return v3 & 1;
}

@end
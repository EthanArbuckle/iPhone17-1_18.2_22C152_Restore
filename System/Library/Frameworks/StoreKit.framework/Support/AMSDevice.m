@interface AMSDevice
+ (BOOL)sk_isAppleVirtualMachine;
+ (id)sk_bootSession;
+ (id)sk_defaultMediaAPIPlatform;
+ (id)sk_hardwareFamily;
+ (id)sk_hardwareModel;
+ (void)setSk_isAppleVirtualMachine:(BOOL)a3;
@end

@implementation AMSDevice

+ (id)sk_bootSession
{
  uint64_t v2 = sub_10001E6FC(&qword_10039B990);
  __chkstk_darwin(v2 - 8);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100114060((uint64_t)v4);
  uint64_t v5 = type metadata accessor for UUID();
  Class isa = 0;
  if (sub_10001E448((uint64_t)v4, 1, v5) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }

  return isa;
}

+ (BOOL)sk_isAppleVirtualMachine
{
  return sub_100114594() & 1;
}

+ (void)setSk_isAppleVirtualMachine:(BOOL)a3
{
}

+ (id)sk_hardwareFamily
{
  return sub_1001147C8((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_10011468C);
}

+ (id)sk_hardwareModel
{
  return sub_1001147C8((uint64_t)a1, (uint64_t)a2, sub_100114820);
}

+ (id)sk_defaultMediaAPIPlatform
{
  id v2 = sub_100113F1C();

  return v2;
}

@end
@interface MCLSignatureVerification
+ (BOOL)verifySignatureOf:(id)a3 with:(id)a4 using:(id)a5;
- (MCLSignatureVerification)init;
@end

@implementation MCLSignatureVerification

+ (BOOL)verifySignatureOf:(id)a3 with:(id)a4 using:(id)a5
{
  swift_getObjCClassMetadata();
  id v5 = a3;
  id v6 = a4;
  id v7 = a5;
  sub_22912B788();
  sub_22912B788();
  sub_22912B788();
  swift_getObjCClassMetadata();
  sub_22912263C();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return sub_22912B458() & 1;
}

- (MCLSignatureVerification)init
{
  return (MCLSignatureVerification *)sub_229122D90();
}

@end
@interface FBSystemServiceOpenApplicationRequest
- (NSString)systemServiceDescription;
@end

@implementation FBSystemServiceOpenApplicationRequest

- (NSString)systemServiceDescription
{
  sub_10002A544(0, &qword_10017E998);
  OpenApplicationVerifierRequest.verifierDescription.getter();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

@end
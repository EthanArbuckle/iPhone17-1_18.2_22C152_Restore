@interface IDSRegistrationRequestTracker
+ (IDSRegistrationRequestTracker)sharedInstance;
- (IDSRegistrationRequestTracker)init;
- (id)eventHistoryStringWithWantsBAADigests:(BOOL)a3;
- (void)completedRequest:(id)a3 resultCode:(int64_t)a4 interface:(unint64_t)a5;
@end

@implementation IDSRegistrationRequestTracker

+ (IDSRegistrationRequestTracker)sharedInstance
{
  if (qword_100A52CD0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100A53640;

  return (IDSRegistrationRequestTracker *)v2;
}

- (IDSRegistrationRequestTracker)init
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RegistrationRequestTracker();
  v2 = [(IDSRegistrationRequestTracker *)&v7 init];
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = v2;
  swift_retain();
  id v5 = sub_1004D598C();
  registerSysdiagnoseBlock(title:queue:block:)(0xD000000000000018, 0x80000001008C5AA0, (uint64_t)v5, (uint64_t)sub_10053AF48, v3);

  swift_release_n();
  return v4;
}

- (void)completedRequest:(id)a3 resultCode:(int64_t)a4 interface:(unint64_t)a5
{
  id v9 = a3;
  v10 = self;
  sub_1005395EC(a3, a4, a5);
}

- (id)eventHistoryStringWithWantsBAADigests:(BOOL)a3
{
  sub_100539BC4(a3);
  NSString v3 = sub_100726420();
  swift_bridgeObjectRelease();

  return v3;
}

@end
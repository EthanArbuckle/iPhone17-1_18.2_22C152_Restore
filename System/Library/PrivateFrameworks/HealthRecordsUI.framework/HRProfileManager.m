@interface HRProfileManager
+ (HRProfileManager)sharedInstance;
- (HRProfile)currentProfile;
- (HRProfile)primaryProfile;
- (HRProfileManager)init;
- (id)profileWithHealthStore:(id)a3;
- (id)profileWithProfileIdentifier:(id)a3;
- (void)setCurrentProfile:(id)a3;
- (void)switchCurrentProfileWithIdentifier:(id)a3;
@end

@implementation HRProfileManager

- (HRProfile)primaryProfile
{
  sub_1C254CEE0();
  sub_1C21A8A28();
  sub_1C21A89AC();
  v3 = self;
  swift_retain();
  sub_1C254E1D0();

  swift_release();
  return (HRProfile *)v5;
}

- (HRProfile)currentProfile
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___HRProfileManager_currentProfile);
  swift_beginAccess();
  return (HRProfile *)*v2;
}

- (void)setCurrentProfile:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___HRProfileManager_currentProfile);
  swift_beginAccess();
  id v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

+ (HRProfileManager)sharedInstance
{
  if (qword_1EBB6EF30 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBB6FB90;
  return (HRProfileManager *)v2;
}

- (HRProfileManager)init
{
  return (HRProfileManager *)ProfileManager.init()();
}

- (void)switchCurrentProfileWithIdentifier:(id)a3
{
  sub_1C254CEE0();
  sub_1C21A89AC();
  id v5 = a3;
  id v6 = self;
  swift_retain();
  sub_1C254E1E0();

  swift_release();
}

- (id)profileWithHealthStore:(id)a3
{
  sub_1C254CEE0();
  sub_1C21A8A28();
  sub_1C21A89AC();
  id v5 = a3;
  id v6 = self;
  swift_retain();
  sub_1C254E1D0();

  swift_release();
  return v8;
}

- (id)profileWithProfileIdentifier:(id)a3
{
  sub_1C254CEE0();
  sub_1C21A8A28();
  sub_1C21A89AC();
  id v5 = a3;
  id v6 = self;
  swift_retain();
  sub_1C254E1D0();

  swift_release();
  return v8;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
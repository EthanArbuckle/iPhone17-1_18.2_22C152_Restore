@interface EmergencyAccessBuddyViewControllerCreator
+ (id)makeFollowUpViewControllerFor:(id)a3 healthStore:(id)a4 followUpDelegate:(id)a5;
- (_TtC23HealthFollowUpExtension41EmergencyAccessBuddyViewControllerCreator)init;
@end

@implementation EmergencyAccessBuddyViewControllerCreator

+ (id)makeFollowUpViewControllerFor:(id)a3 healthStore:(id)a4 followUpDelegate:(id)a5
{
  uint64_t v7 = sub_100007050();
  unint64_t v9 = v8;
  swift_getObjCClassMetadata();
  id v10 = a4;
  swift_unknownObjectRetain();
  v11 = (void *)static EmergencyAccessBuddyViewControllerCreator.makeFollowUpViewController(for:healthStore:followUpDelegate:)(v7, v9, v10, (uint64_t)a5);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v11;
}

- (_TtC23HealthFollowUpExtension41EmergencyAccessBuddyViewControllerCreator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmergencyAccessBuddyViewControllerCreator();
  return [(EmergencyAccessBuddyViewControllerCreator *)&v3 init];
}

@end
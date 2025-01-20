@interface AwardProgressProvider
- (BOOL)providesProgressForTemplate:(id)a3;
- (_TtC19SeymourAwardsPlugin21AwardProgressProvider)init;
- (id)providerIdentifier;
- (void)requestAchievementProgressUpdatesForTemplates:(id)a3;
@end

@implementation AwardProgressProvider

- (_TtC19SeymourAwardsPlugin21AwardProgressProvider)init
{
  return (_TtC19SeymourAwardsPlugin21AwardProgressProvider *)sub_242EFEC74();
}

- (void).cxx_destruct
{
}

- (id)providerIdentifier
{
  sub_242F01080();
  sub_242F01070();
  v2 = (void *)sub_242F01100();
  swift_bridgeObjectRelease();

  return v2;
}

- (BOOL)providesProgressForTemplate:(id)a3
{
  id v4 = a3;
  v5 = self;
  char v6 = sub_242EFF184(v4);

  return v6 & 1;
}

- (void)requestAchievementProgressUpdatesForTemplates:(id)a3
{
  sub_242EFF670(0, (unint64_t *)&unk_26B0B6020);
  unint64_t v4 = sub_242F01130();
  v5 = self;
  sub_242EFF248(v4);

  swift_bridgeObjectRelease();
}

@end
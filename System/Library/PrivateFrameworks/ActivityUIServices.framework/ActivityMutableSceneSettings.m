@interface ActivityMutableSceneSettings
- (_TtC18ActivityUIServices28ActivityMutableSceneSettings)init;
- (_TtC18ActivityUIServices28ActivityMutableSceneSettings)initWithSettings:(id)a3;
- (id)copyWithZone:(void *)a3;
- (id)keyDescriptionForSetting:(int64_t)a3;
@end

@implementation ActivityMutableSceneSettings

- (_TtC18ActivityUIServices28ActivityMutableSceneSettings)initWithSettings:(id)a3
{
  return (_TtC18ActivityUIServices28ActivityMutableSceneSettings *)sub_23C985204(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for ActivityMutableSceneSettings);
}

- (_TtC18ActivityUIServices28ActivityMutableSceneSettings)init
{
  return (_TtC18ActivityUIServices28ActivityMutableSceneSettings *)sub_23C985268(self, (uint64_t)a2, type metadata accessor for ActivityMutableSceneSettings);
}

- (id)copyWithZone:(void *)a3
{
  return sub_23C9852C4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for ActivitySceneSettings);
}

- (id)keyDescriptionForSetting:(int64_t)a3
{
  return sub_23C985324(self, (uint64_t)a2, a3, type metadata accessor for ActivityMutableSceneSettings);
}

@end
@interface ActivitySceneSettings
- (_TtC18ActivityUIServices21ActivitySceneSettings)init;
- (_TtC18ActivityUIServices21ActivitySceneSettings)initWithSettings:(id)a3;
- (id)keyDescriptionForSetting:(int64_t)a3;
- (id)mutableCopyWithZone:(void *)a3;
@end

@implementation ActivitySceneSettings

- (_TtC18ActivityUIServices21ActivitySceneSettings)init
{
  return (_TtC18ActivityUIServices21ActivitySceneSettings *)sub_23C985268(self, (uint64_t)a2, type metadata accessor for ActivitySceneSettings);
}

- (_TtC18ActivityUIServices21ActivitySceneSettings)initWithSettings:(id)a3
{
  return (_TtC18ActivityUIServices21ActivitySceneSettings *)sub_23C985204(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for ActivitySceneSettings);
}

- (id)mutableCopyWithZone:(void *)a3
{
  return sub_23C9852C4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for ActivityMutableSceneSettings);
}

- (id)keyDescriptionForSetting:(int64_t)a3
{
  return sub_23C985324(self, (uint64_t)a2, a3, type metadata accessor for ActivitySceneSettings);
}

@end
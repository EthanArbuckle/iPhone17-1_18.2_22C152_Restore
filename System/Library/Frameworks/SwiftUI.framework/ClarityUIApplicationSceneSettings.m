@interface ClarityUIApplicationSceneSettings
- (_TtC7SwiftUI33ClarityUIApplicationSceneSettings)init;
- (_TtC7SwiftUI33ClarityUIApplicationSceneSettings)initWithSettings:(id)a3;
- (id)keyDescriptionForSetting:(int64_t)a3;
- (id)mutableCopyWithZone:(void *)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(int64_t)a5;
@end

@implementation ClarityUIApplicationSceneSettings

- (id)keyDescriptionForSetting:(int64_t)a3
{
  return @objc ClarityUIApplicationSceneSettings.keyDescription(forSetting:)(self, (uint64_t)a2, a3, type metadata accessor for ClarityUIApplicationSceneSettings);
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(int64_t)a5
{
  return @objc ClarityUIApplicationSceneSettings.valueDescription(for:object:ofSetting:)(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (uint64_t (*)(uint64_t))type metadata accessor for ClarityUIApplicationSceneSettings);
}

- (id)mutableCopyWithZone:(void *)a3
{
  return @objc ClarityUIApplicationSceneSettings.mutableCopy(with:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for ClarityUIMutableApplicationSceneSettings);
}

- (_TtC7SwiftUI33ClarityUIApplicationSceneSettings)initWithSettings:(id)a3
{
  return (_TtC7SwiftUI33ClarityUIApplicationSceneSettings *)@objc ClarityUIApplicationSceneSettings.init(settings:)(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for ClarityUIApplicationSceneSettings);
}

- (_TtC7SwiftUI33ClarityUIApplicationSceneSettings)init
{
  return (_TtC7SwiftUI33ClarityUIApplicationSceneSettings *)@objc ClarityUIApplicationSceneSettings.init()(self, (uint64_t)a2, type metadata accessor for ClarityUIApplicationSceneSettings);
}

@end
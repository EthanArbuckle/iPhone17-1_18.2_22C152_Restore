@interface ClarityUIMutableApplicationSceneSettings
- (_TtC7SwiftUI40ClarityUIMutableApplicationSceneSettings)init;
- (_TtC7SwiftUI40ClarityUIMutableApplicationSceneSettings)initWithSettings:(id)a3;
- (id)copyWithZone:(void *)a3;
- (id)keyDescriptionForSetting:(int64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(int64_t)a5;
@end

@implementation ClarityUIMutableApplicationSceneSettings

- (id)keyDescriptionForSetting:(int64_t)a3
{
  return @objc ClarityUIApplicationSceneSettings.keyDescription(forSetting:)(self, (uint64_t)a2, a3, type metadata accessor for ClarityUIMutableApplicationSceneSettings);
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(int64_t)a5
{
  return @objc ClarityUIApplicationSceneSettings.valueDescription(for:object:ofSetting:)(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (uint64_t (*)(uint64_t))type metadata accessor for ClarityUIMutableApplicationSceneSettings);
}

- (id)copyWithZone:(void *)a3
{
  return @objc ClarityUIApplicationSceneSettings.mutableCopy(with:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for ClarityUIApplicationSceneSettings);
}

- (_TtC7SwiftUI40ClarityUIMutableApplicationSceneSettings)initWithSettings:(id)a3
{
  return (_TtC7SwiftUI40ClarityUIMutableApplicationSceneSettings *)@objc ClarityUIApplicationSceneSettings.init(settings:)(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for ClarityUIMutableApplicationSceneSettings);
}

- (_TtC7SwiftUI40ClarityUIMutableApplicationSceneSettings)init
{
  return (_TtC7SwiftUI40ClarityUIMutableApplicationSceneSettings *)@objc ClarityUIApplicationSceneSettings.init()(self, (uint64_t)a2, type metadata accessor for ClarityUIMutableApplicationSceneSettings);
}

@end
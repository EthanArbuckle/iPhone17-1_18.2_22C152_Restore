@interface ClarityUIApplicationSceneClientSettings
- (_TtC7SwiftUI39ClarityUIApplicationSceneClientSettings)init;
- (_TtC7SwiftUI39ClarityUIApplicationSceneClientSettings)initWithSettings:(id)a3;
- (id)keyDescriptionForSetting:(int64_t)a3;
- (id)mutableCopyWithZone:(void *)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(int64_t)a5;
@end

@implementation ClarityUIApplicationSceneClientSettings

- (id)keyDescriptionForSetting:(int64_t)a3
{
  return @objc ClarityUIApplicationSceneClientSettings.keyDescription(forSetting:)(self, (uint64_t)a2, a3, type metadata accessor for ClarityUIApplicationSceneClientSettings);
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(int64_t)a5
{
  return @objc ClarityUIApplicationSceneClientSettings.valueDescription(for:object:ofSetting:)(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (uint64_t (*)(uint64_t))type metadata accessor for ClarityUIApplicationSceneClientSettings);
}

- (id)mutableCopyWithZone:(void *)a3
{
  return @objc ClarityUIApplicationSceneClientSettings.mutableCopy(with:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for ClarityUIMutableApplicationSceneClientSettings);
}

- (_TtC7SwiftUI39ClarityUIApplicationSceneClientSettings)initWithSettings:(id)a3
{
  return (_TtC7SwiftUI39ClarityUIApplicationSceneClientSettings *)@objc ClarityUIApplicationSceneClientSettings.init(settings:)(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for ClarityUIApplicationSceneClientSettings);
}

- (_TtC7SwiftUI39ClarityUIApplicationSceneClientSettings)init
{
  return (_TtC7SwiftUI39ClarityUIApplicationSceneClientSettings *)@objc ClarityUIApplicationSceneClientSettings.init()(self, (uint64_t)a2, type metadata accessor for ClarityUIApplicationSceneClientSettings);
}

@end
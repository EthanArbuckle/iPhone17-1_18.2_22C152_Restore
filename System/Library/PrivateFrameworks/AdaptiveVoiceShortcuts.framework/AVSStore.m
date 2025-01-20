@interface AVSStore
+ (NSArray)shortcuts;
+ (NSDictionary)shortcutsNamesDictionary;
- (AVSStore)init;
- (void)deleteShortcutWithIdentifier:(id)a3;
@end

@implementation AVSStore

+ (NSDictionary)shortcutsNamesDictionary
{
  _sSo8AVSStoreC22AdaptiveVoiceShortcutsE24shortcutsNamesDictionarySDyS2SGvgZ_0();
  v2 = (void *)sub_247750AC8();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

+ (NSArray)shortcuts
{
  uint64_t v2 = _sSo8AVSStoreC22AdaptiveVoiceShortcutsE9shortcutsSaySo0bC17ShortcutObjcClassCGvgZ_0();
  type metadata accessor for AdaptiveVoiceShortcutObjcClass(v2);
  v3 = (void *)sub_247750B88();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (void)deleteShortcutWithIdentifier:(id)a3
{
  uint64_t v4 = sub_247750B08();
  uint64_t v6 = v5;
  v7 = self;
  _sSo8AVSStoreC22AdaptiveVoiceShortcutsE14deleteShortcut14withIdentifierySS_tF_0(v4, v6);

  swift_bridgeObjectRelease();
}

- (AVSStore)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVSStore;
  return [(AVSStore *)&v3 init];
}

@end
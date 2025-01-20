@interface SuggestionsAppsPickerView.WrappedInstalledApp
- (NSString)displayName;
- (_TtCV15FocusSettingsUI25SuggestionsAppsPickerView19WrappedInstalledApp)init;
- (void)setDisplayName:(id)a3;
@end

@implementation SuggestionsAppsPickerView.WrappedInstalledApp

- (NSString)displayName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_220F32728();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setDisplayName:(id)a3
{
  uint64_t v4 = sub_220F32768();
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtCV15FocusSettingsUI25SuggestionsAppsPickerView19WrappedInstalledApp_displayName);
  uint64_t *v5 = v4;
  v5[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtCV15FocusSettingsUI25SuggestionsAppsPickerView19WrappedInstalledApp)init
{
  result = (_TtCV15FocusSettingsUI25SuggestionsAppsPickerView19WrappedInstalledApp *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end
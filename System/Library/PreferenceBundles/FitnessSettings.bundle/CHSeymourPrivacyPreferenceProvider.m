@interface CHSeymourPrivacyPreferenceProvider
- (CHSeymourPrivacyPreferenceProvider)init;
- (void)fetchPersonalizationPrivacyPreferenceWithCompletion:(id)a3;
- (void)setPersonalizationPrivacyPreference:(id)a3;
@end

@implementation CHSeymourPrivacyPreferenceProvider

- (CHSeymourPrivacyPreferenceProvider)init
{
  return (CHSeymourPrivacyPreferenceProvider *)SeymourPrivacyPreferenceProvider.init()();
}

- (void)setPersonalizationPrivacyPreference:(id)a3
{
  id v4 = a3;
  v5 = self;
  SeymourPrivacyPreferenceProvider.setPersonalizationPrivacyPreference(_:)((NSNumber)v4);
}

- (void)fetchPersonalizationPrivacyPreferenceWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  SeymourPrivacyPreferenceProvider.fetchPersonalizationPrivacyPreference(completion:)((uint64_t)sub_5EA4, v5);

  swift_release();
}

- (void).cxx_destruct
{
}

@end
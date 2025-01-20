@interface PHVisualVoicemailManagerFactory
+ (id)getVisualVoiceMailWithVisualVoicemailManager:(id)a3 onVoicemailsChanged:(id)a4;
- (PHVisualVoicemailManagerFactory)init;
@end

@implementation PHVisualVoicemailManagerFactory

+ (id)getVisualVoiceMailWithVisualVoicemailManager:(id)a3 onVoicemailsChanged:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = a3;
  v8 = sub_10017C5E8(v7, (uint64_t)sub_10017C7CC, v6);

  swift_release();

  return v8;
}

- (PHVisualVoicemailManagerFactory)init
{
  return (PHVisualVoicemailManagerFactory *)sub_10017C6E4();
}

@end
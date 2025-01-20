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
  id v7 = objc_allocWithZone((Class)type metadata accessor for VisualVoicemailManager());
  id v8 = a3;
  swift_retain();
  v9 = VisualVoicemailManager.init(visualVoicemailManager:onVoicemailsChanged:)(v8, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) () -> (), v6);

  swift_release();

  return v9;
}

- (PHVisualVoicemailManagerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VisualVoicemailManagerFactory();
  return [(PHVisualVoicemailManagerFactory *)&v3 init];
}

@end
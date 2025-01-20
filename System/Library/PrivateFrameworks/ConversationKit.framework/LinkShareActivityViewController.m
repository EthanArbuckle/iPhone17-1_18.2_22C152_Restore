@interface LinkShareActivityViewController
- (_TtC15ConversationKit31LinkShareActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4;
- (void)_prepareActivity:(id)a3;
@end

@implementation LinkShareActivityViewController

- (_TtC15ConversationKit31LinkShareActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    type metadata accessor for NSObject(0, &lazy cache variable for type metadata for UIActivity);
    uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC15ConversationKit31LinkShareActivityViewController *)LinkShareActivityViewController.init(activityItems:applicationActivities:)(v5, v6);
}

- (void)_prepareActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LinkShareActivityViewController._prepare(_:)((UIActivity)v4);
}

- (void).cxx_destruct
{
}

@end
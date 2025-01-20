@interface TextActivityItemWithIcon
- (_TtC21WritingToolsUIService24TextActivityItemWithIcon)init;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation TextActivityItemWithIcon

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21WritingToolsUIService24TextActivityItemWithIcon_text);
  id v5 = a3;
  v6 = self;
  id v7 = [v4 string];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  v8 = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();

  return v8;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21WritingToolsUIService24TextActivityItemWithIcon_text);
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  id v10 = [v6 string];
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;

  v20[3] = &type metadata for String;
  v20[0] = v11;
  v20[1] = v13;

  v14 = sub_100044740(v20, (uint64_t)&type metadata for String);
  uint64_t v15 = *(&type metadata for String - 1);
  __chkstk_darwin(v14);
  v17 = (char *)v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v15 + 16))(v17);
  v18 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, void *))(v15 + 8))(v17, &type metadata for String);
  sub_100027DBC((uint64_t)v20);

  return v18;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1001013B4();
  id v7 = v6;

  return v7;
}

- (_TtC21WritingToolsUIService24TextActivityItemWithIcon)init
{
  result = (_TtC21WritingToolsUIService24TextActivityItemWithIcon *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
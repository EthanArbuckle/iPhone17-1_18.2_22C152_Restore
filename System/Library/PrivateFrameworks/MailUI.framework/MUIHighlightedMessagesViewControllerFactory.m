@interface MUIHighlightedMessagesViewControllerFactory
+ (id)createViewControllerForMessages:(id)a3 mailboxes:(id)a4 cellLayoutValues:(id)a5 contactStore:(id)a6 delegate:(id)a7;
+ (void)hideBelowLineMessagesForViewController:(id)a3;
+ (void)resetSelectionForViewController:(id)a3;
+ (void)updateContainerInsets:(NSDirectionalEdgeInsets)a3 forViewController:(id)a4;
+ (void)updateMessages:(id)a3 mailboxes:(id)a4 forViewController:(id)a5;
- (MUIHighlightedMessagesViewControllerFactory)init;
@end

@implementation MUIHighlightedMessagesViewControllerFactory

+ (id)createViewControllerForMessages:(id)a3 mailboxes:(id)a4 cellLayoutValues:(id)a5 contactStore:(id)a6 delegate:(id)a7
{
  swift_getObjCClassMetadata();
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  swift_unknownObjectRetain();
  type metadata accessor for MUIHighlightedMessage();
  uint64_t v14 = sub_1DDEEEDA8();
  sub_1DDD79318();
  uint64_t v12 = sub_1DDEEEDA8();
  swift_getObjCClassMetadata();
  id v19 = sub_1DDE65D24(v14, v12, a5, a6, (uint64_t)a7);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return v19;
}

+ (void)updateContainerInsets:(NSDirectionalEdgeInsets)a3 forViewController:(id)a4
{
  swift_getObjCClassMetadata();
  id v4 = a4;
  swift_getObjCClassMetadata();
  sub_1DDE662F8(a4, a3.top, a3.leading, a3.bottom, a3.trailing);
}

+ (void)updateMessages:(id)a3 mailboxes:(id)a4 forViewController:(id)a5
{
  swift_getObjCClassMetadata();
  id v5 = a3;
  id v6 = a4;
  id v7 = a5;
  type metadata accessor for MUIHighlightedMessage();
  uint64_t v10 = sub_1DDEEEDA8();
  sub_1DDD79318();
  uint64_t v8 = sub_1DDEEEDA8();
  swift_getObjCClassMetadata();
  sub_1DDE6651C(v10, v8, a5);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (void)hideBelowLineMessagesForViewController:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  sub_1DDE66810(a3);
}

+ (void)resetSelectionForViewController:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  sub_1DDE669C0((uint64_t)a3);
}

- (MUIHighlightedMessagesViewControllerFactory)init
{
  return (MUIHighlightedMessagesViewControllerFactory *)MUIHighlightedMessagesViewControllerFactory.init()();
}

@end
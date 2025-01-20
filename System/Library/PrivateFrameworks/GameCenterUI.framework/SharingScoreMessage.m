@interface SharingScoreMessage
- (_TtC12GameCenterUI19SharingScoreMessage)init;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation SharingScoreMessage

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return sub_1AF65E1E4(self, (uint64_t)a2, a3, (void (*)(void *__return_ptr))SharingScoreMessage.activityViewControllerPlaceholderItem(_:));
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return sub_1AF65E4D4(self, (uint64_t)a2, a3, a4, (void (*)(void *__return_ptr))SharingScoreMessage.activityViewController(_:itemForActivityType:));
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  SharingScoreMessage.activityViewController(_:subjectForActivityType:)((UIActivityViewController *)v8, v9);

  v10 = (void *)sub_1AF7AE0A0();
  swift_bridgeObjectRelease();

  return v10;
}

- (_TtC12GameCenterUI19SharingScoreMessage)init
{
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12GameCenterUI19SharingScoreMessage_leaderboard);
}

@end
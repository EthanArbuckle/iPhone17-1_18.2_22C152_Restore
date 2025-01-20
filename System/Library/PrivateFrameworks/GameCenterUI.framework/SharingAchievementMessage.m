@interface SharingAchievementMessage
- (_TtC12GameCenterUI25SharingAchievementMessage)init;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation SharingAchievementMessage

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return sub_1AF56153C(self, (uint64_t)a2, a3, (void (*)(void *__return_ptr))SharingAchievementMessage.activityViewControllerPlaceholderItem(_:));
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return sub_1AF56182C(self, (uint64_t)a2, a3, a4, (void (*)(void *__return_ptr))SharingAchievementMessage.activityViewController(_:itemForActivityType:));
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  SharingAchievementMessage.activityViewController(_:subjectForActivityType:)((UIActivityViewController *)v8, v9);

  v10 = (void *)sub_1AF7AE0A0();
  swift_bridgeObjectRelease();

  return v10;
}

- (_TtC12GameCenterUI25SharingAchievementMessage)init
{
}

- (void).cxx_destruct
{
}

@end
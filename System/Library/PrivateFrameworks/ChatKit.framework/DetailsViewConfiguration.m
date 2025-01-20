@interface DetailsViewConfiguration
- (_TtC7ChatKit24DetailsViewConfiguration)init;
- (void)accountDefaultsChanged:(id)a3;
- (void)batchDownloadNotificationFired:(id)a3;
- (void)chatAutoDonatingHandleUpdateNotification:(id)a3;
- (void)contactsManagerViewModelsDidChange:(id)a3;
- (void)conversationJoinStateChanged:(id)a3;
- (void)conversationParticipantsChanged:(id)a3;
- (void)handleKeyTransparencyStatusChanged:(id)a3;
- (void)serviceForSendingChanged:(id)a3;
- (void)toggleSharingStateFromABCard;
@end

@implementation DetailsViewConfiguration

- (void)toggleSharingStateFromABCard
{
  v2 = self;
  sub_18F5235AC();
}

- (void)batchDownloadNotificationFired:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F566A38();
}

- (void)contactsManagerViewModelsDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F5D4D30(v4);
}

- (void)handleKeyTransparencyStatusChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F66CEA8();
}

- (void)chatAutoDonatingHandleUpdateNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F709AD8(v4);
}

- (void)conversationJoinStateChanged:(id)a3
{
  swift_getKeyPath();
  sub_18F5D51CC();
  id v5 = a3;
  v6 = self;
  sub_18F7B6420();

  swift_release();
}

- (void)conversationParticipantsChanged:(id)a3
{
  swift_getKeyPath();
  sub_18F5D51CC();
  id v5 = a3;
  v6 = self;
  sub_18F7B6420();

  swift_release();
}

- (void)accountDefaultsChanged:(id)a3
{
  swift_getKeyPath();
  sub_18F5D51CC();
  id v5 = a3;
  v6 = self;
  sub_18F7B6420();

  swift_release();
}

- (void)serviceForSendingChanged:(id)a3
{
  swift_getKeyPath();
  sub_18F5D51CC();
  id v5 = a3;
  v6 = self;
  sub_18F7B6420();

  swift_release();
}

- (_TtC7ChatKit24DetailsViewConfiguration)init
{
  result = (_TtC7ChatKit24DetailsViewConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__delegate);
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__alertPresenter);
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__presentingViewController);
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__suggestionsEnabledContactsStore));
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__supportsSharingFocusStatus));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isSharingFocusStatus));
  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration___observationRegistrar;
  uint64_t v4 = sub_18F7B6470();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end
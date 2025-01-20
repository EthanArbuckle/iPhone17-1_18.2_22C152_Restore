@interface SharePlayModeChiclet
@end

@implementation SharePlayModeChiclet

- (void).cxx_destruct
{
  sub_1000072C8((uint64_t)self + OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_activeConversationUUID);
  sub_10000736C(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_messagesGroupPhotoData), *(void *)&self->super.super.super.metadataViews[OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_messagesGroupPhotoData]);
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_imageLoadQueue);
}

@end
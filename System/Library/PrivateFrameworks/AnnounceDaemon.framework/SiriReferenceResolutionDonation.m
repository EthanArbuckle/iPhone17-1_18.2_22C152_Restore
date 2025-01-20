@interface SiriReferenceResolutionDonation
- (_TtC14AnnounceDaemon31SiriReferenceResolutionDonation)init;
- (void)makePlaybackDonationWithAnnouncementID:(id)a3;
@end

@implementation SiriReferenceResolutionDonation

- (_TtC14AnnounceDaemon31SiriReferenceResolutionDonation)init
{
  uint64_t v3 = sub_1DA64AC20();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  id v8 = (id)ANLogWithCategory();
  sub_1DA64AC30();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))((uint64_t)v7 + OBJC_IVAR____TtC14AnnounceDaemon31SiriReferenceResolutionDonation_logger, v6, v3);

  v9 = (objc_class *)type metadata accessor for SiriReferenceResolutionDonation();
  v11.receiver = v7;
  v11.super_class = v9;
  return [(SiriReferenceResolutionDonation *)&v11 init];
}

- (void)makePlaybackDonationWithAnnouncementID:(id)a3
{
  uint64_t v4 = sub_1DA64AD20();
  unint64_t v6 = v5;
  v7 = self;
  sub_1DA6420A0(v4, v6);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC14AnnounceDaemon31SiriReferenceResolutionDonation_logger;
  uint64_t v3 = sub_1DA64AC20();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end
@interface CommunicationManager
- (_TtC13SharedWithYou20CommunicationManager)init;
- (void)serviceProxyDidConnect:(id)a3;
@end

@implementation CommunicationManager

- (void)serviceProxyDidConnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18FB49F44();
}

- (_TtC13SharedWithYou20CommunicationManager)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager____lazy_storage___facetimeServiceProxy) = 0;
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_attributionIdentifier);
  void *v2 = 0;
  v2[1] = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_videoEnabled) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CommunicationManager();
  return [(CommunicationManager *)&v4 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager____lazy_storage___facetimeServiceProxy));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController);
}

@end
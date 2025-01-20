@interface ScrubberView.DisplayLink
- (_TtCC11AssetViewer12ScrubberViewP33_82866A5555A2CDB794CEBCFE6A3F2A7D11DisplayLink)init;
- (void)handleLink:(id)a3;
@end

@implementation ScrubberView.DisplayLink

- (void)handleLink:(id)a3
{
  v3 = *(void (**)(_TtCC11AssetViewer12ScrubberViewP33_82866A5555A2CDB794CEBCFE6A3F2A7D11DisplayLink *))((char *)&self->super.isa + OBJC_IVAR____TtCC11AssetViewer12ScrubberViewP33_82866A5555A2CDB794CEBCFE6A3F2A7D11DisplayLink_linkFired);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    sub_1E2873E2C((uint64_t)v3);
    v3(v6);
    sub_1E287427C((uint64_t)v3);
  }
}

- (_TtCC11AssetViewer12ScrubberViewP33_82866A5555A2CDB794CEBCFE6A3F2A7D11DisplayLink)init
{
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC11AssetViewer12ScrubberViewP33_82866A5555A2CDB794CEBCFE6A3F2A7D11DisplayLink_linkFired);
  void *v2 = 0;
  v2[1] = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCC11AssetViewer12ScrubberViewP33_82866A5555A2CDB794CEBCFE6A3F2A7D11DisplayLink_link) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ScrubberView.DisplayLink();
  return [(ScrubberView.DisplayLink *)&v4 init];
}

- (void).cxx_destruct
{
  sub_1E287427C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC11AssetViewer12ScrubberViewP33_82866A5555A2CDB794CEBCFE6A3F2A7D11DisplayLink_linkFired));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC11AssetViewer12ScrubberViewP33_82866A5555A2CDB794CEBCFE6A3F2A7D11DisplayLink_link);
}

@end
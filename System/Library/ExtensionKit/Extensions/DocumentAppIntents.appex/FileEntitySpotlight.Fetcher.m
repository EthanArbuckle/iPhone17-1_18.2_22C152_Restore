@interface FileEntitySpotlight.Fetcher
- (_TtCO18DocumentAppIntents19FileEntitySpotlightP33_D35611FA93D7F34D84E66CEDA46C09347Fetcher)init;
- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4;
- (void)collectionDidFinishGathering:(id)a3;
@end

@implementation FileEntitySpotlight.Fetcher

- (_TtCO18DocumentAppIntents19FileEntitySpotlightP33_D35611FA93D7F34D84E66CEDA46C09347Fetcher)init
{
  result = (_TtCO18DocumentAppIntents19FileEntitySpotlightP33_D35611FA93D7F34D84E66CEDA46C09347Fetcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100037540(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCO18DocumentAppIntents19FileEntitySpotlightP33_D35611FA93D7F34D84E66CEDA46C09347Fetcher_completionHandler));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCO18DocumentAppIntents19FileEntitySpotlightP33_D35611FA93D7F34D84E66CEDA46C09347Fetcher_queryCollection);
}

- (void)collectionDidFinishGathering:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100100BD8(v4);
}

- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4
{
  id v4 = _Block_copy(a4);

  _Block_release(v4);
}

@end
@interface GDSwiftViewService
+ (GDSwiftViewService)clientService;
+ (id)clientServiceWithUseCase:(id)a3;
- (GDSwiftViewService)init;
- (id)autonamingViewWithViewName:(id)a3 error:(id *)a4;
- (id)donationViewAndReturnError:(id *)a3;
- (id)firstPartyLongTermTopicViewAndReturnError:(id *)a3;
- (id)firstPartyShortTermTopicViewAndReturnError:(id *)a3;
- (id)gdFeatureViewAndReturnError:(id *)a3;
- (id)gdSwiftSubgraphViewContextWithName:(id)a3 tableName:(id)a4 error:(id *)a5;
- (id)objcLanguageViewAndReturnError:(id *)a3;
- (id)pageRankViewAndReturnError:(id *)a3;
- (id)personViewAndReturnError:(id *)a3;
- (id)visualIdentifierViewAndReturnError:(id *)a3;
@end

@implementation GDSwiftViewService

+ (GDSwiftViewService)clientService
{
  v2 = (void *)static ViewService.clientService.getter();

  return (GDSwiftViewService *)v2;
}

+ (id)clientServiceWithUseCase:(id)a3
{
  id v3 = a3;
  v4 = (void *)static ViewService.clientService(useCase:)(v3);

  return v4;
}

- (GDSwiftViewService)init
{
  return (GDSwiftViewService *)ViewService.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___GDSwiftViewService_useCase);
}

- (id)personViewAndReturnError:(id *)a3
{
  return sub_1B2E15CC8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))ViewService.personView());
}

- (id)visualIdentifierViewAndReturnError:(id *)a3
{
  return sub_1B2E15CC8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))ViewService.visualIdentifierView());
}

- (id)donationViewAndReturnError:(id *)a3
{
  return sub_1B2E15CC8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))ViewService.donationView());
}

- (id)pageRankViewAndReturnError:(id *)a3
{
  return sub_1B2E15CC8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))ViewService.pageRankView());
}

- (id)gdFeatureViewAndReturnError:(id *)a3
{
  return sub_1B2E15CC8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))ViewService.gdFeatureView());
}

- (id)firstPartyLongTermTopicViewAndReturnError:(id *)a3
{
  return sub_1B2E15CC8(self, (uint64_t)a2, (uint64_t)a3, ViewService.firstPartyLongTermTopicView());
}

- (id)firstPartyShortTermTopicViewAndReturnError:(id *)a3
{
  return sub_1B2E15CC8(self, (uint64_t)a2, (uint64_t)a3, ViewService.firstPartyShortTermTopicView());
}

- (id)objcLanguageViewAndReturnError:(id *)a3
{
  return sub_1B2E15CC8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))ViewService.objcLanguageView());
}

- (id)autonamingViewWithViewName:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_1B2E82378();
  uint64_t v7 = v6;
  v8 = self;
  v9 = ViewService.autonamingView(viewName:)(v5, v7);
  swift_bridgeObjectRelease();

  return v9;
}

- (id)gdSwiftSubgraphViewContextWithName:(id)a3 tableName:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_1B2E82378();
  uint64_t v8 = v7;
  uint64_t v9 = sub_1B2E82378();
  uint64_t v11 = v10;
  v12 = self;
  v13 = ViewService.gdSwiftSubgraphViewContext(name:tableName:)(v6, v8, v9, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v13;
}

@end
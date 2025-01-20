@interface GDViewService
+ (id)clientService;
- (GDViewService)initWithSwiftViewService:(id)a3;
- (id)autonamingViewWithViewName:(id)a3 error:(id *)a4;
- (id)donationViewWithError:(id *)a3;
- (id)featureViewWithError:(id *)a3;
- (id)firstPartyLongTermTopicViewWithError:(id *)a3;
- (id)firstPartyShortTermTopicViewWithError:(id *)a3;
- (id)languageViewWithError:(id *)a3;
- (id)pageRankViewWithError:(id *)a3;
- (id)personViewWithError:(id *)a3;
- (id)subgraphViewContextWithViewName:(id)a3 tableName:(id)a4 error:(id *)a5;
- (id)visualIdentifierViewWithError:(id *)a3;
@end

@implementation GDViewService

- (void).cxx_destruct
{
}

- (id)autonamingViewWithViewName:(id)a3 error:(id *)a4
{
  v5 = objc_msgSend_autonamingViewWithViewName_error_(self->_swiftViewService, a2, (uint64_t)a3, (uint64_t)a4, v4);
  if (v5)
  {
    v6 = [GDAutonamingView alloc];
    v10 = objc_msgSend_initWithInner_(v6, v7, (uint64_t)v5, v8, v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)subgraphViewContextWithViewName:(id)a3 tableName:(id)a4 error:(id *)a5
{
  v5 = objc_msgSend_gdSwiftSubgraphViewContextWithName_tableName_error_(self->_swiftViewService, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  if (v5)
  {
    v6 = [GDSubgraphViewContext alloc];
    v10 = objc_msgSend_initWithInner_(v6, v7, (uint64_t)v5, v8, v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)languageViewWithError:(id *)a3
{
  return (id)((uint64_t (*)(GDSwiftViewService *, char *, id *))MEMORY[0x1F4181798])(self->_swiftViewService, sel_objcLanguageViewAndReturnError_, a3);
}

- (id)firstPartyShortTermTopicViewWithError:(id *)a3
{
  return (id)((uint64_t (*)(GDSwiftViewService *, char *, id *))MEMORY[0x1F4181798])(self->_swiftViewService, sel_firstPartyShortTermTopicViewAndReturnError_, a3);
}

- (id)firstPartyLongTermTopicViewWithError:(id *)a3
{
  return (id)((uint64_t (*)(GDSwiftViewService *, char *, id *))MEMORY[0x1F4181798])(self->_swiftViewService, sel_firstPartyLongTermTopicViewAndReturnError_, a3);
}

- (id)featureViewWithError:(id *)a3
{
  return (id)((uint64_t (*)(GDSwiftViewService *, char *, id *))MEMORY[0x1F4181798])(self->_swiftViewService, sel_gdFeatureViewAndReturnError_, a3);
}

- (id)pageRankViewWithError:(id *)a3
{
  return (id)((uint64_t (*)(GDSwiftViewService *, char *, id *))MEMORY[0x1F4181798])(self->_swiftViewService, sel_pageRankViewAndReturnError_, a3);
}

- (id)donationViewWithError:(id *)a3
{
  return (id)((uint64_t (*)(GDSwiftViewService *, char *, id *))MEMORY[0x1F4181798])(self->_swiftViewService, sel_donationViewAndReturnError_, a3);
}

- (id)visualIdentifierViewWithError:(id *)a3
{
  return (id)((uint64_t (*)(GDSwiftViewService *, char *, id *))MEMORY[0x1F4181798])(self->_swiftViewService, sel_visualIdentifierViewAndReturnError_, a3);
}

- (id)personViewWithError:(id *)a3
{
  return (id)((uint64_t (*)(GDSwiftViewService *, char *, id *))MEMORY[0x1F4181798])(self->_swiftViewService, sel_personViewAndReturnError_, a3);
}

- (GDViewService)initWithSwiftViewService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDViewService;
  v6 = [(GDViewService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_swiftViewService, a3);
  }

  return v7;
}

+ (id)clientService
{
  if (qword_1EB7F2B98 != -1) {
    dispatch_once(&qword_1EB7F2B98, &unk_1F0AE1DF0);
  }
  v2 = (void *)qword_1EB7F2F30;

  return v2;
}

@end
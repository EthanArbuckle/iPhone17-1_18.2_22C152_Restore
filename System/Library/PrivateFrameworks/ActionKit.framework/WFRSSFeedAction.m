@interface WFRSSFeedAction
- (MWFeedParser)parser;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)cancel;
- (void)feedParser:(id)a3 didFailWithError:(id)a4;
- (void)feedParser:(id)a3 didParseFeedItem:(id)a4;
- (void)feedParserDidFinish:(id)a3;
- (void)finishRunningWithError:(id)a3;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)getURLsFromInputWithCompletionHandler:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setParser:(id)a3;
@end

@implementation WFRSSFeedAction

- (void).cxx_destruct
{
}

- (void)setParser:(id)a3
{
}

- (MWFeedParser)parser
{
  return self->_parser;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a3;
  v8 = NSString;
  id v9 = a5;
  id v10 = a4;
  if (v7)
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to use %2$@ while fetching a RSS feed from %3$@?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v7, v10);
  }
  else
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to fetch a RSS feed from %2$@?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  v12 = };

  return v12;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WFRSSFeedAction *)self input];
  WFGetContentLocationFromURLActionInput();
}

- (void)feedParser:(id)a3 didFailWithError:(id)a4
{
  v13[3] = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F870B8];
  v12[0] = *MEMORY[0x263F08338];
  id v7 = a4;
  v8 = WFLocalizedString(@"Unable to parse news feed");
  v13[0] = v8;
  v12[1] = *MEMORY[0x263F08320];
  id v9 = WFLocalizedString(@"Please pass a valid feed URL to the Get Items from RSS Feed action.");
  v12[2] = *MEMORY[0x263F08608];
  v13[1] = v9;
  v13[2] = v7;
  id v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  v11 = [v5 errorWithDomain:v6 code:6 userInfo:v10];

  [(WFRSSFeedAction *)self finishRunningWithError:v11];
}

- (void)feedParserDidFinish:(id)a3
{
}

- (void)feedParser:(id)a3 didParseFeedItem:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(WFRSSFeedAction *)self output];
  v8 = [v6 asWFArticle];

  [v7 addObject:v8];
  id v9 = [(WFRSSFeedAction *)self parameterValueForKey:@"WFRSSItemQuantity" ofClass:objc_opt_class()];
  uint64_t v10 = [v9 integerValue];

  v11 = [(WFRSSFeedAction *)self output];
  uint64_t v12 = [v11 numberOfItems];

  if (v12 >= v10) {
    [v13 stopParsing];
  }
}

- (void)getURLsFromInputWithCompletionHandler:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFRSSFeedAction *)self input];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__WFRSSFeedAction_getURLsFromInputWithCompletionHandler___block_invoke;
  v8[3] = &unk_264E5B8E0;
  id v9 = v4;
  id v7 = v4;
  [v5 generateCollectionByCoercingToItemClasses:v6 completionHandler:v8];
}

void __57__WFRSSFeedAction_getURLsFromInputWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  id v10 = 0;
  v8 = [v7 collectionByFilteringToItemClass:objc_opt_class() excludedItems:&v10];

  id v9 = v10;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)finishRunningWithError:(id)a3
{
  id v4 = a3;
  [(WFRSSFeedAction *)self setParser:0];
  v5.receiver = self;
  v5.super_class = (Class)WFRSSFeedAction;
  [(WFRSSFeedAction *)&v5 finishRunningWithError:v4];
}

- (void)cancel
{
  v3 = [(WFRSSFeedAction *)self parser];
  [v3 stopParsing];

  v4.receiver = self;
  v4.super_class = (Class)WFRSSFeedAction;
  [(WFRSSFeedAction *)&v4 cancel];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__WFRSSFeedAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_264E5DBA0;
  v3[4] = self;
  [(WFRSSFeedAction *)self getURLsFromInputWithCompletionHandler:v3];
}

void __46__WFRSSFeedAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  if (a4)
  {
    [*(id *)(a1 + 32) finishRunningWithError:a4];
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __46__WFRSSFeedAction_runAsynchronouslyWithInput___block_invoke_2;
    v7[3] = &unk_264E5B898;
    v7[4] = *(void *)(a1 + 32);
    [v6 enumerateObjectRepresentations:v7 forClass:objc_opt_class() completionHandler:&__block_literal_global_41707];
  }
}

void __46__WFRSSFeedAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  WFAppTransportSecuredURL();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [[MWFeedParser alloc] initWithFeedURL:v3];
  [(MWFeedParser *)v2 setDelegate:*(void *)(a1 + 32)];
  [(MWFeedParser *)v2 setFeedParseType:1];
  [(MWFeedParser *)v2 parse];
}

@end
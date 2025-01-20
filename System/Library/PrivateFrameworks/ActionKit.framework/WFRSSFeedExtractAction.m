@interface WFRSSFeedExtractAction
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)addRSSFeedItemsFromHTML:(id)a3 baseURL:(id)a4 encoding:(id)a5;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)getURLsFromInputWithCompletionHandler:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFRSSFeedExtractAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a3;
  v8 = NSString;
  id v9 = a5;
  id v10 = a4;
  if (v7)
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to use %2$@ while finding RSS feeds on %3$@?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v7, v10);
  }
  else
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to find RSS feed on %2$@?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  v12 = };

  return v12;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WFRSSFeedExtractAction *)self input];
  WFGetContentLocationFromURLActionInput();
}

- (void)addRSSFeedItemsFromHTML:(id)a3 baseURL:(id)a4 encoding:(id)a5
{
  id v35 = a3;
  id v7 = a4;
  id v8 = a5;
  if ([v35 length])
  {
    id v9 = v35;
    id v10 = (const char *)[v9 bytes];
    LODWORD(v9) = [v9 length];
    id v11 = [v7 absoluteString];
    htmlDocPtr Memory = htmlReadMemory(v10, (int)v9, (const char *)[v11 UTF8String], (const char *)objc_msgSend(v8, "UTF8String"), 2049);

    v13 = xmlXPathNewContext(Memory);
    RootElement = xmlDocGetRootElement(Memory);
    xmlXPathObjectPtr v15 = xmlXPathNodeEval(RootElement, (const xmlChar *)"//head/link[(@rel='self' or @rel='alternate') and (@type='application/atom+xml' or @type='application/rss+xml')]", v13);
    if (v15)
    {
      v16 = v15;
      ctxt = v13;
      cur = Memory;
      id v32 = v8;
      id v33 = v7;
      p_nodeNr = &v15->nodesetval->nodeNr;
      if (p_nodeNr)
      {
        uint64_t v18 = 0;
        v19 = (void (**)(xmlChar *))MEMORY[0x263F8C880];
        while (1)
        {
          if (v18 >= *p_nodeNr) {
            goto LABEL_16;
          }
          v20 = *(const xmlNode **)(*((void *)p_nodeNr + 1) + 8 * v18);
          Prop = xmlGetProp(v20, (const xmlChar *)"href");
          if (Prop)
          {
            v22 = Prop;
            v23 = NSURL;
            v24 = objc_msgSend(NSString, "stringWithUTF8String:", Prop, ctxt, cur);
            v25 = [v23 URLWithString:v24];

            (*v19)(v22);
          }
          else
          {
            v25 = 0;
          }
          v26 = xmlGetProp(v20, (const xmlChar *)"title");
          if (!v26) {
            break;
          }
          v27 = v26;
          v28 = [NSString stringWithUTF8String:v26];
          (*v19)(v27);
          if (v25) {
            goto LABEL_11;
          }
LABEL_12:

          ++v18;
          p_nodeNr = &v16->nodesetval->nodeNr;
          if (!p_nodeNr) {
            goto LABEL_16;
          }
        }
        v28 = 0;
        if (!v25) {
          goto LABEL_12;
        }
LABEL_11:
        v29 = [(WFRSSFeedExtractAction *)self output];
        [v29 addObject:v25 named:v28];

        goto LABEL_12;
      }
LABEL_16:
      xmlXPathFreeObject(v16);
      xmlXPathFreeContext(ctxt);
      xmlFreeDoc(cur);
      id v8 = v32;
      id v7 = v33;
    }
  }
}

- (void)getURLsFromInputWithCompletionHandler:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFRSSFeedExtractAction *)self input];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__WFRSSFeedExtractAction_getURLsFromInputWithCompletionHandler___block_invoke;
  v8[3] = &unk_264E5B8E0;
  id v9 = v4;
  id v7 = v4;
  [v5 generateCollectionByCoercingToItemClasses:v6 completionHandler:v8];
}

void __64__WFRSSFeedExtractAction_getURLsFromInputWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  id v10 = 0;
  id v8 = [v7 collectionByFilteringToItemClass:objc_opt_class() excludedItems:&v10];

  id v9 = v10;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_264E5DBA0;
  v3[4] = self;
  [(WFRSSFeedExtractAction *)self getURLsFromInputWithCompletionHandler:v3];
}

void __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    [*(id *)(a1 + 32) finishRunningWithError:a4];
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_2;
    v15[3] = &unk_264E5B898;
    v15[4] = *(void *)(a1 + 32);
    uint64_t v9 = objc_opt_class();
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_4;
    v12[3] = &unk_264E58610;
    id v10 = v8;
    uint64_t v11 = *(void *)(a1 + 32);
    id v13 = v10;
    uint64_t v14 = v11;
    [v7 enumerateObjectRepresentations:v15 forClass:v9 completionHandler:v12];
  }
}

void __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = WFAppTransportSecuredURL();
  id v7 = objc_msgSend(MEMORY[0x263EFC640], "wf_sharedSession");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_3;
  v11[3] = &unk_264E55E38;
  v11[4] = *(void *)(a1 + 32);
  id v12 = v6;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  id v10 = [v7 dataTaskWithURL:v9 completionHandler:v11];
  [v10 resume];
}

void __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_5;
  v5[3] = &unk_264E5E8C0;
  v2 = *(void **)(a1 + 32);
  v5[4] = *(void *)(a1 + 40);
  v3 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB00]];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_6;
  v4[3] = &unk_264E5E8E8;
  v4[4] = *(void *)(a1 + 40);
  [v2 enumerateFileRepresentations:v5 forType:v3 completionHandler:v4];
}

void __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v6 = a3;
  id v5 = [a2 data];
  [v4 addRSSFeedItemsFromHTML:v5 baseURL:0 encoding:0];

  v6[2](v6, 0);
}

uint64_t __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_3(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = (void *)a1[4];
  uint64_t v8 = a1[5];
  id v11 = a4;
  id v9 = a2;
  id v10 = [a3 textEncodingName];
  [v7 addRSSFeedItemsFromHTML:v9 baseURL:v8 encoding:v10];

  (*(void (**)(void))(a1[6] + 16))();
}

@end
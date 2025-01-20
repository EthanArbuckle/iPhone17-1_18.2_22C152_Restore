@interface WFTumblrPostAction
- (BOOL)inputsMultipleItems;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (TMAPIClient)client;
- (id)contentDestinationWithError:(id *)a3;
- (id)defaultSerializedRepresentationForEnumeration:(id)a3;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)generatedResourceNodes;
- (id)inputContentClasses;
- (id)possibleStatesForEnumeration:(id)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)initializeParameters;
- (void)openFiles:(id)a3;
- (void)openPostWithType:(id)a3 withParameters:(id)a4;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)updateTagsParameterHidden;
@end

@implementation WFTumblrPostAction

- (void).cxx_destruct
{
}

- (id)generatedResourceNodes
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)WFTumblrPostAction;
  v2 = [(WFTumblrPostAction *)&v27 generatedResourceNodes];
  v3 = (void *)[v2 mutableCopy];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "resource", (void)v23);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v13 = v10;

          v7 = v13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  id v14 = objc_alloc(MEMORY[0x263F86D78]);
  v15 = (void *)[v14 initWithParameterKey:@"WFComposeInApp" parameterValues:&unk_26F0767A0 relation:*MEMORY[0x263F873B0]];
  id v16 = objc_alloc(MEMORY[0x263F86E30]);
  v17 = [v7 resource];
  v18 = (void *)[objc_alloc(MEMORY[0x263F86E30]) initWithResource:v15];
  v28 = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
  v20 = (void *)[v16 initWithResource:v17 subnodes:v19];

  [v4 removeObject:v7];
  [v4 addObject:v20];
  id v21 = v4;

  return v21;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to post %2$@ on Tumblr?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to post on Tumblr?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F339D0], "tumblrLocation", a3);
}

- (id)inputContentClasses
{
  v24[4] = *MEMORY[0x263EF8340];
  v23[0] = &unk_26F076740;
  v24[0] = objc_opt_class();
  v23[1] = &unk_26F076758;
  v24[1] = objc_opt_class();
  v23[2] = &unk_26F076770;
  v24[2] = objc_opt_class();
  v23[3] = &unk_26F076788;
  v24[3] = objc_opt_class();
  v3 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
  id v4 = [(WFTumblrPostAction *)self workflow];

  if (v4)
  {
    uint64_t v5 = [(WFTumblrPostAction *)self parameterStateForKey:@"WFPostType"];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v5, "value", (void)v17);
          char v13 = [v11 containsObject:v12];

          if (v13)
          {
            v15 = [v6 objectForKey:v11];
            id v21 = v15;
            id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];

            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v14 = [v6 allValues];
LABEL_12:
  }
  else
  {
    id v14 = [v3 allValues];
  }

  return v14;
}

- (BOOL)inputsMultipleItems
{
  v2 = [(WFTumblrPostAction *)self parameterStateForKey:@"WFPostType"];
  v3 = [v2 value];
  char v4 = [v3 isEqualToString:@"Photos"];

  return v4;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  char v4 = objc_msgSend(a4, "value", a3);
  uint64_t v5 = @"Text";
  if (([v4 isEqualToString:@"Text"] & 1) != 0
    || (uint64_t v5 = @"Quote", ([v4 isEqualToString:@"Quote"] & 1) != 0)
    || (uint64_t v5 = @"Chat", ([v4 isEqualToString:@"Chat"] & 1) != 0)
    || (uint64_t v5 = @"Photos", ([v4 isEqualToString:@"Photos"] & 1) != 0)
    || (uint64_t v5 = @"Link", ([v4 isEqualToString:@"Link"] & 1) != 0)
    || (uint64_t v5 = @"Audio", ([v4 isEqualToString:@"Audio"] & 1) != 0)
    || (uint64_t v5 = @"Video", [v4 isEqualToString:@"Video"]))
  {
    id v6 = WFLocalizedString(v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)possibleStatesForEnumeration:(id)a3
{
  v3 = [(WFTumblrPostAction *)self parameterStateForKey:@"WFComposeInApp"];
  uint64_t v4 = [v3 number];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = [v3 number];
    int v7 = [v6 BOOLValue];

    uint64_t v8 = (void *)[&unk_26F076710 mutableCopy];
    uint64_t v9 = v8;
    if (v7) {
      [v8 removeObjectsInArray:&unk_26F076728];
    }
  }
  else
  {
    uint64_t v9 = (void *)[&unk_26F076710 mutableCopy];
  }
  v10 = objc_msgSend(v9, "if_compactMap:", &__block_literal_global_373);

  return v10;
}

id __51__WFTumblrPostAction_possibleStatesForEnumeration___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

- (id)defaultSerializedRepresentationForEnumeration:(id)a3
{
  id v3 = [a3 possibleStates];
  uint64_t v4 = [v3 firstObject];
  uint64_t v5 = [v4 value];

  if (v5)
  {
    id v6 = [MEMORY[0x263F86F00] serializedRepresentationFromValue:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)WFTumblrPostAction;
  BOOL v7 = [(WFTumblrPostAction *)&v10 setParameterState:a3 forKey:v6];
  if (v7)
  {
    if ([v6 isEqualToString:@"WFPostType"]) {
      [(WFTumblrPostAction *)self updateTagsParameterHidden];
    }
    if ([v6 isEqualToString:@"WFComposeInApp"])
    {
      uint64_t v8 = [(WFTumblrPostAction *)self parameterForKey:@"WFPostType"];
      [v8 reloadPossibleStates];
    }
  }

  return v7;
}

- (void)updateTagsParameterHidden
{
  id v10 = [(WFTumblrPostAction *)self parameterStateForKey:@"WFComposeInApp"];
  id v3 = [v10 number];
  if (v3)
  {
    uint64_t v4 = [v10 number];
    int v5 = [v4 BOOLValue] ^ 1;
  }
  else
  {
    int v5 = 1;
  }

  id v6 = [(WFTumblrPostAction *)self parameterStateForKey:@"WFPostType"];
  BOOL v7 = [(WFTumblrPostAction *)self parameterForKey:@"WFPostTags"];
  uint64_t v8 = v7;
  if (v5)
  {
    [v7 setHidden:0];
  }
  else
  {
    uint64_t v9 = [v6 value];
    objc_msgSend(v8, "setHidden:", objc_msgSend(&unk_26F0766F8, "containsObject:", v9));
  }
}

- (void)openPostWithType:(id)a3 withParameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  [v8 setScheme:@"tumblr"];
  [v8 setHost:@"x-callback-url"];
  uint64_t v9 = [@"/" stringByAppendingString:v7];

  [v8 setPath:v9];
  id v10 = objc_msgSend(NSURL, "dc_queryStringWithQueryDictionary:", v6);

  [v8 setPercentEncodedQuery:v10];
  v11 = (void *)MEMORY[0x263F87080];
  uint64_t v12 = [v8 URL];
  char v13 = [(WFTumblrPostAction *)self app];
  id v14 = [v13 schemes];
  v15 = [v14 firstObject];
  id v16 = [(WFTumblrPostAction *)self userInterface];
  long long v17 = [(WFTumblrPostAction *)self appDescriptor];
  long long v18 = [v17 bundleIdentifier];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __54__WFTumblrPostAction_openPostWithType_withParameters___block_invoke;
  v22[3] = &unk_264E5DF98;
  v22[4] = self;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __54__WFTumblrPostAction_openPostWithType_withParameters___block_invoke_2;
  v21[3] = &unk_264E5EBC8;
  v21[4] = self;
  long long v19 = [v11 requestWithURL:v12 scheme:v15 userInterface:v16 bundleIdentifier:v18 successHandler:v22 failureHandler:v21];

  long long v20 = [MEMORY[0x263F86830] sharedManager];
  [v20 performRequest:v19];
}

uint64_t __54__WFTumblrPostAction_openPostWithType_withParameters___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishRunningWithError:0];
}

uint64_t __54__WFTumblrPostAction_openPostWithType_withParameters___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

- (void)openFiles:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 addFile:*(void *)(*((void *)&v21 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  v11 = [WFShareExtensionAction alloc];
  uint64_t v12 = [(WFTumblrPostAction *)self identifier];
  char v13 = [(WFTumblrPostAction *)self definition];
  id v14 = [(WFTumblrPostAction *)self serializedParameters];
  v15 = [(WFShareExtensionAction *)v11 initWithIdentifier:v12 definition:v13 serializedParameters:v14];

  id v16 = [(WFTumblrPostAction *)self processedParameters];
  [(WFShareExtensionAction *)v15 setProcessedParameters:v16];

  long long v17 = [(WFTumblrPostAction *)self userInterface];
  long long v18 = [(WFTumblrPostAction *)self runningDelegate];
  long long v19 = [(WFTumblrPostAction *)self variableSource];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __32__WFTumblrPostAction_openFiles___block_invoke;
  v20[3] = &unk_264E5E840;
  v20[4] = self;
  [(WFShareExtensionAction *)v15 runWithInput:v5 userInterface:v17 runningDelegate:v18 variableSource:v19 workQueue:MEMORY[0x263EF83A0] completionHandler:v20];
}

void __32__WFTumblrPostAction_openFiles___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    [*(id *)(a1 + 32) setOutput:a2];
  }
  [*(id *)(a1 + 32) finishRunningWithError:v5];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v73[2] = *MEMORY[0x263EF8340];
  id v29 = a3;
  id v4 = [(WFTumblrPostAction *)self parameterValueForKey:@"WFPostType" ofClass:objc_opt_class()];
  id v5 = [v4 lowercaseString];

  if ([(__CFString *)v5 isEqualToString:@"photos"])
  {

    id v5 = @"photo";
  }
  id v6 = [(WFTumblrPostAction *)self parameterValueForKey:@"WFComposeInApp" ofClass:objc_opt_class()];
  int v7 = [v6 BOOLValue];

  uint64_t v8 = [(WFTumblrPostAction *)self parameterValueForKey:@"WFBlogName" ofClass:objc_opt_class()];
  uint64_t v9 = [v8 host];

  if ([v9 length]
    || v7
    && (([(__CFString *)v5 isEqualToString:@"photo"] & 1) != 0
     || ([(__CFString *)v5 isEqualToString:@"audio"] & 1) != 0
     || ([(__CFString *)v5 isEqualToString:@"video"] & 1) != 0))
  {
    v70[0] = @"Post Now";
    v70[1] = @"Save as Draft";
    v71[0] = @"published";
    v71[1] = @"draft";
    v70[2] = @"Add to Queue";
    v70[3] = @"Post Privately";
    v71[2] = @"queue";
    v71[3] = @"private";
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:4];
    v11 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", v5, @"type", v9, @"host", 0);
    uint64_t v12 = [(WFTumblrPostAction *)self parameterValueForKey:@"WFPostState" ofClass:objc_opt_class()];
    char v13 = [v10 objectForKey:v12];
    [v11 setValue:v13 forKey:@"state"];

    id v14 = [(WFTumblrPostAction *)self parameterValueForKey:@"WFPostTags" ofClass:objc_opt_class()];
    [v11 setValue:v14 forKey:@"tags"];

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke;
    aBlock[3] = &unk_264E5B2D8;
    aBlock[4] = self;
    v15 = _Block_copy(aBlock);
    if ([(__CFString *)v5 isEqualToString:@"text"])
    {
      v69[0] = objc_opt_class();
      v69[1] = objc_opt_class();
      id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:2];
      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 3221225472;
      v59[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_2;
      v59[3] = &unk_264E582E8;
      id v60 = v11;
      v61 = self;
      char v65 = v7;
      v62 = v5;
      id v63 = v9;
      id v64 = v15;
      long long v17 = v29;
      [v29 generateCollectionByCoercingToItemClasses:v16 completionHandler:v59];

      long long v18 = v60;
    }
    else if ([(__CFString *)v5 isEqualToString:@"quote"])
    {
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_6;
      v53[3] = &unk_264E58310;
      v53[4] = self;
      id v54 = v11;
      char v58 = v7;
      v55 = v5;
      id v56 = v9;
      id v57 = v15;
      long long v17 = v29;
      [v29 getStringRepresentation:v53];

      long long v18 = v54;
    }
    else if ([(__CFString *)v5 isEqualToString:@"link"])
    {
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_7;
      v47[3] = &unk_264E58338;
      v47[4] = self;
      id v48 = v11;
      char v52 = v7;
      v49 = v5;
      id v50 = v9;
      id v51 = v15;
      long long v17 = v29;
      [v29 getObjectRepresentation:v47 forClass:objc_opt_class()];

      long long v18 = v48;
    }
    else if ([(__CFString *)v5 isEqualToString:@"chat"])
    {
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_8;
      v41[3] = &unk_264E58310;
      v41[4] = self;
      id v42 = v11;
      char v46 = v7;
      v43 = v5;
      id v44 = v9;
      id v45 = v15;
      long long v17 = v29;
      [v29 getStringRepresentation:v41];

      long long v18 = v42;
    }
    else
    {
      long long v17 = v29;
      if (([(__CFString *)v5 isEqualToString:@"photo"] & 1) == 0
        && ([(__CFString *)v5 isEqualToString:@"audio"] & 1) == 0
        && ![(__CFString *)v5 isEqualToString:@"video"])
      {
        goto LABEL_23;
      }
      long long v23 = [(WFTumblrPostAction *)self parameterValueForKey:@"WFPostCaption" ofClass:objc_opt_class()];
      [v11 setValue:v23 forKey:@"caption"];

      if (![(__CFString *)v5 isEqualToString:@"photo"])
      {
        v67[0] = @"audio";
        long long v25 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB80]];
        v67[1] = @"video";
        v68[0] = v25;
        long long v17 = v29;
        uint64_t v26 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DBA8]];
        v68[1] = v26;
        v28 = [NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];

        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_16;
        v30[3] = &unk_264E583B0;
        v30[4] = self;
        char v35 = v7;
        v31 = v5;
        id v32 = v9;
        id v33 = v11;
        id v34 = v15;
        objc_super v27 = [v28 objectForKey:v31];
        [v29 getFileRepresentation:v30 forType:v27];

        goto LABEL_23;
      }
      uint64_t v24 = objc_opt_class();
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_9;
      v36[3] = &unk_264E58388;
      v36[4] = self;
      char v40 = v7;
      id v37 = v9;
      id v38 = v11;
      id v39 = v15;
      [v29 generateCollectionByCoercingToItemClass:v24 completionHandler:v36];

      long long v18 = v37;
    }

LABEL_23:
    goto LABEL_24;
  }
  long long v19 = (void *)MEMORY[0x263F087E8];
  uint64_t v20 = *MEMORY[0x263F870B8];
  v72[0] = *MEMORY[0x263F08338];
  uint64_t v10 = WFLocalizedString(@"No Blog");
  v73[0] = v10;
  v72[1] = *MEMORY[0x263F08320];
  v11 = WFLocalizedString(@"You did not specify which blog to post to.");
  v73[1] = v11;
  long long v21 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];
  long long v22 = [v19 errorWithDomain:v20 code:5 userInfo:v21];
  [(WFTumblrPostAction *)self finishRunningWithError:v22];

  long long v17 = v29;
LABEL_24:
}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v22[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = [v5 objectForKey:@"id"];
    uint64_t v8 = [v7 stringValue];
  }
  else
  {
    uint64_t v8 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v5 objectForKey:@"errors"];
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [v9 count];
  if (v6 && v10)
  {
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = [v6 domain];
    uint64_t v13 = [v6 code];
    uint64_t v21 = *MEMORY[0x263F08338];
    id v14 = [v9 firstObject];
    v22[0] = v14;
    v15 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v16 = [v11 errorWithDomain:v12 code:v13 userInfo:v15];

    id v6 = (id)v16;
  }
  if (v8)
  {
    long long v17 = [*(id *)(a1 + 32) parameterValueForKey:@"WFBlogName" ofClass:objc_opt_class()];
    long long v18 = [v17 URLByAppendingPathComponent:@"post"];
    long long v19 = [v18 URLByAppendingPathComponent:v8];

    if (v19)
    {
      uint64_t v20 = [*(id *)(a1 + 32) output];
      [v20 addObject:v19];
    }
  }
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_3;
  aBlock[3] = &unk_264E582C0;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v22 = v4;
  uint64_t v23 = v5;
  char v27 = *(unsigned char *)(a1 + 72);
  id v24 = v6;
  id v25 = *(id *)(a1 + 56);
  id v26 = *(id *)(a1 + 64);
  int v7 = _Block_copy(aBlock);
  uint64_t v8 = [v3 items];
  uint64_t v9 = [v8 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_4;
    v19[3] = &unk_264E5E098;
    v11 = &v20;
    v19[4] = *(void *)(a1 + 40);
    uint64_t v20 = v7;
    uint64_t v12 = (void *)MEMORY[0x263F852B8];
    uint64_t v13 = *MEMORY[0x263F1DB00];
    id v14 = v7;
    v15 = [v12 typeWithUTType:v13];
    [v3 getFileRepresentation:v19 forType:v15];
  }
  else
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_5;
    v17[3] = &unk_264E5BF50;
    v11 = &v18;
    v17[4] = *(void *)(a1 + 40);
    long long v18 = v7;
    id v16 = v7;
    [v3 getStringRepresentation:v17];
  }
}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([v10 length])
  {
    id v6 = *(void **)(a1 + 40);
    int v7 = [*(id *)(a1 + 32) parameterValueForKey:@"WFPostSource" ofClass:objc_opt_class()];
    [v6 setValue:v7 forKey:@"source"];

    [*(id *)(a1 + 40) setValue:v10 forKey:@"quote"];
    uint64_t v8 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 72))
    {
      [v8 openPostWithType:*(void *)(a1 + 48) withParameters:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v9 = [v8 client];
      [v9 quote:*(void *)(a1 + 56) parameters:*(void *)(a1 + 40) callback:*(void *)(a1 + 64)];
    }
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v5];
  }
}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v17 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v17)
  {
    uint64_t v9 = *(void **)(a1 + 40);
    id v10 = [*(id *)(a1 + 32) parameterValueForKey:@"WFPostTitle" ofClass:objc_opt_class()];
    [v9 setValue:v10 forKey:@"title"];

    v11 = *(void **)(a1 + 40);
    uint64_t v12 = [v17 absoluteString];
    [v11 setValue:v12 forKey:@"url"];

    uint64_t v13 = *(void **)(a1 + 40);
    id v14 = [*(id *)(a1 + 32) parameterValueForKey:@"WFPostDescription" ofClass:objc_opt_class()];
    [v13 setValue:v14 forKey:@"description"];

    v15 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 72))
    {
      [v15 openPostWithType:*(void *)(a1 + 48) withParameters:*(void *)(a1 + 40)];
    }
    else
    {
      id v16 = [v15 client];
      [v16 link:*(void *)(a1 + 56) parameters:*(void *)(a1 + 40) callback:*(void *)(a1 + 64)];
    }
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v8];
  }
}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v11)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) parameterValueForKey:@"WFPostTitle" ofClass:objc_opt_class()];
    [v6 setValue:v7 forKey:@"title"];

    if (*(unsigned char *)(a1 + 72)) {
      id v8 = @"body";
    }
    else {
      id v8 = @"conversation";
    }
    [*(id *)(a1 + 40) setValue:v11 forKey:v8];
    uint64_t v9 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 72))
    {
      [v9 openPostWithType:*(void *)(a1 + 48) withParameters:*(void *)(a1 + 40)];
    }
    else
    {
      id v10 = [v9 client];
      [v10 chat:*(void *)(a1 + 56) parameters:*(void *)(a1 + 40) callback:*(void *)(a1 + 64)];
    }
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v5];
  }
}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_9(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    id v8 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v9 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC08]];
    id v10 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB40]];
    id v11 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DAD0]];
    uint64_t v12 = objc_msgSend(v8, "initWithObjects:", v9, v10, v11, 0);

    uint64_t v13 = [v6 items];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_10;
    v21[3] = &unk_264E5DA58;
    id v22 = v12;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_12;
    v16[3] = &unk_264E58360;
    id v14 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    char v20 = *(unsigned char *)(a1 + 64);
    id v17 = v14;
    id v18 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 56);
    id v15 = v12;
    objc_msgSend(v13, "if_mapAsynchronously:completionHandler:", v21, v16);
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      id v7 = *(void **)(a1 + 32);
      v16[0] = v5;
      id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
      [v7 openFiles:v8];
LABEL_10:

      goto LABEL_11;
    }
    if ([*(id *)(a1 + 40) isEqualToString:@"audio"])
    {
      id v8 = [*(id *)(a1 + 32) client];
      uint64_t v9 = *(void *)(a1 + 48);
      id v10 = [v5 fileURL];
      id v11 = [v10 path];
      uint64_t v12 = [v5 wfType];
      uint64_t v13 = [v12 MIMEType];
      id v14 = [v5 filename];
      [v8 audio:v9 filePath:v11 contentType:v13 fileName:v14 parameters:*(void *)(a1 + 56) callback:*(void *)(a1 + 64)];
LABEL_9:

      goto LABEL_10;
    }
    if ([*(id *)(a1 + 40) isEqualToString:@"video"])
    {
      id v8 = [*(id *)(a1 + 32) client];
      uint64_t v15 = *(void *)(a1 + 48);
      id v10 = [v5 fileURL];
      id v11 = [v10 path];
      uint64_t v12 = [v5 wfType];
      uint64_t v13 = [v12 MIMEType];
      id v14 = [v5 filename];
      [v8 video:v15 filePath:v11 contentType:v13 fileName:v14 parameters:*(void *)(a1 + 56) callback:*(void *)(a1 + 64)];
      goto LABEL_9;
    }
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v6];
  }
LABEL_11:
}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_10(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [v6 preferredFileType];
  if (([*(id *)(a1 + 32) containsObject:v8] & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB40]];

    id v8 = (void *)v9;
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_11;
  v11[3] = &unk_264E5DBC8;
  id v12 = v7;
  id v10 = v7;
  [v6 getFileRepresentation:v11 forType:v8];
}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if ([v12 count])
  {
    id v6 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 64))
    {
      [v6 openFiles:v12];
    }
    else
    {
      id v7 = [v6 client];
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = objc_msgSend(v12, "if_map:", &__block_literal_global_17508);
      id v10 = objc_msgSend(v12, "if_map:", &__block_literal_global_323);
      id v11 = objc_msgSend(v12, "if_map:", &__block_literal_global_325);
      [v7 photo:v8 filePathArray:v9 contentTypeArray:v10 fileNameArray:v11 parameters:*(void *)(a1 + 48) callback:*(void *)(a1 + 56)];
    }
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v5];
  }
}

uint64_t __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_15(uint64_t a1, void *a2)
{
  return [a2 filename];
}

id __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_14(uint64_t a1, void *a2)
{
  v2 = [a2 wfType];
  id v3 = [v2 MIMEType];

  return v3;
}

id __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_13(uint64_t a1, void *a2)
{
  v2 = [a2 fileURL];
  id v3 = [v2 path];

  return v3;
}

uint64_t __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 parameterValueForKey:@"WFPostTitle" ofClass:objc_opt_class()];
  [v3 setValue:v6 forKey:@"title"];

  [*(id *)(a1 + 32) setValue:v5 forKey:@"body"];
  id v7 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    [v7 openPostWithType:v8 withParameters:v9];
  }
  else
  {
    id v10 = [v7 client];
    [v10 text:*(void *)(a1 + 56) parameters:*(void *)(a1 + 32) callback:*(void *)(a1 + 64)];
  }
}

void __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (v9)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [NSString alloc];
    id v7 = [v9 data];
    uint64_t v8 = (void *)[v6 initWithData:v7 encoding:4];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
}

uint64_t __49__WFTumblrPostAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (TMAPIClient)client
{
  if (!self->_client)
  {
    id v3 = objc_alloc_init(TMAPIClient);
    client = self->_client;
    self->_client = v3;
  }
  uint64_t v5 = +[WFTumblrAccessResource tumblrOAuthToken];
  [(TMAPIClient *)self->_client setOAuthToken:v5];

  id v6 = +[WFTumblrAccessResource tumblrOAuthTokenSecret];
  [(TMAPIClient *)self->_client setOAuthTokenSecret:v6];

  [(TMAPIClient *)self->_client setOAuthConsumerKey:@"cwKKz80VhsmeSt3n8ORZFqZSqYejgTm7DKGRxM5ecescOhZjRw"];
  [(TMAPIClient *)self->_client setOAuthConsumerSecret:@"TvXKq6PUXP2GldJBTKM99C4ly30vrKerTF3Cr5LNqy3J3gZBPf"];
  id v7 = self->_client;
  return v7;
}

- (void)initializeParameters
{
  v4.receiver = self;
  v4.super_class = (Class)WFTumblrPostAction;
  [(WFTumblrPostAction *)&v4 initializeParameters];
  id v3 = [(WFTumblrPostAction *)self parameterForKey:@"WFPostType"];
  [v3 setDataSource:self];
  [(WFTumblrPostAction *)self updateTagsParameterHidden];
}

@end
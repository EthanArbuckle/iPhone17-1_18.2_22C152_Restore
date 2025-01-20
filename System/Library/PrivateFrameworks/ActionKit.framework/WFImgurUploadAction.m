@interface WFImgurUploadAction
- (BOOL)isProgressIndeterminate;
- (WFImgurUploadAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5;
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)uploadInput:(id)a3 withAccount:(id)a4;
@end

@implementation WFImgurUploadAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to upload %2$@ to Imgur?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to upload image(s) to Imgur?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F339D0], "imgurLocation", a3);
}

- (void)uploadInput:(id)a3 withAccount:(id)a4
{
  id v6 = a4;
  id v27 = a3;
  v7 = [(WFImgurUploadAction *)self parameterValueForKey:@"WFImgurDirectLink" ofClass:objc_opt_class()];
  char v26 = [v7 BOOLValue];

  id v8 = [(WFImgurUploadAction *)self parameterValueForKey:@"WFImgurAlbum" ofClass:objc_opt_class()];
  char v9 = [v8 BOOLValue];

  v10 = [(WFImgurUploadAction *)self parameterValueForKey:@"WFImgurTitle" ofClass:objc_opt_class()];
  v11 = [(WFImgurUploadAction *)self parameterValueForKey:@"WFImgurDescription" ofClass:objc_opt_class()];
  uint64_t v12 = [(WFImgurUploadAction *)self parameterValueForKey:@"WFImgurAlbumLayout" ofClass:objc_opt_class()];
  v13 = [v12 lowercaseString];

  v14 = [(WFImgurUploadAction *)self parameterValueForKey:@"WFImgurAlbumPrivacy" ofClass:objc_opt_class()];
  v15 = [v14 lowercaseString];

  v16 = [WFImgurSessionManager alloc];
  v17 = +[WFImgurAccount clientID];
  v18 = [(WFImgurSessionManager *)v16 initWithClientID:v17];

  v19 = [v6 credential];

  [(WFImgurSessionManager *)v18 setCredential:v19];
  uint64_t v20 = objc_opt_class();
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke;
  v28[3] = &unk_264E56CE0;
  v28[4] = self;
  v29 = v18;
  char v34 = v9;
  id v30 = v10;
  id v31 = v11;
  char v35 = v26;
  id v32 = v13;
  id v33 = v15;
  id v21 = v15;
  id v22 = v13;
  id v23 = v11;
  id v24 = v10;
  v25 = v18;
  [v27 generateCollectionByCoercingToItemClass:v20 completionHandler:v28];
}

void __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_2;
  v5[3] = &unk_264E56CB8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  char v11 = *(unsigned char *)(a1 + 80);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  char v12 = *(unsigned char *)(a1 + 81);
  id v9 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 72);
  [a2 getFileRepresentations:v5 forType:0];
}

void __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    v4 = [*(id *)(a1 + 32) progress];
    [v4 setCompletedUnitCount:0];

    uint64_t v5 = [v3 count];
    id v6 = [*(id *)(a1 + 32) progress];
    [v6 setTotalUnitCount:v5];
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_3;
  v18[3] = &unk_264E56C40;
  id v7 = *(void **)(a1 + 40);
  v18[4] = *(void *)(a1 + 32);
  id v19 = v7;
  char v22 = *(unsigned char *)(a1 + 80);
  id v20 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 56);
  char v23 = *(unsigned char *)(a1 + 81);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_5;
  v10[3] = &unk_264E56C90;
  char v17 = *(unsigned char *)(a1 + 80);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v8;
  uint64_t v16 = v9;
  objc_msgSend(v3, "if_mapAsynchronously:completionHandler:", v18, v10);
}

void __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  uint64_t v9 = [v7 progress];
  [v9 becomeCurrentWithPendingUnitCount:1];

  id v10 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
  }
  id v13 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_4;
  v16[3] = &unk_264E56C18;
  __int16 v18 = *(_WORD *)(a1 + 64);
  v16[4] = *(void *)(a1 + 32);
  id v17 = v6;
  id v14 = v6;
  [v10 uploadImage:v8 title:v11 description:v12 progress:v13 completionHandler:v16];

  id v15 = [*(id *)(a1 + 32) progress];
  [v15 resignCurrent];
}

uint64_t __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 80))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_6;
    v9[3] = &unk_264E56C68;
    uint64_t v6 = *(void *)(a1 + 64);
    v9[4] = *(void *)(a1 + 72);
    return [v3 createAlbumWithIDs:a2 title:v2 description:v4 layout:v5 privacy:v6 completionHandler:v9];
  }
  else
  {
    id v8 = *(void **)(a1 + 72);
    return objc_msgSend(v8, "finishRunningWithError:");
  }
}

void __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a4;
  if (a3)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = a3;
    id v8 = [v6 output];
    [v8 addObject:v7];
  }
  [*(id *)(a1 + 32) finishRunningWithError:v9];
}

void __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v14 && !*(unsigned char *)(a1 + 48))
  {
    id v10 = [*(id *)(a1 + 32) output];
    uint64_t v11 = v10;
    if (*(unsigned char *)(a1 + 49))
    {
      [v10 addObject:v14];
    }
    else
    {
      uint64_t v12 = [v14 URLByDeletingPathExtension];
      id v13 = [v12 absoluteString];
      [v11 addObject:v13];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFImgurUploadAction *)self resourceManager];
  uint64_t v6 = [v5 resourceObjectsOfClass:objc_opt_class()];
  id v7 = [v6 anyObject];

  id v8 = [v7 accounts];
  id v9 = [v8 firstObject];

  id v10 = [(WFImgurUploadAction *)self parameterValueForKey:@"WFImgurAnonymous" ofClass:objc_opt_class()];
  int v11 = [v10 BOOLValue];

  if (v9) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __50__WFImgurUploadAction_runAsynchronouslyWithInput___block_invoke;
    v13[3] = &unk_264E5A808;
    v13[4] = self;
    id v14 = v4;
    id v15 = v9;
    [v15 refreshWithCompletionHandler:v13];
  }
  else
  {
    [(WFImgurUploadAction *)self uploadInput:v4 withAccount:0];
  }
}

void __50__WFImgurUploadAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  v12[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    if (!+[WFAccount numberOfAccounts])
    {
      uint64_t v5 = *MEMORY[0x263F08320];
      v11[0] = *MEMORY[0x263F08338];
      v11[1] = v5;
      v12[0] = @"Upload Failed";
      v12[1] = @"Please sign in to your Imgur account.";
      uint64_t v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
      uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:@"WFOAuth2ErrorDomain" code:-1 userInfo:v6];

      id v4 = (void *)v7;
    }
    [*(id *)(a1 + 32) finishRunningWithError:v4];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    [v8 uploadInput:v9 withAccount:v10];
  }
}

- (WFImgurUploadAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)WFImgurUploadAction;
  uint64_t v5 = [(WFImgurUploadAction *)&v10 initWithIdentifier:a3 definition:a4 serializedParameters:a5];
  if (v5)
  {
    uint64_t v6 = [(WFImgurUploadAction *)v5 unevaluatedResourceObjectsOfClass:objc_opt_class()];
    uint64_t v7 = [v6 anyObject];

    [v7 setAction:v5];
    id v8 = v5;
  }
  return v5;
}

- (BOOL)isProgressIndeterminate
{
  return 0;
}

@end
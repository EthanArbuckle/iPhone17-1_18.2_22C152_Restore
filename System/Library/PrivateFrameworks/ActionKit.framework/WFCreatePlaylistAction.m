@interface WFCreatePlaylistAction
- (id)localizedSmartPromptUsageSentenceWithcontentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFCreatePlaylistAction

- (id)localizedSmartPromptUsageSentenceWithcontentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  v6 = NSString;
  id v7 = a5;
  id v8 = a3;
  v9 = WFLocalizedString(@"Allow “%1$@” to use %2$@ in a new Music playlist?");
  v10 = objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);

  return v10;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v36[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFCreatePlaylistAction *)self parameterValueForKey:@"WFPlaylistName" ofClass:objc_opt_class()];
  v6 = [(WFCreatePlaylistAction *)self parameterValueForKey:@"WFPlaylistAuthor" ofClass:objc_opt_class()];
  id v7 = [(WFCreatePlaylistAction *)self parameterValueForKey:@"WFPlaylistDescription" ofClass:objc_opt_class()];
  if ([v5 length])
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    id v8 = (void *)getMPMediaPlaylistCreationMetadataClass_softClass;
    uint64_t v34 = getMPMediaPlaylistCreationMetadataClass_softClass;
    if (!getMPMediaPlaylistCreationMetadataClass_softClass)
    {
      uint64_t v26 = MEMORY[0x263EF8330];
      uint64_t v27 = 3221225472;
      v28 = __getMPMediaPlaylistCreationMetadataClass_block_invoke;
      v29 = &unk_264E5EC88;
      v30 = &v31;
      __getMPMediaPlaylistCreationMetadataClass_block_invoke((uint64_t)&v26);
      id v8 = (void *)v32[3];
    }
    v9 = v8;
    _Block_object_dispose(&v31, 8);
    v10 = (void *)[[v9 alloc] initWithName:v5];
    if ([v6 length])
    {
      [v10 setAuthorDisplayName:v6];
    }
    else
    {
      v14 = [MEMORY[0x263F33718] sharedContext];
      v15 = [v14 applicationBundle];
      v16 = [v15 localizedInfoDictionary];
      v17 = [v16 objectForKey:@"CFBundleDisplayName"];
      [v10 setAuthorDisplayName:v17];
    }
    if ([v7 length]) {
      v18 = v7;
    }
    else {
      v18 = 0;
    }
    [v10 setDescriptionText:v18];
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    v19 = (void *)getMPMediaLibraryClass_softClass_40884;
    uint64_t v34 = getMPMediaLibraryClass_softClass_40884;
    if (!getMPMediaLibraryClass_softClass_40884)
    {
      uint64_t v26 = MEMORY[0x263EF8330];
      uint64_t v27 = 3221225472;
      v28 = __getMPMediaLibraryClass_block_invoke_40885;
      v29 = &unk_264E5EC88;
      v30 = &v31;
      __getMPMediaLibraryClass_block_invoke_40885((uint64_t)&v26);
      v19 = (void *)v32[3];
    }
    id v20 = v19;
    _Block_object_dispose(&v31, 8);
    v21 = [v20 defaultMediaLibrary];
    v22 = [MEMORY[0x263F08C38] UUID];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __53__WFCreatePlaylistAction_runAsynchronouslyWithInput___block_invoke;
    v23[3] = &unk_264E5B580;
    id v24 = v4;
    v25 = self;
    [v21 getPlaylistWithUUID:v22 creationMetadata:v10 completionHandler:v23];
  }
  else
  {
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v35 = *MEMORY[0x263F08320];
    v12 = WFLocalizedString(@"No name was provided. Please provide a name for the playlist.");
    v36[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
    v10 = [v11 errorWithDomain:*MEMORY[0x263F870B8] code:5 userInfo:v13];

    [(WFCreatePlaylistAction *)self finishRunningWithError:v10];
  }
}

void __53__WFCreatePlaylistAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __53__WFCreatePlaylistAction_runAsynchronouslyWithInput___block_invoke_2;
    v4[3] = &unk_264E5E840;
    v2 = *(void **)(a1 + 32);
    v4[4] = *(void *)(a1 + 40);
    WFAddContentToPlaylist(a2, v2, v4);
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v3, "finishRunningWithError:");
  }
}

void __53__WFCreatePlaylistAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

@end
@interface WFAddMusicToUpNextAction
- (id)disabledOnPlatforms;
- (unint64_t)queueAdditionMode;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFAddMusicToUpNextAction

- (unint64_t)queueAdditionMode
{
  v2 = [(WFAddMusicToUpNextAction *)self parameterValueForKey:@"WFWhenToPlay" ofClass:objc_opt_class()];
  if ([v2 isEqualToString:@"Next"]) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = [v2 isEqualToString:@"Later"];
  }

  return v3;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClasses:v5 completionHandler:v6];
}

void __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  v7 = *(void **)(a1 + 32);
  if (a4)
  {
    [v7 finishRunningWithError:a4];
  }
  else
  {
    uint64_t v8 = [v7 queueAdditionMode];
    v9 = [v6 items];
    v10 = v9;
    if (!v8)
    {
      v11 = [v9 reverseObjectEnumerator];
      uint64_t v12 = [v11 allObjects];

      v10 = (void *)v12;
    }
    v13 = objc_alloc_init(WFMediaPlaybackController);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke_2;
    v17[3] = &unk_264E5A948;
    uint64_t v14 = *(void *)(a1 + 32);
    v18 = v13;
    uint64_t v19 = v14;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke_6;
    v16[3] = &unk_264E5E8E8;
    v16[4] = v14;
    v15 = v13;
    objc_msgSend(v10, "if_enumerateAsynchronouslyInSequence:completionHandler:", v17, v16);
  }
}

void __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke_3;
    v22[3] = &unk_264E589F8;
    id v24 = v7;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v23[0] = v8;
    v23[1] = v9;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v10 = (void *)getMPMediaItemClass_softClass_19828;
    uint64_t v29 = getMPMediaItemClass_softClass_19828;
    if (!getMPMediaItemClass_softClass_19828)
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __getMPMediaItemClass_block_invoke_19829;
      v25[3] = &unk_264E5EC88;
      v25[4] = &v26;
      __getMPMediaItemClass_block_invoke_19829((uint64_t)v25);
      v10 = (void *)v27[3];
    }
    v11 = &v24;
    uint64_t v12 = (id *)v23;
    id v13 = v10;
    _Block_object_dispose(&v26, 8);
    uint64_t v14 = v22;
    v15 = v6;
    uint64_t v16 = (uint64_t)v13;
  }
  else
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke_4;
    v19[3] = &unk_264E589F8;
    v11 = &v21;
    id v21 = v7;
    uint64_t v12 = (id *)v20;
    id v17 = *(id *)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 40);
    v20[0] = v17;
    v20[1] = v18;
    uint64_t v16 = objc_opt_class();
    uint64_t v14 = v19;
    v15 = v6;
  }
  [v15 getObjectRepresentations:v14 forClass:v16];
}

uint64_t __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count]) {
    objc_msgSend(*(id *)(a1 + 32), "queueMediaItems:inAdditionMode:completion:", v3, objc_msgSend(*(id *)(a1 + 40), "queueAdditionMode"), *(void *)(a1 + 48));
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 count])
  {
    id v3 = objc_msgSend(v4, "if_map:", &__block_literal_global_19831);
    objc_msgSend(*(id *)(a1 + 32), "queueiTunesStoreItems:inAdditionMode:completion:", v3, objc_msgSend(*(id *)(a1 + 40), "queueAdditionMode"), *(void *)(a1 + 48));
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

id __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  id v3 = [a2 identifier];
  id v4 = objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));

  return v4;
}

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFAddMusicToUpNextAction;
  v2 = [(WFAddMusicToUpNextAction *)&v5 disabledOnPlatforms];
  id v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

@end
@interface INAddTasksIntent(ACSCardRequesting)
- (uint64_t)servicePriorityForCardRequest:()ACSCardRequesting;
- (void)requestCard:()ACSCardRequesting reply:;
@end

@implementation INAddTasksIntent(ACSCardRequesting)

- (void)requestCard:()ACSCardRequesting reply:
{
  v37[1] = *MEMORY[0x263EF8340];
  v5 = a4;
  if (v5)
  {
    v6 = [a3 content];
    if (objc_opt_respondsToSelector())
    {
      v7 = [v6 underlyingInteraction];
    }
    else
    {
      v7 = 0;
    }
    v8 = [v7 intentResponse];

    if (v8)
    {
      uint64_t v9 = [v7 intentResponse];
      v31 = (void *)v9;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v10 = (void *)v9;
      }
      else {
        v10 = 0;
      }
      id v11 = v10;
      v30 = [v11 modifiedTaskList];
      v12 = objc_msgSend(MEMORY[0x263F677D0], "acs_uniquelyIdentifiedCard");
      id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
      v14 = objc_msgSend(MEMORY[0x263F679F8], "acs_uniquelyIdentifiedCardSection");
      v15 = [v30 title];
      v16 = [v15 spokenPhrase];
      [v14 setTitle:v16];

      [v14 setIsCentered:1];
      [v14 setSeparatorStyle:5];
      [v14 setTitleAlign:1];
      [v14 setTitleWeight:&unk_26D3AB790];
      v17 = NSString;
      v18 = NSStringFromSelector(sel_modifiedTaskList);
      NSStringFromSelector(sel_title);
      v19 = v32 = v6;
      v20 = [v17 stringWithFormat:@"%@.%@", v18, v19];

      v21 = [MEMORY[0x263F0FCE0] parameterForClass:objc_opt_class() keyPath:v20];
      v35 = v21;
      v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
      objc_msgSend(v14, "acs_setParameters:", v22);

      [v13 addObject:v14];
      v23 = objc_msgSend(MEMORY[0x263F67980], "acs_wildCardSection");
      [v13 addObject:v23];

      v24 = [v11 addedTasks];

      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __57__INAddTasksIntent_ACSCardRequesting__requestCard_reply___block_invoke;
      v33[3] = &unk_2645BC188;
      id v34 = v13;
      id v25 = v13;
      [v24 enumerateObjectsUsingBlock:v33];

      v6 = v32;
      [v12 setCardSections:v25];
      objc_msgSend(v12, "acs_setInteraction:", v7);
      v5[2](v5, v12, 0);

      v26 = v31;
      v27 = v30;
    }
    else
    {
      v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = *MEMORY[0x263F31628];
      uint64_t v36 = *MEMORY[0x263F07F80];
      v26 = [NSString stringWithFormat:@"Content %@ is incompatible with this service", v6];
      v37[0] = v26;
      v27 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
      v12 = [v28 errorWithDomain:v29 code:400 userInfo:v27];
      ((void (**)(id, void *, void *))v5)[2](v5, 0, v12);
    }
  }
}

- (uint64_t)servicePriorityForCardRequest:()ACSCardRequesting
{
  return 2;
}

@end
@interface WFTodoistAddAction
+ (int64_t)reminderServiceWithReminderType:(id)a3;
- (id)contentDestinationWithError:(id *)a3;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFTodoistAddAction

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F339D0], "todoistLocation", a3);
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v26 = [(WFTodoistAddAction *)self parameterValueForKey:@"WFTodoistContent" ofClass:objc_opt_class()];
  v5 = [(WFTodoistAddAction *)self parameterValueForKey:@"WFTodoistProject" ofClass:objc_opt_class()];
  v6 = [(WFTodoistAddAction *)self parameterValueForKey:@"WFTodoistDueDate" ofClass:objc_opt_class()];
  v7 = [(WFTodoistAddAction *)self parameterValueForKey:@"WFTodoistReminder" ofClass:objc_opt_class()];
  v8 = objc_opt_class();
  v9 = [(WFTodoistAddAction *)self parameterValueForKey:@"WFTodoistReminderType" ofClass:objc_opt_class()];
  uint64_t v25 = [v8 reminderServiceWithReminderType:v9];

  v10 = [(WFTodoistAddAction *)self parameterValueForKey:@"WFTodoistPriority" ofClass:objc_opt_class()];
  uint64_t v11 = 5 - [v10 integerValue];

  v12 = [(WFTodoistAddAction *)self parameterValueForKey:@"WFTodoistNotes" ofClass:objc_opt_class()];
  v24 = [(WFTodoistAddAction *)self parameterForKey:@"WFTodoistProject"];
  v13 = [v24 projectNamed:v5];
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__15718;
  v49[4] = __Block_byref_object_dispose__15719;
  id v50 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v48[3] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke;
  aBlock[3] = &unk_264E5EE70;
  aBlock[4] = self;
  v14 = _Block_copy(aBlock);
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_2;
  v42[3] = &unk_264E57DB8;
  v45 = v49;
  v46 = v48;
  id v23 = v4;
  id v43 = v23;
  id v44 = v14;
  v15 = _Block_copy(v42);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_7;
  v30[3] = &unk_264E57E08;
  v38 = v49;
  id v16 = v13;
  id v31 = v16;
  id v17 = v26;
  id v32 = v17;
  id v18 = v6;
  id v33 = v18;
  id v19 = v7;
  id v34 = v19;
  uint64_t v40 = v25;
  uint64_t v41 = v11;
  id v20 = v12;
  id v35 = v20;
  v36 = self;
  v39 = v48;
  id v37 = v15;
  v21 = _Block_copy(v30);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_9;
  v27[3] = &unk_264E57E58;
  id v28 = v21;
  v29 = v49;
  v27[4] = self;
  v22 = (void (**)(void))_Block_copy(v27);
  v22[2]();

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v49, 8);
}

uint64_t __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishRunningWithError:0];
}

void __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_3;
  v4[3] = &unk_264E57D90;
  uint64_t v6 = *(void *)(a1 + 56);
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 getFileRepresentations:v4 forType:0];
}

void __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_7(void *a1)
{
  v1 = *(void **)(*(void *)(a1[11] + 8) + 40);
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[13];
  uint64_t v7 = a1[14];
  uint64_t v9 = a1[8];
  uint64_t v8 = a1[9];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_8;
  v11[3] = &unk_264E57DE0;
  v10 = (void *)a1[10];
  uint64_t v13 = a1[12];
  v11[4] = v8;
  id v12 = v10;
  [v1 createItemInProject:v2 content:v3 dueDateString:v4 reminderDateString:v5 reminderService:v6 priority:v7 note:v9 completionHandler:v11];
}

void __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_9(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) resourceManager];
  uint64_t v3 = [v2 resourceObjectsOfClass:objc_opt_class()];
  uint64_t v4 = [v3 anyObject];

  uint64_t v5 = [v4 accounts];
  uint64_t v6 = [v5 firstObject];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_10;
  v12[3] = &unk_264E57E30;
  id v13 = v8;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v11;
  long long v14 = v11;
  id v10 = v8;
  [v10 refreshWithCompletionHandler:v12];
}

uint64_t __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_10(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(WFTodoistSessionManager);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) credential];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setCredential:v5];

  uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v6();
}

void __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  id v10 = v5;
  if (a2)
  {
    uint64_t v6 = [*(id *)(a1 + 32) output];
    uint64_t v7 = NSURL;
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"https://todoist.com/showTask?id=%ld", a2);
    id v9 = [v7 URLWithString:v8];
    [v6 addObject:v9];

    id v5 = v10;
  }
  if (v5) {
    [*(id *)(a1 + 32) finishRunningWithError:v5];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_4;
  v5[3] = &unk_264E57D68;
  long long v6 = *(_OWORD *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_6;
  v3[3] = &unk_264E5CE88;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "if_mapAsynchronously:completionHandler:", v5, v3);
}

void __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v9 = *(void *)(*(void *)(v7 + 8) + 24);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_5;
  v11[3] = &unk_264E57D40;
  id v12 = v6;
  id v10 = v6;
  [v8 createFileOnItemWithId:v9 withFile:a2 completionHandler:v11];
}

uint64_t __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithInteger:a2];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
}

- (void)initializeParameters
{
  v7.receiver = self;
  v7.super_class = (Class)WFTodoistAddAction;
  [(WFTodoistAddAction *)&v7 initializeParameters];
  uint64_t v3 = [(WFTodoistAddAction *)self resourceManager];
  uint64_t v4 = [v3 resourceObjectsOfClass:objc_opt_class()];
  id v5 = [v4 anyObject];

  id v6 = [(WFTodoistAddAction *)self parameterForKey:@"WFTodoistProject"];
  [v6 setAccessResource:v5];
}

+ (int64_t)reminderServiceWithReminderType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Text Message"]) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = [v3 isEqualToString:@"Push Notification"];
  }

  return v4;
}

@end
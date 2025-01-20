@interface AXSwitchControlSwitchIntentHandler
- (void)handleSetSwitchControlSwitch:(id)a3 completion:(id)a4;
- (void)provideSwitchesOptionsCollectionForSetSwitchControlSwitch:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForSetSwitchControlSwitch:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForSetSwitchControlSwitch:(id)a3 withCompletion:(id)a4;
- (void)resolveSwitchesForSetSwitchControlSwitch:(id)a3 withCompletion:(id)a4;
@end

@implementation AXSwitchControlSwitchIntentHandler

- (void)provideSwitchesOptionsCollectionForSetSwitchControlSwitch:(id)a3 withCompletion:(id)a4
{
  v22 = (void (**)(id, id, void))a4;
  v4 = objc_opt_new();
  v5 = +[AXSettings sharedInstance];
  v6 = [v5 assistiveTouchSwitches];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000071D0;
  v32[3] = &unk_100014440;
  id v7 = v4;
  id v33 = v7;
  [v6 enumerateObjectsUsingBlock:v32];

  v23 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v12);
        v14 = objc_opt_new();
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        v15 = [v8 objectForKeyedSubscript:v13];
        id v16 = [v15 countByEnumeratingWithState:&v24 objects:v34 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v25;
          do
          {
            v19 = 0;
            do
            {
              if (*(void *)v25 != v18) {
                objc_enumerationMutation(v15);
              }
              objc_msgSend(v14, "addObject:", *(void *)(*((void *)&v24 + 1) + 8 * (void)v19), v22);
              v19 = (char *)v19 + 1;
            }
            while (v17 != v19);
            id v17 = [v15 countByEnumeratingWithState:&v24 objects:v34 count:16];
          }
          while (v17);
        }

        id v20 = [objc_alloc((Class)INObjectSection) initWithTitle:v13 items:v14];
        [v23 addObject:v20];

        v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      id v10 = [v8 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v10);
  }

  id v21 = [objc_alloc((Class)INObjectCollection) initWithSections:v23];
  v22[2](v22, v21, 0);
}

- (void)handleSetSwitchControlSwitch:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, AXSetSwitchControlSwitchIntentResponse *))a4;
  id v7 = +[AXSettings sharedInstance];
  id v8 = [v7 assistiveTouchSwitches];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100007548;
  v23[3] = &unk_100014490;
  id v9 = v5;
  id v24 = v9;
  id v10 = [v8 objectsPassingTest:v23];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v15);
        if (objc_msgSend(v9, "operation", (void)v19) == (id)2)
        {
          uint64_t v17 = [v16 isEnabled] ^ 1;
LABEL_8:
          [v16 setIsEnabled:v17];
          goto LABEL_14;
        }
        if ([v9 operation] == (id)1)
        {
          if ([v9 state] == (id)1)
          {
            uint64_t v17 = 1;
            goto LABEL_8;
          }
          if ([v9 state] == (id)2)
          {
            uint64_t v17 = 0;
            goto LABEL_8;
          }
        }
LABEL_14:
        SCATAddOrUpdateSwitchToSettings();
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v13);
  }

  uint64_t v18 = [[AXSetSwitchControlSwitchIntentResponse alloc] initWithCode:4 userActivity:0];
  v6[2](v6, v18);
}

- (void)resolveOperationForSetSwitchControlSwitch:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForSetSwitchControlSwitch:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveSwitchesForSetSwitchControlSwitch:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = objc_msgSend(v5, "switches", 0);
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = +[AXSwitchControlSwitchResolutionResult successWithResolvedSwitchControlSwitch:*(void *)(*((void *)&v14 + 1) + 8 * (void)v12)];
        [v7 addObject:v13];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  v6[2](v6, v7);
}

@end
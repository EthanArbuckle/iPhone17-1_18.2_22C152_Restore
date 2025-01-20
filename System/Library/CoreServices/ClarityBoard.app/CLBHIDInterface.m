@interface CLBHIDInterface
+ (id)sharedInstance;
- (BSInvalidatable)eventDispatchingAssertion;
- (CLBHIDInterface)init;
- (NSMutableDictionary)sceneIdentifierToDeferringAssertion;
- (void)dealloc;
- (void)setEventDispatchingAssertion:(id)a3;
- (void)setSceneIdentifierToDeferringAssertion:(id)a3;
- (void)updateDeferringRulesForScene:(id)a3;
@end

@implementation CLBHIDInterface

+ (id)sharedInstance
{
  if (qword_1001810C0 != -1) {
    dispatch_once(&qword_1001810C0, &stru_10015CB98);
  }
  v2 = (void *)qword_1001810B8;

  return v2;
}

- (CLBHIDInterface)init
{
  v37.receiver = self;
  v37.super_class = (Class)CLBHIDInterface;
  v2 = [(CLBHIDInterface *)&v37 init];
  if (v2)
  {
    v3 = +[BKSHIDEventDispatchingTarget systemTarget];
    v4 = +[BKSMutableHIDEventDiscreteDispatchingPredicate defaultSystemPredicate];
    v5 = [v4 descriptors];
    id v6 = [v5 mutableCopy];

    v7 = +[BKSHIDEventDescriptor descriptorWithEventType:10];
    [v6 addObject:v7];

    [v4 setDescriptors:v6];
    uint64_t v8 = +[BKSHIDEventDispatchingTarget keyboardFocusTarget];
    v9 = +[BKSMutableHIDEventDiscreteDispatchingPredicate defaultFocusPredicate];
    v36 = +[FBDisplayManager mainConfiguration];
    uint64_t v10 = [v36 hardwareIdentifier];
    v35 = (void *)v10;
    if (v10)
    {
      uint64_t v11 = v10;
      id v33 = v6;
      v34 = v3;
      id v12 = objc_alloc_init((Class)BKSMutableHIDEventSenderDescriptor);
      v13 = +[BKSHIDEventDisplay displayWithHardwareIdentifier:v11];
      [v12 setAssociatedDisplay:v13];

      v14 = +[NSSet setWithObject:v12];
      [v4 setSenderDescriptors:v14];
      [v9 setSenderDescriptors:v14];
      v15 = +[UIDevice currentDevice];
      id v16 = [v15 userInterfaceIdiom];

      if (v16 == (id)2)
      {
        v17 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:128];
        v31 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:1 usage:134];
        v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v31, 0);
        v19 = [v4 descriptors];
        uint64_t v32 = v8;
        id v20 = [v19 mutableCopy];

        [v20 minusSet:v18];
        [v4 setDescriptors:v20];
        v21 = [v9 descriptors];
        id v22 = [v21 mutableCopy];

        [v22 unionSet:v18];
        [v9 setDescriptors:v22];

        uint64_t v8 = v32;
      }

      id v6 = v33;
      v3 = v34;
    }
    else
    {
      [v4 setSenderDescriptors:0];
      [v9 setSenderDescriptors:0];
    }
    v23 = +[BKSHIDEventDiscreteDispatchingRule ruleForDispatchingDiscreteEventsMatchingPredicate:v4 toTarget:v3];
    v24 = +[BKSHIDEventDiscreteDispatchingRule ruleForDispatchingDiscreteEventsMatchingPredicate:v9 toTarget:v8];
    v25 = +[BKSHIDEventDeliveryManager sharedInstance];
    v38[0] = v23;
    v38[1] = v24;
    +[NSArray arrayWithObjects:v38 count:2];
    v27 = v26 = (void *)v8;
    uint64_t v28 = [v25 dispatchDiscreteEventsForReason:@"WhiteBoard!" withRules:v27];
    eventDispatchingAssertion = v2->_eventDispatchingAssertion;
    v2->_eventDispatchingAssertion = (BSInvalidatable *)v28;
  }
  return v2;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_eventDispatchingAssertion invalidate];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(NSMutableDictionary *)self->_sceneIdentifierToDeferringAssertion allValues];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) invalidate];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_sceneIdentifierToDeferringAssertion removeAllObjects];
  v8.receiver = self;
  v8.super_class = (Class)CLBHIDInterface;
  [(CLBHIDInterface *)&v8 dealloc];
}

- (void)updateDeferringRulesForScene:(id)a3
{
  id v4 = a3;
  id v5 = +[BKSHIDEventDeliveryManager sharedInstance];
  uint64_t v6 = [v5 transactionAssertionWithReason:@"updateDeferringRulesForScene:"];
  v7 = [v4 identifier];
  objc_super v8 = [(NSMutableDictionary *)self->_sceneIdentifierToDeferringAssertion objectForKeyedSubscript:v7];
  long long v9 = v8;
  if (v8) {
    [v8 invalidate];
  }
  long long v10 = [v4 clientHandle];
  long long v11 = [v10 processHandle];

  if (v11) {
    uint64_t v12 = (uint64_t)[v11 pid];
  }
  else {
    uint64_t v12 = 0xFFFFFFFFLL;
  }
  if ([v4 isValid]
    && ([v4 settings],
        v13 = objc_claimAutoreleasedReturnValue(),
        unsigned int v14 = [v13 isForeground],
        v13,
        v14)
    && v12 != -1)
  {
    v34 = v5;
    id v32 = objc_alloc_init((Class)BKSMutableHIDEventDeferringTarget);
    [v32 setPid:v12];
    id v33 = [v4 layerManager];
    if (v33)
    {
      v31 = v6;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v15 = [v33 layers];
      id v16 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v36;
        while (2)
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v36 != v18) {
              objc_enumerationMutation(v15);
            }
            id v20 = [*(id *)(*((void *)&v35 + 1) + 8 * i) contextID];
            if (v20)
            {
              v21 = +[BKSHIDEventDeferringToken tokenForIdentifierOfCAContext:v20];
              [v32 setToken:v21];

              goto LABEL_21;
            }
          }
          id v17 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
LABEL_21:

      uint64_t v6 = v31;
    }
    id v22 = objc_alloc_init((Class)BKSMutableHIDEventDeferringPredicate);
    v23 = [v4 settings];
    v24 = [v23 displayConfiguration];
    v25 = [v24 hardwareIdentifier];

    if ([v25 length])
    {
      v26 = +[BKSHIDEventDisplay displayWithHardwareIdentifier:v25];
      [v22 setDisplay:v26];
    }
    v27 = [v34 deferEventsMatchingPredicate:v22 toTarget:v32 withReason:@"scene!"];
    sceneIdentifierToDeferringAssertion = self->_sceneIdentifierToDeferringAssertion;
    if (!sceneIdentifierToDeferringAssertion)
    {
      v29 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v30 = self->_sceneIdentifierToDeferringAssertion;
      self->_sceneIdentifierToDeferringAssertion = v29;

      sceneIdentifierToDeferringAssertion = self->_sceneIdentifierToDeferringAssertion;
    }
    [(NSMutableDictionary *)sceneIdentifierToDeferringAssertion setObject:v27 forKeyedSubscript:v7];

    id v5 = v34;
  }
  else
  {
    [(NSMutableDictionary *)self->_sceneIdentifierToDeferringAssertion removeObjectForKey:v7];
  }
  [v6 invalidate];
}

- (BSInvalidatable)eventDispatchingAssertion
{
  return self->_eventDispatchingAssertion;
}

- (void)setEventDispatchingAssertion:(id)a3
{
}

- (NSMutableDictionary)sceneIdentifierToDeferringAssertion
{
  return self->_sceneIdentifierToDeferringAssertion;
}

- (void)setSceneIdentifierToDeferringAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifierToDeferringAssertion, 0);

  objc_storeStrong((id *)&self->_eventDispatchingAssertion, 0);
}

@end
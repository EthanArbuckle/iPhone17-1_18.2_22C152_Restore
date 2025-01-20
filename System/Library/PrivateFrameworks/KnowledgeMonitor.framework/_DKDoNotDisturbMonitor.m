@interface _DKDoNotDisturbMonitor
+ (id)_eventWithState:(BOOL)a3;
+ (id)eventStream;
- (DNDStateService)dndStateService;
- (void)setDndStateService:(id)a3;
- (void)start;
- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4;
- (void)stop;
@end

@implementation _DKDoNotDisturbMonitor

+ (id)eventStream
{
  return @"DoNotDisturb";
}

+ (id)_eventWithState:(BOOL)a3
{
  if (a3) {
    [MEMORY[0x263F35050] yes];
  }
  else {
  v3 = [MEMORY[0x263F35050] no];
  }
  v4 = (void *)MEMORY[0x263F35088];
  v5 = [MEMORY[0x263F35148] doNotDisturbStream];
  v6 = [MEMORY[0x263EFF910] date];
  v7 = [MEMORY[0x263EFF910] distantFuture];
  v8 = [v4 eventWithStream:v5 startDate:v6 endDate:v7 value:v3];

  return v8;
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a4;
  v5 = [MEMORY[0x263EFF980] array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v42 = v4;
  v6 = [v4 state];
  v7 = [v6 activeModeAssertionMetadata];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
  unint64_t v9 = 0x263F35000uLL;
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v14 = objc_opt_new();
        v15 = [v13 modeIdentifier];

        if (v15)
        {
          v16 = [v13 modeIdentifier];
          [*(id *)(v9 + 464) modeIdentifier];
          v18 = unint64_t v17 = v9;
          [v14 setObject:v16 forKey:v18];

          unint64_t v9 = v17;
        }
        v19 = [v13 activeDateInterval];

        if (v19)
        {
          v20 = [v13 activeDateInterval];
          v21 = [*(id *)(v9 + 464) activeDateInterval];
          [v14 setObject:v20 forKey:v21];
        }
        [v5 addObject:v14];
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v10);
  }

  v22 = [*(id *)(v9 + 464) doNotDisturbState];
  v47[0] = v22;
  v23 = NSNumber;
  v24 = [v42 state];
  v25 = objc_msgSend(v23, "numberWithBool:", objc_msgSend(v24, "isActive"));
  v48[0] = v25;
  v26 = [*(id *)(v9 + 464) doNotDisturbUpdateReason];
  v47[1] = v26;
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v42, "reason"));
  v28 = unint64_t v27 = v9;
  v48[1] = v28;
  v29 = [*(id *)(v27 + 464) doNotDisturbStateMetadataArray];
  v47[2] = v29;
  v48[2] = v5;
  v30 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:3];

  v31 = [MEMORY[0x263F351B8] userContext];
  v32 = [*(id *)(v27 + 464) keyPathForDoNotDisturbStatusDataDictionary];
  [v31 setObject:v30 forKeyedSubscript:v32];

  v33 = NSNumber;
  v34 = [v42 state];
  v35 = objc_msgSend(v33, "numberWithBool:", objc_msgSend(v34, "isActive"));
  v36 = [MEMORY[0x263F351B8] userContext];
  v37 = [*(id *)(v27 + 464) keyPathForDoNotDisturbStatus];
  [v36 setObject:v35 forKeyedSubscript:v37];

  v38 = objc_opt_class();
  v39 = [v42 state];
  v40 = objc_msgSend(v38, "_eventWithState:", objc_msgSend(v39, "isActive"));
  [(_DKMonitor *)self setCurrentEvent:v40 inferHistoricalState:1];
}

- (void)start
{
  v5.receiver = self;
  v5.super_class = (Class)_DKDoNotDisturbMonitor;
  if ([(_DKMonitor *)&v5 instantMonitorNeedsActivation])
  {
    v3 = [MEMORY[0x263F3A7B0] serviceForClientIdentifier:@"com.apple.duet.knowledge"];
    dndStateService = self->_dndStateService;
    self->_dndStateService = v3;

    [(DNDStateService *)self->_dndStateService addStateUpdateListener:self withCompletionHandler:&__block_literal_global_2];
  }
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKDoNotDisturbMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(DNDStateService *)self->_dndStateService removeStateUpdateListener:self];
  }
}

- (DNDStateService)dndStateService
{
  return self->_dndStateService;
}

- (void)setDndStateService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
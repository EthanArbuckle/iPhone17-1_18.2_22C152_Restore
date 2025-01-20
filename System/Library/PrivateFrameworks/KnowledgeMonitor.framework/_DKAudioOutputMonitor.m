@interface _DKAudioOutputMonitor
+ (id)_BMEventWithState:(id)a3 type:(id)a4 name:(id)a5 identifier:(id)a6 routeChangeReason:(id)a7;
+ (id)_eventWithState:(id)a3 type:(id)a4 name:(id)a5 identifier:(id)a6 routeChangeReason:(id)a7;
+ (id)contextValueForAudioOutputConnectionStatus:(BOOL)a3 type:(id)a4 name:(id)a5 identifier:(id)a6 routeChangeReason:(id)a7;
+ (id)entitlements;
+ (id)eventStream;
- (_DKAudioOutputMonitor)init;
- (void)deactivate;
- (void)dealloc;
- (void)onAudioRouteChangeNotification:(id)a3;
- (void)start;
@end

@implementation _DKAudioOutputMonitor

- (_DKAudioOutputMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)_DKAudioOutputMonitor;
  v2 = [(_DKMonitor *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_DKMonitor *)v2 setEventComparator:&__block_literal_global_14];
  }
  return v3;
}

- (void)dealloc
{
  [(_DKAudioOutputMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKAudioOutputMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)eventStream
{
  return @"DeviceAudioOutputExternal";
}

+ (id)entitlements
{
  return 0;
}

+ (id)_eventWithState:(id)a3 type:(id)a4 name:(id)a5 identifier:(id)a6 routeChangeReason:(id)a7
{
  v30[4] = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = &unk_26D86D9D0;
  if (a7) {
    id v14 = a7;
  }
  id v15 = v14;
  id v16 = a3;
  uint64_t v17 = [MEMORY[0x263F35030] portType];
  v29[0] = v17;
  v30[0] = v11;
  v18 = [MEMORY[0x263F35030] portName];
  v29[1] = v18;
  v30[1] = v12;
  v19 = [MEMORY[0x263F35030] identifier];
  v29[2] = v19;
  v30[2] = v13;
  v20 = [MEMORY[0x263F35030] routeChangeReason];
  v29[3] = v20;
  v30[3] = v15;
  v21 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:4];

  LOBYTE(v17) = [v16 BOOLValue];
  if (v17) {
    [MEMORY[0x263F35038] external];
  }
  else {
  v22 = [MEMORY[0x263F35038] internal];
  }
  v23 = (void *)MEMORY[0x263F35088];
  v24 = [MEMORY[0x263F35148] audioOutputRoutStream];
  v25 = [MEMORY[0x263EFF910] date];
  v26 = [MEMORY[0x263EFF910] distantFuture];
  v27 = [v23 eventWithStream:v24 startDate:v25 endDate:v26 value:v22 metadata:v21];

  return v27;
}

+ (id)_BMEventWithState:(id)a3 type:(id)a4 name:(id)a5 identifier:(id)a6 routeChangeReason:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  if ([v11 intValue])
  {
    if ([v11 intValue] == 1)
    {
      uint64_t v16 = 1;
    }
    else if ([v11 intValue] == 2)
    {
      uint64_t v16 = 2;
    }
    else if ([v11 intValue] == 3)
    {
      uint64_t v16 = 3;
    }
    else if ([v11 intValue] == 4)
    {
      uint64_t v16 = 4;
    }
    else if ([v11 intValue] == 6)
    {
      uint64_t v16 = 5;
    }
    else if ([v11 intValue] == 7)
    {
      uint64_t v16 = 6;
    }
    else if ([v11 intValue] == 8)
    {
      uint64_t v16 = 7;
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F29FE8]) initWithExternal:v15 identifier:v12 portType:v14 portName:v13 routeChangeReason:v16 type:2];

  return v17;
}

- (void)start
{
  objc_super v3 = [MEMORY[0x263EF93E0] sharedInstance];
  outputMonitor = self->_outputMonitor;
  self->_outputMonitor = v3;

  objc_super v5 = BiomeLibrary();
  v6 = [v5 Audio];
  v7 = [v6 Route];
  v8 = [v7 source];
  source = self->_source;
  self->_source = v8;

  v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 addObserver:self selector:sel_onAudioRouteChangeNotification_ name:*MEMORY[0x263EF9248] object:0];

  [(_DKAudioOutputMonitor *)self onAudioRouteChangeNotification:0];
}

- (void)deactivate
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  outputMonitor = self->_outputMonitor;
  self->_outputMonitor = 0;
}

- (void)onAudioRouteChangeNotification:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)os_transaction_create();
  v6 = (void *)MEMORY[0x22A629AA0]();
  v7 = [(AVAudioSession *)self->_outputMonitor currentRoute];
  v8 = v7;
  if (v7)
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    char v41 = 0;
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__6;
    v36 = __Block_byref_object_dispose__6;
    id v37 = 0;
    v9 = [v7 outputs];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __56___DKAudioOutputMonitor_onAudioRouteChangeNotification___block_invoke;
    v31[3] = &unk_264714FB8;
    v31[4] = &v32;
    v31[5] = &v38;
    [v9 enumerateObjectsUsingBlock:v31];

    if (v33[5])
    {
      v10 = [v4 userInfo];
      id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263EF9268]];
      v29 = v6;
      v30 = v5;

      id v12 = [NSNumber numberWithBool:*((unsigned __int8 *)v39 + 24)];
      id v13 = [(id)v33[5] portType];
      id v14 = [(id)v33[5] portName];
      id v15 = [(id)v33[5] UID];
      uint64_t v16 = +[_DKAudioOutputMonitor _eventWithState:v12 type:v13 name:v14 identifier:v15 routeChangeReason:v11];

      [(_DKMonitor *)self setCurrentEvent:v16 inferHistoricalState:1];
      source = self->_source;
      v18 = [NSNumber numberWithBool:*((unsigned __int8 *)v39 + 24)];
      v19 = [(id)v33[5] portType];
      v20 = [(id)v33[5] portName];
      v21 = [(id)v33[5] UID];
      v22 = +[_DKAudioOutputMonitor _BMEventWithState:v18 type:v19 name:v20 identifier:v21 routeChangeReason:v11];
      [(BMSource *)source sendEvent:v22];

      LODWORD(v18) = *((unsigned __int8 *)v39 + 24);
      v23 = [(id)v33[5] portType];
      v24 = [(id)v33[5] portName];
      v25 = [(id)v33[5] UID];
      v26 = +[_DKAudioOutputMonitor contextValueForAudioOutputConnectionStatus:v18 != 0 type:v23 name:v24 identifier:v25 routeChangeReason:v11];

      v27 = [MEMORY[0x263F351B8] userContext];
      v28 = [MEMORY[0x263F351D0] keyPathForAudioOutputDataDictionary];
      [v27 setObject:v26 forKeyedSubscript:v28];

      v6 = v29;
      objc_super v5 = v30;
    }
    _Block_object_dispose(&v32, 8);

    _Block_object_dispose(&v38, 8);
  }
}

+ (id)contextValueForAudioOutputConnectionStatus:(BOOL)a3 type:(id)a4 name:(id)a5 identifier:(id)a6 routeChangeReason:(id)a7
{
  BOOL v10 = a3;
  v28[5] = *MEMORY[0x263EF8340];
  id v11 = &unk_26D86D9D0;
  if (a7) {
    id v11 = a7;
  }
  id v12 = v11;
  id v13 = (__CFString *)a6;
  id v14 = (__CFString *)a5;
  id v15 = (__CFString *)a4;
  v26 = [MEMORY[0x263F351D0] audioOutputStatusKey];
  v27[0] = v26;
  uint64_t v16 = [NSNumber numberWithBool:v10];
  v28[0] = v16;
  uint64_t v17 = [MEMORY[0x263F351D0] audioPortTypeKey];
  v27[1] = v17;
  if (v15) {
    v18 = v15;
  }
  else {
    v18 = &stru_26D866630;
  }
  v28[1] = v18;
  v19 = [MEMORY[0x263F351D0] audioPortNameKey];
  v27[2] = v19;
  if (v14) {
    v20 = v14;
  }
  else {
    v20 = &stru_26D866630;
  }
  v28[2] = v20;
  v21 = [MEMORY[0x263F351D0] audioIdentifierKey];
  v27[3] = v21;
  if (v13) {
    v22 = v13;
  }
  else {
    v22 = &stru_26D866630;
  }
  v28[3] = v22;
  v23 = [MEMORY[0x263F351D0] audioRouteChangeReasonKey];
  v27[4] = v23;
  v28[4] = v12;
  v24 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:5];

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_outputMonitor, 0);
}

@end
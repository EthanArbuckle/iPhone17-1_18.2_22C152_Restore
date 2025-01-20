@interface _DKAudioInputMonitor
+ (id)_BMEventWithState:(id)a3 type:(id)a4 name:(id)a5 identifier:(id)a6 routeChangeReason:(id)a7;
+ (id)_eventWithState:(id)a3 type:(id)a4 name:(id)a5 identifier:(id)a6 routeChangeReason:(id)a7;
+ (id)entitlement;
+ (id)eventStream;
- (void)deactivate;
- (void)dealloc;
- (void)onAudioRouteChangeNotification:(id)a3;
- (void)start;
@end

@implementation _DKAudioInputMonitor

- (void)dealloc
{
  [(_DKAudioInputMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKAudioInputMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)eventStream
{
  return @"DeviceAudioInputExternal";
}

+ (id)entitlement
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
  v24 = [MEMORY[0x263F35148] audioInputRouteStream];
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
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F29FE8]) initWithExternal:v15 identifier:v12 portType:v14 portName:v13 routeChangeReason:v16 type:1];

  return v17;
}

- (void)start
{
  objc_super v3 = [MEMORY[0x263EF93E0] sharedInstance];
  inputMonitor = self->_inputMonitor;
  self->_inputMonitor = v3;

  v5 = BiomeLibrary();
  v6 = [v5 Audio];
  v7 = [v6 Route];
  v8 = [v7 source];
  source = self->_source;
  self->_source = v8;

  id v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 addObserver:self selector:sel_onAudioRouteChangeNotification_ name:*MEMORY[0x263EF9248] object:0];
}

- (void)deactivate
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  inputMonitor = self->_inputMonitor;
  self->_inputMonitor = 0;
}

- (void)onAudioRouteChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = (void *)os_transaction_create();
  v6 = (void *)MEMORY[0x22A629AA0]();
  v7 = [(AVAudioSession *)self->_inputMonitor currentRoute];
  v8 = v7;
  if (v7)
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__6;
    v34 = __Block_byref_object_dispose__6;
    id v35 = 0;
    v9 = [v7 inputs];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __55___DKAudioInputMonitor_onAudioRouteChangeNotification___block_invoke;
    v29[3] = &unk_264714FB8;
    void v29[4] = &v30;
    v29[5] = &v36;
    [v9 enumerateObjectsUsingBlock:v29];

    if (v31[5])
    {
      v25 = v6;
      v26 = v5;
      id v28 = v4;
      id v10 = [NSNumber numberWithBool:*((unsigned __int8 *)v37 + 24)];
      id v11 = [(id)v31[5] portType];
      id v12 = [(id)v31[5] portName];
      id v13 = [(id)v31[5] UID];
      id v14 = [v4 userInfo];
      uint64_t v15 = *MEMORY[0x263EF9268];
      uint64_t v16 = [v14 objectForKeyedSubscript:*MEMORY[0x263EF9268]];
      v27 = +[_DKAudioInputMonitor _eventWithState:v10 type:v11 name:v12 identifier:v13 routeChangeReason:v16];

      [(_DKMonitor *)self setCurrentEvent:v27 inferHistoricalState:1];
      source = self->_source;
      v18 = [NSNumber numberWithBool:*((unsigned __int8 *)v37 + 24)];
      v19 = [(id)v31[5] portType];
      v20 = [(id)v31[5] portName];
      v21 = [(id)v31[5] UID];
      v22 = [v4 userInfo];
      v23 = [v22 objectForKeyedSubscript:v15];
      v24 = +[_DKAudioInputMonitor _BMEventWithState:v18 type:v19 name:v20 identifier:v21 routeChangeReason:v23];
      [(BMSource *)source sendEvent:v24];

      id v4 = v28;
      v6 = v25;
      v5 = v26;
    }
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMonitor, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
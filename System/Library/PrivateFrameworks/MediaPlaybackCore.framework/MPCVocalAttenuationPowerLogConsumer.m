@interface MPCVocalAttenuationPowerLogConsumer
+ (NSString)identifier;
+ (PPSTelemetryIdentifier)telemetryID;
- (BOOL)lastVocalAttenuationIsActive;
- (MPCPlaybackEngineEventStreamSubscription)subscription;
- (void)dealloc;
- (void)reportVocalAttenuationIsActive:(BOOL)a3 date:(id)a4;
- (void)setLastVocalAttenuationIsActive:(BOOL)a3;
- (void)subscribeToEventStream:(id)a3;
- (void)unsubscribeFromEventStream:(id)a3;
@end

@implementation MPCVocalAttenuationPowerLogConsumer

+ (NSString)identifier
{
  return (NSString *)@"com.apple.MediaPlaybackCore/vocalAttenuationPowerLog";
}

- (void)subscribeToEventStream:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
  id v5 = a3;
  subscription = self->_subscription;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__MPCVocalAttenuationPowerLogConsumer_subscribeToEventStream___block_invoke;
  v11[3] = &unk_2643C5258;
  v11[4] = self;
  [(MPCPlaybackEngineEventStreamSubscription *)subscription subscribeToEventType:@"item-resume" handler:v11];
  v7 = self->_subscription;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__MPCVocalAttenuationPowerLogConsumer_subscribeToEventStream___block_invoke_2;
  v10[3] = &unk_2643C5258;
  v10[4] = self;
  [(MPCPlaybackEngineEventStreamSubscription *)v7 subscribeToEventType:@"item-vocal-attenuation-changed" handler:v10];
  v8 = self->_subscription;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__MPCVocalAttenuationPowerLogConsumer_subscribeToEventStream___block_invoke_3;
  v9[3] = &unk_2643C5258;
  v9[4] = self;
  [(MPCPlaybackEngineEventStreamSubscription *)v8 subscribeToEventType:@"item-pause" handler:v9];
}

- (void).cxx_destruct
{
}

- (void)setLastVocalAttenuationIsActive:(BOOL)a3
{
  self->_lastVocalAttenuationIsActive = a3;
}

- (BOOL)lastVocalAttenuationIsActive
{
  return self->_lastVocalAttenuationIsActive;
}

- (MPCPlaybackEngineEventStreamSubscription)subscription
{
  return self->_subscription;
}

- (void)reportVocalAttenuationIsActive:(BOOL)a3 date:(id)a4
{
  BOOL v4 = a3;
  v19[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([(MPCVocalAttenuationPowerLogConsumer *)self lastVocalAttenuationIsActive] != v4)
  {
    v18[0] = @"Enabled";
    v7 = [NSNumber numberWithBool:v4];
    v18[1] = @"TimestampSent";
    v19[0] = v7;
    v8 = NSNumber;
    [v6 timeIntervalSince1970];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    v19[1] = v9;
    v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

    v11 = dispatch_get_global_queue(17, 0);
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __75__MPCVocalAttenuationPowerLogConsumer_reportVocalAttenuationIsActive_date___block_invoke;
    v16 = &unk_2643C5FC8;
    id v17 = v10;
    id v12 = v10;
    dispatch_async(v11, &v13);

    -[MPCVocalAttenuationPowerLogConsumer setLastVocalAttenuationIsActive:](self, "setLastVocalAttenuationIsActive:", v4, v13, v14, v15, v16);
  }
}

uint64_t __75__MPCVocalAttenuationPowerLogConsumer_reportVocalAttenuationIsActive_date___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_DEFAULT, "PowerLog: Logging VocalAttenuation state change event with payload:\n%{public}@", (uint8_t *)&v5, 0xCu);
  }

  +[MPCVocalAttenuationPowerLogConsumer telemetryID];
  return PPSSendTelemetry();
}

- (void)unsubscribeFromEventStream:(id)a3
{
  subscription = self->_subscription;
  self->_subscription = 0;
}

uint64_t __62__MPCVocalAttenuationPowerLogConsumer_subscribeToEventStream___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v3 payload];
  int v5 = [v4 objectForKeyedSubscript:@"vocal-attenuation-enabled"];
  uint64_t v6 = [v5 BOOLValue];
  uint64_t v7 = [v3 date];

  [v2 reportVocalAttenuationIsActive:v6 date:v7];
  return 1;
}

uint64_t __62__MPCVocalAttenuationPowerLogConsumer_subscribeToEventStream___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v3 payload];
  int v5 = [v4 objectForKeyedSubscript:@"vocal-attenuation-enabled"];
  uint64_t v6 = [v5 BOOLValue];
  uint64_t v7 = [v3 date];

  [v2 reportVocalAttenuationIsActive:v6 date:v7];
  return 1;
}

uint64_t __62__MPCVocalAttenuationPowerLogConsumer_subscribeToEventStream___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 date];
  [v2 reportVocalAttenuationIsActive:0 date:v3];

  return 1;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263EFF910] now];
  [(MPCVocalAttenuationPowerLogConsumer *)self reportVocalAttenuationIsActive:0 date:v3];

  v4.receiver = self;
  v4.super_class = (Class)MPCVocalAttenuationPowerLogConsumer;
  [(MPCVocalAttenuationPowerLogConsumer *)&v4 dealloc];
}

+ (PPSTelemetryIdentifier)telemetryID
{
  if (telemetryID_onceToken != -1) {
    dispatch_once(&telemetryID_onceToken, &__block_literal_global_29408);
  }
  return (PPSTelemetryIdentifier *)telemetryID_telemetryID;
}

uint64_t __50__MPCVocalAttenuationPowerLogConsumer_telemetryID__block_invoke()
{
  uint64_t result = PPSCreateTelemetryIdentifier();
  telemetryID_telemetryID = result;
  return result;
}

@end
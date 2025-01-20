@interface DTObjectAllocService
+ (void)registerCapabilities:(id)a3;
- (DTObjectAllocService)initWithChannel:(id)a3;
- (id)attachToPid:(id)a3 eventsMask:(id)a4;
- (id)preparedEnvironmentForLaunch:(id)a3 eventsMask:(id)a4;
- (void)messageReceived:(id)a3;
- (void)startCollectionWithPid:(int)a3;
- (void)stopCollection;
@end

@implementation DTObjectAllocService

+ (void)registerCapabilities:(id)a3
{
  id v5 = a3;
  v4 = +[DTAllocationsRecorder serviceIdentifier];
  [v5 publishCapability:v4 withVersion:[DTAllocationsRecorder currentVersion] forClass:a1];

  [v5 publishCapability:@"com.apple.instruments.server.services.objectalloc.immediate" withVersion:1 forClass:a1];
  [v5 publishCapability:@"com.apple.instruments.server.services.objectalloc.deferred" withVersion:1 forClass:a1];
  [v5 publishCapability:@"com.apple.instruments.server.services.objectalloc.zombies" withVersion:1 forClass:a1];
}

- (DTObjectAllocService)initWithChannel:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DTObjectAllocService;
  id v5 = [(DTXService *)&v11 initWithChannel:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    recorder = v5->_recorder;
    v5->_recorder = (DTAllocationsRecorder *)v6;

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_2308EDDC8;
    v9[3] = &unk_264B8FBC8;
    id v10 = v4;
    [(DTAllocationsRecorder *)v5->_recorder setBufferHandler:v9];
  }
  return v5;
}

- (void)messageReceived:(id)a3
{
  if ([a3 errorStatus] == 2)
  {
    mach_port_name_t task = self->_task;
    if (task + 1 >= 2)
    {
      mach_port_deallocate(*MEMORY[0x263EF8960], task);
      self->_mach_port_name_t task = 0;
    }
    recorder = self->_recorder;
    [(DTAllocationsRecorder *)recorder cancel];
  }
}

- (id)preparedEnvironmentForLaunch:(id)a3 eventsMask:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)[a3 mutableCopy];
  uint64_t v7 = [v5 intValue];

  if (+[DTAllocationsRecorder configureLocalLaunchEnvironment:v6 recordedEventsMask:v7])
  {
    id v8 = v6;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)attachToPid:(id)a3 eventsMask:(id)a4
{
  id v6 = a4;
  self->_uint64_t task = +[DTInstrumentServer taskForPid:](DTInstrumentServer, "taskForPid:", [a3 intValue]);
  uint64_t v7 = objc_opt_new();
  recorder = self->_recorder;
  uint64_t task = self->_task;
  uint64_t v10 = [v6 intValue];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_2308EE078;
  v13[3] = &unk_264B8DAE8;
  id v11 = v7;
  id v14 = v11;
  [(DTAllocationsRecorder *)recorder startAttachingToTask:task recordedEventsMask:v10 errorHandler:v13];

  return v11;
}

- (void)startCollectionWithPid:(int)a3
{
  uint64_t v5 = +[DTInstrumentServer taskForPid:*(void *)&a3];
  self->_uint64_t task = v5;
  recorder = self->_recorder;
  uint64_t v7 = +[DTAllocationsRecorder allEventsMask];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_2308EE160;
  v8[3] = &unk_264B8FBF0;
  v8[4] = self;
  v8[5] = a2;
  [(DTAllocationsRecorder *)recorder startAttachingToTask:v5 recordedEventsMask:v7 errorHandler:v8];
}

- (void)stopCollection
{
  [(DTAllocationsRecorder *)self->_recorder stop];
  id v3 = [(DTXService *)self channel];
  [v3 cancel];
}

- (void).cxx_destruct
{
}

@end
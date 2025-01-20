@interface DTKTraceTapLocalVFSTracePathsProducer
+ (BOOL)supportsConfig:(id)a3;
- (DTKTraceTapLocalVFSTracePathsProducer)init;
- (void)_emitVFSDump;
- (void)start;
@end

@implementation DTKTraceTapLocalVFSTracePathsProducer

+ (BOOL)supportsConfig:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2308B22D8;
  v6[3] = &unk_264B8EBB0;
  v6[4] = &v7;
  [v3 enumerateTriggerConfigs:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (DTKTraceTapLocalVFSTracePathsProducer)init
{
  v3.receiver = self;
  v3.super_class = (Class)DTKTraceTapLocalVFSTracePathsProducer;
  return [(DTKTraceTapLocalVFSTracePathsProducer *)&v3 init];
}

- (void)_emitVFSDump
{
}

- (void)start
{
}

@end
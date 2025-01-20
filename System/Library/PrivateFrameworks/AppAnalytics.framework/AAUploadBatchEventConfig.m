@interface AAUploadBatchEventConfig
+ (AAUploadBatchEventConfig)default;
- (AAUploadBatchEventConfig)init;
- (AAUploadBatchEventConfig)initWithBatchSize:(int64_t)a3 enableDebugging:(BOOL)a4;
- (BOOL)debuggingEnabled;
- (BOOL)transparencyLoggingEnabled;
- (NSURL)directory;
- (id)withDebuggingEnabled:(BOOL)a3;
- (id)withDirectory:(id)a3;
- (id)withMaxByteSizePerSessionBatch:(int64_t)a3;
- (id)withMaxEventsPerSessionBatch:(int64_t)a3;
- (id)withMaxUploadTries:(int64_t)a3;
- (id)withTransparencyLoggingEnabled:(BOOL)a3;
- (int64_t)maxByteSizePerSessionBatch;
- (int64_t)maxEventsPerSessionBatch;
- (int64_t)maxUploadTries;
@end

@implementation AAUploadBatchEventConfig

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___AAUploadBatchEventConfig_directory;
  uint64_t v3 = sub_1A916AAD0();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

+ (AAUploadBatchEventConfig)default
{
  if (qword_1EB689870 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB6897B8;

  return (AAUploadBatchEventConfig *)v2;
}

- (int64_t)maxEventsPerSessionBatch
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___AAUploadBatchEventConfig_maxEventsPerSessionBatch);
}

- (int64_t)maxByteSizePerSessionBatch
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___AAUploadBatchEventConfig_maxByteSizePerSessionBatch);
}

- (BOOL)transparencyLoggingEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___AAUploadBatchEventConfig_transparencyLoggingEnabled);
}

- (BOOL)debuggingEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___AAUploadBatchEventConfig_debuggingEnabled);
}

- (int64_t)maxUploadTries
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___AAUploadBatchEventConfig_maxUploadTries);
}

- (NSURL)directory
{
  v2 = (void *)sub_1A916AA40();

  return (NSURL *)v2;
}

- (AAUploadBatchEventConfig)initWithBatchSize:(int64_t)a3 enableDebugging:(BOOL)a4
{
  return (AAUploadBatchEventConfig *)UploadBatchEventConfig.init(batchSize:batchDebugging:)(a3, a4);
}

- (id)withMaxEventsPerSessionBatch:(int64_t)a3
{
  v4 = self;
  id v5 = UploadBatchEventConfig.with(maxEventsPerSessionBatch:)(a3);

  return v5;
}

- (id)withMaxByteSizePerSessionBatch:(int64_t)a3
{
  v4 = self;
  id v5 = UploadBatchEventConfig.with(maxByteSizePerSessionBatch:)(a3);

  return v5;
}

- (id)withTransparencyLoggingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  id v5 = UploadBatchEventConfig.with(transparencyLoggingEnabled:)(v3);

  return v5;
}

- (id)withDebuggingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  id v5 = UploadBatchEventConfig.with(debuggingEnabled:)(v3);

  return v5;
}

- (id)withMaxUploadTries:(int64_t)a3
{
  v4 = self;
  id v5 = UploadBatchEventConfig.with(maxUploadTries:)(a3);

  return v5;
}

- (id)withDirectory:(id)a3
{
  uint64_t v4 = sub_1A916AAD0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A916AA70();
  v8 = self;
  id v9 = UploadBatchEventConfig.with(directory:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v9;
}

- (AAUploadBatchEventConfig)init
{
  result = (AAUploadBatchEventConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
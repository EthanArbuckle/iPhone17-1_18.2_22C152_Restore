@interface HealthAppDaemonOrchestrationDiagnosticOperation
- (NSString)reportFilename;
- (_TtC34HealthAppDiagnosticExtensionPluginP33_11F9AD07514107A6A0C1146F6D81808E47HealthAppDaemonOrchestrationDiagnosticOperation)initWithAttachmentDirectoryURL:(id)a3;
- (void)run;
@end

@implementation HealthAppDaemonOrchestrationDiagnosticOperation

- (_TtC34HealthAppDiagnosticExtensionPluginP33_11F9AD07514107A6A0C1146F6D81808E47HealthAppDaemonOrchestrationDiagnosticOperation)initWithAttachmentDirectoryURL:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = sub_3710();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3700();
  sub_36F0(v9);
  v11 = v10;
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = [(HealthAppDaemonOrchestrationDiagnosticOperation *)&v14 initWithAttachmentDirectoryURL:v10];

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v12;
}

- (NSString)reportFilename
{
  NSString v2 = sub_3790();

  return (NSString *)v2;
}

- (void)run
{
  NSString v2 = self;
  sub_2F0C();
}

@end
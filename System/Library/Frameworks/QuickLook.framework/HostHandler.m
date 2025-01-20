@interface HostHandler
- (void)launchFailedWithSessionUUID:(id)a3 error:(id)a4;
- (void)launchSucceededWithSessionUUID:(id)a3;
- (void)previewClosedWithSessionUUID:(id)a3;
- (void)previewSceneMovedWithSessionUUID:(id)a3 sceneIdentifier:(id)a4;
- (void)previewTerminatedWithSessionUUID:(id)a3;
@end

@implementation HostHandler

- (void)launchSucceededWithSessionUUID:(id)a3
{
}

- (void)launchFailedWithSessionUUID:(id)a3 error:(id)a4
{
  uint64_t v5 = sub_218037DF4();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218037DD4();
  id v9 = a4;
  swift_retain();
  sub_218000600((uint64_t)v8, v9);
  swift_release();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)previewClosedWithSessionUUID:(id)a3
{
}

- (void)previewTerminatedWithSessionUUID:(id)a3
{
  uint64_t v3 = sub_218037DF4();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218037DD4();
  sub_2180009AC((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)previewSceneMovedWithSessionUUID:(id)a3 sceneIdentifier:(id)a4
{
  uint64_t v4 = sub_218037DF4();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218037DD4();
  sub_218000E48((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
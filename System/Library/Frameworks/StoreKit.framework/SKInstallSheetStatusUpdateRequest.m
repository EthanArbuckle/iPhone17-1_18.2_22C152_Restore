@interface SKInstallSheetStatusUpdateRequest
- (SKInstallSheetStatusUpdateRequest)init;
- (SKInstallSheetStatusUpdateRequest)initWithAppBundleId:(id)a3 isInstallSheetOpen:(BOOL)a4 completionHandler:(id)a5;
- (void)start;
@end

@implementation SKInstallSheetStatusUpdateRequest

- (SKInstallSheetStatusUpdateRequest)initWithAppBundleId:(id)a3 isInstallSheetOpen:(BOOL)a4 completionHandler:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_1B01DBB50();
  uint64_t v9 = v8;
  if (v6)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v6;
    v11 = sub_1B0147654;
  }
  else
  {
    v11 = 0;
    uint64_t v10 = 0;
  }
  return (SKInstallSheetStatusUpdateRequest *)sub_1B0145C10(v7, v9, a4, (uint64_t)v11, v10);
}

- (void)start
{
  v2 = self;
  sub_1B0145DDC();
}

- (SKInstallSheetStatusUpdateRequest)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SKInstallSheetStatusUpdateRequest_completionHandler);

  sub_1B01215E8(v3);
}

@end
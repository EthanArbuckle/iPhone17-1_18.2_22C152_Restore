@interface WFStageManagerSettingsClient
+ (void)createClientWithCompletionHandler:(id)a3;
- (BOOL)showDock;
- (BOOL)showRecentApps;
- (WFStageManagerSettingsClient)init;
- (void)getStateWithCompletionHandler:(id)a3;
- (void)setShowDock:(BOOL)a3;
- (void)setShowRecentApps:(BOOL)a3;
- (void)setState:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation WFStageManagerSettingsClient

+ (void)createClientWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = a1;
  sub_23C413EEC((uint64_t)&unk_268BA6158, v5);
}

- (BOOL)showRecentApps
{
  v2 = self;
  unsigned __int8 v3 = sub_23C36B380();

  return v3 & 1;
}

- (void)setShowRecentApps:(BOOL)a3
{
  v4 = self;
  sub_23C36B3EC(a3);
}

- (BOOL)showDock
{
  v2 = self;
  unsigned __int8 v3 = sub_23C36B438();

  return v3 & 1;
}

- (void)setShowDock:(BOOL)a3
{
  v4 = self;
  sub_23C36B50C(a3);
}

- (WFStageManagerSettingsClient)init
{
  return (WFStageManagerSettingsClient *)sub_23C36B5A8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___WFStageManagerSettingsClient____lazy_storage___manager));
}

- (void)getStateWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  v6 = self;
  sub_23C413EEC((uint64_t)&unk_268BA6140, v5);
}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(unsigned char *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = v6;
  *(void *)(v7 + 32) = self;
  v8 = self;
  sub_23C413EEC((uint64_t)&unk_268BA6128, v7);
}

@end
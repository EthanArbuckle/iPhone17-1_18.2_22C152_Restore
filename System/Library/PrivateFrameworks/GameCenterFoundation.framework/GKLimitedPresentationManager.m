@interface GKLimitedPresentationManager
- (GKLimitedPresentationManager)init;
- (GKLimitedPresentationManager)initWithDefaultsKey:(id)a3;
- (void)didPresentWithCompletionHandler:(id)a3;
- (void)presentationDisabledWithConfig:(GKLimitedPresentationConfig *)a3 completionHandler:(id)a4;
- (void)presentationDisabledWithConfig:(GKLimitedPresentationConfig *)a3 context:(GKLimitedPresentationContext *)a4 completionHandler:(id)a5;
- (void)resetWithCompletionHandler:(id)a3;
@end

@implementation GKLimitedPresentationManager

- (GKLimitedPresentationManager)initWithDefaultsKey:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_1C2E922F8();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (GKLimitedPresentationManager *)LimitedPresentationManager.init(defaultsKey:)(v3, v4);
}

- (void)presentationDisabledWithConfig:(GKLimitedPresentationConfig *)a3 context:(GKLimitedPresentationContext *)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  swift_retain();

  sub_1C2E83A20((uint64_t)&unk_1EA33A8E8, (uint64_t)v9);
}

- (void)presentationDisabledWithConfig:(GKLimitedPresentationConfig *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  swift_retain();

  sub_1C2E83A20((uint64_t)&unk_1EA33A8D8, (uint64_t)v7);
}

- (void)resetWithCompletionHandler:(id)a3
{
}

- (void)didPresentWithCompletionHandler:(id)a3
{
}

- (GKLimitedPresentationManager)init
{
}

@end
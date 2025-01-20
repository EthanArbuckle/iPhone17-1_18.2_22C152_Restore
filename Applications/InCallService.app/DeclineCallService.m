@interface DeclineCallService
- (void)declineAnsweringCallDueToLockEventWithCurrentActiveCall:(TUCall *)a3 completionHandler:(id)a4;
- (void)declineAnsweringFrontMostCallViaUserActionWithCompletionHandler:(id)a3;
- (void)declineAnsweringWithCall:(TUCall *)a3 anayticsSourceForDismissal:(NSString *)a4 reason:(int)a5 completionHandler:(id)a6;
@end

@implementation DeclineCallService

- (void)declineAnsweringWithCall:(TUCall *)a3 anayticsSourceForDismissal:(NSString *)a4 reason:(int)a5 completionHandler:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = a4;
  *(_DWORD *)(v11 + 32) = a5;
  *(void *)(v11 + 40) = v10;
  *(void *)(v11 + 48) = self;
  v12 = a3;
  v13 = a4;
  swift_retain();

  sub_1001BB654((uint64_t)&unk_100324868, v11);
}

- (void)declineAnsweringFrontMostCallViaUserActionWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  swift_retain();

  sub_1001BB654((uint64_t)&unk_100324850, v5);
}

- (void)declineAnsweringCallDueToLockEventWithCurrentActiveCall:(TUCall *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  swift_retain();

  sub_1001BB654((uint64_t)&unk_100324808, (uint64_t)v7);
}

@end
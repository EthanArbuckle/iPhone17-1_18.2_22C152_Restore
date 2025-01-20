@interface CNDeviceFirstUnlockFuture
+ (id)deviceFirstUnlockFuture;
@end

@implementation CNDeviceFirstUnlockFuture

+ (id)deviceFirstUnlockFuture
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(CNPromise);
  int out_token = -1;
  v3 = dispatch_get_global_queue(0, 0);
  v4 = +[CNMobileKeyBag firstUnlockNotificationID];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __52__CNDeviceFirstUnlockFuture_deviceFirstUnlockFuture__block_invoke;
  handler[3] = &unk_1E569F420;
  v5 = v2;
  v15 = v5;
  uint64_t v6 = notify_register_dispatch(v4, &out_token, v3, handler);
  if (v6)
  {
    v17 = @"notify_status";
    v7 = [NSNumber numberWithUnsignedInt:v6];
    v18[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v9 = +[CNFoundationError errorWithCode:10 userInfo:v8];

    [(CNPromise *)v5 finishWithError:v9];
  }
  else
  {
    v9 = [(CNPromise *)v5 future];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__CNDeviceFirstUnlockFuture_deviceFirstUnlockFuture__block_invoke_2;
    v12[3] = &__block_descriptor_36_e17_v16__0__NSError_8l;
    int v13 = out_token;
    [v9 addFailureBlock:v12];
  }

  v10 = [(CNPromise *)v5 future];

  return v10;
}

uint64_t __52__CNDeviceFirstUnlockFuture_deviceFirstUnlockFuture__block_invoke(uint64_t a1, int a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = [MEMORY[0x1E4F1CA98] null];
  [v3 finishWithResult:v4];

  return notify_cancel(a2);
}

uint64_t __52__CNDeviceFirstUnlockFuture_deviceFirstUnlockFuture__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = +[CNFoundationError isCanceledError:a2];
  if (result)
  {
    int v4 = *(_DWORD *)(a1 + 32);
    return notify_cancel(v4);
  }
  return result;
}

@end
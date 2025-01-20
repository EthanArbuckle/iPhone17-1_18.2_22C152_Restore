@interface NSProcessInfo(MIMEAdditions)
- (id)mf_thermalStateObservable;
@end

@implementation NSProcessInfo(MIMEAdditions)

- (id)mf_thermalStateObservable
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28EA0]);
  uint64_t v3 = *MEMORY[0x1E4F287F0];
  v4 = (void *)[v2 initWithName:*MEMORY[0x1E4F287F0] object:a1 userInfo:0];
  v5 = [MEMORY[0x1E4F60DD8] observableOnDefaultNotificationCenterWithName:v3 object:a1];
  v11[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v7 = [v5 startWith:v6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__NSProcessInfo_MIMEAdditions__mf_thermalStateObservable__block_invoke;
  v10[3] = &unk_1E5F8A2E0;
  v10[4] = a1;
  v8 = [v7 map:v10];

  return v8;
}

@end
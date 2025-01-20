@interface HMFFuture(HMDUtilities)
- (id)naFuture;
@end

@implementation HMFFuture(HMDUtilities)

- (id)naFuture
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __35__HMFFuture_HMDUtilities__naFuture__block_invoke;
  v10[3] = &unk_1E6A0B778;
  id v11 = v2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__HMFFuture_HMDUtilities__naFuture__block_invoke_2;
  v8[3] = &unk_1E6A17290;
  id v3 = v11;
  id v9 = v3;
  id v4 = (id)[a1 then:v10 orRecover:v8];
  v5 = v9;
  id v6 = v3;

  return v6;
}

@end
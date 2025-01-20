@interface CUStateEvent(HMDStateEventInternal)
- (void)completedWithError:()HMDStateEventInternal;
@end

@implementation CUStateEvent(HMDStateEventInternal)

- (void)completedWithError:()HMDStateEventInternal
{
  id v8 = a3;
  v4 = [a1 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"HMDStateEventCompletionKey"];

  v6 = _Block_copy(v5);
  v7 = v6;
  if (v6) {
    (*((void (**)(void *, id))v6 + 2))(v6, v8);
  }
}

@end
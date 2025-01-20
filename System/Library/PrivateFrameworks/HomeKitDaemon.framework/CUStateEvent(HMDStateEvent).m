@interface CUStateEvent(HMDStateEvent)
- (void)initWithName:()HMDStateEvent userInfo:completion:;
@end

@implementation CUStateEvent(HMDStateEvent)

- (void)initWithName:()HMDStateEvent userInfo:completion:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = v10;
    v12 = (void *)[v9 mutableCopy];
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [MEMORY[0x263EFF9A0] dictionary];
    }
    v15 = v14;

    v16 = _Block_copy(v11);
    [v15 setObject:v16 forKeyedSubscript:@"HMDStateEventCompletionKey"];

    v17 = (void *)[v15 copy];
    [a1 initWithName:v8 userInfo:v17];
  }
  else
  {
    v18 = (HMDMediaPropertyRequest *)_HMFPreconditionFailure();
    [(HMDMediaPropertyRequest *)v18 .cxx_destruct];
  }
}

@end
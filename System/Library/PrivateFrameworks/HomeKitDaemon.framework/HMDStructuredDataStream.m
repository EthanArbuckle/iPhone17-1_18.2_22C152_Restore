@interface HMDStructuredDataStream
- (NSError)error;
- (void)failWithError:(id)a3;
- (void)failWithReason:(id)a3;
@end

@implementation HMDStructuredDataStream

- (void)failWithError:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (NSError)error
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)failWithReason:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v8];

  id v7 = [MEMORY[0x263F087E8] hmfErrorWithCode:15 reason:v6];
  [(HMDStructuredDataStream *)self failWithError:v7];
}

@end
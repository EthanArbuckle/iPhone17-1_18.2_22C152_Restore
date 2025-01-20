@interface HMIVideoAnalyzerResultFilter
- (HMIVideoAnalyzerResultFilter)initWith;
- (id)applyWithFrameResult:(id)a3;
@end

@implementation HMIVideoAnalyzerResultFilter

- (HMIVideoAnalyzerResultFilter)initWith
{
  v3.receiver = self;
  v3.super_class = (Class)HMIVideoAnalyzerResultFilter;
  return [(HMIVideoAnalyzerResultFilter *)&v3 init];
}

- (id)applyWithFrameResult:(id)a3
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

@end
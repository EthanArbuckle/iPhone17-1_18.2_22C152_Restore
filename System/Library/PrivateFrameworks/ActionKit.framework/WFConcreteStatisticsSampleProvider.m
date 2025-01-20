@interface WFConcreteStatisticsSampleProvider
- (WFConcreteStatisticsSampleProvider)initWithSampleProvider:(id)a3;
- (WFStatisticsSampleProvider)sampleProvider;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setSampleProvider:(id)a3;
@end

@implementation WFConcreteStatisticsSampleProvider

- (void).cxx_destruct
{
}

- (void)setSampleProvider:(id)a3
{
}

- (WFStatisticsSampleProvider)sampleProvider
{
  return self->_sampleProvider;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  id v5 = [(WFConcreteStatisticsSampleProvider *)self sampleProvider];
  [v4 invokeWithTarget:v5];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v4 = [(WFConcreteStatisticsSampleProvider *)self sampleProvider];
  id v5 = [v4 methodSignatureForSelector:a3];

  return v5;
}

- (WFConcreteStatisticsSampleProvider)initWithSampleProvider:(id)a3
{
  return self;
}

@end
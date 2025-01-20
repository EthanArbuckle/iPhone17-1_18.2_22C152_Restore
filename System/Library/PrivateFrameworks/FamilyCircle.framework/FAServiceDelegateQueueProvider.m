@interface FAServiceDelegateQueueProvider
- (id)requestQueueWithOptions:(id)a3;
- (unsigned)_qosClassForOptions:(id)a3;
@end

@implementation FAServiceDelegateQueueProvider

- (unsigned)_qosClassForOptions:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"FAQualityOfServiceOptionKey"];
  v4 = (char *)[v3 integerValue];

  unint64_t v5 = __ROR8__(v4 - 9, 3);
  unsigned int v6 = 8 * v5 + 9;
  if (v5 >= 4) {
    return 21;
  }
  else {
    return v6;
  }
}

- (id)requestQueueWithOptions:(id)a3
{
  intptr_t v3 = [(FAServiceDelegateQueueProvider *)self _qosClassForOptions:a3];
  return dispatch_get_global_queue(v3, 0);
}

@end
@interface _CNEmptyObservable
- (id)debugPipelineDescription;
- (id)subscribe:(id)a3;
@end

@implementation _CNEmptyObservable

- (id)subscribe:(id)a3
{
  [a3 observerDidComplete];
  v3 = objc_alloc_init(_CNEmptyObservableCancelationToken);

  return v3;
}

- (id)debugPipelineDescription
{
  return @"Empty Observable";
}

@end
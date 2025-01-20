@interface _CNNeverObservable
- (id)debugPipelineDescription;
- (id)subscribe:(id)a3;
@end

@implementation _CNNeverObservable

- (id)subscribe:(id)a3
{
  v3 = objc_alloc_init(CNCancelationToken);

  return v3;
}

- (id)debugPipelineDescription
{
  return @"Never Observable";
}

@end
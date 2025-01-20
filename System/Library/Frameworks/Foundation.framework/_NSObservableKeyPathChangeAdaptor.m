@interface _NSObservableKeyPathChangeAdaptor
- (BOOL)_wantsChanges;
@end

@implementation _NSObservableKeyPathChangeAdaptor

- (BOOL)_wantsChanges
{
  return 1;
}

@end
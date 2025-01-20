@interface HKCorrelation(WDExtensions)
- (void)deleteObjectWithHealthStore:()WDExtensions options:completion:;
@end

@implementation HKCorrelation(WDExtensions)

- (void)deleteObjectWithHealthStore:()WDExtensions options:completion:
{
  id v8 = a5;
  id v9 = a3;
  v10 = [a1 objects];
  v11 = [v10 allObjects];
  id v12 = [v11 arrayByAddingObject:a1];

  [v9 _deleteObjects:v12 options:a4 completion:v8];
}

@end
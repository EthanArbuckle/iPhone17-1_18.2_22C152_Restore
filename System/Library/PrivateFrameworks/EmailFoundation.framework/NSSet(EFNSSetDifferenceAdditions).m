@interface NSSet(EFNSSetDifferenceAdditions)
- (EFNSSetDifference)differenceFromSet:()EFNSSetDifferenceAdditions;
@end

@implementation NSSet(EFNSSetDifferenceAdditions)

- (EFNSSetDifference)differenceFromSet:()EFNSSetDifferenceAdditions
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA80] setWithSet:a1];
  [v5 minusSet:v4];
  v6 = [MEMORY[0x1E4F1CA80] setWithSet:v4];
  [v6 minusSet:a1];
  v7 = [EFNSSetDifference alloc];
  v8 = (void *)[v5 copy];
  v9 = (void *)[v6 copy];
  v10 = [(EFNSSetDifference *)v7 initWithInsertedObjects:v8 removedObjects:v9];

  return v10;
}

@end
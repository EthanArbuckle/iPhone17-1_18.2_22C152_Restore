@interface NSCalendar(HDSampleEntityPredicates)
- (id)hd_predicateForSamplesWithTypes:()HDSampleEntityPredicates endingAfterDate:minusDays:;
- (id)hd_predicateForSamplesWithTypes:()HDSampleEntityPredicates endingBeforeDate:minusDays:;
@end

@implementation NSCalendar(HDSampleEntityPredicates)

- (id)hd_predicateForSamplesWithTypes:()HDSampleEntityPredicates endingBeforeDate:minusDays:
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"-[NSCalendar(HDSampleEntityPredicates) hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:]"];
    [v15 handleFailureInFunction:v16, @"HDSampleEntity.m", 1038, @"Invalid parameter not satisfying: %@", @"date != nil" file lineNumber description];
  }
  v10 = objc_msgSend(a1, "hk_dateBySubtractingDays:fromDate:", a5, v9);
  if ([v8 count])
  {
    v11 = HDSampleEntityPredicateForDataTypes(v8);
  }
  else
  {
    v11 = 0;
  }
  v12 = HDSampleEntityPredicateForEndDate(4);
  v13 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v11 otherPredicate:v12];

  return v13;
}

- (id)hd_predicateForSamplesWithTypes:()HDSampleEntityPredicates endingAfterDate:minusDays:
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"-[NSCalendar(HDSampleEntityPredicates) hd_predicateForSamplesWithTypes:endingAfterDate:minusDays:]"];
    [v15 handleFailureInFunction:v16, @"HDSampleEntity.m", 1025, @"Invalid parameter not satisfying: %@", @"date != nil" file lineNumber description];
  }
  v10 = objc_msgSend(a1, "hk_dateBySubtractingDays:fromDate:", a5, v9);
  if ([v8 count])
  {
    v11 = HDSampleEntityPredicateForDataTypes(v8);
  }
  else
  {
    v11 = 0;
  }
  v12 = HDSampleEntityPredicateForEndDate(6);
  v13 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v11 otherPredicate:v12];

  return v13;
}

@end
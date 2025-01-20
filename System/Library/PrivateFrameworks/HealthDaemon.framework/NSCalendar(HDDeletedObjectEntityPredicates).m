@interface NSCalendar(HDDeletedObjectEntityPredicates)
- (id)hd_predicateForDeletedObjectsCreatedBeforeDate:()HDDeletedObjectEntityPredicates minusDays:;
- (id)hd_predicateForDeletedObjectsCreatedOnOrAfterDate:()HDDeletedObjectEntityPredicates minusDays:;
@end

@implementation NSCalendar(HDDeletedObjectEntityPredicates)

- (id)hd_predicateForDeletedObjectsCreatedBeforeDate:()HDDeletedObjectEntityPredicates minusDays:
{
  v4 = objc_msgSend(a1, "hk_dateBySubtractingDays:fromDate:", a4, a3);
  v5 = HDDeletedObjectPredicateForDeletionDate(3);

  return v5;
}

- (id)hd_predicateForDeletedObjectsCreatedOnOrAfterDate:()HDDeletedObjectEntityPredicates minusDays:
{
  v4 = objc_msgSend(a1, "hk_dateBySubtractingDays:fromDate:", a4, a3);
  v5 = HDDeletedObjectPredicateForDeletionDate(6);

  return v5;
}

@end
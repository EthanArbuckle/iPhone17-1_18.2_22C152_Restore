@interface HDListUserDomainConceptCollapser
+ (BOOL)keepOldestConcept;
+ (BOOL)shouldDeleteDuplicateConcept;
@end

@implementation HDListUserDomainConceptCollapser

+ (BOOL)keepOldestConcept
{
  return 0;
}

+ (BOOL)shouldDeleteDuplicateConcept
{
  return 0;
}

@end
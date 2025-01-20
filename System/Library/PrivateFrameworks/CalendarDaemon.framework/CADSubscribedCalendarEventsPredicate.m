@interface CADSubscribedCalendarEventsPredicate
- (CADSubscribedCalendarEventsPredicate)initWithCalendar:(id)a3;
- (id)defaultPropertiesToLoad;
@end

@implementation CADSubscribedCalendarEventsPredicate

- (CADSubscribedCalendarEventsPredicate)initWithCalendar:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CADSubscribedCalendarEventsPredicate;
  return [(CADPropertySearchPredicate *)&v4 initWithEntityType:2 filters:MEMORY[0x1E4F1CBF0] calendar:a3];
}

- (id)defaultPropertiesToLoad
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v2 = CADEKPersistentEventMinimumDefaultPropertiesToLoad();
  uint64_t v3 = *MEMORY[0x1E4F56D38];
  v7[0] = *MEMORY[0x1E4F56C00];
  v7[1] = v3;
  objc_super v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  v5 = [v2 arrayByAddingObjectsFromArray:v4];

  return v5;
}

@end
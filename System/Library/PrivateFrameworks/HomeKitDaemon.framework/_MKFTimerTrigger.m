@interface _MKFTimerTrigger
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFTimerTriggerDatabaseID)databaseID;
- (void)awakeFromFetch;
@end

@implementation _MKFTimerTrigger

- (MKFTimerTriggerDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFTimerTriggerDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (void)awakeFromFetch
{
  v13.receiver = self;
  v13.super_class = (Class)_MKFTimerTrigger;
  [(_MKFTimerTrigger *)&v13 awakeFromFetch];
  v3 = [(_MKFTimerTrigger *)self recurrenceDays];
  if (!v3)
  {
    v4 = [(_MKFTimerTrigger *)self recurrences];

    if (!v4) {
      goto LABEL_5;
    }
    v5 = NSNumber;
    v3 = [(_MKFTimerTrigger *)self recurrences];
    v6 = [v3 decodeArrayOfDateComponents];
    v7 = [v5 numberWithUnsignedInteger:HMDaysOfTheWeekFromDateComponents()];
    [(_MKFTimerTrigger *)self setPrimitiveValue:v7 forKey:@"recurrenceDays"];
  }
LABEL_5:
  v8 = [(_MKFTimerTrigger *)self significantEventOffsetSeconds];
  if (!v8)
  {
    v9 = [(_MKFTimerTrigger *)self significantEventOffset];

    if (!v9) {
      return;
    }
    v10 = NSNumber;
    v8 = [(_MKFTimerTrigger *)self significantEventOffset];
    v11 = [v8 decodeDateComponents];
    v12 = objc_msgSend(v10, "numberWithInteger:", HMDTimeOffsetFromDateComponents(v11, 0));
    [(_MKFTimerTrigger *)self setPrimitiveValue:v12 forKey:@"significantEventOffsetSeconds"];
  }
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E53A7F0;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_127107 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_127107, &__block_literal_global_127108);
  }
  v2 = (void *)homeRelation__hmf_once_v1_127109;
  return (NSPredicate *)v2;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFTimerTrigger"];
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end
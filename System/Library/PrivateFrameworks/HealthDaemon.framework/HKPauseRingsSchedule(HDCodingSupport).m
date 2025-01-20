@interface HKPauseRingsSchedule(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport;
- (HDCodablePauseRingsSchedule)codableRepresentationForSync;
@end

@implementation HKPauseRingsSchedule(HDCodingSupport)

+ (id)createWithCodable:()HDCodingSupport
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = (void *)[[a1 alloc] _init];
    if ([v5 applyToObject:v6])
    {
      uint64_t v7 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
      v9 = objc_msgSend(v6, "_validateWithConfiguration:", v7, v8);
      if (v9) {
        v10 = 0;
      }
      else {
        v10 = v6;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (HDCodablePauseRingsSchedule)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodablePauseRingsSchedule);
  v5.receiver = a1;
  v5.super_class = (Class)&off_1F187B138;
  v3 = objc_msgSendSuper2(&v5, sel_codableRepresentationForSync);
  [(HDCodablePauseRingsSchedule *)v2 setSample:v3];
  -[HDCodablePauseRingsSchedule setStartDateIndex:](v2, "setStartDateIndex:", [a1 startDateIndex]);
  -[HDCodablePauseRingsSchedule setEndDateIndex:](v2, "setEndDateIndex:", [a1 endDateIndex]);

  return v2;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4 = a3;
  objc_super v5 = [a1 codableRepresentationForSync];
  if (v5) {
    [v4 addPauseRingsSchedules:v5];
  }

  return v5 != 0;
}

@end
@interface HKMedicationDoseEvent(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport;
- (HDCodableMedicationDoseEvent)codableRepresentationForSync;
@end

@implementation HKMedicationDoseEvent(HDCodingSupport)

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

- (HDCodableMedicationDoseEvent)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableMedicationDoseEvent);
  v16.receiver = a1;
  v16.super_class = (Class)&off_1F1875E88;
  v3 = objc_msgSendSuper2(&v16, sel_codableRepresentationForSync);
  [(HDCodableMedicationDoseEvent *)v2 setSample:v3];

  -[HDCodableMedicationDoseEvent setLogOrigin:](v2, "setLogOrigin:", [a1 logOrigin]);
  id v4 = [a1 scheduleItemIdentifier];

  if (v4)
  {
    id v5 = [a1 scheduleItemIdentifier];
    [(HDCodableMedicationDoseEvent *)v2 setScheduleItemIdentifier:v5];
  }
  v6 = [a1 medicationUUID];
  uint64_t v7 = objc_msgSend(v6, "hk_dataForUUIDBytes");
  [(HDCodableMedicationDoseEvent *)v2 setMedicationUuid:v7];

  uint64_t v8 = [a1 medicationIdentifier];
  [(HDCodableMedicationDoseEvent *)v2 setMedicationIdentifier:v8];
  v9 = [a1 scheduledDoseQuantity];

  if (v9)
  {
    v10 = [a1 scheduledDoseQuantity];
    [v10 doubleValue];
    -[HDCodableMedicationDoseEvent setScheduledDoseQuantity:](v2, "setScheduledDoseQuantity:");
  }
  id v11 = [a1 doseQuantity];

  if (v11)
  {
    v12 = [a1 doseQuantity];
    [v12 doubleValue];
    -[HDCodableMedicationDoseEvent setDoseQuantity:](v2, "setDoseQuantity:");
  }
  v13 = [a1 scheduledDate];

  if (v13)
  {
    v14 = [a1 scheduledDate];
    [v14 timeIntervalSinceReferenceDate];
    -[HDCodableMedicationDoseEvent setScheduledDate:](v2, "setScheduledDate:");
  }
  -[HDCodableMedicationDoseEvent setStatus:](v2, "setStatus:", [a1 status]);

  return v2;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4 = a3;
  id v5 = [a1 codableRepresentationForSync];
  if (v5) {
    [v4 addMedicationDoseEvent:v5];
  }

  return v5 != 0;
}

@end
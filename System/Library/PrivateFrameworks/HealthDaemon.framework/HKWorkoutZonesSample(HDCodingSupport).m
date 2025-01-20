@interface HKWorkoutZonesSample(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport;
- (HDCodableWorkoutZones)codableRepresentationForSync;
@end

@implementation HKWorkoutZonesSample(HDCodingSupport)

- (HDCodableWorkoutZones)codableRepresentationForSync
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(HDCodableWorkoutZones);
  v11.receiver = a1;
  v11.super_class = (Class)&off_1F187DBF8;
  v3 = objc_msgSendSuper2(&v11, sel_codableRepresentationForSync);
  [(HDCodableWorkoutZones *)v2 setSample:v3];

  v4 = (void *)MEMORY[0x1E4F28DB0];
  v5 = [a1 zones];
  id v10 = 0;
  v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v10];
  id v7 = v10;

  if (!v6)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "Error archiving zones: %@", buf, 0xCu);
    }
  }
  [(HDCodableWorkoutZones *)v2 setZones:v6];

  return v2;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4 = a3;
  v5 = [a1 codableRepresentationForSync];
  if (v5) {
    [v4 addWorkoutZones:v5];
  }

  return v5 != 0;
}

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
        id v10 = 0;
      }
      else {
        id v10 = v6;
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

@end
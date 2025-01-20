@interface HKUserDomainConceptLocalizedString(HDSyncSupport)
+ (id)createWithCodable:()HDSyncSupport;
- (HDCodableUserDomainConceptLocalizedStringProperty)codableRepresentationForSync;
@end

@implementation HKUserDomainConceptLocalizedString(HDSyncSupport)

- (HDCodableUserDomainConceptLocalizedStringProperty)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableUserDomainConceptLocalizedStringProperty);
  -[HDCodableUserDomainConceptLocalizedStringProperty setType:](v2, "setType:", [a1 type]);
  -[HDCodableUserDomainConceptLocalizedStringProperty setVersion:](v2, "setVersion:", [a1 version]);
  [a1 timestamp];
  -[HDCodableUserDomainConceptLocalizedStringProperty setTimestamp:](v2, "setTimestamp:");
  v3 = [a1 stringValue];
  [(HDCodableUserDomainConceptLocalizedStringProperty *)v2 setStringValue:v3];

  v4 = [a1 locale];
  [(HDCodableUserDomainConceptLocalizedStringProperty *)v2 setLocale:v4];

  -[HDCodableUserDomainConceptLocalizedStringProperty setDeleted:](v2, "setDeleted:", [a1 isDeleted]);

  return v2;
}

+ (id)createWithCodable:()HDSyncSupport
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v4 = [v3 type];
    uint64_t v5 = [v3 version];
    [v3 timestamp];
    double v7 = v6;
    v8 = [v3 stringValue];
    v9 = [v3 locale];
    uint64_t v10 = [v3 deleted];
    if (v8 && v9)
    {
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F2B650]) initWithType:v4 stringValue:v8 locale:v9 version:v5 timestamp:v10 deleted:v7];
    }
    else
    {
      _HKInitializeLogging();
      v12 = HKLogHealthOntology();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);

      if (v13)
      {
        v14 = HKLogHealthOntology();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v16 = 138543874;
          uint64_t v17 = objc_opt_class();
          __int16 v18 = 2114;
          v19 = v8;
          __int16 v20 = 2114;
          v21 = v9;
          _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_INFO, "Decoded invalid %{public}@ with stringValue = %{public}@, locale = %{public}@", (uint8_t *)&v16, 0x20u);
        }
      }
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
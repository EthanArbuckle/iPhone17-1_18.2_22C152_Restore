@interface HKUserDomainConceptNamedQuantity(HDSyncSupport)
+ (id)createWithCodable:()HDSyncSupport;
- (HDCodableUserDomainConceptNamedQuantity)codableRepresentationForSync;
@end

@implementation HKUserDomainConceptNamedQuantity(HDSyncSupport)

- (HDCodableUserDomainConceptNamedQuantity)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableUserDomainConceptNamedQuantity);
  v3 = [a1 name];
  [(HDCodableUserDomainConceptNamedQuantity *)v2 setName:v3];

  v4 = [a1 quantity];
  [v4 _value];
  -[HDCodableUserDomainConceptNamedQuantity setValue:](v2, "setValue:");

  v5 = [a1 quantity];
  v6 = [v5 _unit];
  v7 = [v6 unitString];
  [(HDCodableUserDomainConceptNamedQuantity *)v2 setUnit:v7];

  -[HDCodableUserDomainConceptNamedQuantity setType:](v2, "setType:", [a1 type]);
  -[HDCodableUserDomainConceptNamedQuantity setVersion:](v2, "setVersion:", [a1 version]);
  [a1 timestamp];
  -[HDCodableUserDomainConceptNamedQuantity setTimestamp:](v2, "setTimestamp:");
  -[HDCodableUserDomainConceptNamedQuantity setDeleted:](v2, "setDeleted:", [a1 isDeleted]);

  return v2;
}

+ (id)createWithCodable:()HDSyncSupport
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    v4 = [v3 name];
    [v3 value];
    double v6 = v5;
    v7 = [v3 unit];
    if (v7)
    {
      uint64_t v8 = [v3 type];
      uint64_t v9 = [v3 version];
      [v3 timestamp];
      double v11 = v10;
      uint64_t v12 = [v3 deleted];
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F2B658]) initWithName:v4 value:v7 unitString:v8 type:v9 version:v12 timestamp:v6 deleted:v11];
    }
    else
    {
      _HKInitializeLogging();
      v14 = HKLogHealthOntology();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

      if (v15)
      {
        v16 = HKLogHealthOntology();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          int v18 = 138543874;
          uint64_t v19 = objc_opt_class();
          __int16 v20 = 2048;
          double v21 = v6;
          __int16 v22 = 2114;
          uint64_t v23 = 0;
          _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_INFO, "Decoded invalid %{public}@ with value = %f, unitString = %{public}@", (uint8_t *)&v18, 0x20u);
        }
      }
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
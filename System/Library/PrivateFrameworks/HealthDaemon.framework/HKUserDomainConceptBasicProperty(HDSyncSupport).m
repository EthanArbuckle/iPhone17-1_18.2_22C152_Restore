@interface HKUserDomainConceptBasicProperty(HDSyncSupport)
+ (id)createWithCodable:()HDSyncSupport;
- (HDCodableUserDomainConceptProperty)codableRepresentationForSync;
@end

@implementation HKUserDomainConceptBasicProperty(HDSyncSupport)

- (HDCodableUserDomainConceptProperty)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableUserDomainConceptProperty);
  -[HDCodableUserDomainConceptProperty setType:](v2, "setType:", [a1 type]);
  -[HDCodableUserDomainConceptProperty setVersion:](v2, "setVersion:", [a1 version]);
  [a1 timestamp];
  -[HDCodableUserDomainConceptProperty setTimestamp:](v2, "setTimestamp:");
  -[HDCodableUserDomainConceptProperty setValueType:](v2, "setValueType:", [a1 valueType]);
  switch([a1 valueType])
  {
    case 1:
      v3 = [a1 stringValue];
      [(HDCodableUserDomainConceptProperty *)v2 setStringValue:v3];
      goto LABEL_10;
    case 2:
      v3 = [a1 numberValue];
      [v3 doubleValue];
      goto LABEL_7;
    case 3:
      v3 = [a1 numberValue];
      -[HDCodableUserDomainConceptProperty setIntegerValue:](v2, "setIntegerValue:", [v3 integerValue]);
      goto LABEL_10;
    case 4:
      v3 = [a1 numberValue];
      -[HDCodableUserDomainConceptProperty setBoolValue:](v2, "setBoolValue:", [v3 BOOLValue]);
      goto LABEL_10;
    case 5:
      v3 = [a1 dateValue];
      [v3 timeIntervalSinceReferenceDate];
LABEL_7:
      -[HDCodableUserDomainConceptProperty setDoubleValue:](v2, "setDoubleValue:");
      goto LABEL_10;
    case 6:
      v3 = [a1 UUIDValue];
      v4 = objc_msgSend(v3, "hk_dataForUUIDBytes");
      [(HDCodableUserDomainConceptProperty *)v2 setDataValue:v4];

      goto LABEL_10;
    case 7:
      v3 = [a1 dataValue];
      [(HDCodableUserDomainConceptProperty *)v2 setDataValue:v3];
LABEL_10:

      break;
    default:
      break;
  }

  return v2;
}

+ (id)createWithCodable:()HDSyncSupport
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v4 = [v3 type];
    uint64_t v5 = [v3 version];
    [v3 timestamp];
    double v7 = v6;
    uint64_t v8 = [v3 valueType];
    switch(v8)
    {
      case 0:
        uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
        goto LABEL_14;
      case 1:
        uint64_t v9 = [v3 stringValue];
        goto LABEL_14;
      case 2:
        v12 = NSNumber;
        [v3 doubleValue];
        uint64_t v9 = objc_msgSend(v12, "numberWithDouble:");
        goto LABEL_14;
      case 3:
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "integerValue"));
        goto LABEL_14;
      case 4:
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "BOOLValue"));
        goto LABEL_14;
      case 5:
        v13 = (void *)MEMORY[0x1E4F1C9C8];
        [v3 doubleValue];
        uint64_t v9 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
        goto LABEL_14;
      case 6:
        v14 = (void *)MEMORY[0x1E4F29128];
        v15 = [v3 dataValue];
        v11 = objc_msgSend(v14, "hk_UUIDWithData:", v15);

        if (!v11) {
          goto LABEL_17;
        }
        goto LABEL_15;
      case 7:
        uint64_t v9 = [v3 dataValue];
LABEL_14:
        v11 = (void *)v9;
        if (!v9) {
          goto LABEL_17;
        }
LABEL_15:
        if (HKIsValidUserDomainConceptPropertyValueType())
        {
          v10 = (void *)[objc_alloc(MEMORY[0x1E4F2B638]) initWithType:v4 version:v5 timestamp:v8 valueType:v11 value:v7];
        }
        else
        {
LABEL_17:
          _HKInitializeLogging();
          v16 = HKLogHealthOntology();
          BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);

          if (v17)
          {
            v18 = HKLogHealthOntology();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              uint64_t v19 = objc_opt_class();
              v20 = HKStringFromUserDomainConceptPropertyValueType();
              int v23 = 138543874;
              uint64_t v24 = v19;
              __int16 v25 = 2114;
              v26 = v20;
              __int16 v27 = 2114;
              id v28 = (id)objc_opt_class();
              id v21 = v28;
              _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_INFO, "Decoded invalid %{public}@ with valueType = %{public}@, value of class %{public}@", (uint8_t *)&v23, 0x20u);
            }
          }
          v10 = 0;
        }

        break;
      default:
        v11 = 0;
        goto LABEL_17;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
@interface _HDSetCharacteristicJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (HKCharacteristicType)dataType;
- (_HDSetCharacteristicJournalEntry)initWithCoder:(id)a3;
- (id)value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HDSetCharacteristicJournalEntry

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v30 = a4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    id v9 = 0;
    uint64_t v29 = *(void *)v33;
    uint64_t v10 = *MEMORY[0x1E4F298B8];
    *(void *)&long long v7 = 138543874;
    long long v27 = v7;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        v12 = v9;
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "value", v27);
        v15 = [v13 dataType];
        v16 = [v15 identifier];
        if (![v16 isEqualToString:v10]) {
          goto LABEL_9;
        }
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          v16 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
          uint64_t v18 = objc_msgSend(v16, "hk_dateOfBirthDateComponentsWithDate:", v14);

          v14 = (void *)v18;
LABEL_9:
        }
        v19 = [v30 userCharacteristicsManager];
        id v31 = v12;
        char v20 = [v19 setUserCharacteristic:v14 forType:v15 error:&v31];
        id v9 = v31;

        if ((v20 & 1) == 0)
        {
          _HKInitializeLogging();
          v21 = (void *)*MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            v22 = v21;
            v23 = objc_opt_class();
            id v24 = v23;
            v25 = [v13 dataType];
            uint64_t v26 = [v25 code];
            *(_DWORD *)buf = v27;
            v37 = v23;
            __int16 v38 = 2048;
            uint64_t v39 = v26;
            __int16 v40 = 2114;
            id v41 = v9;
            _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Failed to set characteristic for type %ld, %{public}@", buf, 0x20u);
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
      if (!v8)
      {

        break;
      }
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDSetCharacteristicJournalEntry)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  id v9 = [v5 decodeObjectOfClasses:v8 forKey:@"value"];
  uint64_t v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"dataType"];
  v13.receiver = self;
  v13.super_class = (Class)_HDSetCharacteristicJournalEntry;
  v11 = [(HDJournalEntry *)&v13 initWithCoder:v5];

  if (v11)
  {
    objc_storeStrong(&v11->_value, v9);
    objc_storeStrong((id *)&v11->_dataType, v10);
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    v4 = v3;
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v5 = v7;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: encoding is not supported", (uint8_t *)&v6, 0xCu);
  }
}

- (id)value
{
  return self->_value;
}

- (HKCharacteristicType)dataType
{
  return self->_dataType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataType, 0);

  objc_storeStrong(&self->_value, 0);
}

@end
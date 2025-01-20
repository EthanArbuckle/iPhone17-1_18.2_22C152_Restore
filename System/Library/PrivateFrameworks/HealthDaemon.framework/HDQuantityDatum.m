@interface HDQuantityDatum
+ (BOOL)supportsSecureCoding;
+ (HDQuantityDatum)quantityDatumWithHKQuantityDatum:(id)a3 metadata:(id)a4;
+ (id)hdt_quantityDatumForType:(id)a3 startTime:(double)a4 endTime:(double)a5 value:(double)a6;
+ (id)quantityDataForDifferencesInData:(id)a3 baseDatum:(id)a4 unit:(id)a5 differenceHandler:(id)a6 intervalHandler:(id)a7;
- (BOOL)isEqual:(id)a3;
- (HDQuantityDatum)initWithCoder:(id)a3;
- (HDQuantityDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 quantity:(id)a5 metadata:(id)a6 resumeContextProvider:(id)a7;
- (HDQuantityDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 resumeContext:(id)a5 quantity:(id)a6;
- (HKQuantity)quantity;
- (NSDictionary)metadata;
- (id)datumForChangeSince:(id)a3 newIdentifier:(id)a4 newResumeContext:(id)a5;
- (id)description;
- (id)saveCompletion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSaveCompletion:(id)a3;
@end

@implementation HDQuantityDatum

- (HDQuantityDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 resumeContext:(id)a5 quantity:(id)a6
{
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__HDQuantityDatum_initWithIdentifier_dateInterval_resumeContext_quantity___block_invoke;
  v14[3] = &unk_1E62FFCD0;
  id v15 = v10;
  id v11 = v10;
  v12 = [(HDQuantityDatum *)self initWithIdentifier:a3 dateInterval:a4 quantity:a6 metadata:0 resumeContextProvider:v14];

  return v12;
}

- (HKQuantity)quantity
{
  return self->_quantity;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDQuantityDatum;
  id v4 = a3;
  [(HDDataCollectorSensorDatum *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_quantity, @"hdqd_qt", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_metadata forKey:@"hdqd_md"];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_saveCompletion, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_quantity, 0);
}

- (HDQuantityDatum)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDQuantityDatum;
  objc_super v5 = [(HDDataCollectorSensorDatum *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hdqd_qt"];
    quantity = v5->_quantity;
    v5->_quantity = (HKQuantity *)v6;

    v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureCodingClasses");
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"hdqd_md"];
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v9;
  }
  return v5;
}

+ (id)quantityDataForDifferencesInData:(id)a3 baseDatum:(id)a4 unit:(id)a5 differenceHandler:(id)a6 intervalHandler:(id)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v32 = a5;
  v13 = (double (**)(id, void *, id))a6;
  v14 = (void (**)(id, void *, id))a7;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v11;
  uint64_t v34 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  id v15 = 0;
  if (v34)
  {
    uint64_t v16 = *(void *)v37;
    uint64_t v30 = *(void *)v37;
    v31 = v13;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        v18 = v12;
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v20 = (void *)MEMORY[0x1C187C0E0]();
        id v12 = v19;
        if (v18)
        {
          double v21 = v13[2](v13, v18, v12);
          if (fabs(v21) >= 2.22044605e-16)
          {
            if (!v15) {
              id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            v22 = [HDQuantityDatum alloc];
            v23 = [MEMORY[0x1E4F29128] UUID];
            v14[2](v14, v18, v12);
            v25 = v24 = v14;
            [MEMORY[0x1E4F2B370] quantityWithUnit:v32 doubleValue:v21];
            v27 = v26 = v15;
            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __101__HDQuantityDatum_quantityDataForDifferencesInData_baseDatum_unit_differenceHandler_intervalHandler___block_invoke;
            v35[3] = &unk_1E62FFCD0;
            v35[4] = v12;
            v28 = [(HDQuantityDatum *)v22 initWithIdentifier:v23 dateInterval:v25 quantity:v27 metadata:0 resumeContextProvider:v35];

            id v15 = v26;
            v14 = v24;

            [v26 addObject:v28];
            uint64_t v16 = v30;
            v13 = v31;
          }
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v34);
  }

  return v15;
}

id __101__HDQuantityDatum_quantityDataForDifferencesInData_baseDatum_unit_differenceHandler_intervalHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v8 = 0;
  v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&v8];
  id v4 = v8;
  if (!v3)
  {
    _HKInitializeLogging();
    objc_super v5 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_FAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_fault_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_FAULT, "Failed to archive %{public}@ when generating resume context for persisted data: %{public}@", buf, 0x16u);
    }
  }

  return v3;
}

id __74__HDQuantityDatum_initWithIdentifier_dateInterval_resumeContext_quantity___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (HDQuantityDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 quantity:(id)a5 metadata:(id)a6 resumeContextProvider:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HDQuantityDatum;
  v14 = [(HDDataCollectorSensorDatum *)&v20 initWithIdentifier:a3 dateInterval:a4 resumeContextProvider:a7];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    quantity = v14->_quantity;
    v14->_quantity = (HKQuantity *)v15;

    uint64_t v17 = [v13 copy];
    metadata = v14->_metadata;
    v14->_metadata = (NSDictionary *)v17;
  }
  return v14;
}

- (id)datumForChangeSince:(id)a3 newIdentifier:(id)a4 newResumeContext:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v26 = self;
    goto LABEL_11;
  }
  __int16 v11 = [(HDQuantityDatum *)self quantity];
  id v12 = [v8 quantity];
  id v13 = [v12 _unit];
  char v14 = [v11 isCompatibleWithUnit:v13];

  if ((v14 & 1) == 0)
  {
    _HKInitializeLogging();
    v27 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
    {
      v44 = v27;
      v45 = [(HDQuantityDatum *)self quantity];
      v46 = [v45 _unit];
      v47 = [v8 quantity];
      v48 = [v47 _unit];
      int v49 = 138478083;
      v50 = v46;
      __int16 v51 = 2113;
      v52 = v48;
      _os_log_error_impl(&dword_1BCB7D000, v44, OS_LOG_TYPE_ERROR, "Couldn't subtract units of type %{private}@ from units of type %{private}@", (uint8_t *)&v49, 0x16u);
    }
    goto LABEL_9;
  }
  uint64_t v15 = [v8 dateInterval];
  uint64_t v16 = [v15 endDate];
  uint64_t v17 = [(HDDataCollectorSensorDatum *)self dateInterval];
  v18 = [v17 endDate];
  int v19 = objc_msgSend(v16, "hk_isAfterDate:", v18);

  if (v19)
  {
    _HKInitializeLogging();
    objc_super v20 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
    {
      double v21 = v20;
      v22 = [v8 dateInterval];
      v23 = [v22 endDate];
      v24 = [(HDDataCollectorSensorDatum *)self dateInterval];
      v25 = [v24 endDate];
      int v49 = 138478083;
      v50 = v23;
      __int16 v51 = 2113;
      v52 = v25;
      _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "Minuend date %{private}@ must occur at the same time or before subtrahend date %{private}@", (uint8_t *)&v49, 0x16u);
    }
LABEL_9:
    v26 = 0;
    goto LABEL_11;
  }
  v28 = [(HDQuantityDatum *)self quantity];
  v29 = [v28 _unit];

  uint64_t v30 = [v8 quantity];
  [v30 doubleValueForUnit:v29];
  double v32 = v31;

  v33 = [(HDQuantityDatum *)self quantity];
  [v33 doubleValueForUnit:v29];
  double v35 = v34;

  long long v36 = [MEMORY[0x1E4F2B370] quantityWithUnit:v29 doubleValue:v35 - v32];
  id v37 = objc_alloc(MEMORY[0x1E4F28C18]);
  long long v38 = [v8 dateInterval];
  long long v39 = [v38 endDate];
  v40 = [(HDDataCollectorSensorDatum *)self dateInterval];
  uint64_t v41 = [v40 endDate];
  v42 = (void *)[v37 initWithStartDate:v39 endDate:v41];

  v26 = [[HDQuantityDatum alloc] initWithIdentifier:v9 dateInterval:v42 resumeContext:v10 quantity:v36];
LABEL_11:

  return v26;
}

+ (HDQuantityDatum)quantityDatumWithHKQuantityDatum:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [HDQuantityDatum alloc];
  id v8 = [v5 UUID];
  id v9 = [v5 dateInterval];
  id v10 = [v5 quantity];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__HDQuantityDatum_quantityDatumWithHKQuantityDatum_metadata___block_invoke;
  v14[3] = &unk_1E62FFCD0;
  id v15 = v5;
  id v11 = v5;
  id v12 = [(HDQuantityDatum *)v7 initWithIdentifier:v8 dateInterval:v9 quantity:v10 metadata:v6 resumeContextProvider:v14];

  return v12;
}

uint64_t __61__HDQuantityDatum_quantityDatumWithHKQuantityDatum_metadata___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resumeContext];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  uint64_t v3 = [(HKQuantity *)self->_quantity hash];
  return [(NSDictionary *)self->_metadata hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  v11.receiver = self;
  v11.super_class = (Class)HDQuantityDatum;
  if (![(HDDataCollectorSensorDatum *)&v11 isEqual:v4]) {
    goto LABEL_9;
  }
  quantity = self->_quantity;
  id v6 = (HKQuantity *)v4[5];
  if (quantity != v6 && (!v6 || !-[HKQuantity isEqual:](quantity, "isEqual:"))) {
    goto LABEL_9;
  }
  metadata = self->_metadata;
  id v8 = (NSDictionary *)v4[6];
  if (metadata == v8)
  {
    char v9 = 1;
    goto LABEL_10;
  }
  if (v8) {
    char v9 = -[NSDictionary isEqual:](metadata, "isEqual:");
  }
  else {
LABEL_9:
  }
    char v9 = 0;
LABEL_10:

  return v9;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(HDDataCollectorSensorDatum *)self datumIdentifier];
  id v5 = [(HDDataCollectorSensorDatum *)self dateInterval];
  id v6 = [v3 stringWithFormat:@"<%@: %@, quantity: %@>", v4, v5, self->_quantity];

  return v6;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (id)saveCompletion
{
  return self->_saveCompletion;
}

- (void)setSaveCompletion:(id)a3
{
}

+ (id)hdt_quantityDatumForType:(id)a3 startTime:(double)a4 endTime:(double)a5 value:(double)a6
{
  char v9 = (void *)MEMORY[0x1E4F2B370];
  id v10 = [a3 canonicalUnit];
  objc_super v11 = [v9 quantityWithUnit:v10 doubleValue:a6];

  id v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a4];
  id v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a5];
  char v14 = [HDQuantityDatum alloc];
  id v15 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v12 endDate:v13];
  uint64_t v17 = [(HDQuantityDatum *)v14 initWithIdentifier:v15 dateInterval:v16 resumeContext:0 quantity:v11];

  return v17;
}

@end
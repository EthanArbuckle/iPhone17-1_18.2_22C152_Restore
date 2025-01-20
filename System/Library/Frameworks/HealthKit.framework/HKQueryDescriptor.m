@interface HKQueryDescriptor
+ (BOOL)supportsSecureCoding;
+ (HKQueryDescriptor)queryDescriptorWithSampleType:(id)a3;
+ (HKQueryDescriptor)queryDescriptorWithSampleType:(id)a3 predicate:(id)a4;
+ (id)allergiesDescriptions;
+ (id)allergiesDescriptionsWithPredicate:(id)a3;
+ (id)clinicalNotesDescriptions;
+ (id)clinicalNotesDescriptionsWithPredicate:(id)a3;
+ (id)conditionsDescriptions;
+ (id)conditionsDescriptionsWithPredicate:(id)a3;
+ (id)coverageDescriptions;
+ (id)coverageDescriptionsWithPredicate:(id)a3;
+ (id)immunizationsDescriptions;
+ (id)immunizationsDescriptionsWithPredicate:(id)a3;
+ (id)labsDescriptions;
+ (id)labsDescriptionsWithPredicate:(id)a3;
+ (id)medicalRecordDescriptionsWithPredicate:(id)a3 futureMigrationsEnabled:(BOOL)a4;
+ (id)medicationsDescriptions;
+ (id)medicationsDescriptionsWithPredicate:(id)a3;
+ (id)proceduresDescriptions;
+ (id)proceduresDescriptionsWithPredicate:(id)a3;
+ (id)vitalsDescriptions;
+ (id)vitalsDescriptionsWithPredicate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HKQueryDescriptor)init;
- (HKQueryDescriptor)initWithCoder:(id)a3;
- (HKQueryDescriptor)initWithSampleType:(HKSampleType *)sampleType predicate:(NSPredicate *)predicate;
- (HKSampleType)sampleType;
- (NSPredicate)predicate;
- (_HKFilter)_filter;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKQueryDescriptor

+ (HKQueryDescriptor)queryDescriptorWithSampleType:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSampleType:v4 predicate:0];

  return (HKQueryDescriptor *)v5;
}

+ (HKQueryDescriptor)queryDescriptorWithSampleType:(id)a3 predicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithSampleType:v7 predicate:v6];

  return (HKQueryDescriptor *)v8;
}

- (HKQueryDescriptor)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKQueryDescriptor)initWithSampleType:(HKSampleType *)sampleType predicate:(NSPredicate *)predicate
{
  id v6 = sampleType;
  id v7 = predicate;
  v17.receiver = self;
  v17.super_class = (Class)HKQueryDescriptor;
  v8 = [(HKQueryDescriptor *)&v17 init];
  if (v8)
  {
    uint64_t v9 = [(HKSampleType *)v6 copy];
    v10 = v8->_sampleType;
    v8->_sampleType = (HKSampleType *)v9;

    uint64_t v11 = [(NSPredicate *)v7 copy];
    v12 = v8->_predicate;
    v8->_predicate = (NSPredicate *)v11;

    v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v8->_sampleType];
    uint64_t v14 = [(NSPredicate *)v7 hk_filterRepresentationForDataTypes:v13];
    filter = v8->_filter;
    v8->_filter = (_HKFilter *)v14;
  }
  return v8;
}

- (unint64_t)hash
{
  v3 = [(HKQueryDescriptor *)self sampleType];
  uint64_t v4 = [v3 hash];
  v5 = [(HKQueryDescriptor *)self _filter];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKQueryDescriptor *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(HKQueryDescriptor *)self sampleType];
      uint64_t v7 = [(HKQueryDescriptor *)v5 sampleType];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        uint64_t v9 = [(HKQueryDescriptor *)v5 sampleType];
        if (!v9) {
          goto LABEL_14;
        }
        v10 = (void *)v9;
        uint64_t v11 = [(HKQueryDescriptor *)self sampleType];
        v12 = [(HKQueryDescriptor *)v5 sampleType];
        int v13 = [v11 isEqual:v12];

        if (!v13) {
          goto LABEL_15;
        }
      }
      unint64_t v6 = [(HKQueryDescriptor *)self _filter];
      uint64_t v15 = [(HKQueryDescriptor *)v5 _filter];
      if (v6 == (void *)v15)
      {

LABEL_17:
        BOOL v14 = 1;
        goto LABEL_18;
      }
      v8 = (void *)v15;
      uint64_t v16 = [(HKQueryDescriptor *)v5 _filter];
      if (v16)
      {
        objc_super v17 = (void *)v16;
        v18 = [(HKQueryDescriptor *)self _filter];
        v19 = [(HKQueryDescriptor *)v5 _filter];
        char v20 = [v18 isEqual:v19];

        if (v20) {
          goto LABEL_17;
        }
LABEL_15:
        BOOL v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    BOOL v14 = 0;
  }
LABEL_19:

  return v14;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HKQueryDescriptor *)self sampleType];
  unint64_t v6 = [(HKQueryDescriptor *)self predicate];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %@, Predicate: %@>", v4, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKQueryDescriptor)initWithCoder:(id)a3
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SampleType"];
  sampleType = self->_sampleType;
  self->_sampleType = v5;

  uint64_t v7 = [(HKQueryDescriptor *)self initWithSampleType:self->_sampleType predicate:0];
  if (v7)
  {
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Filter"];
    filter = v7->_filter;
    v7->_filter = (_HKFilter *)v8;

    if (!v7->_filter)
    {
      v10 = (void *)MEMORY[0x1E4F1CAD0];
      v18[0] = objc_opt_class();
      v18[1] = objc_opt_class();
      v18[2] = objc_opt_class();
      v18[3] = objc_opt_class();
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
      v12 = [v10 setWithArray:v11];
      int v13 = [v4 decodeObjectOfClasses:v12 forKey:@"Predicate"];

      if (v13)
      {
        BOOL v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v7->_sampleType];
        uint64_t v15 = objc_msgSend(v13, "hk_filterRepresentationForDataTypes:", v14);
        uint64_t v16 = v7->_filter;
        v7->_filter = (_HKFilter *)v15;
      }
    }
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HKQueryDescriptor *)self sampleType];
  [v4 encodeObject:v5 forKey:@"SampleType"];

  id v6 = [(HKQueryDescriptor *)self _filter];
  [v4 encodeObject:v6 forKey:@"Filter"];
}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (_HKFilter)_filter
{
  return self->_filter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_predicate, 0);

  objc_storeStrong((id *)&self->_sampleType, 0);
}

+ (id)medicalRecordDescriptionsWithPredicate:(id)a3 futureMigrationsEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v4) {
    uint64_t v6 = 8;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = +[HKSampleType medicalRecordTypesWithOptions:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __99__HKQueryDescriptor_HealthRecords__medicalRecordDescriptionsWithPredicate_futureMigrationsEnabled___block_invoke;
  v11[3] = &unk_1E58C89F8;
  id v12 = v5;
  id v8 = v5;
  uint64_t v9 = objc_msgSend(v7, "hk_map:", v11);

  return v9;
}

HKQueryDescriptor *__99__HKQueryDescriptor_HealthRecords__medicalRecordDescriptionsWithPredicate_futureMigrationsEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKQueryDescriptor queryDescriptorWithSampleType:a2 predicate:*(void *)(a1 + 32)];
}

+ (id)allergiesDescriptions
{
  return (id)[a1 allergiesDescriptionsWithPredicate:0];
}

+ (id)allergiesDescriptionsWithPredicate:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = +[HKAllergyRecordType allergyRecordType];
  id v5 = +[HKQueryDescriptor queryDescriptorWithSampleType:v4 predicate:v3];

  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

+ (id)clinicalNotesDescriptions
{
  return (id)[a1 clinicalNotesDescriptionsWithPredicate:0];
}

+ (id)clinicalNotesDescriptionsWithPredicate:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = +[HKClinicalNoteRecordType clinicalNoteRecordType];
  id v5 = +[HKQueryDescriptor queryDescriptorWithSampleType:v4 predicate:v3];

  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

+ (id)conditionsDescriptions
{
  return (id)[a1 conditionsDescriptionsWithPredicate:0];
}

+ (id)conditionsDescriptionsWithPredicate:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = +[HKConditionRecordType conditionRecordType];
  id v5 = +[HKQueryDescriptor queryDescriptorWithSampleType:v4 predicate:v3];

  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

+ (id)coverageDescriptions
{
  return (id)[a1 coverageDescriptionsWithPredicate:0];
}

+ (id)coverageDescriptionsWithPredicate:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = +[HKCoverageRecordType coverageRecordType];
  id v5 = +[HKQueryDescriptor queryDescriptorWithSampleType:v4 predicate:v3];

  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

+ (id)immunizationsDescriptions
{
  return (id)[a1 immunizationsDescriptionsWithPredicate:0];
}

+ (id)immunizationsDescriptionsWithPredicate:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = +[HKVaccinationRecordType vaccinationRecordType];
  id v5 = +[HKQueryDescriptor queryDescriptorWithSampleType:v4 predicate:v3];

  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

+ (id)labsDescriptions
{
  return (id)[a1 labsDescriptionsWithPredicate:0];
}

+ (id)labsDescriptionsWithPredicate:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[HKQuery predicateForDiagnosticTestResultCategory:@"laboratory"];
  id v5 = (void *)v4;
  if (v3)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28BA0];
    v16[0] = v4;
    v16[1] = v3;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    uint64_t v8 = [v6 andPredicateWithSubpredicates:v7];

    id v5 = (void *)v8;
  }
  uint64_t v9 = +[HKDiagnosticTestReportType diagnosticTestReportType];
  v10 = +[HKQueryDescriptor queryDescriptorWithSampleType:v9 predicate:v3];
  v15[0] = v10;
  uint64_t v11 = +[HKDiagnosticTestResultType diagnosticTestResultType];
  id v12 = +[HKQueryDescriptor queryDescriptorWithSampleType:v11 predicate:v5];
  v15[1] = v12;
  int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];

  return v13;
}

+ (id)medicationsDescriptions
{
  return (id)[a1 medicationsDescriptionsWithPredicate:0];
}

+ (id)medicationsDescriptionsWithPredicate:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[HKMedicationDispenseRecordType medicationDispenseRecordType];
  id v5 = +[HKQueryDescriptor queryDescriptorWithSampleType:v4 predicate:v3];
  uint64_t v6 = +[HKMedicationOrderType medicationOrderType];
  uint64_t v7 = +[HKQueryDescriptor queryDescriptorWithSampleType:v6 predicate:v3];
  v12[1] = v7;
  uint64_t v8 = +[HKMedicationRecordType medicationRecordType];
  uint64_t v9 = +[HKQueryDescriptor queryDescriptorWithSampleType:v8 predicate:v3];

  v12[2] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];

  return v10;
}

+ (id)proceduresDescriptions
{
  return (id)[a1 proceduresDescriptionsWithPredicate:0];
}

+ (id)proceduresDescriptionsWithPredicate:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[HKProcedureRecordType procedureRecordType];
  id v5 = +[HKQueryDescriptor queryDescriptorWithSampleType:v4 predicate:v3];

  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

+ (id)vitalsDescriptions
{
  return (id)[a1 vitalsDescriptionsWithPredicate:0];
}

+ (id)vitalsDescriptionsWithPredicate:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[HKQuery predicateForDiagnosticTestResultCategory:@"vital-signs"];
  id v5 = (void *)v4;
  if (v3)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28BA0];
    v14[0] = v4;
    v14[1] = v3;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    uint64_t v8 = [v6 andPredicateWithSubpredicates:v7];

    id v5 = (void *)v8;
  }
  uint64_t v9 = +[HKDiagnosticTestResultType diagnosticTestResultType];
  v10 = +[HKQueryDescriptor queryDescriptorWithSampleType:v9 predicate:v5];
  int v13 = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];

  return v11;
}

@end
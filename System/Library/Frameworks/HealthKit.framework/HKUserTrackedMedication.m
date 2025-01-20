@interface HKUserTrackedMedication
+ (BOOL)isConcreteUserTrackedConceptClass;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)_newUserTrackedMedicationWithNickname:(char)a3 isArchived:(char)a4 hasSchedule:(void *)a5 medication:(uint64_t)a6 device:(void *)a7 config:;
+ (id)userTrackedMedicationWithNickname:(id)a3 isArchived:(BOOL)a4 hasSchedule:(BOOL)a5 medication:(id)a6 device:(id)a7;
- (BOOL)hasSchedule;
- (BOOL)isArchived;
- (BOOL)isEquivalent:(id)a3;
- (HKMedication)medication;
- (HKUserTrackedMedication)init;
- (HKUserTrackedMedication)initWithCoder:(id)a3;
- (NSString)nickname;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKUserTrackedMedication

- (HKUserTrackedMedication)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (id)userTrackedMedicationWithNickname:(id)a3 isArchived:(BOOL)a4 hasSchedule:(BOOL)a5 medication:(id)a6 device:(id)a7
{
  id v7 = +[HKUserTrackedMedication _newUserTrackedMedicationWithNickname:isArchived:hasSchedule:medication:device:config:]((uint64_t)a1, a3, a4, a5, a6, (uint64_t)a6, 0);

  return v7;
}

+ (id)_newUserTrackedMedicationWithNickname:(char)a3 isArchived:(char)a4 hasSchedule:(void *)a5 medication:(uint64_t)a6 device:(void *)a7 config:
{
  id v11 = a2;
  id v12 = a5;
  id v13 = a7;
  v14 = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__HKUserTrackedMedication__newUserTrackedMedicationWithNickname_isArchived_hasSchedule_medication_device_config___block_invoke;
  aBlock[3] = &unk_1E58C8BA8;
  char v27 = a3;
  char v28 = a4;
  id v24 = v11;
  id v25 = v12;
  id v26 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  v18 = _Block_copy(aBlock);
  v19 = +[HKObjectType userTrackedConceptTypeForIdentifier:@"HKUserTrackedConceptTypeIdentifierMedication"];
  v22.receiver = v14;
  v22.super_class = (Class)&OBJC_METACLASS___HKUserTrackedMedication;
  id v20 = objc_msgSendSuper2(&v22, sel__newUserTrackedConceptWithType_config_, v19, v18);

  return v20;
}

void __113__HKUserTrackedMedication__newUserTrackedMedicationWithNickname_isArchived_hasSchedule_medication_device_config___block_invoke(uint64_t a1, void *a2)
{
  v8 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  uint64_t v4 = (void *)v8[3];
  v8[3] = v3;

  *((unsigned char *)v8 + 16) = *(unsigned char *)(a1 + 56);
  *((unsigned char *)v8 + 17) = *(unsigned char *)(a1 + 57);
  uint64_t v5 = [*(id *)(a1 + 40) copy];
  v6 = (void *)v8[4];
  v8[4] = v5;

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

+ (BOOL)isConcreteUserTrackedConceptClass
{
  return 1;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  uint64_t v4 = (HKUserTrackedMedication *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      v6 = [(HKUserTrackedMedication *)v5 nickname];
      uint64_t v7 = [(HKUserTrackedMedication *)self nickname];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        uint64_t v9 = [(HKUserTrackedMedication *)self nickname];
        if (!v9) {
          goto LABEL_16;
        }
        v10 = (void *)v9;
        id v11 = [(HKUserTrackedMedication *)v5 nickname];
        id v12 = [(HKUserTrackedMedication *)self nickname];
        int v13 = [v11 isEqualToString:v12];

        if (!v13) {
          goto LABEL_17;
        }
      }
      BOOL v15 = [(HKUserTrackedMedication *)v5 isArchived];
      if (v15 != [(HKUserTrackedMedication *)self isArchived]) {
        goto LABEL_17;
      }
      BOOL v16 = [(HKUserTrackedMedication *)v5 hasSchedule];
      if (v16 != [(HKUserTrackedMedication *)self hasSchedule]) {
        goto LABEL_17;
      }
      v6 = [(HKUserTrackedMedication *)v5 medication];
      uint64_t v17 = [(HKUserTrackedMedication *)self medication];
      if (v6 == (void *)v17)
      {

LABEL_21:
        BOOL v14 = 1;
        goto LABEL_18;
      }
      v8 = (void *)v17;
      uint64_t v18 = [(HKUserTrackedMedication *)self medication];
      if (v18)
      {
        v19 = (void *)v18;
        id v20 = [(HKUserTrackedMedication *)v5 medication];
        v21 = [(HKUserTrackedMedication *)self medication];
        char v22 = [v20 isEqual:v21];

        if (v22) {
          goto LABEL_21;
        }
LABEL_17:
        BOOL v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_16:

      goto LABEL_17;
    }
    BOOL v14 = 0;
  }
LABEL_19:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKUserTrackedMedication)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKUserTrackedMedication;
  uint64_t v5 = [(HKUserTrackedConcept *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NicknameKey"];
    nickname = v5->_nickname;
    v5->_nickname = (NSString *)v6;

    v5->_isArchived = [v4 decodeBoolForKey:@"IsArchivedKey"];
    v5->_hasSchedule = [v4 decodeBoolForKey:@"HasScheduleKey"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MedicationKey"];
    medication = v5->_medication;
    v5->_medication = (HKMedication *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  nickname = self->_nickname;
  id v5 = a3;
  [v5 encodeObject:nickname forKey:@"NicknameKey"];
  [v5 encodeBool:self->_isArchived forKey:@"IsArchivedKey"];
  [v5 encodeBool:self->_hasSchedule forKey:@"HasScheduleKey"];
  [v5 encodeObject:self->_medication forKey:@"MedicationKey"];
}

- (NSString)nickname
{
  return self->_nickname;
}

- (BOOL)isArchived
{
  return self->_isArchived;
}

- (BOOL)hasSchedule
{
  return self->_hasSchedule;
}

- (HKMedication)medication
{
  return self->_medication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medication, 0);

  objc_storeStrong((id *)&self->_nickname, 0);
}

@end
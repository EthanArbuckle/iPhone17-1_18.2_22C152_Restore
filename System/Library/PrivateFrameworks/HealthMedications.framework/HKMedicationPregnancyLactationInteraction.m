@interface HKMedicationPregnancyLactationInteraction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKMedicationPregnancyLactationInteraction)init;
- (HKMedicationPregnancyLactationInteraction)initWithCoder:(id)a3;
- (HKMedicationPregnancyLactationInteraction)initWithMedication:(id)a3 interactionType:(int64_t)a4;
- (HKMedicationUserDomainConcept)medication;
- (id)description;
- (int64_t)interactionType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setInteractionType:(int64_t)a3;
- (void)setMedication:(id)a3;
@end

@implementation HKMedicationPregnancyLactationInteraction

- (HKMedicationPregnancyLactationInteraction)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicationPregnancyLactationInteraction)initWithMedication:(id)a3 interactionType:(int64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKMedicationPregnancyLactationInteraction.m", 30, @"Invalid parameter not satisfying: %@", @"medication != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)HKMedicationPregnancyLactationInteraction;
  v9 = [(HKMedicationPregnancyLactationInteraction *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_medication, a3);
    v10->_interactionType = a4;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HKMedicationUserDomainConcept *)self->_medication firstConceptIdentifier];
  v6 = [v3 stringWithFormat:@"<%@:%p (%ld, %ld)>", v4, self, objc_msgSend(v5, "rawIdentifier"), self->_interactionType];

  return v6;
}

- (unint64_t)hash
{
  return self->_interactionType ^ [(HKMedicationUserDomainConcept *)self->_medication hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMedicationPregnancyLactationInteraction *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      medication = self->_medication;
      v7 = v5->_medication;
      BOOL v8 = (medication == v7 || v7 && -[HKMedicationUserDomainConcept isEqual:](medication, "isEqual:"))
        && self->_interactionType == v5->_interactionType;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  medication = self->_medication;
  id v5 = a3;
  [v5 encodeObject:medication forKey:@"Medication"];
  [v5 encodeInteger:self->_interactionType forKey:@"InteractionType"];
}

- (HKMedicationPregnancyLactationInteraction)initWithCoder:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMedicationPregnancyLactationInteraction;
  v6 = [(HKMedicationPregnancyLactationInteraction *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"Medication"];
    medication = v6->_medication;
    v6->_medication = (HKMedicationUserDomainConcept *)v7;

    v6->_interactionType = [v5 decodeIntegerForKey:@"InteractionType"];
    if (!v6->_medication)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:v6 file:@"HKMedicationPregnancyLactationInteraction.m" lineNumber:94 description:@"Medication should not be nil"];
    }
  }

  return v6;
}

- (HKMedicationUserDomainConcept)medication
{
  return self->_medication;
}

- (void)setMedication:(id)a3
{
}

- (int64_t)interactionType
{
  return self->_interactionType;
}

- (void)setInteractionType:(int64_t)a3
{
  self->_interactionType = a3;
}

- (void).cxx_destruct
{
}

@end
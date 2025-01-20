@interface HKMedicationInteractionResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKConceptIdentifier)firstIdentifier;
- (HKConceptIdentifier)secondIdentifier;
- (HKMedicationInteractionResult)init;
- (HKMedicationInteractionResult)initWithCoder:(id)a3;
- (HKMedicationInteractionResult)initWithFirstConceptIdentifier:(id)a3 secondConceptIdentifier:(id)a4 interactionType:(unint64_t)a5 interactions:(id)a6;
- (NSSet)interactions;
- (id)conceptIdentifiers;
- (id)description;
- (unint64_t)hash;
- (unint64_t)interactionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicationInteractionResult

- (HKMedicationInteractionResult)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicationInteractionResult)initWithFirstConceptIdentifier:(id)a3 secondConceptIdentifier:(id)a4 interactionType:(unint64_t)a5 interactions:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_8:
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"HKMedicationInteractionResult.m", 37, @"Invalid parameter not satisfying: %@", @"secondIdentifier != nil" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"HKMedicationInteractionResult.m", 36, @"Invalid parameter not satisfying: %@", @"firstIdentifier != nil" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_9:
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"HKMedicationInteractionResult.m", 38, @"Invalid parameter not satisfying: %@", @"interactions != nil" object file lineNumber description];

LABEL_4:
  v25.receiver = self;
  v25.super_class = (Class)HKMedicationInteractionResult;
  v14 = [(HKMedicationInteractionResult *)&v25 init];
  if (v14)
  {
    uint64_t v15 = [v11 copy];
    firstIdentifier = v14->_firstIdentifier;
    v14->_firstIdentifier = (HKConceptIdentifier *)v15;

    uint64_t v17 = [v12 copy];
    secondIdentifier = v14->_secondIdentifier;
    v14->_secondIdentifier = (HKConceptIdentifier *)v17;

    v14->_interactionType = a5;
    uint64_t v19 = [v13 copy];
    interactions = v14->_interactions;
    v14->_interactions = (NSSet *)v19;
  }
  return v14;
}

- (unint64_t)hash
{
  uint64_t v3 = [(HKConceptIdentifier *)self->_firstIdentifier hash];
  uint64_t v4 = [(HKConceptIdentifier *)self->_secondIdentifier hash] ^ v3;
  unint64_t interactionType = self->_interactionType;
  return v4 ^ interactionType ^ [(NSSet *)self->_interactions hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMedicationInteractionResult *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (!-[HKDrugInteractionResult hasEquivalentFirstInteractionClass:secondInteractionClass:]((uint64_t)self, v5->_firstIdentifier, v5->_secondIdentifier)|| self->_interactionType != v5->_interactionType)
      {
        goto LABEL_10;
      }
      interactions = self->_interactions;
      v7 = v5->_interactions;
      if (interactions == v7)
      {
        char v8 = 1;
        goto LABEL_11;
      }
      if (v7) {
        char v8 = -[NSSet isEqualToSet:](interactions, "isEqualToSet:");
      }
      else {
LABEL_10:
      }
        char v8 = 0;
LABEL_11:

      goto LABEL_12;
    }
    char v8 = 0;
  }
LABEL_12:

  return v8;
}

- (id)conceptIdentifiers
{
  v5[2] = *MEMORY[0x1E4F143B8];
  secondIdentifier = self->_secondIdentifier;
  v5[0] = self->_firstIdentifier;
  v5[1] = secondIdentifier;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  firstIdentifier = self->_firstIdentifier;
  secondIdentifier = self->_secondIdentifier;
  v7 = HKStringFromDrugInteractionType(self->_interactionType);
  char v8 = [(NSSet *)self->_interactions allObjects];
  v9 = [v8 componentsJoinedByString:@","];
  v10 = [v3 stringWithFormat:@"<%@:%p\nfirst concept identifier: %@,\nsecondc concept identifier: %@,\ninteractionType:%@,\ninteractions:[%@]>", v4, self, firstIdentifier, secondIdentifier, v7, v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  firstIdentifier = self->_firstIdentifier;
  id v5 = a3;
  [v5 encodeObject:firstIdentifier forKey:@"FirstIdentifier"];
  [v5 encodeObject:self->_secondIdentifier forKey:@"SecondIdentifier"];
  [v5 encodeInteger:self->_interactionType forKey:@"InteractionType"];
  [v5 encodeObject:self->_interactions forKey:@"Interactions"];
}

- (HKMedicationInteractionResult)initWithCoder:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKMedicationInteractionResult;
  v6 = [(HKMedicationInteractionResult *)&v18 init];
  if (v6)
  {
    uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"FirstIdentifier"];
    firstIdentifier = v6->_firstIdentifier;
    v6->_firstIdentifier = (HKConceptIdentifier *)v7;

    uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"SecondIdentifier"];
    secondIdentifier = v6->_secondIdentifier;
    v6->_secondIdentifier = (HKConceptIdentifier *)v9;

    v6->_unint64_t interactionType = [v5 decodeIntegerForKey:@"InteractionType"];
    id v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForSetOf:", objc_opt_class());
    uint64_t v12 = [v5 decodeObjectOfClasses:v11 forKey:@"Interactions"];
    interactions = v6->_interactions;
    v6->_interactions = (NSSet *)v12;

    if (!v6->_firstIdentifier)
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:v6 file:@"HKMedicationInteractionResult.m" lineNumber:139 description:@"First concept identifier should not be nil"];
    }
    if (!v6->_secondIdentifier)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:v6 file:@"HKMedicationInteractionResult.m" lineNumber:140 description:@"Second concept identifier should not be nil"];
    }
    if (!v6->_interactions)
    {
      uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:v6 file:@"HKMedicationInteractionResult.m" lineNumber:141 description:@"Interactions should not be nil"];
    }
  }

  return v6;
}

- (HKConceptIdentifier)firstIdentifier
{
  return self->_firstIdentifier;
}

- (HKConceptIdentifier)secondIdentifier
{
  return self->_secondIdentifier;
}

- (unint64_t)interactionType
{
  return self->_interactionType;
}

- (NSSet)interactions
{
  return self->_interactions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_secondIdentifier, 0);

  objc_storeStrong((id *)&self->_firstIdentifier, 0);
}

@end
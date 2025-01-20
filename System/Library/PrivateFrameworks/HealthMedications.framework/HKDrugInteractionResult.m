@interface HKDrugInteractionResult
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSameAncestorIdentifiersAsInteractionResult:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HKConceptIdentifier)identifier;
- (HKDrugInteractionClass)firstInteractionClass;
- (HKDrugInteractionClass)secondInteractionClass;
- (HKDrugInteractionResult)init;
- (HKDrugInteractionResult)initWithCoder:(id)a3;
- (HKDrugInteractionResult)initWithFirstInteractionClass:(id)a3 secondInteractionClass:(id)a4 severity:(id)a5 educationContent:(id)a6 ontologyIdentifier:(id)a7 validRegionCodes:(id)a8;
- (HKDrugInteractionSeverity)severity;
- (HKOntologyLocalizedEducationContent)educationContent;
- (NSSet)validRegionCodes;
- (NSString)uniqueIdentifier;
- (id)description;
- (id)interactionClasses;
- (uint64_t)hasEquivalentFirstAncestorIdentifier:(void *)a3 secondAncestorIdentifier:;
- (uint64_t)hasEquivalentFirstInteractionClass:(void *)a3 secondInteractionClass:;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKDrugInteractionResult

- (HKDrugInteractionResult)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKDrugInteractionResult)initWithFirstInteractionClass:(id)a3 secondInteractionClass:(id)a4 severity:(id)a5 educationContent:(id)a6 ontologyIdentifier:(id)a7 validRegionCodes:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"HKDrugInteractionResult.m", 36, @"Invalid parameter not satisfying: %@", @"firstInteractionClass != nil" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, self, @"HKDrugInteractionResult.m", 37, @"Invalid parameter not satisfying: %@", @"secondInteractionClass != nil" object file lineNumber description];

LABEL_3:
  if (![v15 isEqual:v16])
  {
    if (v17) {
      goto LABEL_5;
    }
LABEL_12:
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"HKDrugInteractionResult.m", 39, @"Invalid parameter not satisfying: %@", @"severity != nil" object file lineNumber description];

    if (v19) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
  v37 = [MEMORY[0x1E4F28B00] currentHandler];
  [v37 handleFailureInMethod:a2, self, @"HKDrugInteractionResult.m", 38, @"Invalid parameter not satisfying: %@", @"! [firstInteractionClass isEqual:secondInteractionClass]" object file lineNumber description];

  if (!v17) {
    goto LABEL_12;
  }
LABEL_5:
  if (v19) {
    goto LABEL_6;
  }
LABEL_13:
  v39 = [MEMORY[0x1E4F28B00] currentHandler];
  [v39 handleFailureInMethod:a2, self, @"HKDrugInteractionResult.m", 40, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];

LABEL_6:
  v40.receiver = self;
  v40.super_class = (Class)HKDrugInteractionResult;
  v21 = [(HKDrugInteractionResult *)&v40 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    firstInteractionClass = v21->_firstInteractionClass;
    v21->_firstInteractionClass = (HKDrugInteractionClass *)v22;

    uint64_t v24 = [v16 copy];
    secondInteractionClass = v21->_secondInteractionClass;
    v21->_secondInteractionClass = (HKDrugInteractionClass *)v24;

    uint64_t v26 = [v17 copy];
    severity = v21->_severity;
    v21->_severity = (HKDrugInteractionSeverity *)v26;

    uint64_t v28 = [v18 copy];
    educationContent = v21->_educationContent;
    v21->_educationContent = (HKOntologyLocalizedEducationContent *)v28;

    uint64_t v30 = [v19 copy];
    identifier = v21->_identifier;
    v21->_identifier = (HKConceptIdentifier *)v30;

    uint64_t v32 = [v20 copy];
    validRegionCodes = v21->_validRegionCodes;
    v21->_validRegionCodes = (NSSet *)v32;
  }
  return v21;
}

- (NSString)uniqueIdentifier
{
  v3 = NSString;
  uint64_t v4 = [(HKConceptIdentifier *)self->_identifier rawIdentifier];
  v5 = [(HKDrugInteractionClass *)self->_firstInteractionClass uniqueIdentifier];
  v6 = [(HKDrugInteractionClass *)self->_secondInteractionClass uniqueIdentifier];
  v7 = [v3 stringWithFormat:@"%ld_%@_%@", v4, v5, v6];

  return (NSString *)v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  long long v12 = *(_OWORD *)&self->_firstInteractionClass;
  severity = self->_severity;
  v6 = HKStringFromBool();
  identifier = self->_identifier;
  v8 = [(NSSet *)self->_validRegionCodes allObjects];
  v9 = [v8 componentsJoinedByString:@","];
  v10 = [v3 stringWithFormat:@"<%@:%p\nfirst interaction class: %@,\nsecond interaction class: %@,\nseverity: %@,\neducationPresent: %@,\nontologyIdentifier: %@,\nvalidRegionCodes:[%@]>", v4, self, v12, severity, v6, identifier, v9];

  return v10;
}

- (id)interactionClasses
{
  v5[2] = *MEMORY[0x1E4F143B8];
  secondInteractionClass = self->_secondInteractionClass;
  v5[0] = self->_firstInteractionClass;
  v5[1] = secondInteractionClass;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  return v3;
}

- (BOOL)hasSameAncestorIdentifiersAsInteractionResult:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  v3 = self;
  id v4 = a3;
  v5 = [v4 firstInteractionClass];
  v6 = [v5 ancestorIdentifier];
  v7 = [v4 secondInteractionClass];

  v8 = [v7 ancestorIdentifier];
  LOBYTE(v3) = -[HKDrugInteractionResult hasEquivalentFirstAncestorIdentifier:secondAncestorIdentifier:]((uint64_t)v3, v6, v8);

  return (char)v3;
}

- (uint64_t)hasEquivalentFirstAncestorIdentifier:(void *)a3 secondAncestorIdentifier:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [*(id *)(a1 + 8) ancestorIdentifier];
    if (v7 == v5)
    {
      int v10 = 0;
    }
    else if (v5)
    {
      v8 = [*(id *)(a1 + 8) ancestorIdentifier];
      int v9 = [v8 isEqual:v5];

      int v10 = v9 ^ 1;
    }
    else
    {
      int v10 = 1;
    }

    id v11 = [*(id *)(a1 + 16) ancestorIdentifier];
    if (v11 == v6)
    {
      int v14 = 0;
    }
    else if (v6)
    {
      long long v12 = [*(id *)(a1 + 16) ancestorIdentifier];
      int v13 = [v12 isEqual:v6];

      int v14 = v13 ^ 1;
    }
    else
    {
      int v14 = 1;
    }

    id v15 = [*(id *)(a1 + 8) ancestorIdentifier];
    if (v15 == v6)
    {
      int v18 = 0;
    }
    else if (v6)
    {
      id v16 = [*(id *)(a1 + 8) ancestorIdentifier];
      int v17 = [v16 isEqual:v6];

      int v18 = v17 ^ 1;
    }
    else
    {
      int v18 = 1;
    }

    id v19 = [*(id *)(a1 + 16) ancestorIdentifier];
    if (v19 == v5)
    {
      int v22 = 0;
    }
    else if (v5)
    {
      id v20 = [*(id *)(a1 + 16) ancestorIdentifier];
      int v21 = [v20 isEqual:v5];

      int v22 = v21 ^ 1;
    }
    else
    {
      int v22 = 1;
    }

    a1 = (v10 | v14) & (v18 | v22) ^ 1u;
  }

  return a1;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKDrugInteractionClass *)self->_firstInteractionClass hash];
  unint64_t v4 = [(HKDrugInteractionClass *)self->_secondInteractionClass hash] ^ v3;
  return v4 ^ [(HKConceptIdentifier *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (HKDrugInteractionResult *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if (!-[HKDrugInteractionResult hasEquivalentFirstInteractionClass:secondInteractionClass:]((uint64_t)self, v5->_firstInteractionClass, v5->_secondInteractionClass))goto LABEL_9; {
      identifier = self->_identifier;
      }
      id v7 = v5->_identifier;
      if (identifier == v7)
      {
        char v8 = 1;
        goto LABEL_11;
      }
      if (v7) {
        char v8 = -[HKConceptIdentifier isEqual:](identifier, "isEqual:");
      }
      else {
LABEL_9:
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

- (uint64_t)hasEquivalentFirstInteractionClass:(void *)a3 secondInteractionClass:
{
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_23;
  }
  id v7 = *(id *)(a1 + 8);
  if (v7 == v5)
  {
    int v8 = 0;
  }
  else if (v5)
  {
    int v8 = [v7 isEqual:v5] ^ 1;
  }
  else
  {
    int v8 = 1;
  }
  id v9 = *(id *)(a1 + 16);
  if (v9 == v6)
  {
    int v10 = 1;
  }
  else
  {
    if (!v6)
    {
      int v10 = 0;
      int v12 = *(void *)(a1 + 8) == 0;
      goto LABEL_17;
    }
    int v10 = [v9 isEqual:v6];
  }
  id v11 = *(id *)(a1 + 8);
  if (v11 == v6)
  {
    int v12 = 1;
  }
  else if (v6)
  {
    int v12 = [v11 isEqual:v6];
  }
  else
  {
    int v12 = 0;
  }
LABEL_17:
  id v13 = *(id *)(a1 + 16);
  if (v13 == v5)
  {
    int v14 = 0;
  }
  else if (v5)
  {
    int v14 = [v13 isEqual:v5] ^ 1;
  }
  else
  {
    int v14 = 1;
  }
  a1 = (v8 | ~v10) & (v12 ^ 1 | v14) ^ 1u;
LABEL_23:

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  firstInteractionClass = self->_firstInteractionClass;
  id v5 = a3;
  [v5 encodeObject:firstInteractionClass forKey:@"FirstInteractionClass"];
  [v5 encodeObject:self->_secondInteractionClass forKey:@"SecondInteractionClass"];
  [v5 encodeObject:self->_severity forKey:@"Severity"];
  [v5 encodeObject:self->_educationContent forKey:@"EducationContent"];
  [v5 encodeObject:self->_identifier forKey:@"OntologyIdentifier"];
  [v5 encodeObject:self->_validRegionCodes forKey:@"ValidRegionCodes"];
}

- (HKDrugInteractionResult)initWithCoder:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HKDrugInteractionResult;
  id v6 = [(HKDrugInteractionResult *)&v24 init];
  if (v6)
  {
    uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"FirstInteractionClass"];
    firstInteractionClass = v6->_firstInteractionClass;
    v6->_firstInteractionClass = (HKDrugInteractionClass *)v7;

    uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"SecondInteractionClass"];
    secondInteractionClass = v6->_secondInteractionClass;
    v6->_secondInteractionClass = (HKDrugInteractionClass *)v9;

    uint64_t v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"Severity"];
    severity = v6->_severity;
    v6->_severity = (HKDrugInteractionSeverity *)v11;

    uint64_t v13 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"EducationContent"];
    educationContent = v6->_educationContent;
    v6->_educationContent = (HKOntologyLocalizedEducationContent *)v13;

    uint64_t v15 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"OntologyIdentifier"];
    identifier = v6->_identifier;
    v6->_identifier = (HKConceptIdentifier *)v15;

    int v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForSetOf:", objc_opt_class());
    uint64_t v18 = [v5 decodeObjectOfClasses:v17 forKey:@"ValidRegionCodes"];
    validRegionCodes = v6->_validRegionCodes;
    v6->_validRegionCodes = (NSSet *)v18;

    if (!v6->_firstInteractionClass)
    {
      int v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:v6 file:@"HKDrugInteractionResult.m" lineNumber:178 description:@"First interaction class should not be nil"];
    }
    if (!v6->_secondInteractionClass)
    {
      int v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2 object:v6 file:@"HKDrugInteractionResult.m" lineNumber:179 description:@"Second interaction class should not be nil"];
    }
    if (!v6->_identifier)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2 object:v6 file:@"HKDrugInteractionResult.m" lineNumber:180 description:@"Identifier should not be nil"];
    }
  }

  return v6;
}

- (HKDrugInteractionClass)firstInteractionClass
{
  return self->_firstInteractionClass;
}

- (HKDrugInteractionClass)secondInteractionClass
{
  return self->_secondInteractionClass;
}

- (HKDrugInteractionSeverity)severity
{
  return self->_severity;
}

- (HKOntologyLocalizedEducationContent)educationContent
{
  return self->_educationContent;
}

- (HKConceptIdentifier)identifier
{
  return self->_identifier;
}

- (NSSet)validRegionCodes
{
  return self->_validRegionCodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validRegionCodes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_educationContent, 0);
  objc_storeStrong((id *)&self->_severity, 0);
  objc_storeStrong((id *)&self->_secondInteractionClass, 0);

  objc_storeStrong((id *)&self->_firstInteractionClass, 0);
}

@end
@interface HKDismissedDrugInteractionResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDrugInteractionResult:(id)a3;
- (HKConceptIdentifier)firstDrugClassAncestorIdentifier;
- (HKConceptIdentifier)firstDrugClassIdentifier;
- (HKConceptIdentifier)interactionIdentifier;
- (HKConceptIdentifier)secondDrugClassAncestorIdentifier;
- (HKConceptIdentifier)secondDrugClassIdentifier;
- (HKDismissedDrugInteractionResult)init;
- (HKDismissedDrugInteractionResult)initWithCoder:(id)a3;
- (NSDate)creationDate;
- (id)_initWithDrugInteractionResult:(id)a3;
- (id)_initWithInteractionIdentifier:(id)a3 firstDrugClassIdentifier:(id)a4 firstDrugClassAncestorIdentifier:(id)a5 secondDrugClassIdentifier:(id)a6 secondDrugClassAncestorIdentifier:(id)a7 creationDate:(id)a8;
- (id)description;
- (uint64_t)hasEquivalentFirstDrugClassIdentifier:(void *)a3 firstDrugClassAncestorIdentifier:(void *)a4 secondDrugClassIdentifier:(void *)a5 secondDrugClassAncestorIdentifier:;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKDismissedDrugInteractionResult

- (HKDismissedDrugInteractionResult)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)_initWithDrugInteractionResult:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HKDismissedDrugInteractionResult.m", 29, @"Invalid parameter not satisfying: %@", @"drugInteractionResult != nil" object file lineNumber description];
  }
  v6 = [v5 firstInteractionClass];
  v7 = [v6 identifier];
  uint64_t v8 = [v7 rawIdentifier];
  v9 = [v5 secondInteractionClass];
  v10 = [v9 identifier];
  uint64_t v11 = [v10 rawIdentifier];

  if (v8 <= v11)
  {
    v12 = [v5 firstInteractionClass];
    [v5 secondInteractionClass];
  }
  else
  {
    v12 = [v5 secondInteractionClass];
    [v5 firstInteractionClass];
  v13 = };
  v14 = [v5 identifier];
  v15 = [v12 identifier];
  v16 = [v12 ancestorIdentifier];
  v17 = [v13 identifier];
  v18 = [v13 ancestorIdentifier];
  v19 = [MEMORY[0x1E4F1C9C8] date];
  id v20 = [(HKDismissedDrugInteractionResult *)self _initWithInteractionIdentifier:v14 firstDrugClassIdentifier:v15 firstDrugClassAncestorIdentifier:v16 secondDrugClassIdentifier:v17 secondDrugClassAncestorIdentifier:v18 creationDate:v19];

  return v20;
}

- (id)_initWithInteractionIdentifier:(id)a3 firstDrugClassIdentifier:(id)a4 firstDrugClassAncestorIdentifier:(id)a5 secondDrugClassIdentifier:(id)a6 secondDrugClassAncestorIdentifier:(id)a7 creationDate:(id)a8
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
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"HKDismissedDrugInteractionResult.m", 59, @"Invalid parameter not satisfying: %@", @"interactionIdentifier != nil" object file lineNumber description];

    if (v16)
    {
LABEL_3:
      if (v17) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"HKDismissedDrugInteractionResult.m", 60, @"Invalid parameter not satisfying: %@", @"firstDrugClassIdentifier != nil" object file lineNumber description];

  if (v17)
  {
LABEL_4:
    if (v18) {
      goto LABEL_5;
    }
LABEL_14:
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"HKDismissedDrugInteractionResult.m", 62, @"Invalid parameter not satisfying: %@", @"secondDrugClassIdentifier != nil" object file lineNumber description];

    if (v19) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_13:
  v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, self, @"HKDismissedDrugInteractionResult.m", 61, @"Invalid parameter not satisfying: %@", @"firstDrugClassAncestorIdentifier != nil" object file lineNumber description];

  if (!v18) {
    goto LABEL_14;
  }
LABEL_5:
  if (v19) {
    goto LABEL_6;
  }
LABEL_15:
  v38 = [MEMORY[0x1E4F28B00] currentHandler];
  [v38 handleFailureInMethod:a2, self, @"HKDismissedDrugInteractionResult.m", 63, @"Invalid parameter not satisfying: %@", @"secondDrugClassAncestorIdentifier != nil" object file lineNumber description];

LABEL_6:
  uint64_t v21 = [v16 rawIdentifier];
  if (v21 >= [v18 rawIdentifier])
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"HKDismissedDrugInteractionResult.m", 64, @"Invalid parameter not satisfying: %@", @"firstDrugClassIdentifier.rawIdentifier < secondDrugClassIdentifier.rawIdentifier" object file lineNumber description];

    if (v20) {
      goto LABEL_8;
    }
  }
  else if (v20)
  {
    goto LABEL_8;
  }
  v40 = [MEMORY[0x1E4F28B00] currentHandler];
  [v40 handleFailureInMethod:a2, self, @"HKDismissedDrugInteractionResult.m", 65, @"Invalid parameter not satisfying: %@", @"creationDate != nil" object file lineNumber description];

LABEL_8:
  v41.receiver = self;
  v41.super_class = (Class)HKDismissedDrugInteractionResult;
  v22 = [(HKDismissedDrugInteractionResult *)&v41 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    interactionIdentifier = v22->_interactionIdentifier;
    v22->_interactionIdentifier = (HKConceptIdentifier *)v23;

    uint64_t v25 = [v16 copy];
    firstDrugClassIdentifier = v22->_firstDrugClassIdentifier;
    v22->_firstDrugClassIdentifier = (HKConceptIdentifier *)v25;

    uint64_t v27 = [v17 copy];
    firstDrugClassAncestorIdentifier = v22->_firstDrugClassAncestorIdentifier;
    v22->_firstDrugClassAncestorIdentifier = (HKConceptIdentifier *)v27;

    uint64_t v29 = [v18 copy];
    secondDrugClassIdentifier = v22->_secondDrugClassIdentifier;
    v22->_secondDrugClassIdentifier = (HKConceptIdentifier *)v29;

    uint64_t v31 = [v19 copy];
    secondDrugClassAncestorIdentifier = v22->_secondDrugClassAncestorIdentifier;
    v22->_secondDrugClassAncestorIdentifier = (HKConceptIdentifier *)v31;

    objc_storeStrong((id *)&v22->_creationDate, a8);
  }

  return v22;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p (%ld, %ld, %ld, %ld, %ld, %@)>", objc_opt_class(), self, -[HKConceptIdentifier rawIdentifier](self->_interactionIdentifier, "rawIdentifier"), -[HKConceptIdentifier rawIdentifier](self->_firstDrugClassIdentifier, "rawIdentifier"), -[HKConceptIdentifier rawIdentifier](self->_firstDrugClassAncestorIdentifier, "rawIdentifier"), -[HKConceptIdentifier rawIdentifier](self->_secondDrugClassIdentifier, "rawIdentifier"), -[HKConceptIdentifier rawIdentifier](self->_secondDrugClassAncestorIdentifier, "rawIdentifier"), self->_creationDate];
}

- (BOOL)isEqualToDrugInteractionResult:(id)a3
{
  id v4 = a3;
  id v5 = [[HKDismissedDrugInteractionResult alloc] _initWithDrugInteractionResult:v4];

  LOBYTE(self) = [(HKDismissedDrugInteractionResult *)self isEqual:v5];
  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v3 = [(HKConceptIdentifier *)self->_interactionIdentifier hash];
  uint64_t v4 = [(HKConceptIdentifier *)self->_firstDrugClassIdentifier hash] ^ v3;
  uint64_t v5 = [(HKConceptIdentifier *)self->_firstDrugClassAncestorIdentifier hash];
  uint64_t v6 = v4 ^ v5 ^ [(HKConceptIdentifier *)self->_secondDrugClassIdentifier hash];
  return v6 ^ [(HKConceptIdentifier *)self->_secondDrugClassAncestorIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKDismissedDrugInteractionResult *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      if (!-[HKDismissedDrugInteractionResult hasEquivalentFirstDrugClassIdentifier:firstDrugClassAncestorIdentifier:secondDrugClassIdentifier:secondDrugClassAncestorIdentifier:]((uint64_t)self, v5->_firstDrugClassIdentifier, v5->_firstDrugClassAncestorIdentifier, v5->_secondDrugClassIdentifier, v5->_secondDrugClassAncestorIdentifier))goto LABEL_9; {
      interactionIdentifier = self->_interactionIdentifier;
      }
      v7 = v5->_interactionIdentifier;
      if (interactionIdentifier == v7)
      {
        char v8 = 1;
        goto LABEL_11;
      }
      if (v7) {
        char v8 = -[HKConceptIdentifier isEqual:](interactionIdentifier, "isEqual:");
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

- (uint64_t)hasEquivalentFirstDrugClassIdentifier:(void *)a3 firstDrugClassAncestorIdentifier:(void *)a4 secondDrugClassIdentifier:(void *)a5 secondDrugClassAncestorIdentifier:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a1) {
    goto LABEL_45;
  }
  id v13 = *(id *)(a1 + 16);
  if (v13 == v9)
  {
    int v14 = 0;
  }
  else if (v9)
  {
    int v14 = [v13 isEqual:v9] ^ 1;
  }
  else
  {
    int v14 = 1;
  }
  id v15 = *(id *)(a1 + 24);
  if (v15 == v10)
  {
    int v16 = 0;
  }
  else if (v10)
  {
    int v16 = [v15 isEqual:v10] ^ 1;
  }
  else
  {
    int v16 = 1;
  }
  id v17 = *(id *)(a1 + 32);
  if (v17 == v11)
  {
    int v18 = 0;
  }
  else if (v11)
  {
    int v18 = [v17 isEqual:v11] ^ 1;
  }
  else
  {
    int v18 = 1;
  }
  id v19 = *(id *)(a1 + 40);
  if (v19 == v12)
  {
    int v20 = 0;
    goto LABEL_21;
  }
  if (v12)
  {
    int v20 = [v19 isEqual:v12] ^ 1;
LABEL_21:
    if (((v14 | v16 | v18) & 1) == 0 && !v20)
    {
      a1 = 1;
      goto LABEL_45;
    }
  }
  id v21 = *(id *)(a1 + 32);
  if (v21 == v9)
  {
    int v22 = 0;
  }
  else if (v9)
  {
    int v22 = [v21 isEqual:v9] ^ 1;
  }
  else
  {
    int v22 = 1;
  }
  id v23 = *(id *)(a1 + 40);
  if (v23 == v10)
  {
    int v24 = 0;
  }
  else if (v10)
  {
    int v24 = [v23 isEqual:v10] ^ 1;
  }
  else
  {
    int v24 = 1;
  }
  id v25 = *(id *)(a1 + 16);
  if (v25 == v11)
  {
    int v26 = 0;
  }
  else if (v11)
  {
    int v26 = [v25 isEqual:v11] ^ 1;
  }
  else
  {
    int v26 = 1;
  }
  id v27 = *(id *)(a1 + 24);
  if (v27 == v12)
  {
    int v28 = 0;
  }
  else if (v12)
  {
    int v28 = [v27 isEqual:v12] ^ 1;
  }
  else
  {
    int v28 = 1;
  }
  a1 = (v22 | v24 | v26 | v28) ^ 1u;
LABEL_45:

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  interactionIdentifier = self->_interactionIdentifier;
  id v5 = a3;
  [v5 encodeObject:interactionIdentifier forKey:@"InteractionIdentifier"];
  [v5 encodeObject:self->_firstDrugClassIdentifier forKey:@"FirstDrugClassIdentifier"];
  [v5 encodeObject:self->_firstDrugClassAncestorIdentifier forKey:@"FirstDrugClassAncestorIdentifier"];
  [v5 encodeObject:self->_secondDrugClassIdentifier forKey:@"SecondDrugClassIdentifier"];
  [v5 encodeObject:self->_secondDrugClassAncestorIdentifier forKey:@"SecondDrugClassAncestorIdentifier"];
  [v5 encodeObject:self->_creationDate forKey:@"CreationDate"];
}

- (HKDismissedDrugInteractionResult)initWithCoder:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HKDismissedDrugInteractionResult;
  uint64_t v6 = [(HKDismissedDrugInteractionResult *)&v26 init];
  if (v6)
  {
    uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"InteractionIdentifier"];
    interactionIdentifier = v6->_interactionIdentifier;
    v6->_interactionIdentifier = (HKConceptIdentifier *)v7;

    uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"FirstDrugClassIdentifier"];
    firstDrugClassIdentifier = v6->_firstDrugClassIdentifier;
    v6->_firstDrugClassIdentifier = (HKConceptIdentifier *)v9;

    uint64_t v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"FirstDrugClassAncestorIdentifier"];
    firstDrugClassAncestorIdentifier = v6->_firstDrugClassAncestorIdentifier;
    v6->_firstDrugClassAncestorIdentifier = (HKConceptIdentifier *)v11;

    uint64_t v13 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"SecondDrugClassIdentifier"];
    secondDrugClassIdentifier = v6->_secondDrugClassIdentifier;
    v6->_secondDrugClassIdentifier = (HKConceptIdentifier *)v13;

    uint64_t v15 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"SecondDrugClassAncestorIdentifier"];
    secondDrugClassAncestorIdentifier = v6->_secondDrugClassAncestorIdentifier;
    v6->_secondDrugClassAncestorIdentifier = (HKConceptIdentifier *)v15;

    uint64_t v17 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"CreationDate"];
    creationDate = v6->_creationDate;
    v6->_creationDate = (NSDate *)v17;

    if (!v6->_interactionIdentifier)
    {
      int v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:v6 file:@"HKDismissedDrugInteractionResult.m" lineNumber:191 description:@"Interaction identifier should not be nil"];
    }
    if (!v6->_firstDrugClassIdentifier)
    {
      id v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:v6 file:@"HKDismissedDrugInteractionResult.m" lineNumber:192 description:@"First drug interaction class identifier should not be nil"];
    }
    if (!v6->_firstDrugClassAncestorIdentifier)
    {
      int v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2 object:v6 file:@"HKDismissedDrugInteractionResult.m" lineNumber:193 description:@"First drug interaction class ancestor identifier should not be nil"];
    }
    if (!v6->_secondDrugClassIdentifier)
    {
      id v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2 object:v6 file:@"HKDismissedDrugInteractionResult.m" lineNumber:194 description:@"Second drug interaction class identifier should not be nil"];
    }
    if (!v6->_secondDrugClassAncestorIdentifier)
    {
      int v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2 object:v6 file:@"HKDismissedDrugInteractionResult.m" lineNumber:195 description:@"Second interaction class ancestor identifier should not be nil"];
    }
    if (!v6->_creationDate)
    {
      id v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2 object:v6 file:@"HKDismissedDrugInteractionResult.m" lineNumber:196 description:@"Creation date should not be nil"];
    }
  }

  return v6;
}

- (HKConceptIdentifier)interactionIdentifier
{
  return self->_interactionIdentifier;
}

- (HKConceptIdentifier)firstDrugClassIdentifier
{
  return self->_firstDrugClassIdentifier;
}

- (HKConceptIdentifier)firstDrugClassAncestorIdentifier
{
  return self->_firstDrugClassAncestorIdentifier;
}

- (HKConceptIdentifier)secondDrugClassIdentifier
{
  return self->_secondDrugClassIdentifier;
}

- (HKConceptIdentifier)secondDrugClassAncestorIdentifier
{
  return self->_secondDrugClassAncestorIdentifier;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_secondDrugClassAncestorIdentifier, 0);
  objc_storeStrong((id *)&self->_secondDrugClassIdentifier, 0);
  objc_storeStrong((id *)&self->_firstDrugClassAncestorIdentifier, 0);
  objc_storeStrong((id *)&self->_firstDrugClassIdentifier, 0);

  objc_storeStrong((id *)&self->_interactionIdentifier, 0);
}

@end
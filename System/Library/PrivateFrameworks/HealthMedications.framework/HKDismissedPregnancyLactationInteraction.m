@interface HKDismissedPregnancyLactationInteraction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToPregnancyLactationInteraction:(id)a3;
- (HKConceptIdentifier)medicationIdentifier;
- (HKDismissedPregnancyLactationInteraction)init;
- (HKDismissedPregnancyLactationInteraction)initWithCoder:(id)a3;
- (NSDate)creationDate;
- (id)_initWithMedicationIdentifier:(id)a3 interactionType:(int64_t)a4 creationDate:(id)a5;
- (id)description;
- (int64_t)interactionType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKDismissedPregnancyLactationInteraction

- (HKDismissedPregnancyLactationInteraction)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)_initWithMedicationIdentifier:(id)a3 interactionType:(int64_t)a4 creationDate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HKDismissedPregnancyLactationInteraction.m", 32, @"Invalid parameter not satisfying: %@", @"interactionIdentifier != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"HKDismissedPregnancyLactationInteraction.m", 33, @"Invalid parameter not satisfying: %@", @"creationDate != nil" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HKDismissedPregnancyLactationInteraction;
  v12 = [(HKDismissedPregnancyLactationInteraction *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    medicationIdentifier = v12->_medicationIdentifier;
    v12->_medicationIdentifier = (HKConceptIdentifier *)v13;

    v12->_interactionType = a4;
    objc_storeStrong((id *)&v12->_creationDate, a5);
  }

  return v12;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p (%ld, %ld, %@)>", objc_opt_class(), self, -[HKConceptIdentifier rawIdentifier](self->_medicationIdentifier, "rawIdentifier"), self->_interactionType, self->_creationDate];
}

- (BOOL)isEquivalentToPregnancyLactationInteraction:(id)a3
{
  id v4 = a3;
  medicationIdentifier = self->_medicationIdentifier;
  v6 = [v4 medication];
  v7 = [v6 firstConceptIdentifier];
  if (medicationIdentifier == v7)
  {
    int64_t interactionType = self->_interactionType;
    BOOL v14 = interactionType == [v4 interactionType];
  }
  else
  {
    v8 = [v4 medication];
    id v9 = [v8 firstConceptIdentifier];
    if (v9)
    {
      id v10 = self->_medicationIdentifier;
      v11 = [v4 medication];
      v12 = [v11 firstConceptIdentifier];
      if ([(HKConceptIdentifier *)v10 isEqual:v12])
      {
        int64_t v13 = self->_interactionType;
        BOOL v14 = v13 == [v4 interactionType];
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  return v14;
}

- (unint64_t)hash
{
  return self->_interactionType ^ [(HKConceptIdentifier *)self->_medicationIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKDismissedPregnancyLactationInteraction *)a3;
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
      medicationIdentifier = self->_medicationIdentifier;
      v7 = v5->_medicationIdentifier;
      BOOL v8 = (medicationIdentifier == v7
         || v7 && -[HKConceptIdentifier isEqual:](medicationIdentifier, "isEqual:"))
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
  medicationIdentifier = self->_medicationIdentifier;
  id v5 = a3;
  [v5 encodeObject:medicationIdentifier forKey:@"MedicationIdentifier"];
  [v5 encodeInteger:self->_interactionType forKey:@"InteractionType"];
  [v5 encodeObject:self->_creationDate forKey:@"CreationDate"];
}

- (HKDismissedPregnancyLactationInteraction)initWithCoder:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKDismissedPregnancyLactationInteraction;
  v6 = [(HKDismissedPregnancyLactationInteraction *)&v14 init];
  if (v6)
  {
    uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"MedicationIdentifier"];
    medicationIdentifier = v6->_medicationIdentifier;
    v6->_medicationIdentifier = (HKConceptIdentifier *)v7;

    v6->_int64_t interactionType = [v5 decodeIntegerForKey:@"InteractionType"];
    uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"CreationDate"];
    creationDate = v6->_creationDate;
    v6->_creationDate = (NSDate *)v9;

    if (!v6->_medicationIdentifier)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:v6 file:@"HKDismissedPregnancyLactationInteraction.m" lineNumber:106 description:@"Medication identifier should not be nil"];
    }
    if (!v6->_creationDate)
    {
      int64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:v6 file:@"HKDismissedPregnancyLactationInteraction.m" lineNumber:107 description:@"Creation date should not be nil"];
    }
  }

  return v6;
}

- (HKConceptIdentifier)medicationIdentifier
{
  return self->_medicationIdentifier;
}

- (int64_t)interactionType
{
  return self->_interactionType;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);

  objc_storeStrong((id *)&self->_medicationIdentifier, 0);
}

@end
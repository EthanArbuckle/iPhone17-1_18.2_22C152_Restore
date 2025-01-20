@interface HKDrugInteractionClass
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKConceptIdentifier)ancestorIdentifier;
- (HKConceptIdentifier)identifier;
- (HKDrugInteractionClass)init;
- (HKDrugInteractionClass)initWithCoder:(id)a3;
- (HKDrugInteractionClass)initWithName:(id)a3 relationshipCount:(unint64_t)a4 ancestorIdentifier:(id)a5 ontologyIdentifier:(id)a6 validRegionCodes:(id)a7;
- (NSSet)validRegionCodes;
- (NSString)name;
- (NSString)uniqueIdentifier;
- (id)description;
- (unint64_t)hash;
- (unint64_t)relationshipCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKDrugInteractionClass

- (HKDrugInteractionClass)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKDrugInteractionClass)initWithName:(id)a3 relationshipCount:(unint64_t)a4 ancestorIdentifier:(id)a5 ontologyIdentifier:(id)a6 validRegionCodes:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"HKDrugInteractionClass.m", 25, @"Invalid parameter not satisfying: %@", @"ancestorIdentifer" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"HKDrugInteractionClass.m", 26, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

LABEL_3:
  v29.receiver = self;
  v29.super_class = (Class)HKDrugInteractionClass;
  v17 = [(HKDrugInteractionClass *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v13 copy];
    name = v17->_name;
    v17->_name = (NSString *)v18;

    v17->_relationshipCount = a4;
    uint64_t v20 = [v14 copy];
    ancestorIdentifier = v17->_ancestorIdentifier;
    v17->_ancestorIdentifier = (HKConceptIdentifier *)v20;

    uint64_t v22 = [v15 copy];
    identifier = v17->_identifier;
    v17->_identifier = (HKConceptIdentifier *)v22;

    uint64_t v24 = [v16 copy];
    validRegionCodes = v17->_validRegionCodes;
    v17->_validRegionCodes = (NSSet *)v24;
  }
  return v17;
}

- (NSString)uniqueIdentifier
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%ld_%ld", -[HKConceptIdentifier rawIdentifier](self->_identifier, "rawIdentifier"), -[HKConceptIdentifier rawIdentifier](self->_ancestorIdentifier, "rawIdentifier"));
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  long long v11 = *(_OWORD *)&self->_name;
  ancestorIdentifier = self->_ancestorIdentifier;
  identifier = self->_identifier;
  v7 = [(NSSet *)self->_validRegionCodes allObjects];
  v8 = [v7 componentsJoinedByString:@","];
  v9 = [v3 stringWithFormat:@"<%@:%p name:%@, relationship count:%ld, ancestorIdentifier: %@, ontologyIdentifier:%@, validRegionCodes:[%@]>", v4, self, v11, ancestorIdentifier, identifier, v8];

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  uint64_t v4 = [(HKConceptIdentifier *)self->_ancestorIdentifier hash] ^ v3;
  unint64_t v5 = v4 ^ [(HKConceptIdentifier *)self->_identifier hash] ^ self->_relationshipCount;
  return v5 ^ [(NSSet *)self->_validRegionCodes hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKDrugInteractionClass *)a3;
  if (v4 == self)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      name = self->_name;
      v7 = v5->_name;
      if (name != v7 && (!v7 || !-[NSString isEqualToString:](name, "isEqualToString:"))) {
        goto LABEL_18;
      }
      ancestorIdentifier = self->_ancestorIdentifier;
      v9 = v5->_ancestorIdentifier;
      if (ancestorIdentifier != v9
        && (!v9 || !-[HKConceptIdentifier isEqual:](ancestorIdentifier, "isEqual:")))
      {
        goto LABEL_18;
      }
      identifier = self->_identifier;
      long long v11 = v5->_identifier;
      if (identifier != v11 && (!v11 || !-[HKConceptIdentifier isEqual:](identifier, "isEqual:"))) {
        goto LABEL_18;
      }
      if (self->_relationshipCount != v5->_relationshipCount) {
        goto LABEL_18;
      }
      validRegionCodes = self->_validRegionCodes;
      id v13 = v5->_validRegionCodes;
      if (validRegionCodes == v13)
      {
        char v14 = 1;
        goto LABEL_19;
      }
      if (v13) {
        char v14 = -[NSSet isEqualToSet:](validRegionCodes, "isEqualToSet:");
      }
      else {
LABEL_18:
      }
        char v14 = 0;
LABEL_19:

      goto LABEL_20;
    }
    char v14 = 0;
  }
LABEL_20:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"Name"];
  [v5 encodeObject:self->_ancestorIdentifier forKey:@"AncestorOntologyIdentifier"];
  [v5 encodeObject:self->_identifier forKey:@"OntologyIdentifier"];
  [v5 encodeInteger:self->_relationshipCount forKey:@"RelationshipCount"];
  [v5 encodeObject:self->_validRegionCodes forKey:@"ValidRegionCodes"];
}

- (HKDrugInteractionClass)initWithCoder:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKDrugInteractionClass;
  v6 = [(HKDrugInteractionClass *)&v18 init];
  if (v6)
  {
    uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"Name"];
    name = v6->_name;
    v6->_name = (NSString *)v7;

    v6->_relationshipCount = [v5 decodeIntegerForKey:@"RelationshipCount"];
    uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"AncestorOntologyIdentifier"];
    ancestorIdentifier = v6->_ancestorIdentifier;
    v6->_ancestorIdentifier = (HKConceptIdentifier *)v9;

    uint64_t v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"OntologyIdentifier"];
    identifier = v6->_identifier;
    v6->_identifier = (HKConceptIdentifier *)v11;

    id v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForSetOf:", objc_opt_class());
    uint64_t v14 = [v5 decodeObjectOfClasses:v13 forKey:@"ValidRegionCodes"];
    validRegionCodes = v6->_validRegionCodes;
    v6->_validRegionCodes = (NSSet *)v14;

    if (!v6->_identifier)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:v6 file:@"HKDrugInteractionClass.m" lineNumber:116 description:@"Identifier should not be nil"];
    }
  }

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)relationshipCount
{
  return self->_relationshipCount;
}

- (HKConceptIdentifier)ancestorIdentifier
{
  return self->_ancestorIdentifier;
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
  objc_storeStrong((id *)&self->_ancestorIdentifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end
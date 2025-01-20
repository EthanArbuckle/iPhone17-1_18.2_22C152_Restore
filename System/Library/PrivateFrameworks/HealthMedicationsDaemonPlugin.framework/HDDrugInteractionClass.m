@interface HDDrugInteractionClass
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (Class)classForKeyedArchiver;
- (HDDrugInteractionClass)init;
- (HDDrugInteractionClass)initWithCoder:(id)a3;
- (HDDrugInteractionClass)initWithName:(id)a3 relationships:(id)a4 ancestorIdentifier:(id)a5 ontologyIdentifier:(id)a6 validRegionCodes:(id)a7;
- (NSArray)relationships;
- (id)description;
- (unint64_t)hash;
@end

@implementation HDDrugInteractionClass

- (HDDrugInteractionClass)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDDrugInteractionClass)initWithName:(id)a3 relationships:(id)a4 ancestorIdentifier:(id)a5 ontologyIdentifier:(id)a6 validRegionCodes:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v14)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HDDrugInteractionClass.m", 30, @"Invalid parameter not satisfying: %@", @"relationships != nil" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)HDDrugInteractionClass;
  v18 = -[HKDrugInteractionClass initWithName:relationshipCount:ancestorIdentifier:ontologyIdentifier:validRegionCodes:](&v23, sel_initWithName_relationshipCount_ancestorIdentifier_ontologyIdentifier_validRegionCodes_, v13, [v14 count], v15, v16, v17);
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    relationships = v18->_relationships;
    v18->_relationships = (NSArray *)v19;
  }
  return v18;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)HDDrugInteractionClass;
  unint64_t v3 = [(HKDrugInteractionClass *)&v5 hash];
  return [(NSArray *)self->_relationships hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HDDrugInteractionClass *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      v10.receiver = self;
      v10.super_class = (Class)HDDrugInteractionClass;
      if (![(HKDrugInteractionClass *)&v10 isEqual:v5]) {
        goto LABEL_9;
      }
      relationships = self->_relationships;
      v7 = v5->_relationships;
      if (relationships == v7)
      {
        char v8 = 1;
        goto LABEL_11;
      }
      if (v7) {
        char v8 = -[NSArray isEqualToArray:](relationships, "isEqualToArray:");
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

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(HKDrugInteractionClass *)self name];
  unint64_t v6 = [(HKDrugInteractionClass *)self relationshipCount];
  v7 = [(HKDrugInteractionClass *)self ancestorIdentifier];
  char v8 = [(HKDrugInteractionClass *)self identifier];
  v9 = [(HKDrugInteractionClass *)self validRegionCodes];
  objc_super v10 = [v9 allObjects];
  v11 = [v10 componentsJoinedByString:@","];
  v12 = [v3 stringWithFormat:@"<%@:%p name:%@, relationship count:%ld, ancestorIdentifier: %@, ontologyIdentifier:%@, validRegionCodes:[%@]>", v4, self, v5, v6, v7, v8, v11];

  return v12;
}

- (HDDrugInteractionClass)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HDDrugInteractionClass;
  return [(HKDrugInteractionClass *)&v4 initWithCoder:a3];
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

- (NSArray)relationships
{
  return self->_relationships;
}

- (void).cxx_destruct
{
}

@end
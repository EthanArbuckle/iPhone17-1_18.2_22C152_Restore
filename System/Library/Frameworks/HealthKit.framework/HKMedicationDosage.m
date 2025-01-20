@interface HKMedicationDosage
+ (BOOL)supportsSecureCoding;
+ (id)dosageWithInstruction:(id)a3 timingPeriod:(id)a4;
+ (id)dosageWithInstruction:(id)a3 timingPeriod:(id)a4 siteCoding:(id)a5 routeCoding:(id)a6 methodCoding:(id)a7;
+ (id)indexableKeyPathsWithPrefix:(id)a3;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (HKConcept)method;
- (HKConcept)route;
- (HKConcept)site;
- (HKMedicalCoding)methodCoding;
- (HKMedicalCoding)routeCoding;
- (HKMedicalCoding)siteCoding;
- (HKMedicalDateInterval)timingPeriod;
- (HKMedicationDosage)init;
- (HKMedicationDosage)initWithCoder:(id)a3;
- (HKMedicationDosage)initWithInstruction:(id)a3 timingPeriod:(id)a4 siteCoding:(id)a5 routeCoding:(id)a6 methodCoding:(id)a7;
- (NSString)instruction;
- (id)_methodCodingCollection;
- (id)_routeCodingCollection;
- (id)_siteCodingCollection;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)_setMethodCoding:(id)a3;
- (void)_setRouteCoding:(id)a3;
- (void)_setSiteCoding:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicationDosage

+ (id)indexableKeyPathsWithPrefix:(id)a3
{
  return +[HKConceptIndexUtilities keyPaths:&unk_1EECE6CC0 prefix:a3];
}

+ (id)dosageWithInstruction:(id)a3 timingPeriod:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithInstruction:v7 timingPeriod:v6 siteCoding:0 routeCoding:0 methodCoding:0];

  return v8;
}

+ (id)dosageWithInstruction:(id)a3 timingPeriod:(id)a4 siteCoding:(id)a5 routeCoding:(id)a6 methodCoding:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = (void *)[objc_alloc((Class)a1) initWithInstruction:v16 timingPeriod:v15 siteCoding:v14 routeCoding:v13 methodCoding:v12];

  return v17;
}

- (HKMedicationDosage)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicationDosage)initWithInstruction:(id)a3 timingPeriod:(id)a4 siteCoding:(id)a5 routeCoding:(id)a6 methodCoding:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v38.receiver = self;
  v38.super_class = (Class)HKMedicationDosage;
  v17 = [(HKMedicationDosage *)&v38 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    instruction = v17->_instruction;
    v17->_instruction = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    timingPeriod = v17->_timingPeriod;
    v17->_timingPeriod = (HKMedicalDateInterval *)v20;

    uint64_t v22 = [v14 copy];
    siteCoding = v17->_siteCoding;
    v17->_siteCoding = (HKMedicalCoding *)v22;

    uint64_t v24 = [v15 copy];
    routeCoding = v17->_routeCoding;
    v17->_routeCoding = (HKMedicalCoding *)v24;

    uint64_t v26 = [v16 copy];
    methodCoding = v17->_methodCoding;
    v17->_methodCoding = (HKMedicalCoding *)v26;

    if (v17->_siteCoding)
    {
      v28 = [(HKMedicationDosage *)v17 _siteCodingCollection];
      uint64_t v29 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v28];
      site = v17->_site;
      v17->_site = (HKConcept *)v29;
    }
    if (v17->_routeCoding)
    {
      v31 = [(HKMedicationDosage *)v17 _routeCodingCollection];
      uint64_t v32 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v31];
      route = v17->_route;
      v17->_route = (HKConcept *)v32;
    }
    if (v17->_methodCoding)
    {
      v34 = [(HKMedicationDosage *)v17 _methodCodingCollection];
      uint64_t v35 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v34];
      method = v17->_method;
      v17->_method = (HKConcept *)v35;
    }
  }

  return v17;
}

- (id)_siteCodingCollection
{
  return +[HKMedicalCodingCollection collectionWithCoding:self->_siteCoding];
}

- (id)_routeCodingCollection
{
  return +[HKMedicalCodingCollection collectionWithCoding:self->_routeCoding];
}

- (id)_methodCodingCollection
{
  return +[HKMedicalCodingCollection collectionWithCoding:self->_methodCoding];
}

- (void)_setSiteCoding:(id)a3
{
  v5 = (HKMedicalCoding *)[a3 copy];
  siteCoding = self->_siteCoding;
  self->_siteCoding = v5;

  if (a3)
  {
    uint64_t v10 = [(HKMedicationDosage *)self _siteCodingCollection];
    id v7 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v10];
    site = self->_site;
    self->_site = v7;

    v9 = (HKConcept *)v10;
  }
  else
  {
    v9 = self->_site;
    self->_site = 0;
  }
}

- (void)_setRouteCoding:(id)a3
{
  v5 = (HKMedicalCoding *)[a3 copy];
  routeCoding = self->_routeCoding;
  self->_routeCoding = v5;

  if (a3)
  {
    uint64_t v10 = [(HKMedicationDosage *)self _routeCodingCollection];
    id v7 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v10];
    route = self->_route;
    self->_route = v7;

    v9 = (HKConcept *)v10;
  }
  else
  {
    v9 = self->_route;
    self->_route = 0;
  }
}

- (void)_setMethodCoding:(id)a3
{
  v5 = (HKMedicalCoding *)[a3 copy];
  methodCoding = self->_methodCoding;
  self->_methodCoding = v5;

  if (a3)
  {
    uint64_t v10 = [(HKMedicationDosage *)self _methodCodingCollection];
    id v7 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v10];
    method = self->_method;
    self->_method = v7;

    v9 = (HKConcept *)v10;
  }
  else
  {
    v9 = self->_method;
    self->_method = 0;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_instruction hash];
  unint64_t v4 = [(HKMedicalDateInterval *)self->_timingPeriod hash] ^ v3;
  unint64_t v5 = [(HKConcept *)self->_site hash];
  unint64_t v6 = v4 ^ v5 ^ [(HKMedicalCoding *)self->_siteCoding hash];
  unint64_t v7 = [(HKConcept *)self->_route hash];
  unint64_t v8 = v7 ^ [(HKMedicalCoding *)self->_routeCoding hash];
  unint64_t v9 = v6 ^ v8 ^ [(HKConcept *)self->_method hash];
  return v9 ^ [(HKMedicalCoding *)self->_methodCoding hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (HKMedicationDosage *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      instruction = self->_instruction;
      uint64_t v7 = [(HKMedicationDosage *)v5 instruction];
      if (instruction == (NSString *)v7)
      {
      }
      else
      {
        unint64_t v8 = (void *)v7;
        uint64_t v9 = [(HKMedicationDosage *)v5 instruction];
        if (!v9) {
          goto LABEL_44;
        }
        uint64_t v10 = (void *)v9;
        v11 = self->_instruction;
        id v12 = [(HKMedicationDosage *)v5 instruction];
        LODWORD(v11) = [(NSString *)v11 isEqual:v12];

        if (!v11) {
          goto LABEL_45;
        }
      }
      timingPeriod = self->_timingPeriod;
      uint64_t v15 = [(HKMedicationDosage *)v5 timingPeriod];
      if (timingPeriod == (HKMedicalDateInterval *)v15)
      {
      }
      else
      {
        unint64_t v8 = (void *)v15;
        uint64_t v16 = [(HKMedicationDosage *)v5 timingPeriod];
        if (!v16) {
          goto LABEL_44;
        }
        v17 = (void *)v16;
        uint64_t v18 = self->_timingPeriod;
        v19 = [(HKMedicationDosage *)v5 timingPeriod];
        LODWORD(v18) = [(HKMedicalDateInterval *)v18 isEqual:v19];

        if (!v18) {
          goto LABEL_45;
        }
      }
      siteCoding = self->_siteCoding;
      uint64_t v21 = [(HKMedicationDosage *)v5 siteCoding];
      if (siteCoding == (HKMedicalCoding *)v21)
      {
      }
      else
      {
        unint64_t v8 = (void *)v21;
        uint64_t v22 = [(HKMedicationDosage *)v5 siteCoding];
        if (!v22) {
          goto LABEL_44;
        }
        v23 = (void *)v22;
        uint64_t v24 = self->_siteCoding;
        v25 = [(HKMedicationDosage *)v5 siteCoding];
        LODWORD(v24) = [(HKMedicalCoding *)v24 isEqual:v25];

        if (!v24) {
          goto LABEL_45;
        }
      }
      routeCoding = self->_routeCoding;
      uint64_t v27 = [(HKMedicationDosage *)v5 routeCoding];
      if (routeCoding == (HKMedicalCoding *)v27)
      {
      }
      else
      {
        unint64_t v8 = (void *)v27;
        uint64_t v28 = [(HKMedicationDosage *)v5 routeCoding];
        if (!v28) {
          goto LABEL_44;
        }
        uint64_t v29 = (void *)v28;
        v30 = self->_routeCoding;
        v31 = [(HKMedicationDosage *)v5 routeCoding];
        LODWORD(v30) = [(HKMedicalCoding *)v30 isEqual:v31];

        if (!v30) {
          goto LABEL_45;
        }
      }
      methodCoding = self->_methodCoding;
      uint64_t v33 = [(HKMedicationDosage *)v5 methodCoding];
      if (methodCoding == (HKMedicalCoding *)v33)
      {
      }
      else
      {
        unint64_t v8 = (void *)v33;
        uint64_t v34 = [(HKMedicationDosage *)v5 methodCoding];
        if (!v34) {
          goto LABEL_44;
        }
        uint64_t v35 = (void *)v34;
        v36 = self->_methodCoding;
        v37 = [(HKMedicationDosage *)v5 methodCoding];
        LODWORD(v36) = [(HKMedicalCoding *)v36 isEqual:v37];

        if (!v36) {
          goto LABEL_45;
        }
      }
      site = self->_site;
      uint64_t v39 = [(HKMedicationDosage *)v5 site];
      if (site == (HKConcept *)v39)
      {
      }
      else
      {
        unint64_t v8 = (void *)v39;
        uint64_t v40 = [(HKMedicationDosage *)v5 site];
        if (!v40) {
          goto LABEL_44;
        }
        v41 = (void *)v40;
        v42 = self->_site;
        v43 = [(HKMedicationDosage *)v5 site];
        LODWORD(v42) = [(HKConcept *)v42 isEqual:v43];

        if (!v42) {
          goto LABEL_45;
        }
      }
      route = self->_route;
      uint64_t v45 = [(HKMedicationDosage *)v5 route];
      if (route == (HKConcept *)v45)
      {
      }
      else
      {
        unint64_t v8 = (void *)v45;
        uint64_t v46 = [(HKMedicationDosage *)v5 route];
        if (!v46) {
          goto LABEL_44;
        }
        v47 = (void *)v46;
        v48 = self->_route;
        v49 = [(HKMedicationDosage *)v5 route];
        LODWORD(v48) = [(HKConcept *)v48 isEqual:v49];

        if (!v48) {
          goto LABEL_45;
        }
      }
      method = self->_method;
      uint64_t v51 = [(HKMedicationDosage *)v5 method];
      if (method == (HKConcept *)v51)
      {

LABEL_49:
        BOOL v13 = 1;
        goto LABEL_46;
      }
      unint64_t v8 = (void *)v51;
      uint64_t v52 = [(HKMedicationDosage *)v5 method];
      if (v52)
      {
        v53 = (void *)v52;
        v54 = self->_method;
        v55 = [(HKMedicationDosage *)v5 method];
        LOBYTE(v54) = [(HKConcept *)v54 isEqual:v55];

        if (v54) {
          goto LABEL_49;
        }
LABEL_45:
        BOOL v13 = 0;
LABEL_46:

        goto LABEL_47;
      }
LABEL_44:

      goto LABEL_45;
    }
    BOOL v13 = 0;
  }
LABEL_47:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationDosage)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HKMedicationDosage;
  unint64_t v5 = [(HKMedicationDosage *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Instruction"];
    instruction = v5->_instruction;
    v5->_instruction = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TimingPeriod"];
    timingPeriod = v5->_timingPeriod;
    v5->_timingPeriod = (HKMedicalDateInterval *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SiteConcept"];
    site = v5->_site;
    v5->_site = (HKConcept *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SiteCoding"];
    siteCoding = v5->_siteCoding;
    v5->_siteCoding = (HKMedicalCoding *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RouteConcept"];
    route = v5->_route;
    v5->_route = (HKConcept *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RouteCoding"];
    routeCoding = v5->_routeCoding;
    v5->_routeCoding = (HKMedicalCoding *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MethodConcept"];
    method = v5->_method;
    v5->_method = (HKConcept *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MethodCoding"];
    methodCoding = v5->_methodCoding;
    v5->_methodCoding = (HKMedicalCoding *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  instruction = self->_instruction;
  id v5 = a3;
  [v5 encodeObject:instruction forKey:@"Instruction"];
  [v5 encodeObject:self->_timingPeriod forKey:@"TimingPeriod"];
  [v5 encodeObject:self->_site forKey:@"SiteConcept"];
  [v5 encodeObject:self->_siteCoding forKey:@"SiteCoding"];
  [v5 encodeObject:self->_route forKey:@"RouteConcept"];
  [v5 encodeObject:self->_routeCoding forKey:@"RouteCoding"];
  [v5 encodeObject:self->_method forKey:@"MethodConcept"];
  [v5 encodeObject:self->_methodCoding forKey:@"MethodCoding"];
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 isEqualToString:@"site"])
  {
    uint64_t v7 = [(HKMedicationDosage *)self siteCoding];

    if (v7)
    {
      uint64_t v8 = [(HKMedicationDosage *)self _siteCodingCollection];
      uint64_t v9 = +[HKIndexableObject indexableObjectWithObject:v8];
      uint64_t v18 = v9;
      uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
      v11 = &v18;
LABEL_10:
      uint64_t v14 = objc_msgSend(v10, "arrayWithObjects:count:", v11, 1, v16, v17, v18, v19);

      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if ([v6 isEqualToString:@"method"])
  {
    uint64_t v12 = [(HKMedicationDosage *)self methodCoding];

    if (v12)
    {
      uint64_t v8 = [(HKMedicationDosage *)self _methodCodingCollection];
      uint64_t v9 = +[HKIndexableObject indexableObjectWithObject:v8];
      v17 = v9;
      uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
      v11 = &v17;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if ([v6 isEqualToString:@"route"])
  {
    BOOL v13 = [(HKMedicationDosage *)self routeCoding];

    if (v13)
    {
      uint64_t v8 = [(HKMedicationDosage *)self _routeCodingCollection];
      uint64_t v9 = +[HKIndexableObject indexableObjectWithObject:v8];
      uint64_t v16 = v9;
      uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
      v11 = &v16;
      goto LABEL_10;
    }
LABEL_11:
    uint64_t v14 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_13;
  }
  +[HKConceptIndexUtilities assignError:a4 forInvalidKeyPath:v6 inClass:objc_opt_class()];
  uint64_t v14 = 0;
LABEL_13:

  return v14;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![v9 isEqualToString:@"site"])
  {
    if ([v9 isEqualToString:@"method"])
    {
      uint64_t v16 = [(HKMedicationDosage *)self methodCoding];
      BOOL v17 = HKIndexableObjectCheckCardinalityForIndexRestore(1, v16 != 0, (uint64_t)v9, (uint64_t)a5);

      if (v17)
      {
        uint64_t v12 = [v8 firstObject];
        BOOL v13 = [v12 object];
        uint64_t v18 = (HKConcept *)[v13 copy];
        method = self->_method;
        self->_method = v18;
        goto LABEL_10;
      }
    }
    else if ([v9 isEqualToString:@"route"])
    {
      uint64_t v19 = [(HKMedicationDosage *)self routeCoding];
      BOOL v20 = HKIndexableObjectCheckCardinalityForIndexRestore(1, v19 != 0, (uint64_t)v9, (uint64_t)a5);

      if (v20)
      {
        uint64_t v12 = [v8 firstObject];
        BOOL v13 = [v12 object];
        uint64_t v21 = (HKConcept *)[v13 copy];
        method = self->_route;
        self->_route = v21;
        goto LABEL_10;
      }
    }
    else
    {
      +[HKConceptIndexUtilities assignError:a5 forInvalidKeyPath:v9 inClass:objc_opt_class()];
    }
LABEL_12:
    BOOL v22 = 0;
    goto LABEL_13;
  }
  uint64_t v10 = [(HKMedicationDosage *)self siteCoding];
  BOOL v11 = HKIndexableObjectCheckCardinalityForIndexRestore(1, v10 != 0, (uint64_t)v9, (uint64_t)a5);

  if (!v11) {
    goto LABEL_12;
  }
  uint64_t v12 = [v8 firstObject];
  BOOL v13 = [v12 object];
  uint64_t v14 = (HKConcept *)[v13 copy];
  method = self->_site;
  self->_site = v14;
LABEL_10:

  BOOL v22 = 1;
LABEL_13:

  return v22;
}

- (NSString)instruction
{
  return self->_instruction;
}

- (HKMedicalDateInterval)timingPeriod
{
  return self->_timingPeriod;
}

- (HKConcept)site
{
  return self->_site;
}

- (HKMedicalCoding)siteCoding
{
  return self->_siteCoding;
}

- (HKConcept)route
{
  return self->_route;
}

- (HKMedicalCoding)routeCoding
{
  return self->_routeCoding;
}

- (HKConcept)method
{
  return self->_method;
}

- (HKMedicalCoding)methodCoding
{
  return self->_methodCoding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_methodCoding, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_routeCoding, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_siteCoding, 0);
  objc_storeStrong((id *)&self->_site, 0);
  objc_storeStrong((id *)&self->_timingPeriod, 0);

  objc_storeStrong((id *)&self->_instruction, 0);
}

@end
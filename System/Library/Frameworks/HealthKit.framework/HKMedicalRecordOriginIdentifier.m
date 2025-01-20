@interface HKMedicalRecordOriginIdentifier
+ (BOOL)supportsSecureCoding;
+ (HKMedicalRecordOriginIdentifier)originIdentifierWithFHIRResourceType:(id)a3 identifier:(id)a4;
+ (id)unitTesting_identifierWithAllPropertiesAllocated;
+ (id)unitTesting_identifierWithNeitherPropertyAllocated;
- (BOOL)isEqual:(id)a3;
- (HKFHIRIdentifier)fhirIdentifier;
- (HKMedicalRecordOriginIdentifier)init;
- (HKMedicalRecordOriginIdentifier)initWithCoder:(id)a3;
- (HKMedicalRecordOriginIdentifier)initWithFHIRIdentifier:(id)a3;
- (HKMedicalRecordOriginIdentifier)initWithSignedClinicalDataRecordIdentifier:(id)a3;
- (NSUUID)signedClinicalDataRecordIdentifier;
- (id)_initWithFHIRIdentifier:(id)a3 signedClinicalDataRecordIdentifier:(id)a4;
- (id)description;
- (void)_setFhirIdentifier:(id)a3;
- (void)_setSignedClinicalDataRecordIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicalRecordOriginIdentifier

- (HKMedicalRecordOriginIdentifier)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicalRecordOriginIdentifier)initWithFHIRIdentifier:(id)a3
{
  return (HKMedicalRecordOriginIdentifier *)[(HKMedicalRecordOriginIdentifier *)self _initWithFHIRIdentifier:a3 signedClinicalDataRecordIdentifier:0];
}

+ (HKMedicalRecordOriginIdentifier)originIdentifierWithFHIRResourceType:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v9 = [[HKFHIRIdentifier alloc] initWithResourceType:v7 identifier:v6];

  v10 = (void *)[v8 initWithFHIRIdentifier:v9];

  return (HKMedicalRecordOriginIdentifier *)v10;
}

- (HKMedicalRecordOriginIdentifier)initWithSignedClinicalDataRecordIdentifier:(id)a3
{
  return (HKMedicalRecordOriginIdentifier *)[(HKMedicalRecordOriginIdentifier *)self _initWithFHIRIdentifier:0 signedClinicalDataRecordIdentifier:a3];
}

- (id)_initWithFHIRIdentifier:(id)a3 signedClinicalDataRecordIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = v7 != 0;
  if (v8) {
    ++v9;
  }
  if (v9 != 1)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HKMedicalRecordOriginIdentifier.m", 42, @"Invalid parameter not satisfying: %@", @"(!!fhirIdentifier + !!signedClinicalDataRecordIdentifier) == 1" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)HKMedicalRecordOriginIdentifier;
  v10 = [(HKMedicalRecordOriginIdentifier *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    fhirIdentifier = v10->_fhirIdentifier;
    v10->_fhirIdentifier = (HKFHIRIdentifier *)v11;

    uint64_t v13 = [v8 copy];
    signedClinicalDataRecordIdentifier = v10->_signedClinicalDataRecordIdentifier;
    v10->_signedClinicalDataRecordIdentifier = (NSUUID *)v13;
  }
  return v10;
}

- (void)_setFhirIdentifier:(id)a3
{
  self->_fhirIdentifier = (HKFHIRIdentifier *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setSignedClinicalDataRecordIdentifier:(id)a3
{
  self->_signedClinicalDataRecordIdentifier = (NSUUID *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

+ (id)unitTesting_identifierWithNeitherPropertyAllocated
{
  v2 = +[HKMedicalRecordOriginIdentifier originIdentifierWithFHIRResourceType:@"ResourceType" identifier:@"identifier"];
  [v2 _setFhirIdentifier:0];

  return v2;
}

+ (id)unitTesting_identifierWithAllPropertiesAllocated
{
  v2 = +[HKMedicalRecordOriginIdentifier originIdentifierWithFHIRResourceType:@"ResourceType" identifier:@"identifier"];
  v3 = [MEMORY[0x1E4F29128] UUID];
  [v2 _setSignedClinicalDataRecordIdentifier:v3];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (HKMedicalRecordOriginIdentifier *)a3;
  id v7 = v6;
  if (self != v6)
  {
    id v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v13 = 0;
LABEL_18:

      goto LABEL_19;
    }
    fhirIdentifier = self->_fhirIdentifier;
    v10 = [(HKMedicalRecordOriginIdentifier *)v8 fhirIdentifier];
    if (fhirIdentifier == v10) {
      goto LABEL_9;
    }
    uint64_t v11 = [(HKMedicalRecordOriginIdentifier *)v8 fhirIdentifier];
    if (!v11)
    {
      char v13 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v3 = (void *)v11;
    v12 = self->_fhirIdentifier;
    uint64_t v4 = [(HKMedicalRecordOriginIdentifier *)v8 fhirIdentifier];
    if ([(HKFHIRIdentifier *)v12 isEqual:v4])
    {
LABEL_9:
      signedClinicalDataRecordIdentifier = self->_signedClinicalDataRecordIdentifier;
      uint64_t v15 = [(HKMedicalRecordOriginIdentifier *)v8 signedClinicalDataRecordIdentifier];
      if (signedClinicalDataRecordIdentifier == (NSUUID *)v15)
      {

        char v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        uint64_t v17 = [(HKMedicalRecordOriginIdentifier *)v8 signedClinicalDataRecordIdentifier];
        if (v17)
        {
          v18 = (void *)v17;
          v19 = self->_signedClinicalDataRecordIdentifier;
          v20 = [(HKMedicalRecordOriginIdentifier *)v8 signedClinicalDataRecordIdentifier];
          char v13 = [(NSUUID *)v19 isEqual:v20];
        }
        else
        {

          char v13 = 0;
        }
      }
      if (fhirIdentifier == v10) {
        goto LABEL_17;
      }
    }
    else
    {
      char v13 = 0;
    }

    goto LABEL_17;
  }
  char v13 = 1;
LABEL_19:

  return v13;
}

- (id)description
{
  if (self->_fhirIdentifier)
  {
    v3 = NSString;
    uint64_t v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [v3 stringWithFormat:@"<%@ %p: FHIR identifier: %@>", v5, self, self->_fhirIdentifier];
  }
  else
  {
    signedClinicalDataRecordIdentifier = self->_signedClinicalDataRecordIdentifier;
    id v7 = NSString;
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    v5 = (void *)v9;
    if (signedClinicalDataRecordIdentifier) {
      [v7 stringWithFormat:@"<%@ %p: original SCD record identifier: %@>", v9, self, self->_signedClinicalDataRecordIdentifier];
    }
    else {
      [v7 stringWithFormat:@"<%@ %p: INVALID, no identifier!>", v9, self, v12];
    }
  v10 = };

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  fhirIdentifier = self->_fhirIdentifier;
  id v5 = a3;
  [v5 encodeObject:fhirIdentifier forKey:@"FHIRIdentifier"];
  [v5 encodeObject:self->_signedClinicalDataRecordIdentifier forKey:@"SignedClinicalDataRecordIdentifier"];
}

- (HKMedicalRecordOriginIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FHIRIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SignedClinicalDataRecordIdentifier"];

  id v7 = [[HKMedicalRecordOriginIdentifier alloc] _initWithFHIRIdentifier:v5 signedClinicalDataRecordIdentifier:v6];
  return v7;
}

- (HKFHIRIdentifier)fhirIdentifier
{
  return self->_fhirIdentifier;
}

- (NSUUID)signedClinicalDataRecordIdentifier
{
  return self->_signedClinicalDataRecordIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedClinicalDataRecordIdentifier, 0);

  objc_storeStrong((id *)&self->_fhirIdentifier, 0);
}

@end
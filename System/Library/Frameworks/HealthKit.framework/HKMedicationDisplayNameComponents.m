@interface HKMedicationDisplayNameComponents
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKMedicationDisplayNameComponents)init;
- (HKMedicationDisplayNameComponents)initWithCoder:(id)a3;
- (HKMedicationDisplayNameComponents)initWithFullDisplayName:(id)a3 medicationDisplayName:(id)a4 displayStrength:(id)a5;
- (NSString)displayStrength;
- (NSString)fullDisplayName;
- (NSString)medicationDisplayName;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicationDisplayNameComponents

- (HKMedicationDisplayNameComponents)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicationDisplayNameComponents)initWithFullDisplayName:(id)a3 medicationDisplayName:(id)a4 displayStrength:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKMedicationDisplayNameComponents;
  v11 = [(HKMedicationDisplayNameComponents *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    fullDisplayName = v11->_fullDisplayName;
    v11->_fullDisplayName = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    medicationDisplayName = v11->_medicationDisplayName;
    v11->_medicationDisplayName = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    displayStrength = v11->_displayStrength;
    v11->_displayStrength = (NSString *)v16;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMedicationDisplayNameComponents *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HKMedicationDisplayNameComponents *)v5 fullDisplayName];
      uint64_t v7 = [(HKMedicationDisplayNameComponents *)self fullDisplayName];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        id v8 = (void *)v7;
        uint64_t v9 = [(HKMedicationDisplayNameComponents *)self fullDisplayName];
        if (!v9) {
          goto LABEL_19;
        }
        id v10 = (void *)v9;
        v11 = [(HKMedicationDisplayNameComponents *)v5 fullDisplayName];
        uint64_t v12 = [(HKMedicationDisplayNameComponents *)self fullDisplayName];
        int v13 = [v11 isEqualToString:v12];

        if (!v13) {
          goto LABEL_20;
        }
      }
      v6 = [(HKMedicationDisplayNameComponents *)v5 medicationDisplayName];
      uint64_t v15 = [(HKMedicationDisplayNameComponents *)self medicationDisplayName];
      if (v6 == (void *)v15)
      {
      }
      else
      {
        id v8 = (void *)v15;
        uint64_t v16 = [(HKMedicationDisplayNameComponents *)self medicationDisplayName];
        if (!v16) {
          goto LABEL_19;
        }
        v17 = (void *)v16;
        v18 = [(HKMedicationDisplayNameComponents *)v5 medicationDisplayName];
        objc_super v19 = [(HKMedicationDisplayNameComponents *)self medicationDisplayName];
        int v20 = [v18 isEqualToString:v19];

        if (!v20) {
          goto LABEL_20;
        }
      }
      v6 = [(HKMedicationDisplayNameComponents *)v5 displayStrength];
      uint64_t v21 = [(HKMedicationDisplayNameComponents *)self displayStrength];
      if (v6 == (void *)v21)
      {

LABEL_24:
        BOOL v14 = 1;
        goto LABEL_21;
      }
      id v8 = (void *)v21;
      uint64_t v22 = [(HKMedicationDisplayNameComponents *)self displayStrength];
      if (v22)
      {
        v23 = (void *)v22;
        v24 = [(HKMedicationDisplayNameComponents *)v5 displayStrength];
        v25 = [(HKMedicationDisplayNameComponents *)self displayStrength];
        char v26 = [v24 isEqualToString:v25];

        if (v26) {
          goto LABEL_24;
        }
LABEL_20:
        BOOL v14 = 0;
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    BOOL v14 = 0;
  }
LABEL_22:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_fullDisplayName hash];
  NSUInteger v4 = [(NSString *)self->_medicationDisplayName hash] ^ v3;
  return v4 ^ [(NSString *)self->_displayStrength hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationDisplayNameComponents)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKMedicationDisplayNameComponents;
  v5 = [(HKMedicationDisplayNameComponents *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FullDisplayNameKey"];
    fullDisplayName = v5->_fullDisplayName;
    v5->_fullDisplayName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MedicationDisplayNameKey"];
    medicationDisplayName = v5->_medicationDisplayName;
    v5->_medicationDisplayName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DisplayStrengthKey"];
    displayStrength = v5->_displayStrength;
    v5->_displayStrength = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  fullDisplayName = self->_fullDisplayName;
  id v5 = a3;
  [v5 encodeObject:fullDisplayName forKey:@"FullDisplayNameKey"];
  [v5 encodeObject:self->_medicationDisplayName forKey:@"MedicationDisplayNameKey"];
  [v5 encodeObject:self->_displayStrength forKey:@"DisplayStrengthKey"];
}

- (NSString)fullDisplayName
{
  return self->_fullDisplayName;
}

- (NSString)medicationDisplayName
{
  return self->_medicationDisplayName;
}

- (NSString)displayStrength
{
  return self->_displayStrength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayStrength, 0);
  objc_storeStrong((id *)&self->_medicationDisplayName, 0);

  objc_storeStrong((id *)&self->_fullDisplayName, 0);
}

@end
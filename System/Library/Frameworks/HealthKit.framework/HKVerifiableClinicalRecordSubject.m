@interface HKVerifiableClinicalRecordSubject
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKVerifiableClinicalRecordSubject)init;
- (HKVerifiableClinicalRecordSubject)initWithCoder:(id)a3;
- (HKVerifiableClinicalRecordSubject)initWithFullName:(id)a3 dateOfBirthComponents:(id)a4;
- (NSDateComponents)dateOfBirthComponents;
- (NSString)fullName;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKVerifiableClinicalRecordSubject

- (HKVerifiableClinicalRecordSubject)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKVerifiableClinicalRecordSubject)initWithFullName:(id)a3 dateOfBirthComponents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKVerifiableClinicalRecordSubject;
  v8 = [(HKVerifiableClinicalRecordSubject *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    fullName = v8->_fullName;
    v8->_fullName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    dateOfBirthComponents = v8->_dateOfBirthComponents;
    v8->_dateOfBirthComponents = (NSDateComponents *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (HKVerifiableClinicalRecordSubject *)a3;
  if (self == v6)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      fullName = self->_fullName;
      uint64_t v9 = [(HKVerifiableClinicalRecordSubject *)v7 fullName];
      if (fullName == v9) {
        goto LABEL_9;
      }
      uint64_t v10 = [(HKVerifiableClinicalRecordSubject *)v7 fullName];
      if (!v10)
      {
        char v12 = 0;
LABEL_17:

        goto LABEL_18;
      }
      v3 = (void *)v10;
      uint64_t v11 = self->_fullName;
      uint64_t v4 = [(HKVerifiableClinicalRecordSubject *)v7 fullName];
      if ([(NSString *)v11 isEqualToString:v4])
      {
LABEL_9:
        dateOfBirthComponents = self->_dateOfBirthComponents;
        uint64_t v14 = [(HKVerifiableClinicalRecordSubject *)v7 dateOfBirthComponents];
        if (dateOfBirthComponents == (NSDateComponents *)v14)
        {

          char v12 = 1;
        }
        else
        {
          v15 = (void *)v14;
          uint64_t v16 = [(HKVerifiableClinicalRecordSubject *)v7 dateOfBirthComponents];
          if (v16)
          {
            v17 = (void *)v16;
            v18 = self->_dateOfBirthComponents;
            v19 = [(HKVerifiableClinicalRecordSubject *)v7 dateOfBirthComponents];
            char v12 = [(NSDateComponents *)v18 isEqual:v19];
          }
          else
          {

            char v12 = 0;
          }
        }
        if (fullName == v9) {
          goto LABEL_17;
        }
      }
      else
      {
        char v12 = 0;
      }

      goto LABEL_17;
    }
    char v12 = 0;
  }
LABEL_18:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_fullName hash];
  return [(NSDateComponents *)self->_dateOfBirthComponents hash] ^ v3;
}

- (id)description
{
  NSUInteger v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@:%p fullName = %@, dateOfBirthComponents = %@>", v5, self, self->_fullName, self->_dateOfBirthComponents];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKVerifiableClinicalRecordSubject)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKVerifiableClinicalRecordSubject;
  v5 = [(HKVerifiableClinicalRecordSubject *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FullName"];
    fullName = v5->_fullName;
    v5->_fullName = (NSString *)v6;

    if (!v5->_fullName)
    {
      uint64_t v10 = 0;
      goto LABEL_6;
    }
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DateOfBirthComponents"];
    dateOfBirthComponents = v5->_dateOfBirthComponents;
    v5->_dateOfBirthComponents = (NSDateComponents *)v8;
  }
  uint64_t v10 = v5;
LABEL_6:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  fullName = self->_fullName;
  id v5 = a3;
  [v5 encodeObject:fullName forKey:@"FullName"];
  [v5 encodeObject:self->_dateOfBirthComponents forKey:@"DateOfBirthComponents"];
}

- (NSString)fullName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDateComponents)dateOfBirthComponents
{
  return (NSDateComponents *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfBirthComponents, 0);

  objc_storeStrong((id *)&self->_fullName, 0);
}

@end
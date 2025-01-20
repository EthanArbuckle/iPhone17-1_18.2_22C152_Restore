@interface _HKMedicalIDAllergy
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)textDescription;
- (_HKMedicalIDAllergy)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setTextDescription:(id)a3;
@end

@implementation _HKMedicalIDAllergy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_HKMedicalIDAllergy *)self textDescription];
  v7 = [v3 stringWithFormat:@"[%@]:%@", v5, v6];

  return v7;
}

- (_HKMedicalIDAllergy)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_HKMedicalIDAllergy *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDAllergyTextDescriptionKey"];
    [(_HKMedicalIDAllergy *)v5 setTextDescription:v6];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_HKMedicalIDAllergy allocWithZone:a3] init];
  v5 = [(_HKMedicalIDAllergy *)self textDescription];
  v6 = (void *)[v5 copy];
  [(_HKMedicalIDAllergy *)v4 setTextDescription:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(_HKMedicalIDAllergy *)self textDescription];
  [v4 encodeObject:v5 forKey:@"HKMedicalIDAllergyTextDescriptionKey"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(_HKMedicalIDAllergy *)self textDescription];
    v6 = [v4 textDescription];
    if (v5 == v6)
    {
      char v10 = 1;
    }
    else
    {
      v7 = [v4 textDescription];
      if (v7)
      {
        v8 = [(_HKMedicalIDAllergy *)self textDescription];
        v9 = [v4 textDescription];
        char v10 = [v8 isEqualToString:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSString)textDescription
{
  return self->_textDescription;
}

- (void)setTextDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface HKMedicationIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKMedicationIdentifier)init;
- (HKMedicationIdentifier)initWithCoder:(id)a3;
- (HKMedicationIdentifier)initWithRawIdentifier:(id)a3;
- (HKMedicationIdentifier)initWithSemanticIdentifierString:(id)a3;
- (NSString)underlyingIdentifier;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicationIdentifier

- (HKMedicationIdentifier)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicationIdentifier)initWithRawIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKMedicationIdentifier.m", 26, @"Invalid parameter not satisfying: %@", @"rawIdentifier" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HKMedicationIdentifier;
  v6 = [(HKMedicationIdentifier *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    underlyingIdentifier = v6->_underlyingIdentifier;
    v6->_underlyingIdentifier = (NSString *)v7;
  }
  return v6;
}

- (HKMedicationIdentifier)initWithSemanticIdentifierString:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKMedicationIdentifier.m", 38, @"Invalid parameter not satisfying: %@", @"semanticIdentifierString" object file lineNumber description];
  }
  v6 = objc_msgSend(v5, "hk_SHA256Hash");
  uint64_t v7 = [(HKMedicationIdentifier *)self initWithRawIdentifier:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMedicationIdentifier *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(HKMedicationIdentifier *)v5 underlyingIdentifier];
      uint64_t v7 = [(HKMedicationIdentifier *)self underlyingIdentifier];
      if (v6 == v7)
      {
        LOBYTE(v11) = 0;
      }
      else
      {
        v8 = [(HKMedicationIdentifier *)self underlyingIdentifier];
        if (v8)
        {
          v9 = [(HKMedicationIdentifier *)v5 underlyingIdentifier];
          v10 = [(HKMedicationIdentifier *)self underlyingIdentifier];
          int v11 = [v9 isEqualToString:v10] ^ 1;
        }
        else
        {
          LOBYTE(v11) = 1;
        }
      }
      char v12 = v11 ^ 1;
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  return [(NSString *)self->_underlyingIdentifier hash];
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  uint64_t v7 = v6;
  if (v6 && ([v6 underlyingIdentifier], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    v10 = [(HKMedicationIdentifier *)self underlyingIdentifier];
    int64_t v11 = [v10 compare:v9];
  }
  else
  {
    int64_t v11 = 1;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMedicationIdentifier;
  id v5 = [(HKMedicationIdentifier *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UnderlyingIdentifier"];
    underlyingIdentifier = v5->_underlyingIdentifier;
    v5->_underlyingIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSString)underlyingIdentifier
{
  return self->_underlyingIdentifier;
}

- (void).cxx_destruct
{
}

@end
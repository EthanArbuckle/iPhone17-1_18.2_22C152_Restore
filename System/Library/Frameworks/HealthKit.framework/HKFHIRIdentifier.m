@interface HKFHIRIdentifier
+ (BOOL)supportsSecureCoding;
+ (HKFHIRIdentifier)FHIRIdentifierWithString:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (HKFHIRIdentifier)init;
- (HKFHIRIdentifier)initWithCoder:(id)a3;
- (HKFHIRIdentifier)initWithResourceType:(id)a3 identifier:(id)a4;
- (NSString)identifier;
- (NSString)resourceType;
- (NSString)stringValue;
- (id)description;
- (id)identifierForContainedResourceWithIdentifier:(id)a3 error:(id *)a4;
- (id)parentResourceIdentifierWithError:(id *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFHIRIdentifier

+ (HKFHIRIdentifier)FHIRIdentifierWithString:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"failed to parse FHIR identifier; nil identifier"");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10) {
      goto LABEL_9;
    }
    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_8;
  }
  uint64_t v9 = [v7 rangeOfString:@"/"];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"failed to parse FHIR identifier; invalid format"");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
LABEL_9:
      v11 = 0;
      v12 = v10;
      goto LABEL_22;
    }
    if (!a4)
    {
LABEL_5:
      _HKLogDroppedError(v10);
      goto LABEL_9;
    }
LABEL_8:
    id v10 = v10;
    v11 = 0;
    *a4 = v10;
    v12 = v10;
    goto LABEL_22;
  }
  uint64_t v13 = v9;
  v12 = [v8 substringToIndex:v9];
  id v10 = [v8 substringFromIndex:v13 + 1];
  if (v12 && [v12 length])
  {
    if (v10 && [v10 length])
    {
      v11 = (void *)[objc_alloc((Class)a1) initWithResourceType:v12 identifier:v10];
      goto LABEL_22;
    }
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = objc_opt_class();
    v16 = @"failed to parse FHIR identifier; missing identifier";
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = objc_opt_class();
    v16 = @"failed to parse FHIR identifier; missing resource type";
  }
  objc_msgSend(v14, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v15, a2, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if (a4) {
      *a4 = v17;
    }
    else {
      _HKLogDroppedError(v17);
    }
  }

  v11 = 0;
LABEL_22:

  return (HKFHIRIdentifier *)v11;
}

- (HKFHIRIdentifier)initWithResourceType:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKFHIRIdentifier;
  v8 = [(HKFHIRIdentifier *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    resourceType = v8->_resourceType;
    v8->_resourceType = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v11;
  }
  return v8;
}

- (HKFHIRIdentifier)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (NSString)stringValue
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"%@%@%@", self->_resourceType, @"/", self->_identifier];

  return (NSString *)v2;
}

- (id)identifierForContainedResourceWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(NSString *)self->_identifier containsString:@"#"])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"trying to create a contained resource identifier by containing in an already contained resource: %@", self);
LABEL_5:
    uint64_t v11 = 0;
    goto LABEL_7;
  }
  id v7 = [v6 identifier];
  int v8 = [v7 containsString:@"#"];

  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    id v10 = HKSensitiveLogItem(v6);
    objc_msgSend(v9, "hk_assignError:code:format:", a4, 3, @"trying to create a contained resource identifier by containing an already contained resource: %@", v10);

    goto LABEL_5;
  }
  v12 = NSString;
  uint64_t v13 = [(HKFHIRIdentifier *)self stringValue];
  objc_super v14 = [v6 identifier];
  uint64_t v15 = [v12 stringWithFormat:@"%@%@%@", v13, @"#", v14];

  v16 = [HKFHIRIdentifier alloc];
  id v17 = [v6 resourceType];
  uint64_t v11 = [(HKFHIRIdentifier *)v16 initWithResourceType:v17 identifier:v15];

LABEL_7:

  return v11;
}

- (id)parentResourceIdentifierWithError:(id *)a3
{
  if ([(NSString *)self->_identifier containsString:@"#"])
  {
    v5 = [(NSString *)self->_identifier componentsSeparatedByString:@"#"];
    if ([v5 count] == 2)
    {
      id v6 = [v5 objectAtIndexedSubscript:0];
      id v7 = +[HKFHIRIdentifier FHIRIdentifierWithString:v6 error:a3];
    }
    else
    {
      int v8 = (void *)MEMORY[0x1E4F28C58];
      resourceType = self->_resourceType;
      id v6 = HKSensitiveLogItem(self->_identifier);
      objc_msgSend(v8, "hk_assignError:code:format:", a3, 3, @"invalid FHIR identifier on %@: %@", resourceType, v6);
      id v7 = 0;
    }
  }
  else
  {
    id v7 = (void *)[(HKFHIRIdentifier *)self copy];
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HKFHIRIdentifier *)self resourceType];
  [v4 encodeObject:v5 forKey:@"ResourceType"];

  id v6 = [(HKFHIRIdentifier *)self identifier];
  [v4 encodeObject:v6 forKey:@"Identifier"];
}

- (HKFHIRIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKFHIRIdentifier;
  v5 = [(HKFHIRIdentifier *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ResourceType"];
    resourceType = v5->_resourceType;
    v5->_resourceType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v23.receiver = self;
  v23.super_class = (Class)HKFHIRIdentifier;
  if ([(HKFHIRIdentifier *)&v23 isKindOfClass:v5])
  {
    id v6 = v4;
    id v7 = [(HKFHIRIdentifier *)self resourceType];
    uint64_t v8 = [v6 resourceType];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [v6 resourceType];
      if (!v10) {
        goto LABEL_12;
      }
      objc_super v11 = (void *)v10;
      v12 = [(HKFHIRIdentifier *)self resourceType];
      uint64_t v13 = [v6 resourceType];
      int v14 = [v12 isEqualToString:v13];

      if (!v14) {
        goto LABEL_13;
      }
    }
    id v7 = [(HKFHIRIdentifier *)self identifier];
    uint64_t v16 = [v6 identifier];
    if (v7 == (void *)v16)
    {

LABEL_15:
      BOOL v15 = 1;
      goto LABEL_16;
    }
    uint64_t v9 = (void *)v16;
    uint64_t v17 = [v6 identifier];
    if (v17)
    {
      v18 = (void *)v17;
      v19 = [(HKFHIRIdentifier *)self identifier];
      v20 = [v6 identifier];
      char v21 = [v19 isEqualToString:v20];

      if (v21) {
        goto LABEL_15;
      }
LABEL_13:
      BOOL v15 = 0;
LABEL_16:

      goto LABEL_17;
    }
LABEL_12:

    goto LABEL_13;
  }
  BOOL v15 = 0;
LABEL_17:

  return v15;
}

- (unint64_t)hash
{
  v3 = [(HKFHIRIdentifier *)self resourceType];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(HKFHIRIdentifier *)self identifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v2 = NSString;
  resourceType = self->_resourceType;
  uint64_t v4 = HKSensitiveLogItem(self->_identifier);
  uint64_t v5 = [v2 stringWithFormat:@"%@(%@)", resourceType, v4];

  return v5;
}

- (NSString)resourceType
{
  return self->_resourceType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_resourceType, 0);
}

@end
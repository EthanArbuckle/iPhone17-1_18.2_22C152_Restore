@interface HRSSupportedFHIRRelease
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HRSSupportedFHIRRelease)initWithCoder:(id)a3;
- (HRSSupportedFHIRRelease)initWithFHIRRelease:(id)a3 resourceTypes:(id)a4;
- (NSSet)resourceTypes;
- (NSString)FHIRRelease;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HRSSupportedFHIRRelease

- (HRSSupportedFHIRRelease)initWithFHIRRelease:(id)a3 resourceTypes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HRSSupportedFHIRRelease;
  v9 = [(HRSSupportedFHIRRelease *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_FHIRRelease, a3);
    uint64_t v11 = [v8 copy];
    resourceTypes = v10->_resourceTypes;
    v10->_resourceTypes = (NSSet *)v11;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HRSSupportedFHIRRelease *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      FHIRRelease = self->_FHIRRelease;
      id v8 = [(HRSSupportedFHIRRelease *)v6 FHIRRelease];
      if (FHIRRelease == v8)
      {
        resourceTypes = self->_resourceTypes;
        uint64_t v11 = [(HRSSupportedFHIRRelease *)v6 resourceTypes];
        char v9 = [(NSSet *)resourceTypes isEqualToSet:v11];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_FHIRRelease hash];
  return [(NSSet *)self->_resourceTypes hash] ^ v3;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  FHIRRelease = self->_FHIRRelease;
  id v7 = [(NSSet *)self->_resourceTypes allObjects];
  id v8 = [v7 componentsJoinedByString:@", "];
  char v9 = [v3 stringWithFormat:@"<%@ %p \"%@\", %@>", v5, self, FHIRRelease, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  FHIRRelease = self->_FHIRRelease;
  id v5 = a3;
  [v5 encodeObject:FHIRRelease forKey:@"FHIRRelease"];
  [v5 encodeObject:self->_resourceTypes forKey:@"FHIRResourceTypes"];
}

- (HRSSupportedFHIRRelease)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FHIRRelease"];
  if (v5)
  {
    v6 = HKFHIRReleaseFromNSString();
  }
  else
  {
    v6 = 0;
  }
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForSetOf:", objc_opt_class());
  id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"FHIRResourceTypes"];

  if (v6 && v8)
  {
    self = [(HRSSupportedFHIRRelease *)self initWithFHIRRelease:v6 resourceTypes:v8];
    char v9 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    char v9 = 0;
  }

  return v9;
}

- (NSString)FHIRRelease
{
  return self->_FHIRRelease;
}

- (NSSet)resourceTypes
{
  return self->_resourceTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceTypes, 0);

  objc_storeStrong((id *)&self->_FHIRRelease, 0);
}

@end
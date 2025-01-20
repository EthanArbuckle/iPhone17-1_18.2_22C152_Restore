@interface HDExtractionResultItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HDExtractionResultItem)init;
- (HDExtractionResultItem)initWithCoder:(id)a3;
- (HDExtractionResultItem)initWithOriginalFHIRResource:(id)a3 units:(id)a4 flags:(unint64_t)a5;
- (HDOriginalFHIRResourceObject)originalFHIRResource;
- (NSArray)units;
- (id)debugDescription;
- (id)description;
- (unint64_t)flags;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDExtractionResultItem

- (HDExtractionResultItem)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDExtractionResultItem)initWithOriginalFHIRResource:(id)a3 units:(id)a4 flags:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDExtractionResultItem.m", 27, @"Invalid parameter not satisfying: %@", @"originalFHIRResource" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)HDExtractionResultItem;
  v11 = [(HDExtractionResultItem *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    originalFHIRResource = v11->_originalFHIRResource;
    v11->_originalFHIRResource = (HDOriginalFHIRResourceObject *)v12;

    uint64_t v14 = [v10 copy];
    units = v11->_units;
    v11->_units = (NSArray *)v14;

    v11->_flags = a5;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HDExtractionResultItem *)a3;
  if (self == v5)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      originalFHIRResource = self->_originalFHIRResource;
      v8 = [(HDExtractionResultItem *)v6 originalFHIRResource];
      if (originalFHIRResource != v8)
      {
        uint64_t v9 = [(HDExtractionResultItem *)v6 originalFHIRResource];
        if (!v9)
        {
          BOOL v12 = 0;
          goto LABEL_20;
        }
        v3 = (void *)v9;
        id v10 = self->_originalFHIRResource;
        v11 = [(HDExtractionResultItem *)v6 originalFHIRResource];
        if (![(HDOriginalFHIRResourceObject *)v10 isEqual:v11])
        {
          BOOL v12 = 0;
LABEL_19:

          goto LABEL_20;
        }
        v23 = v11;
      }
      units = self->_units;
      uint64_t v14 = [(HDExtractionResultItem *)v6 units];
      if (units == (NSArray *)v14)
      {
        unint64_t flags = self->_flags;
        BOOL v12 = flags == [(HDExtractionResultItem *)v6 flags];
      }
      else
      {
        v15 = (void *)v14;
        uint64_t v16 = [(HDExtractionResultItem *)v6 units];
        if (v16)
        {
          v17 = (void *)v16;
          objc_super v18 = self->_units;
          v19 = [(HDExtractionResultItem *)v6 units];
          if ([(NSArray *)v18 isEqualToArray:v19])
          {
            unint64_t v20 = self->_flags;
            BOOL v12 = v20 == [(HDExtractionResultItem *)v6 flags];

            goto LABEL_18;
          }
        }
        BOOL v12 = 0;
      }
LABEL_18:
      v11 = v23;
      if (originalFHIRResource != v8) {
        goto LABEL_19;
      }
LABEL_20:

      goto LABEL_21;
    }
    BOOL v12 = 0;
  }
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDOriginalFHIRResourceObject *)self->_originalFHIRResource hash];
  return [(NSArray *)self->_units hash] ^ v3 ^ self->_flags;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(HDFHIRResourceObject *)self->_originalFHIRResource identifier];
  v7 = [v3 stringWithFormat:@"<%@ %p, FHIR resource: %@, units: %lu, raw flags: %lu>", v5, self, v6, -[NSArray count](self->_units, "count"), self->_flags];

  return v7;
}

- (id)debugDescription
{
  unint64_t v3 = [(NSArray *)self->_units hk_map:&__block_literal_global_8];
  uint64_t v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [(HDOriginalFHIRResourceObject *)self->_originalFHIRResource debugDescription];
  v8 = [v3 componentsJoinedByString:@"\n\t"];
  uint64_t v9 = [v4 stringWithFormat:@"<%@ %p, FHIR resource: %@, units:\n\t%@>", v6, self, v7, v8];

  return v9;
}

uint64_t __42__HDExtractionResultItem_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  return [a2 debugDescription];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDExtractionResultItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalFHIRResource"];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"units"];
    self = -[HDExtractionResultItem initWithOriginalFHIRResource:units:flags:](self, "initWithOriginalFHIRResource:units:flags:", v5, v7, [v4 decodeIntegerForKey:@"flags"]);

    v8 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  originalFHIRResource = self->_originalFHIRResource;
  id v5 = a3;
  [v5 encodeObject:originalFHIRResource forKey:@"originalFHIRResource"];
  [v5 encodeObject:self->_units forKey:@"units"];
  [v5 encodeInteger:self->_flags forKey:@"flags"];
}

- (HDOriginalFHIRResourceObject)originalFHIRResource
{
  return self->_originalFHIRResource;
}

- (NSArray)units
{
  return self->_units;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_units, 0);

  objc_storeStrong((id *)&self->_originalFHIRResource, 0);
}

@end
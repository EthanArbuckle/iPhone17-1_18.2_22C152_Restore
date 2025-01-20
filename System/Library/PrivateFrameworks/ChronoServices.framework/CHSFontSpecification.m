@interface CHSFontSpecification
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHSFontSpecification)init;
- (CHSFontSpecification)initWithBSXPCCoder:(id)a3;
- (NSArray)fontFeatures;
- (NSNumber)size;
- (NSNumber)weight;
- (NSString)description;
- (NSString)name;
- (id)_initWithFontSpecification:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)design;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setDesign:(unint64_t)a3;
- (void)setFontFeatures:(id)a3;
- (void)setName:(id)a3;
- (void)setSize:(id)a3;
- (void)setWeight:(id)a3;
@end

@implementation CHSFontSpecification

- (CHSFontSpecification)init
{
  v9.receiver = self;
  v9.super_class = (Class)CHSFontSpecification;
  v2 = [(CHSFontSpecification *)&v9 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = 0;

    size = v3->_size;
    v3->_design = 0;
    v3->_size = 0;

    weight = v3->_weight;
    v3->_weight = 0;

    fontFeatures = v3->_fontFeatures;
    v3->_fontFeatures = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (id)_initWithFontSpecification:(id)a3
{
  v4 = (id *)a3;
  v5 = [(CHSFontSpecification *)self init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_name, v4[1]);
    v6->_design = (unint64_t)v4[2];
    objc_storeStrong((id *)&v6->_size, v4[3]);
    objc_storeStrong((id *)&v6->_weight, v4[4]);
    objc_storeStrong((id *)&v6->_fontFeatures, v4[5]);
  }

  return v6;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __35__CHSFontSpecification_description__block_invoke;
  v11 = &unk_1E56C81F0;
  id v4 = v3;
  id v12 = v4;
  v13 = self;
  id v5 = (id)[v4 modifyProem:&v8];
  v6 = objc_msgSend(v4, "build", v8, v9, v10, v11);

  return (NSString *)v6;
}

id __35__CHSFontSpecification_description__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 8) withName:@"name" skipIfEmpty:1];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    if ((unint64_t)(v3 - 2) > 3) {
      id v4 = @"monospaced";
    }
    else {
      id v4 = off_1E56C91E0[v3 - 2];
    }
    [*(id *)(a1 + 32) appendString:v4 withName:@"design"];
    uint64_t v2 = *(void *)(a1 + 40);
  }
  id v5 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(v2 + 24) withName:@"size" skipIfNil:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"weight" skipIfNil:1];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CHSFontSpecification *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if (self->_design == v5->_design
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects())
      {
        char v6 = BSEqualArrays();
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendString:self->_name];
  id v5 = (id)[v3 appendUnsignedInteger:self->_design];
  [(NSNumber *)self->_size floatValue];
  id v6 = (id)objc_msgSend(v3, "appendFloat:");
  [(NSNumber *)self->_weight floatValue];
  id v7 = (id)objc_msgSend(v3, "appendFloat:");
  fontFeatures = self->_fontFeatures;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __28__CHSFontSpecification_hash__block_invoke;
  v12[3] = &unk_1E56C91C0;
  id v9 = v3;
  id v13 = v9;
  [(NSArray *)fontFeatures enumerateObjectsUsingBlock:v12];
  unint64_t v10 = [v9 hash];

  return v10;
}

void __28__CHSFontSpecification_hash__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:", objc_msgSend(v4, "hash"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CHSFontSpecification alloc];
  return [(CHSFontSpecification *)v4 _initWithFontSpecification:self];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_name forKey:@"name"];
  [v4 encodeUInt64:self->_design forKey:@"design"];
  [v4 encodeObject:self->_size forKey:@"size"];
  [v4 encodeObject:self->_weight forKey:@"weight"];
  [v4 encodeCollection:self->_fontFeatures forKey:@"fontFeatures"];
}

- (CHSFontSpecification)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CHSFontSpecification *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeStringForKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_design = [v4 decodeUInt64ForKey:@"design"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
    size = v5->_size;
    v5->_size = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"weight"];
    weight = v5->_weight;
    v5->_weight = (NSNumber *)v10;

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [v4 decodeCollectionOfClass:v12 containingClass:objc_opt_class() forKey:@"fontFeatures"];
    fontFeatures = v5->_fontFeatures;
    v5->_fontFeatures = (NSArray *)v13;
  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)design
{
  return self->_design;
}

- (void)setDesign:(unint64_t)a3
{
  self->_design = a3;
}

- (NSNumber)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
}

- (NSNumber)weight
{
  return self->_weight;
}

- (void)setWeight:(id)a3
{
}

- (NSArray)fontFeatures
{
  return self->_fontFeatures;
}

- (void)setFontFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontFeatures, 0);
  objc_storeStrong((id *)&self->_weight, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
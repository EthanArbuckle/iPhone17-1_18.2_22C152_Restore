@interface CHSIntentRecommendation
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)_isSchemaSeparated;
- (BOOL)isEqual:(id)a3;
- (CHSIntentRecommendation)initWithBSXPCCoder:(id)a3;
- (CHSIntentRecommendation)initWithCoder:(id)a3;
- (CHSIntentRecommendation)initWithIntentReference:(id)a3 localizedDescription:(id)a4;
- (CHSIntentReference)intentReference;
- (NSString)description;
- (NSString)localizedDescription;
- (id)_copyFillingInSchema:(id)a3;
- (id)_copyWithoutSchemaDataIfNecessary;
- (id)intent;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSIntentRecommendation

- (CHSIntentRecommendation)initWithIntentReference:(id)a3 localizedDescription:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)CHSIntentRecommendation;
    v9 = [(CHSIntentRecommendation *)&v15 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_intentReference, a3);
      uint64_t v11 = [v8 copy];
      localizedDescription = v10->_localizedDescription;
      v10->_localizedDescription = (NSString *)v11;
    }
    self = v10;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)intent
{
  return [(CHSIntentReference *)self->_intentReference intent];
}

- (BOOL)_isSchemaSeparated
{
  return [(CHSIntentReference *)self->_intentReference _isSchemaSeparated];
}

- (id)_copyFillingInSchema:(id)a3
{
  v4 = [(CHSIntentReference *)self->_intentReference _copyFillingInSchema:a3];
  if (v4 == self->_intentReference) {
    v5 = self;
  }
  else {
    v5 = [[CHSIntentRecommendation alloc] initWithIntentReference:v4 localizedDescription:self->_localizedDescription];
  }
  v6 = v5;

  return v6;
}

- (id)_copyWithoutSchemaDataIfNecessary
{
  v3 = [(CHSIntentReference *)self->_intentReference _copyWithoutSchemaDataIfNecessary];
  if (v3 == self->_intentReference) {
    v4 = self;
  }
  else {
    v4 = [[CHSIntentRecommendation alloc] initWithIntentReference:v3 localizedDescription:self->_localizedDescription];
  }
  v5 = v4;

  return v5;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __38__CHSIntentRecommendation_description__block_invoke;
  uint64_t v11 = &unk_1E56C81F0;
  id v4 = v3;
  id v12 = v4;
  v13 = self;
  id v5 = (id)[v4 modifyProem:&v8];
  v6 = objc_msgSend(v4, "build", v8, v9, v10, v11);

  return (NSString *)v6;
}

uint64_t __38__CHSIntentRecommendation_description__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"intentReference"];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 16);
  return [v3 appendString:v4 withName:@"description" skipIfEmpty:1];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CHSIntentRecommendation *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if (BSEqualObjects()) {
        BOOL v6 = [(CHSIntentReference *)self->_intentReference isEqual:v5->_intentReference];
      }
      else {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CHSIntentReference *)self->_intentReference hash];
  return [(NSString *)self->_localizedDescription hash] * v3 + 23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_intentReference forKey:@"intent2"];
  [v4 encodeObject:self->_localizedDescription forKey:@"desc"];
}

- (CHSIntentRecommendation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"desc"];
  if (![v4 containsValueForKey:@"intent2"])
  {
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"intent"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:0];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v12 = 0;
        goto LABEL_9;
      }
      id v11 = v10;
    }
    id v12 = v11;
LABEL_9:
    id v6 = [[CHSIntentReference alloc] _initWithIntentInMemoryOnly:v12];

    goto LABEL_10;
  }
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent2"];
LABEL_10:
  v13 = 0;
  if (v6 && v5)
  {
    self = [(CHSIntentRecommendation *)self initWithIntentReference:v6 localizedDescription:v5];
    v13 = self;
  }

  return v13;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_intentReference forKey:@"intent2"];
  [v4 encodeObject:self->_localizedDescription forKey:@"desc"];
}

- (CHSIntentRecommendation)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent2"];
  uint64_t v6 = [v4 decodeStringForKey:@"desc"];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    self = [(CHSIntentRecommendation *)self initWithIntentReference:v5 localizedDescription:v6];
    uint64_t v9 = self;
  }

  return v9;
}

- (CHSIntentReference)intentReference
{
  return self->_intentReference;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_intentReference, 0);
}

@end
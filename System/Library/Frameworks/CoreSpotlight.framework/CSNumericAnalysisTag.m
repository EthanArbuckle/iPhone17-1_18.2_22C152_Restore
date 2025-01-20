@interface CSNumericAnalysisTag
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CSNumericAnalysisTag)initWithCoder:(id)a3;
- (CSNumericAnalysisTag)initWithPrimaryValue:(id)a3 components:(id)a4 confidence:(double)a5;
- (NSArray)components;
- (NSNumber)primaryValue;
- (double)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCSCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSNumericAnalysisTag

- (CSNumericAnalysisTag)initWithPrimaryValue:(id)a3 components:(id)a4 confidence:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CSNumericAnalysisTag;
  v11 = [(CSNumericAnalysisTag *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_primaryValue, a3);
    if (v10) {
      v13 = v10;
    }
    else {
      v13 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v12->_components, v13);
    v12->_confidence = a5;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  primaryValue = self->_primaryValue;
  id v5 = a3;
  [v5 encodeObject:primaryValue forKey:@"primaryValue"];
  [v5 encodeObject:self->_components forKey:@"components"];
  [v5 encodeDouble:@"confidence" forKey:self->_confidence];
}

- (CSNumericAnalysisTag)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSNumericAnalysisTag;
  id v5 = [(CSNumericAnalysisTag *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryValue"];
    primaryValue = v5->_primaryValue;
    v5->_primaryValue = (NSNumber *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"components"];
    components = v5->_components;
    v5->_components = (NSArray *)v11;

    [v4 decodeDoubleForKey:@"confidence"];
    v5->_confidence = v13;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  primaryValue = self->_primaryValue;
  components = self->_components;
  double confidence = self->_confidence;

  return (id)[v4 initWithPrimaryValue:primaryValue components:components confidence:confidence];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    primaryValue = self->_primaryValue;
    v8 = [v6 primaryValue];
    if (primaryValue != v8)
    {
      uint64_t v9 = self->_primaryValue;
      v3 = [v6 primaryValue];
      if (![(NSNumber *)v9 isEqualToNumber:v3])
      {
        BOOL v10 = 0;
        goto LABEL_14;
      }
    }
    components = self->_components;
    uint64_t v12 = [v6 components];
    if (components == (NSArray *)v12)
    {
      double confidence = self->_confidence;
      [v6 confidence];
      BOOL v10 = confidence == v18;
    }
    else
    {
      double v13 = (void *)v12;
      if (self->_components)
      {
        v14 = [v6 components];
        if ([v14 isEqual:self->_components])
        {
          double v15 = self->_confidence;
          [v6 confidence];
          BOOL v10 = v15 == v16;

          goto LABEL_13;
        }
      }
      BOOL v10 = 0;
    }
LABEL_13:
    if (primaryValue == v8)
    {
LABEL_15:

      goto LABEL_16;
    }
LABEL_14:

    goto LABEL_15;
  }
  BOOL v10 = 0;
LABEL_16:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_components count];
  uint64_t v4 = [(NSNumber *)self->_primaryValue hash];
  unint64_t v5 = MDUHash64(v3) ^ v4;
  if (v3)
  {
    id v6 = [(NSArray *)self->_components firstObject];
    v5 ^= [v6 hash];

    if (v3 != 1)
    {
      v7 = [(NSArray *)self->_components lastObject];
      v5 ^= [v7 hash];
    }
  }
  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double confidence = self->_confidence;
  primaryValue = self->_primaryValue;
  v7 = [(NSArray *)self->_components componentsJoinedByString:@", "];
  v8 = [v3 stringWithFormat:@"<%@:%p %@ %f <%@>", v4, self, primaryValue, *(void *)&confidence, v7];

  return v8;
}

- (NSNumber)primaryValue
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)components
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);

  objc_storeStrong((id *)&self->_primaryValue, 0);
}

- (void)encodeWithCSCoder:(id)a3
{
  id v7 = a3;
  [v7 beginType:"CSNumericAnalysisTag"];
  uint64_t v4 = [(CSNumericAnalysisTag *)self components];
  unint64_t v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
  }
  [v7 encodeObject:v6];

  [(CSNumericAnalysisTag *)self confidence];
  objc_msgSend(v7, "encodeDouble:");
  [v7 endType];
}

@end
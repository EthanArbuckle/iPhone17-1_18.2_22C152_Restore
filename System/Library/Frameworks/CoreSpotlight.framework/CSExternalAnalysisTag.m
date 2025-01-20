@interface CSExternalAnalysisTag
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CSExternalAnalysisTag)initWithCoder:(id)a3;
- (CSExternalAnalysisTag)initWithLabel:(id)a3 synonyms:(id)a4 confidence:(double)a5;
- (NSArray)synonyms;
- (NSString)label;
- (double)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCSCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setLabel:(id)a3;
- (void)setSynonyms:(id)a3;
@end

@implementation CSExternalAnalysisTag

- (void)encodeWithCSCoder:(id)a3
{
  id v8 = a3;
  [v8 beginType:"CSExternalAnalysisTag"];
  id v4 = [(CSExternalAnalysisTag *)self label];
  objc_msgSend(v8, "encodeString:length:", objc_msgSend(v4, "UTF8String"), -1);

  uint64_t v5 = [(CSExternalAnalysisTag *)self synonyms];
  v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
  }
  [v8 encodeObject:v7];

  [(CSExternalAnalysisTag *)self confidence];
  objc_msgSend(v8, "encodeDouble:");
  [v8 endType];
}

- (CSExternalAnalysisTag)initWithLabel:(id)a3 synonyms:(id)a4 confidence:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CSExternalAnalysisTag;
  v11 = [(CSExternalAnalysisTag *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_label, a3);
    if (v10)
    {
      v13 = (NSArray *)v10;
    }
    else
    {
      v13 = [MEMORY[0x1E4F1C978] array];
    }
    synonyms = v12->_synonyms;
    v12->_synonyms = v13;

    v12->_confidence = a5;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  label = self->_label;
  id v5 = a3;
  [v5 encodeObject:label forKey:@"label"];
  [v5 encodeObject:self->_synonyms forKey:@"synonyms"];
  [v5 encodeDouble:@"confidence" forKey:self->_confidence];
}

- (CSExternalAnalysisTag)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSExternalAnalysisTag;
  id v5 = [(CSExternalAnalysisTag *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"synonyms"];
    synonyms = v5->_synonyms;
    v5->_synonyms = (NSArray *)v11;

    [v4 decodeDoubleForKey:@"confidence"];
    v5->_confidence = v13;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  label = self->_label;
  synonyms = self->_synonyms;
  double confidence = self->_confidence;

  return (id)[v4 initWithLabel:label synonyms:synonyms confidence:confidence];
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
    label = self->_label;
    id v8 = [v6 label];
    if (label != v8)
    {
      if (!self->_label)
      {
        BOOL v9 = 0;
        goto LABEL_17;
      }
      v3 = [v6 label];
      if (![v3 isEqualToString:self->_label])
      {
        BOOL v9 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    synonyms = self->_synonyms;
    uint64_t v11 = [v6 synonyms];
    if (synonyms == (NSArray *)v11)
    {
      double confidence = self->_confidence;
      [v6 confidence];
      BOOL v9 = confidence == v17;
    }
    else
    {
      v12 = (void *)v11;
      if (self->_synonyms)
      {
        double v13 = [v6 synonyms];
        if ([v13 isEqual:self->_synonyms])
        {
          double v14 = self->_confidence;
          [v6 confidence];
          BOOL v9 = v14 == v15;

          goto LABEL_15;
        }
      }
      BOOL v9 = 0;
    }
LABEL_15:
    if (label != v8) {
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  BOOL v9 = 0;
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_synonyms count];
  NSUInteger v4 = [(NSString *)self->_label hash];
  unint64_t v5 = MDUHash64(v3) ^ v4;
  if (v3)
  {
    id v6 = [(NSArray *)self->_synonyms firstObject];
    v5 ^= [v6 hash];

    if (v3 != 1)
    {
      uint64_t v7 = [(NSArray *)self->_synonyms lastObject];
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
  label = self->_label;
  uint64_t v7 = [(NSArray *)self->_synonyms componentsJoinedByString:@", "];
  id v8 = [v3 stringWithFormat:@"<%@:%p %@ %f <%@>", v4, self, label, *(void *)&confidence, v7];

  return v8;
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLabel:(id)a3
{
}

- (NSArray)synonyms
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSynonyms:(id)a3
{
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_double confidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end
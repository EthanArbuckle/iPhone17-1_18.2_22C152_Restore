@interface NSMorphologyPronoun
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSMorphology)dependentMorphology;
- (NSMorphology)morphology;
- (NSMorphologyPronoun)initWithCoder:(id)a3;
- (NSMorphologyPronoun)initWithPronoun:(NSString *)pronoun morphology:(NSMorphology *)morphology dependentMorphology:(NSMorphology *)dependentMorphology;
- (NSString)pronoun;
- (id)_morphunConstraints;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSMorphologyPronoun

- (id)_morphunConstraints
{
  return @objc NSMorphology.morphunConstraints()(self, (uint64_t)a2, (void (*)(void))NSMorphologyPronoun.morphunConstraints());
}

- (NSMorphologyPronoun)initWithPronoun:(NSString *)pronoun morphology:(NSMorphology *)morphology dependentMorphology:(NSMorphology *)dependentMorphology
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)NSMorphologyPronoun;
  v8 = [(NSMorphologyPronoun *)&v10 init];
  if (v8)
  {
    v8->_pronoun = (NSString *)[(NSString *)pronoun copy];
    v8->_morphology = (NSMorphology *)[(NSMorphology *)morphology copy];
    v8->_dependentMorphology = (NSMorphology *)[(NSMorphology *)dependentMorphology copy];
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSMorphologyPronoun;
  [(NSMorphologyPronoun *)&v3 dealloc];
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  NSUInteger v4 = [(NSString *)[(NSMorphologyPronoun *)self pronoun] hash] ^ v3;
  unint64_t v5 = [[(NSMorphologyPronoun *)self morphology] hash];
  return v4 ^ v5 ^ [[(NSMorphologyPronoun *)self dependentMorphology] hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = -[NSString isEqualToString:](-[NSMorphologyPronoun pronoun](self, "pronoun"), "isEqualToString:", [a3 pronoun]);
    if (v5)
    {
      BOOL v5 = -[NSMorphology isEqual:](-[NSMorphologyPronoun morphology](self, "morphology"), "isEqual:", [a3 morphology]);
      if (v5)
      {
        v6 = [(NSMorphologyPronoun *)self dependentMorphology];
        if (v6 == (NSMorphology *)[a3 dependentMorphology])
        {
          LOBYTE(v5) = 1;
        }
        else
        {
          v7 = [(NSMorphologyPronoun *)self dependentMorphology];
          uint64_t v8 = [a3 dependentMorphology];
          LOBYTE(v5) = [(NSMorphology *)v7 isEqual:v8];
        }
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_pronoun forKey:@"pronoun"];
  [a3 encodeObject:self->_morphology forKey:@"morphology"];
  if (self->_dependentMorphology)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
  }
}

- (NSMorphologyPronoun)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSMorphologyPronoun;
  NSUInteger v4 = [(NSMorphologyPronoun *)&v6 init];
  if (v4)
  {
    v4->_pronoun = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"pronoun"), "copy");
    v4->_morphology = (NSMorphology *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"morphology"), "copy");
    v4->_dependentMorphology = (NSMorphology *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"dependentMorphology"), "copy");
  }
  return v4;
}

- (NSString)pronoun
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSMorphology)morphology
{
  return (NSMorphology *)objc_getProperty(self, a2, 16, 1);
}

- (NSMorphology)dependentMorphology
{
  return (NSMorphology *)objc_getProperty(self, a2, 24, 1);
}

@end
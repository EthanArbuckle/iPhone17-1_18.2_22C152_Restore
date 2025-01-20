@interface NSInflectionRuleExplicit
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSInflectionRuleExplicit)initWithCoder:(id)a3;
- (NSInflectionRuleExplicit)initWithMorphology:(NSMorphology *)morphology;
- (NSMorphology)morphology;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSInflectionRuleExplicit

- (NSInflectionRuleExplicit)initWithMorphology:(NSMorphology *)morphology
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSInflectionRuleExplicit;
  v4 = [(NSInflectionRule *)&v6 _init];
  if (v4) {
    v4->_morphology = (NSMorphology *)[(NSMorphology *)morphology copy];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSInflectionRuleExplicit;
  [(NSInflectionRuleExplicit *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = [(NSInflectionRuleExplicit *)self morphology];

  [a3 encodeObject:v4 forKey:@"NS.Morphology"];
}

- (NSInflectionRuleExplicit)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSInflectionRuleExplicit;
  uint64_t v4 = [(NSInflectionRule *)&v6 _init];
  if (v4) {
    v4->_morphology = (NSMorphology *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.Morphology"];
  }
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  return [(NSMorphology *)[(NSInflectionRuleExplicit *)self morphology] hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = [(NSInflectionRuleExplicit *)self morphology];
  uint64_t v6 = [a3 morphology];

  return [(NSMorphology *)v5 isEqual:v6];
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSInflectionRuleExplicit;
  return +[NSString stringWithFormat:@"%@ { morphology = %@ }", [(NSInflectionRuleExplicit *)&v3 description], [(NSInflectionRuleExplicit *)self morphology]];
}

- (NSMorphology)morphology
{
  return (NSMorphology *)objc_getProperty(self, a2, 8, 1);
}

@end
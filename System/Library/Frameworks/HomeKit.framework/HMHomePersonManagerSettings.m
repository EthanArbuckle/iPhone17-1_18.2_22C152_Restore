@interface HMHomePersonManagerSettings
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFaceClassificationEnabled;
- (HMHomePersonManagerSettings)initWithCoder:(id)a3;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFaceClassificationEnabled:(BOOL)a3;
@end

@implementation HMHomePersonManagerSettings

- (BOOL)isFaceClassificationEnabled
{
  return self->_faceClassificationEnabled;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[HMHomePersonManagerSettings isFaceClassificationEnabled](self, "isFaceClassificationEnabled"), @"HMPMS.fce");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMHomePersonManagerSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (HMHomePersonManagerSettings *)objc_alloc_init((Class)objc_opt_class());
  uint64_t v6 = [v4 decodeBoolForKey:@"HMPMS.fce"];

  [(HMHomePersonManagerSettings *)v5 setFaceClassificationEnabled:v6];
  return v5;
}

- (void)setFaceClassificationEnabled:(BOOL)a3
{
  self->_faceClassificationEnabled = a3;
}

- (NSArray)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMHomePersonManagerSettings *)self isFaceClassificationEnabled];
  id v4 = HMFBooleanToString();
  v5 = (void *)[v3 initWithName:@"Face Classification Enabled" value:v4];
  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return (NSArray *)v6;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [+[HMMutableHomePersonManagerSettings allocWithZone:a3] init];
  [(HMHomePersonManagerSettings *)v4 setFaceClassificationEnabled:[(HMHomePersonManagerSettings *)self isFaceClassificationEnabled]];
  return v4;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (unint64_t)hash
{
  return [(HMHomePersonManagerSettings *)self isFaceClassificationEnabled];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    BOOL v7 = [(HMHomePersonManagerSettings *)self isFaceClassificationEnabled];
    int v8 = v7 ^ [v6 isFaceClassificationEnabled] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

@end
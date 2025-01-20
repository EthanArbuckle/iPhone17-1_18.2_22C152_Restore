@interface IRContext
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isBannerClassificationUnavailable;
- (BOOL)isEqual:(id)a3;
- (IRContext)init;
- (IRContext)initWithCoder:(id)a3;
- (NSSet)candidateResults;
- (NSString)bundleIdentifier;
- (NSString)contextIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)addCandidateResult:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)updateBundleIdentifier:(id)a3;
- (void)updateIsBannerClassificationUnavailable:(BOOL)a3;
@end

@implementation IRContext

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  internalCandidateResults = self->_internalCandidateResults;
  id v6 = a3;
  [v6 encodeObject:internalCandidateResults forKey:@"internalCandidateResults"];
  [v6 encodeObject:self->_contextIdentifier forKey:@"contextIdentifier"];
  v5 = [NSNumber numberWithBool:self->_isBannerClassificationUnavailable];
  [v6 encodeObject:v5 forKey:@"isBannerClassificationUnavailable"];

  [v6 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
}

- (IRContext)init
{
  v9.receiver = self;
  v9.super_class = (Class)IRContext;
  v2 = [(IRContext *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    internalCandidateResults = v2->_internalCandidateResults;
    v2->_internalCandidateResults = v3;

    v5 = [MEMORY[0x263F08C38] UUID];
    uint64_t v6 = [v5 UUIDString];
    contextIdentifier = v2->_contextIdentifier;
    v2->_contextIdentifier = (NSString *)v6;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_internalCandidateResults, 0);
}

- (NSSet)candidateResults
{
  v2 = (void *)[(NSMutableSet *)self->_internalCandidateResults copy];
  return (NSSet *)v2;
}

- (IRContext)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IRContext;
  v5 = [(IRContext *)&v21 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    v8 = [v6 setWithArray:v7];
    objc_super v9 = [v4 decodeObjectOfClasses:v8 forKey:@"internalCandidateResults"];

    if (v9)
    {
      uint64_t v10 = self;

      internalCandidateResults = v5->_internalCandidateResults;
      v5->_internalCandidateResults = (NSMutableSet *)v10;

      v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextIdentifier"];
      uint64_t v13 = self;

      contextIdentifier = v5->_contextIdentifier;
      v5->_contextIdentifier = (NSString *)v13;

      v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isBannerClassificationUnavailable"];
      objc_super v9 = v15;
      if (v15)
      {
        char v16 = [(IRContext *)v15 BOOLValue];

        v5->_isBannerClassificationUnavailable = v16;
        v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
        uint64_t v18 = self;

        bundleIdentifier = v5->_bundleIdentifier;
        v5->_bundleIdentifier = (NSString *)v18;

        objc_super v9 = v5;
      }
    }
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (void)updateBundleIdentifier:(id)a3
{
  self->_bundleIdentifier = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

+ (id)new
{
  return objc_alloc_init(IRContext);
}

- (void)addCandidateResult:(id)a3
{
}

- (void)updateIsBannerClassificationUnavailable:(BOOL)a3
{
  self->_isBannerClassificationUnavailable = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v6 = [(NSString *)self->_contextIdentifier copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithSet:self->_internalCandidateResults copyItems:1];
  objc_super v9 = (void *)v5[1];
  v5[1] = v8;

  *((unsigned char *)v5 + 16) = self->_isBannerClassificationUnavailable;
  uint64_t v10 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  return v5;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  [v6 appendFormat:@", candidateResults: %@", self->_internalCandidateResults];
  [v6 appendFormat:@", contextIdentifier: %@", self->_contextIdentifier];
  v7 = [NSNumber numberWithBool:self->_isBannerClassificationUnavailable];
  [v6 appendFormat:@", isBannerClassificationUnavailable: %@", v7];

  [v6 appendFormat:@", bundleIdentifier: %@", self->_bundleIdentifier];
  [v6 appendString:@">"];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(IRContext *)self candidateResults];
    v7 = [v5 candidateResults];
    if ([v6 isEqual:v7])
    {
    }
    else
    {
      objc_super v9 = [(IRContext *)self candidateResults];
      uint64_t v10 = [v5 candidateResults];

      if (v9 != v10) {
        goto LABEL_10;
      }
    }
    v11 = [(IRContext *)self contextIdentifier];
    v12 = [v5 contextIdentifier];
    if ([v11 isEqual:v12])
    {
    }
    else
    {
      uint64_t v13 = [(IRContext *)self contextIdentifier];
      v14 = [v5 contextIdentifier];

      if (v13 != v14) {
        goto LABEL_10;
      }
    }
    int v15 = [(IRContext *)self isBannerClassificationUnavailable];
    if (v15 == [v5 isBannerClassificationUnavailable])
    {
      v17 = [(IRContext *)self bundleIdentifier];
      uint64_t v18 = [v5 bundleIdentifier];
      if ([v17 isEqual:v18])
      {

        char v8 = 1;
      }
      else
      {
        v19 = [(IRContext *)self bundleIdentifier];
        v20 = [v5 bundleIdentifier];
        BOOL v21 = v19 != v20;

        char v8 = !v21;
      }
      goto LABEL_11;
    }
LABEL_10:
    char v8 = 0;
LABEL_11:

    goto LABEL_12;
  }
  char v8 = 0;
LABEL_12:

  return v8 & 1;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableSet *)self->_internalCandidateResults hash];
  NSUInteger v4 = [(NSString *)self->_contextIdentifier hash] ^ v3;
  BOOL isBannerClassificationUnavailable = self->_isBannerClassificationUnavailable;
  return v4 ^ isBannerClassificationUnavailable ^ [(NSString *)self->_bundleIdentifier hash];
}

- (BOOL)isBannerClassificationUnavailable
{
  return self->_isBannerClassificationUnavailable;
}

@end
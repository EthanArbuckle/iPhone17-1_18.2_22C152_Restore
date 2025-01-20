@interface AEAssessmentApplicationDescriptor
+ (BOOL)supportsSecureCoding;
- (AEAssessmentApplicationDescriptor)initWithBundleIdentifier:(id)a3 teamIdentifier:(id)a4 requiresSignatureValidation:(BOOL)a5;
- (AEAssessmentApplicationDescriptor)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresSignatureValidation;
- (NSString)bundleIdentifier;
- (NSString)teamIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)isEqualToDescriptor:(void *)a1;
@end

@implementation AEAssessmentApplicationDescriptor

- (AEAssessmentApplicationDescriptor)initWithBundleIdentifier:(id)a3 teamIdentifier:(id)a4 requiresSignatureValidation:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AEAssessmentApplicationDescriptor;
  v10 = [(AEAssessmentApplicationDescriptor *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    teamIdentifier = v10->_teamIdentifier;
    v10->_teamIdentifier = (NSString *)v13;

    v10->_requiresSignatureValidation = a5;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AEAssessmentApplicationDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AEAssessmentApplicationDescriptor;
  v5 = [(AEAssessmentApplicationDescriptor *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"teamIdentifier"];
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requiresSignatureValidation"];
    v5->_requiresSignatureValidation = [v10 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AEAssessmentApplicationDescriptor *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];

  uint64_t v6 = [(AEAssessmentApplicationDescriptor *)self teamIdentifier];
  [v4 encodeObject:v6 forKey:@"teamIdentifier"];

  objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentApplicationDescriptor requiresSignatureValidation](self, "requiresSignatureValidation"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"requiresSignatureValidation"];
}

- (unint64_t)hash
{
  v3 = [(AEAssessmentApplicationDescriptor *)self bundleIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(AEAssessmentApplicationDescriptor *)self teamIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentApplicationDescriptor requiresSignatureValidation](self, "requiresSignatureValidation"));
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AEAssessmentApplicationDescriptor *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    unsigned __int8 v6 = 1;
    goto LABEL_7;
  }
  if ([(AEAssessmentApplicationDescriptor *)v4 isMemberOfClass:objc_opt_class()]) {
    unsigned __int8 v6 = -[AEAssessmentApplicationDescriptor isEqualToDescriptor:](self, v5);
  }
  else {
LABEL_5:
  }
    unsigned __int8 v6 = 0;
LABEL_7:

  return v6;
}

- (void)isEqualToDescriptor:(void *)a1
{
  id v8 = a2;
  if (!a1) {
    goto LABEL_24;
  }
  id v9 = [a1 bundleIdentifier];
  if (v9 || ([v8 bundleIdentifier], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v2 = [a1 bundleIdentifier];
    v3 = [v8 bundleIdentifier];
    if (![v2 isEqual:v3])
    {

      a1 = 0;
      goto LABEL_21;
    }
    int v10 = 1;
  }
  else
  {
    int v10 = 0;
  }
  uint64_t v11 = [a1 teamIdentifier];
  if (v11 || ([v8 teamIdentifier], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = objc_msgSend(a1, "teamIdentifier", v16);
    unsigned __int8 v6 = [v8 teamIdentifier];
    if (([v5 isEqual:v6] & 1) == 0)
    {

      a1 = 0;
      if (v11) {
        goto LABEL_19;
      }
LABEL_13:

      if ((v10 & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
    int v18 = v10;
    objc_super v12 = v4;
    int v13 = 1;
  }
  else
  {
    int v18 = v10;
    objc_super v12 = v4;
    v17 = 0;
    int v13 = 0;
  }
  int v14 = objc_msgSend(a1, "requiresSignatureValidation", v17);
  a1 = (void *)(v14 ^ [v8 requiresSignatureValidation] ^ 1);
  if (v13)
  {
  }
  uint64_t v4 = v12;
  int v10 = v18;
  if (!v11) {
    goto LABEL_13;
  }
LABEL_19:

  if (v10)
  {
LABEL_20:
  }
LABEL_21:
  if (!v9) {

  }
LABEL_24:
  return a1;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(AEAssessmentApplicationDescriptor *)self bundleIdentifier];
  unsigned __int8 v6 = [(AEAssessmentApplicationDescriptor *)self teamIdentifier];
  BOOL v7 = [(AEAssessmentApplicationDescriptor *)self requiresSignatureValidation];
  id v8 = @"No";
  if (v7) {
    id v8 = @"Yes";
  }
  id v9 = [v3 stringWithFormat:@"<%@: %p { bundleIdentifier = %@, teamIdentifier = %@, requiresSignatureValidation = %@ }>", v4, self, v5, v6, v8];

  return v9;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (BOOL)requiresSignatureValidation
{
  return self->_requiresSignatureValidation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
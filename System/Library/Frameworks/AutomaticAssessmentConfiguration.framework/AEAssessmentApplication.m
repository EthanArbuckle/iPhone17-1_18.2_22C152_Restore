@interface AEAssessmentApplication
+ (id)instanceFromApplicationDescriptor:(id)a3;
- (AEAssessmentApplication)initWithBundleIdentifier:(NSString *)bundleIdentifier;
- (AEAssessmentApplication)initWithBundleIdentifier:(NSString *)bundleIdentifier teamIdentifier:(NSString *)teamIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresSignatureValidation;
- (NSString)bundleIdentifier;
- (NSString)teamIdentifier;
- (id)applicationDescriptor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initWithBundleIdentifier:(void *)a3 teamIdentifier:(char)a4 requiresSignatureValidation:;
- (uint64_t)isEqualToApplication:(uint64_t)a1;
- (unint64_t)hash;
- (void)setRequiresSignatureValidation:(BOOL)requiresSignatureValidation;
@end

@implementation AEAssessmentApplication

- (id)initWithBundleIdentifier:(void *)a3 teamIdentifier:(char)a4 requiresSignatureValidation:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)AEAssessmentApplication;
    a1 = objc_msgSendSuper2(&v14, sel_init);
    if (a1)
    {
      uint64_t v9 = [v7 copy];
      v10 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v9;

      uint64_t v11 = [v8 copy];
      v12 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v11;

      *((unsigned char *)a1 + 8) = a4;
    }
  }

  return a1;
}

- (AEAssessmentApplication)initWithBundleIdentifier:(NSString *)bundleIdentifier teamIdentifier:(NSString *)teamIdentifier
{
  return (AEAssessmentApplication *)-[AEAssessmentApplication initWithBundleIdentifier:teamIdentifier:requiresSignatureValidation:](self, bundleIdentifier, teamIdentifier, 1);
}

- (AEAssessmentApplication)initWithBundleIdentifier:(NSString *)bundleIdentifier
{
  return [(AEAssessmentApplication *)self initWithBundleIdentifier:bundleIdentifier teamIdentifier:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[AEAssessmentApplication allocWithZone:a3];
  bundleIdentifier = self->_bundleIdentifier;
  teamIdentifier = self->_teamIdentifier;
  char requiresSignatureValidation = self->_requiresSignatureValidation;

  return -[AEAssessmentApplication initWithBundleIdentifier:teamIdentifier:requiresSignatureValidation:](v4, bundleIdentifier, teamIdentifier, requiresSignatureValidation);
}

- (id)applicationDescriptor
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F20438]) initWithBundleIdentifier:self->_bundleIdentifier teamIdentifier:self->_teamIdentifier requiresSignatureValidation:self->_requiresSignatureValidation];

  return v2;
}

+ (id)instanceFromApplicationDescriptor:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = [AEAssessmentApplication alloc];
    v5 = [v3 bundleIdentifier];
    v6 = [v3 teamIdentifier];
    char v7 = [v3 requiresSignatureValidation];

    id v8 = -[AEAssessmentApplication initWithBundleIdentifier:teamIdentifier:requiresSignatureValidation:](v4, v5, v6, v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_teamIdentifier hash] ^ v3;
  v5 = [NSNumber numberWithBool:self->_requiresSignatureValidation];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (AEAssessmentApplication *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    char v6 = 1;
    goto LABEL_7;
  }
  if ([(AEAssessmentApplication *)v4 isMemberOfClass:objc_opt_class()]) {
    char v6 = -[AEAssessmentApplication isEqualToApplication:]((uint64_t)self, v5);
  }
  else {
LABEL_5:
  }
    char v6 = 0;
LABEL_7:

  return v6;
}

- (uint64_t)isEqualToApplication:(uint64_t)a1
{
  NSUInteger v3 = a2;
  if (a1)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    a1 = (!(v4 | v3[2]) || objc_msgSend((id)v4, "isEqual:"))
      && ((unint64_t v5 = *(void *)(a1 + 24), !(v5 | v3[3])) || objc_msgSend((id)v5, "isEqual:"))
      && *(unsigned __int8 *)(a1 + 8) == *((unsigned __int8 *)v3 + 8);
  }

  return a1;
}

- (id)description
{
  NSUInteger v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_requiresSignatureValidation) {
    unint64_t v5 = @"Yes";
  }
  else {
    unint64_t v5 = @"No";
  }
  return (id)[v3 stringWithFormat:@"<%@: %p { bundleIdentifier = %@, teamIdentifier = %@, requiresSignatureChecks = %@ }>", v4, self, self->_bundleIdentifier, self->_teamIdentifier, v5];
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

- (void)setRequiresSignatureValidation:(BOOL)requiresSignatureValidation
{
  self->_char requiresSignatureValidation = requiresSignatureValidation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamIdentifier, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
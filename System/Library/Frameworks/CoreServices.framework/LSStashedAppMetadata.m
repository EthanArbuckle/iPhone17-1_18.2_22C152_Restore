@interface LSStashedAppMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isFreeProfileValidated;
- (BOOL)isProfileValidated;
- (BOOL)isUPPValidated;
- (LSStashedAppMetadata)initWithCoder:(id)a3;
- (LSStashedAppMetadata)initWithContext:(LSContext *)a3 unitID:(unsigned int)a4;
- (NSDate)dateOriginallyInstalled;
- (NSDate)dateStashed;
- (NSString)bundleShortVersion;
- (NSString)exactBundleVersion;
- (NSString)signerOrganization;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSStashedAppMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSStashedAppMetadata)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)LSStashedAppMetadata;
  v4 = [(LSStashedAppMetadata *)&v16 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"exactBundleVersion");
    exactBundleVersion = v4->_exactBundleVersion;
    v4->_exactBundleVersion = (NSString *)v5;

    uint64_t v7 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleShortVersion");
    bundleShortVersion = v4->_bundleShortVersion;
    v4->_bundleShortVersion = (NSString *)v7;

    uint64_t v9 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"dateStashed");
    dateStashed = v4->_dateStashed;
    v4->_dateStashed = (NSDate *)v9;

    uint64_t v11 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"dateOriginallyInstalled");
    dateOriginallyInstalled = v4->_dateOriginallyInstalled;
    v4->_dateOriginallyInstalled = (NSDate *)v11;

    uint64_t v13 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"signerOrganization");
    signerOrganization = v4->_signerOrganization;
    v4->_signerOrganization = (NSString *)v13;

    v4->_validationState = [a3 decodeIntForKey:@"validationState"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_exactBundleVersion forKey:@"exactBundleVersion"];
  [a3 encodeObject:self->_bundleShortVersion forKey:@"bundleShortVersion"];
  [a3 encodeObject:self->_dateStashed forKey:@"dateStashed"];
  [a3 encodeObject:self->_dateOriginallyInstalled forKey:@"dateOriginallyInstalled"];
  [a3 encodeObject:self->_signerOrganization forKey:@"signerOrganization"];
  uint64_t validationState = self->_validationState;

  [a3 encodeInt:validationState forKey:@"validationState"];
}

- (LSStashedAppMetadata)initWithContext:(LSContext *)a3 unitID:(unsigned int)a4
{
  uint64_t v5 = +[_LSLazyPropertyList lazyPropertyListWithContext:a3 unit:*(void *)&a4];
  if (v5)
  {
    v25.receiver = self;
    v25.super_class = (Class)LSStashedAppMetadata;
    v6 = [(LSStashedAppMetadata *)&v25 init];
    if (v6)
    {
      uint64_t v7 = [v5 objectForKey:*MEMORY[0x1E4F1D020] ofClass:objc_opt_class()];
      exactBundleVersion = v6->_exactBundleVersion;
      v6->_exactBundleVersion = (NSString *)v7;

      uint64_t v9 = [v5 objectForKey:*MEMORY[0x1E4F1CC70] ofClass:objc_opt_class()];
      bundleShortVersion = v6->_bundleShortVersion;
      v6->_bundleShortVersion = (NSString *)v9;

      uint64_t v11 = [v5 objectForKey:@"StashedAtTimestamp" ofClass:objc_opt_class()];
      int v12 = [v11 longValue];

      uint64_t v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v12];
      dateStashed = v6->_dateStashed;
      v6->_dateStashed = (NSDate *)v13;

      v15 = [v5 objectForKey:@"StashOriginalInstallTimestamp" ofClass:objc_opt_class()];
      int v16 = [v15 longValue];

      uint64_t v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v16];
      dateOriginallyInstalled = v6->_dateOriginallyInstalled;
      v6->_dateOriginallyInstalled = (NSDate *)v17;

      uint64_t v19 = [v5 objectForKey:@"SignerOrganization" ofClass:objc_opt_class()];
      signerOrganization = v6->_signerOrganization;
      v6->_signerOrganization = (NSString *)v19;

      self = (LSStashedAppMetadata *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v21 = [v5 objectForKey:@"ProfileValidated" ofClass:objc_opt_class()];
      if (v21) {
        [(LSStashedAppMetadata *)self setObject:v21 forKeyedSubscript:@"ProfileValidated"];
      }

      v22 = [v5 objectForKey:@"UPPValidated" ofClass:objc_opt_class()];
      if (v22) {
        [(LSStashedAppMetadata *)self setObject:v22 forKeyedSubscript:@"UPPValidated"];
      }

      v23 = [v5 objectForKey:@"FreeProfileValidated" ofClass:objc_opt_class()];
      if (v23) {
        [(LSStashedAppMetadata *)self setObject:v23 forKeyedSubscript:@"FreeProfileValidated"];
      }

      v6->_uint64_t validationState = _LSGetProfileValidationStateFromInstallDictionary((const __CFDictionary *)self);
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isProfileValidated
{
  return self->_validationState != 0;
}

- (BOOL)isUPPValidated
{
  return self->_validationState == 2;
}

- (BOOL)isFreeProfileValidated
{
  return self->_validationState == 3;
}

- (NSString)exactBundleVersion
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)bundleShortVersion
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)dateStashed
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)dateOriginallyInstalled
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)signerOrganization
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signerOrganization, 0);
  objc_storeStrong((id *)&self->_dateOriginallyInstalled, 0);
  objc_storeStrong((id *)&self->_dateStashed, 0);
  objc_storeStrong((id *)&self->_bundleShortVersion, 0);

  objc_storeStrong((id *)&self->_exactBundleVersion, 0);
}

@end
@interface IXAppInstallCoordinatorSeed
+ (BOOL)supportsSecureCoding;
- (IXAppInstallCoordinatorSeed)initWithCoder:(id)a3;
- (IXApplicationIdentity)identity;
- (NSUUID)uniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)creator;
- (unint64_t)installationDomain;
- (unint64_t)intent;
- (unsigned)creatorEUID;
- (void)encodeWithCoder:(id)a3;
- (void)setCreator:(unint64_t)a3;
- (void)setCreatorEUID:(unsigned int)a3;
- (void)setIdentity:(id)a3;
- (void)setInstallationDomain:(unint64_t)a3;
- (void)setIntent:(unint64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation IXAppInstallCoordinatorSeed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXAppInstallCoordinatorSeed)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IXAppInstallCoordinatorSeed;
  id v5 = [(IXAppInstallCoordinatorSeed *)&v20 init];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
  v7 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v6;

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creator"];
  *((void *)v5 + 3) = [v8 unsignedLongLongValue];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creatorEUID"];
  *((_DWORD *)v5 + 2) = [v9 unsignedIntegerValue];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent"];
  *((void *)v5 + 4) = [v10 unsignedLongLongValue];

  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identity"];
  v12 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v11;

  if (!*((void *)v5 + 5))
  {
    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    if (v16)
    {
      v17 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v16];
      v18 = (void *)*((void *)v5 + 5);
      *((void *)v5 + 5) = v17;

      if (*((void *)v5 + 5))
      {

        goto LABEL_3;
      }
      v19 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        [(IXAppInstallCoordinatorSeed *)(uint64_t)v16 initWithCoder:v19];
      }
    }
    else
    {
      v19 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[IXAppInstallCoordinatorSeed initWithCoder:]((uint64_t)v5, v19);
      }
    }

    v14 = 0;
    goto LABEL_7;
  }
LABEL_3:
  if ([v4 containsValueForKey:@"installationDomain"])
  {
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installationDomain"];
    *((void *)v5 + 6) = [v13 unsignedIntegerValue];
  }
  else
  {
    *((void *)v5 + 6) = 1;
  }
LABEL_6:
  v14 = (IXAppInstallCoordinatorSeed *)v5;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IXAppInstallCoordinatorSeed *)self uniqueIdentifier];
  [v4 encodeObject:v5 forKey:@"uniqueIdentifier"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IXAppInstallCoordinatorSeed creator](self, "creator"));
  [v4 encodeObject:v6 forKey:@"creator"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[IXAppInstallCoordinatorSeed creatorEUID](self, "creatorEUID"));
  [v4 encodeObject:v7 forKey:@"creatorEUID"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IXAppInstallCoordinatorSeed intent](self, "intent"));
  [v4 encodeObject:v8 forKey:@"intent"];

  v9 = [(IXAppInstallCoordinatorSeed *)self identity];
  [v4 encodeObject:v9 forKey:@"identity"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IXAppInstallCoordinatorSeed installationDomain](self, "installationDomain"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"installationDomain"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(IXAppInstallCoordinatorSeed *)self uniqueIdentifier];
  [v4 setUniqueIdentifier:v5];

  objc_msgSend(v4, "setCreator:", -[IXAppInstallCoordinatorSeed creator](self, "creator"));
  objc_msgSend(v4, "setCreatorEUID:", -[IXAppInstallCoordinatorSeed creatorEUID](self, "creatorEUID"));
  objc_msgSend(v4, "setIntent:", -[IXAppInstallCoordinatorSeed intent](self, "intent"));
  uint64_t v6 = [(IXAppInstallCoordinatorSeed *)self identity];
  [v4 setIdentity:v6];

  objc_msgSend(v4, "setInstallationDomain:", -[IXAppInstallCoordinatorSeed installationDomain](self, "installationDomain"));
  return v4;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (unint64_t)creator
{
  return self->_creator;
}

- (void)setCreator:(unint64_t)a3
{
  self->_creator = a3;
}

- (unsigned)creatorEUID
{
  return self->_creatorEUID;
}

- (void)setCreatorEUID:(unsigned int)a3
{
  self->_creatorEUID = a3;
}

- (unint64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(unint64_t)a3
{
  self->_intent = a3;
}

- (IXApplicationIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (unint64_t)installationDomain
{
  return self->_installationDomain;
}

- (void)setInstallationDomain:(unint64_t)a3
{
  self->_installationDomain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  v3 = "-[IXAppInstallCoordinatorSeed initWithCoder:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_1A7B2D000, a2, OS_LOG_TYPE_FAULT, "%s: Both identity and bundleID were nil for %@", (uint8_t *)&v2, 0x16u);
}

- (void)initWithCoder:(os_log_t)log .cold.2(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 136315650;
  uint64_t v5 = "-[IXAppInstallCoordinatorSeed initWithCoder:]";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_fault_impl(&dword_1A7B2D000, log, OS_LOG_TYPE_FAULT, "%s: Identity was nil when deserializing IXAppInstallCoordinatorSeed for bundle ID %@ with unique identifier %@", (uint8_t *)&v4, 0x20u);
}

@end
@interface DMFAppRequest
+ (BOOL)supportsSecureCoding;
- (DMFAppRequest)initWithCoder:(id)a3;
- (NSNumber)storeItemIdentifier;
- (NSString)bundleIdentifier;
- (NSString)personaIdentifier;
- (NSString)sourceIdentifier;
- (NSURL)manifestURL;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setManifestURL:(id)a3;
- (void)setPersonaIdentifier:(id)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setStoreItemIdentifier:(id)a3;
@end

@implementation DMFAppRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFAppRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DMFAppRequest;
  v5 = [(CATTaskRequest *)&v22 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"storeItemIdentifier"];
    storeItemIdentifier = v5->_storeItemIdentifier;
    v5->_storeItemIdentifier = (NSNumber *)v10;

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"manifestURL"];
    manifestURL = v5->_manifestURL;
    v5->_manifestURL = (NSURL *)v13;

    v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"personaIdentifier"];
    personaIdentifier = v5->_personaIdentifier;
    v5->_personaIdentifier = (NSString *)v16;

    v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"sourceIdentifier"];
    sourceIdentifier = v5->_sourceIdentifier;
    v5->_sourceIdentifier = (NSString *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DMFAppRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v10 encodeWithCoder:v4];
  v5 = [(DMFAppRequest *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];

  v6 = [(DMFAppRequest *)self storeItemIdentifier];
  [v4 encodeObject:v6 forKey:@"storeItemIdentifier"];

  uint64_t v7 = [(DMFAppRequest *)self manifestURL];
  [v4 encodeObject:v7 forKey:@"manifestURL"];

  v8 = [(DMFAppRequest *)self personaIdentifier];
  [v4 encodeObject:v8 forKey:@"personaIdentifier"];

  v9 = [(DMFAppRequest *)self sourceIdentifier];
  [v4 encodeObject:v9 forKey:@"sourceIdentifier"];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSNumber)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (void)setStoreItemIdentifier:(id)a3
{
}

- (NSURL)manifestURL
{
  return self->_manifestURL;
}

- (void)setManifestURL:(id)a3
{
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (void)setPersonaIdentifier:(id)a3
{
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_manifestURL, 0);
  objc_storeStrong((id *)&self->_storeItemIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
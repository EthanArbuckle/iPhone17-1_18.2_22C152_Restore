@interface DMFFetchAppsRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
+ (id)permittedPlatforms;
- (BOOL)advanceTransientStates;
- (BOOL)deleteFeedback;
- (BOOL)managedAppsOnly;
- (DMFFetchAppsRequest)init;
- (DMFFetchAppsRequest)initWithCoder:(id)a3;
- (NSArray)bundleIdentifiers;
- (NSArray)propertyKeys;
- (NSNumber)storeItemIdentifier;
- (NSURL)manifestURL;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAdvanceTransientStates:(BOOL)a3;
- (void)setBundleIdentifiers:(id)a3;
- (void)setDeleteFeedback:(BOOL)a3;
- (void)setManagedAppsOnly:(BOOL)a3;
- (void)setManifestURL:(id)a3;
- (void)setPropertyKeys:(id)a3;
- (void)setStoreItemIdentifier:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation DMFFetchAppsRequest

- (DMFFetchAppsRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)DMFFetchAppsRequest;
  result = [(CATTaskRequest *)&v3 init];
  if (result) {
    result->_type = 3;
  }
  return result;
}

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1F18AB6B8;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchAppsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)DMFFetchAppsRequest;
  v5 = [(CATTaskRequest *)&v27 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v6 unsignedIntegerValue];

    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"bundleIdentifiers"];
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSArray *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deleteFeedback"];
    v5->_deleteFeedback = [v12 BOOLValue];

    v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"storeItemIdentifier"];
    storeItemIdentifier = v5->_storeItemIdentifier;
    v5->_storeItemIdentifier = (NSNumber *)v14;

    v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"manifestURL"];
    manifestURL = v5->_manifestURL;
    v5->_manifestURL = (NSURL *)v17;

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"managedAppsOnly"];
    v5->_managedAppsOnly = [v19 BOOLValue];

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"advanceTransientStates"];
    v5->_advanceTransientStates = [v20 BOOLValue];

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"propertyKeys"];
    propertyKeys = v5->_propertyKeys;
    v5->_propertyKeys = (NSArray *)v24;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)DMFFetchAppsRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v13 encodeWithCoder:v4];
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[DMFFetchAppsRequest type](self, "type", v13.receiver, v13.super_class));
  [v4 encodeObject:v5 forKey:@"type"];

  v6 = [(DMFFetchAppsRequest *)self bundleIdentifiers];
  [v4 encodeObject:v6 forKey:@"bundleIdentifiers"];

  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFFetchAppsRequest deleteFeedback](self, "deleteFeedback"));
  [v4 encodeObject:v7 forKey:@"deleteFeedback"];

  uint64_t v8 = [(DMFFetchAppsRequest *)self storeItemIdentifier];
  [v4 encodeObject:v8 forKey:@"storeItemIdentifier"];

  v9 = [(DMFFetchAppsRequest *)self manifestURL];
  [v4 encodeObject:v9 forKey:@"manifestURL"];

  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFFetchAppsRequest managedAppsOnly](self, "managedAppsOnly"));
  [v4 encodeObject:v10 forKey:@"managedAppsOnly"];

  v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFFetchAppsRequest advanceTransientStates](self, "advanceTransientStates"));
  [v4 encodeObject:v11 forKey:@"advanceTransientStates"];

  v12 = [(DMFFetchAppsRequest *)self propertyKeys];
  [v4 encodeObject:v12 forKey:@"propertyKeys"];
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
}

- (BOOL)deleteFeedback
{
  return self->_deleteFeedback;
}

- (void)setDeleteFeedback:(BOOL)a3
{
  self->_deleteFeedback = a3;
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

- (BOOL)managedAppsOnly
{
  return self->_managedAppsOnly;
}

- (void)setManagedAppsOnly:(BOOL)a3
{
  self->_managedAppsOnly = a3;
}

- (BOOL)advanceTransientStates
{
  return self->_advanceTransientStates;
}

- (void)setAdvanceTransientStates:(BOOL)a3
{
  self->_advanceTransientStates = a3;
}

- (NSArray)propertyKeys
{
  return self->_propertyKeys;
}

- (void)setPropertyKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyKeys, 0);
  objc_storeStrong((id *)&self->_manifestURL, 0);
  objc_storeStrong((id *)&self->_storeItemIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
}

@end
@interface DMFOpenURLRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (BOOL)lockInApp;
- (DMFOpenURLRequest)initWithCoder:(id)a3;
- (NSArray)handlingBundleIdentifiers;
- (NSString)URLDisplayName;
- (NSURL)url;
- (void)encodeWithCoder:(id)a3;
- (void)setHandlingBundleIdentifiers:(id)a3;
- (void)setLockInApp:(BOOL)a3;
- (void)setURLDisplayName:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation DMFOpenURLRequest

+ (id)permittedPlatforms
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 0;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFOpenURLRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DMFOpenURLRequest;
  v5 = [(CATTaskRequest *)&v19 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"URLDisplayName"];
    URLDisplayName = v5->_URLDisplayName;
    v5->_URLDisplayName = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lockInApp"];
    v5->_lockInApp = [v12 BOOLValue];

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"handlingBundleIdentifiers"];
    handlingBundleIdentifiers = v5->_handlingBundleIdentifiers;
    v5->_handlingBundleIdentifiers = (NSArray *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DMFOpenURLRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v9 encodeWithCoder:v4];
  v5 = [(DMFOpenURLRequest *)self url];
  [v4 encodeObject:v5 forKey:@"url"];

  v6 = [(DMFOpenURLRequest *)self URLDisplayName];
  [v4 encodeObject:v6 forKey:@"URLDisplayName"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFOpenURLRequest lockInApp](self, "lockInApp"));
  [v4 encodeObject:v7 forKey:@"lockInApp"];

  v8 = [(DMFOpenURLRequest *)self handlingBundleIdentifiers];
  [v4 encodeObject:v8 forKey:@"handlingBundleIdentifiers"];
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)URLDisplayName
{
  return self->_URLDisplayName;
}

- (void)setURLDisplayName:(id)a3
{
}

- (BOOL)lockInApp
{
  return self->_lockInApp;
}

- (void)setLockInApp:(BOOL)a3
{
  self->_lockInApp = a3;
}

- (NSArray)handlingBundleIdentifiers
{
  return self->_handlingBundleIdentifiers;
}

- (void)setHandlingBundleIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlingBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_URLDisplayName, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
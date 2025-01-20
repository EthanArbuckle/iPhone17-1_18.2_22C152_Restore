@interface CRKOpenURLRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)lockInApp;
- (CRKOpenURLRequest)initWithCoder:(id)a3;
- (NSArray)handlingBundleIdentifiers;
- (NSString)URLDisplayName;
- (NSURL)URL;
- (void)encodeWithCoder:(id)a3;
- (void)setHandlingBundleIdentifiers:(id)a3;
- (void)setLockInApp:(BOOL)a3;
- (void)setURL:(id)a3;
- (void)setURLDisplayName:(id)a3;
@end

@implementation CRKOpenURLRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKOpenURLRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CRKOpenURLRequest;
  v5 = [(CATTaskRequest *)&v19 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"URLDisplayName"];
    URLDisplayName = v5->_URLDisplayName;
    v5->_URLDisplayName = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lockInApp"];
    v5->_lockInApp = [v12 BOOLValue];

    v13 = (void *)MEMORY[0x263EFFA08];
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
  v9.super_class = (Class)CRKOpenURLRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v9 encodeWithCoder:v4];
  v5 = [(CRKOpenURLRequest *)self URL];
  [v4 encodeObject:v5 forKey:@"URL"];

  v6 = [(CRKOpenURLRequest *)self URLDisplayName];
  [v4 encodeObject:v6 forKey:@"URLDisplayName"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKOpenURLRequest lockInApp](self, "lockInApp"));
  [v4 encodeObject:v7 forKey:@"lockInApp"];

  v8 = [(CRKOpenURLRequest *)self handlingBundleIdentifiers];
  [v4 encodeObject:v8 forKey:@"handlingBundleIdentifiers"];
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
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

  objc_storeStrong((id *)&self->_URL, 0);
}

@end
@interface NEBundleProxy
+ (BOOL)supportsSecureCoding;
- (BOOL)isWatchKitApp;
- (NEBundleProxy)initWithCoder:(id)a3;
- (NEBundleProxy)initWithIdentifier:(id)a3 url:(id)a4 machOUUIDs:(id)a5 name:(id)a6 appGroups:(id)a7;
- (NSArray)appGroups;
- (NSArray)machOUUIDs;
- (NSString)identifier;
- (NSString)name;
- (NSURL)url;
- (void)encodeWithCoder:(id)a3;
- (void)setIsWatchKitApp:(BOOL)a3;
@end

@implementation NEBundleProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appGroups, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_machOUUIDs, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setIsWatchKitApp:(BOOL)a3
{
  self->_isWatchKitApp = a3;
}

- (BOOL)isWatchKitApp
{
  return self->_isWatchKitApp;
}

- (NSArray)appGroups
{
  return self->_appGroups;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)machOUUIDs
{
  return self->_machOUUIDs;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NEBundleProxy *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(NEBundleProxy *)self url];
  [v4 encodeObject:v6 forKey:@"url"];

  v7 = [(NEBundleProxy *)self machOUUIDs];
  [v4 encodeObject:v7 forKey:@"machOUUIDs"];

  v8 = [(NEBundleProxy *)self name];
  [v4 encodeObject:v8 forKey:@"name"];

  id v9 = [(NEBundleProxy *)self appGroups];
  [v4 encodeObject:v9 forKey:@"appGroups"];
}

- (NEBundleProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NEBundleProxy;
  v5 = [(NEBundleProxy *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"machOUUIDs"];
    machOUUIDs = v5->_machOUUIDs;
    v5->_machOUUIDs = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"appGroups"];
    appGroups = v5->_appGroups;
    v5->_appGroups = (NSArray *)v20;
  }
  return v5;
}

- (NEBundleProxy)initWithIdentifier:(id)a3 url:(id)a4 machOUUIDs:(id)a5 name:(id)a6 appGroups:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)NEBundleProxy;
  v17 = [(NEBundleProxy *)&v21 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v18->_url, a4);
    objc_storeStrong((id *)&v18->_machOUUIDs, a5);
    objc_storeStrong((id *)&v18->_name, a6);
    objc_storeStrong((id *)&v18->_appGroups, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
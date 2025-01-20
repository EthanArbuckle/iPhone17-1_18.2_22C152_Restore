@interface FPPathComponentDisplayMetadata
+ (BOOL)supportsSecureCoding;
- (FPPathComponentDisplayMetadata)initWithCoder:(id)a3;
- (FPPathComponentDisplayMetadata)initWithURL:(id)a3 displayName:(id)a4 suffix:(id)a5 bundleID:(id)a6 bundleURL:(id)a7;
- (NSString)bundleID;
- (NSString)displayName;
- (NSString)suffix;
- (NSURL)URL;
- (NSURL)bundleURL;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FPPathComponentDisplayMetadata

- (FPPathComponentDisplayMetadata)initWithURL:(id)a3 displayName:(id)a4 suffix:(id)a5 bundleID:(id)a6 bundleURL:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)FPPathComponentDisplayMetadata;
  v17 = [(FPPathComponentDisplayMetadata *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_URL, a3);
    objc_storeStrong((id *)&v18->_displayName, a4);
    objc_storeStrong((id *)&v18->_suffix, a5);
    objc_storeStrong((id *)&v18->_bundleID, a6);
    objc_storeStrong((id *)&v18->_bundleURL, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  URL = self->_URL;
  id v5 = a3;
  [v5 encodeObject:URL forKey:@"URL"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
  [v5 encodeObject:self->_suffix forKey:@"suffix"];
  [v5 encodeObject:self->_bundleID forKey:@"bundleID"];
  [v5 encodeObject:self->_bundleURL forKey:@"bundleURL"];
}

- (FPPathComponentDisplayMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleURL"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suffix"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];

  v10 = [(FPPathComponentDisplayMetadata *)self initWithURL:v5 displayName:v7 suffix:v8 bundleID:v9 bundleURL:v6];
  return v10;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)suffix
{
  return self->_suffix;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_suffix, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
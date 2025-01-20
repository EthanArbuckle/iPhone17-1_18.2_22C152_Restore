@interface CRSUIClusterThemeImageAsset
+ (BOOL)supportsBSXPCSecureCoding;
- (CRSUIClusterThemeImageAsset)initWithBSXPCCoder:(id)a3;
- (CRSUIClusterThemeImageAsset)initWithIdentifier:(id)a3 url:(id)a4;
- (NSSecurityScopedURLWrapper)url;
- (NSString)identifier;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation CRSUIClusterThemeImageAsset

- (CRSUIClusterThemeImageAsset)initWithIdentifier:(id)a3 url:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRSUIClusterThemeImageAsset;
  v9 = [(CRSUIClusterThemeImageAsset *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_url, a4);
  }

  return v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CRSUIClusterThemeImageAsset *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(CRSUIClusterThemeImageAsset *)self url];
  [v4 encodeObject:v6 forKey:@"url"];
}

- (CRSUIClusterThemeImageAsset)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    self = [(CRSUIClusterThemeImageAsset *)self initWithIdentifier:v5 url:v6];
    id v8 = self;
  }

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSSecurityScopedURLWrapper)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
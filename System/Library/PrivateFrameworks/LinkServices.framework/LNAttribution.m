@interface LNAttribution
+ (BOOL)supportsSecureCoding;
- (LNAttribution)initWithCoder:(id)a3;
- (LNAttribution)initWithSnippetModelData:(id)a3 snippetModelBundleIdentifier:(id)a4;
- (NSData)snippetModelData;
- (NSString)snippetModelBundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAttribution

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippetModelBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_snippetModelData, 0);
}

- (NSString)snippetModelBundleIdentifier
{
  return self->_snippetModelBundleIdentifier;
}

- (NSData)snippetModelData
{
  return self->_snippetModelData;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNAttribution *)self snippetModelData];
  [v4 encodeObject:v5 forKey:@"snippetModelData"];

  id v6 = [(LNAttribution *)self snippetModelBundleIdentifier];
  [v4 encodeObject:v6 forKey:@"snippetModelBundleIdentifier"];
}

- (LNAttribution)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"snippetModelData"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"snippetModelBundleIdentifier"];

  v7 = [(LNAttribution *)self initWithSnippetModelData:v5 snippetModelBundleIdentifier:v6];
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(LNAttribution *)self snippetModelData];
  id v6 = [(LNAttribution *)self snippetModelBundleIdentifier];
  v7 = (void *)[v4 initWithSnippetModelData:v5 snippetModelBundleIdentifier:v6];

  return v7;
}

- (LNAttribution)initWithSnippetModelData:(id)a3 snippetModelBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LNAttribution;
  v9 = [(LNAttribution *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_snippetModelData, a3);
    objc_storeStrong((id *)&v10->_snippetModelBundleIdentifier, a4);
    v11 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
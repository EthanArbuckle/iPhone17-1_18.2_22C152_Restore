@interface _EXItemProviderExtensionVendorLoadOperator
+ (BOOL)supportsSecureCoding;
- (NSUUID)extensionContextIdentifier;
- (NSUUID)identifier;
- (_EXItemProviderExtensionVendorLoadOperator)initWithCoder:(id)a3;
- (_EXItemProviderExtensionVendorLoadOperator)initWithExtensionContextIdentifier:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)loadItemForTypeIdentifier:(id)a3 completionHandler:(id)a4 expectedValueClass:(Class)a5 options:(id)a6;
- (void)loadPreviewImageWithCompletionHandler:(id)a3 expectedValueClass:(Class)a4 options:(id)a5;
- (void)setExtensionContextIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation _EXItemProviderExtensionVendorLoadOperator

- (_EXItemProviderExtensionVendorLoadOperator)initWithExtensionContextIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EXItemProviderExtensionVendorLoadOperator;
  v5 = [(_EXItemProviderExtensionVendorLoadOperator *)&v9 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F29128] UUID];
    [(_EXItemProviderExtensionVendorLoadOperator *)v5 setIdentifier:v6];

    [(_EXItemProviderExtensionVendorLoadOperator *)v5 setExtensionContextIdentifier:v4];
    v7 = v5;
  }

  return v5;
}

- (void)dealloc
{
  [(_EXItemProviderExtensionVendorLoadOperator *)self setExtensionContextIdentifier:0];
  [(_EXItemProviderExtensionVendorLoadOperator *)self setIdentifier:0];
  v3.receiver = self;
  v3.super_class = (Class)_EXItemProviderExtensionVendorLoadOperator;
  [(_EXItemProviderExtensionVendorLoadOperator *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXItemProviderExtensionVendorLoadOperator)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_EXItemProviderExtensionVendorLoadOperator *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(_EXItemProviderExtensionVendorLoadOperator *)v5 setIdentifier:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionContextIdentifier"];
    [(_EXItemProviderExtensionVendorLoadOperator *)v5 setExtensionContextIdentifier:v7];

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_EXItemProviderExtensionVendorLoadOperator *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(_EXItemProviderExtensionVendorLoadOperator *)self extensionContextIdentifier];
  [v4 encodeObject:v6 forKey:@"extensionContextIdentifier"];
}

- (void)loadItemForTypeIdentifier:(id)a3 completionHandler:(id)a4 expectedValueClass:(Class)a5 options:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  v13 = [(_EXItemProviderExtensionVendorLoadOperator *)self extensionContextIdentifier];
  v14 = +[EXExtensionContextImplementation _extensionContextForIdentifier:v13];

  v15 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  [v15 setObject:v12 forKeyedSubscript:0x1EE2CEE50];

  v16 = [(_EXItemProviderExtensionVendorLoadOperator *)self identifier];
  [v15 setObject:v16 forKeyedSubscript:0x1EE2CEE30];

  if (a5)
  {
    v17 = [NSString stringWithCString:class_getName(a5) encoding:4];
    [v15 setObject:v17 forKeyedSubscript:0x1EE2CEE70];
  }
  if (v11) {
    [v15 setObject:v11 forKeyedSubscript:0x1EE2CEE90];
  }
  v18 = [v14 internalImplementation];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __117___EXItemProviderExtensionVendorLoadOperator_loadItemForTypeIdentifier_completionHandler_expectedValueClass_options___block_invoke;
  v20[3] = &unk_1E573D030;
  id v21 = v10;
  id v19 = v10;
  [v18 _loadItemForPayload:v15 completionHandler:v20];
}

- (void)loadPreviewImageWithCompletionHandler:(id)a3 expectedValueClass:(Class)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(_EXItemProviderExtensionVendorLoadOperator *)self extensionContextIdentifier];
  id v11 = +[EXExtensionContextImplementation _extensionContextForIdentifier:v10];

  id v12 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  v13 = [(_EXItemProviderExtensionVendorLoadOperator *)self identifier];
  [v12 setObject:v13 forKeyedSubscript:0x1EE2CEE30];

  if (a4)
  {
    v14 = [NSString stringWithCString:class_getName(a4) encoding:4];
    [v12 setObject:v14 forKeyedSubscript:0x1EE2CEE70];
  }
  if (v9) {
    [v12 setObject:v9 forKeyedSubscript:0x1EE2CEE90];
  }
  v15 = [v11 internalImplementation];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __111___EXItemProviderExtensionVendorLoadOperator_loadPreviewImageWithCompletionHandler_expectedValueClass_options___block_invoke;
  v17[3] = &unk_1E573D030;
  id v18 = v8;
  id v16 = v8;
  [v15 _loadPreviewImageForPayload:v12 completionHandler:v17];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)extensionContextIdentifier
{
  return self->_extensionContextIdentifier;
}

- (void)setExtensionContextIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionContextIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
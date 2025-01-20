@interface LNViewSnippet
+ (BOOL)supportsSecureCoding;
- (LNViewSnippet)initWithCoder:(id)a3;
- (LNViewSnippet)initWithContainerBundleIdentifier:(id)a3 targetBundleIdentifier:(id)a4 snippetModelData:(id)a5;
- (LNViewSnippet)initWithContainerBundleIdentifier:(id)a3 targetBundleIdentifier:(id)a4 snippetModelData:(id)a5 snippetModelBundleIdentifier:(id)a6;
- (LNViewSnippet)initWithContainerBundleIdentifier:(id)a3 targetBundleIdentifier:(id)a4 snippetModelData:(id)a5 snippetModelBundleIdentifier:(id)a6 viewSnippetOptions:(id)a7;
- (LNViewSnippet)initWithContainerBundleIdentifier:(id)a3 targetBundleIdentifier:(id)a4 viewData:(id)a5;
- (LNViewSnippet)initWithContainerBundleIdentifier:(id)a3 targetBundleIdentifier:(id)a4 viewData:(id)a5 viewSnippetOptions:(id)a6;
- (LNViewSnippetOptions)viewSnippetOptions;
- (NSData)snippetModelData;
- (NSData)viewData;
- (NSString)containerBundleIdentifier;
- (NSString)snippetModelBundleIdentifier;
- (NSString)targetBundleIdentifier;
- (id)_initWithContainerBundleIdentifier:(id)a3 targetBundleIdentifier:(id)a4 viewData:(id)a5 snippetModelData:(id)a6 snippetModelBundleIdentifier:(id)a7 viewSnippetOptions:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNViewSnippet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippetModelBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_snippetModelData, 0);
  objc_storeStrong((id *)&self->_viewSnippetOptions, 0);
  objc_storeStrong((id *)&self->_viewData, 0);
  objc_storeStrong((id *)&self->_targetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
}

- (NSString)snippetModelBundleIdentifier
{
  return self->_snippetModelBundleIdentifier;
}

- (NSData)snippetModelData
{
  return self->_snippetModelData;
}

- (LNViewSnippetOptions)viewSnippetOptions
{
  return self->_viewSnippetOptions;
}

- (NSData)viewData
{
  return self->_viewData;
}

- (NSString)targetBundleIdentifier
{
  return self->_targetBundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNViewSnippet *)self containerBundleIdentifier];
  [v4 encodeObject:v5 forKey:@"containerBundleIdentifier"];

  v6 = [(LNViewSnippet *)self targetBundleIdentifier];
  [v4 encodeObject:v6 forKey:@"targetBundleIdentifier"];

  v7 = [(LNViewSnippet *)self viewData];
  [v4 encodeObject:v7 forKey:@"viewData"];

  v8 = [(LNViewSnippet *)self snippetModelData];
  [v4 encodeObject:v8 forKey:@"snippetModelData"];

  v9 = [(LNViewSnippet *)self snippetModelBundleIdentifier];
  [v4 encodeObject:v9 forKey:@"snippetModelBundleIdentifier"];

  id v10 = [(LNViewSnippet *)self viewSnippetOptions];
  [v4 encodeObject:v10 forKey:@"viewSnippetOptions"];
}

- (LNViewSnippet)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"viewData"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"snippetModelData"];
  if (v5 | v6)
  {
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerBundleIdentifier"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetBundleIdentifier"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"snippetModelBundleIdentifier"];
    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"viewSnippetOptions"];
    self = (LNViewSnippet *)[(LNViewSnippet *)self _initWithContainerBundleIdentifier:v7 targetBundleIdentifier:v8 viewData:v5 snippetModelData:v6 snippetModelBundleIdentifier:v9 viewSnippetOptions:v10];

    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = [(LNViewSnippet *)self containerBundleIdentifier];
  uint64_t v6 = [(LNViewSnippet *)self targetBundleIdentifier];
  v7 = [(LNViewSnippet *)self viewData];
  v8 = [(LNViewSnippet *)self snippetModelData];
  v9 = [(LNViewSnippet *)self snippetModelBundleIdentifier];
  id v10 = [(LNViewSnippet *)self viewSnippetOptions];
  v11 = (void *)[v4 _initWithContainerBundleIdentifier:v5 targetBundleIdentifier:v6 viewData:v7 snippetModelData:v8 snippetModelBundleIdentifier:v9 viewSnippetOptions:v10];

  return v11;
}

- (id)_initWithContainerBundleIdentifier:(id)a3 targetBundleIdentifier:(id)a4 viewData:(id)a5 snippetModelData:(id)a6 snippetModelBundleIdentifier:(id)a7 viewSnippetOptions:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v33.receiver = self;
  v33.super_class = (Class)LNViewSnippet;
  v20 = [(LNViewSnippet *)&v33 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    containerBundleIdentifier = v20->_containerBundleIdentifier;
    v20->_containerBundleIdentifier = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    targetBundleIdentifier = v20->_targetBundleIdentifier;
    v20->_targetBundleIdentifier = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    viewData = v20->_viewData;
    v20->_viewData = (NSData *)v25;

    uint64_t v27 = [v17 copy];
    snippetModelData = v20->_snippetModelData;
    v20->_snippetModelData = (NSData *)v27;

    uint64_t v29 = [v18 copy];
    snippetModelBundleIdentifier = v20->_snippetModelBundleIdentifier;
    v20->_snippetModelBundleIdentifier = (NSString *)v29;

    objc_storeStrong((id *)&v20->_viewSnippetOptions, a8);
    v31 = v20;
  }

  return v20;
}

- (LNViewSnippet)initWithContainerBundleIdentifier:(id)a3 targetBundleIdentifier:(id)a4 snippetModelData:(id)a5 snippetModelBundleIdentifier:(id)a6 viewSnippetOptions:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_opt_new();
  id v18 = [(LNViewSnippet *)self _initWithContainerBundleIdentifier:v16 targetBundleIdentifier:v15 viewData:v17 snippetModelData:v14 snippetModelBundleIdentifier:v13 viewSnippetOptions:v12];

  return v18;
}

- (LNViewSnippet)initWithContainerBundleIdentifier:(id)a3 targetBundleIdentifier:(id)a4 snippetModelData:(id)a5 snippetModelBundleIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_opt_new();
  id v15 = [[LNViewSnippetOptions alloc] initWithCanReplacePrintableText:0];
  id v16 = [(LNViewSnippet *)self _initWithContainerBundleIdentifier:v13 targetBundleIdentifier:v12 viewData:v14 snippetModelData:v11 snippetModelBundleIdentifier:v10 viewSnippetOptions:v15];

  return v16;
}

- (LNViewSnippet)initWithContainerBundleIdentifier:(id)a3 targetBundleIdentifier:(id)a4 snippetModelData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_new();
  id v12 = [[LNViewSnippetOptions alloc] initWithCanReplacePrintableText:0];
  id v13 = [(LNViewSnippet *)self _initWithContainerBundleIdentifier:v10 targetBundleIdentifier:v9 viewData:v11 snippetModelData:v8 snippetModelBundleIdentifier:0 viewSnippetOptions:v12];

  return v13;
}

- (LNViewSnippet)initWithContainerBundleIdentifier:(id)a3 targetBundleIdentifier:(id)a4 viewData:(id)a5 viewSnippetOptions:(id)a6
{
  return (LNViewSnippet *)[(LNViewSnippet *)self _initWithContainerBundleIdentifier:a3 targetBundleIdentifier:a4 viewData:a5 snippetModelData:0 snippetModelBundleIdentifier:0 viewSnippetOptions:a6];
}

- (LNViewSnippet)initWithContainerBundleIdentifier:(id)a3 targetBundleIdentifier:(id)a4 viewData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"LNViewSnippet.m", 19, @"Invalid parameter not satisfying: %@", @"viewData" object file lineNumber description];
  }
  id v12 = [[LNViewSnippetOptions alloc] initWithCanReplacePrintableText:0];
  id v13 = [(LNViewSnippet *)self _initWithContainerBundleIdentifier:v9 targetBundleIdentifier:v10 viewData:v11 snippetModelData:0 snippetModelBundleIdentifier:0 viewSnippetOptions:v12];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
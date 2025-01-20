@interface ISCustomRecipe
+ (id)customRecipeWithInfo:(id)a3 bundle:(id)a4;
- (IFBundle)bundle;
- (ISCompositorRecipe)recipe;
- (ISCustomRecipe)initWithRecipe:(id)a3 bitmapResources:(id)a4 symbolResources:(id)a5 bundle:(id)a6;
- (NSDictionary)bitmapResources;
- (NSDictionary)symbolResources;
- (id)resourceNamed:(id)a3;
@end

@implementation ISCustomRecipe

+ (id)customRecipeWithInfo:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(v5, "_IF_stringForKey:", @"recipe-name");
  if ([v7 isEqualToString:@"embossed-folder"])
  {
    v8 = @"ISEmbossedFolder";
  }
  else
  {
    objc_msgSend(v5, "_IF_stringForKey:", @"class-name");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
LABEL_7:
      v9 = 0;
      goto LABEL_8;
    }
  }
  if (![NSClassFromString(&v8->isa) conformsToProtocol:&unk_1F064E5D0])goto LABEL_7; {
  v9 = objc_opt_new();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    goto LABEL_7;
  }
  if (v9)
  {
    uint64_t v14 = objc_msgSend(v5, "_IF_dictionaryForKey:", @"bitmap-resources");
    v15 = (void *)v14;
    v16 = (void *)MEMORY[0x1E4F1CC08];
    if (v14) {
      v17 = (void *)v14;
    }
    else {
      v17 = (void *)MEMORY[0x1E4F1CC08];
    }
    id v10 = v17;

    uint64_t v18 = objc_msgSend(v5, "_IF_dictionaryForKey:", @"symbol-resources");
    v19 = (void *)v18;
    if (v18) {
      v20 = (void *)v18;
    }
    else {
      v20 = v16;
    }
    id v11 = v20;

    v12 = [[ISCustomRecipe alloc] initWithRecipe:v9 bitmapResources:v10 symbolResources:v11 bundle:v6];
    goto LABEL_9;
  }
LABEL_8:
  id v10 = 0;
  id v11 = 0;
  v12 = 0;
LABEL_9:

  return v12;
}

- (ISCustomRecipe)initWithRecipe:(id)a3 bitmapResources:(id)a4 symbolResources:(id)a5 bundle:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ISCustomRecipe;
  v15 = [(ISCustomRecipe *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_recipe, a3);
    uint64_t v17 = [v12 copy];
    bitmapResources = v16->_bitmapResources;
    v16->_bitmapResources = (NSDictionary *)v17;

    uint64_t v19 = [v13 copy];
    symbolResources = v16->_symbolResources;
    v16->_symbolResources = (NSDictionary *)v19;

    objc_storeStrong((id *)&v16->_bundle, a6);
  }

  return v16;
}

- (id)resourceNamed:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_bitmapResources _IF_stringForKey:v4];
  if (!v5
    || ([(IFBundle *)self->_bundle assetCatalogURL],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = 0,
        +[ISAssetCatalogResource assetCatalogResourceWithURL:v6 imageName:v5 error:&v12], v7 = objc_claimAutoreleasedReturnValue(), v6, !v7))
  {
    v8 = [(NSDictionary *)self->_symbolResources _IF_stringForKey:v4];
    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F6F210]);
      id v10 = [(IFBundle *)self->_bundle bundleURL];
      v7 = (void *)[v9 initWithSymbolName:v8 bundleURL:v10];
    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

- (ISCompositorRecipe)recipe
{
  return (ISCompositorRecipe *)objc_getProperty(self, a2, 8, 1);
}

- (IFBundle)bundle
{
  return (IFBundle *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)bitmapResources
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)symbolResources
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolResources, 0);
  objc_storeStrong((id *)&self->_bitmapResources, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
}

@end
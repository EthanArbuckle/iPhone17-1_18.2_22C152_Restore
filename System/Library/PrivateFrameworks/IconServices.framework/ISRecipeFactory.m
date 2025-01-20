@interface ISRecipeFactory
+ (id)factoryWithDescriptor:(id)a3;
+ (id)factoryWithDescriptor:(id)a3 resourceProvider:(id)a4;
- (BOOL)shouldSegment;
- (ISImageDescriptor)descriptor;
- (ISRecipeFactory)initWithDescriptor:(id)a3 resourceProvider:(id)a4;
- (ISResourceProvider)resourceProvider;
- (id)_recipe;
- (id)_recipeFromDescriptor;
- (id)genericTaggedRecipe;
- (id)recipe;
- (void)_recipe;
- (void)enableSegmentationForRecipe:(id)a3;
- (void)pushDescriptorContentsToRecipe:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setResourceProvider:(id)a3;
@end

@implementation ISRecipeFactory

+ (id)factoryWithDescriptor:(id)a3
{
  id v3 = a3;
  v4 = [[ISRecipeFactory alloc] initWithDescriptor:v3 resourceProvider:0];

  return v4;
}

+ (id)factoryWithDescriptor:(id)a3 resourceProvider:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[ISRecipeFactory alloc] initWithDescriptor:v6 resourceProvider:v5];

  return v7;
}

- (ISRecipeFactory)initWithDescriptor:(id)a3 resourceProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ISRecipeFactory;
  v9 = [(ISRecipeFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resourceProvider, a4);
    objc_storeStrong((id *)&v10->_descriptor, a3);
  }

  return v10;
}

- (id)_recipeFromDescriptor
{
  v2 = [(ISRecipeFactory *)self descriptor];
  id v3 = [v2 _recipe];

  return v3;
}

- (id)_recipe
{
  id v3 = [(ISRecipeFactory *)self descriptor];
  uint64_t v4 = [v3 shape];

  if (!v4
    || ([(ISRecipeFactory *)self descriptor],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 _recipe],
        id v6 = (ISGenericRecipe *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    id v7 = [(ISRecipeFactory *)self resourceProvider];
    id v8 = [v7 suggestedRecipe];

    if (!v8) {
      goto LABEL_7;
    }
    v9 = [(ISRecipeFactory *)self resourceProvider];
    id v6 = [v9 suggestedRecipe];

    v10 = _ISDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      [(ISRecipeFactory *)(uint64_t)v6 _recipe];
    }

    if (!v6)
    {
LABEL_7:
      v11 = [(ISRecipeFactory *)self resourceProvider];
      objc_super v12 = [v11 iconResource];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0 || (id v6 = objc_alloc_init(ISGenericRecipe)) == 0)
      {
        v14 = [(ISRecipeFactory *)self resourceProvider];
        uint64_t v15 = [v14 resourceType];

        if (!v15) {
          goto LABEL_17;
        }
        v16 = [(ISRecipeFactory *)self resourceProvider];
        uint64_t v17 = [v16 resourceType];

        if (v17 == 2)
        {
          v20 = [(ISRecipeFactory *)self resourceProvider];
          uint64_t v24 = [v20 platform];
          v22 = [(ISRecipeFactory *)self descriptor];
          uint64_t v23 = +[ISRecipeInfo documentRecipeForPlatform:v24 descriptor:v22];
          goto LABEL_15;
        }
        if (v17 != 1)
        {
LABEL_17:
          v25 = _ISDefaultLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            -[ISRecipeFactory _recipe](v25);
          }

          v26 = [(ISRecipeFactory *)self descriptor];
          id v6 = +[ISRecipeInfo genericRecipeWithAppliedDescriptorRecipeAttributes:v26];

          goto LABEL_20;
        }
        v18 = [(ISRecipeFactory *)self descriptor];
        uint64_t v19 = [v18 platformStyle];

        if (v19)
        {
          v20 = [(ISRecipeFactory *)self descriptor];
          uint64_t v21 = [v20 platformStyle];
          v22 = [(ISRecipeFactory *)self descriptor];
          uint64_t v23 = +[ISRecipeInfo appRecipeForPlatformStyle:v21 descriptor:v22];
LABEL_15:
          id v6 = (ISGenericRecipe *)v23;

          goto LABEL_16;
        }
        v31 = [(ISRecipeFactory *)self resourceProvider];
        if ([v31 platform] == 2)
        {
          v32 = [(ISRecipeFactory *)self resourceProvider];
          int v33 = [v32 isPrecomposed];

          if (v33)
          {
            v20 = [(ISRecipeFactory *)self descriptor];
            uint64_t v34 = 1;
LABEL_37:
            id v6 = +[ISRecipeInfo appRecipeForPlatform:v34 descriptor:v20];
LABEL_16:

            if (v6) {
              goto LABEL_20;
            }
            goto LABEL_17;
          }
        }
        else
        {
        }
        v35 = [(ISRecipeFactory *)self resourceProvider];
        if ([v35 platform] == 4)
        {
          v36 = +[ISPlatformInfo sharedInstance];
          if ([v36 nativePlatform] == 1)
          {
            v37 = [(ISRecipeFactory *)self resourceProvider];
            char v38 = [v37 isPrecomposed];

            if ((v38 & 1) == 0)
            {
              v20 = [(ISRecipeFactory *)self descriptor];
              uint64_t v34 = 2;
              goto LABEL_37;
            }
LABEL_40:
            v20 = [(ISRecipeFactory *)self resourceProvider];
            uint64_t v39 = [v20 platform];
            v22 = [(ISRecipeFactory *)self descriptor];
            uint64_t v23 = +[ISRecipeInfo appRecipeForPlatform:v39 descriptor:v22];
            goto LABEL_15;
          }
        }
        goto LABEL_40;
      }
    }
  }
LABEL_20:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = [(ISRecipeFactory *)self descriptor];
    -[ISGenericRecipe setShouldDrawBorder:](v6, "setShouldDrawBorder:", [v27 drawBorder]);
  }
  v28 = [(ISRecipeFactory *)self resourceProvider];
  if ([v28 isGenericProvider])
  {
    objc_opt_class();
    char v29 = objc_opt_isKindOfClass();

    if (v29) {
      [(ISGenericRecipe *)v6 setGeneric:1];
    }
  }
  else
  {
  }
  return v6;
}

- (id)recipe
{
  id v3 = [(ISRecipeFactory *)self resourceProvider];

  if (v3) {
    [(ISRecipeFactory *)self _recipe];
  }
  else {
  uint64_t v4 = [(ISRecipeFactory *)self _recipeFromDescriptor];
  }
  [(ISRecipeFactory *)self pushDescriptorContentsToRecipe:v4];
  if ([(ISRecipeFactory *)self shouldSegment]) {
    [(ISRecipeFactory *)self enableSegmentationForRecipe:v4];
  }
  return v4;
}

- (id)genericTaggedRecipe
{
  v2 = [(ISRecipeFactory *)self recipe];
  if (objc_opt_respondsToSelector()) {
    [v2 setGeneric:1];
  }
  return v2;
}

- (BOOL)shouldSegment
{
  uint64_t v4 = [(ISRecipeFactory *)self descriptor];
  uint64_t v5 = [v4 appearance];
  if (v5 != 1)
  {
    id v2 = [(ISRecipeFactory *)self descriptor];
    if ([v2 appearance] != 2)
    {
      BOOL v9 = 0;
LABEL_23:

      goto LABEL_24;
    }
  }
  id v6 = [(ISRecipeFactory *)self resourceProvider];
  if (![v6 allowNonDefaultAppearances])
  {

    BOOL v9 = 0;
    if (v5 == 1) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  id v7 = [(ISRecipeFactory *)self resourceProvider];
  int v8 = [v7 allowAlterationsToResourceArt];

  if (v5 != 1)
  {

    if ((v8 & 1) == 0) {
      return 0;
    }
LABEL_11:
    v10 = [(ISRecipeFactory *)self resourceProvider];
    uint64_t v4 = [v10 iconResource];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v9 = 1;
LABEL_24:

      return v9;
    }
    id v2 = v4;
    v11 = [(ISRecipeFactory *)self descriptor];
    if ([v11 appearance] == 1)
    {
      char v12 = [v2 hasDarkResource];

      if (v12) {
        goto LABEL_19;
      }
    }
    else
    {
    }
    v13 = [(ISRecipeFactory *)self descriptor];
    if ([v13 appearance] == 2)
    {
      char v14 = [v2 hasTintableResource];

      if (v14)
      {
LABEL_19:
        BOOL v9 = 0;
LABEL_22:
        uint64_t v4 = v2;
        goto LABEL_23;
      }
    }
    else
    {
    }
    BOOL v9 = 1;
    goto LABEL_22;
  }

  if (v8) {
    goto LABEL_11;
  }
  return 0;
}

- (void)enableSegmentationForRecipe:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    [v3 setSegment:1];
  }
}

- (void)pushDescriptorContentsToRecipe:(id)a3
{
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [(ISRecipeFactory *)self descriptor];
    [v5 updateRecipeWithImageDescriptor:v4];
  }
}

- (ISResourceProvider)resourceProvider
{
  return (ISResourceProvider *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResourceProvider:(id)a3
{
}

- (ISImageDescriptor)descriptor
{
  return (ISImageDescriptor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_resourceProvider, 0);
}

- (void)_recipe
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AE771000, a2, OS_LOG_TYPE_DEBUG, "Allowing provider to suggest recipe: %@", (uint8_t *)&v2, 0xCu);
}

@end
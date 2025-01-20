@interface ISRecipeInfo
+ (id)appRecipeForPlatform:(unint64_t)a3 descriptor:(id)a4;
+ (id)appRecipeForPlatformStyle:(unint64_t)a3 descriptor:(id)a4;
+ (id)documentRecipeForPlatform:(unint64_t)a3 descriptor:(id)a4;
+ (id)genericRecipeWithAppliedDescriptorRecipeAttributes:(id)a3;
@end

@implementation ISRecipeInfo

+ (id)appRecipeForPlatform:(unint64_t)a3 descriptor:(id)a4
{
  id v5 = a4;
  switch(a3)
  {
    case 1uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_6;
    case 2uLL:
      v6 = ISiOSMacAppRecipe;
      goto LABEL_7;
    case 4uLL:
      v8 = (ISrOSAppRecipe *)objc_opt_new();
      [(ISrOSAppRecipe *)v8 updateRecipeWithImageDescriptor:v5];
      goto LABEL_12;
    case 8uLL:
      v7 = ISwatchOSAppRecipe;
      goto LABEL_10;
    default:
      if (a3 == 16)
      {
        v8 = objc_alloc_init(ISrOSAppRecipe);
        -[ISrOSAppRecipe setShouldApplyMask:](v8, "setShouldApplyMask:", [v5 shouldApplyMask]);
        -[ISrOSAppRecipe setTemplateVariant:](v8, "setTemplateVariant:", [v5 templateVariant]);
      }
      else if (a3 == 32)
      {
        v7 = IStvOSAppRecipe;
LABEL_10:
        v8 = (ISrOSAppRecipe *)objc_alloc_init(v7);
        -[ISrOSAppRecipe setShouldApplyMask:](v8, "setShouldApplyMask:", [v5 shouldApplyMask]);
      }
      else
      {
LABEL_6:
        v6 = ISGenericRecipe;
LABEL_7:
        v8 = (ISrOSAppRecipe *)objc_alloc_init(v6);
      }
LABEL_12:

      return v8;
  }
}

+ (id)documentRecipeForPlatform:(unint64_t)a3 descriptor:(id)a4
{
  char v4 = a3;
  id v5 = a4;
  if ((v4 & 0x3C) != 0)
  {
    v6 = objc_alloc_init(ISiosDocumentRecipe);
    [(ISiosDocumentRecipe *)v6 setOptions:1];
    if ([v5 variantOptions]) {
      [(ISiosDocumentRecipe *)v6 setOptions:[(ISiosDocumentRecipe *)v6 options] | 4];
    }
  }
  else
  {
    v6 = objc_alloc_init(ISmacosDocumentRecipe1016);
  }

  return v6;
}

+ (id)appRecipeForPlatformStyle:(unint64_t)a3 descriptor:(id)a4
{
  id v5 = a4;
  if (a3 == 1)
  {
    v8 = +[ISRecipeInfo appRecipeForPlatform:4 descriptor:v5];
  }
  else
  {
    if (!a3)
    {
      v6 = +[ISPlatformInfo sharedInstance];
      v7 = +[ISRecipeInfo appRecipeForPlatform:descriptor:](ISRecipeInfo, "appRecipeForPlatform:descriptor:", [v6 nativePlatform], v5);

      goto LABEL_9;
    }
    v9 = _ISDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[ISRecipeInfo appRecipeForPlatformStyle:descriptor:](a3, v9);
    }

    v8 = objc_alloc_init(ISGenericRecipe);
  }
  v7 = v8;
LABEL_9:

  return v7;
}

+ (id)genericRecipeWithAppliedDescriptorRecipeAttributes:(id)a3
{
  v3 = objc_alloc_init(ISGenericRecipe);
  return v3;
}

+ (void)appRecipeForPlatformStyle:(uint64_t)a1 descriptor:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1AE771000, a2, OS_LOG_TYPE_FAULT, "Unknown platform style: %lu", (uint8_t *)&v2, 0xCu);
}

@end
@interface IFImage(ISPlaceholderImage)
+ (NSObject)_placeholderImageWithImageDescriptor:()ISPlaceholderImage markAsPlaceholder:fallbackTypeID:referenceIcon:;
+ (id)_applyTreatmentsAndCacheResultForResource:()ISPlaceholderImage descriptor:description:;
+ (id)_debugPlaceholderImageWithImageDescriptor:()ISPlaceholderImage markAsPlaceholder:fallbackTypeID:referenceIcon:;
@end

@implementation IFImage(ISPlaceholderImage)

+ (id)_applyTreatmentsAndCacheResultForResource:()ISPlaceholderImage descriptor:description:
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = NSString;
  id v10 = a5;
  v11 = [v8 digest];
  v12 = [v11 UUIDString];
  [v8 size];
  uint64_t v14 = v13;
  [v8 size];
  uint64_t v16 = v15;
  [v8 scale];
  v18 = [v9 stringWithFormat:@"%@_%@,%.1f,%.1f,%.f", v10, v12, v14, v16, v17];

  v19 = +[ISStaticResources sharedInstance];
  v20 = [v19 _findStaticImageWithKey:v18];

  if (!v20)
  {
    v21 = +[ISRecipeFactory factoryWithDescriptor:v8];
    v22 = [v21 genericTaggedRecipe];

    v23 = objc_alloc_init(ISCompositor);
    if ([v8 shape] == 5 || objc_msgSend(v8, "shape") == 6) {
      [(ISCompositor *)v23 setRenderingMode:2];
    }
    v32 = @"kISPrimaryResourceKey";
    v33[0] = v7;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    [(ISCompositor *)v23 addElementWithRecipe:v22 resources:v24];

    [v8 size];
    double v26 = v25;
    double v28 = v27;
    [v8 scale];
    v20 = -[ISCompositor imageForSize:scale:](v23, "imageForSize:scale:", v26, v28, v29);
    if (v20)
    {
      v30 = +[ISStaticResources sharedInstance];
      [v30 _addStaticImage:v20 withKey:v18];
    }
  }

  return v20;
}

+ (NSObject)_placeholderImageWithImageDescriptor:()ISPlaceholderImage markAsPlaceholder:fallbackTypeID:referenceIcon:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = +[ISStaticResources sharedInstance];
  uint64_t v14 = [v13 fallbackResourceForHint:v11 descriptor:v10 referenceObj:v12];

  if (!v14)
  {
    uint64_t v16 = _ISDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      +[IFImage(ISPlaceholderImage) _placeholderImageWithImageDescriptor:markAsPlaceholder:fallbackTypeID:referenceIcon:]((uint64_t)v11, v16);
    }
    goto LABEL_12;
  }
  uint64_t v15 = [a1 _applyTreatmentsAndCacheResultForResource:v14 descriptor:v10 description:@"placeholder"];
  uint64_t v16 = v15;
  if (!v15 || ![v15 CGImage])
  {
    v18 = _ISDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      int v20 = 138413058;
      v21 = v16;
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = v10;
      __int16 v26 = 2112;
      id v27 = v12;
      _os_log_fault_impl(&dword_1AE771000, v18, OS_LOG_TYPE_FAULT, "Failed to create placeholder image. Image: %@. Fallback type: %@. Descriptor: %@. Icon: %@", (uint8_t *)&v20, 0x2Au);
    }

LABEL_12:
    uint64_t v16 = 0;
    goto LABEL_13;
  }
  if (a4)
  {
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F6F200]) initWithImage:v16];

    uint64_t v16 = v17;
  }
  [v16 setValidationFlags:[v16 validationFlags] | 2];
LABEL_13:

  return v16;
}

+ (id)_debugPlaceholderImageWithImageDescriptor:()ISPlaceholderImage markAsPlaceholder:fallbackTypeID:referenceIcon:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = +[ISStaticResources sharedInstance];
  uint64_t v14 = [v13 debugGenericAppIconResource];

  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v14, "setAppearance:", objc_msgSend(v10, "appearance"));
    }
    uint64_t v15 = [a1 _applyTreatmentsAndCacheResultForResource:v14 descriptor:v10 description:@"debug_placeholder"];
    uint64_t v16 = v15;
    if (v15 && [v15 CGImage])
    {
      if (a4)
      {
        uint64_t v17 = [objc_alloc(MEMORY[0x1E4F6F200]) initWithImage:v16];

        uint64_t v16 = (void *)v17;
      }
      objc_msgSend(v16, "setValidationFlags:", objc_msgSend(v16, "validationFlags") | 2);
      v18 = v16;
    }
    else
    {
      v19 = _ISDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        int v22 = 138413058;
        id v23 = v16;
        __int16 v24 = 2112;
        id v25 = v11;
        __int16 v26 = 2112;
        id v27 = v10;
        __int16 v28 = 2112;
        id v29 = v12;
        _os_log_fault_impl(&dword_1AE771000, v19, OS_LOG_TYPE_FAULT, "Failed to create debug placeholder image. Image: %@. Fallback type: %@. Descriptor: %@. Icon: %@", (uint8_t *)&v22, 0x2Au);
      }

      v18 = [a1 _placeholderImageWithImageDescriptor:v10 markAsPlaceholder:a4 fallbackTypeID:v11 referenceIcon:v12];
    }
  }
  else
  {
    int v20 = _ISDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      +[IFImage(ISPlaceholderImage) _debugPlaceholderImageWithImageDescriptor:markAsPlaceholder:fallbackTypeID:referenceIcon:](v20);
    }

    v18 = [a1 _placeholderImageWithImageDescriptor:v10 markAsPlaceholder:a4 fallbackTypeID:v11 referenceIcon:v12];
  }

  return v18;
}

+ (void)_placeholderImageWithImageDescriptor:()ISPlaceholderImage markAsPlaceholder:fallbackTypeID:referenceIcon:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1AE771000, a2, OS_LOG_TYPE_FAULT, "Failed to create placeholder resource. Fallback type: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_debugPlaceholderImageWithImageDescriptor:()ISPlaceholderImage markAsPlaceholder:fallbackTypeID:referenceIcon:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AE771000, log, OS_LOG_TYPE_FAULT, "Failed to create debug placeholder resource", v1, 2u);
}

@end
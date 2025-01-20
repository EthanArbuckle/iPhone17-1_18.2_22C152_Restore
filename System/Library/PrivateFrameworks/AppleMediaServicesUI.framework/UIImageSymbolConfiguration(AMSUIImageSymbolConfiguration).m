@interface UIImageSymbolConfiguration(AMSUIImageSymbolConfiguration)
+ (id)ams_imageSymbolConfigurationScaleWithDictionary:()AMSUIImageSymbolConfiguration;
+ (id)ams_imageSymbolConfigurationStyleWithDictionary:()AMSUIImageSymbolConfiguration;
+ (id)ams_imageSymbolConfigurationTextStyleWithDictionary:()AMSUIImageSymbolConfiguration;
+ (id)ams_imageSymbolConfigurationWithDictionary:()AMSUIImageSymbolConfiguration;
@end

@implementation UIImageSymbolConfiguration(AMSUIImageSymbolConfiguration)

+ (id)ams_imageSymbolConfigurationWithDictionary:()AMSUIImageSymbolConfiguration
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = objc_msgSend(a1, "ams_imageSymbolConfigurationStyleWithDictionary:", v5);
    v7 = objc_msgSend(a1, "ams_imageSymbolConfigurationTextStyleWithDictionary:", v5);
    v8 = v7;
    if (v6)
    {
      id v9 = [v6 configurationByApplyingConfiguration:v7];
    }
    else
    {
      id v9 = v7;
    }
    v11 = objc_msgSend(a1, "ams_imageSymbolConfigurationScaleWithDictionary:", v5);
    v12 = v11;
    if (v9)
    {
      id v10 = [v9 configurationByApplyingConfiguration:v11];
    }
    else
    {
      id v10 = v11;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)ams_imageSymbolConfigurationScaleWithDictionary:()AMSUIImageSymbolConfiguration
{
  v3 = [a3 objectForKeyedSubscript:@"scale"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (v4)
  {
    if (ams_imageSymbolConfigurationScaleWithDictionary__ams_once_token___COUNTER__ != -1) {
      dispatch_once(&ams_imageSymbolConfigurationScaleWithDictionary__ams_once_token___COUNTER__, &__block_literal_global_8);
    }
    v5 = [(id)ams_imageSymbolConfigurationScaleWithDictionary__ams_once_object___COUNTER__ objectForKeyedSubscript:v4];
    v6 = v5;
    if (v5)
    {
      v7 = objc_msgSend(MEMORY[0x263F82818], "configurationWithScale:", objc_msgSend(v5, "integerValue"));
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)ams_imageSymbolConfigurationTextStyleWithDictionary:()AMSUIImageSymbolConfiguration
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"textStyle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5
    || (([v3 objectForKeyedSubscript:@"text-style"],
         v6 = objc_claimAutoreleasedReturnValue(),
         objc_opt_class(),
         (objc_opt_isKindOfClass() & 1) == 0)
      ? (id v5 = 0)
      : (id v5 = v6),
        v6,
        v5))
  {
    v7 = +[AMSUIFontParser fontTextStyleForString:v5];
    if (v7)
    {
      v8 = [MEMORY[0x263F82818] configurationWithTextStyle:v7];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)ams_imageSymbolConfigurationStyleWithDictionary:()AMSUIImageSymbolConfiguration
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"style"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6 = [v3 objectForKeyedSubscript:@"colors"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (!v7)
  {
    v8 = [v3 objectForKeyedSubscript:@"colors"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    if (v9)
    {
      id v10 = (void *)MEMORY[0x263F08900];
      v11 = [v9 dataUsingEncoding:4];
      v12 = [v10 JSONObjectWithData:v11 options:0 error:0];

      id v13 = v12;
      objc_opt_class();
      id v7 = 0;
      if (objc_opt_isKindOfClass()) {
        id v7 = v13;
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  v14 = objc_msgSend(v7, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_45);
  if ([v5 isEqualToString:@"hierarchical"] && objc_msgSend(v14, "count"))
  {
    v15 = (void *)MEMORY[0x263F82818];
    v16 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v14, "count") - 1);
    v17 = [v15 configurationWithHierarchicalColor:v16];

    goto LABEL_28;
  }
  if ([v5 isEqualToString:@"monochrome"])
  {
    uint64_t v18 = [MEMORY[0x263F82818] configurationPreferringMonochrome];
LABEL_27:
    v17 = (void *)v18;
    goto LABEL_28;
  }
  if ([v5 isEqualToString:@"multicolor"])
  {
    uint64_t v18 = [MEMORY[0x263F82818] configurationPreferringMulticolor];
    goto LABEL_27;
  }
  if ([v5 isEqualToString:@"palette"] && objc_msgSend(v14, "count"))
  {
    uint64_t v18 = [MEMORY[0x263F82818] configurationWithPaletteColors:v14];
    goto LABEL_27;
  }
  v17 = 0;
LABEL_28:

  return v17;
}

@end
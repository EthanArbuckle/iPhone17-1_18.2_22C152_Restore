@interface GCSController(GameController)
+ (__CFString)productCategoryLocalizationKeyForProductCategory:()GameController;
+ (id)generateElementDictionaryFromElements:()GameController;
- (id)initWithController:()GameController;
@end

@implementation GCSController(GameController)

+ (__CFString)productCategoryLocalizationKeyForProductCategory:()GameController
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DualShock 4"])
  {
    v4 = @"PRODUCT_CATEGORY_DUALSHOCK4";
  }
  else if ([v3 isEqualToString:@"DualSense"])
  {
    v4 = @"PRODUCT_CATEGORY_DUALSENSE";
  }
  else
  {
    if ([v3 isEqualToString:@"Xbox One"]) {
      goto LABEL_6;
    }
    if ([v3 isEqualToString:@"Xbox Elite"])
    {
      v4 = @"PRODUCT_CATEGORY_XBOX_ELITE";
      goto LABEL_21;
    }
    if ([v3 isEqualToString:@"Xbox Adaptive"])
    {
      v4 = @"PRODUCT_CATEGORY_XBOX_ADAPTIVE";
      goto LABEL_21;
    }
    if ([v3 isEqualToString:@"Xbox Series X"])
    {
LABEL_6:
      v4 = @"PRODUCT_CATEGORY_XBOX_ONE";
    }
    else if ([v3 isEqualToString:@"MFi"])
    {
      v4 = @"PRODUCT_CATEGORY_MFI";
    }
    else if ([v3 isEqualToString:@"HID"])
    {
      v4 = @"PRODUCT_CATEGORY_HID";
    }
    else if ([v3 isEqualToString:@"Switch JoyCon"])
    {
      v4 = @"PRODUCT_CATEGORY_NINTENDO_JOY_CON";
    }
    else if ([v3 isEqualToString:@"Switch Pro Controller"])
    {
      v4 = @"PRODUCT_CATEGORY_NINTENDO_PRO_CONTROLLER";
    }
    else
    {
      v4 = @"PRODUCT_CATEGORY_GENERIC_CONTROLLER";
    }
  }
LABEL_21:

  return v4;
}

- (id)initWithController:()GameController
{
  id v3 = a3;
  v47 = [v3 vendorName];
  v4 = [v3 identifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v46 = [v3 identifier];
  }
  else
  {
    v46 = @"CONTROLLER";
  }
  v6 = [v3 physicalInputProfile];
  v7 = [v6 buttons];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"Button Share"];

  v9 = [v3 physicalInputProfile];
  v10 = [v9 buttons];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"Button Options"];

  if (v8)
  {
    id v12 = objc_alloc((Class)&off_26D2ACB70);
    uint64_t v13 = v8;
  }
  else
  {
    v14 = [v3 physicalInputProfile];
    v15 = [v14 buttons];
    v16 = [v15 objectForKeyedSubscript:@"Button Options"];

    if (!v16)
    {
      v42 = 0;
      goto LABEL_9;
    }
    id v12 = objc_alloc((Class)&off_26D2ACB70);
    uint64_t v13 = v11;
  }
  v42 = (void *)[v12 initWithElement:v13];
LABEL_9:
  v17 = [v3 physicalInputProfile];
  v18 = [v17 allButtons];
  v41 = +[GCSController generateElementDictionaryFromElements:v18];

  v19 = [v3 physicalInputProfile];
  v20 = [v19 allDpads];
  v40 = +[GCSController generateElementDictionaryFromElements:v20];

  v21 = [v3 physicalInputProfile];
  v22 = [v21 objectForKeyedSubscript:@"Button Home"];
  v23 = [v22 unmappedSfSymbolsName];

  v44 = (void *)v8;
  if (!v23 || ([(__CFString *)v23 hasPrefix:@"logo"] & 1) == 0)
  {

    v23 = @"gamecontroller.fill";
  }
  v24 = [v3 haptics];

  v25 = [v3 light];

  v39 = (void *)unk_26D2AD2D8(&off_26D2ADE00, "newBaseProfile");
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v26 = [v3 components];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v48 objects:v52 count:16];
  v43 = (void *)v11;
  if (v27)
  {
    uint64_t v28 = v27;
    v29 = 0;
    uint64_t v30 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v49 != v30) {
          objc_enumerationMutation(v26);
        }
        v32 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if ([v32 conformsToProtocol:&unk_26D299648])
        {
          uint64_t v33 = [v32 miscellaneous];

          v29 = (void *)v33;
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v28);
  }
  else
  {
    v29 = 0;
  }

  v34 = [v3 detailedProductCategory];
  v35 = +[GCSController productCategoryLocalizationKeyForProductCategory:v34];
  BYTE1(v38) = v25 != 0;
  LOBYTE(v38) = v24 != 0;
  id v36 = (id)objc_msgSend(a1, "initWithName:persistentIdentifier:productCategoryKey:hidden:shareButton:buttons:dpads:logoSfSymbolsName:supportsHaptics:supportsLight:baseProfile:miscellaneous:", v47, v46, v35, 0, v42, v41, v40, v23, v38, v39, v29);

  return v36;
}

+ (id)generateElementDictionaryFromElements:()GameController
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)&off_26D2B4CF0);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "remappable", (void)v15))
        {
          uint64_t v11 = (void *)[objc_alloc((Class)&off_26D2ACB70) initWithElement:v10];
          id v12 = v11;
          if (v11)
          {
            uint64_t v13 = [v11 name];
            [v4 setObject:v12 forKeyedSubscript:v13];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

@end
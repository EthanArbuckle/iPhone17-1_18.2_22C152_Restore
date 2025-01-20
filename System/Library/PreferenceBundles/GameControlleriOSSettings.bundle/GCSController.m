@interface GCSController
+ (id)generateElementDictionaryFromElements:(id)a3;
+ (id)productCategoryLocalizationKeyForProductCategory:(id)a3;
- (BOOL)supportsBuddyController;
- (GCColor)leftJoyConColor;
- (GCColor)rightJoyConColor;
- (GCSController)initWithController:(id)a3;
- (NSArray)macAddresses;
- (NSArray)uuidIdentifiers;
@end

@implementation GCSController

+ (id)productCategoryLocalizationKeyForProductCategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:GCProductCategoryDualShock4])
  {
    CFStringRef v4 = @"PRODUCT_CATEGORY_DUALSHOCK4";
  }
  else if ([v3 isEqualToString:GCProductCategoryDualSense])
  {
    CFStringRef v4 = @"PRODUCT_CATEGORY_DUALSENSE";
  }
  else
  {
    if ([v3 isEqualToString:GCProductCategoryXboxOne]) {
      goto LABEL_6;
    }
    if ([v3 isEqualToString:@"Xbox Elite"])
    {
      CFStringRef v4 = @"PRODUCT_CATEGORY_XBOX_ELITE";
      goto LABEL_21;
    }
    if ([v3 isEqualToString:@"Xbox Adaptive"])
    {
      CFStringRef v4 = @"PRODUCT_CATEGORY_XBOX_ADAPTIVE";
      goto LABEL_21;
    }
    if ([v3 isEqualToString:@"Xbox Series X"])
    {
LABEL_6:
      CFStringRef v4 = @"PRODUCT_CATEGORY_XBOX_ONE";
    }
    else if ([v3 isEqualToString:GCProductCategoryMFi])
    {
      CFStringRef v4 = @"PRODUCT_CATEGORY_MFI";
    }
    else if ([v3 isEqualToString:GCProductCategoryHID])
    {
      CFStringRef v4 = @"PRODUCT_CATEGORY_HID";
    }
    else if ([v3 containsString:@"Nintendo Switch Joy-Con"])
    {
      CFStringRef v4 = @"PRODUCT_CATEGORY_NINTENDO_JOY_CON";
    }
    else if ([v3 isEqualToString:@"Switch Pro Controller"])
    {
      CFStringRef v4 = @"PRODUCT_CATEGORY_NINTENDO_PRO_CONTROLLER";
    }
    else
    {
      CFStringRef v4 = @"PRODUCT_CATEGORY_GENERIC_CONTROLLER";
    }
  }
LABEL_21:

  return (id)v4;
}

- (GCSController)initWithController:(id)a3
{
  id v3 = a3;
  uint64_t v46 = [v3 vendorName];
  CFStringRef v4 = [v3 identifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v49 = [v3 identifier];
  }
  else
  {
    v49 = @"CONTROLLER";
  }
  v6 = [v3 physicalInputProfile];
  v7 = [v6 buttons];
  uint64_t v8 = [v7 objectForKeyedSubscript:GCInputButtonShare];

  v9 = [v3 physicalInputProfile];
  v10 = [v9 buttons];
  uint64_t v11 = [v10 objectForKeyedSubscript:GCInputButtonOptions];

  if (v8)
  {
    id v12 = objc_alloc((Class)GCSElement);
    uint64_t v13 = v8;
  }
  else
  {
    v14 = [v3 physicalInputProfile];
    v15 = [v14 buttons];
    v16 = [v15 objectForKeyedSubscript:GCInputButtonOptions];

    if (!v16)
    {
      id v44 = 0;
      goto LABEL_9;
    }
    id v12 = objc_alloc((Class)GCSElement);
    uint64_t v13 = v11;
  }
  id v44 = [v12 initWithElement:v13];
LABEL_9:
  v17 = [v3 physicalInputProfile];
  v18 = [v17 allButtons];
  v43 = +[GCSController generateElementDictionaryFromElements:v18];

  v19 = [v3 physicalInputProfile];
  v20 = [v19 allDpads];
  v42 = +[GCSController generateElementDictionaryFromElements:v20];

  v21 = [v3 physicalInputProfile];
  v22 = [v21 objectForKeyedSubscript:GCInputButtonHome];
  v23 = [v22 unmappedSfSymbolsName];

  v47 = (void *)v8;
  if (v23 && ([(__CFString *)v23 hasPrefix:@"logo"] & 1) != 0)
  {
    v41 = v23;
  }
  else
  {

    v41 = @"gamecontroller.fill";
  }
  v24 = [v3 haptics];

  v25 = [v3 light];

  id v40 = +[GCSProfile newBaseProfile];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v26 = [v3 components];
  id v27 = [v26 countByEnumeratingWithState:&v50 objects:v54 count:16];
  v45 = (void *)v11;
  if (v27)
  {
    id v28 = v27;
    v29 = 0;
    uint64_t v30 = *(void *)v51;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v51 != v30) {
          objc_enumerationMutation(v26);
        }
        v32 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        if ([v32 conformsToProtocol:&OBJC_PROTOCOL___GCControllerProductInfo])
        {
          uint64_t v33 = [v32 miscellaneous];

          v29 = (void *)v33;
        }
      }
      id v28 = [v26 countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v28);
  }
  else
  {
    v29 = 0;
  }
  if (v46) {
    v34 = (__CFString *)v46;
  }
  else {
    v34 = @"GAME_CONTROLLER_DEFAULT_NAME";
  }

  v35 = [v3 detailedProductCategory];
  v36 = +[GCSController productCategoryLocalizationKeyForProductCategory:v35];
  BYTE1(v39) = v25 != 0;
  LOBYTE(v39) = v24 != 0;
  v37 = -[GCSController initWithName:persistentIdentifier:productCategoryKey:hidden:shareButton:buttons:dpads:logoSfSymbolsName:supportsHaptics:supportsLight:baseProfile:miscellaneous:](self, "initWithName:persistentIdentifier:productCategoryKey:hidden:shareButton:buttons:dpads:logoSfSymbolsName:supportsHaptics:supportsLight:baseProfile:miscellaneous:", v34, v49, v36, 0, v44, v43, v42, v41, v39, v40, v29);

  return v37;
}

+ (id)generateElementDictionaryFromElements:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "remappable", (void)v15))
        {
          id v11 = [objc_alloc((Class)GCSElement) initWithElement:v10];
          id v12 = v11;
          if (v11)
          {
            uint64_t v13 = [v11 name];
            [v4 setObject:v12 forKeyedSubscript:v13];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSArray)macAddresses
{
  return (NSArray *)sub_B477C(self, (uint64_t)a2, (uint64_t (*)(void))sub_B437C);
}

- (NSArray)uuidIdentifiers
{
  return (NSArray *)sub_B477C(self, (uint64_t)a2, (uint64_t (*)(void))sub_B47F0);
}

- (GCColor)leftJoyConColor
{
  v2 = self;
  id v3 = sub_B4B98(1952867692, 0xE400000000000000);

  return (GCColor *)v3;
}

- (GCColor)rightJoyConColor
{
  v2 = self;
  id v3 = sub_B4B98(0x7468676972, 0xE500000000000000);

  return (GCColor *)v3;
}

- (BOOL)supportsBuddyController
{
  v2 = self;
  id v3 = [(GCSController *)v2 productCategoryKey];
  uint64_t v4 = sub_E7110();
  uint64_t v6 = v5;

  if (v4 == 0xD000000000000021 && v6 == 0x80000000000F3310)
  {

    swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v8 = sub_E7620();

    swift_bridgeObjectRelease();
    char v7 = v8 ^ 1;
  }
  return v7 & 1;
}

@end
@interface GCSController
+ (BOOL)supportsSecureCoding;
+ (id)archivalClasses;
- (BOOL)isHidden;
- (BOOL)supportsHaptics;
- (BOOL)supportsLight;
- (GCSController)initWithCoder:(id)a3;
- (GCSController)initWithJSONObject:(id)a3;
- (GCSController)initWithName:(id)a3 persistentIdentifier:(id)a4 productCategoryKey:(id)a5 hidden:(BOOL)a6 shareButton:(id)a7 buttons:(id)a8 dpads:(id)a9 logoSfSymbolsName:(id)a10 supportsHaptics:(BOOL)a11 supportsLight:(BOOL)a12 baseProfile:(id)a13 miscellaneous:(id)a14;
- (GCSElement)shareButton;
- (GCSJSONObject)jsonObject;
- (GCSProfile)baseProfile;
- (NSDate)modifiedDate;
- (NSDictionary)buttons;
- (NSDictionary)dpads;
- (NSDictionary)miscellaneous;
- (NSString)localizedName;
- (NSString)localizedProductCategory;
- (NSString)logoSfSymbolsName;
- (NSString)name;
- (NSString)persistentIdentifier;
- (NSString)productCategoryKey;
- (id)allButtons;
- (id)allDpads;
- (id)allElements;
- (id)copyWithBaseProfile:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)id;
- (id)initDummy;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCSController

- (id)initDummy
{
  v18.receiver = self;
  v18.super_class = (Class)GCSController;
  v2 = [(GCSController *)&v18 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)@"Controller";

    uint64_t v5 = +[NSDate date];
    modifiedDate = v3->_modifiedDate;
    v3->_modifiedDate = (NSDate *)v5;

    persistentIdentifier = v3->_persistentIdentifier;
    v3->_persistentIdentifier = (NSString *)@"__Dummy Controller";

    productCategoryKey = v3->_productCategoryKey;
    v3->_productCategoryKey = (NSString *)@"PRODUCT_CATEGORY_MFI";

    v3->_hidden = 1;
    shareButton = v3->_shareButton;
    v3->_shareButton = 0;

    uint64_t v10 = objc_opt_new();
    buttons = v3->_buttons;
    v3->_buttons = (NSDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    dpads = v3->_dpads;
    v3->_dpads = (NSDictionary *)v12;

    logoSfSymbolsName = v3->_logoSfSymbolsName;
    v3->_logoSfSymbolsName = (NSString *)@"gamecontroller.fill";

    *(_WORD *)&v3->_supportsHaptics = 0;
    v15 = +[GCSProfile newBaseProfile];
    baseProfile = v3->_baseProfile;
    v3->_baseProfile = v15;
  }
  return v3;
}

- (GCSController)initWithName:(id)a3 persistentIdentifier:(id)a4 productCategoryKey:(id)a5 hidden:(BOOL)a6 shareButton:(id)a7 buttons:(id)a8 dpads:(id)a9 logoSfSymbolsName:(id)a10 supportsHaptics:(BOOL)a11 supportsLight:(BOOL)a12 baseProfile:(id)a13 miscellaneous:(id)a14
{
  id v34 = a3;
  id v33 = a4;
  id v32 = a5;
  id v31 = a7;
  id v30 = a8;
  id v29 = a9;
  id v28 = a10;
  id v27 = a13;
  id v20 = a14;
  v35.receiver = self;
  v35.super_class = (Class)GCSController;
  v21 = [(GCSController *)&v35 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_name, a3);
    uint64_t v23 = +[NSDate date];
    modifiedDate = v22->_modifiedDate;
    v22->_modifiedDate = (NSDate *)v23;

    objc_storeStrong((id *)&v22->_persistentIdentifier, a4);
    objc_storeStrong((id *)&v22->_productCategoryKey, a5);
    v22->_hidden = a6;
    objc_storeStrong((id *)&v22->_shareButton, a7);
    objc_storeStrong((id *)&v22->_buttons, a8);
    objc_storeStrong((id *)&v22->_dpads, a9);
    objc_storeStrong((id *)&v22->_logoSfSymbolsName, a10);
    v22->_supportsHaptics = a11;
    v22->_supportsLight = a12;
    objc_storeStrong((id *)&v22->_baseProfile, a13);
    objc_storeStrong((id *)&v22->_miscellaneous, a14);
  }

  return v22;
}

- (id)copyWithBaseProfile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(GCSController *)self copy];
  v6 = (void *)v5[10];
  v5[10] = v4;

  return v5;
}

- (id)id
{
  return self->_persistentIdentifier;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<GCSController %@ (%@)>", self->_name, self->_persistentIdentifier];
}

- (id)allElements
{
  v3 = [(GCSController *)self allButtons];
  id v4 = [(GCSController *)self allDpads];
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (id)allButtons
{
  v2 = [(NSDictionary *)self->_buttons allValues];
  v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_0];

  return v3;
}

BOOL __27__GCSController_allButtons__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  LODWORD(a2) = [a2 remappingKey];
  int v5 = [v4 remappingKey];

  return (int)a2 < v5;
}

- (id)allDpads
{
  v2 = [(NSDictionary *)self->_dpads allValues];
  v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_18];

  return v3;
}

BOOL __25__GCSController_allDpads__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  LODWORD(a2) = [a2 remappingKey];
  int v5 = [v4 remappingKey];

  return (int)a2 < v5;
}

- (NSString)localizedProductCategory
{
  return (NSString *)_GCFConvertStringToLocalizedString();
}

- (NSString)localizedName
{
  if ([(NSString *)self->_name isEqualToString:@"GAME_CONTROLLER_DEFAULT_NAME"])
  {
    _GCFConvertStringToLocalizedString();
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_name;
  }
  return v3;
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)productCategoryKey
{
  return self->_productCategoryKey;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (GCSElement)shareButton
{
  return self->_shareButton;
}

- (NSDictionary)buttons
{
  return self->_buttons;
}

- (NSDictionary)dpads
{
  return self->_dpads;
}

- (NSString)logoSfSymbolsName
{
  return self->_logoSfSymbolsName;
}

- (BOOL)supportsHaptics
{
  return self->_supportsHaptics;
}

- (BOOL)supportsLight
{
  return self->_supportsLight;
}

- (GCSProfile)baseProfile
{
  return self->_baseProfile;
}

- (NSDictionary)miscellaneous
{
  return self->_miscellaneous;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miscellaneous, 0);
  objc_storeStrong((id *)&self->_baseProfile, 0);
  objc_storeStrong((id *)&self->_logoSfSymbolsName, 0);
  objc_storeStrong((id *)&self->_dpads, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_productCategoryKey, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(GCSController);
  objc_storeStrong((id *)&v4->_name, self->_name);
  objc_storeStrong((id *)&v4->_modifiedDate, self->_modifiedDate);
  objc_storeStrong((id *)&v4->_persistentIdentifier, self->_persistentIdentifier);
  objc_storeStrong((id *)&v4->_productCategoryKey, self->_productCategoryKey);
  v4->_hidden = self->_hidden;
  objc_storeStrong((id *)&v4->_shareButton, self->_shareButton);
  objc_storeStrong((id *)&v4->_buttons, self->_buttons);
  objc_storeStrong((id *)&v4->_dpads, self->_dpads);
  objc_storeStrong((id *)&v4->_logoSfSymbolsName, self->_logoSfSymbolsName);
  v4->_supportsHaptics = self->_supportsHaptics;
  v4->_supportsLight = self->_supportsLight;
  objc_storeStrong((id *)&v4->_baseProfile, self->_baseProfile);
  objc_storeStrong((id *)&v4->_miscellaneous, self->_miscellaneous);
  int v5 = self;

  return v5;
}

+ (id)archivalClasses
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  return +[NSSet setWithObjects:](&off_26D32CB10, "setWithObjects:", v2, v3, v4, v5, v6, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSController)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)GCSController;
  uint64_t v5 = [(GCSController *)&v33 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_persistentIdentifier"];
    persistentIdentifier = v5->_persistentIdentifier;
    v5->_persistentIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_modifiedDate"];
    modifiedDate = v5->_modifiedDate;
    v5->_modifiedDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_productCategoryKey"];
    productCategoryKey = v5->_productCategoryKey;
    v5->_productCategoryKey = (NSString *)v12;

    v5->_hidden = [v4 decodeBoolForKey:@"_hidden"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shareButton"];
    shareButton = v5->_shareButton;
    v5->_shareButton = (GCSElement *)v14;

    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v36[2] = objc_opt_class();
    v16 = +[NSArray arrayWithObjects:v36 count:3];
    v17 = +[NSSet setWithArray:v16];
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"_buttons"];
    buttons = v5->_buttons;
    v5->_buttons = (NSDictionary *)v18;

    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    v35[2] = objc_opt_class();
    id v20 = +[NSArray arrayWithObjects:v35 count:3];
    v21 = +[NSSet setWithArray:v20];
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"_dpads"];
    dpads = v5->_dpads;
    v5->_dpads = (NSDictionary *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_logoSfSymbolsName"];
    logoSfSymbolsName = v5->_logoSfSymbolsName;
    v5->_logoSfSymbolsName = (NSString *)v24;

    v5->_supportsHaptics = [v4 decodeBoolForKey:@"_supportsHaptics"];
    v5->_supportsLight = [v4 decodeBoolForKey:@"_supportsLight"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_baseProfile"];
    baseProfile = v5->_baseProfile;
    v5->_baseProfile = (GCSProfile *)v26;

    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    v34[2] = objc_opt_class();
    v34[3] = objc_opt_class();
    v34[4] = objc_opt_class();
    id v28 = +[NSArray arrayWithObjects:v34 count:5];
    id v29 = +[NSSet setWithArray:v28];
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"_miscellaneous"];
    miscellaneous = v5->_miscellaneous;
    v5->_miscellaneous = (NSDictionary *)v30;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  persistentIdentifier = self->_persistentIdentifier;
  id v5 = a3;
  [v5 encodeObject:persistentIdentifier forKey:@"_persistentIdentifier"];
  [v5 encodeObject:self->_name forKey:@"_name"];
  [v5 encodeObject:self->_modifiedDate forKey:@"_modifiedDate"];
  [v5 encodeObject:self->_productCategoryKey forKey:@"_productCategoryKey"];
  [v5 encodeBool:self->_hidden forKey:@"_hidden"];
  [v5 encodeObject:self->_shareButton forKey:@"_shareButton"];
  [v5 encodeObject:self->_buttons forKey:@"_buttons"];
  [v5 encodeObject:self->_dpads forKey:@"_dpads"];
  [v5 encodeObject:self->_logoSfSymbolsName forKey:@"_logoSfSymbolsName"];
  [v5 encodeBool:self->_supportsHaptics forKey:@"_supportsHaptics"];
  [v5 encodeBool:self->_supportsLight forKey:@"_supportsLight"];
  [v5 encodeObject:self->_baseProfile forKey:@"_baseProfile"];
  [v5 encodeObject:self->_miscellaneous forKey:@"_miscellaneous"];
}

- (GCSController)initWithJSONObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v37.receiver = self;
    v37.super_class = (Class)GCSController;
    uint64_t v6 = [(GCSController *)&v37 init];
    if (v6)
    {
      uint64_t v7 = objc_msgSend(v5, "_gcs_stringForJSONKey:", @"persistentIdentifier");
      persistentIdentifier = v6->_persistentIdentifier;
      v6->_persistentIdentifier = (NSString *)v7;

      uint64_t v9 = objc_msgSend(v5, "_gcs_stringForJSONKey:", @"name");
      name = v6->_name;
      v6->_name = (NSString *)v9;

      v11 = objc_msgSend(v5, "_gcs_dateForJSONKey:", @"modifiedDate");
      uint64_t v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        v13 = +[NSDate date];
      }
      modifiedDate = v6->_modifiedDate;
      v6->_modifiedDate = v13;

      uint64_t v16 = objc_msgSend(v5, "_gcs_stringForJSONKey:", @"productCategoryKey");
      productCategoryKey = v6->_productCategoryKey;
      v6->_productCategoryKey = (NSString *)v16;

      uint64_t v18 = objc_msgSend(v5, "_gcs_numberForJSONKey:", @"hidden");
      v6->_hidden = [v18 BOOLValue];

      uint64_t v19 = objc_msgSend(v5, "_gcs_gscElementForJSONKey:", @"shareButton");
      shareButton = v6->_shareButton;
      v6->_shareButton = (GCSElement *)v19;

      v21 = objc_msgSend(v5, "_gcs_dictionaryForJSONKey:", @"buttons");
      uint64_t v22 = +[NSDictionary _gcs_serializableDictionaryForJsonObject:v21 withValuesOfClass:objc_opt_class()];
      buttons = v6->_buttons;
      v6->_buttons = (NSDictionary *)v22;

      uint64_t v24 = objc_msgSend(v5, "_gcs_dictionaryForJSONKey:", @"dpads");
      uint64_t v25 = +[NSDictionary _gcs_serializableDictionaryForJsonObject:v24 withValuesOfClass:objc_opt_class()];
      dpads = v6->_dpads;
      v6->_dpads = (NSDictionary *)v25;

      uint64_t v27 = objc_msgSend(v5, "_gcs_stringForJSONKey:", @"logoSfSymbolsName");
      logoSfSymbolsName = v6->_logoSfSymbolsName;
      v6->_logoSfSymbolsName = (NSString *)v27;

      id v29 = objc_msgSend(v5, "_gcs_numberForJSONKey:", @"supportsHaptics");
      v6->_supportsHaptics = [v29 BOOLValue];

      uint64_t v30 = objc_msgSend(v5, "_gcs_numberForJSONKey:", @"supportsLight");
      v6->_supportsLight = [v30 BOOLValue];

      uint64_t v31 = objc_msgSend(v5, "_gcs_gscProfileForJSONKey:", @"baseProfile");
      baseProfile = v6->_baseProfile;
      v6->_baseProfile = (GCSProfile *)v31;

      objc_super v33 = objc_msgSend(v5, "_gcs_dictionaryForJSONKey:", @"miscellaneous");
      uint64_t v34 = +[NSDictionary _gcs_serializableDictionaryForDictionaryJsonObject:v33];
      miscellaneous = v6->_miscellaneous;
      v6->_miscellaneous = (NSDictionary *)v34;
    }
    self = v6;

    uint64_t v14 = self;
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (GCSJSONObject)jsonObject
{
  persistentIdentifier = self->_persistentIdentifier;
  v22[0] = @"persistentIdentifier";
  v22[1] = @"name";
  name = self->_name;
  productCategoryKey = self->_productCategoryKey;
  v23[0] = persistentIdentifier;
  v23[1] = name;
  v23[2] = productCategoryKey;
  v22[2] = @"productCategoryKey";
  v22[3] = @"hidden";
  uint64_t v6 = +[NSNumber numberWithBool:self->_hidden];
  v23[3] = v6;
  v22[4] = @"buttons";
  uint64_t v7 = +[NSDictionary _gcs_jsonObjectForSerializableDictionary:self->_buttons];
  v23[4] = v7;
  v22[5] = @"dpads";
  uint64_t v8 = +[NSDictionary _gcs_jsonObjectForSerializableDictionary:self->_dpads];
  logoSfSymbolsName = self->_logoSfSymbolsName;
  v23[5] = v8;
  v23[6] = logoSfSymbolsName;
  v22[6] = @"logoSfSymbolsName";
  v22[7] = @"supportsHaptics";
  uint64_t v10 = +[NSNumber numberWithBool:self->_supportsHaptics];
  v23[7] = v10;
  v22[8] = @"supportsLight";
  v11 = +[NSNumber numberWithBool:self->_supportsLight];
  v23[8] = v11;
  v22[9] = @"baseProfile";
  uint64_t v12 = [(GCSProfile *)self->_baseProfile jsonObject];
  v23[9] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:10];
  uint64_t v14 = +[NSMutableDictionary dictionaryWithDictionary:v13];

  shareButton = self->_shareButton;
  if (shareButton)
  {
    uint64_t v16 = [(GCSElement *)shareButton jsonObject];
    [v14 setObject:v16 forKeyedSubscript:@"shareButton"];
  }
  modifiedDate = self->_modifiedDate;
  if (modifiedDate)
  {
    uint64_t v18 = [(NSDate *)modifiedDate jsonObject];
    [v14 setObject:v18 forKeyedSubscript:@"modifiedDate"];
  }
  miscellaneous = self->_miscellaneous;
  if (miscellaneous)
  {
    id v20 = [(NSDictionary *)miscellaneous jsonObject];
    [v14 setObject:v20 forKeyedSubscript:@"miscellaneous"];
  }
  return (GCSJSONObject *)v14;
}

@end
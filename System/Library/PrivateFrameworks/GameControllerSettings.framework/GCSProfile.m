@interface GCSProfile
+ (BOOL)supportsSecureCoding;
+ (GCSProfile)defaultProfile;
+ (GCSProfile)profileWithName:(id)a3;
+ (NSUUID)defaultProfileUUID;
+ (id)adhocProfileForController:(id)a3 gameBundleIdentifier:(id)a4;
+ (id)archivalClasses;
+ (id)elementMappingsFrom:(id)a3 for:(id)a4;
+ (id)newBaseProfile;
+ (id)profile;
+ (int64_t)defaultDoublePressGesture;
+ (int64_t)defaultLongPressGesture;
- (BOOL)customizable;
- (BOOL)hapticFeedbackOverride;
- (BOOL)isActive;
- (BOOL)isBaseProfile;
- (BOOL)lightbarCustomColorEnabled;
- (BOOL)lightbarOverride;
- (GCSJSONObject)jsonObject;
- (GCSProfile)initWithCoder:(id)a3;
- (GCSProfile)initWithJSONObject:(id)a3;
- (GCSProfile)initWithUUID:(id)a3 name:(id)a4 persistentControllerIdentifier:(id)a5 gameBundleIdentifier:(id)a6 baseProfile:(BOOL)a7 customizable:(BOOL)a8 sfSymbolsName:(id)a9 elementMappings:(id)a10 hapticFeedbackOverride:(BOOL)a11 hapticStrength:(double)a12 doublePressShareGesture:(int64_t)a13 longPressShareGesture:(int64_t)a14 lightbarOverride:(BOOL)a15 lightbarCustomColorEnabled:(BOOL)a16 lightbarColor:(int64_t)a17;
- (NSDate)modifiedDate;
- (NSDictionary)elementMappings;
- (NSString)gameBundleIdentifier;
- (NSString)id;
- (NSString)name;
- (NSString)persistentControllerIdentifier;
- (NSString)sfSymbolsName;
- (NSUUID)uuid;
- (double)hapticStrength;
- (id)anonymizedCopy;
- (id)description;
- (id)elementMappingsWithJSONDictionary:(id)a3;
- (int64_t)doublePressShareGesture;
- (int64_t)lightbarColor;
- (int64_t)longPressShareGesture;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCSProfile

+ (NSUUID)defaultProfileUUID
{
  v2 = (void *)[objc_alloc((Class)&off_26D32B350) initWithUUIDString:@"42381781-1b0c-467e-aa7d-823c4ce359d1"];
  return (NSUUID *)v2;
}

+ (GCSProfile)defaultProfile
{
  int64_t v2 = +[GCSProfile defaultDoublePressGesture];
  int64_t v3 = +[GCSProfile defaultLongPressGesture];
  v4 = [GCSProfile alloc];
  v5 = +[GCSProfile defaultProfileUUID];
  v6 = objc_opt_new();
  LOWORD(v10) = 0;
  LOBYTE(v9) = 0;
  v7 = -[GCSProfile initWithUUID:name:persistentControllerIdentifier:gameBundleIdentifier:baseProfile:customizable:sfSymbolsName:elementMappings:hapticFeedbackOverride:hapticStrength:doublePressShareGesture:longPressShareGesture:lightbarOverride:lightbarCustomColorEnabled:lightbarColor:](v4, "initWithUUID:name:persistentControllerIdentifier:gameBundleIdentifier:baseProfile:customizable:sfSymbolsName:elementMappings:hapticFeedbackOverride:hapticStrength:doublePressShareGesture:longPressShareGesture:lightbarOverride:lightbarCustomColorEnabled:lightbarColor:", v5, @"GCS_PROFILE_DEFAULT", 0, 0, 0, 0, 1.0, @"gamecontroller.fill", v6, v9, v2, v3, v10, 0);

  return v7;
}

- (BOOL)isActive
{
  return 1;
}

- (NSString)id
{
  return [(NSUUID *)self->_uuid UUIDString];
}

- (id)description
{
  name = self->_name;
  int64_t v3 = [(NSUUID *)self->_uuid UUIDString];
  v4 = +[NSString stringWithFormat:@"<GCSProfile %@ (%@)>", name, v3];

  return v4;
}

- (GCSProfile)initWithUUID:(id)a3 name:(id)a4 persistentControllerIdentifier:(id)a5 gameBundleIdentifier:(id)a6 baseProfile:(BOOL)a7 customizable:(BOOL)a8 sfSymbolsName:(id)a9 elementMappings:(id)a10 hapticFeedbackOverride:(BOOL)a11 hapticStrength:(double)a12 doublePressShareGesture:(int64_t)a13 longPressShareGesture:(int64_t)a14 lightbarOverride:(BOOL)a15 lightbarCustomColorEnabled:(BOOL)a16 lightbarColor:(int64_t)a17
{
  id v23 = a3;
  id v24 = a4;
  id v34 = a5;
  id v33 = a6;
  id v32 = a9;
  id v25 = a10;
  v35.receiver = self;
  v35.super_class = (Class)GCSProfile;
  v26 = [(GCSProfile *)&v35 init];
  if (v26)
  {
    uint64_t v27 = +[NSDate date];
    modifiedDate = v26->_modifiedDate;
    v26->_modifiedDate = (NSDate *)v27;

    objc_storeStrong((id *)&v26->_uuid, a3);
    objc_storeStrong((id *)&v26->_name, a4);
    objc_storeStrong((id *)&v26->_persistentControllerIdentifier, a5);
    objc_storeStrong((id *)&v26->_gameBundleIdentifier, a6);
    v26->_baseProfile = a7;
    v26->_customizable = a8;
    objc_storeStrong((id *)&v26->_sfSymbolsName, a9);
    objc_storeStrong((id *)&v26->_elementMappings, a10);
    v26->_hapticFeedbackOverride = a11;
    v26->_hapticStrength = a12;
    v26->_doublePressShareGesture = a13;
    v26->_longPressShareGesture = a14;
    v26->_lightbarOverride = a15;
    v26->_lightbarCustomColorEnabled = a16;
    v26->_lightbarColor = a17;
  }

  return v26;
}

- (NSString)name
{
  if ([(NSString *)self->_name isEqualToString:@"GCS_PROFILE_DEFAULT"])
  {
    _GCFConvertStringToLocalizedString();
    int64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int64_t v3 = self->_name;
  }
  return v3;
}

- (id)anonymizedCopy
{
  int64_t v3 = [GCSProfile alloc];
  v4 = [(GCSProfile *)self jsonObject];
  v5 = [(GCSProfile *)v3 initWithJSONObject:v4];

  name = v5->_name;
  v5->_name = (NSString *)@"Profile";

  return v5;
}

+ (id)elementMappingsFrom:(id)a3 for:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)&off_26D32C908);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v45;
    uint64_t v39 = *(void *)v45;
    id v40 = v5;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v13 = [v12 name];
        v14 = [v5 objectForKey:v13];
        v15 = [v14 mappingKey];
        v16 = v15;
        if (v15)
        {
          id v17 = v15;
        }
        else
        {
          id v17 = [v12 name];
        }
        id v43 = v17;

        if ([v12 kind] == 2)
        {
          v18 = [v5 objectForKey:v13];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v19 = v18;
          }
          else {
            v19 = 0;
          }
          id v20 = v19;
          v21 = [GCSDirectionPadMapping alloc];
          unsigned int v42 = [v12 remappingKey];
          uint64_t v22 = [v20 invertHorizontally];
          uint64_t v23 = [v20 invertVertically];
          uint64_t v24 = v9;
          id v25 = v7;
          uint64_t v26 = [v20 swapAxes];

          uint64_t v27 = v21;
          v28 = v43;
          uint64_t v29 = v22;
          uint64_t v10 = v39;
          id v5 = v40;
          uint64_t v30 = v26;
          id v7 = v25;
          uint64_t v9 = v24;
          v31 = [(GCSDirectionPadMapping *)v27 initWithElementKey:v13 mappingKey:v43 remappingOrder:v42 invertHorizontally:v29 invertVertically:v23 swapAxes:v30];
        }
        else
        {
          id v32 = [GCSElementMapping alloc];
          uint64_t v33 = [v12 remappingKey];
          id v34 = v32;
          v28 = v43;
          v31 = [(GCSElementMapping *)v34 initWithElementKey:v13 mappingKey:v43 remappingOrder:v33];
        }
        [v7 addObject:v31];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v9);
  }

  uint64_t v35 = [v7 sortedArrayUsingComparator:&__block_literal_global_1];
  v36 = v7;
  v37 = (void *)v35;

  return v37;
}

BOOL __38__GCSProfile_elementMappingsFrom_for___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  LODWORD(a2) = [a2 remappingOrder];
  int v5 = [v4 remappingOrder];

  return (int)a2 > v5;
}

+ (id)newBaseProfile
{
  int64_t v2 = [GCSProfile alloc];
  int64_t v3 = objc_opt_new();
  id v4 = objc_opt_new();
  LOWORD(v8) = 0;
  LOBYTE(v7) = 0;
  int v5 = -[GCSProfile initWithUUID:name:persistentControllerIdentifier:gameBundleIdentifier:baseProfile:customizable:sfSymbolsName:elementMappings:hapticFeedbackOverride:hapticStrength:doublePressShareGesture:longPressShareGesture:lightbarOverride:lightbarCustomColorEnabled:lightbarColor:](v2, "initWithUUID:name:persistentControllerIdentifier:gameBundleIdentifier:baseProfile:customizable:sfSymbolsName:elementMappings:hapticFeedbackOverride:hapticStrength:doublePressShareGesture:longPressShareGesture:lightbarOverride:lightbarCustomColorEnabled:lightbarColor:", v3, @"Base Profile", 0, 0, 1, 1, 1.0, @"gamecontroller.fill", v4, v7, 1, 2, v8, 0);

  return v5;
}

+ (int64_t)defaultDoublePressGesture
{
  return 1;
}

+ (int64_t)defaultLongPressGesture
{
  return 2;
}

+ (id)profile
{
  int64_t v2 = +[GCSProfile defaultDoublePressGesture];
  int64_t v3 = +[GCSProfile defaultLongPressGesture];
  id v4 = [GCSProfile alloc];
  int v5 = objc_opt_new();
  id v6 = objc_opt_new();
  LOWORD(v10) = 0;
  LOBYTE(v9) = 0;
  uint64_t v7 = -[GCSProfile initWithUUID:name:persistentControllerIdentifier:gameBundleIdentifier:baseProfile:customizable:sfSymbolsName:elementMappings:hapticFeedbackOverride:hapticStrength:doublePressShareGesture:longPressShareGesture:lightbarOverride:lightbarCustomColorEnabled:lightbarColor:](v4, "initWithUUID:name:persistentControllerIdentifier:gameBundleIdentifier:baseProfile:customizable:sfSymbolsName:elementMappings:hapticFeedbackOverride:hapticStrength:doublePressShareGesture:longPressShareGesture:lightbarOverride:lightbarCustomColorEnabled:lightbarColor:", v5, @"New Profile", 0, 0, 0, 1, 1.0, @"gamecontroller.fill", v6, v9, v2, v3, v10, 0);

  return v7;
}

+ (GCSProfile)profileWithName:(id)a3
{
  id v3 = a3;
  id v4 = +[GCSProfile profile];
  int v5 = (void *)v4[2];
  v4[2] = v3;

  return (GCSProfile *)v4;
}

+ (id)adhocProfileForController:(id)a3 gameBundleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[GCSProfile profile];
  uint64_t v8 = (void *)v7[2];
  v7[2] = @"-";

  uint64_t v9 = [v6 persistentIdentifier];

  uint64_t v10 = (void *)v7[5];
  v7[5] = v9;

  v11 = (void *)v7[6];
  v7[6] = v5;

  return v7;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)persistentControllerIdentifier
{
  return self->_persistentControllerIdentifier;
}

- (NSString)gameBundleIdentifier
{
  return self->_gameBundleIdentifier;
}

- (BOOL)isBaseProfile
{
  return self->_baseProfile;
}

- (BOOL)customizable
{
  return self->_customizable;
}

- (NSString)sfSymbolsName
{
  return self->_sfSymbolsName;
}

- (NSDictionary)elementMappings
{
  return self->_elementMappings;
}

- (BOOL)hapticFeedbackOverride
{
  return self->_hapticFeedbackOverride;
}

- (double)hapticStrength
{
  return self->_hapticStrength;
}

- (int64_t)doublePressShareGesture
{
  return self->_doublePressShareGesture;
}

- (int64_t)longPressShareGesture
{
  return self->_longPressShareGesture;
}

- (BOOL)lightbarOverride
{
  return self->_lightbarOverride;
}

- (BOOL)lightbarCustomColorEnabled
{
  return self->_lightbarCustomColorEnabled;
}

- (int64_t)lightbarColor
{
  return self->_lightbarColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementMappings, 0);
  objc_storeStrong((id *)&self->_sfSymbolsName, 0);
  objc_storeStrong((id *)&self->_gameBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentControllerIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)archivalClasses
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  return +[NSSet setWithObjects:](&off_26D32CB10, "setWithObjects:", v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)GCSProfile;
  uint64_t v5 = [(GCSProfile *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_modifiedDate"];
    modifiedDate = v5->_modifiedDate;
    v5->_modifiedDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_persistentControllerIdentifier"];
    persistentControllerIdentifier = v5->_persistentControllerIdentifier;
    v5->_persistentControllerIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_gameBundleIdentifier"];
    gameBundleIdentifier = v5->_gameBundleIdentifier;
    v5->_gameBundleIdentifier = (NSString *)v14;

    v5->_baseProfile = [v4 decodeBoolForKey:@"_baseProfile"];
    v5->_customizable = [v4 decodeBoolForKey:@"_customizable"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sfSymbolsName"];
    sfSymbolsName = v5->_sfSymbolsName;
    v5->_sfSymbolsName = (NSString *)v16;

    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    v21 = +[NSSet setWithObjects:](&off_26D32CB10, "setWithObjects:", v18, v19, v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"_elementMappings"];
    elementMappings = v5->_elementMappings;
    v5->_elementMappings = (NSDictionary *)v22;

    v5->_hapticFeedbackOverride = [v4 decodeBoolForKey:@"_hapticFeedbackOverride"];
    [v4 decodeDoubleForKey:@"_hapticStrength"];
    v5->_hapticStrength = v24;
    v5->_doublePressShareGesture = [v4 decodeInt64ForKey:@"_doublePressShareGesture_ios"];
    v5->_longPressShareGesture = [v4 decodeInt64ForKey:@"_longPressShareGesture_ios"];
    v5->_lightbarOverride = [v4 decodeBoolForKey:@"_lightbarOverride"];
    v5->_lightbarCustomColorEnabled = [v4 decodeBoolForKey:@"_lightbarCustomColorEnabled"];
    v5->_lightbarColor = [v4 decodeInt64ForKey:@"_lightbarColor"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  modifiedDate = self->_modifiedDate;
  id v5 = a3;
  [v5 encodeObject:modifiedDate forKey:@"_modifiedDate"];
  [v5 encodeObject:self->_uuid forKey:@"_uuid"];
  [v5 encodeObject:self->_name forKey:@"_name"];
  [v5 encodeObject:self->_persistentControllerIdentifier forKey:@"_persistentControllerIdentifier"];
  [v5 encodeObject:self->_gameBundleIdentifier forKey:@"_gameBundleIdentifier"];
  [v5 encodeBool:self->_baseProfile forKey:@"_baseProfile"];
  [v5 encodeBool:self->_customizable forKey:@"_customizable"];
  [v5 encodeObject:self->_sfSymbolsName forKey:@"_sfSymbolsName"];
  [v5 encodeObject:self->_elementMappings forKey:@"_elementMappings"];
  [v5 encodeBool:self->_hapticFeedbackOverride forKey:@"_hapticFeedbackOverride"];
  [v5 encodeDouble:@"_hapticStrength" forKey:self->_hapticStrength];
  [v5 encodeInt64:self->_doublePressShareGesture forKey:@"_doublePressShareGesture_ios"];
  [v5 encodeInt64:self->_longPressShareGesture forKey:@"_longPressShareGesture_ios"];
  [v5 encodeBool:self->_lightbarOverride forKey:@"_lightbarOverride"];
  [v5 encodeBool:self->_lightbarCustomColorEnabled forKey:@"_lightbarCustomColorEnabled"];
  [v5 encodeInt64:self->_lightbarColor forKey:@"_lightbarColor"];
}

- (id)elementMappingsWithJSONDictionary:(id)a3
{
  uint64_t v3 = objc_msgSend(a3, "_gcs_dictionaryForJSONKey:", @"elementMappings");
  +[NSMutableDictionary dictionaryWithCapacity:](&off_26D32CA00, "dictionaryWithCapacity:", [v3 count]);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          v11 = [v4 objectForKeyedSubscript:v10];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = v11;
            v13 = [v12 objectForKeyedSubscript:@"invertHorizontally"];

            uint64_t v14 = &classRef_GCSElementMapping;
            if (v13) {
              uint64_t v14 = &classRef_GCSDirectionPadMapping;
            }
            v15 = (void *)[objc_alloc(*v14) initWithJSONObject:v12];
            if (v15) {
              [v17 setObject:v15 forKeyedSubscript:v10];
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  return v17;
}

- (GCSProfile)initWithJSONObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v35.receiver = self;
    v35.super_class = (Class)GCSProfile;
    uint64_t v6 = [(GCSProfile *)&v35 init];
    if (v6)
    {
      uint64_t v7 = objc_msgSend(v5, "_gcs_dateForJSONKey:", @"modifiedDate");
      uint64_t v8 = v7;
      if (v7)
      {
        uint64_t v9 = v7;
      }
      else
      {
        uint64_t v9 = +[NSDate date];
      }
      modifiedDate = v6->_modifiedDate;
      v6->_modifiedDate = v9;

      uint64_t v12 = objc_msgSend(v5, "_gcs_uuidForJSONKey:", @"uuid");
      uuid = v6->_uuid;
      v6->_uuid = (NSUUID *)v12;

      uint64_t v14 = objc_msgSend(v5, "_gcs_stringForJSONKey:", @"name");
      name = v6->_name;
      v6->_name = (NSString *)v14;

      uint64_t v16 = objc_msgSend(v5, "_gcs_stringForJSONKey:", @"persistentControllerIdentifier");
      persistentControllerIdentifier = v6->_persistentControllerIdentifier;
      v6->_persistentControllerIdentifier = (NSString *)v16;

      uint64_t v18 = objc_msgSend(v5, "_gcs_stringForJSONKey:", @"gameBundleIdentifier");
      gameBundleIdentifier = v6->_gameBundleIdentifier;
      v6->_gameBundleIdentifier = (NSString *)v18;

      long long v20 = objc_msgSend(v5, "_gcs_numberForJSONKey:", @"isBaseProfile");
      v6->_baseProfile = [v20 BOOLValue];

      long long v21 = objc_msgSend(v5, "_gcs_numberForJSONKey:", @"customizable");
      v6->_customizable = [v21 BOOLValue];

      uint64_t v22 = objc_msgSend(v5, "_gcs_stringForJSONKey:", @"sfSymbolsName");
      sfSymbolsName = v6->_sfSymbolsName;
      v6->_sfSymbolsName = (NSString *)v22;

      uint64_t v24 = [(GCSProfile *)v6 elementMappingsWithJSONDictionary:v5];
      elementMappings = v6->_elementMappings;
      v6->_elementMappings = (NSDictionary *)v24;

      objc_super v26 = objc_msgSend(v5, "_gcs_numberForJSONKey:", @"hapticFeedbackOverride");
      v6->_hapticFeedbackOverride = [v26 BOOLValue];

      uint64_t v27 = objc_msgSend(v5, "_gcs_numberForJSONKey:", @"hapticStrength");
      [v27 floatValue];
      v6->_hapticStrength = v28;

      uint64_t v29 = objc_msgSend(v5, "_gcs_numberForJSONKey:", @"doublePressShareGesture_ios");
      v6->_doublePressShareGesture = [v29 longValue];

      uint64_t v30 = objc_msgSend(v5, "_gcs_numberForJSONKey:", @"longPressShareGesture_ios");
      v6->_longPressShareGesture = [v30 longValue];

      v31 = objc_msgSend(v5, "_gcs_numberForJSONKey:", @"lightbarOverride");
      v6->_lightbarOverride = [v31 BOOLValue];

      id v32 = objc_msgSend(v5, "_gcs_numberForJSONKey:", @"lightbarCustomColorEnabled");
      v6->_lightbarCustomColorEnabled = [v32 BOOLValue];

      uint64_t v33 = objc_msgSend(v5, "_gcs_numberForJSONKey:", @"lightbarColor");
      v6->_lightbarColor = [v33 longValue];
    }
    self = v6;

    id v10 = self;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (GCSJSONObject)jsonObject
{
  v23[0] = @"modifiedDate";
  uint64_t v22 = [(NSDate *)self->_modifiedDate jsonObject];
  v24[0] = v22;
  v23[1] = @"uuid";
  long long v21 = [(NSUUID *)self->_uuid jsonObject];
  name = self->_name;
  v24[1] = v21;
  v24[2] = name;
  v23[2] = @"name";
  v23[3] = @"isBaseProfile";
  long long v20 = +[NSNumber numberWithBool:self->_baseProfile];
  v24[3] = v20;
  v23[4] = @"customizable";
  long long v19 = +[NSNumber numberWithBool:self->_customizable];
  sfSymbolsName = self->_sfSymbolsName;
  elementMappings = self->_elementMappings;
  v24[4] = v19;
  v24[5] = sfSymbolsName;
  v23[5] = @"sfSymbolsName";
  v23[6] = @"elementMappings";
  uint64_t v18 = +[NSDictionary _gcs_jsonObjectForSerializableDictionary:elementMappings];
  v24[6] = v18;
  v23[7] = @"hapticFeedbackOverride";
  uint64_t v6 = +[NSNumber numberWithBool:self->_hapticFeedbackOverride];
  v24[7] = v6;
  v23[8] = @"hapticStrength";
  uint64_t v7 = +[NSNumber numberWithDouble:self->_hapticStrength];
  v24[8] = v7;
  v23[9] = @"doublePressShareGesture_ios";
  uint64_t v8 = +[NSNumber numberWithInteger:self->_doublePressShareGesture];
  v24[9] = v8;
  v23[10] = @"longPressShareGesture_ios";
  uint64_t v9 = +[NSNumber numberWithInteger:self->_longPressShareGesture];
  v24[10] = v9;
  v23[11] = @"lightbarOverride";
  id v10 = +[NSNumber numberWithBool:self->_lightbarOverride];
  v24[11] = v10;
  v23[12] = @"lightbarCustomColorEnabled";
  v11 = +[NSNumber numberWithBool:self->_lightbarCustomColorEnabled];
  v24[12] = v11;
  v23[13] = @"lightbarColor";
  uint64_t v12 = +[NSNumber numberWithInteger:self->_lightbarColor];
  v24[13] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:14];
  uint64_t v14 = +[NSMutableDictionary dictionaryWithDictionary:v13];

  persistentControllerIdentifier = self->_persistentControllerIdentifier;
  if (persistentControllerIdentifier) {
    [v14 setObject:persistentControllerIdentifier forKeyedSubscript:@"persistentControllerIdentifier"];
  }
  gameBundleIdentifier = self->_gameBundleIdentifier;
  if (gameBundleIdentifier) {
    [v14 setObject:gameBundleIdentifier forKeyedSubscript:@"gameBundleIdentifier"];
  }
  return (GCSJSONObject *)v14;
}

@end
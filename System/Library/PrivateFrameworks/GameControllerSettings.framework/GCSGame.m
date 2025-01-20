@interface GCSGame
+ (BOOL)supportsSecureCoding;
+ (GCSGame)defaultGame;
+ (id)archivalClasses;
+ (id)defaultIdentifier;
- (GCSGame)initWithBundleIdentifier:(id)a3 title:(id)a4 controllerToProfileMappings:(id)a5 controllerToCompatibilityModeMappings:(id)a6;
- (GCSGame)initWithCoder:(id)a3;
- (GCSGame)initWithJSONObject:(id)a3;
- (GCSJSONObject)jsonObject;
- (NSDate)modifiedDate;
- (NSDictionary)controllerToCompatibilityModeMappings;
- (NSDictionary)controllerToProfileMappings;
- (NSString)bundleIdentifier;
- (NSString)title;
- (id)description;
- (id)profileForController:(id)a3 profiles:(id)a4;
- (id)profileUUIDForPersistentControllerIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCSGame

+ (id)defaultIdentifier
{
  return @"com.apple.default";
}

+ (GCSGame)defaultGame
{
  v2 = [GCSGame alloc];
  v3 = +[GCSGame defaultIdentifier];
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = [(GCSGame *)v2 initWithBundleIdentifier:v3 title:@"GCS_GAME_ALL_GAMES" controllerToProfileMappings:v4 controllerToCompatibilityModeMappings:v5];

  return v6;
}

- (GCSGame)initWithBundleIdentifier:(id)a3 title:(id)a4 controllerToProfileMappings:(id)a5 controllerToCompatibilityModeMappings:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)GCSGame;
  v14 = [(GCSGame *)&v26 init];
  if (v14)
  {
    uint64_t v15 = +[NSDate date];
    modifiedDate = v14->_modifiedDate;
    v14->_modifiedDate = (NSDate *)v15;

    uint64_t v17 = [v10 copy];
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v17;

    uint64_t v19 = [v11 copy];
    title = v14->_title;
    v14->_title = (NSString *)v19;

    uint64_t v21 = [v12 copy];
    controllerToProfileMappings = v14->_controllerToProfileMappings;
    v14->_controllerToProfileMappings = (NSDictionary *)v21;

    uint64_t v23 = [v13 copy];
    controllerToCompatibilityModeMappings = v14->_controllerToCompatibilityModeMappings;
    v14->_controllerToCompatibilityModeMappings = (NSDictionary *)v23;
  }
  return v14;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<GCSGame %@ (%@)>", self->_title, self->_bundleIdentifier];
}

- (id)profileForController:(id)a3 profiles:(id)a4
{
  id v6 = a4;
  controllerToProfileMappings = self->_controllerToProfileMappings;
  v8 = [a3 persistentIdentifier];
  v9 = [(NSDictionary *)controllerToProfileMappings objectForKeyedSubscript:v8];

  if (v9)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v6;
    id v11 = (id)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(v14, "uuid", (void)v18);
          char v16 = [v15 isEqual:v9];

          if (v16)
          {
            id v11 = v14;
            goto LABEL_12;
          }
        }
        id v11 = (id)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)profileUUIDForPersistentControllerIdentifier:(id)a3
{
  v3 = [(NSDictionary *)self->_controllerToProfileMappings objectForKeyedSubscript:a3];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = +[GCSProfile defaultProfile];
    id v5 = [v6 uuid];
  }
  return v5;
}

- (NSString)title
{
  if ([(NSString *)self->_title isEqualToString:@"GCS_GAME_ALL_GAMES"])
  {
    _GCFConvertStringToLocalizedString();
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_title;
  }
  return v3;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (NSDictionary)controllerToProfileMappings
{
  return self->_controllerToProfileMappings;
}

- (NSDictionary)controllerToCompatibilityModeMappings
{
  return self->_controllerToCompatibilityModeMappings;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_controllerToCompatibilityModeMappings, 0);
  objc_storeStrong((id *)&self->_controllerToProfileMappings, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)archivalClasses
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return +[NSSet setWithObjects:](&off_26D32CB10, "setWithObjects:", v2, v3, v4, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSGame)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GCSGame;
  id v5 = [(GCSGame *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_modifiedDate"];
    modifiedDate = v5->_modifiedDate;
    v5->_modifiedDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    id v12 = objc_alloc((Class)&off_26D32CB10);
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_msgSend(v12, "initWithObjects:", v13, v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"_controllerToProfileMappings"];
    controllerToProfileMappings = v5->_controllerToProfileMappings;
    v5->_controllerToProfileMappings = (NSDictionary *)v16;

    uint64_t v18 = objc_opt_class();
    long long v19 = [v4 decodeDictionaryWithKeysOfClass:v18 objectsOfClass:objc_opt_class() forKey:@"_controllerToCompatibilityModeMappings"];
    long long v20 = v19;
    if (v19) {
      long long v21 = v19;
    }
    else {
      long long v21 = (NSDictionary *)objc_opt_new();
    }
    controllerToCompatibilityModeMappings = v5->_controllerToCompatibilityModeMappings;
    v5->_controllerToCompatibilityModeMappings = v21;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  modifiedDate = self->_modifiedDate;
  id v5 = a3;
  [v5 encodeObject:modifiedDate forKey:@"_modifiedDate"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"_bundleIdentifier"];
  [v5 encodeObject:self->_title forKey:@"_title"];
  [v5 encodeObject:self->_controllerToProfileMappings forKey:@"_controllerToProfileMappings"];
  [v5 encodeObject:self->_controllerToCompatibilityModeMappings forKey:@"_controllerToCompatibilityModeMappings"];
}

- (GCSGame)initWithJSONObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v23.receiver = self;
    v23.super_class = (Class)GCSGame;
    uint64_t v6 = [(GCSGame *)&v23 init];
    if (v6)
    {
      v7 = objc_msgSend(v5, "_gcs_dateForJSONKey:", @"modifiedDate");
      uint64_t v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        v9 = +[NSDate date];
      }
      modifiedDate = v6->_modifiedDate;
      v6->_modifiedDate = v9;

      uint64_t v12 = objc_msgSend(v5, "_gcs_stringForJSONKey:", @"bundleIdentifier");
      bundleIdentifier = v6->_bundleIdentifier;
      v6->_bundleIdentifier = (NSString *)v12;

      uint64_t v14 = objc_msgSend(v5, "_gcs_stringForJSONKey:", @"title");
      title = v6->_title;
      v6->_title = (NSString *)v14;

      uint64_t v16 = objc_msgSend(v5, "_gcs_dictionaryForJSONKey:", @"controllerToProfileMappings");
      uint64_t v17 = +[NSDictionary _gcs_serializableDictionaryForJsonObject:v16 withValuesOfClass:objc_opt_class()];
      controllerToProfileMappings = v6->_controllerToProfileMappings;
      v6->_controllerToProfileMappings = (NSDictionary *)v17;

      long long v19 = objc_msgSend(v5, "_gcs_dictionaryForJSONKey:", @"controllerToCompatibilityModeMappings");
      uint64_t v20 = +[NSDictionary _gcs_serializableDictionaryForJsonObject:v19 withValuesOfClass:objc_opt_class()];
      controllerToCompatibilityModeMappings = v6->_controllerToCompatibilityModeMappings;
      v6->_controllerToCompatibilityModeMappings = (NSDictionary *)v20;
    }
    self = v6;

    uint64_t v10 = self;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (GCSJSONObject)jsonObject
{
  v9[0] = @"modifiedDate";
  uint64_t v3 = [(NSDate *)self->_modifiedDate jsonObject];
  bundleIdentifier = self->_bundleIdentifier;
  v10[0] = v3;
  v10[1] = bundleIdentifier;
  v9[1] = @"bundleIdentifier";
  v9[2] = @"title";
  v10[2] = self->_title;
  v9[3] = @"controllerToProfileMappings";
  id v5 = +[NSDictionary _gcs_jsonObjectForSerializableDictionary:self->_controllerToProfileMappings];
  v10[3] = v5;
  v9[4] = @"controllerToCompatibilityModeMappings";
  uint64_t v6 = +[NSDictionary _gcs_jsonObjectForSerializableDictionary:self->_controllerToCompatibilityModeMappings];
  v10[4] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:5];

  return (GCSJSONObject *)v7;
}

@end
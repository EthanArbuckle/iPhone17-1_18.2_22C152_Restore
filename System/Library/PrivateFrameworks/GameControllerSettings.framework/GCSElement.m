@interface GCSElement
+ (BOOL)supportsSecureCoding;
- (GCSElement)initWithCoder:(id)a3;
- (GCSElement)initWithJSONObject:(id)a3;
- (GCSElement)initWithName:(id)a3 nameLocalizationKey:(id)a4 sfSymbolsName:(id)a5 remappingKey:(int)a6 kind:(int64_t)a7;
- (GCSJSONObject)jsonObject;
- (NSString)localizedName;
- (NSString)name;
- (NSString)nameLocalizationKey;
- (NSString)sfSymbolsName;
- (id)description;
- (int)remappingKey;
- (int64_t)kind;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCSElement

- (GCSElement)initWithName:(id)a3 nameLocalizationKey:(id)a4 sfSymbolsName:(id)a5 remappingKey:(int)a6 kind:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)GCSElement;
  v16 = [(GCSElement *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_name, a3);
    objc_storeStrong((id *)&v17->_nameLocalizationKey, a4);
    objc_storeStrong((id *)&v17->_sfSymbolsName, a5);
    v17->_remappingKey = a6;
    v17->_kind = a7;
  }

  return v17;
}

- (NSString)localizedName
{
  return (NSString *)_GCFConvertStringToLocalizedString();
}

- (id)description
{
  return +[NSString stringWithFormat:@"<GCSElement name=%@, nameLocalizationKey=%@, sfSymbolsName=%@, remappingKey=%d>", self->_name, self->_nameLocalizationKey, self->_sfSymbolsName, self->_remappingKey];
}

- (NSString)name
{
  return self->_name;
}

- (NSString)nameLocalizationKey
{
  return self->_nameLocalizationKey;
}

- (NSString)sfSymbolsName
{
  return self->_sfSymbolsName;
}

- (int64_t)kind
{
  return self->_kind;
}

- (int)remappingKey
{
  return self->_remappingKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfSymbolsName, 0);
  objc_storeStrong((id *)&self->_nameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSElement)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GCSElement;
  v5 = [(GCSElement *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nameLocalizationKey"];
    nameLocalizationKey = v5->_nameLocalizationKey;
    v5->_nameLocalizationKey = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sfSymbolsName"];
    sfSymbolsName = v5->_sfSymbolsName;
    v5->_sfSymbolsName = (NSString *)v10;

    v5->_remappingKey = [v4 decodeIntForKey:@"_remappingKey"];
    v5->_kind = [v4 decodeInt64ForKey:@"_kind"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"_name"];
  [v5 encodeObject:self->_nameLocalizationKey forKey:@"nameLocalizationKey"];
  [v5 encodeObject:self->_sfSymbolsName forKey:@"_sfSymbolsName"];
  [v5 encodeInt:self->_remappingKey forKey:@"_remappingKey"];
  [v5 encodeInt64:self->_kind forKey:@"_kind"];
}

- (GCSElement)initWithJSONObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v17.receiver = self;
    v17.super_class = (Class)GCSElement;
    uint64_t v6 = [(GCSElement *)&v17 init];
    if (v6)
    {
      uint64_t v7 = objc_msgSend(v5, "_gcs_stringForJSONKey:", @"name");
      name = v6->_name;
      v6->_name = (NSString *)v7;

      uint64_t v9 = objc_msgSend(v5, "_gcs_stringForJSONKey:", @"nameLocalizationKey");
      nameLocalizationKey = v6->_nameLocalizationKey;
      v6->_nameLocalizationKey = (NSString *)v9;

      uint64_t v11 = objc_msgSend(v5, "_gcs_stringForJSONKey:", @"sfSymbolsName");
      sfSymbolsName = v6->_sfSymbolsName;
      v6->_sfSymbolsName = (NSString *)v11;

      objc_super v13 = objc_msgSend(v5, "_gcs_numberForJSONKey:", @"remappingKey");
      v6->_remappingKey = [v13 intValue];

      id v14 = objc_msgSend(v5, "_gcs_numberForJSONKey:", @"kind");
      v6->_kind = [v14 longValue];
    }
    self = v6;

    id v15 = self;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (GCSJSONObject)jsonObject
{
  long long v8 = *(_OWORD *)&self->_name;
  v7[0] = @"name";
  v7[1] = @"nameLocalizationKey";
  sfSymbolsName = self->_sfSymbolsName;
  v7[2] = @"sfSymbolsName";
  v7[3] = @"remappingKey";
  v3 = +[NSNumber numberWithInt:self->_remappingKey];
  uint64_t v10 = v3;
  v7[4] = @"kind";
  id v4 = +[NSNumber numberWithInteger:self->_kind];
  uint64_t v11 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:v7 count:5];

  return (GCSJSONObject *)v5;
}

@end
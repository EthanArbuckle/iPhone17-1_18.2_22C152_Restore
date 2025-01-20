@interface INCodableEnum
+ (BOOL)supportsSecureCoding;
+ (id)__DisplayNameIDKey;
+ (id)__DisplayNameKey;
+ (id)__INCodableEnumValueDisplayNameIDKey;
+ (id)__INCodableEnumValueDisplayNameKey;
+ (id)__INCodableEnumValueIndexKey;
+ (id)__INCodableEnumValueNameKey;
+ (id)__INCodableEnumValueSynonymPronunciationHintIDKey;
+ (id)__INCodableEnumValueSynonymPronunciationHintKey;
+ (id)__INCodableEnumValueSynonymSynonymIDKey;
+ (id)__INCodableEnumValueSynonymSynonymKey;
+ (id)__INCodableEnumValueSynonymsKey;
+ (id)__NameKey;
+ (id)__TypeKey;
+ (id)__ValuesKey;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (INCodableEnum)initWithCoder:(id)a3;
- (INCodableEnum)initWithName:(id)a3 displayName:(id)a4 displayNameID:(id)a5 enumNamespace:(id)a6 type:(int64_t)a7 values:(id)a8 localizationTable:(id)a9;
- (INCodableLocalizationTable)_localizationTable;
- (NSArray)values;
- (NSString)displayName;
- (NSString)displayNameID;
- (NSString)enumNamespace;
- (NSString)localizedDisplayName;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)localizedDisplayNameWithLocalizer:(id)a3;
- (id)valueForIndex:(unint64_t)a3;
- (id)valuesByIndexForValues:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int64_t)type;
- (unint64_t)hash;
- (void)_setEnumNamespace:(id)a3;
- (void)_setLocalizationTable:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableEnum

- (void)updateWithDictionary:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "__NameKey");
  v6 = [v4 objectForKey:v5];
  name = self->_name;
  self->_name = v6;

  v8 = objc_msgSend((id)objc_opt_class(), "__DisplayNameKey");
  v9 = [v4 objectForKey:v8];
  displayName = self->_displayName;
  self->_displayName = v9;

  v11 = objc_msgSend((id)objc_opt_class(), "__DisplayNameIDKey");
  v12 = [v4 objectForKey:v11];
  displayNameID = self->_displayNameID;
  self->_displayNameID = v12;

  v35 = self;
  v14 = objc_msgSend((id)objc_opt_class(), "__TypeKey");
  v15 = [v4 objectForKey:v14];
  if ([v15 isEqualToString:@"State"])
  {
    int64_t v16 = 1;
  }
  else
  {
    int v17 = [v15 isEqualToString:@"Options"];
    int64_t v16 = 2;
    if (!v17) {
      int64_t v16 = 0;
    }
  }
  self->_type = v16;

  v18 = objc_msgSend((id)objc_opt_class(), "__ValuesKey");
  v34 = v4;
  v19 = [v4 objectForKey:v18];

  v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v22 = v19;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        v28 = objc_alloc_init(INCodableEnumValue);
        [(INCodableEnumValue *)v28 _setCodableEnum:v35];
        [(INCodableEnumValue *)v28 updateWithDictionary:v27];
        v29 = objc_msgSend(NSNumber, "numberWithInteger:", -[INCodableEnumValue index](v28, "index"));
        [v21 setObject:v28 forKeyedSubscript:v29];

        [v20 addObject:v28];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v24);
  }

  uint64_t v30 = [v21 copy];
  valuesByIndex = v35->_valuesByIndex;
  v35->_valuesByIndex = (NSDictionary *)v30;

  uint64_t v32 = [v20 copy];
  values = v35->_values;
  v35->_values = (NSArray *)v32;
}

- (NSString)name
{
  return self->_name;
}

- (void)_setLocalizationTable:(id)a3
{
}

- (void)_setEnumNamespace:(id)a3
{
}

+ (id)__ValuesKey
{
  return @"INEnumValues";
}

+ (id)__TypeKey
{
  return @"INEnumType";
}

+ (id)__NameKey
{
  return @"INEnumName";
}

+ (id)__DisplayNameIDKey
{
  return @"INEnumDisplayNameID";
}

+ (id)__DisplayNameKey
{
  return @"INEnumDisplayName";
}

+ (id)__INCodableEnumValueSynonymsKey
{
  return @"INEnumValueSynonyms";
}

+ (id)__INCodableEnumValueNameKey
{
  return @"INEnumValueName";
}

+ (id)__INCodableEnumValueIndexKey
{
  return @"INEnumValueIndex";
}

+ (id)__INCodableEnumValueDisplayNameIDKey
{
  return @"INEnumValueDisplayNameID";
}

+ (id)__INCodableEnumValueDisplayNameKey
{
  return @"INEnumValueDisplayName";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_enumNamespace, 0);
  objc_storeStrong((id *)&self->_displayNameID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_localizationTable, 0);

  objc_storeStrong((id *)&self->_valuesByIndex, 0);
}

- (NSArray)values
{
  return self->_values;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)enumNamespace
{
  return self->_enumNamespace;
}

- (NSString)displayNameID
{
  return self->_displayNameID;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (INCodableLocalizationTable)_localizationTable
{
  return self->_localizationTable;
}

- (INCodableEnum)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)INCodableEnum;
  v5 = [(INCodableEnum *)&v32 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayNameID"];
    displayNameID = v5->_displayNameID;
    v5->_displayNameID = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enumNamespace"];
    enumNamespace = v5->_enumNamespace;
    v5->_enumNamespace = (NSString *)v15;

    int v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"values"];
    values = v5->_values;
    v5->_values = (NSArray *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_localizationTable"];
    localizationTable = v5->_localizationTable;
    v5->_localizationTable = (INCodableLocalizationTable *)v22;

    uint64_t v24 = [(INCodableEnum *)v5 values];
    uint64_t v25 = [(INCodableEnum *)v5 valuesByIndexForValues:v24];
    valuesByIndex = v5->_valuesByIndex;
    v5->_valuesByIndex = (NSDictionary *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizationTable"];

    if (v27)
    {
      v28 = objc_alloc_init(INCodableLocalizationTable);
      v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizationTable"];
      [(INCodableLocalizationTable *)v28 setTableName:v29];

      uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleIdentifier"];
      [(INCodableLocalizationTable *)v28 setBundleIdentifier:v30];

      [(INCodableEnum *)v5 _setLocalizationTable:v28];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[INCodableEnum type](self, "type"), @"type");
  v5 = [(INCodableEnum *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  uint64_t v6 = [(INCodableEnum *)self displayName];
  [v4 encodeObject:v6 forKey:@"displayName"];

  v7 = [(INCodableEnum *)self displayNameID];
  [v4 encodeObject:v7 forKey:@"displayNameID"];

  v8 = [(INCodableEnum *)self enumNamespace];
  [v4 encodeObject:v8 forKey:@"enumNamespace"];

  uint64_t v9 = [(INCodableEnum *)self values];
  [v4 encodeObject:v9 forKey:@"values"];

  id v10 = [(INCodableEnum *)self _localizationTable];
  [v4 encodeObject:v10 forKey:@"_localizationTable"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  v8 = [v6 dictionary];
  objc_msgSend(v8, "intents_setIntegerIfNonZero:forKey:", -[INCodableEnum type](self, "type"), @"type");
  uint64_t v9 = [(INCodableEnum *)self name];
  objc_msgSend(v8, "intents_setPlistSafeObject:forKey:", v9, @"name");

  id v10 = [(INCodableEnum *)self displayName];
  uint64_t v11 = objc_msgSend(v10, "intents_encodeForPlistRepresentationWithParameters:", v7);
  objc_msgSend(v8, "intents_setPlistSafeObject:forKey:", v11, @"displayName");

  v12 = [(INCodableEnum *)self displayNameID];
  objc_msgSend(v8, "intents_setPlistSafeObject:forKey:", v12, @"displayNameID");

  uint64_t v13 = [(INCodableEnum *)self enumNamespace];
  objc_msgSend(v8, "intents_setPlistSafeObject:forKey:", v13, @"enumNamespace");

  v14 = [(INCodableEnum *)self values];
  id v20 = 0;
  objc_msgSend(v8, "intents_setArrayOfWidgetPlistRepresentable:forKey:parameters:error:", v14, @"values", v7, &v20);

  id v15 = v20;
  if (v15)
  {
    if (a4)
    {
LABEL_3:
      id v15 = v15;
      id v16 = 0;
      *a4 = v15;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  int v17 = [(INCodableEnum *)self _localizationTable];
  id v19 = 0;
  objc_msgSend(v8, "intents_setWidgetPlistRepresentable:forKey:error:", v17, @"_localizationTable", &v19);
  id v15 = v19;

  if (v15)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    id v16 = 0;
    goto LABEL_8;
  }
  id v16 = v8;
LABEL_8:

  return v16;
}

- (id)valuesByIndexForValues:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "index", (void)v13));
        [v4 setObject:v10 forKey:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v6 = [(INCodableEnum *)self values];
  uint64_t v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v8 = [(INCodableEnum *)self values];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = [*(id *)(*((void *)&v35 + 1) + 8 * i) dictionaryRepresentationWithLocalizer:v4];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v10);
  }

  v34 = objc_msgSend((id)objc_opt_class(), "__NameKey");
  v39[0] = v34;
  uint64_t v14 = [(INCodableEnum *)self name];
  long long v15 = (void *)v14;
  if (!v14)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = v15;
  uint64_t v30 = (void *)v14;
  v40[0] = v14;
  objc_super v32 = objc_msgSend((id)objc_opt_class(), "__DisplayNameKey");
  v39[1] = v32;
  uint64_t v16 = [(INCodableEnum *)self localizedDisplayNameWithLocalizer:v4];
  int v17 = (void *)v16;
  if (!v16)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v16;
  v40[1] = v16;
  v31 = objc_msgSend((id)objc_opt_class(), "__DisplayNameIDKey");
  v39[2] = v31;
  uint64_t v18 = [(INCodableEnum *)self displayNameID];
  id v19 = v18;
  if (!v18)
  {
    id v19 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v29, v30);
  }
  v40[2] = v19;
  id v20 = objc_msgSend((id)objc_opt_class(), "__TypeKey");
  v39[3] = v20;
  int64_t v21 = [(INCodableEnum *)self type];
  uint64_t v22 = @"State";
  if (v21 != 1) {
    uint64_t v22 = 0;
  }
  if (v21 == 2) {
    uint64_t v22 = @"Options";
  }
  uint64_t v23 = v22;
  uint64_t v24 = v23;
  if (!v23)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v40[3] = v24;
  uint64_t v25 = objc_msgSend((id)objc_opt_class(), "__ValuesKey");
  v39[4] = v25;
  v40[4] = v7;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:5];

  if (!v23) {
  if (!v18)
  }

  if (!v17) {
  if (!v33)
  }

  uint64_t v27 = objc_msgSend(v26, "if_dictionaryWithNonEmptyValues");

  return v27;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_opt_new();
  id v4 = [(INCodableEnum *)self dictionaryRepresentationWithLocalizer:v3];

  return v4;
}

- (id)localizedDisplayNameWithLocalizer:(id)a3
{
  id v4 = a3;
  id v5 = [(INCodableEnum *)self displayNameID];
  uint64_t v6 = [(INCodableEnum *)self displayName];
  uint64_t v7 = [(INCodableEnum *)self _localizationTable];
  uint64_t v8 = INLocalizedStringFromCodable(v5, v6, v7, v4, 0);

  return v8;
}

- (NSString)localizedDisplayName
{
  id v3 = objc_opt_new();
  id v4 = [(INCodableEnum *)self localizedDisplayNameWithLocalizer:v3];

  return (NSString *)v4;
}

- (id)valueForIndex:(unint64_t)a3
{
  valuesByIndex = self->_valuesByIndex;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  id v5 = [(NSDictionary *)valuesByIndex objectForKeyedSubscript:v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v7 = a3;
  if ([v7 isMemberOfClass:objc_opt_class()])
  {
    int64_t v8 = [(INCodableEnum *)self type];
    if (v8 == [v7 type])
    {
      uint64_t v9 = [(INCodableEnum *)self name];
      uint64_t v10 = [v7 name];
      if (![v9 isEqualToString:v10])
      {
        char v12 = 0;
        goto LABEL_26;
      }
      displayName = self->_displayName;
      if (displayName || ([v7 displayName], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v4 = [(INCodableEnum *)self displayName];
        id v5 = [v7 displayName];
        if (![v4 isEqualToString:v5])
        {
          char v12 = 0;
          goto LABEL_23;
        }
        int v27 = 1;
      }
      else
      {
        int v27 = 0;
      }
      long long v13 = [(INCodableEnum *)self displayNameID];
      uint64_t v14 = [v7 displayNameID];
      if ([v13 isEqualToString:v14])
      {
        uint64_t v24 = v3;
        long long v15 = [(INCodableEnum *)self enumNamespace];
        uint64_t v25 = [v7 enumNamespace];
        v26 = v15;
        if ([v15 isEqualToString:v25])
        {
          uint64_t v16 = [(INCodableEnum *)self values];
          uint64_t v17 = [v7 values];
          uint64_t v23 = (void *)v16;
          uint64_t v18 = (void *)v16;
          id v19 = (void *)v17;
          if ([v18 isEqual:v17])
          {
            uint64_t v22 = [(INCodableEnum *)self _localizationTable];
            int64_t v21 = [v7 _localizationTable];
            char v12 = [v22 isEqual:v21];
          }
          else
          {
            char v12 = 0;
          }
        }
        else
        {
          char v12 = 0;
        }

        if ((v27 & 1) == 0)
        {
          id v3 = v24;
          if (displayName) {
            goto LABEL_26;
          }
          goto LABEL_25;
        }
        id v3 = v24;
      }
      else
      {

        char v12 = 0;
        if (!v27)
        {
LABEL_24:
          if (!displayName) {
LABEL_25:
          }

LABEL_26:
          goto LABEL_27;
        }
      }
LABEL_23:

      goto LABEL_24;
    }
  }
  char v12 = 0;
LABEL_27:

  return v12;
}

- (unint64_t)hash
{
  id v3 = [(INCodableEnum *)self enumNamespace];
  uint64_t v4 = [v3 hash];
  id v5 = [(INCodableEnum *)self name];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(INCodableEnum *)self displayName];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = [(INCodableEnum *)self displayNameID];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[INCodableEnum type](self, "type"));
  uint64_t v12 = [v11 hash];
  long long v13 = [(INCodableEnum *)self values];
  uint64_t v14 = v10 ^ [v13 hash];
  long long v15 = [(INCodableEnum *)self _localizationTable];
  unint64_t v16 = v14 ^ [v15 hash] ^ v12;

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[INCodableEnum allocWithZone:a3];
  id v5 = [(INCodableEnum *)self name];
  uint64_t v6 = [(INCodableEnum *)self displayName];
  id v7 = [(INCodableEnum *)self displayNameID];
  uint64_t v8 = [(INCodableEnum *)self enumNamespace];
  int64_t v9 = [(INCodableEnum *)self type];
  uint64_t v10 = [(INCodableEnum *)self values];
  uint64_t v11 = [(INCodableEnum *)self _localizationTable];
  uint64_t v12 = [(INCodableEnum *)v4 initWithName:v5 displayName:v6 displayNameID:v7 enumNamespace:v8 type:v9 values:v10 localizationTable:v11];

  return v12;
}

- (INCodableEnum)initWithName:(id)a3 displayName:(id)a4 displayNameID:(id)a5 enumNamespace:(id)a6 type:(int64_t)a7 values:(id)a8 localizationTable:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  v38.receiver = self;
  v38.super_class = (Class)INCodableEnum;
  int64_t v21 = [(INCodableEnum *)&v38 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    name = v21->_name;
    v21->_name = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    displayName = v21->_displayName;
    v21->_displayName = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    displayNameID = v21->_displayNameID;
    v21->_displayNameID = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    enumNamespace = v21->_enumNamespace;
    v21->_enumNamespace = (NSString *)v28;

    v21->_type = a7;
    uint64_t v30 = [v19 copy];
    values = v21->_values;
    v21->_values = (NSArray *)v30;

    objc_super v32 = [(INCodableEnum *)v21 values];
    uint64_t v33 = [(INCodableEnum *)v21 valuesByIndexForValues:v32];
    valuesByIndex = v21->_valuesByIndex;
    v21->_valuesByIndex = (NSDictionary *)v33;

    uint64_t v35 = [v20 copy];
    localizationTable = v21->_localizationTable;
    v21->_localizationTable = (INCodableLocalizationTable *)v35;
  }
  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(INCodableEnum);
  v6->_type = objc_msgSend(v5, "intents_intForKey:", @"type");
  uint64_t v7 = objc_msgSend(v5, "intents_stringForKey:", @"name");
  name = v6->_name;
  v6->_name = (NSString *)v7;

  uint64_t v9 = objc_msgSend(v5, "intents_stringForKey:", @"displayName");
  displayName = v6->_displayName;
  v6->_displayName = (NSString *)v9;

  id v29 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __61__INCodableEnum_makeFromWidgetPlistableRepresentation_error___block_invoke;
  v27[3] = &unk_1E551E178;
  uint64_t v11 = v6;
  uint64_t v28 = v11;
  uint64_t v12 = +[NSObject intents_arrayOfWidgetPlistRepresentableInDict:v5 key:@"values" error:&v29 resultTransformer:v27];
  id v13 = v29;
  if (v13)
  {
    id v14 = v13;
    if (a4)
    {
LABEL_3:
      id v14 = v14;
      id v15 = 0;
      *a4 = v14;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v11->_values, v12);
  id v26 = 0;
  uint64_t v16 = +[NSObject intents_widgetPlistRepresentableInDict:v5 key:@"_localizationTable" error:&v26];
  id v14 = v26;
  localizationTable = v11->_localizationTable;
  v11->_localizationTable = (INCodableLocalizationTable *)v16;

  if (v14)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    id v15 = 0;
    goto LABEL_8;
  }
  uint64_t v18 = objc_msgSend(v5, "intents_stringForKey:", @"displayNameID");
  displayNameID = v11->_displayNameID;
  v11->_displayNameID = (NSString *)v18;

  uint64_t v20 = objc_msgSend(v5, "intents_stringForKey:", @"enumNamespace");
  enumNamespace = v11->_enumNamespace;
  v11->_enumNamespace = (NSString *)v20;

  uint64_t v22 = [(INCodableEnum *)v11 values];
  uint64_t v23 = [(INCodableEnum *)v11 valuesByIndexForValues:v22];
  valuesByIndex = v11->_valuesByIndex;
  v11->_valuesByIndex = (NSDictionary *)v23;

  id v15 = v11;
LABEL_8:

  return v15;
}

uint64_t __61__INCodableEnum_makeFromWidgetPlistableRepresentation_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setCodableEnum:*(void *)(a1 + 32)];
}

+ (id)__INCodableEnumValueSynonymSynonymIDKey
{
  return @"INEnumValueSynonymSynonymID";
}

+ (id)__INCodableEnumValueSynonymSynonymKey
{
  return @"INEnumValueSynonymSynonym";
}

+ (id)__INCodableEnumValueSynonymPronunciationHintIDKey
{
  return @"INEnumValueSynonymPronunciationHintID";
}

+ (id)__INCodableEnumValueSynonymPronunciationHintKey
{
  return @"INEnumValueSynonymPronunciationHint";
}

@end
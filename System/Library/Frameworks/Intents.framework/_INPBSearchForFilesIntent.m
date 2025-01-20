@interface _INPBSearchForFilesIntent
+ (BOOL)supportsSecureCoding;
+ (Class)propertiesType;
- (BOOL)hasAppId;
- (BOOL)hasEntityName;
- (BOOL)hasEntityType;
- (BOOL)hasIntentMetadata;
- (BOOL)hasScope;
- (BOOL)hasScopeEntityName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)properties;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSearchForFilesIntent)initWithCoder:(id)a3;
- (_INPBString)appId;
- (_INPBString)entityName;
- (_INPBString)scopeEntityName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)entityTypeAsString:(int)a3;
- (id)propertiesAtIndex:(unint64_t)a3;
- (id)scopeAsString:(int)a3;
- (int)StringAsEntityType:(id)a3;
- (int)StringAsScope:(id)a3;
- (int)entityType;
- (int)scope;
- (unint64_t)hash;
- (unint64_t)propertiesCount;
- (void)addProperties:(id)a3;
- (void)clearProperties;
- (void)encodeWithCoder:(id)a3;
- (void)setAppId:(id)a3;
- (void)setEntityName:(id)a3;
- (void)setEntityType:(int)a3;
- (void)setHasEntityType:(BOOL)a3;
- (void)setHasScope:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setProperties:(id)a3;
- (void)setScope:(int)a3;
- (void)setScopeEntityName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSearchForFilesIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopeEntityName, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_entityName, 0);

  objc_storeStrong((id *)&self->_appId, 0);
}

- (_INPBString)scopeEntityName
{
  return self->_scopeEntityName;
}

- (int)scope
{
  return self->_scope;
}

- (NSArray)properties
{
  return self->_properties;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)entityType
{
  return self->_entityType;
}

- (_INPBString)entityName
{
  return self->_entityName;
}

- (_INPBString)appId
{
  return self->_appId;
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSearchForFilesIntent *)self appId];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"appId"];

  v6 = [(_INPBSearchForFilesIntent *)self entityName];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"entityName"];

  if ([(_INPBSearchForFilesIntent *)self hasEntityType])
  {
    uint64_t v8 = [(_INPBSearchForFilesIntent *)self entityType];
    if (v8 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E55175F8[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"entityType"];
  }
  v10 = [(_INPBSearchForFilesIntent *)self intentMetadata];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"intentMetadata"];

  if ([(NSArray *)self->_properties count])
  {
    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v13 = self->_properties;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v24 + 1) + 8 * i) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"properties"];
  }
  if ([(_INPBSearchForFilesIntent *)self hasScope])
  {
    uint64_t v19 = [(_INPBSearchForFilesIntent *)self scope];
    if (v19 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v19);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E5517618[v19];
    }
    [v3 setObject:v20 forKeyedSubscript:@"scope"];
  }
  v21 = [(_INPBSearchForFilesIntent *)self scopeEntityName];
  v22 = [v21 dictionaryRepresentation];
  [v3 setObject:v22 forKeyedSubscript:@"scopeEntityName"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBString *)self->_appId hash];
  unint64_t v4 = [(_INPBString *)self->_entityName hash];
  if ([(_INPBSearchForFilesIntent *)self hasEntityType]) {
    uint64_t v5 = 2654435761 * self->_entityType;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  uint64_t v7 = [(NSArray *)self->_properties hash];
  if ([(_INPBSearchForFilesIntent *)self hasScope]) {
    uint64_t v8 = 2654435761 * self->_scope;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(_INPBString *)self->_scopeEntityName hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  uint64_t v5 = [(_INPBSearchForFilesIntent *)self appId];
  unint64_t v6 = [v4 appId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v7 = [(_INPBSearchForFilesIntent *)self appId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBSearchForFilesIntent *)self appId];
    v10 = [v4 appId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBSearchForFilesIntent *)self entityName];
  unint64_t v6 = [v4 entityName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v12 = [(_INPBSearchForFilesIntent *)self entityName];
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t v14 = [(_INPBSearchForFilesIntent *)self entityName];
    uint64_t v15 = [v4 entityName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  int v17 = [(_INPBSearchForFilesIntent *)self hasEntityType];
  if (v17 != [v4 hasEntityType]) {
    goto LABEL_35;
  }
  if ([(_INPBSearchForFilesIntent *)self hasEntityType])
  {
    if ([v4 hasEntityType])
    {
      int entityType = self->_entityType;
      if (entityType != [v4 entityType]) {
        goto LABEL_35;
      }
    }
  }
  uint64_t v5 = [(_INPBSearchForFilesIntent *)self intentMetadata];
  unint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v19 = [(_INPBSearchForFilesIntent *)self intentMetadata];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBSearchForFilesIntent *)self intentMetadata];
    v22 = [v4 intentMetadata];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBSearchForFilesIntent *)self properties];
  unint64_t v6 = [v4 properties];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v24 = [(_INPBSearchForFilesIntent *)self properties];
  if (v24)
  {
    long long v25 = (void *)v24;
    long long v26 = [(_INPBSearchForFilesIntent *)self properties];
    long long v27 = [v4 properties];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  int v29 = [(_INPBSearchForFilesIntent *)self hasScope];
  if (v29 != [v4 hasScope]) {
    goto LABEL_35;
  }
  if ([(_INPBSearchForFilesIntent *)self hasScope])
  {
    if ([v4 hasScope])
    {
      int scope = self->_scope;
      if (scope != [v4 scope]) {
        goto LABEL_35;
      }
    }
  }
  uint64_t v5 = [(_INPBSearchForFilesIntent *)self scopeEntityName];
  unint64_t v6 = [v4 scopeEntityName];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v31 = [(_INPBSearchForFilesIntent *)self scopeEntityName];
    if (!v31)
    {

LABEL_38:
      BOOL v36 = 1;
      goto LABEL_36;
    }
    v32 = (void *)v31;
    v33 = [(_INPBSearchForFilesIntent *)self scopeEntityName];
    v34 = [v4 scopeEntityName];
    char v35 = [v33 isEqual:v34];

    if (v35) {
      goto LABEL_38;
    }
  }
  else
  {
LABEL_34:
  }
LABEL_35:
  BOOL v36 = 0;
LABEL_36:

  return v36;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBSearchForFilesIntent allocWithZone:](_INPBSearchForFilesIntent, "allocWithZone:") init];
  id v6 = [(_INPBString *)self->_appId copyWithZone:a3];
  [(_INPBSearchForFilesIntent *)v5 setAppId:v6];

  id v7 = [(_INPBString *)self->_entityName copyWithZone:a3];
  [(_INPBSearchForFilesIntent *)v5 setEntityName:v7];

  if ([(_INPBSearchForFilesIntent *)self hasEntityType]) {
    [(_INPBSearchForFilesIntent *)v5 setEntityType:[(_INPBSearchForFilesIntent *)self entityType]];
  }
  id v8 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSearchForFilesIntent *)v5 setIntentMetadata:v8];

  v9 = (void *)[(NSArray *)self->_properties copyWithZone:a3];
  [(_INPBSearchForFilesIntent *)v5 setProperties:v9];

  if ([(_INPBSearchForFilesIntent *)self hasScope]) {
    [(_INPBSearchForFilesIntent *)v5 setScope:[(_INPBSearchForFilesIntent *)self scope]];
  }
  id v10 = [(_INPBString *)self->_scopeEntityName copyWithZone:a3];
  [(_INPBSearchForFilesIntent *)v5 setScopeEntityName:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSearchForFilesIntent *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSearchForFilesIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSearchForFilesIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSearchForFilesIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSearchForFilesIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_INPBSearchForFilesIntent *)self appId];

  if (v5)
  {
    id v6 = [(_INPBSearchForFilesIntent *)self appId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBSearchForFilesIntent *)self entityName];

  if (v7)
  {
    id v8 = [(_INPBSearchForFilesIntent *)self entityName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSearchForFilesIntent *)self hasEntityType]) {
    PBDataWriterWriteInt32Field();
  }
  v9 = [(_INPBSearchForFilesIntent *)self intentMetadata];

  if (v9)
  {
    id v10 = [(_INPBSearchForFilesIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v11 = self->_properties;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  if ([(_INPBSearchForFilesIntent *)self hasScope]) {
    PBDataWriterWriteInt32Field();
  }
  int v16 = [(_INPBSearchForFilesIntent *)self scopeEntityName];

  if (v16)
  {
    int v17 = [(_INPBSearchForFilesIntent *)self scopeEntityName];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForFilesIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasScopeEntityName
{
  return self->_scopeEntityName != 0;
}

- (void)setScopeEntityName:(id)a3
{
}

- (int)StringAsScope:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DIRECTORY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VOLUME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"COMPUTER"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)scopeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5517618[a3];
  }

  return v3;
}

- (void)setHasScope:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScope
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setScope:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int scope = a3;
  }
}

- (id)propertiesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_properties objectAtIndexedSubscript:a3];
}

- (unint64_t)propertiesCount
{
  return [(NSArray *)self->_properties count];
}

- (void)addProperties:(id)a3
{
  id v4 = a3;
  properties = self->_properties;
  id v8 = v4;
  if (!properties)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_properties;
    self->_properties = v6;

    id v4 = v8;
    properties = self->_properties;
  }
  [(NSArray *)properties addObject:v4];
}

- (void)clearProperties
{
}

- (void)setProperties:(id)a3
{
  self->_properties = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (int)StringAsEntityType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FOLDER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REFERENCE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"URL"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)entityTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E55175F8[a3];
  }

  return v3;
}

- (void)setHasEntityType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEntityType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEntityType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int entityType = a3;
  }
}

- (BOOL)hasEntityName
{
  return self->_entityName != 0;
}

- (void)setEntityName:(id)a3
{
}

- (BOOL)hasAppId
{
  return self->_appId != 0;
}

- (void)setAppId:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)propertiesType
{
  return (Class)objc_opt_class();
}

@end
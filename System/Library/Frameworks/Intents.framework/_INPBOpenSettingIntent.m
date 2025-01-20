@interface _INPBOpenSettingIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIntentMetadata;
- (BOOL)hasSearchQuery;
- (BOOL)hasSettingMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDataString)searchQuery;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBOpenSettingIntent)initWithCoder:(id)a3;
- (_INPBSettingMetadata)settingMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setSearchQuery:(id)a3;
- (void)setSettingMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBOpenSettingIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingMetadata, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (_INPBSettingMetadata)settingMetadata
{
  return self->_settingMetadata;
}

- (_INPBDataString)searchQuery
{
  return self->_searchQuery;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBOpenSettingIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  v6 = [(_INPBOpenSettingIntent *)self searchQuery];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"searchQuery"];

  v8 = [(_INPBOpenSettingIntent *)self settingMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"settingMetadata"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v4 = [(_INPBDataString *)self->_searchQuery hash] ^ v3;
  return v4 ^ [(_INPBSettingMetadata *)self->_settingMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBOpenSettingIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBOpenSettingIntent *)self intentMetadata];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBOpenSettingIntent *)self intentMetadata];
    v10 = [v4 intentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBOpenSettingIntent *)self searchQuery];
  v6 = [v4 searchQuery];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBOpenSettingIntent *)self searchQuery];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBOpenSettingIntent *)self searchQuery];
    v15 = [v4 searchQuery];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBOpenSettingIntent *)self settingMetadata];
  v6 = [v4 settingMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBOpenSettingIntent *)self settingMetadata];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBOpenSettingIntent *)self settingMetadata];
    v20 = [v4 settingMetadata];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBOpenSettingIntent allocWithZone:](_INPBOpenSettingIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBOpenSettingIntent *)v5 setIntentMetadata:v6];

  id v7 = [(_INPBDataString *)self->_searchQuery copyWithZone:a3];
  [(_INPBOpenSettingIntent *)v5 setSearchQuery:v7];

  id v8 = [(_INPBSettingMetadata *)self->_settingMetadata copyWithZone:a3];
  [(_INPBOpenSettingIntent *)v5 setSettingMetadata:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBOpenSettingIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBOpenSettingIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBOpenSettingIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBOpenSettingIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBOpenSettingIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_INPBOpenSettingIntent *)self intentMetadata];

  if (v4)
  {
    v5 = [(_INPBOpenSettingIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBOpenSettingIntent *)self searchQuery];

  if (v6)
  {
    uint64_t v7 = [(_INPBOpenSettingIntent *)self searchQuery];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBOpenSettingIntent *)self settingMetadata];

  if (v8)
  {
    v9 = [(_INPBOpenSettingIntent *)self settingMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBOpenSettingIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasSettingMetadata
{
  return self->_settingMetadata != 0;
}

- (void)setSettingMetadata:(id)a3
{
}

- (BOOL)hasSearchQuery
{
  return self->_searchQuery != 0;
}

- (void)setSearchQuery:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
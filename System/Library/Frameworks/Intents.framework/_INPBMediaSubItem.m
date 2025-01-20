@interface _INPBMediaSubItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAssetInfo;
- (BOOL)hasIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)assetInfo;
- (NSString)identifier;
- (_INPBMediaSubItem)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetInfo:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBMediaSubItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_assetInfo, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)assetInfo
{
  return self->_assetInfo;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_assetInfo)
  {
    v4 = [(_INPBMediaSubItem *)self assetInfo];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"assetInfo"];
  }
  if (self->_identifier)
  {
    v6 = [(_INPBMediaSubItem *)self identifier];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"identifier"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_assetInfo hash];
  return [(NSString *)self->_identifier hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBMediaSubItem *)self assetInfo];
  v6 = [v4 assetInfo];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBMediaSubItem *)self assetInfo];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBMediaSubItem *)self assetInfo];
    v10 = [v4 assetInfo];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBMediaSubItem *)self identifier];
  v6 = [v4 identifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBMediaSubItem *)self identifier];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBMediaSubItem *)self identifier];
    v15 = [v4 identifier];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBMediaSubItem allocWithZone:](_INPBMediaSubItem, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_assetInfo copyWithZone:a3];
  [(_INPBMediaSubItem *)v5 setAssetInfo:v6];

  uint64_t v7 = (void *)[(NSString *)self->_identifier copyWithZone:a3];
  [(_INPBMediaSubItem *)v5 setIdentifier:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBMediaSubItem *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBMediaSubItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBMediaSubItem *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBMediaSubItem *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBMediaSubItem *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBMediaSubItem *)self assetInfo];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_INPBMediaSubItem *)self identifier];

  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBMediaSubItemReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  identifier = self->_identifier;
  self->_identifier = v4;

  MEMORY[0x1F41817F8](v4, identifier);
}

- (BOOL)hasAssetInfo
{
  return self->_assetInfo != 0;
}

- (void)setAssetInfo:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  assetInfo = self->_assetInfo;
  self->_assetInfo = v4;

  MEMORY[0x1F41817F8](v4, assetInfo);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
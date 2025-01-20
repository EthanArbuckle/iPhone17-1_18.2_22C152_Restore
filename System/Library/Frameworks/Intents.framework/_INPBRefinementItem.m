@interface _INPBRefinementItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hasItem;
- (BOOL)hasSubKeyPath;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)subKeyPath;
- (_INPBRefinementItem)initWithCoder:(id)a3;
- (_INPBSelectionItem)item;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setItem:(id)a3;
- (void)setSubKeyPath:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBRefinementItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subKeyPath, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

- (NSString)subKeyPath
{
  return self->_subKeyPath;
}

- (_INPBSelectionItem)item
{
  return self->_item;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBRefinementItem *)self item];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"item"];

  if (self->_subKeyPath)
  {
    v6 = [(_INPBRefinementItem *)self subKeyPath];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"subKeyPath"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBSelectionItem *)self->_item hash];
  return [(NSString *)self->_subKeyPath hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBRefinementItem *)self item];
  v6 = [v4 item];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBRefinementItem *)self item];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBRefinementItem *)self item];
    v10 = [v4 item];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBRefinementItem *)self subKeyPath];
  v6 = [v4 subKeyPath];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBRefinementItem *)self subKeyPath];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBRefinementItem *)self subKeyPath];
    v15 = [v4 subKeyPath];
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
  v5 = [+[_INPBRefinementItem allocWithZone:](_INPBRefinementItem, "allocWithZone:") init];
  id v6 = [(_INPBSelectionItem *)self->_item copyWithZone:a3];
  [(_INPBRefinementItem *)v5 setItem:v6];

  uint64_t v7 = (void *)[(NSString *)self->_subKeyPath copyWithZone:a3];
  [(_INPBRefinementItem *)v5 setSubKeyPath:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBRefinementItem *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBRefinementItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBRefinementItem *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBRefinementItem *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBRefinementItem *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(_INPBRefinementItem *)self item];

  if (v4)
  {
    v5 = [(_INPBRefinementItem *)self item];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBRefinementItem *)self subKeyPath];

  if (v6) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRefinementItemReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasSubKeyPath
{
  return self->_subKeyPath != 0;
}

- (void)setSubKeyPath:(id)a3
{
  self->_subKeyPath = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasItem
{
  return self->_item != 0;
}

- (void)setItem:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
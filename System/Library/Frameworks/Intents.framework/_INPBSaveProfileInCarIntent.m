@interface _INPBSaveProfileInCarIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIntentMetadata;
- (BOOL)hasProfileName;
- (BOOL)hasProfileNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBInteger)profileNumber;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSaveProfileInCarIntent)initWithCoder:(id)a3;
- (_INPBString)profileName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setProfileName:(id)a3;
- (void)setProfileNumber:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSaveProfileInCarIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileNumber, 0);
  objc_storeStrong((id *)&self->_profileName, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (_INPBInteger)profileNumber
{
  return self->_profileNumber;
}

- (_INPBString)profileName
{
  return self->_profileName;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSaveProfileInCarIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  v6 = [(_INPBSaveProfileInCarIntent *)self profileName];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"profileName"];

  v8 = [(_INPBSaveProfileInCarIntent *)self profileNumber];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"profileNumber"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v4 = [(_INPBString *)self->_profileName hash] ^ v3;
  return v4 ^ [(_INPBInteger *)self->_profileNumber hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBSaveProfileInCarIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBSaveProfileInCarIntent *)self intentMetadata];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSaveProfileInCarIntent *)self intentMetadata];
    v10 = [v4 intentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBSaveProfileInCarIntent *)self profileName];
  v6 = [v4 profileName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBSaveProfileInCarIntent *)self profileName];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSaveProfileInCarIntent *)self profileName];
    v15 = [v4 profileName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBSaveProfileInCarIntent *)self profileNumber];
  v6 = [v4 profileNumber];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBSaveProfileInCarIntent *)self profileNumber];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBSaveProfileInCarIntent *)self profileNumber];
    v20 = [v4 profileNumber];
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
  v5 = [+[_INPBSaveProfileInCarIntent allocWithZone:](_INPBSaveProfileInCarIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSaveProfileInCarIntent *)v5 setIntentMetadata:v6];

  id v7 = [(_INPBString *)self->_profileName copyWithZone:a3];
  [(_INPBSaveProfileInCarIntent *)v5 setProfileName:v7];

  id v8 = [(_INPBInteger *)self->_profileNumber copyWithZone:a3];
  [(_INPBSaveProfileInCarIntent *)v5 setProfileNumber:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSaveProfileInCarIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSaveProfileInCarIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSaveProfileInCarIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSaveProfileInCarIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSaveProfileInCarIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_INPBSaveProfileInCarIntent *)self intentMetadata];

  if (v4)
  {
    v5 = [(_INPBSaveProfileInCarIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBSaveProfileInCarIntent *)self profileName];

  if (v6)
  {
    uint64_t v7 = [(_INPBSaveProfileInCarIntent *)self profileName];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBSaveProfileInCarIntent *)self profileNumber];

  if (v8)
  {
    v9 = [(_INPBSaveProfileInCarIntent *)self profileNumber];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSaveProfileInCarIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasProfileNumber
{
  return self->_profileNumber != 0;
}

- (void)setProfileNumber:(id)a3
{
}

- (BOOL)hasProfileName
{
  return self->_profileName != 0;
}

- (void)setProfileName:(id)a3
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
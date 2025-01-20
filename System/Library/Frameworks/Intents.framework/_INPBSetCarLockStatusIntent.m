@interface _INPBSetCarLockStatusIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCarName;
- (BOOL)hasIntentMetadata;
- (BOOL)hasLocked;
- (BOOL)isEqual:(id)a3;
- (BOOL)locked;
- (BOOL)readFrom:(id)a3;
- (_INPBDataString)carName;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSetCarLockStatusIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCarName:(id)a3;
- (void)setHasLocked:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setLocked:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetCarLockStatusIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_carName, 0);
}

- (BOOL)locked
{
  return self->_locked;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBDataString)carName
{
  return self->_carName;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSetCarLockStatusIntent *)self carName];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"carName"];

  v6 = [(_INPBSetCarLockStatusIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBSetCarLockStatusIntent *)self hasLocked])
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBSetCarLockStatusIntent locked](self, "locked"));
    [v3 setObject:v8 forKeyedSubscript:@"locked"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBDataString *)self->_carName hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBSetCarLockStatusIntent *)self hasLocked]) {
    uint64_t v5 = 2654435761 * self->_locked;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(_INPBSetCarLockStatusIntent *)self carName];
  v6 = [v4 carName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBSetCarLockStatusIntent *)self carName];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSetCarLockStatusIntent *)self carName];
    v10 = [v4 carName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBSetCarLockStatusIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(_INPBSetCarLockStatusIntent *)self intentMetadata];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSetCarLockStatusIntent *)self intentMetadata];
    v15 = [v4 intentMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  int v19 = [(_INPBSetCarLockStatusIntent *)self hasLocked];
  if (v19 == [v4 hasLocked])
  {
    if (![(_INPBSetCarLockStatusIntent *)self hasLocked]
      || ![v4 hasLocked]
      || (int locked = self->_locked, locked == [v4 locked]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBSetCarLockStatusIntent allocWithZone:](_INPBSetCarLockStatusIntent, "allocWithZone:") init];
  id v6 = [(_INPBDataString *)self->_carName copyWithZone:a3];
  [(_INPBSetCarLockStatusIntent *)v5 setCarName:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSetCarLockStatusIntent *)v5 setIntentMetadata:v7];

  if ([(_INPBSetCarLockStatusIntent *)self hasLocked]) {
    [(_INPBSetCarLockStatusIntent *)v5 setLocked:[(_INPBSetCarLockStatusIntent *)self locked]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetCarLockStatusIntent *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetCarLockStatusIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetCarLockStatusIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetCarLockStatusIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetCarLockStatusIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_INPBSetCarLockStatusIntent *)self carName];

  if (v4)
  {
    uint64_t v5 = [(_INPBSetCarLockStatusIntent *)self carName];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBSetCarLockStatusIntent *)self intentMetadata];

  if (v6)
  {
    uint64_t v7 = [(_INPBSetCarLockStatusIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSetCarLockStatusIntent *)self hasLocked]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetCarLockStatusIntentReadFrom(self, (uint64_t)a3);
}

- (void)setHasLocked:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocked
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLocked:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int locked = a3;
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasCarName
{
  return self->_carName != 0;
}

- (void)setCarName:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
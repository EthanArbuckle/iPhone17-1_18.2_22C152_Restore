@interface _INPBSetDefrosterSettingsInCarIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)enable;
- (BOOL)hasCarName;
- (BOOL)hasDefroster;
- (BOOL)hasEnable;
- (BOOL)hasIntentMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDataString)carName;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSetDefrosterSettingsInCarIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defrosterAsString:(int)a3;
- (id)dictionaryRepresentation;
- (int)StringAsDefroster:(id)a3;
- (int)defroster;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCarName:(id)a3;
- (void)setDefroster:(int)a3;
- (void)setEnable:(BOOL)a3;
- (void)setHasDefroster:(BOOL)a3;
- (void)setHasEnable:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetDefrosterSettingsInCarIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_carName, 0);
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (BOOL)enable
{
  return self->_enable;
}

- (int)defroster
{
  return self->_defroster;
}

- (_INPBDataString)carName
{
  return self->_carName;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSetDefrosterSettingsInCarIntent *)self carName];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"carName"];

  if ([(_INPBSetDefrosterSettingsInCarIntent *)self hasDefroster])
  {
    uint64_t v6 = [(_INPBSetDefrosterSettingsInCarIntent *)self defroster];
    if ((v6 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E5518488[(v6 - 1)];
    }
    [v3 setObject:v7 forKeyedSubscript:@"defroster"];
  }
  if ([(_INPBSetDefrosterSettingsInCarIntent *)self hasEnable])
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBSetDefrosterSettingsInCarIntent enable](self, "enable"));
    [v3 setObject:v8 forKeyedSubscript:@"enable"];
  }
  v9 = [(_INPBSetDefrosterSettingsInCarIntent *)self intentMetadata];
  v10 = [v9 dictionaryRepresentation];
  [v3 setObject:v10 forKeyedSubscript:@"intentMetadata"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBDataString *)self->_carName hash];
  if ([(_INPBSetDefrosterSettingsInCarIntent *)self hasDefroster]) {
    uint64_t v4 = 2654435761 * self->_defroster;
  }
  else {
    uint64_t v4 = 0;
  }
  if ([(_INPBSetDefrosterSettingsInCarIntent *)self hasEnable]) {
    uint64_t v5 = 2654435761 * self->_enable;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(_INPBIntentMetadata *)self->_intentMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  uint64_t v5 = [(_INPBSetDefrosterSettingsInCarIntent *)self carName];
  uint64_t v6 = [v4 carName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(_INPBSetDefrosterSettingsInCarIntent *)self carName];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSetDefrosterSettingsInCarIntent *)self carName];
    v10 = [v4 carName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  int v12 = [(_INPBSetDefrosterSettingsInCarIntent *)self hasDefroster];
  if (v12 != [v4 hasDefroster]) {
    goto LABEL_20;
  }
  if ([(_INPBSetDefrosterSettingsInCarIntent *)self hasDefroster])
  {
    if ([v4 hasDefroster])
    {
      int defroster = self->_defroster;
      if (defroster != [v4 defroster]) {
        goto LABEL_20;
      }
    }
  }
  int v14 = [(_INPBSetDefrosterSettingsInCarIntent *)self hasEnable];
  if (v14 != [v4 hasEnable]) {
    goto LABEL_20;
  }
  if ([(_INPBSetDefrosterSettingsInCarIntent *)self hasEnable])
  {
    if ([v4 hasEnable])
    {
      int enable = self->_enable;
      if (enable != [v4 enable]) {
        goto LABEL_20;
      }
    }
  }
  uint64_t v5 = [(_INPBSetDefrosterSettingsInCarIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v16 = [(_INPBSetDefrosterSettingsInCarIntent *)self intentMetadata];
    if (!v16)
    {

LABEL_23:
      BOOL v21 = 1;
      goto LABEL_21;
    }
    v17 = (void *)v16;
    v18 = [(_INPBSetDefrosterSettingsInCarIntent *)self intentMetadata];
    v19 = [v4 intentMetadata];
    char v20 = [v18 isEqual:v19];

    if (v20) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v21 = 0;
LABEL_21:

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBSetDefrosterSettingsInCarIntent allocWithZone:](_INPBSetDefrosterSettingsInCarIntent, "allocWithZone:") init];
  id v6 = [(_INPBDataString *)self->_carName copyWithZone:a3];
  [(_INPBSetDefrosterSettingsInCarIntent *)v5 setCarName:v6];

  if ([(_INPBSetDefrosterSettingsInCarIntent *)self hasDefroster]) {
    [(_INPBSetDefrosterSettingsInCarIntent *)v5 setDefroster:[(_INPBSetDefrosterSettingsInCarIntent *)self defroster]];
  }
  if ([(_INPBSetDefrosterSettingsInCarIntent *)self hasEnable]) {
    [(_INPBSetDefrosterSettingsInCarIntent *)v5 setEnable:[(_INPBSetDefrosterSettingsInCarIntent *)self enable]];
  }
  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSetDefrosterSettingsInCarIntent *)v5 setIntentMetadata:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetDefrosterSettingsInCarIntent *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetDefrosterSettingsInCarIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetDefrosterSettingsInCarIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetDefrosterSettingsInCarIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetDefrosterSettingsInCarIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_INPBSetDefrosterSettingsInCarIntent *)self carName];

  if (v4)
  {
    uint64_t v5 = [(_INPBSetDefrosterSettingsInCarIntent *)self carName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSetDefrosterSettingsInCarIntent *)self hasDefroster]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBSetDefrosterSettingsInCarIntent *)self hasEnable]) {
    PBDataWriterWriteBOOLField();
  }
  id v6 = [(_INPBSetDefrosterSettingsInCarIntent *)self intentMetadata];

  uint64_t v7 = v9;
  if (v6)
  {
    v8 = [(_INPBSetDefrosterSettingsInCarIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetDefrosterSettingsInCarIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (void)setHasEnable:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEnable
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEnable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int enable = a3;
}

- (int)StringAsDefroster:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FRONT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REAR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ALL"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)defrosterAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5518488[a3 - 1];
  }

  return v3;
}

- (void)setHasDefroster:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDefroster
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDefroster:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int defroster = a3;
  }
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
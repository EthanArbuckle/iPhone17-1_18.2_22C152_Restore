@interface _INPBGetFileInformationIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEntityName;
- (BOOL)hasProperty;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (_INPBFileProperty)property;
- (_INPBGetFileInformationIntentResponse)initWithCoder:(id)a3;
- (_INPBString)entityName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEntityName:(id)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setProperty:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBGetFileInformationIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_property, 0);

  objc_storeStrong((id *)&self->_entityName, 0);
}

- (BOOL)success
{
  return self->_success;
}

- (_INPBFileProperty)property
{
  return self->_property;
}

- (_INPBString)entityName
{
  return self->_entityName;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBGetFileInformationIntentResponse *)self entityName];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"entityName"];

  v6 = [(_INPBGetFileInformationIntentResponse *)self property];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"property"];

  if ([(_INPBGetFileInformationIntentResponse *)self hasSuccess])
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBGetFileInformationIntentResponse success](self, "success"));
    [v3 setObject:v8 forKeyedSubscript:@"success"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBString *)self->_entityName hash];
  unint64_t v4 = [(_INPBFileProperty *)self->_property hash];
  if ([(_INPBGetFileInformationIntentResponse *)self hasSuccess]) {
    uint64_t v5 = 2654435761 * self->_success;
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
  uint64_t v5 = [(_INPBGetFileInformationIntentResponse *)self entityName];
  v6 = [v4 entityName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBGetFileInformationIntentResponse *)self entityName];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBGetFileInformationIntentResponse *)self entityName];
    v10 = [v4 entityName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBGetFileInformationIntentResponse *)self property];
  v6 = [v4 property];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(_INPBGetFileInformationIntentResponse *)self property];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBGetFileInformationIntentResponse *)self property];
    v15 = [v4 property];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  int v19 = [(_INPBGetFileInformationIntentResponse *)self hasSuccess];
  if (v19 == [v4 hasSuccess])
  {
    if (![(_INPBGetFileInformationIntentResponse *)self hasSuccess]
      || ![v4 hasSuccess]
      || (int success = self->_success, success == [v4 success]))
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
  uint64_t v5 = [+[_INPBGetFileInformationIntentResponse allocWithZone:](_INPBGetFileInformationIntentResponse, "allocWithZone:") init];
  id v6 = [(_INPBString *)self->_entityName copyWithZone:a3];
  [(_INPBGetFileInformationIntentResponse *)v5 setEntityName:v6];

  id v7 = [(_INPBFileProperty *)self->_property copyWithZone:a3];
  [(_INPBGetFileInformationIntentResponse *)v5 setProperty:v7];

  if ([(_INPBGetFileInformationIntentResponse *)self hasSuccess]) {
    [(_INPBGetFileInformationIntentResponse *)v5 setSuccess:[(_INPBGetFileInformationIntentResponse *)self success]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBGetFileInformationIntentResponse *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBGetFileInformationIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBGetFileInformationIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBGetFileInformationIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBGetFileInformationIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_INPBGetFileInformationIntentResponse *)self entityName];

  if (v4)
  {
    uint64_t v5 = [(_INPBGetFileInformationIntentResponse *)self entityName];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBGetFileInformationIntentResponse *)self property];

  if (v6)
  {
    uint64_t v7 = [(_INPBGetFileInformationIntentResponse *)self property];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBGetFileInformationIntentResponse *)self hasSuccess]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGetFileInformationIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)setHasSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSuccess
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int success = a3;
}

- (BOOL)hasProperty
{
  return self->_property != 0;
}

- (void)setProperty:(id)a3
{
}

- (BOOL)hasEntityName
{
  return self->_entityName != 0;
}

- (void)setEntityName:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
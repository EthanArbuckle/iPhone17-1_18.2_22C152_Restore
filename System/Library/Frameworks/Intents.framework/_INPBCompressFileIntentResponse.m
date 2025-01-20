@interface _INPBCompressFileIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEntityName;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (_INPBCompressFileIntentResponse)initWithCoder:(id)a3;
- (_INPBString)entityName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEntityName:(id)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCompressFileIntentResponse

- (void).cxx_destruct
{
}

- (BOOL)success
{
  return self->_success;
}

- (_INPBString)entityName
{
  return self->_entityName;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBCompressFileIntentResponse *)self entityName];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"entityName"];

  if ([(_INPBCompressFileIntentResponse *)self hasSuccess])
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBCompressFileIntentResponse success](self, "success"));
    [v3 setObject:v6 forKeyedSubscript:@"success"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBString *)self->_entityName hash];
  if ([(_INPBCompressFileIntentResponse *)self hasSuccess]) {
    uint64_t v4 = 2654435761 * self->_success;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  v5 = [(_INPBCompressFileIntentResponse *)self entityName];
  v6 = [v4 entityName];
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(_INPBCompressFileIntentResponse *)self entityName];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [(_INPBCompressFileIntentResponse *)self entityName];
      v11 = [v4 entityName];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    int v13 = [(_INPBCompressFileIntentResponse *)self hasSuccess];
    if (v13 == [v4 hasSuccess])
    {
      if (![(_INPBCompressFileIntentResponse *)self hasSuccess]
        || ![v4 hasSuccess]
        || (int success = self->_success, success == [v4 success]))
      {
        BOOL v14 = 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
  }
LABEL_9:
  BOOL v14 = 0;
LABEL_10:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBCompressFileIntentResponse allocWithZone:](_INPBCompressFileIntentResponse, "allocWithZone:") init];
  id v6 = [(_INPBString *)self->_entityName copyWithZone:a3];
  [(_INPBCompressFileIntentResponse *)v5 setEntityName:v6];

  if ([(_INPBCompressFileIntentResponse *)self hasSuccess]) {
    [(_INPBCompressFileIntentResponse *)v5 setSuccess:[(_INPBCompressFileIntentResponse *)self success]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCompressFileIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCompressFileIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCompressFileIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCompressFileIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCompressFileIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBCompressFileIntentResponse *)self entityName];

  if (v4)
  {
    v5 = [(_INPBCompressFileIntentResponse *)self entityName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBCompressFileIntentResponse *)self hasSuccess]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCompressFileIntentResponseReadFrom(self, (uint64_t)a3);
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
@interface _INPBIntentResponsePayloadSuccess
+ (BOOL)supportsSecureCoding;
- (BOOL)hasResponseMessageData;
- (BOOL)hasResponseTypeName;
- (BOOL)hasShouldOpenContainingApplication;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldOpenContainingApplication;
- (NSData)responseMessageData;
- (NSString)responseTypeName;
- (_INPBIntentResponsePayloadSuccess)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasShouldOpenContainingApplication:(BOOL)a3;
- (void)setResponseMessageData:(id)a3;
- (void)setResponseTypeName:(id)a3;
- (void)setShouldOpenContainingApplication:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBIntentResponsePayloadSuccess

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseTypeName, 0);

  objc_storeStrong((id *)&self->_responseMessageData, 0);
}

- (BOOL)shouldOpenContainingApplication
{
  return self->_shouldOpenContainingApplication;
}

- (NSString)responseTypeName
{
  return self->_responseTypeName;
}

- (NSData)responseMessageData
{
  return self->_responseMessageData;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_responseMessageData)
  {
    v4 = [(_INPBIntentResponsePayloadSuccess *)self responseMessageData];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"response_message_data"];
  }
  if (self->_responseTypeName)
  {
    v6 = [(_INPBIntentResponsePayloadSuccess *)self responseTypeName];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"response_type_name"];
  }
  if ([(_INPBIntentResponsePayloadSuccess *)self hasShouldOpenContainingApplication])
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBIntentResponsePayloadSuccess shouldOpenContainingApplication](self, "shouldOpenContainingApplication"));
    [v3 setObject:v8 forKeyedSubscript:@"shouldOpenContainingApplication"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_responseMessageData hash];
  NSUInteger v4 = [(NSString *)self->_responseTypeName hash];
  if ([(_INPBIntentResponsePayloadSuccess *)self hasShouldOpenContainingApplication])
  {
    uint64_t v5 = 2654435761 * self->_shouldOpenContainingApplication;
  }
  else
  {
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
  uint64_t v5 = [(_INPBIntentResponsePayloadSuccess *)self responseMessageData];
  v6 = [v4 responseMessageData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBIntentResponsePayloadSuccess *)self responseMessageData];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBIntentResponsePayloadSuccess *)self responseMessageData];
    v10 = [v4 responseMessageData];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBIntentResponsePayloadSuccess *)self responseTypeName];
  v6 = [v4 responseTypeName];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(_INPBIntentResponsePayloadSuccess *)self responseTypeName];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBIntentResponsePayloadSuccess *)self responseTypeName];
    v15 = [v4 responseTypeName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  int v19 = [(_INPBIntentResponsePayloadSuccess *)self hasShouldOpenContainingApplication];
  if (v19 == [v4 hasShouldOpenContainingApplication])
  {
    if (!-[_INPBIntentResponsePayloadSuccess hasShouldOpenContainingApplication](self, "hasShouldOpenContainingApplication")|| ![v4 hasShouldOpenContainingApplication]|| (int shouldOpenContainingApplication = self->_shouldOpenContainingApplication, shouldOpenContainingApplication == objc_msgSend(v4, "shouldOpenContainingApplication")))
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
  uint64_t v5 = [+[_INPBIntentResponsePayloadSuccess allocWithZone:](_INPBIntentResponsePayloadSuccess, "allocWithZone:") init];
  v6 = (void *)[(NSData *)self->_responseMessageData copyWithZone:a3];
  [(_INPBIntentResponsePayloadSuccess *)v5 setResponseMessageData:v6];

  uint64_t v7 = (void *)[(NSString *)self->_responseTypeName copyWithZone:a3];
  [(_INPBIntentResponsePayloadSuccess *)v5 setResponseTypeName:v7];

  if ([(_INPBIntentResponsePayloadSuccess *)self hasShouldOpenContainingApplication])
  {
    [(_INPBIntentResponsePayloadSuccess *)v5 setShouldOpenContainingApplication:[(_INPBIntentResponsePayloadSuccess *)self shouldOpenContainingApplication]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBIntentResponsePayloadSuccess *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBIntentResponsePayloadSuccess)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBIntentResponsePayloadSuccess *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBIntentResponsePayloadSuccess *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBIntentResponsePayloadSuccess *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBIntentResponsePayloadSuccess *)self responseMessageData];

  if (v4) {
    PBDataWriterWriteDataField();
  }
  uint64_t v5 = [(_INPBIntentResponsePayloadSuccess *)self responseTypeName];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBIntentResponsePayloadSuccess *)self hasShouldOpenContainingApplication])
  {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentResponsePayloadSuccessReadFrom(self, (uint64_t)a3);
}

- (void)setHasShouldOpenContainingApplication:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasShouldOpenContainingApplication
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setShouldOpenContainingApplication:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int shouldOpenContainingApplication = a3;
}

- (BOOL)hasResponseTypeName
{
  return self->_responseTypeName != 0;
}

- (void)setResponseTypeName:(id)a3
{
  self->_responseTypeName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasResponseMessageData
{
  return self->_responseMessageData != 0;
}

- (void)setResponseMessageData:(id)a3
{
  self->_responseMessageData = (NSData *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface MTRPluginPBMVariableValueResponseMessage
+ (id)variableValueFromResponsePayloadData:(id)a3;
- (BOOL)checkinRequested;
- (BOOL)hasCheckinRequested;
- (BOOL)hasErrorValue;
- (BOOL)hasHeader;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)readFrom:(id)a3;
- (MTRPluginPBMError)errorValue;
- (MTRPluginPBMHeader)header;
- (MTRPluginPBMVariableValue)value;
- (MTRPluginPBMVariableValueResponseMessage)initWithError:(id)a3;
- (MTRPluginPBMVariableValueResponseMessage)initWithObjectValue:(id)a3;
- (NSError)error;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)object;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCheckinRequested:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setErrorValue:(id)a3;
- (void)setHasCheckinRequested:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setObject:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMVariableValueResponseMessage

- (MTRPluginPBMVariableValueResponseMessage)initWithError:(id)a3
{
  id v4 = a3;
  if (v4 && (self = [(MTRPluginPBMVariableValueResponseMessage *)self init]) != 0)
  {
    v5 = [[MTRPluginPBMError alloc] initWithError:v4];
    [(MTRPluginPBMVariableValueResponseMessage *)self setErrorValue:v5];

    self = self;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MTRPluginPBMVariableValueResponseMessage)initWithObjectValue:(id)a3
{
  id v4 = a3;
  if (v4 && (self = [(MTRPluginPBMVariableValueResponseMessage *)self init]) != 0)
  {
    v5 = [[MTRPluginPBMVariableValue alloc] initWithObjectValue:v4];
    [(MTRPluginPBMVariableValueResponseMessage *)self setValue:v5];

    self = self;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setError:(id)a3
{
  id v4 = a3;
  v5 = [[MTRPluginPBMError alloc] initWithError:v4];

  [(MTRPluginPBMVariableValueResponseMessage *)self setErrorValue:v5];
}

- (NSError)error
{
  v2 = [(MTRPluginPBMVariableValueResponseMessage *)self errorValue];
  v3 = [v2 error];

  return (NSError *)v3;
}

- (void)setObject:(id)a3
{
  id v4 = a3;
  v5 = [[MTRPluginPBMVariableValue alloc] initWithObjectValue:v4];

  [(MTRPluginPBMVariableValueResponseMessage *)self setValue:v5];
}

- (id)object
{
  v2 = [(MTRPluginPBMVariableValueResponseMessage *)self value];
  v3 = [v2 object];

  return v3;
}

+ (id)variableValueFromResponsePayloadData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (v3 && (isKindOfClass & 1) != 0)
  {
    id v6 = v3;
    v7 = [[MTRPluginPBMVariableValueResponseMessage alloc] initWithData:v6];

    if (v7)
    {
      v5 = [(MTRPluginPBMVariableValueResponseMessage *)v7 value];
    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (BOOL)isValid
{
  v2 = [(MTRPluginPBMVariableValueResponseMessage *)self header];
  char v3 = [v2 isValid];

  return v3;
}

- (BOOL)hasHeader
{
  return self->_header != 0;
}

- (BOOL)hasErrorValue
{
  return self->_errorValue != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setCheckinRequested:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_checkinRequested = a3;
}

- (void)setHasCheckinRequested:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCheckinRequested
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMVariableValueResponseMessage;
  id v4 = [(MTRPluginPBMVariableValueResponseMessage *)&v8 description];
  v5 = [(MTRPluginPBMVariableValueResponseMessage *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  header = self->_header;
  if (header)
  {
    v5 = [(MTRPluginPBMHeader *)header dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"header"];
  }
  errorValue = self->_errorValue;
  if (errorValue)
  {
    v7 = [(MTRPluginPBMError *)errorValue dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"errorValue"];
  }
  value = self->_value;
  if (value)
  {
    v9 = [(MTRPluginPBMVariableValue *)value dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"value"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = [NSNumber numberWithBool:self->_checkinRequested];
    [v3 setObject:v10 forKey:@"checkinRequested"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMVariableValueResponseMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_header)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_errorValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_header)
  {
    objc_msgSend(v4, "setHeader:");
    id v4 = v5;
  }
  if (self->_errorValue)
  {
    objc_msgSend(v5, "setErrorValue:");
    id v4 = v5;
  }
  if (self->_value)
  {
    objc_msgSend(v5, "setValue:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[32] = self->_checkinRequested;
    v4[36] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MTRPluginPBMHeader *)self->_header copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  id v8 = [(MTRPluginPBMError *)self->_errorValue copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  id v10 = [(MTRPluginPBMVariableValue *)self->_value copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 32) = self->_checkinRequested;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 2))
  {
    if (!-[MTRPluginPBMHeader isEqual:](header, "isEqual:")) {
      goto LABEL_10;
    }
  }
  errorValue = self->_errorValue;
  if ((unint64_t)errorValue | *((void *)v4 + 1))
  {
    if (!-[MTRPluginPBMError isEqual:](errorValue, "isEqual:")) {
      goto LABEL_10;
    }
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 3))
  {
    if (!-[MTRPluginPBMVariableValue isEqual:](value, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0)
    {
LABEL_10:
      BOOL v8 = 0;
      goto LABEL_11;
    }
    if (self->_checkinRequested)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_10;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_10;
    }
    BOOL v8 = 1;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MTRPluginPBMHeader *)self->_header hash];
  unint64_t v4 = [(MTRPluginPBMError *)self->_errorValue hash];
  unint64_t v5 = [(MTRPluginPBMVariableValue *)self->_value hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_checkinRequested;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  header = self->_header;
  uint64_t v6 = *((void *)v4 + 2);
  id v11 = v4;
  if (header)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MTRPluginPBMHeader mergeFrom:](header, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MTRPluginPBMVariableValueResponseMessage setHeader:](self, "setHeader:");
  }
  id v4 = v11;
LABEL_7:
  errorValue = self->_errorValue;
  uint64_t v8 = *((void *)v4 + 1);
  if (errorValue)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[MTRPluginPBMError mergeFrom:](errorValue, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[MTRPluginPBMVariableValueResponseMessage setErrorValue:](self, "setErrorValue:");
  }
  id v4 = v11;
LABEL_13:
  value = self->_value;
  uint64_t v10 = *((void *)v4 + 3);
  if (value)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[MTRPluginPBMVariableValue mergeFrom:](value, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[MTRPluginPBMVariableValueResponseMessage setValue:](self, "setValue:");
  }
  id v4 = v11;
LABEL_19:
  if (*((unsigned char *)v4 + 36))
  {
    self->_checkinRequested = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x270F9A758]();
}

- (MTRPluginPBMHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (MTRPluginPBMError)errorValue
{
  return self->_errorValue;
}

- (void)setErrorValue:(id)a3
{
}

- (MTRPluginPBMVariableValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (BOOL)checkinRequested
{
  return self->_checkinRequested;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_errorValue, 0);
}

@end
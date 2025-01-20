@interface MTRPluginPBMVariableValue
- (BOOL)_setObject:(id)a3;
- (BOOL)hasArrayValue;
- (BOOL)hasAttributePathValue;
- (BOOL)hasClusterPathValue;
- (BOOL)hasCommandPathValue;
- (BOOL)hasDataValue;
- (BOOL)hasDateValue;
- (BOOL)hasDictionaryValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasErrorValue;
- (BOOL)hasEventPathValue;
- (BOOL)hasIntegerValue;
- (BOOL)hasSetValue;
- (BOOL)hasStringValue;
- (BOOL)hasUnsignedIntegerValue;
- (BOOL)hasUrlValue;
- (BOOL)hasUuidValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTRPluginPBMAttributePath)attributePathValue;
- (MTRPluginPBMClusterPath)clusterPathValue;
- (MTRPluginPBMCommandPath)commandPathValue;
- (MTRPluginPBMDate)dateValue;
- (MTRPluginPBMError)errorValue;
- (MTRPluginPBMEventPath)eventPathValue;
- (MTRPluginPBMURL)urlValue;
- (MTRPluginPBMUUID)uuidValue;
- (MTRPluginPBMVariableValue)initWithObjectValue:(id)a3;
- (MTRPluginPBMVariableValueDictionary)dictionaryValue;
- (MTRPluginPBMVariableValueList)arrayValue;
- (MTRPluginPBMVariableValueList)setValue;
- (NSData)dataValue;
- (NSString)stringValue;
- (double)doubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)object;
- (int64_t)integerValue;
- (unint64_t)hash;
- (unint64_t)unsignedIntegerValue;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArrayValue:(id)a3;
- (void)setAttributePathValue:(id)a3;
- (void)setClusterPathValue:(id)a3;
- (void)setCommandPathValue:(id)a3;
- (void)setDataValue:(id)a3;
- (void)setDateValue:(id)a3;
- (void)setDictionaryValue:(id)a3;
- (void)setDoubleValue:(double)a3;
- (void)setErrorValue:(id)a3;
- (void)setEventPathValue:(id)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasIntegerValue:(BOOL)a3;
- (void)setHasUnsignedIntegerValue:(BOOL)a3;
- (void)setIntegerValue:(int64_t)a3;
- (void)setSetValue:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setUnsignedIntegerValue:(unint64_t)a3;
- (void)setUrlValue:(id)a3;
- (void)setUuidValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMVariableValue

- (MTRPluginPBMVariableValue)initWithObjectValue:(id)a3
{
  id v4 = a3;
  v5 = [(MTRPluginPBMVariableValue *)self init];
  v6 = v5;
  if (v5 && [(MTRPluginPBMVariableValue *)v5 _setObject:v4]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_setObject:(id)a3
{
  CFNumberRef v4 = (const __CFNumber *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFNumberType Type = CFNumberGetType(v4);
      if ((unint64_t)Type <= kCFNumberCGFloatType)
      {
        if (((1 << Type) & 0x13060) != 0)
        {
          [(__CFNumber *)v4 doubleValue];
          -[MTRPluginPBMVariableValue setDoubleValue:](self, "setDoubleValue:");
          goto LABEL_38;
        }
        if (Type == kCFNumberCFIndexType)
        {
          [(MTRPluginPBMVariableValue *)self setUnsignedIntegerValue:[(__CFNumber *)v4 unsignedLongLongValue]];
          goto LABEL_38;
        }
      }
      [(MTRPluginPBMVariableValue *)self setIntegerValue:[(__CFNumber *)v4 longLongValue]];
      goto LABEL_38;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(MTRPluginPBMVariableValue *)self setDataValue:v4];
      goto LABEL_38;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [[MTRPluginPBMDate alloc] initWithDate:v4];
      [(MTRPluginPBMVariableValue *)self setDateValue:v6];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = [[MTRPluginPBMUUID alloc] initWithUUID:v4];
        [(MTRPluginPBMVariableValue *)self setUuidValue:v6];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v6 = [[MTRPluginPBMURL alloc] initWithURL:v4];
          [(MTRPluginPBMVariableValue *)self setUrlValue:v6];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v6 = [[MTRPluginPBMError alloc] initWithError:v4];
            [(MTRPluginPBMVariableValue *)self setErrorValue:v6];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v6 = [[MTRPluginPBMAttributePath alloc] initWithAttributePath:v4];
              [(MTRPluginPBMVariableValue *)self setAttributePathValue:v6];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v6 = [[MTRPluginPBMCommandPath alloc] initWithCommandPath:v4];
                [(MTRPluginPBMVariableValue *)self setCommandPathValue:v6];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v6 = [[MTRPluginPBMEventPath alloc] initWithEventPath:v4];
                  [(MTRPluginPBMVariableValue *)self setEventPathValue:v6];
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v7 = [[MTRPluginPBMVariableValueList alloc] initWithSet:v4];
                      if (v7)
                      {
                        v6 = (MTRPluginPBMDate *)v7;
                        [(MTRPluginPBMVariableValue *)self setSetValue:v7];
                        goto LABEL_37;
                      }
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v8 = [[MTRPluginPBMVariableValueList alloc] initWithArray:v4];
                        if (v8)
                        {
                          v6 = (MTRPluginPBMDate *)v8;
                          [(MTRPluginPBMVariableValue *)self setArrayValue:v8];
                          goto LABEL_37;
                        }
                      }
                      else
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          v9 = [[MTRPluginPBMVariableValueDictionary alloc] initWithDictionary:v4];
                          if (v9)
                          {
                            v6 = (MTRPluginPBMDate *)v9;
                            [(MTRPluginPBMVariableValue *)self setDictionaryValue:v9];
                            goto LABEL_37;
                          }
                        }
                      }
                    }
                    BOOL v10 = 0;
                    goto LABEL_39;
                  }
                  v6 = [[MTRPluginPBMClusterPath alloc] initWithClusterPath:v4];
                  [(MTRPluginPBMVariableValue *)self setClusterPathValue:v6];
                }
              }
            }
          }
        }
      }
    }
LABEL_37:

    goto LABEL_38;
  }
  [(MTRPluginPBMVariableValue *)self setStringValue:v4];
LABEL_38:
  BOOL v10 = 1;
LABEL_39:

  return v10;
}

- (id)object
{
  if ([(MTRPluginPBMVariableValue *)self hasStringValue])
  {
    uint64_t v3 = [(MTRPluginPBMVariableValue *)self stringValue];
LABEL_11:
    v5 = (void *)v3;
    goto LABEL_12;
  }
  if ([(MTRPluginPBMVariableValue *)self hasIntegerValue])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithLongLong:", -[MTRPluginPBMVariableValue integerValue](self, "integerValue"));
    goto LABEL_11;
  }
  if ([(MTRPluginPBMVariableValue *)self hasUnsignedIntegerValue])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MTRPluginPBMVariableValue unsignedIntegerValue](self, "unsignedIntegerValue"));
    goto LABEL_11;
  }
  if ([(MTRPluginPBMVariableValue *)self hasDoubleValue])
  {
    CFNumberRef v4 = NSNumber;
    [(MTRPluginPBMVariableValue *)self doubleValue];
    uint64_t v3 = objc_msgSend(v4, "numberWithDouble:");
    goto LABEL_11;
  }
  if ([(MTRPluginPBMVariableValue *)self hasDataValue])
  {
    uint64_t v3 = [(MTRPluginPBMVariableValue *)self dataValue];
    goto LABEL_11;
  }
  if ([(MTRPluginPBMVariableValue *)self hasUuidValue])
  {
    v7 = [(MTRPluginPBMVariableValue *)self uuidValue];
    uint64_t v8 = [v7 uuid];
LABEL_37:
    v5 = (void *)v8;

    goto LABEL_12;
  }
  if ([(MTRPluginPBMVariableValue *)self hasUrlValue])
  {
    v7 = [(MTRPluginPBMVariableValue *)self urlValue];
    uint64_t v8 = [v7 url];
    goto LABEL_37;
  }
  if ([(MTRPluginPBMVariableValue *)self hasDateValue])
  {
    v7 = [(MTRPluginPBMVariableValue *)self dateValue];
    uint64_t v8 = [v7 date];
    goto LABEL_37;
  }
  if ([(MTRPluginPBMVariableValue *)self hasErrorValue])
  {
    v7 = [(MTRPluginPBMVariableValue *)self errorValue];
    uint64_t v8 = [v7 error];
    goto LABEL_37;
  }
  if ([(MTRPluginPBMVariableValue *)self hasClusterPathValue])
  {
    v7 = [(MTRPluginPBMVariableValue *)self clusterPathValue];
    uint64_t v8 = [v7 clusterPath];
    goto LABEL_37;
  }
  if ([(MTRPluginPBMVariableValue *)self hasAttributePathValue])
  {
    v7 = [(MTRPluginPBMVariableValue *)self attributePathValue];
    uint64_t v8 = [v7 attributePath];
    goto LABEL_37;
  }
  if ([(MTRPluginPBMVariableValue *)self hasCommandPathValue])
  {
    v7 = [(MTRPluginPBMVariableValue *)self commandPathValue];
    uint64_t v8 = [v7 commandPath];
    goto LABEL_37;
  }
  if ([(MTRPluginPBMVariableValue *)self hasEventPathValue])
  {
    v7 = [(MTRPluginPBMVariableValue *)self eventPathValue];
    uint64_t v8 = [v7 eventPath];
    goto LABEL_37;
  }
  if ([(MTRPluginPBMVariableValue *)self hasArrayValue])
  {
    v7 = [(MTRPluginPBMVariableValue *)self arrayValue];
    uint64_t v8 = [v7 array];
    goto LABEL_37;
  }
  if ([(MTRPluginPBMVariableValue *)self hasSetValue])
  {
    v7 = [(MTRPluginPBMVariableValue *)self setValue];
    uint64_t v8 = [v7 set];
    goto LABEL_37;
  }
  if ([(MTRPluginPBMVariableValue *)self hasDictionaryValue])
  {
    v7 = [(MTRPluginPBMVariableValue *)self dictionaryValue];
    uint64_t v8 = [v7 dictionary];
    goto LABEL_37;
  }
  v5 = 0;
LABEL_12:
  return v5;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (void)setIntegerValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_integerValue = a3;
}

- (void)setHasIntegerValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIntegerValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUnsignedIntegerValue:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsignedIntegerValue = a3;
}

- (void)setHasUnsignedIntegerValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUnsignedIntegerValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDoubleValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDoubleValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDataValue
{
  return self->_dataValue != 0;
}

- (BOOL)hasUuidValue
{
  return self->_uuidValue != 0;
}

- (BOOL)hasDateValue
{
  return self->_dateValue != 0;
}

- (BOOL)hasUrlValue
{
  return self->_urlValue != 0;
}

- (BOOL)hasArrayValue
{
  return self->_arrayValue != 0;
}

- (BOOL)hasSetValue
{
  return self->_setValue != 0;
}

- (BOOL)hasDictionaryValue
{
  return self->_dictionaryValue != 0;
}

- (BOOL)hasErrorValue
{
  return self->_errorValue != 0;
}

- (BOOL)hasClusterPathValue
{
  return self->_clusterPathValue != 0;
}

- (BOOL)hasAttributePathValue
{
  return self->_attributePathValue != 0;
}

- (BOOL)hasCommandPathValue
{
  return self->_commandPathValue != 0;
}

- (BOOL)hasEventPathValue
{
  return self->_eventPathValue != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMVariableValue;
  CFNumberRef v4 = [(MTRPluginPBMVariableValue *)&v8 description];
  v5 = [(MTRPluginPBMVariableValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  CFNumberRef v4 = v3;
  stringValue = self->_stringValue;
  if (stringValue) {
    [v3 setObject:stringValue forKey:@"stringValue"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v32 = [NSNumber numberWithLongLong:self->_integerValue];
    [v4 setObject:v32 forKey:@"integerValue"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  v33 = [NSNumber numberWithUnsignedLongLong:self->_unsignedIntegerValue];
  [v4 setObject:v33 forKey:@"unsignedIntegerValue"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    v7 = [NSNumber numberWithDouble:self->_doubleValue];
    [v4 setObject:v7 forKey:@"doubleValue"];
  }
LABEL_7:
  dataValue = self->_dataValue;
  if (dataValue) {
    [v4 setObject:dataValue forKey:@"dataValue"];
  }
  uuidValue = self->_uuidValue;
  if (uuidValue)
  {
    BOOL v10 = [(MTRPluginPBMUUID *)uuidValue dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"uuidValue"];
  }
  dateValue = self->_dateValue;
  if (dateValue)
  {
    v12 = [(MTRPluginPBMDate *)dateValue dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"dateValue"];
  }
  urlValue = self->_urlValue;
  if (urlValue)
  {
    v14 = [(MTRPluginPBMURL *)urlValue dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"urlValue"];
  }
  arrayValue = self->_arrayValue;
  if (arrayValue)
  {
    v16 = [(MTRPluginPBMVariableValueList *)arrayValue dictionaryRepresentation];
    [v4 setObject:v16 forKey:@"arrayValue"];
  }
  setValue = self->_setValue;
  if (setValue)
  {
    v18 = [(MTRPluginPBMVariableValueList *)setValue dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"setValue"];
  }
  dictionaryValue = self->_dictionaryValue;
  if (dictionaryValue)
  {
    v20 = [(MTRPluginPBMVariableValueDictionary *)dictionaryValue dictionaryRepresentation];
    [v4 setObject:v20 forKey:@"dictionaryValue"];
  }
  errorValue = self->_errorValue;
  if (errorValue)
  {
    v22 = [(MTRPluginPBMError *)errorValue dictionaryRepresentation];
    [v4 setObject:v22 forKey:@"errorValue"];
  }
  clusterPathValue = self->_clusterPathValue;
  if (clusterPathValue)
  {
    v24 = [(MTRPluginPBMClusterPath *)clusterPathValue dictionaryRepresentation];
    [v4 setObject:v24 forKey:@"clusterPathValue"];
  }
  attributePathValue = self->_attributePathValue;
  if (attributePathValue)
  {
    v26 = [(MTRPluginPBMAttributePath *)attributePathValue dictionaryRepresentation];
    [v4 setObject:v26 forKey:@"attributePathValue"];
  }
  commandPathValue = self->_commandPathValue;
  if (commandPathValue)
  {
    v28 = [(MTRPluginPBMCommandPath *)commandPathValue dictionaryRepresentation];
    [v4 setObject:v28 forKey:@"commandPathValue"];
  }
  eventPathValue = self->_eventPathValue;
  if (eventPathValue)
  {
    v30 = [(MTRPluginPBMEventPath *)eventPathValue dictionaryRepresentation];
    [v4 setObject:v30 forKey:@"eventPathValue"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMVariableValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_7:
  if (self->_dataValue)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_uuidValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_dateValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_urlValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_arrayValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_setValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_dictionaryValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_errorValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_clusterPathValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_attributePathValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_commandPathValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_eventPathValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_stringValue)
  {
    objc_msgSend(v4, "setStringValue:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_integerValue;
    *((unsigned char *)v4 + 136) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 3) = self->_unsignedIntegerValue;
  *((unsigned char *)v4 + 136) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    *((void *)v4 + 1) = *(void *)&self->_doubleValue;
    *((unsigned char *)v4 + 136) |= 1u;
  }
LABEL_7:
  if (self->_dataValue)
  {
    objc_msgSend(v6, "setDataValue:");
    id v4 = v6;
  }
  if (self->_uuidValue)
  {
    objc_msgSend(v6, "setUuidValue:");
    id v4 = v6;
  }
  if (self->_dateValue)
  {
    objc_msgSend(v6, "setDateValue:");
    id v4 = v6;
  }
  if (self->_urlValue)
  {
    objc_msgSend(v6, "setUrlValue:");
    id v4 = v6;
  }
  if (self->_arrayValue)
  {
    objc_msgSend(v6, "setArrayValue:");
    id v4 = v6;
  }
  if (self->_setValue)
  {
    objc_msgSend(v6, "setSetValue:");
    id v4 = v6;
  }
  if (self->_dictionaryValue)
  {
    objc_msgSend(v6, "setDictionaryValue:");
    id v4 = v6;
  }
  if (self->_errorValue)
  {
    objc_msgSend(v6, "setErrorValue:");
    id v4 = v6;
  }
  if (self->_clusterPathValue)
  {
    objc_msgSend(v6, "setClusterPathValue:");
    id v4 = v6;
  }
  if (self->_attributePathValue)
  {
    objc_msgSend(v6, "setAttributePathValue:");
    id v4 = v6;
  }
  if (self->_commandPathValue)
  {
    objc_msgSend(v6, "setCommandPathValue:");
    id v4 = v6;
  }
  if (self->_eventPathValue)
  {
    objc_msgSend(v6, "setEventPathValue:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_stringValue copyWithZone:a3];
  v7 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v6;

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v5 + 24) = self->_unsignedIntegerValue;
    *(unsigned char *)(v5 + 136) |= 4u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 16) = self->_integerValue;
  *(unsigned char *)(v5 + 136) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_doubleValue;
    *(unsigned char *)(v5 + 136) |= 1u;
  }
LABEL_5:
  uint64_t v9 = [(NSData *)self->_dataValue copyWithZone:a3];
  BOOL v10 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v9;

  id v11 = [(MTRPluginPBMUUID *)self->_uuidValue copyWithZone:a3];
  v12 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v11;

  id v13 = [(MTRPluginPBMDate *)self->_dateValue copyWithZone:a3];
  v14 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v13;

  id v15 = [(MTRPluginPBMURL *)self->_urlValue copyWithZone:a3];
  v16 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v15;

  id v17 = [(MTRPluginPBMVariableValueList *)self->_arrayValue copyWithZone:a3];
  v18 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v17;

  id v19 = [(MTRPluginPBMVariableValueList *)self->_setValue copyWithZone:a3];
  v20 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v19;

  id v21 = [(MTRPluginPBMVariableValueDictionary *)self->_dictionaryValue copyWithZone:a3];
  v22 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v21;

  id v23 = [(MTRPluginPBMError *)self->_errorValue copyWithZone:a3];
  v24 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v23;

  id v25 = [(MTRPluginPBMClusterPath *)self->_clusterPathValue copyWithZone:a3];
  v26 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v25;

  id v27 = [(MTRPluginPBMAttributePath *)self->_attributePathValue copyWithZone:a3];
  v28 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v27;

  id v29 = [(MTRPluginPBMCommandPath *)self->_commandPathValue copyWithZone:a3];
  v30 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v29;

  id v31 = [(MTRPluginPBMEventPath *)self->_eventPathValue copyWithZone:a3];
  v32 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v31;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:")) {
      goto LABEL_43;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 136) & 2) == 0 || self->_integerValue != *((void *)v4 + 2)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 136) & 2) != 0)
  {
LABEL_43:
    char v18 = 0;
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 136) & 4) == 0 || self->_unsignedIntegerValue != *((void *)v4 + 3)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 136) & 4) != 0)
  {
    goto LABEL_43;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 136) & 1) == 0 || self->_doubleValue != *((double *)v4 + 1)) {
      goto LABEL_43;
    }
  }
  else if (*((unsigned char *)v4 + 136))
  {
    goto LABEL_43;
  }
  dataValue = self->_dataValue;
  if ((unint64_t)dataValue | *((void *)v4 + 8) && !-[NSData isEqual:](dataValue, "isEqual:")) {
    goto LABEL_43;
  }
  uuidValue = self->_uuidValue;
  if ((unint64_t)uuidValue | *((void *)v4 + 16))
  {
    if (!-[MTRPluginPBMUUID isEqual:](uuidValue, "isEqual:")) {
      goto LABEL_43;
    }
  }
  dateValue = self->_dateValue;
  if ((unint64_t)dateValue | *((void *)v4 + 9))
  {
    if (!-[MTRPluginPBMDate isEqual:](dateValue, "isEqual:")) {
      goto LABEL_43;
    }
  }
  urlValue = self->_urlValue;
  if ((unint64_t)urlValue | *((void *)v4 + 15))
  {
    if (!-[MTRPluginPBMURL isEqual:](urlValue, "isEqual:")) {
      goto LABEL_43;
    }
  }
  arrayValue = self->_arrayValue;
  if ((unint64_t)arrayValue | *((void *)v4 + 4))
  {
    if (!-[MTRPluginPBMVariableValueList isEqual:](arrayValue, "isEqual:")) {
      goto LABEL_43;
    }
  }
  setValue = self->_setValue;
  if ((unint64_t)setValue | *((void *)v4 + 13))
  {
    if (!-[MTRPluginPBMVariableValueList isEqual:](setValue, "isEqual:")) {
      goto LABEL_43;
    }
  }
  dictionaryValue = self->_dictionaryValue;
  if ((unint64_t)dictionaryValue | *((void *)v4 + 10))
  {
    if (!-[MTRPluginPBMVariableValueDictionary isEqual:](dictionaryValue, "isEqual:")) {
      goto LABEL_43;
    }
  }
  errorValue = self->_errorValue;
  if ((unint64_t)errorValue | *((void *)v4 + 11))
  {
    if (!-[MTRPluginPBMError isEqual:](errorValue, "isEqual:")) {
      goto LABEL_43;
    }
  }
  clusterPathValue = self->_clusterPathValue;
  if ((unint64_t)clusterPathValue | *((void *)v4 + 6))
  {
    if (!-[MTRPluginPBMClusterPath isEqual:](clusterPathValue, "isEqual:")) {
      goto LABEL_43;
    }
  }
  attributePathValue = self->_attributePathValue;
  if ((unint64_t)attributePathValue | *((void *)v4 + 5))
  {
    if (!-[MTRPluginPBMAttributePath isEqual:](attributePathValue, "isEqual:")) {
      goto LABEL_43;
    }
  }
  commandPathValue = self->_commandPathValue;
  if ((unint64_t)commandPathValue | *((void *)v4 + 7))
  {
    if (!-[MTRPluginPBMCommandPath isEqual:](commandPathValue, "isEqual:")) {
      goto LABEL_43;
    }
  }
  eventPathValue = self->_eventPathValue;
  if ((unint64_t)eventPathValue | *((void *)v4 + 12)) {
    char v18 = -[MTRPluginPBMEventPath isEqual:](eventPathValue, "isEqual:");
  }
  else {
    char v18 = 1;
  }
LABEL_44:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_stringValue hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_12:
    unint64_t v5 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_13:
    unint64_t v13 = 0;
    goto LABEL_14;
  }
  uint64_t v4 = 2654435761 * self->_integerValue;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_3:
  unint64_t v5 = 2654435761u * self->_unsignedIntegerValue;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_13;
  }
LABEL_4:
  double doubleValue = self->_doubleValue;
  double v7 = -doubleValue;
  if (doubleValue >= 0.0) {
    double v7 = self->_doubleValue;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  double v10 = fmod(v8, 1.84467441e19);
  unint64_t v11 = 2654435761u * (unint64_t)v10;
  unint64_t v12 = v11 + (unint64_t)v9;
  if (v9 <= 0.0) {
    unint64_t v12 = 2654435761u * (unint64_t)v10;
  }
  unint64_t v13 = v11 - (unint64_t)fabs(v9);
  if (v9 >= 0.0) {
    unint64_t v13 = v12;
  }
LABEL_14:
  uint64_t v14 = v4 ^ v3 ^ v5 ^ v13 ^ [(NSData *)self->_dataValue hash];
  unint64_t v15 = [(MTRPluginPBMUUID *)self->_uuidValue hash];
  unint64_t v16 = v15 ^ [(MTRPluginPBMDate *)self->_dateValue hash];
  unint64_t v17 = v14 ^ v16 ^ [(MTRPluginPBMURL *)self->_urlValue hash];
  unint64_t v18 = [(MTRPluginPBMVariableValueList *)self->_arrayValue hash];
  unint64_t v19 = v18 ^ [(MTRPluginPBMVariableValueList *)self->_setValue hash];
  unint64_t v20 = v19 ^ [(MTRPluginPBMVariableValueDictionary *)self->_dictionaryValue hash];
  unint64_t v21 = v17 ^ v20 ^ [(MTRPluginPBMError *)self->_errorValue hash];
  unint64_t v22 = [(MTRPluginPBMClusterPath *)self->_clusterPathValue hash];
  unint64_t v23 = v22 ^ [(MTRPluginPBMAttributePath *)self->_attributePathValue hash];
  unint64_t v24 = v23 ^ [(MTRPluginPBMCommandPath *)self->_commandPathValue hash];
  return v21 ^ v24 ^ [(MTRPluginPBMEventPath *)self->_eventPathValue hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v28 = v4;
  if (*((void *)v4 + 14))
  {
    -[MTRPluginPBMVariableValue setStringValue:](self, "setStringValue:");
    id v4 = v28;
  }
  char v5 = *((unsigned char *)v4 + 136);
  if ((v5 & 2) != 0)
  {
    self->_integerValue = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 136);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 136) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_unsignedIntegerValue = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 136))
  {
LABEL_6:
    self->_double doubleValue = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_7:
  if (*((void *)v4 + 8))
  {
    -[MTRPluginPBMVariableValue setDataValue:](self, "setDataValue:");
    id v4 = v28;
  }
  uuidValue = self->_uuidValue;
  uint64_t v7 = *((void *)v4 + 16);
  if (uuidValue)
  {
    if (!v7) {
      goto LABEL_18;
    }
    -[MTRPluginPBMUUID mergeFrom:](uuidValue, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_18;
    }
    -[MTRPluginPBMVariableValue setUuidValue:](self, "setUuidValue:");
  }
  id v4 = v28;
LABEL_18:
  dateValue = self->_dateValue;
  uint64_t v9 = *((void *)v4 + 9);
  if (dateValue)
  {
    if (!v9) {
      goto LABEL_24;
    }
    -[MTRPluginPBMDate mergeFrom:](dateValue, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_24;
    }
    -[MTRPluginPBMVariableValue setDateValue:](self, "setDateValue:");
  }
  id v4 = v28;
LABEL_24:
  urlValue = self->_urlValue;
  uint64_t v11 = *((void *)v4 + 15);
  if (urlValue)
  {
    if (!v11) {
      goto LABEL_30;
    }
    -[MTRPluginPBMURL mergeFrom:](urlValue, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_30;
    }
    -[MTRPluginPBMVariableValue setUrlValue:](self, "setUrlValue:");
  }
  id v4 = v28;
LABEL_30:
  arrayValue = self->_arrayValue;
  uint64_t v13 = *((void *)v4 + 4);
  if (arrayValue)
  {
    if (!v13) {
      goto LABEL_36;
    }
    -[MTRPluginPBMVariableValueList mergeFrom:](arrayValue, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_36;
    }
    -[MTRPluginPBMVariableValue setArrayValue:](self, "setArrayValue:");
  }
  id v4 = v28;
LABEL_36:
  setValue = self->_setValue;
  uint64_t v15 = *((void *)v4 + 13);
  if (setValue)
  {
    if (!v15) {
      goto LABEL_42;
    }
    -[MTRPluginPBMVariableValueList mergeFrom:](setValue, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_42;
    }
    -[MTRPluginPBMVariableValue setSetValue:](self, "setSetValue:");
  }
  id v4 = v28;
LABEL_42:
  dictionaryValue = self->_dictionaryValue;
  uint64_t v17 = *((void *)v4 + 10);
  if (dictionaryValue)
  {
    if (!v17) {
      goto LABEL_48;
    }
    -[MTRPluginPBMVariableValueDictionary mergeFrom:](dictionaryValue, "mergeFrom:");
  }
  else
  {
    if (!v17) {
      goto LABEL_48;
    }
    -[MTRPluginPBMVariableValue setDictionaryValue:](self, "setDictionaryValue:");
  }
  id v4 = v28;
LABEL_48:
  errorValue = self->_errorValue;
  uint64_t v19 = *((void *)v4 + 11);
  if (errorValue)
  {
    if (!v19) {
      goto LABEL_54;
    }
    -[MTRPluginPBMError mergeFrom:](errorValue, "mergeFrom:");
  }
  else
  {
    if (!v19) {
      goto LABEL_54;
    }
    -[MTRPluginPBMVariableValue setErrorValue:](self, "setErrorValue:");
  }
  id v4 = v28;
LABEL_54:
  clusterPathValue = self->_clusterPathValue;
  uint64_t v21 = *((void *)v4 + 6);
  if (clusterPathValue)
  {
    if (!v21) {
      goto LABEL_60;
    }
    -[MTRPluginPBMClusterPath mergeFrom:](clusterPathValue, "mergeFrom:");
  }
  else
  {
    if (!v21) {
      goto LABEL_60;
    }
    -[MTRPluginPBMVariableValue setClusterPathValue:](self, "setClusterPathValue:");
  }
  id v4 = v28;
LABEL_60:
  attributePathValue = self->_attributePathValue;
  uint64_t v23 = *((void *)v4 + 5);
  if (attributePathValue)
  {
    if (!v23) {
      goto LABEL_66;
    }
    -[MTRPluginPBMAttributePath mergeFrom:](attributePathValue, "mergeFrom:");
  }
  else
  {
    if (!v23) {
      goto LABEL_66;
    }
    -[MTRPluginPBMVariableValue setAttributePathValue:](self, "setAttributePathValue:");
  }
  id v4 = v28;
LABEL_66:
  commandPathValue = self->_commandPathValue;
  uint64_t v25 = *((void *)v4 + 7);
  if (commandPathValue)
  {
    if (!v25) {
      goto LABEL_72;
    }
    -[MTRPluginPBMCommandPath mergeFrom:](commandPathValue, "mergeFrom:");
  }
  else
  {
    if (!v25) {
      goto LABEL_72;
    }
    -[MTRPluginPBMVariableValue setCommandPathValue:](self, "setCommandPathValue:");
  }
  id v4 = v28;
LABEL_72:
  eventPathValue = self->_eventPathValue;
  uint64_t v27 = *((void *)v4 + 12);
  if (eventPathValue)
  {
    if (v27) {
      -[MTRPluginPBMEventPath mergeFrom:](eventPathValue, "mergeFrom:");
    }
  }
  else if (v27)
  {
    -[MTRPluginPBMVariableValue setEventPathValue:](self, "setEventPathValue:");
  }
  MEMORY[0x270F9A758]();
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (unint64_t)unsignedIntegerValue
{
  return self->_unsignedIntegerValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
}

- (MTRPluginPBMUUID)uuidValue
{
  return self->_uuidValue;
}

- (void)setUuidValue:(id)a3
{
}

- (MTRPluginPBMDate)dateValue
{
  return self->_dateValue;
}

- (void)setDateValue:(id)a3
{
}

- (MTRPluginPBMURL)urlValue
{
  return self->_urlValue;
}

- (void)setUrlValue:(id)a3
{
}

- (MTRPluginPBMVariableValueList)arrayValue
{
  return self->_arrayValue;
}

- (void)setArrayValue:(id)a3
{
}

- (MTRPluginPBMVariableValueList)setValue
{
  return self->_setValue;
}

- (void)setSetValue:(id)a3
{
}

- (MTRPluginPBMVariableValueDictionary)dictionaryValue
{
  return self->_dictionaryValue;
}

- (void)setDictionaryValue:(id)a3
{
}

- (MTRPluginPBMError)errorValue
{
  return self->_errorValue;
}

- (void)setErrorValue:(id)a3
{
}

- (MTRPluginPBMClusterPath)clusterPathValue
{
  return self->_clusterPathValue;
}

- (void)setClusterPathValue:(id)a3
{
}

- (MTRPluginPBMAttributePath)attributePathValue
{
  return self->_attributePathValue;
}

- (void)setAttributePathValue:(id)a3
{
}

- (MTRPluginPBMCommandPath)commandPathValue
{
  return self->_commandPathValue;
}

- (void)setCommandPathValue:(id)a3
{
}

- (MTRPluginPBMEventPath)eventPathValue
{
  return self->_eventPathValue;
}

- (void)setEventPathValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidValue, 0);
  objc_storeStrong((id *)&self->_urlValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_setValue, 0);
  objc_storeStrong((id *)&self->_eventPathValue, 0);
  objc_storeStrong((id *)&self->_errorValue, 0);
  objc_storeStrong((id *)&self->_dictionaryValue, 0);
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_commandPathValue, 0);
  objc_storeStrong((id *)&self->_clusterPathValue, 0);
  objc_storeStrong((id *)&self->_attributePathValue, 0);
  objc_storeStrong((id *)&self->_arrayValue, 0);
}

@end
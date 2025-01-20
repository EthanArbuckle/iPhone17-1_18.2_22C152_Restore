@interface SECSFAMatchProperty
- (BOOL)hasPropertyName;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)propertyName;
- (SECSFAPropertyValue)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPropertyName:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFAMatchProperty

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_propertyName, 0);
}

- (void)setValue:(id)a3
{
}

- (SECSFAPropertyValue)value
{
  return self->_value;
}

- (void)setPropertyName:(id)a3
{
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v7 = v4;
  if (v4[1])
  {
    -[SECSFAMatchProperty setPropertyName:](self, "setPropertyName:");
    v4 = v7;
  }
  value = self->_value;
  uint64_t v6 = v4[2];
  if (value)
  {
    if (v6) {
      -[SECSFAPropertyValue mergeFrom:](value, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SECSFAMatchProperty setValue:](self, "setValue:");
  }

  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_propertyName hash];
  return [(SECSFAPropertyValue *)self->_value hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((propertyName = self->_propertyName, !((unint64_t)propertyName | v4[1]))
     || -[NSString isEqual:](propertyName, "isEqual:")))
  {
    value = self->_value;
    if ((unint64_t)value | v4[2]) {
      char v7 = -[SECSFAPropertyValue isEqual:](value, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_propertyName copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(SECSFAPropertyValue *)self->_value copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_propertyName)
  {
    objc_msgSend(v4, "setPropertyName:");
    id v4 = v5;
  }
  if (self->_value)
  {
    objc_msgSend(v5, "setValue:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_propertyName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v8 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*((unsigned char *)a3 + *v6)) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        if (v10++ >= 9)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
      if ((v11 >> 3) == 2) {
        break;
      }
      if ((v11 >> 3) == 1)
      {
        PBReaderReadString();
        v18 = (NSString *)objc_claimAutoreleasedReturnValue();
        propertyName = (SECSFAPropertyValue *)self->_propertyName;
        self->_propertyName = v18;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
    }
    propertyName = objc_alloc_init(SECSFAPropertyValue);
    objc_storeStrong((id *)&self->_value, propertyName);
    if (!PBReaderPlaceMark()
      || (SECSFAPropertyValueReadFrom((uint64_t)propertyName, (uint64_t)a3) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *((unsigned char *)a3 + *v6) == 0;
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  propertyName = self->_propertyName;
  if (propertyName) {
    [v3 setObject:propertyName forKey:@"propertyName"];
  }
  value = self->_value;
  if (value)
  {
    char v7 = [(SECSFAPropertyValue *)value dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"value"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SECSFAMatchProperty;
  id v4 = [(SECSFAMatchProperty *)&v8 description];
  id v5 = [(SECSFAMatchProperty *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)hasPropertyName
{
  return self->_propertyName != 0;
}

@end
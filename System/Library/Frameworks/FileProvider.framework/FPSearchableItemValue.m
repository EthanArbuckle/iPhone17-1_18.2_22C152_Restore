@interface FPSearchableItemValue
+ (Class)arrayOfStringsValueType;
+ (id)objectFromString:(id)a3;
+ (id)stringArrayFromObject:(id)a3;
+ (id)stringFromObject:(id)a3;
- (BOOL)hasDoubleValue;
- (BOOL)hasIntegerValue;
- (BOOL)hasNameComponents;
- (BOOL)hasStringValue;
- (BOOL)hasTimeIntervalSinceReferenceDateValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)nameComponents;
- (NSMutableArray)arrayOfStringsValues;
- (NSString)stringValue;
- (double)doubleValue;
- (double)timeIntervalSinceReferenceDateValue;
- (id)arrayOfStringsValueAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)integerValue;
- (unint64_t)arrayOfStringsValuesCount;
- (unint64_t)hash;
- (void)addArrayOfStringsValue:(id)a3;
- (void)clearArrayOfStringsValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArrayOfStringsValues:(id)a3;
- (void)setDoubleValue:(double)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasIntegerValue:(BOOL)a3;
- (void)setHasTimeIntervalSinceReferenceDateValue:(BOOL)a3;
- (void)setIntegerValue:(int64_t)a3;
- (void)setNameComponents:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setTimeIntervalSinceReferenceDateValue:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation FPSearchableItemValue

- (BOOL)readFrom:(id)a3
{
  return FPSearchableItemValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);

  objc_storeStrong((id *)&self->_arrayOfStringsValues, 0);
}

+ (id)objectFromString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithBase64EncodedString:v4 options:0];

  v6 = [[FPSearchableItemValue alloc] initWithData:v5];
  if ([(FPSearchableItemValue *)v6 hasDoubleValue])
  {
    v7 = NSNumber;
    [(FPSearchableItemValue *)v6 doubleValue];
    uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
LABEL_13:
    v13 = (void *)v8;
    goto LABEL_14;
  }
  if ([(FPSearchableItemValue *)v6 hasStringValue])
  {
    uint64_t v8 = [(FPSearchableItemValue *)v6 stringValue];
    goto LABEL_13;
  }
  if ([(FPSearchableItemValue *)v6 hasIntegerValue])
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[FPSearchableItemValue integerValue](v6, "integerValue"));
    goto LABEL_13;
  }
  if ([(FPSearchableItemValue *)v6 hasTimeIntervalSinceReferenceDateValue])
  {
    v9 = (void *)MEMORY[0x1E4F1C9C8];
    [(FPSearchableItemValue *)v6 timeIntervalSinceReferenceDateValue];
    uint64_t v8 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
    goto LABEL_13;
  }
  if ([(FPSearchableItemValue *)v6 hasNameComponents])
  {
    v10 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v11 = objc_opt_class();
    v12 = [(FPSearchableItemValue *)v6 nameComponents];
    v13 = [v10 unarchivedObjectOfClass:v11 fromData:v12 error:0];

    goto LABEL_14;
  }
  if ([(FPSearchableItemValue *)v6 arrayOfStringsValuesCount])
  {
    uint64_t v8 = [(FPSearchableItemValue *)v6 arrayOfStringsValues];
    goto LABEL_13;
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasDoubleValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (BOOL)hasIntegerValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

+ (id)stringFromObject:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(FPSearchableItemValue);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__FPSearchableItemValue_Helpers__stringFromObject___block_invoke;
  v15[3] = &unk_1E5AF3B10;
  v5 = v4;
  v16 = v5;
  v6 = (void (**)(void))MEMORY[0x1A6248B00](v15);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v3;
    uint64_t v8 = (const char *)[v7 objCType];
    if (!strcmp(v8, "f") || !strcmp(v8, "d"))
    {
      [v7 doubleValue];
      -[FPSearchableItemValue setDoubleValue:](v5, "setDoubleValue:");
    }
    else
    {
      -[FPSearchableItemValue setIntegerValue:](v5, "setIntegerValue:", [v7 longLongValue]);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(FPSearchableItemValue *)v5 setStringValue:v3];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v3 timeIntervalSinceReferenceDate];
        -[FPSearchableItemValue setTimeIntervalSinceReferenceDateValue:](v5, "setTimeIntervalSinceReferenceDateValue:");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (+[FPSearchableItemValue stringArrayFromObject:v3], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v13 = (void *)v12;
            v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v12];
            [(FPSearchableItemValue *)v5 setArrayOfStringsValues:v14];
            v10 = v6[2](v6);
          }
          else
          {
            v10 = 0;
          }
          goto LABEL_13;
        }
        v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:0];
        [(FPSearchableItemValue *)v5 setNameComponents:v9];
      }
    }
  }
  v10 = v6[2](v6);
LABEL_13:

  return v10;
}

id __51__FPSearchableItemValue_Helpers__stringFromObject___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) data];
  v2 = [v1 base64EncodedStringWithOptions:0];

  return v2;
}

+ (id)stringArrayFromObject:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v10 = fp_current_or_default_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            +[FPSearchableItemValue(Helpers) stringArrayFromObject:](v8, v10);
          }

          id v9 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v9 = v3;
LABEL_13:

  return v9;
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

- (void)setTimeIntervalSinceReferenceDateValue:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timeIntervalSinceReferenceDateValue = a3;
}

- (void)setHasTimeIntervalSinceReferenceDateValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimeIntervalSinceReferenceDateValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasNameComponents
{
  return self->_nameComponents != 0;
}

- (void)clearArrayOfStringsValues
{
}

- (void)addArrayOfStringsValue:(id)a3
{
  id v4 = a3;
  arrayOfStringsValues = self->_arrayOfStringsValues;
  id v8 = v4;
  if (!arrayOfStringsValues)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = self->_arrayOfStringsValues;
    self->_arrayOfStringsValues = v6;

    id v4 = v8;
    arrayOfStringsValues = self->_arrayOfStringsValues;
  }
  [(NSMutableArray *)arrayOfStringsValues addObject:v4];
}

- (unint64_t)arrayOfStringsValuesCount
{
  return [(NSMutableArray *)self->_arrayOfStringsValues count];
}

- (id)arrayOfStringsValueAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_arrayOfStringsValues objectAtIndex:a3];
}

+ (Class)arrayOfStringsValueType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FPSearchableItemValue;
  id v4 = [(FPSearchableItemValue *)&v8 description];
  uint64_t v5 = [(FPSearchableItemValue *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  stringValue = self->_stringValue;
  if (stringValue) {
    [v3 setObject:stringValue forKey:@"stringValue"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v11 = [NSNumber numberWithDouble:self->_doubleValue];
    [v4 setObject:v11 forKey:@"doubleValue"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  long long v12 = [NSNumber numberWithLongLong:self->_integerValue];
  [v4 setObject:v12 forKey:@"integerValue"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    id v7 = [NSNumber numberWithDouble:self->_timeIntervalSinceReferenceDateValue];
    [v4 setObject:v7 forKey:@"timeIntervalSinceReferenceDateValue"];
  }
LABEL_7:
  nameComponents = self->_nameComponents;
  if (nameComponents) {
    [v4 setObject:nameComponents forKey:@"nameComponents"];
  }
  arrayOfStringsValues = self->_arrayOfStringsValues;
  if (arrayOfStringsValues) {
    [v4 setObject:arrayOfStringsValues forKey:@"arrayOfStringsValue"];
  }

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_stringValue) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_6:
  }
    PBDataWriterWriteDoubleField();
LABEL_7:
  if (self->_nameComponents) {
    PBDataWriterWriteDataField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = self->_arrayOfStringsValues;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_stringValue)
  {
    objc_msgSend(v4, "setStringValue:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_doubleValue;
    *((unsigned char *)v4 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 2) = self->_integerValue;
  *((unsigned char *)v4 + 56) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    *((void *)v4 + 3) = *(void *)&self->_timeIntervalSinceReferenceDateValue;
    *((unsigned char *)v4 + 56) |= 4u;
  }
LABEL_7:
  if (self->_nameComponents) {
    objc_msgSend(v10, "setNameComponents:");
  }
  if ([(FPSearchableItemValue *)self arrayOfStringsValuesCount])
  {
    [v10 clearArrayOfStringsValues];
    unint64_t v6 = [(FPSearchableItemValue *)self arrayOfStringsValuesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(FPSearchableItemValue *)self arrayOfStringsValueAtIndex:i];
        [v10 addArrayOfStringsValue:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_stringValue copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_doubleValue;
    *(unsigned char *)(v5 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 16) = self->_integerValue;
  *(unsigned char *)(v5 + 56) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(double *)(v5 + 24) = self->_timeIntervalSinceReferenceDateValue;
    *(unsigned char *)(v5 + 56) |= 4u;
  }
LABEL_5:
  uint64_t v9 = [(NSData *)self->_nameComponents copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v11 = self->_arrayOfStringsValues;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addArrayOfStringsValue:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_doubleValue != *((double *)v4 + 1)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_23:
    char v8 = 0;
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_integerValue != *((void *)v4 + 2)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_timeIntervalSinceReferenceDateValue != *((double *)v4 + 3)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_23;
  }
  nameComponents = self->_nameComponents;
  if ((unint64_t)nameComponents | *((void *)v4 + 5)
    && !-[NSData isEqual:](nameComponents, "isEqual:"))
  {
    goto LABEL_23;
  }
  arrayOfStringsValues = self->_arrayOfStringsValues;
  if ((unint64_t)arrayOfStringsValues | *((void *)v4 + 4)) {
    char v8 = -[NSMutableArray isEqual:](arrayOfStringsValues, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_24:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_stringValue hash];
  char has = (char)self->_has;
  if (has)
  {
    double doubleValue = self->_doubleValue;
    double v7 = -doubleValue;
    if (doubleValue >= 0.0) {
      double v7 = self->_doubleValue;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 2) != 0)
  {
    uint64_t v10 = 2654435761 * self->_integerValue;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v15 = 0;
    goto LABEL_19;
  }
  uint64_t v10 = 0;
  if ((has & 4) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double timeIntervalSinceReferenceDateValue = self->_timeIntervalSinceReferenceDateValue;
  double v12 = -timeIntervalSinceReferenceDateValue;
  if (timeIntervalSinceReferenceDateValue >= 0.0) {
    double v12 = self->_timeIntervalSinceReferenceDateValue;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0) {
      v15 += (unint64_t)v14;
    }
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_19:
  uint64_t v16 = v5 ^ v3 ^ v10 ^ v15 ^ [(NSData *)self->_nameComponents hash];
  return v16 ^ [(NSMutableArray *)self->_arrayOfStringsValues hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 6)) {
    -[FPSearchableItemValue setStringValue:](self, "setStringValue:");
  }
  char v5 = *((unsigned char *)v4 + 56);
  if (v5)
  {
    self->_double doubleValue = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 56);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_integerValue = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
LABEL_6:
    self->_double timeIntervalSinceReferenceDateValue = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_7:
  if (*((void *)v4 + 5)) {
    -[FPSearchableItemValue setNameComponents:](self, "setNameComponents:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[FPSearchableItemValue addArrayOfStringsValue:](self, "addArrayOfStringsValue:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)setStringValue:(id)a3
{
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (double)timeIntervalSinceReferenceDateValue
{
  return self->_timeIntervalSinceReferenceDateValue;
}

- (NSData)nameComponents
{
  return self->_nameComponents;
}

- (void)setNameComponents:(id)a3
{
}

- (NSMutableArray)arrayOfStringsValues
{
  return self->_arrayOfStringsValues;
}

- (void)setArrayOfStringsValues:(id)a3
{
}

@end
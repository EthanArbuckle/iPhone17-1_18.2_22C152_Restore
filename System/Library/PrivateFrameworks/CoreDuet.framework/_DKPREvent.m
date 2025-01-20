@interface _DKPREvent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)confidence;
- (double)creationDate;
- (double)endDate;
- (double)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)addMetadata:(uint64_t)a1;
- (uint64_t)compatibilityVersion;
- (uint64_t)hasCompatibilityVersion;
- (uint64_t)hasConfidence;
- (uint64_t)hasTimeZone;
- (uint64_t)identifier;
- (uint64_t)metadatas;
- (uint64_t)setCompatibilityVersion:(uint64_t)result;
- (uint64_t)setConfidence:(uint64_t)result;
- (uint64_t)setCreationDate:(uint64_t)result;
- (uint64_t)setEndDate:(uint64_t)result;
- (uint64_t)setStartDate:(uint64_t)result;
- (uint64_t)setTimeZone:(uint64_t)result;
- (uint64_t)source;
- (uint64_t)stream;
- (uint64_t)timeZone;
- (uint64_t)value;
- (unint64_t)hash;
- (void)setIdentifier:(uint64_t)a1;
- (void)setSource:(uint64_t)a1;
- (void)setStream:(uint64_t)a1;
- (void)setValue:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation _DKPREvent

- (void)setValue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (uint64_t)setTimeZone:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 96) |= 8u;
    *(void *)(result + 48) = a2;
  }
  return result;
}

- (void)setStream:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (uint64_t)setStartDate:(uint64_t)result
{
  if (result) {
    *(double *)(result + 40) = a2;
  }
  return result;
}

- (void)setSource:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (void)setIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (uint64_t)setEndDate:(uint64_t)result
{
  if (result) {
    *(double *)(result + 32) = a2;
  }
  return result;
}

- (uint64_t)setCreationDate:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 96) |= 4u;
    *(double *)(result + 24) = a2;
  }
  return result;
}

- (uint64_t)addMetadata:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 64);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v6;

      v5 = *(void **)(a1 + 64);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_metadatas, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_stream) {
    -[_DKPREvent writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  if (!self->_value) {
    -[_DKPREvent writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  if (!self->_identifier) {
    -[_DKPREvent writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (self->_source) {
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = self->_metadatas;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_15:
      if ((has & 8) == 0) {
        goto LABEL_16;
      }
LABEL_21:
      PBDataWriterWriteInt64Field();
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_21;
  }
LABEL_16:
  if (has) {
LABEL_17:
  }
    PBDataWriterWriteInt64Field();
LABEL_18:
}

- (uint64_t)setConfidence:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 96) |= 2u;
    *(double *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)hasConfidence
{
  if (result) {
    return (*(unsigned __int8 *)(result + 96) >> 1) & 1;
  }
  return result;
}

- (uint64_t)hasTimeZone
{
  if (result) {
    return (*(unsigned __int8 *)(result + 96) >> 3) & 1;
  }
  return result;
}

- (uint64_t)setCompatibilityVersion:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 96) |= 1u;
    *(void *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)hasCompatibilityVersion
{
  if (result) {
    return *(unsigned char *)(result + 96) & 1;
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_DKPREvent;
  id v4 = [(_DKPREvent *)&v8 description];
  v5 = [(_DKPREvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  stream = self->_stream;
  if (stream)
  {
    v5 = [(_DKPRStream *)stream dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"stream"];
  }
  id v6 = [NSNumber numberWithDouble:self->_startDate];
  [v3 setObject:v6 forKey:@"startDate"];

  uint64_t v7 = [NSNumber numberWithDouble:self->_endDate];
  [v3 setObject:v7 forKey:@"endDate"];

  value = self->_value;
  if (value)
  {
    uint64_t v9 = [(_DKPRValue *)value dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"value"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  source = self->_source;
  if (source)
  {
    long long v12 = [(_DKPRSource *)source dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"source"];
  }
  if ([(NSMutableArray *)self->_metadatas count])
  {
    long long v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_metadatas, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v14 = self->_metadatas;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "dictionaryRepresentation", (void)v26);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"metadata"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v23 = [NSNumber numberWithDouble:self->_creationDate];
    [v3 setObject:v23 forKey:@"creationDate"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_20:
      if ((has & 8) == 0) {
        goto LABEL_21;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_20;
  }
  v24 = objc_msgSend(NSNumber, "numberWithDouble:", self->_confidence, (void)v26);
  [v3 setObject:v24 forKey:@"confidence"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_21:
    if ((has & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_28:
  v25 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_timeZone, (void)v26);
  [v3 setObject:v25 forKey:@"timeZone"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_22:
    v21 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_compatibilityVersion, (void)v26);
    [v3 setObject:v21 forKey:@"compatibilityVersion"];
  }
LABEL_23:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _DKPREventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_DKPRStream *)self->_stream copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v6;

  *(double *)(v5 + 40) = self->_startDate;
  *(double *)(v5 + 32) = self->_endDate;
  id v8 = [(_DKPRValue *)self->_value copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v8;

  uint64_t v10 = [(NSString *)self->_identifier copyWithZone:a3];
  v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  id v12 = [(_DKPRSource *)self->_source copyWithZone:a3];
  long long v13 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v12;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v14 = self->_metadatas;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (void)v22);
        -[_DKPREvent addMetadata:](v5, v19);
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_creationDate;
    *(unsigned char *)(v5 + 96) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_10:
      if ((has & 8) == 0) {
        goto LABEL_11;
      }
LABEL_16:
      *(void *)(v5 + 48) = self->_timeZone;
      *(unsigned char *)(v5 + 96) |= 8u;
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        return (id)v5;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_10;
  }
  *(double *)(v5 + 16) = self->_confidence;
  *(unsigned char *)(v5 + 96) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_16;
  }
LABEL_11:
  if (has)
  {
LABEL_12:
    *(void *)(v5 + 8) = self->_compatibilityVersion;
    *(unsigned char *)(v5 + 96) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  stream = self->_stream;
  if ((unint64_t)stream | *((void *)v4 + 10))
  {
    if (!-[_DKPRStream isEqual:](stream, "isEqual:")) {
      goto LABEL_33;
    }
  }
  if (self->_startDate != *((double *)v4 + 5)) {
    goto LABEL_33;
  }
  if (self->_endDate != *((double *)v4 + 4)) {
    goto LABEL_33;
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 11))
  {
    if (!-[_DKPRValue isEqual:](value, "isEqual:")) {
      goto LABEL_33;
    }
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_33;
    }
  }
  source = self->_source;
  if ((unint64_t)source | *((void *)v4 + 9))
  {
    if (!-[_DKPRSource isEqual:](source, "isEqual:")) {
      goto LABEL_33;
    }
  }
  metadatas = self->_metadatas;
  if ((unint64_t)metadatas | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](metadatas, "isEqual:")) {
      goto LABEL_33;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 4) == 0 || self->_creationDate != *((double *)v4 + 3)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 4) != 0)
  {
LABEL_33:
    BOOL v10 = 0;
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0 || self->_confidence != *((double *)v4 + 2)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 8) == 0 || self->_timeZone != *((void *)v4 + 6)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 8) != 0)
  {
    goto LABEL_33;
  }
  BOOL v10 = (*((unsigned char *)v4 + 96) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_compatibilityVersion != *((void *)v4 + 1)) {
      goto LABEL_33;
    }
    BOOL v10 = 1;
  }
LABEL_34:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v39 = [(_DKPRStream *)self->_stream hash];
  double startDate = self->_startDate;
  double v4 = -startDate;
  if (startDate >= 0.0) {
    double v4 = self->_startDate;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  double endDate = self->_endDate;
  double v13 = -endDate;
  if (endDate >= 0.0) {
    double v13 = self->_endDate;
  }
  long double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  double v16 = fmod(v14, 1.84467441e19);
  unint64_t v17 = 2654435761u * (unint64_t)v16;
  unint64_t v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0) {
    unint64_t v18 = 2654435761u * (unint64_t)v16;
  }
  unint64_t v19 = v17 - (unint64_t)fabs(v15);
  if (v15 < 0.0) {
    unint64_t v20 = v19;
  }
  else {
    unint64_t v20 = v18;
  }
  unint64_t v21 = [(_DKPRValue *)self->_value hash];
  NSUInteger v22 = [(NSString *)self->_identifier hash];
  unint64_t v23 = [(_DKPRSource *)self->_source hash];
  uint64_t v24 = [(NSMutableArray *)self->_metadatas hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    double creationDate = self->_creationDate;
    double v28 = -creationDate;
    if (creationDate >= 0.0) {
      double v28 = self->_creationDate;
    }
    long double v29 = floor(v28 + 0.5);
    double v30 = (v28 - v29) * 1.84467441e19;
    unint64_t v26 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
    if (v30 >= 0.0)
    {
      if (v30 > 0.0) {
        v26 += (unint64_t)v30;
      }
    }
    else
    {
      v26 -= (unint64_t)fabs(v30);
    }
  }
  else
  {
    unint64_t v26 = 0;
  }
  if ((has & 2) != 0)
  {
    double confidence = self->_confidence;
    double v33 = -confidence;
    if (confidence >= 0.0) {
      double v33 = self->_confidence;
    }
    long double v34 = floor(v33 + 0.5);
    double v35 = (v33 - v34) * 1.84467441e19;
    unint64_t v31 = 2654435761u * (unint64_t)fmod(v34, 1.84467441e19);
    if (v35 >= 0.0)
    {
      if (v35 > 0.0) {
        v31 += (unint64_t)v35;
      }
      if ((has & 8) == 0)
      {
LABEL_35:
        uint64_t v36 = 0;
        if ((has & 1) == 0) {
          goto LABEL_36;
        }
        goto LABEL_31;
      }
    }
    else
    {
      v31 -= (unint64_t)fabs(v35);
      if ((has & 8) == 0) {
        goto LABEL_35;
      }
    }
  }
  else
  {
    unint64_t v31 = 0;
    if ((has & 8) == 0) {
      goto LABEL_35;
    }
  }
  uint64_t v36 = 2654435761 * self->_timeZone;
  if ((has & 1) == 0)
  {
LABEL_36:
    uint64_t v37 = 0;
    return v11 ^ v39 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v26 ^ v31 ^ v36 ^ v37;
  }
LABEL_31:
  uint64_t v37 = 2654435761 * self->_compatibilityVersion;
  return v11 ^ v39 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v26 ^ v31 ^ v36 ^ v37;
}

- (uint64_t)stream
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

- (double)startDate
{
  if (a1) {
    return *(double *)(a1 + 40);
  }
  else {
    return 0.0;
  }
}

- (double)endDate
{
  if (a1) {
    return *(double *)(a1 + 32);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)value
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

- (uint64_t)identifier
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (uint64_t)source
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (uint64_t)metadatas
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (double)creationDate
{
  if (a1) {
    return *(double *)(a1 + 24);
  }
  else {
    return 0.0;
  }
}

- (double)confidence
{
  if (a1) {
    return *(double *)(a1 + 16);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)timeZone
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (uint64_t)compatibilityVersion
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_DKPREvent writeTo:]", "_DKPREvent.m", 312, "self->_stream != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[_DKPREvent writeTo:]", "_DKPREvent.m", 325, "self->_value != nil");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[_DKPREvent writeTo:]", "_DKPREvent.m", 330, "nil != self->_identifier");
}

@end
@interface DESPFLNoisable
- (BOOL)hasDataTransport;
- (BOOL)hasIteration;
- (BOOL)hasRecipeId;
- (BOOL)hasUuid;
- (BOOL)hasVersion;
- (BOOL)hasWeight;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DESDataTransport)dataTransport;
- (NSString)recipeId;
- (NSString)uuid;
- (double)dataAtIndex:(unint64_t)a3;
- (double)datas;
- (double)weight;
- (float)data32AtIndex:(unint64_t)a3;
- (float)data32s;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)version;
- (unint64_t)data32sCount;
- (unint64_t)datasCount;
- (unint64_t)hash;
- (unsigned)iteration;
- (void)addData32:(float)a3;
- (void)addData:(double)a3;
- (void)clearData32s;
- (void)clearDatas;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setData32s:(float *)a3 count:(unint64_t)a4;
- (void)setDataTransport:(id)a3;
- (void)setDatas:(double *)a3 count:(unint64_t)a4;
- (void)setHasIteration:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHasWeight:(BOOL)a3;
- (void)setIteration:(unsigned int)a3;
- (void)setRecipeId:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(int)a3;
- (void)setWeight:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation DESPFLNoisable

- (void)dealloc
{
  PBRepeatedDoubleClear();
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)DESPFLNoisable;
  [(DESPFLNoisable *)&v3 dealloc];
}

- (void)setVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasRecipeId
{
  return self->_recipeId != 0;
}

- (void)setIteration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_iteration = a3;
}

- (void)setHasIteration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIteration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setWeight:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_weight = a3;
}

- (void)setHasWeight:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWeight
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)datasCount
{
  return self->_datas.count;
}

- (double)datas
{
  return self->_datas.list;
}

- (void)clearDatas
{
}

- (void)addData:(double)a3
{
}

- (double)dataAtIndex:(unint64_t)a3
{
  p_datas = &self->_datas;
  unint64_t count = self->_datas.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_datas->list[a3];
}

- (void)setDatas:(double *)a3 count:(unint64_t)a4
{
}

- (unint64_t)data32sCount
{
  return self->_data32s.count;
}

- (float)data32s
{
  return self->_data32s.list;
}

- (void)clearData32s
{
}

- (void)addData32:(float)a3
{
}

- (float)data32AtIndex:(unint64_t)a3
{
  p_data32s = &self->_data32s;
  unint64_t count = self->_data32s.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_data32s->list[a3];
}

- (void)setData32s:(float *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasDataTransport
{
  return self->_dataTransport != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DESPFLNoisable;
  v4 = [(DESPFLNoisable *)&v8 description];
  v5 = [(DESPFLNoisable *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4 = [NSNumber numberWithInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  recipeId = self->_recipeId;
  if (recipeId) {
    [v3 setObject:recipeId forKey:@"recipe_id"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v7 = [NSNumber numberWithUnsignedInt:self->_iteration];
    [v3 setObject:v7 forKey:@"iteration"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_weight];
    [v3 setObject:v8 forKey:@"weight"];
  }
  v9 = PBRepeatedDoubleNSArray();
  [v3 setObject:v9 forKey:@"data"];

  v10 = PBRepeatedFloatNSArray();
  [v3 setObject:v10 forKey:@"data32"];

  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  dataTransport = self->_dataTransport;
  if (dataTransport)
  {
    v13 = [(DESDataTransport *)dataTransport dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"data_transport"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DESPFLNoisableReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_recipeId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_datas.count)
  {
    PBDataWriterPlaceMark();
    if (self->_datas.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteDoubleField();
        ++v6;
      }
      while (v6 < self->_datas.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_data32s.count)
  {
    PBDataWriterPlaceMark();
    if (self->_data32s.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteFloatField();
        ++v7;
      }
      while (v7 < self->_data32s.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_uuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_dataTransport) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[24] = self->_version;
    *((unsigned char *)v4 + 100) |= 4u;
  }
  v13 = v4;
  if (self->_recipeId)
  {
    objc_msgSend(v4, "setRecipeId:");
    id v4 = v13;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[18] = self->_iteration;
    *((unsigned char *)v4 + 100) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 7) = *(void *)&self->_weight;
    *((unsigned char *)v4 + 100) |= 1u;
  }
  if ([(DESPFLNoisable *)self datasCount])
  {
    [v13 clearDatas];
    unint64_t v6 = [(DESPFLNoisable *)self datasCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        [(DESPFLNoisable *)self dataAtIndex:i];
        objc_msgSend(v13, "addData:");
      }
    }
  }
  if ([(DESPFLNoisable *)self data32sCount])
  {
    [v13 clearData32s];
    unint64_t v9 = [(DESPFLNoisable *)self data32sCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        [(DESPFLNoisable *)self data32AtIndex:j];
        objc_msgSend(v13, "addData32:");
      }
    }
  }
  if (self->_uuid) {
    objc_msgSend(v13, "setUuid:");
  }
  v12 = v13;
  if (self->_dataTransport)
  {
    objc_msgSend(v13, "setDataTransport:");
    v12 = v13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_version;
    *(unsigned char *)(v5 + 100) |= 4u;
  }
  uint64_t v7 = [(NSString *)self->_recipeId copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v7;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_iteration;
    *(unsigned char *)(v6 + 100) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v6 + 56) = self->_weight;
    *(unsigned char *)(v6 + 100) |= 1u;
  }
  PBRepeatedDoubleCopy();
  PBRepeatedFloatCopy();
  uint64_t v10 = [(NSString *)self->_uuid copyWithZone:a3];
  v11 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v10;

  id v12 = [(DESDataTransport *)self->_dataTransport copyWithZone:a3];
  v13 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v12;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 4) == 0 || self->_version != *((_DWORD *)v4 + 24)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 4) != 0)
  {
    goto LABEL_26;
  }
  recipeId = self->_recipeId;
  if ((unint64_t)recipeId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](recipeId, "isEqual:"))
    {
LABEL_26:
      char v9 = 0;
      goto LABEL_27;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 2) == 0 || self->_iteration != *((_DWORD *)v4 + 18)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 2) != 0)
  {
    goto LABEL_26;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 100) & 1) == 0 || self->_weight != *((double *)v4 + 7)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 100))
  {
    goto LABEL_26;
  }
  if (!PBRepeatedDoubleIsEqual()) {
    goto LABEL_26;
  }
  if (!PBRepeatedFloatIsEqual()) {
    goto LABEL_26;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:")) {
      goto LABEL_26;
    }
  }
  dataTransport = self->_dataTransport;
  if ((unint64_t)dataTransport | *((void *)v4 + 8)) {
    char v9 = -[DESDataTransport isEqual:](dataTransport, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_27:

  return v9;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_recipeId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_iteration;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v10 = 0;
    goto LABEL_14;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  double weight = self->_weight;
  double v7 = -weight;
  if (weight >= 0.0) {
    double v7 = self->_weight;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_14:
  NSUInteger v11 = v4 ^ v3;
  uint64_t v12 = v5 ^ v10 ^ PBRepeatedDoubleHash();
  uint64_t v13 = v12 ^ PBRepeatedFloatHash();
  NSUInteger v14 = v11 ^ v13 ^ [(NSString *)self->_uuid hash];
  return v14 ^ [(DESDataTransport *)self->_dataTransport hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 100) & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 24);
    *(unsigned char *)&self->_has |= 4u;
  }
  v15 = v4;
  if (*((void *)v4 + 10))
  {
    -[DESPFLNoisable setRecipeId:](self, "setRecipeId:");
    id v4 = v15;
  }
  char v5 = *((unsigned char *)v4 + 100);
  if ((v5 & 2) != 0)
  {
    self->_iteration = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 100);
  }
  if (v5)
  {
    self->_double weight = *((double *)v4 + 7);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v6 = [v4 datasCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      [v15 dataAtIndex:i];
      -[DESPFLNoisable addData:](self, "addData:");
    }
  }
  uint64_t v9 = [v15 data32sCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
    {
      [v15 data32AtIndex:j];
      -[DESPFLNoisable addData32:](self, "addData32:");
    }
  }
  uint64_t v12 = v15;
  if (v15[11])
  {
    -[DESPFLNoisable setUuid:](self, "setUuid:");
    uint64_t v12 = v15;
  }
  dataTransport = self->_dataTransport;
  uint64_t v14 = v12[8];
  if (dataTransport)
  {
    if (v14) {
      -[DESDataTransport mergeFrom:](dataTransport, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[DESPFLNoisable setDataTransport:](self, "setDataTransport:");
  }

  MEMORY[0x1F41817F8]();
}

- (int)version
{
  return self->_version;
}

- (NSString)recipeId
{
  return self->_recipeId;
}

- (void)setRecipeId:(id)a3
{
}

- (unsigned)iteration
{
  return self->_iteration;
}

- (double)weight
{
  return self->_weight;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (DESDataTransport)dataTransport
{
  return self->_dataTransport;
}

- (void)setDataTransport:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_recipeId, 0);

  objc_storeStrong((id *)&self->_dataTransport, 0);
}

@end
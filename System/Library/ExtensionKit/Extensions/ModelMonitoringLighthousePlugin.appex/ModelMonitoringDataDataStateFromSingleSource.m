@interface ModelMonitoringDataDataStateFromSingleSource
- (BOOL)hasRecordCount;
- (BOOL)hasSourceName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)sourceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)recordCount;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRecordCount:(BOOL)a3;
- (void)setRecordCount:(int)a3;
- (void)setSourceName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ModelMonitoringDataDataStateFromSingleSource

- (BOOL)hasSourceName
{
  return self->_sourceName != 0;
}

- (void)setRecordCount:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_recordCount = a3;
}

- (void)setHasRecordCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRecordCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ModelMonitoringDataDataStateFromSingleSource;
  v3 = [(ModelMonitoringDataDataStateFromSingleSource *)&v7 description];
  v4 = [(ModelMonitoringDataDataStateFromSingleSource *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  sourceName = self->_sourceName;
  if (sourceName) {
    [v3 setObject:sourceName forKey:@"sourceName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = +[NSNumber numberWithInt:self->_recordCount];
    [v4 setObject:v6 forKey:@"recordCount"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ModelMonitoringDataDataStateFromSingleSourceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sourceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_sourceName)
  {
    id v5 = v4;
    objc_msgSend(v4, "setSourceName:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_recordCount;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_sourceName copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 2) = self->_recordCount;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  sourceName = self->_sourceName;
  if ((unint64_t)sourceName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](sourceName, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_recordCount == *((_DWORD *)v4 + 2))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sourceName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_recordCount;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  if (*((void *)v4 + 2))
  {
    id v5 = v4;
    -[ModelMonitoringDataDataStateFromSingleSource setSourceName:](self, "setSourceName:");
    uint64_t v4 = v5;
  }
  if (v4[6])
  {
    self->_recordCount = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (void)setSourceName:(id)a3
{
}

- (int)recordCount
{
  return self->_recordCount;
}

- (void).cxx_destruct
{
}

@end
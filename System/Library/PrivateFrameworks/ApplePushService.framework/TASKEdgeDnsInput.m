@interface TASKEdgeDnsInput
- (BOOL)hasRecordType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)hostname;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recordTypeAsString:(int)a3;
- (int)StringAsRecordType:(id)a3;
- (int)recordType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRecordType:(BOOL)a3;
- (void)setHostname:(id)a3;
- (void)setRecordType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TASKEdgeDnsInput

- (int)recordType
{
  if (*(unsigned char *)&self->_has) {
    return self->_recordType;
  }
  else {
    return 0;
  }
}

- (void)setRecordType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_recordType = a3;
}

- (void)setHasRecordType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRecordType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)recordTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_10012BA38[a3];
  }
  return v3;
}

- (int)StringAsRecordType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"All"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IPv4"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IPv6"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TASKEdgeDnsInput;
  id v3 = [(TASKEdgeDnsInput *)&v7 description];
  int v4 = [(TASKEdgeDnsInput *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  hostname = self->_hostname;
  if (hostname) {
    [v3 setObject:hostname forKey:@"hostname"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t recordType = self->_recordType;
    if (recordType >= 3)
    {
      objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_recordType];
    }
    else
    {
      objc_super v7 = off_10012BA38[recordType];
    }
    [v4 setObject:v7 forKey:@"recordType"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10007646C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteStringField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setHostname:self->_hostname];
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_recordType;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_hostname copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_recordType;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  hostname = self->_hostname;
  if ((unint64_t)hostname | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](hostname, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_recordType == *((_DWORD *)v4 + 4))
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
  NSUInteger v3 = [(NSString *)self->_hostname hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_recordType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  if (*((void *)v4 + 1))
  {
    v5 = v4;
    -[TASKEdgeDnsInput setHostname:](self, "setHostname:");
    uint64_t v4 = v5;
  }
  if (v4[5])
  {
    self->_uint64_t recordType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
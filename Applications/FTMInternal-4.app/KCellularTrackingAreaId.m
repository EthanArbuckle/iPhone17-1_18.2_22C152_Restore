@interface KCellularTrackingAreaId
- (BOOL)hasEncodedPlmn;
- (BOOL)hasTac;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encodedPlmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)tac;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncodedPlmn:(id)a3;
- (void)setHasTac:(BOOL)a3;
- (void)setTac:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularTrackingAreaId

- (BOOL)hasEncodedPlmn
{
  return self->_encodedPlmn != 0;
}

- (void)setTac:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_tac = a3;
}

- (void)setHasTac:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTac
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCellularTrackingAreaId;
  v3 = [(KCellularTrackingAreaId *)&v7 description];
  v4 = [(KCellularTrackingAreaId *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  encodedPlmn = self->_encodedPlmn;
  if (encodedPlmn) {
    [v3 setObject:encodedPlmn forKey:@"encoded_plmn"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_tac];
    [v4 setObject:v6 forKey:@"tac"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000F30E4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_encodedPlmn)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_encodedPlmn)
  {
    id v5 = v4;
    [v4 setEncodedPlmn:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_tac;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSData *)self->_encodedPlmn copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_tac;
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
  encodedPlmn = self->_encodedPlmn;
  if ((unint64_t)encodedPlmn | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](encodedPlmn, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_tac == *((_DWORD *)v4 + 4))
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
  unint64_t v3 = (unint64_t)[(NSData *)self->_encodedPlmn hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_tac;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  if (*((void *)v4 + 1))
  {
    id v5 = v4;
    -[KCellularTrackingAreaId setEncodedPlmn:](self, "setEncodedPlmn:");
    uint64_t v4 = v5;
  }
  if (v4[5])
  {
    self->_tac = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)encodedPlmn
{
  return self->_encodedPlmn;
}

- (void)setEncodedPlmn:(id)a3
{
}

- (unsigned)tac
{
  return self->_tac;
}

- (void).cxx_destruct
{
}

@end
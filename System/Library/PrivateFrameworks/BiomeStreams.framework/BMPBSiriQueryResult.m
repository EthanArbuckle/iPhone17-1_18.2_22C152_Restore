@interface BMPBSiriQueryResult
- (BOOL)hasConfidence;
- (BOOL)hasDomain;
- (BOOL)hasQid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)domain;
- (NSString)qid;
- (double)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setDomain:(id)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setQid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBSiriQueryResult

- (BOOL)hasQid
{
  return self->_qid != 0;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (void)setConfidence:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBSiriQueryResult;
  v4 = [(BMPBSiriQueryResult *)&v8 description];
  v5 = [(BMPBSiriQueryResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  qid = self->_qid;
  if (qid) {
    [v3 setObject:qid forKey:@"qid"];
  }
  domain = self->_domain;
  if (domain) {
    [v4 setObject:domain forKey:@"domain"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithDouble:self->_confidence];
    [v4 setObject:v7 forKey:@"confidence"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSiriQueryResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_qid)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_domain)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_qid)
  {
    objc_msgSend(v4, "setQid:");
    id v4 = v5;
  }
  if (self->_domain)
  {
    objc_msgSend(v5, "setDomain:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_confidence;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_qid copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_domain copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_confidence;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  qid = self->_qid;
  if ((unint64_t)qid | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](qid, "isEqual:")) {
      goto LABEL_10;
    }
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](domain, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_confidence == *((double *)v4 + 1))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_qid hash];
  NSUInteger v4 = [(NSString *)self->_domain hash];
  if (*(unsigned char *)&self->_has)
  {
    double confidence = self->_confidence;
    double v7 = -confidence;
    if (confidence >= 0.0) {
      double v7 = self->_confidence;
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
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (double *)a3;
  unint64_t v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[BMPBSiriQueryResult setQid:](self, "setQid:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[BMPBSiriQueryResult setDomain:](self, "setDomain:");
    NSUInteger v4 = v5;
  }
  if ((_BYTE)v4[4])
  {
    self->_double confidence = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)qid
{
  return self->_qid;
}

- (void)setQid:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qid, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end
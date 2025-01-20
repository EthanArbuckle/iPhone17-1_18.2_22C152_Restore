@interface AWDFlagstoneStabilityMetrics
- (AWDCountersStabilityS)sCntrsStability;
- (AWDHeaderInfoS)header;
- (BOOL)hasHeader;
- (BOOL)hasSCntrsStability;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setSCntrsStability:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDFlagstoneStabilityMetrics

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasHeader
{
  return self->_header != 0;
}

- (BOOL)hasSCntrsStability
{
  return self->_sCntrsStability != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDFlagstoneStabilityMetrics;
  v3 = [(AWDFlagstoneStabilityMetrics *)&v7 description];
  v4 = [(AWDFlagstoneStabilityMetrics *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  header = self->_header;
  if (header)
  {
    v6 = [(AWDHeaderInfoS *)header dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"header"];
  }
  sCntrsStability = self->_sCntrsStability;
  if (sCntrsStability)
  {
    v8 = [(AWDCountersStabilityS *)sCntrsStability dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"s_cntrs_stability"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDFlagstoneStabilityMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_header)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_sCntrsStability)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v5 = v4;
  if (self->_header)
  {
    objc_msgSend(v4, "setHeader:");
    id v4 = v5;
  }
  if (self->_sCntrsStability)
  {
    objc_msgSend(v5, "setSCntrsStability:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  id v7 = [(AWDHeaderInfoS *)self->_header copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(AWDCountersStabilityS *)self->_sCntrsStability copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:

    return 0;
  }
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 2) && !-[AWDHeaderInfoS isEqual:](header, "isEqual:")) {
    goto LABEL_11;
  }
  sCntrsStability = self->_sCntrsStability;
  if ((unint64_t)sCntrsStability | *((void *)v4 + 3))
  {
    unsigned __int8 v8 = -[AWDCountersStabilityS isEqual:](sCntrsStability, "isEqual:");

    return v8;
  }
  else
  {

    return 1;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(AWDHeaderInfoS *)self->_header hash] ^ v3;
  return v4 ^ [(AWDCountersStabilityS *)self->_sCntrsStability hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if (v4[4])
  {
    self->_timestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  header = self->_header;
  uint64_t v7 = v5[2];
  v10 = v5;
  if (header)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[AWDHeaderInfoS mergeFrom:](header, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[AWDFlagstoneStabilityMetrics setHeader:](self, "setHeader:");
  }
  id v5 = v10;
LABEL_9:
  sCntrsStability = self->_sCntrsStability;
  uint64_t v9 = v5[3];
  if (sCntrsStability)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[AWDCountersStabilityS mergeFrom:](sCntrsStability, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[AWDFlagstoneStabilityMetrics setSCntrsStability:](self, "setSCntrsStability:");
  }
  id v5 = v10;
LABEL_15:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDHeaderInfoS)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (AWDCountersStabilityS)sCntrsStability
{
  return self->_sCntrsStability;
}

- (void)setSCntrsStability:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sCntrsStability, 0);

  objc_storeStrong((id *)&self->_header, 0);
}

@end
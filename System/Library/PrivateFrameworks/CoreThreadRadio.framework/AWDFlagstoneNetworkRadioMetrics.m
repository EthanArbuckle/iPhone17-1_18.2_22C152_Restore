@interface AWDFlagstoneNetworkRadioMetrics
- (AWDCountersNetworkS)sCntrsNetwork;
- (AWDCountersRadioS)sCntrsRadio;
- (AWDHeaderInfoS)header;
- (BOOL)hasHeader;
- (BOOL)hasSCntrsNetwork;
- (BOOL)hasSCntrsRadio;
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
- (void)setSCntrsNetwork:(id)a3;
- (void)setSCntrsRadio:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDFlagstoneNetworkRadioMetrics

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

- (BOOL)hasSCntrsNetwork
{
  return self->_sCntrsNetwork != 0;
}

- (BOOL)hasSCntrsRadio
{
  return self->_sCntrsRadio != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDFlagstoneNetworkRadioMetrics;
  v3 = [(AWDFlagstoneNetworkRadioMetrics *)&v7 description];
  v4 = [(AWDFlagstoneNetworkRadioMetrics *)self dictionaryRepresentation];
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
  sCntrsNetwork = self->_sCntrsNetwork;
  if (sCntrsNetwork)
  {
    v8 = [(AWDCountersNetworkS *)sCntrsNetwork dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"s_cntrs_network"];
  }
  sCntrsRadio = self->_sCntrsRadio;
  if (sCntrsRadio)
  {
    v10 = [(AWDCountersRadioS *)sCntrsRadio dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"s_cntrs_radio"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDFlagstoneNetworkRadioMetricsReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_sCntrsNetwork)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_sCntrsRadio)
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
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v5 = v4;
  if (self->_header)
  {
    objc_msgSend(v4, "setHeader:");
    id v4 = v5;
  }
  if (self->_sCntrsNetwork)
  {
    objc_msgSend(v5, "setSCntrsNetwork:");
    id v4 = v5;
  }
  if (self->_sCntrsRadio)
  {
    objc_msgSend(v5, "setSCntrsRadio:");
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
    *((unsigned char *)v5 + 40) |= 1u;
  }
  id v7 = [(AWDHeaderInfoS *)self->_header copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(AWDCountersNetworkS *)self->_sCntrsNetwork copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  id v11 = [(AWDCountersRadioS *)self->_sCntrsRadio copyWithZone:a3];
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:

    return 0;
  }
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 2) && !-[AWDHeaderInfoS isEqual:](header, "isEqual:")) {
    goto LABEL_13;
  }
  sCntrsNetwork = self->_sCntrsNetwork;
  if ((unint64_t)sCntrsNetwork | *((void *)v4 + 3))
  {
    if (!-[AWDCountersNetworkS isEqual:](sCntrsNetwork, "isEqual:")) {
      goto LABEL_13;
    }
  }
  sCntrsRadio = self->_sCntrsRadio;
  if ((unint64_t)sCntrsRadio | *((void *)v4 + 4))
  {
    unsigned __int8 v9 = -[AWDCountersRadioS isEqual:](sCntrsRadio, "isEqual:");

    return v9;
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
  unint64_t v5 = [(AWDCountersNetworkS *)self->_sCntrsNetwork hash];
  return v4 ^ v5 ^ [(AWDCountersRadioS *)self->_sCntrsRadio hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  unint64_t v5 = v4;
  if (v4[5])
  {
    self->_timestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  header = self->_header;
  uint64_t v7 = v5[2];
  v12 = v5;
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
    -[AWDFlagstoneNetworkRadioMetrics setHeader:](self, "setHeader:");
  }
  unint64_t v5 = v12;
LABEL_9:
  sCntrsNetwork = self->_sCntrsNetwork;
  uint64_t v9 = v5[3];
  if (sCntrsNetwork)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[AWDCountersNetworkS mergeFrom:](sCntrsNetwork, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[AWDFlagstoneNetworkRadioMetrics setSCntrsNetwork:](self, "setSCntrsNetwork:");
  }
  unint64_t v5 = v12;
LABEL_15:
  sCntrsRadio = self->_sCntrsRadio;
  uint64_t v11 = v5[4];
  if (sCntrsRadio)
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[AWDCountersRadioS mergeFrom:](sCntrsRadio, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[AWDFlagstoneNetworkRadioMetrics setSCntrsRadio:](self, "setSCntrsRadio:");
  }
  unint64_t v5 = v12;
LABEL_21:
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

- (AWDCountersNetworkS)sCntrsNetwork
{
  return self->_sCntrsNetwork;
}

- (void)setSCntrsNetwork:(id)a3
{
}

- (AWDCountersRadioS)sCntrsRadio
{
  return self->_sCntrsRadio;
}

- (void)setSCntrsRadio:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sCntrsRadio, 0);
  objc_storeStrong((id *)&self->_sCntrsNetwork, 0);

  objc_storeStrong((id *)&self->_header, 0);
}

@end
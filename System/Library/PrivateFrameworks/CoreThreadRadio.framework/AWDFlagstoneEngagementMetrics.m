@interface AWDFlagstoneEngagementMetrics
- (AWDCountersDiscoveryJoinS)sCntrsDiscoveryJoin;
- (AWDCountersEngagementS)sCntrsEngagement;
- (AWDCountersReachabilityS)sCntrsReachability;
- (AWDHeaderInfoS)header;
- (BOOL)hasHeader;
- (BOOL)hasSCntrsDiscoveryJoin;
- (BOOL)hasSCntrsEngagement;
- (BOOL)hasSCntrsReachability;
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
- (void)setSCntrsDiscoveryJoin:(id)a3;
- (void)setSCntrsEngagement:(id)a3;
- (void)setSCntrsReachability:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDFlagstoneEngagementMetrics

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

- (BOOL)hasSCntrsEngagement
{
  return self->_sCntrsEngagement != 0;
}

- (BOOL)hasSCntrsDiscoveryJoin
{
  return self->_sCntrsDiscoveryJoin != 0;
}

- (BOOL)hasSCntrsReachability
{
  return self->_sCntrsReachability != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDFlagstoneEngagementMetrics;
  v3 = [(AWDFlagstoneEngagementMetrics *)&v7 description];
  v4 = [(AWDFlagstoneEngagementMetrics *)self dictionaryRepresentation];
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
  sCntrsEngagement = self->_sCntrsEngagement;
  if (sCntrsEngagement)
  {
    v8 = [(AWDCountersEngagementS *)sCntrsEngagement dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"s_cntrs_engagement"];
  }
  sCntrsDiscoveryJoin = self->_sCntrsDiscoveryJoin;
  if (sCntrsDiscoveryJoin)
  {
    v10 = [(AWDCountersDiscoveryJoinS *)sCntrsDiscoveryJoin dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"s_cntrs_discovery_join"];
  }
  sCntrsReachability = self->_sCntrsReachability;
  if (sCntrsReachability)
  {
    v12 = [(AWDCountersReachabilityS *)sCntrsReachability dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"s_cntrs_reachability"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDFlagstoneEngagementMetricsReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_sCntrsEngagement)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_sCntrsDiscoveryJoin)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_sCntrsReachability)
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
    *((unsigned char *)v4 + 48) |= 1u;
  }
  id v5 = v4;
  if (self->_header)
  {
    objc_msgSend(v4, "setHeader:");
    id v4 = v5;
  }
  if (self->_sCntrsEngagement)
  {
    objc_msgSend(v5, "setSCntrsEngagement:");
    id v4 = v5;
  }
  if (self->_sCntrsDiscoveryJoin)
  {
    objc_msgSend(v5, "setSCntrsDiscoveryJoin:");
    id v4 = v5;
  }
  if (self->_sCntrsReachability)
  {
    objc_msgSend(v5, "setSCntrsReachability:");
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
    *((unsigned char *)v5 + 48) |= 1u;
  }
  id v7 = [(AWDHeaderInfoS *)self->_header copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(AWDCountersEngagementS *)self->_sCntrsEngagement copyWithZone:a3];
  v10 = (void *)v6[4];
  v6[4] = v9;

  id v11 = [(AWDCountersDiscoveryJoinS *)self->_sCntrsDiscoveryJoin copyWithZone:a3];
  v12 = (void *)v6[3];
  v6[3] = v11;

  id v13 = [(AWDCountersReachabilityS *)self->_sCntrsReachability copyWithZone:a3];
  v14 = (void *)v6[5];
  v6[5] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:

    return 0;
  }
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 2) && !-[AWDHeaderInfoS isEqual:](header, "isEqual:")) {
    goto LABEL_15;
  }
  sCntrsEngagement = self->_sCntrsEngagement;
  if ((unint64_t)sCntrsEngagement | *((void *)v4 + 4))
  {
    if (!-[AWDCountersEngagementS isEqual:](sCntrsEngagement, "isEqual:")) {
      goto LABEL_15;
    }
  }
  sCntrsDiscoveryJoin = self->_sCntrsDiscoveryJoin;
  if ((unint64_t)sCntrsDiscoveryJoin | *((void *)v4 + 3))
  {
    if (!-[AWDCountersDiscoveryJoinS isEqual:](sCntrsDiscoveryJoin, "isEqual:")) {
      goto LABEL_15;
    }
  }
  sCntrsReachability = self->_sCntrsReachability;
  if ((unint64_t)sCntrsReachability | *((void *)v4 + 5))
  {
    unsigned __int8 v10 = -[AWDCountersReachabilityS isEqual:](sCntrsReachability, "isEqual:");

    return v10;
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
  unint64_t v5 = [(AWDCountersEngagementS *)self->_sCntrsEngagement hash];
  unint64_t v6 = v4 ^ v5 ^ [(AWDCountersDiscoveryJoinS *)self->_sCntrsDiscoveryJoin hash];
  return v6 ^ [(AWDCountersReachabilityS *)self->_sCntrsReachability hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  unint64_t v5 = v4;
  if (v4[6])
  {
    self->_timestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  header = self->_header;
  uint64_t v7 = v5[2];
  v14 = v5;
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
    -[AWDFlagstoneEngagementMetrics setHeader:](self, "setHeader:");
  }
  unint64_t v5 = v14;
LABEL_9:
  sCntrsEngagement = self->_sCntrsEngagement;
  uint64_t v9 = v5[4];
  if (sCntrsEngagement)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[AWDCountersEngagementS mergeFrom:](sCntrsEngagement, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[AWDFlagstoneEngagementMetrics setSCntrsEngagement:](self, "setSCntrsEngagement:");
  }
  unint64_t v5 = v14;
LABEL_15:
  sCntrsDiscoveryJoin = self->_sCntrsDiscoveryJoin;
  uint64_t v11 = v5[3];
  if (sCntrsDiscoveryJoin)
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[AWDCountersDiscoveryJoinS mergeFrom:](sCntrsDiscoveryJoin, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[AWDFlagstoneEngagementMetrics setSCntrsDiscoveryJoin:](self, "setSCntrsDiscoveryJoin:");
  }
  unint64_t v5 = v14;
LABEL_21:
  sCntrsReachability = self->_sCntrsReachability;
  uint64_t v13 = v5[5];
  if (sCntrsReachability)
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[AWDCountersReachabilityS mergeFrom:](sCntrsReachability, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[AWDFlagstoneEngagementMetrics setSCntrsReachability:](self, "setSCntrsReachability:");
  }
  unint64_t v5 = v14;
LABEL_27:
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

- (AWDCountersEngagementS)sCntrsEngagement
{
  return self->_sCntrsEngagement;
}

- (void)setSCntrsEngagement:(id)a3
{
}

- (AWDCountersDiscoveryJoinS)sCntrsDiscoveryJoin
{
  return self->_sCntrsDiscoveryJoin;
}

- (void)setSCntrsDiscoveryJoin:(id)a3
{
}

- (AWDCountersReachabilityS)sCntrsReachability
{
  return self->_sCntrsReachability;
}

- (void)setSCntrsReachability:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sCntrsReachability, 0);
  objc_storeStrong((id *)&self->_sCntrsEngagement, 0);
  objc_storeStrong((id *)&self->_sCntrsDiscoveryJoin, 0);

  objc_storeStrong((id *)&self->_header, 0);
}

@end
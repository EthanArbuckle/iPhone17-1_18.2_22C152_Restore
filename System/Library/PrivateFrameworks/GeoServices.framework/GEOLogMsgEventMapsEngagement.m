@interface GEOLogMsgEventMapsEngagement
+ (BOOL)isValid:(id)a3;
- (BOOL)hasReportingChannel;
- (BOOL)hasSummaryDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventMapsEngagement)initWithDictionary:(id)a3;
- (GEOLogMsgEventMapsEngagement)initWithJSON:(id)a3;
- (NSString)summaryDate;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)reportingChannelAsString:(int)a3;
- (int)StringAsReportingChannel:(id)a3;
- (int)reportingChannel;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasReportingChannel:(BOOL)a3;
- (void)setReportingChannel:(int)a3;
- (void)setSummaryDate:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventMapsEngagement

- (void)setSummaryDate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setReportingChannel:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_reportingChannel = a3;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_summaryDate)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (int)reportingChannel
{
  if (*(unsigned char *)&self->_flags) {
    return self->_reportingChannel;
  }
  else {
    return 0;
  }
}

- (void)setHasReportingChannel:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasReportingChannel
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)reportingChannelAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53F7958[a3];
  }

  return v3;
}

- (int)StringAsReportingChannel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"EngagementReportingChannel_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EngagementReportingChannel_IN_PROCESS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EngagementReportingChannel_GEOANALYTICSD"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasSummaryDate
{
  return self->_summaryDate != 0;
}

- (NSString)summaryDate
{
  return self->_summaryDate;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventMapsEngagement;
  int v4 = [(GEOLogMsgEventMapsEngagement *)&v8 description];
  id v5 = [(GEOLogMsgEventMapsEngagement *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventMapsEngagement _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 20))
    {
      uint64_t v5 = *(int *)(a1 + 16);
      if (v5 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53F7958[v5];
      }
      if (a2) {
        v7 = @"reportingChannel";
      }
      else {
        v7 = @"reporting_channel";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 summaryDate];
    if (v8)
    {
      if (a2) {
        v9 = @"summaryDate";
      }
      else {
        v9 = @"summary_date";
      }
      [v4 setObject:v8 forKey:v9];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventMapsEngagement _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventMapsEngagement)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventMapsEngagement *)-[GEOLogMsgEventMapsEngagement _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_24;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_24;
  }
  if (a3) {
    v6 = @"reportingChannel";
  }
  else {
    v6 = @"reporting_channel";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"EngagementReportingChannel_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"EngagementReportingChannel_IN_PROCESS"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"EngagementReportingChannel_GEOANALYTICSD"])
    {
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_17:
    [a1 setReportingChannel:v9];
  }

  if (a3) {
    v10 = @"summaryDate";
  }
  else {
    v10 = @"summary_date";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = (void *)[v11 copy];
    [a1 setSummaryDate:v12];
  }
LABEL_24:

  return a1;
}

- (GEOLogMsgEventMapsEngagement)initWithJSON:(id)a3
{
  return (GEOLogMsgEventMapsEngagement *)-[GEOLogMsgEventMapsEngagement _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventMapsEngagementIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventMapsEngagementReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgEventMapsEngagement *)self readAll:0];
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 4) = self->_reportingChannel;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  if (self->_summaryDate)
  {
    objc_msgSend(v5, "setSummaryDate:");
    int v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_reportingChannel;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_summaryDate copyWithZone:a3];
  id v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEOLogMsgEventMapsEngagement *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_reportingChannel != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  summaryDate = self->_summaryDate;
  if ((unint64_t)summaryDate | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](summaryDate, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventMapsEngagement *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_reportingChannel;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(NSString *)self->_summaryDate hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (int *)a3;
  [v5 readAll:0];
  id v4 = v5;
  if (v5[5])
  {
    self->_reportingChannel = v5[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v5 + 1))
  {
    -[GEOLogMsgEventMapsEngagement setSummaryDate:](self, "setSummaryDate:");
    id v4 = v5;
  }
}

@end
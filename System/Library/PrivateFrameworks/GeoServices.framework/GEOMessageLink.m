@interface GEOMessageLink
- (BOOL)isVerified;
- (GEOMessageLink)initWithMessageLink:(id)a3;
- (NSString)messageID;
- (NSString)messageURLString;
- (NSString)navBackgroundColorString;
- (NSString)navTintColorString;
- (NSTimeZone)timeZone;
- (id)messageBusinessHours;
- (int)responseTime;
@end

@implementation GEOMessageLink

- (GEOMessageLink)initWithMessageLink:(id)a3
{
  v5 = (id *)a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOMessageLink;
  v6 = [(GEOMessageLink *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_messageLink, a3);
    if (v5)
    {
      -[GEOPDMessageLink _readTimezone]((uint64_t)v5);
      if (v5[8])
      {
        id v8 = objc_alloc(MEMORY[0x1E4F1CAF0]);
        -[GEOPDMessageLink timezone](v5);
        v9 = (id *)objc_claimAutoreleasedReturnValue();
        v10 = -[GEOTimezone identifier](v9);
        uint64_t v11 = [v8 initWithName:v10];
        timeZone = v7->_timeZone;
        v7->_timeZone = (NSTimeZone *)v11;
      }
    }
    if (!v7->_timeZone)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CAF0] localTimeZone];
      v14 = v7->_timeZone;
      v7->_timeZone = (NSTimeZone *)v13;
    }
    v15 = v7;
  }

  return v7;
}

- (NSString)messageID
{
  messageLink = self->_messageLink;
  if (messageLink && (-[GEOPDMessageLink _readMessageId]((uint64_t)self->_messageLink), messageLink->_messageId))
  {
    v4 = -[GEOPDMessageLink messageId]((id *)&self->_messageLink->super.super.isa);
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)messageURLString
{
  messageLink = self->_messageLink;
  if (messageLink && (-[GEOPDMessageLink _readMessageUrl]((uint64_t)self->_messageLink), messageLink->_messageUrl))
  {
    v4 = -[GEOPDMessageLink messageUrl]((id *)&self->_messageLink->super.super.isa);
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)navBackgroundColorString
{
  messageLink = self->_messageLink;
  if (messageLink
    && (-[GEOPDMessageLink _readNavBackgroundColor]((uint64_t)self->_messageLink), messageLink->_navBackgroundColor))
  {
    v4 = -[GEOPDMessageLink navBackgroundColor]((id *)&self->_messageLink->super.super.isa);
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)navTintColorString
{
  messageLink = self->_messageLink;
  if (messageLink && (-[GEOPDMessageLink _readNavTintColor]((uint64_t)self->_messageLink), messageLink->_navTintColor))
  {
    v4 = -[GEOPDMessageLink navTintColor]((id *)&self->_messageLink->super.super.isa);
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (BOOL)isVerified
{
  messageLink = self->_messageLink;
  return messageLink && (*(_WORD *)&messageLink->_flags & 2) != 0 && messageLink->_isVerified;
}

- (int)responseTime
{
  messageLink = self->_messageLink;
  if (messageLink && (*(_WORD *)&messageLink->_flags & 1) != 0) {
    return -[GEOPDMessageLink responseTime]((uint64_t)messageLink);
  }
  else {
    return 0;
  }
}

- (id)messageBusinessHours
{
  messageLink = self->_messageLink;
  if (messageLink
    && (-[GEOPDMessageLink _readHoursOfOperations]((uint64_t)self->_messageLink),
        [(NSMutableArray *)messageLink->_hoursOfOperations count]))
  {
    v4 = -[GEOPDMessageLink hoursOfOperations]((id *)&self->_messageLink->super.super.isa);
    v5 = [GEOBusinessHours alloc];
    v6 = [(GEOMessageLink *)self timeZone];
    v7 = [(GEOBusinessHours *)v5 initWithGEOPDHours:v4 timeZone:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);

  objc_storeStrong((id *)&self->_messageLink, 0);
}

@end
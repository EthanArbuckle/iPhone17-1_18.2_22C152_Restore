@interface IMParticipantChangeItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)unattributed;
- (IMParticipantChangeItem)initWithCoder:(id)a3;
- (IMParticipantChangeItem)initWithDictionary:(id)a3;
- (NSDate)timeRead;
- (NSDictionary)messageSummaryInfo;
- (NSString)otherCountryCode;
- (NSString)otherHandle;
- (NSString)otherUnformattedID;
- (NSUUID)activeTelephonyConversationUUID;
- (id)copyDictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)changeType;
- (unsigned)errorCode;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveTelephonyConversationUUID:(id)a3;
- (void)setChangeType:(int64_t)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setMessageSummaryInfo:(id)a3;
- (void)setOtherCountryCode:(id)a3;
- (void)setOtherHandle:(id)a3;
- (void)setOtherUnformattedID:(id)a3;
- (void)setTimeRead:(id)a3;
- (void)setUnattributed:(BOOL)a3;
@end

@implementation IMParticipantChangeItem

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMParticipantChangeItem;
  [(IMParticipantChangeItem *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IMParticipantChangeItem;
  id v5 = -[IMItem copyWithZone:](&v8, sel_copyWithZone_);
  objc_msgSend(v5, "setOtherUnformattedID:", -[IMParticipantChangeItem otherUnformattedID](self, "otherUnformattedID"));
  objc_msgSend(v5, "setOtherHandle:", -[IMParticipantChangeItem otherHandle](self, "otherHandle"));
  objc_msgSend(v5, "setOtherCountryCode:", -[IMParticipantChangeItem otherCountryCode](self, "otherCountryCode"));
  objc_msgSend(v5, "setChangeType:", -[IMParticipantChangeItem changeType](self, "changeType"));
  objc_msgSend(v5, "setActiveTelephonyConversationUUID:", -[IMParticipantChangeItem activeTelephonyConversationUUID](self, "activeTelephonyConversationUUID"));
  objc_msgSend(v5, "setErrorCode:", -[IMParticipantChangeItem errorCode](self, "errorCode"));
  objc_msgSend(v5, "setTimeRead:", -[IMParticipantChangeItem timeRead](self, "timeRead"));
  v6 = (void *)[(NSDictionary *)[(IMParticipantChangeItem *)self messageSummaryInfo] copyWithZone:a3];
  [v5 setMessageSummaryInfo:v6];

  return v5;
}

- (IMParticipantChangeItem)initWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)IMParticipantChangeItem;
  v4 = -[IMItem initWithCoder:](&v13, sel_initWithCoder_);
  if (v4)
  {
    -[IMParticipantChangeItem setOtherCountryCode:](v4, "setOtherCountryCode:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"otherCountryCode"]);
    -[IMParticipantChangeItem setOtherHandle:](v4, "setOtherHandle:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"otherHandle"]);
    -[IMParticipantChangeItem setOtherUnformattedID:](v4, "setOtherUnformattedID:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"otherUnformattedID"]);
    v4->_changeType = [a3 decodeInt64ForKey:@"changeType"];
    v4->_errorCode = [a3 decodeIntForKey:@"errorCode"];
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    -[IMParticipantChangeItem setMessageSummaryInfo:](v4, "setMessageSummaryInfo:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0), @"messageSummaryInfo"));
    [a3 decodeDoubleForKey:@"timeRead"];
    if (v11 > 10.0) {
      -[IMParticipantChangeItem setTimeRead:](v4, "setTimeRead:", objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:"));
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IMParticipantChangeItem;
  -[IMItem encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", -[IMParticipantChangeItem otherCountryCode](self, "otherCountryCode"), @"otherCountryCode");
  objc_msgSend(a3, "encodeObject:forKey:", -[IMParticipantChangeItem otherHandle](self, "otherHandle"), @"otherHandle");
  objc_msgSend(a3, "encodeObject:forKey:", -[IMParticipantChangeItem otherUnformattedID](self, "otherUnformattedID"), @"otherUnformattedID");
  [a3 encodeInt64:self->_changeType forKey:@"changeType"];
  [a3 encodeInt:self->_errorCode forKey:@"errorCode"];
  [a3 encodeObject:self->_messageSummaryInfo forKey:@"messageSummaryInfo"];
  [(NSDate *)self->_timeRead timeIntervalSinceReferenceDate];
  objc_msgSend(a3, "encodeDouble:forKey:", @"timeRead");
}

- (IMParticipantChangeItem)initWithDictionary:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IMParticipantChangeItem;
  v4 = -[IMItem initWithDictionary:](&v7, sel_initWithDictionary_);
  if (v4)
  {
    -[IMParticipantChangeItem setOtherCountryCode:](v4, "setOtherCountryCode:", [a3 objectForKey:@"otherCountryCode"]);
    -[IMParticipantChangeItem setOtherHandle:](v4, "setOtherHandle:", [a3 objectForKey:@"otherHandle"]);
    -[IMParticipantChangeItem setOtherUnformattedID:](v4, "setOtherUnformattedID:", [a3 objectForKey:@"otherUnformattedID"]);
    -[IMParticipantChangeItem setChangeType:](v4, "setChangeType:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"changeType"), "longLongValue"));
    -[IMParticipantChangeItem setErrorCode:](v4, "setErrorCode:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"errorCode"), "intValue"));
    -[IMParticipantChangeItem setMessageSummaryInfo:](v4, "setMessageSummaryInfo:", [a3 objectForKeyedSubscript:@"messageSummaryInfo"]);
    objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"timeRead"), "doubleValue");
    if (v5 > 10.0) {
      -[IMParticipantChangeItem setTimeRead:](v4, "setTimeRead:", objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:"));
    }
  }
  return v4;
}

- (id)copyDictionaryRepresentation
{
  v15.receiver = self;
  v15.super_class = (Class)IMParticipantChangeItem;
  objc_super v3 = [(IMItem *)&v15 copyDictionaryRepresentation];
  v4 = (void *)MEMORY[0x1A6228190]();
  otherCountryCode = self->_otherCountryCode;
  if (otherCountryCode) {
    CFDictionarySetValue(v3, @"otherCountryCode", otherCountryCode);
  }
  otherHandle = self->_otherHandle;
  if (otherHandle) {
    CFDictionarySetValue(v3, @"otherHandle", otherHandle);
  }
  otherUnformattedID = self->_otherUnformattedID;
  if (otherUnformattedID) {
    CFDictionarySetValue(v3, @"otherUnformattedID", otherUnformattedID);
  }
  uint64_t v8 = (const void *)[NSNumber numberWithLongLong:self->_changeType];
  if (v8) {
    CFDictionarySetValue(v3, @"changeType", v8);
  }
  uint64_t v9 = (const void *)[NSNumber numberWithUnsignedInt:self->_errorCode];
  if (v9) {
    CFDictionarySetValue(v3, @"errorCode", v9);
  }
  messageSummaryInfo = self->_messageSummaryInfo;
  if (messageSummaryInfo) {
    CFDictionarySetValue(v3, @"messageSummaryInfo", messageSummaryInfo);
  }
  timeRead = self->_timeRead;
  if (timeRead)
  {
    v12 = NSNumber;
    [(NSDate *)timeRead timeIntervalSinceReferenceDate];
    objc_super v13 = (const void *)objc_msgSend(v12, "numberWithDouble:");
    if (v13) {
      CFDictionarySetValue(v3, @"timeRead", v13);
    }
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    uint64_t v19 = v3;
    uint64_t v20 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18.receiver = self;
      v18.super_class = (Class)IMParticipantChangeItem;
      BOOL v7 = [(IMItem *)&v18 isEqual:a3];
      if (v7)
      {
        otherCountryCode = self->_otherCountryCode;
        if (otherCountryCode == (NSString *)[a3 otherCountryCode]
          || (BOOL v7 = -[NSString isEqualToString:](self->_otherCountryCode, "isEqualToString:", [a3 otherCountryCode])))
        {
          otherHandle = self->_otherHandle;
          if (otherHandle == (NSString *)[a3 otherHandle]
            || (BOOL v7 = -[NSString isEqualToString:](self->_otherHandle, "isEqualToString:", [a3 otherHandle])))
          {
            otherUnformattedID = self->_otherUnformattedID;
            if (otherUnformattedID == (NSString *)[a3 otherUnformattedID]
              || (BOOL v7 = -[NSString isEqualToString:](self->_otherUnformattedID, "isEqualToString:", [a3 otherUnformattedID])))
            {
              int64_t changeType = self->_changeType;
              if (changeType == [a3 changeType]
                && (activeTelephonyConversationUUID = self->_activeTelephonyConversationUUID,
                    activeTelephonyConversationUUID == (NSUUID *)[a3 activeTelephonyConversationUUID])
                && (unsigned int errorCode = self->_errorCode, errorCode == [a3 errorCode]))
              {
                messageSummaryInfo = self->_messageSummaryInfo;
                if (messageSummaryInfo == (NSDictionary *)[a3 messageSummaryInfo]
                  || (BOOL v7 = -[NSDictionary isEqualToDictionary:](self->_messageSummaryInfo, "isEqualToDictionary:", [a3 messageSummaryInfo])))
                {
                  timeRead = self->_timeRead;
                  LOBYTE(v7) = timeRead == (NSDate *)[a3 timeRead]
                            || -[NSDate isEqualToDate:](self->_timeRead, "isEqualToDate:", [a3 timeRead]);
                }
              }
              else
              {
                LOBYTE(v7) = 0;
              }
            }
          }
        }
      }
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)IMParticipantChangeItem;
      LOBYTE(v7) = [(IMItem *)&v17 isEqual:a3];
    }
  }
  return v7;
}

- (BOOL)unattributed
{
  id v2 = [(NSDictionary *)self->_messageSummaryInfo objectForKeyedSubscript:@"uat"];

  return [v2 BOOLValue];
}

- (void)setUnattributed:(BOOL)a3
{
  id v5 = (id)[(NSDictionary *)self->_messageSummaryInfo mutableCopy];
  if (!v5) {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v8 = v5;
  if (a3)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"uat");
  }
  else
  {
    uint64_t v6 = [v5 count];
    BOOL v7 = v8;
    if (!v6) {
      goto LABEL_8;
    }
    [v8 removeObjectForKey:@"uat"];
  }
  uint64_t v6 = -[IMParticipantChangeItem setMessageSummaryInfo:](self, "setMessageSummaryInfo:", (id)[v8 copy]);
  BOOL v7 = v8;
LABEL_8:

  MEMORY[0x1F41817F8](v6, v7);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)IMParticipantChangeItem;
  return (id)[NSString stringWithFormat:@"[%@ timeRead: %@]", -[IMItem description](&v3, sel_description), -[IMParticipantChangeItem timeRead](self, "timeRead")];
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int64_t)a3
{
  self->_int64_t changeType = a3;
}

- (NSString)otherCountryCode
{
  return self->_otherCountryCode;
}

- (void)setOtherCountryCode:(id)a3
{
}

- (NSString)otherHandle
{
  return self->_otherHandle;
}

- (void)setOtherHandle:(id)a3
{
}

- (NSString)otherUnformattedID
{
  return self->_otherUnformattedID;
}

- (void)setOtherUnformattedID:(id)a3
{
}

- (NSUUID)activeTelephonyConversationUUID
{
  return self->_activeTelephonyConversationUUID;
}

- (void)setActiveTelephonyConversationUUID:(id)a3
{
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(unsigned int)a3
{
  self->_unsigned int errorCode = a3;
}

- (NSDictionary)messageSummaryInfo
{
  return self->_messageSummaryInfo;
}

- (void)setMessageSummaryInfo:(id)a3
{
}

- (NSDate)timeRead
{
  return self->_timeRead;
}

- (void)setTimeRead:(id)a3
{
}

@end
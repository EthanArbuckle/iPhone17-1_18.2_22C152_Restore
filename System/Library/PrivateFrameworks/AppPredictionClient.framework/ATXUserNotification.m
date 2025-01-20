@interface ATXUserNotification
+ (BOOL)supportsSecureCoding;
- (ATXSharedDigestEngagementTrackingMetrics)digestEngagementTrackingMetrics;
- (ATXUserNotification)initWithCoder:(id)a3;
- (ATXUserNotification)initWithProto:(id)a3;
- (ATXUserNotification)initWithProtoData:(id)a3;
- (ATXUserNotification)initWithUUID:(id)a3 timestamp:(double)a4;
- (ATXUserNotificationDerivedData)derivedData;
- (BOOL)hasPreviewableAttachment;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXUserNotification:(id)a3;
- (BOOL)isGroupMessage;
- (BOOL)isMessage;
- (BOOL)isNotificationSummaryEnabled;
- (BOOL)isPartOfStack;
- (BOOL)isPriorityNotificationEnabled;
- (BOOL)isStackSummary;
- (BOOL)isSummarized;
- (NSArray)contactIDs;
- (NSArray)rawIdentifiers;
- (NSData)userInfo;
- (NSDate)recordDate;
- (NSString)body;
- (NSString)bundleID;
- (NSString)categoryID;
- (NSString)notificationID;
- (NSString)sectionID;
- (NSString)subtitle;
- (NSString)summary;
- (NSString)threadID;
- (NSString)title;
- (NSUUID)uuid;
- (double)appSpecifiedScore;
- (double)finalDigestScoreForMode:(id)a3;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)digestRankingHardcodedComparisonValue;
- (id)encodeAsProto;
- (id)groupId;
- (id)initFromJSON:(id)a3;
- (id)initFromNotificationData:(id)a3 date:(id)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 bundleID:(id)a8 threadID:(id)a9 categoryID:(id)a10;
- (id)initFromNotificationData:(id)a3 timestamp:(double)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 badge:(unint64_t)a8 userInfo:(id)a9 bundleID:(id)a10 threadID:(id)a11 categoryID:(id)a12 derivedData:(id)a13;
- (id)initFromNotificationData:(id)a3 timestamp:(double)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 badge:(unint64_t)a8 userInfo:(id)a9 bundleID:(id)a10 threadID:(id)a11 categoryID:(id)a12 sectionID:(id)a13 contactIDs:(id)a14 isGroupMessage:(BOOL)a15 derivedData:(id)a16;
- (id)initFromNotificationData:(id)a3 timestamp:(double)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 badge:(unint64_t)a8 userInfo:(id)a9 bundleID:(id)a10 threadID:(id)a11 categoryID:(id)a12 sectionID:(id)a13 contactIDs:(id)a14 isGroupMessage:(BOOL)a15 derivedData:(id)a16 urgency:(int64_t)a17;
- (id)initFromNotificationData:(id)a3 timestamp:(double)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 badge:(unint64_t)a8 userInfo:(id)a9 bundleID:(id)a10 threadID:(id)a11 categoryID:(id)a12 sectionID:(id)a13 contactIDs:(id)a14 rawIdentifiers:(id)a15 isGroupMessage:(BOOL)a16 derivedData:(id)a17 urgency:(int64_t)a18;
- (id)initFromNotificationData:(id)a3 timestamp:(double)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 badge:(unint64_t)a8 userInfo:(id)a9 bundleID:(id)a10 threadID:(id)a11 derivedData:(id)a12;
- (id)initFromNotificationData:(id)a3 timestamp:(double)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 badge:(unint64_t)a8 userInfo:(id)a9 bundleID:(id)a10 threadID:(id)a11 sectionID:(id)a12 contactIDs:(id)a13 isGroupMessage:(BOOL)a14 derivedData:(id)a15 urgency:(int64_t)a16;
- (id)jsonRepresentation;
- (id)proto;
- (int64_t)attachmentType;
- (int64_t)compareForDigestRanking:(id)a3;
- (int64_t)urgency;
- (unint64_t)badge;
- (unint64_t)bodyLength;
- (unint64_t)numberOfNotificationsInStack;
- (unint64_t)positionInStack;
- (unint64_t)priorityStatus;
- (unint64_t)subtitleLength;
- (unint64_t)summaryLength;
- (unint64_t)summaryStatus;
- (unint64_t)titleLength;
- (void)encodeWithCoder:(id)a3;
- (void)setAppSpecifiedScore:(double)a3;
- (void)setAttachmentType:(int64_t)a3;
- (void)setBadge:(unint64_t)a3;
- (void)setBody:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCategoryID:(id)a3;
- (void)setContactIDs:(id)a3;
- (void)setDerivedData:(id)a3;
- (void)setDigestEngagementTrackingMetrics:(id)a3;
- (void)setIsGroupMessage:(BOOL)a3;
- (void)setIsMessage:(BOOL)a3;
- (void)setIsNotificationSummaryEnabled:(BOOL)a3;
- (void)setIsPartOfStack:(BOOL)a3;
- (void)setIsPriorityNotificationEnabled:(BOOL)a3;
- (void)setIsStackSummary:(BOOL)a3;
- (void)setIsSummarized:(BOOL)a3;
- (void)setNotificationID:(id)a3;
- (void)setNumberOfNotificationsInStack:(unint64_t)a3;
- (void)setPositionInStack:(unint64_t)a3;
- (void)setPriorityStatus:(unint64_t)a3;
- (void)setRawIdentifiers:(id)a3;
- (void)setRecordDate:(id)a3;
- (void)setSectionID:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSummary:(id)a3;
- (void)setSummaryStatus:(unint64_t)a3;
- (void)setThreadID:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setTitle:(id)a3;
- (void)setUrgency:(int64_t)a3;
- (void)setUserInfo:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation ATXUserNotification

- (ATXUserNotification)initWithUUID:(id)a3 timestamp:(double)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXUserNotification;
  v7 = [(ATXUserNotification *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v8;

    v7->_timestamp = a4;
    uint64_t v10 = objc_opt_new();
    derivedData = v7->_derivedData;
    v7->_derivedData = (ATXUserNotificationDerivedData *)v10;
  }
  return v7;
}

- (id)initFromNotificationData:(id)a3 timestamp:(double)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 badge:(unint64_t)a8 userInfo:(id)a9 bundleID:(id)a10 threadID:(id)a11 categoryID:(id)a12 sectionID:(id)a13 contactIDs:(id)a14 rawIdentifiers:(id)a15 isGroupMessage:(BOOL)a16 derivedData:(id)a17 urgency:(int64_t)a18
{
  id v62 = a3;
  id v61 = a5;
  id v60 = a6;
  id v23 = a7;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a12;
  id v28 = a13;
  id v29 = a14;
  id v30 = a15;
  id v31 = a17;
  v63.receiver = self;
  v63.super_class = (Class)ATXUserNotification;
  v32 = [(ATXUserNotification *)&v63 init];
  if (v32)
  {
    uint64_t v33 = [v62 copy];
    uuid = v32->_uuid;
    v32->_uuid = (NSUUID *)v33;

    v32->_timestamp = a4;
    uint64_t v35 = [v61 copy];
    title = v32->_title;
    v32->_title = (NSString *)v35;

    uint64_t v37 = [v60 copy];
    subtitle = v32->_subtitle;
    v32->_subtitle = (NSString *)v37;

    uint64_t v39 = [v23 copy];
    body = v32->_body;
    v32->_body = (NSString *)v39;

    v32->_badge = a8;
    uint64_t v41 = [v24 copy];
    userInfo = v32->_userInfo;
    v32->_userInfo = (NSData *)v41;

    uint64_t v43 = [v25 copy];
    bundleID = v32->_bundleID;
    v32->_bundleID = (NSString *)v43;

    uint64_t v45 = [v26 copy];
    threadID = v32->_threadID;
    v32->_threadID = (NSString *)v45;

    uint64_t v47 = [v27 copy];
    categoryID = v32->_categoryID;
    v32->_categoryID = (NSString *)v47;

    uint64_t v49 = [v28 copy];
    sectionID = v32->_sectionID;
    v32->_sectionID = (NSString *)v49;

    uint64_t v51 = [v29 copy];
    contactIDs = v32->_contactIDs;
    v32->_contactIDs = (NSArray *)v51;

    uint64_t v53 = [v30 copy];
    rawIdentifiers = v32->_rawIdentifiers;
    v32->_rawIdentifiers = (NSArray *)v53;

    v32->_isGroupMessage = a16;
    v32->_urgency = a18;
    if (v31) {
      uint64_t v55 = [v31 copy];
    }
    else {
      uint64_t v55 = objc_opt_new();
    }
    derivedData = v32->_derivedData;
    v32->_derivedData = (ATXUserNotificationDerivedData *)v55;
  }
  return v32;
}

- (id)initFromNotificationData:(id)a3 timestamp:(double)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 badge:(unint64_t)a8 userInfo:(id)a9 bundleID:(id)a10 threadID:(id)a11 categoryID:(id)a12 sectionID:(id)a13 contactIDs:(id)a14 isGroupMessage:(BOOL)a15 derivedData:(id)a16 urgency:(int64_t)a17
{
  if (a4 == 0.0)
  {
    uint64_t v45 = (void *)MEMORY[0x1E4F1C9C8];
    id v43 = a16;
    id v22 = a14;
    id v42 = a13;
    id v23 = a11;
    id v24 = a10;
    id v25 = a9;
    id v26 = a7;
    id v27 = a6;
    id v28 = a5;
    id v29 = a3;
    v46 = [v45 now];
    [v46 timeIntervalSinceReferenceDate];
    LOBYTE(v41) = a15;
    id v50 = -[ATXUserNotification initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:rawIdentifiers:isGroupMessage:derivedData:urgency:](self, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:rawIdentifiers:isGroupMessage:derivedData:urgency:", v29, v28, v27, v26, a8, v25, v24, v23, 0, v42, v22, 0, v41, v43, a17);

    id v30 = v50;
  }
  else
  {
    id v47 = a16;
    id v32 = a14;
    id v44 = a13;
    id v33 = a11;
    id v34 = a10;
    id v35 = a9;
    id v36 = a7;
    id v37 = a6;
    id v38 = a5;
    id v39 = a3;
    LOBYTE(v41) = a15;
    id v51 = [(ATXUserNotification *)self initFromNotificationData:v39 timestamp:v38 title:v37 subtitle:v36 body:a8 badge:v35 userInfo:a4 bundleID:v34 threadID:v33 categoryID:0 sectionID:v44 contactIDs:v32 rawIdentifiers:0 isGroupMessage:v41 derivedData:v47 urgency:a17];

    id v30 = v51;
  }

  return v30;
}

- (id)initFromNotificationData:(id)a3 timestamp:(double)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 badge:(unint64_t)a8 userInfo:(id)a9 bundleID:(id)a10 threadID:(id)a11 sectionID:(id)a12 contactIDs:(id)a13 isGroupMessage:(BOOL)a14 derivedData:(id)a15 urgency:(int64_t)a16
{
  if (a4 == 0.0)
  {
    id v44 = (void *)MEMORY[0x1E4F1C9C8];
    id v42 = a15;
    id v21 = a13;
    id v41 = a12;
    id v40 = a11;
    id v22 = a10;
    id v23 = a9;
    id v24 = a7;
    id v25 = a6;
    id v26 = a5;
    id v27 = a3;
    uint64_t v45 = [v44 now];
    [v45 timeIntervalSinceReferenceDate];
    LOBYTE(v39) = a14;
    id v49 = -[ATXUserNotification initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:urgency:](self, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:urgency:", v27, v26, v25, v24, a8, v23, v22, v40, 0, v41, v21, v39, v42, a16);

    id v28 = v49;
  }
  else
  {
    id v46 = a15;
    id v30 = a13;
    id v43 = a12;
    id v31 = a11;
    id v32 = a10;
    id v33 = a9;
    id v34 = a7;
    id v35 = a6;
    id v36 = a5;
    id v37 = a3;
    LOBYTE(v39) = a14;
    id v50 = [(ATXUserNotification *)self initFromNotificationData:v37 timestamp:v36 title:v35 subtitle:v34 body:a8 badge:v33 userInfo:a4 bundleID:v32 threadID:v31 categoryID:0 sectionID:v43 contactIDs:v30 isGroupMessage:v39 derivedData:v46 urgency:a16];

    id v28 = v50;
  }

  return v28;
}

- (id)initFromNotificationData:(id)a3 timestamp:(double)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 badge:(unint64_t)a8 userInfo:(id)a9 bundleID:(id)a10 threadID:(id)a11 categoryID:(id)a12 sectionID:(id)a13 contactIDs:(id)a14 isGroupMessage:(BOOL)a15 derivedData:(id)a16
{
  if (a4 == 0.0)
  {
    id v41 = (void *)MEMORY[0x1E4F1C9C8];
    id v43 = a16;
    id v19 = a14;
    id v20 = a13;
    id v39 = a12;
    id v21 = a5;
    id v22 = a11;
    id v23 = a10;
    id v37 = a9;
    id v24 = a7;
    id v25 = a6;
    id v46 = v21;
    id v26 = a3;
    id v49 = [v41 now];
    [v49 timeIntervalSinceReferenceDate];
    LOBYTE(v36) = a15;
    id v52 = -[ATXUserNotification initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:urgency:](self, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:urgency:", v26, v46, v25, v24, a8, v37, v23, v22, v39, v20, v19, v36, v43, 4);

    id v27 = v52;
  }
  else
  {
    id v44 = a16;
    id v29 = a14;
    id v30 = a13;
    id v42 = a12;
    id v40 = a11;
    id v31 = a10;
    id v38 = a9;
    id v32 = a7;
    id v47 = a6;
    id v33 = a5;
    id v34 = a3;
    LOBYTE(v36) = a15;
    id v53 = [(ATXUserNotification *)self initFromNotificationData:v34 timestamp:v33 title:v47 subtitle:v32 body:a8 badge:v38 userInfo:a4 bundleID:v31 threadID:v40 categoryID:v42 sectionID:v30 contactIDs:v29 isGroupMessage:v36 derivedData:v44 urgency:4];

    id v27 = v53;
  }

  return v27;
}

- (id)initFromNotificationData:(id)a3 date:(id)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 bundleID:(id)a8 threadID:(id)a9 categoryID:(id)a10
{
  id v15 = a4;
  v16 = (objc_class *)MEMORY[0x1E4F29128];
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a3;
  id v24 = (void *)[[v16 alloc] initWithUUIDString:v23];

  id v25 = v15;
  if (v15)
  {
    [v15 timeIntervalSinceReferenceDate];
    LOBYTE(v31) = 0;
    id v26 = -[ATXUserNotification initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:](self, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:", v24, v22, v21, v20, 0, 0, v19, v18, v17, 0, 0, v31, 0);

    id v27 = v26;
  }
  else
  {
    id v28 = [MEMORY[0x1E4F1C9C8] now];
    [v28 timeIntervalSinceReferenceDate];
    LOBYTE(v31) = 0;
    id v29 = -[ATXUserNotification initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:](self, "initFromNotificationData:timestamp:title:subtitle:body:badge:userInfo:bundleID:threadID:categoryID:sectionID:contactIDs:isGroupMessage:derivedData:", v24, v22, v21, v20, 0, 0, v19, v18, v17, 0, 0, v31, 0);

    id v27 = v29;
  }

  return v27;
}

- (id)initFromNotificationData:(id)a3 timestamp:(double)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 badge:(unint64_t)a8 userInfo:(id)a9 bundleID:(id)a10 threadID:(id)a11 derivedData:(id)a12
{
  LOBYTE(v13) = 0;
  return [(ATXUserNotification *)self initFromNotificationData:a3 timestamp:a5 title:a6 subtitle:a7 body:0 badge:0 userInfo:a4 bundleID:a10 threadID:a11 categoryID:0 sectionID:0 contactIDs:0 isGroupMessage:v13 derivedData:a12];
}

- (id)initFromNotificationData:(id)a3 timestamp:(double)a4 title:(id)a5 subtitle:(id)a6 body:(id)a7 badge:(unint64_t)a8 userInfo:(id)a9 bundleID:(id)a10 threadID:(id)a11 categoryID:(id)a12 derivedData:(id)a13
{
  LOBYTE(v14) = 0;
  return [(ATXUserNotification *)self initFromNotificationData:a3 timestamp:a5 title:a6 subtitle:a7 body:0 badge:0 userInfo:a4 bundleID:a10 threadID:a11 categoryID:a12 sectionID:0 contactIDs:0 isGroupMessage:v14 derivedData:a13];
}

- (id)digestRankingHardcodedComparisonValue
{
  return (id)[NSNumber numberWithUnsignedInteger:0];
}

- (int64_t)compareForDigestRanking:(id)a3
{
  id v4 = a3;
  v5 = [(ATXUserNotification *)self digestRankingHardcodedComparisonValue];
  id v6 = [v4 digestRankingHardcodedComparisonValue];
  int64_t v7 = [v5 compare:v6];

  if (!v7)
  {
    uint64_t v8 = NSNumber;
    [(ATXUserNotification *)self appSpecifiedScore];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    uint64_t v10 = NSNumber;
    [v4 appSpecifiedScore];
    v11 = objc_msgSend(v10, "numberWithDouble:");
    int64_t v7 = [v9 compare:v11];

    if (!v7)
    {
      v12 = NSNumber;
      [(ATXUserNotification *)self timestamp];
      uint64_t v13 = objc_msgSend(v12, "numberWithDouble:");
      uint64_t v14 = NSNumber;
      [v4 timestamp];
      id v15 = objc_msgSend(v14, "numberWithDouble:");
      int64_t v7 = [v13 compare:v15];
    }
  }

  return v7;
}

- (unint64_t)titleLength
{
  return [(NSString *)self->_title length];
}

- (unint64_t)subtitleLength
{
  return [(NSString *)self->_subtitle length];
}

- (unint64_t)bodyLength
{
  return [(NSString *)self->_body length];
}

- (unint64_t)summaryLength
{
  return [(NSString *)self->_summary length];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXUserNotification *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXUserNotification *)self isEqualToATXUserNotification:v5];

  return v6;
}

- (BOOL)isEqualToATXUserNotification:(id)a3
{
  id v4 = (id *)a3;
  uuid = self->_uuid;
  BOOL v6 = (NSUUID *)v4[3];
  if (uuid == v6)
  {
  }
  else
  {
    int64_t v7 = v6;
    uint64_t v8 = uuid;
    char v9 = [(NSUUID *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_53;
    }
  }
  title = self->_title;
  v11 = (NSString *)v4[6];
  if (title == v11)
  {
  }
  else
  {
    v12 = v11;
    uint64_t v13 = title;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_53;
    }
  }
  subtitle = self->_subtitle;
  v16 = (NSString *)v4[7];
  if (subtitle == v16)
  {
  }
  else
  {
    id v17 = v16;
    id v18 = subtitle;
    char v19 = [(NSString *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_53;
    }
  }
  body = self->_body;
  id v21 = (NSString *)v4[8];
  if (body == v21)
  {
  }
  else
  {
    id v22 = v21;
    id v23 = body;
    char v24 = [(NSString *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_53;
    }
  }
  if (self->_badge != v4[9]) {
    goto LABEL_53;
  }
  userInfo = self->_userInfo;
  id v26 = (NSData *)v4[10];
  if (userInfo == v26)
  {
  }
  else
  {
    id v27 = v26;
    id v28 = userInfo;
    char v29 = [(NSData *)v28 isEqual:v27];

    if ((v29 & 1) == 0) {
      goto LABEL_53;
    }
  }
  bundleID = self->_bundleID;
  uint64_t v31 = (NSString *)v4[11];
  if (bundleID == v31)
  {
  }
  else
  {
    id v32 = v31;
    id v33 = bundleID;
    char v34 = [(NSString *)v33 isEqual:v32];

    if ((v34 & 1) == 0) {
      goto LABEL_53;
    }
  }
  threadID = self->_threadID;
  uint64_t v36 = (NSString *)v4[12];
  if (threadID == v36)
  {
  }
  else
  {
    id v37 = v36;
    id v38 = threadID;
    char v39 = [(NSString *)v38 isEqual:v37];

    if ((v39 & 1) == 0) {
      goto LABEL_53;
    }
  }
  categoryID = self->_categoryID;
  id v41 = (NSString *)v4[13];
  if (categoryID == v41)
  {
  }
  else
  {
    id v42 = v41;
    id v43 = categoryID;
    char v44 = [(NSString *)v43 isEqual:v42];

    if ((v44 & 1) == 0) {
      goto LABEL_53;
    }
  }
  sectionID = self->_sectionID;
  id v46 = (NSString *)v4[14];
  if (sectionID == v46)
  {
  }
  else
  {
    id v47 = v46;
    v48 = sectionID;
    char v49 = [(NSString *)v48 isEqual:v47];

    if ((v49 & 1) == 0) {
      goto LABEL_53;
    }
  }
  contactIDs = self->_contactIDs;
  id v51 = (NSArray *)v4[15];
  if (contactIDs == v51)
  {
  }
  else
  {
    id v52 = v51;
    id v53 = contactIDs;
    char v54 = [(NSArray *)v53 isEqual:v52];

    if ((v54 & 1) == 0) {
      goto LABEL_53;
    }
  }
  rawIdentifiers = self->_rawIdentifiers;
  v56 = (NSArray *)v4[16];
  if (rawIdentifiers == v56)
  {
  }
  else
  {
    v57 = v56;
    v58 = rawIdentifiers;
    char v59 = [(NSArray *)v58 isEqual:v57];

    if ((v59 & 1) == 0) {
      goto LABEL_53;
    }
  }
  if (self->_isGroupMessage != *((unsigned __int8 *)v4 + 9))
  {
LABEL_53:
    char v70 = 0;
    goto LABEL_54;
  }
  derivedData = self->_derivedData;
  id v61 = (ATXUserNotificationDerivedData *)v4[20];
  if (derivedData == v61)
  {
  }
  else
  {
    id v62 = v61;
    objc_super v63 = derivedData;
    BOOL v64 = [(ATXUserNotificationDerivedData *)v63 isEqual:v62];

    if (!v64) {
      goto LABEL_53;
    }
  }
  recordDate = self->_recordDate;
  v66 = (NSDate *)v4[4];
  if (recordDate == v66)
  {
  }
  else
  {
    v67 = v66;
    v68 = recordDate;
    char v69 = [(NSDate *)v68 isEqual:v67];

    if ((v69 & 1) == 0) {
      goto LABEL_53;
    }
  }
  v72 = self->_notificationID;
  v73 = v72;
  if (v72 == v4[5]) {
    char v70 = 1;
  }
  else {
    char v70 = -[NSString isEqual:](v72, "isEqual:");
  }

LABEL_54:
  return v70;
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"User notification: {uuid: %@},  {bundle-id: %@},  {thread-id: %@},  {category-id: %@},  {section-id: %@},  {contact-ids: %@},  {is group message: %d},  {title: %@},  {subtitle: %@},  {body: %@},  {is part of stack: %d},  {number of notifications in Stack: %d}  {is summarized: %d},  {summary: %@},  {is stack summary: %d},  {priority status: %d},  {summary status: %d},  {is priority notification enabled: %d},  {is notification summary enabled: %d},  {title length: %d},  {subtitle length: %d},  {body length: %d},  {summary length: %d},  ", self->_uuid, self->_bundleID, self->_threadID, self->_categoryID, self->_sectionID, self->_contactIDs, self->_isGroupMessage, self->_title, self->_subtitle, self->_body, self->_isPartOfStack, self->_numberOfNotificationsInStack, self->_isSummarized, self->_summary, self->_isStackSummary, self->_priorityStatus,
                 self->_summaryStatus,
                 self->_isPriorityNotificationEnabled,
                 self->_isNotificationSummaryEnabled,
                 [(NSString *)self->_title length],
                 [(NSString *)self->_subtitle length],
                 [(NSString *)self->_body length],
                 [(NSString *)self->_summary length]);

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ATXUserNotification allocWithZone:a3];
  LOBYTE(v12) = self->_isGroupMessage;
  id v5 = [(ATXUserNotification *)v4 initFromNotificationData:self->_uuid timestamp:self->_title title:self->_subtitle subtitle:self->_body body:self->_badge badge:self->_userInfo userInfo:self->_timestamp bundleID:self->_bundleID threadID:self->_threadID categoryID:self->_categoryID sectionID:self->_sectionID contactIDs:self->_contactIDs rawIdentifiers:self->_rawIdentifiers isGroupMessage:v12 derivedData:self->_derivedData urgency:self->_urgency];
  objc_msgSend(v5, "setIsMessage:", -[ATXUserNotification isMessage](self, "isMessage"));
  BOOL v6 = [(ATXUserNotification *)self summary];
  [v5 setSummary:v6];

  objc_msgSend(v5, "setIsSummarized:", -[ATXUserNotification isSummarized](self, "isSummarized"));
  objc_msgSend(v5, "setIsPartOfStack:", -[ATXUserNotification isPartOfStack](self, "isPartOfStack"));
  objc_msgSend(v5, "setIsStackSummary:", -[ATXUserNotification isStackSummary](self, "isStackSummary"));
  objc_msgSend(v5, "setPositionInStack:", -[ATXUserNotification positionInStack](self, "positionInStack"));
  objc_msgSend(v5, "setNumberOfNotificationsInStack:", -[ATXUserNotification numberOfNotificationsInStack](self, "numberOfNotificationsInStack"));
  objc_msgSend(v5, "setAttachmentType:", -[ATXUserNotification attachmentType](self, "attachmentType"));
  [(ATXUserNotification *)self appSpecifiedScore];
  objc_msgSend(v5, "setAppSpecifiedScore:");
  int64_t v7 = [(ATXUserNotification *)self digestEngagementTrackingMetrics];
  uint64_t v8 = (void *)[v7 copy];
  [v5 setDigestEngagementTrackingMetrics:v8];

  char v9 = [(ATXUserNotification *)self recordDate];
  [v5 setRecordDate:v9];

  uint64_t v10 = [(ATXUserNotification *)self notificationID];
  [v5 setNotificationID:v10];

  objc_msgSend(v5, "setPriorityStatus:", -[ATXUserNotification priorityStatus](self, "priorityStatus"));
  objc_msgSend(v5, "setSummaryStatus:", -[ATXUserNotification summaryStatus](self, "summaryStatus"));
  objc_msgSend(v5, "setIsPriorityNotificationEnabled:", -[ATXUserNotification isPriorityNotificationEnabled](self, "isPriorityNotificationEnabled"));
  objc_msgSend(v5, "setIsNotificationSummaryEnabled:", -[ATXUserNotification isNotificationSummaryEnabled](self, "isNotificationSummaryEnabled"));
  return v5;
}

- (double)finalDigestScoreForMode:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  [v5 getDigestScoreForNotification:self modeId:v4];
  double v7 = v6;

  return v7;
}

- (id)groupId
{
  threadID = self->_threadID;
  if (threadID || (threadID = self->_bundleID) != 0)
  {
    v3 = threadID;
  }
  else
  {
    v3 = [(NSUUID *)self->_uuid UUIDString];
  }

  return v3;
}

- (BOOL)hasPreviewableAttachment
{
  return (([(ATXUserNotification *)self attachmentType] - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXPBUserNotification alloc] initFromJSON:v4];

  double v6 = [(ATXUserNotification *)self initWithProto:v5];
  return v6;
}

- (id)jsonRepresentation
{
  v2 = [(ATXUserNotification *)self proto];
  v3 = [v2 jsonRepresentation];

  return v3;
}

- (ATXUserNotification)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBUserNotification alloc] initWithData:v4];

    self = [(ATXUserNotification *)self initWithProto:v5];
    double v6 = self;
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXUserNotification *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXUserNotification)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXMissedNotificationRanking initWithProto:]();
      }
      uint64_t v12 = 0;
      goto LABEL_25;
    }
    id v43 = v4;
    id v5 = v4;
    double v6 = [v5 derivedData];

    if (v6)
    {
      double v7 = [v5 derivedData];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        char v9 = [ATXUserNotificationDerivedData alloc];
        uint64_t v10 = [v5 derivedData];
        v11 = [(ATXUserNotificationDerivedData *)v9 initWithProto:v10];

LABEL_14:
        id v14 = objc_alloc(MEMORY[0x1E4F29128]);
        id v42 = [v5 uuid];
        id v41 = (void *)[v14 initWithUUIDString:v42];
        [v5 timestamp];
        double v16 = v15;
        id v38 = [v5 title];
        id v40 = [v5 subtitle];
        char v39 = [v5 body];
        uint64_t v37 = [v5 badge];
        uint64_t v36 = [v5 userInfo];
        id v35 = [v5 bundleID];
        char v34 = [v5 threadID];
        id v33 = [v5 categoryID];
        id v17 = [v5 sectionID];
        id v18 = [v5 contactIDs];
        char v19 = [v5 rawIdentifiers];
        LOBYTE(v32) = [v5 isGroupMessage];
        id v20 = [(ATXUserNotification *)self initFromNotificationData:v41 timestamp:v38 title:v40 subtitle:v39 body:v37 badge:v36 userInfo:v16 bundleID:v35 threadID:v34 categoryID:v33 sectionID:v17 contactIDs:v18 rawIdentifiers:v19 isGroupMessage:v32 derivedData:v11 urgency:(int)[v5 urgency]];

        objc_msgSend(v20, "setIsMessage:", -[NSObject isMessage](v5, "isMessage"));
        id v21 = [v5 summary];
        [v20 setSummary:v21];

        objc_msgSend(v20, "setIsSummarized:", -[NSObject isSummarized](v5, "isSummarized"));
        objc_msgSend(v20, "setIsPartOfStack:", -[NSObject isPartOfStack](v5, "isPartOfStack"));
        objc_msgSend(v20, "setIsStackSummary:", -[NSObject isStackSummary](v5, "isStackSummary"));
        objc_msgSend(v20, "setPositionInStack:", -[NSObject positionInStack](v5, "positionInStack"));
        objc_msgSend(v20, "setNumberOfNotificationsInStack:", -[NSObject numberOfNotificationsInStack](v5, "numberOfNotificationsInStack"));
        objc_msgSend(v20, "setAttachmentType:", (int)-[NSObject attachmentType](v5, "attachmentType"));
        [v5 appSpecifiedScore];
        objc_msgSend(v20, "setAppSpecifiedScore:");
        objc_msgSend(v20, "setPriorityStatus:", (int)-[NSObject priorityStatus](v5, "priorityStatus"));
        objc_msgSend(v20, "setSummaryStatus:", (int)-[NSObject summaryStatus](v5, "summaryStatus"));
        objc_msgSend(v20, "setIsPriorityNotificationEnabled:", -[NSObject isPriorityNotificationEnabled](v5, "isPriorityNotificationEnabled"));
        objc_msgSend(v20, "setIsNotificationSummaryEnabled:", -[NSObject isNotificationSummaryEnabled](v5, "isNotificationSummaryEnabled"));
        id v22 = [v5 sharedEngagementTracker];

        if (v22)
        {
          id v23 = [v5 sharedEngagementTracker];
          objc_opt_class();
          char v24 = objc_opt_isKindOfClass();

          if (v24)
          {
            id v25 = [ATXSharedDigestEngagementTrackingMetrics alloc];
            id v26 = [v5 sharedEngagementTracker];
            id v27 = [(ATXSharedDigestEngagementTrackingMetrics *)v25 initWithProto:v26];
            [v20 setDigestEngagementTrackingMetrics:v27];
          }
          else
          {
            id v26 = __atxlog_handle_notification_management();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
              -[ATXMissedNotificationRanking initWithProto:]();
            }
          }
        }
        if ([v5 hasRecordTimestamp])
        {
          id v28 = (void *)MEMORY[0x1E4F1C9C8];
          [v5 recordTimestamp];
          char v29 = objc_msgSend(v28, "dateWithTimeIntervalSinceReferenceDate:");
          [v20 setRecordDate:v29];
        }
        id v4 = v43;
        if ([v5 hasNotificationID])
        {
          id v30 = [v5 notificationID];
          [v20 setNotificationID:v30];
        }
        self = (ATXUserNotification *)v20;

        uint64_t v12 = self;
LABEL_25:

        goto LABEL_26;
      }
      uint64_t v13 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[ATXMissedNotificationRanking initWithProto:]();
      }
    }
    v11 = 0;
    goto LABEL_14;
  }
  uint64_t v12 = 0;
LABEL_26:

  return v12;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(NSUUID *)self->_uuid UUIDString];
  [v3 setUuid:v4];

  [v3 setTimestamp:self->_timestamp];
  [v3 setTitle:self->_title];
  [v3 setSubtitle:self->_subtitle];
  [v3 setBody:self->_body];
  [v3 setBadge:self->_badge];
  [v3 setUserInfo:self->_userInfo];
  [v3 setBundleID:self->_bundleID];
  [v3 setThreadID:self->_threadID];
  [v3 setCategoryID:self->_categoryID];
  [v3 setSectionID:self->_sectionID];
  id v5 = (void *)[(NSArray *)self->_contactIDs mutableCopy];
  [v3 setContactIDs:v5];

  double v6 = (void *)[(NSArray *)self->_rawIdentifiers mutableCopy];
  [v3 setRawIdentifiers:v6];

  [v3 setIsMessage:self->_isMessage];
  [v3 setSummary:self->_summary];
  [v3 setIsSummarized:self->_isSummarized];
  [v3 setIsPartOfStack:self->_isPartOfStack];
  [v3 setIsStackSummary:self->_isStackSummary];
  [v3 setPositionInStack:self->_positionInStack];
  [v3 setNumberOfNotificationsInStack:self->_numberOfNotificationsInStack];
  [v3 setPriorityStatus:LODWORD(self->_priorityStatus)];
  [v3 setSummaryStatus:LODWORD(self->_summaryStatus)];
  [v3 setIsPriorityNotificationEnabled:self->_isPriorityNotificationEnabled];
  [v3 setIsNotificationSummaryEnabled:self->_isNotificationSummaryEnabled];
  [v3 setIsGroupMessage:self->_isGroupMessage];
  double v7 = [(ATXUserNotificationDerivedData *)self->_derivedData proto];
  [v3 setDerivedData:v7];

  [v3 setUrgency:LODWORD(self->_urgency)];
  [v3 setAttachmentType:LODWORD(self->_attachmentType)];
  [(ATXUserNotification *)self appSpecifiedScore];
  objc_msgSend(v3, "setAppSpecifiedScore:");
  uint64_t v8 = [(ATXUserNotification *)self digestEngagementTrackingMetrics];
  char v9 = [v8 proto];
  [v3 setSharedEngagementTracker:v9];

  recordDate = self->_recordDate;
  if (recordDate)
  {
    [(NSDate *)recordDate timeIntervalSinceReferenceDate];
    objc_msgSend(v3, "setRecordTimestamp:");
  }
  [v3 setNotificationID:self->_notificationID];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXUserNotification *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  if (v5)
  {
    self = [(ATXUserNotification *)self initWithProtoData:v5];
    double v6 = self;
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSDate)recordDate
{
  return self->_recordDate;
}

- (void)setRecordDate:(id)a3
{
}

- (NSString)notificationID
{
  return self->_notificationID;
}

- (void)setNotificationID:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (unint64_t)badge
{
  return self->_badge;
}

- (void)setBadge:(unint64_t)a3
{
  self->_badge = a3;
}

- (NSData)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)threadID
{
  return self->_threadID;
}

- (void)setThreadID:(id)a3
{
}

- (NSString)categoryID
{
  return self->_categoryID;
}

- (void)setCategoryID:(id)a3
{
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (NSArray)contactIDs
{
  return self->_contactIDs;
}

- (void)setContactIDs:(id)a3
{
}

- (NSArray)rawIdentifiers
{
  return self->_rawIdentifiers;
}

- (void)setRawIdentifiers:(id)a3
{
}

- (BOOL)isMessage
{
  return self->_isMessage;
}

- (void)setIsMessage:(BOOL)a3
{
  self->_isMessage = a3;
}

- (BOOL)isGroupMessage
{
  return self->_isGroupMessage;
}

- (void)setIsGroupMessage:(BOOL)a3
{
  self->_isGroupMessage = a3;
}

- (int64_t)urgency
{
  return self->_urgency;
}

- (void)setUrgency:(int64_t)a3
{
  self->_urgency = a3;
}

- (int64_t)attachmentType
{
  return self->_attachmentType;
}

- (void)setAttachmentType:(int64_t)a3
{
  self->_attachmentType = a3;
}

- (double)appSpecifiedScore
{
  return self->_appSpecifiedScore;
}

- (void)setAppSpecifiedScore:(double)a3
{
  self->_appSpecifiedScore = a3;
}

- (ATXUserNotificationDerivedData)derivedData
{
  return self->_derivedData;
}

- (void)setDerivedData:(id)a3
{
}

- (ATXSharedDigestEngagementTrackingMetrics)digestEngagementTrackingMetrics
{
  return self->_digestEngagementTrackingMetrics;
}

- (void)setDigestEngagementTrackingMetrics:(id)a3
{
}

- (BOOL)isSummarized
{
  return self->_isSummarized;
}

- (void)setIsSummarized:(BOOL)a3
{
  self->_isSummarized = a3;
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (BOOL)isPartOfStack
{
  return self->_isPartOfStack;
}

- (void)setIsPartOfStack:(BOOL)a3
{
  self->_isPartOfStack = a3;
}

- (BOOL)isStackSummary
{
  return self->_isStackSummary;
}

- (void)setIsStackSummary:(BOOL)a3
{
  self->_isStackSummary = a3;
}

- (unint64_t)positionInStack
{
  return self->_positionInStack;
}

- (void)setPositionInStack:(unint64_t)a3
{
  self->_positionInStack = a3;
}

- (unint64_t)numberOfNotificationsInStack
{
  return self->_numberOfNotificationsInStack;
}

- (void)setNumberOfNotificationsInStack:(unint64_t)a3
{
  self->_numberOfNotificationsInStack = a3;
}

- (unint64_t)priorityStatus
{
  return self->_priorityStatus;
}

- (void)setPriorityStatus:(unint64_t)a3
{
  self->_priorityStatus = a3;
}

- (unint64_t)summaryStatus
{
  return self->_summaryStatus;
}

- (void)setSummaryStatus:(unint64_t)a3
{
  self->_summaryStatus = a3;
}

- (BOOL)isPriorityNotificationEnabled
{
  return self->_isPriorityNotificationEnabled;
}

- (void)setIsPriorityNotificationEnabled:(BOOL)a3
{
  self->_isPriorityNotificationEnabled = a3;
}

- (BOOL)isNotificationSummaryEnabled
{
  return self->_isNotificationSummaryEnabled;
}

- (void)setIsNotificationSummaryEnabled:(BOOL)a3
{
  self->_isNotificationSummaryEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_digestEngagementTrackingMetrics, 0);
  objc_storeStrong((id *)&self->_derivedData, 0);
  objc_storeStrong((id *)&self->_rawIdentifiers, 0);
  objc_storeStrong((id *)&self->_contactIDs, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_categoryID, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_notificationID, 0);
  objc_storeStrong((id *)&self->_recordDate, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
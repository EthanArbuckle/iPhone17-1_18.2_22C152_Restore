@interface BMNotificationEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMNotificationEvent)initWithDKEvent:(id)a3;
- (BMNotificationEvent)initWithProto:(id)a3;
- (BMNotificationEvent)initWithProtoData:(id)a3;
- (BMNotificationEvent)initWithUniqueID:(id)a3 absoluteTimestamp:(double)a4 usageType:(unint64_t)a5 bundleID:(id)a6 notificationID:(id)a7 deviceID:(id)a8 title:(id)a9 subtitle:(id)a10 badge:(unint64_t)a11 threadID:(id)a12 categoryID:(id)a13 sectionID:(id)a14 contactIDs:(id)a15 isGroupMessage:(BOOL)a16;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupMessage;
- (NSArray)contactIDs;
- (NSString)bundleID;
- (NSString)categoryID;
- (NSString)description;
- (NSString)deviceID;
- (NSString)notificationID;
- (NSString)sectionID;
- (NSString)subtitle;
- (NSString)threadID;
- (NSString)title;
- (NSString)uniqueID;
- (double)absoluteTimestamp;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)badge;
- (unint64_t)usageType;
- (unsigned)dataVersion;
- (void)proto;
@end

@implementation BMNotificationEvent

- (BMNotificationEvent)initWithUniqueID:(id)a3 absoluteTimestamp:(double)a4 usageType:(unint64_t)a5 bundleID:(id)a6 notificationID:(id)a7 deviceID:(id)a8 title:(id)a9 subtitle:(id)a10 badge:(unint64_t)a11 threadID:(id)a12 categoryID:(id)a13 sectionID:(id)a14 contactIDs:(id)a15 isGroupMessage:(BOOL)a16
{
  id v54 = a3;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v55 = a9;
  id v24 = a10;
  v25 = v22;
  id v26 = a12;
  id v27 = a13;
  id v28 = a14;
  id v29 = a15;
  v56.receiver = self;
  v56.super_class = (Class)BMNotificationEvent;
  v30 = [(BMEventBase *)&v56 init];
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_uniqueID, a3);
    v31->_absoluteTimestamp = a4;
    v31->_usageType = a5;
    uint64_t v32 = [v21 copy];
    bundleID = v31->_bundleID;
    v31->_bundleID = (NSString *)v32;

    uint64_t v34 = [v25 copy];
    notificationID = v31->_notificationID;
    v31->_notificationID = (NSString *)v34;

    uint64_t v36 = [v23 copy];
    deviceID = v31->_deviceID;
    v31->_deviceID = (NSString *)v36;

    uint64_t v38 = [v55 copy];
    title = v31->_title;
    v31->_title = (NSString *)v38;

    uint64_t v40 = [v24 copy];
    subtitle = v31->_subtitle;
    v31->_subtitle = (NSString *)v40;

    v31->_badge = a11;
    uint64_t v42 = [v26 copy];
    threadID = v31->_threadID;
    v31->_threadID = (NSString *)v42;

    uint64_t v44 = [v27 copy];
    categoryID = v31->_categoryID;
    v31->_categoryID = (NSString *)v44;

    uint64_t v46 = [v28 copy];
    sectionID = v31->_sectionID;
    v31->_sectionID = (NSString *)v46;

    uint64_t v48 = [v29 copy];
    contactIDs = v31->_contactIDs;
    v31->_contactIDs = (NSArray *)v48;

    v31->_isGroupMessage = a16;
  }

  return v31;
}

- (BMNotificationEvent)initWithDKEvent:(id)a3
{
  id v4 = a3;
  id v23 = [v4 source];
  v19 = [v23 itemID];
  id v22 = [v4 startDate];
  [v22 timeIntervalSinceReferenceDate];
  double v6 = v5;
  id v21 = [v4 value];
  v20 = [v21 stringValue];
  uint64_t v7 = BMNotificationEventUsageTypeFromDKIdentifierValue(v20);
  v8 = [v4 metadata];
  v9 = [get_DKNotificationUsageMetadataKeyClass() bundleID];
  v10 = [v8 objectForKeyedSubscript:v9];
  v11 = [v4 metadata];
  v12 = [get_DKNotificationUsageMetadataKeyClass() identifier];
  v13 = [v11 objectForKeyedSubscript:v12];
  v14 = [v4 source];

  v15 = [v14 deviceID];
  LOBYTE(v18) = 0;
  v16 = [(BMNotificationEvent *)self initWithUniqueID:v19 absoluteTimestamp:v7 usageType:v10 bundleID:v13 notificationID:v15 deviceID:0 title:v6 subtitle:0 badge:0 threadID:0 categoryID:0 sectionID:0 contactIDs:0 isGroupMessage:v18];

  return v16;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"Notification event with unique ID: %@", self->_uniqueID];

  return (NSString *)v2;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  double v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(BMNotificationEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMNotificationEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BMNotificationEvent initWithProto:]((uint64_t)self, v14);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  id v22 = [v5 uniqueID];
  [v5 absoluteTimestamp];
  double v7 = v6;
  uint64_t v24 = (int)[v5 usageType];
  id v23 = [v5 bundleID];
  id v21 = [v5 notificationID];
  v20 = [v5 deviceID];
  v19 = [v5 title];
  uint64_t v18 = [v5 subtitle];
  uint64_t v8 = [v5 badge];
  v17 = [v5 threadID];
  v9 = [v5 categoryID];
  v10 = [v5 sectionID];
  v11 = [v5 contactIDs];
  char v12 = [v5 isGroupMessage];

  LOBYTE(v16) = v12;
  self = [(BMNotificationEvent *)self initWithUniqueID:v22 absoluteTimestamp:v24 usageType:v23 bundleID:v21 notificationID:v20 deviceID:v19 title:v7 subtitle:v18 badge:v8 threadID:v17 categoryID:v9 sectionID:v10 contactIDs:v11 isGroupMessage:v16];

  v13 = self;
LABEL_8:

  return v13;
}

- (BMNotificationEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBNotificationEvent alloc] initWithData:v4];

    self = [(BMNotificationEvent *)self initWithProto:v5];
    double v6 = self;
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  [v3 setUniqueID:self->_uniqueID];
  [v3 setAbsoluteTimestamp:self->_absoluteTimestamp];
  unint64_t usageType = self->_usageType;
  if (usageType >= 0x16)
  {
    double v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(BMNotificationEvent *)usageType proto];
    }

    id v6 = 0;
  }
  else
  {
    [v3 setUsageType:dword_18EB36D78[usageType]];
    [v3 setBundleID:self->_bundleID];
    [v3 setNotificationID:self->_notificationID];
    [v3 setDeviceID:self->_deviceID];
    [v3 setTitle:self->_title];
    [v3 setSubtitle:self->_subtitle];
    [v3 setBadge:self->_badge];
    [v3 setThreadID:self->_threadID];
    [v3 setCategoryID:self->_categoryID];
    [v3 setSectionID:self->_sectionID];
    id v5 = (void *)[(NSArray *)self->_contactIDs mutableCopy];
    [v3 setContactIDs:v5];

    [v3 setIsGroupMessage:self->_isGroupMessage];
    id v6 = v3;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v13 = 0;
    goto LABEL_54;
  }
  id v7 = v6;
  uint64_t v8 = v7;
  uniqueID = self->_uniqueID;
  v10 = uniqueID;
  if (!uniqueID)
  {
    uint64_t v11 = [v7 uniqueID];
    if (!v11)
    {
      v77 = 0;
      int v12 = 0;
      goto LABEL_10;
    }
    v77 = (void *)v11;
    v10 = self->_uniqueID;
  }
  v3 = [v8 uniqueID];
  if (([(NSString *)v10 isEqual:v3] & 1) == 0)
  {

    BOOL v13 = 0;
    goto LABEL_51;
  }
  int v12 = 1;
LABEL_10:
  bundleID = self->_bundleID;
  v15 = bundleID;
  if (!bundleID)
  {
    uint64_t v16 = [v8 bundleID];
    if (!v16)
    {
      int v17 = v12;
      v74 = 0;
      int v76 = 0;
      goto LABEL_17;
    }
    v74 = (void *)v16;
    v15 = self->_bundleID;
  }
  id v4 = [v8 bundleID];
  if (([(NSString *)v15 isEqual:v4] & 1) == 0)
  {

    BOOL v13 = 0;
    goto LABEL_48;
  }
  int v17 = v12;
  int v76 = 1;
LABEL_17:
  notificationID = self->_notificationID;
  v75 = notificationID;
  if (!notificationID)
  {
    uint64_t v19 = [v8 notificationID];
    if (!v19)
    {
      v70 = 0;
      int v72 = 0;
      goto LABEL_24;
    }
    v70 = (void *)v19;
    notificationID = self->_notificationID;
  }
  v20 = [v8 notificationID];
  if (![(NSString *)notificationID isEqual:v20])
  {
    BOOL v13 = 0;
    int v12 = v17;
    goto LABEL_44;
  }
  v73 = v20;
  int v72 = 1;
LABEL_24:
  deviceID = self->_deviceID;
  v71 = deviceID;
  if (!deviceID)
  {
    uint64_t v22 = [v8 deviceID];
    if (!v22)
    {
      v68 = 0;
      int v69 = 0;
      goto LABEL_31;
    }
    v68 = (void *)v22;
    deviceID = self->_deviceID;
  }
  id v23 = [v8 deviceID];
  if (([(NSString *)deviceID isEqual:v23] & 1) == 0)
  {

    BOOL v13 = 0;
    int v12 = v17;
    v20 = v73;
    goto LABEL_42;
  }
  v67 = v23;
  int v69 = 1;
LABEL_31:
  int v12 = v17;
  v20 = v73;
  double absoluteTimestamp = self->_absoluteTimestamp;
  [v8 absoluteTimestamp];
  if (absoluteTimestamp != v25
    || (usageType = self->_usageType, BOOL v27 = usageType == [v8 usageType], v20 = v73, !v27))
  {
    BOOL v13 = 0;
    goto LABEL_40;
  }
  int v66 = v17;
  title = self->_title;
  id v29 = title;
  if (!title)
  {
    uint64_t v30 = [v8 title];
    if (!v30)
    {
      v61 = 0;
      int v64 = 0;
      goto LABEL_63;
    }
    v61 = (void *)v30;
    id v29 = self->_title;
  }
  v65 = [v8 title];
  if (!-[NSString isEqual:](v29, "isEqual:"))
  {
    BOOL v13 = 0;
    int v12 = v66;
    v20 = v73;
    goto LABEL_114;
  }
  int v64 = 1;
LABEL_63:
  subtitle = self->_subtitle;
  v63 = subtitle;
  if (!subtitle)
  {
    uint64_t v33 = [v8 subtitle];
    if (!v33)
    {
      v57 = 0;
      int v60 = 0;
      goto LABEL_70;
    }
    v57 = (void *)v33;
    subtitle = self->_subtitle;
  }
  v62 = [v8 subtitle];
  if (!-[NSString isEqual:](subtitle, "isEqual:"))
  {
    BOOL v13 = 0;
    int v12 = v66;
    v20 = v73;
    goto LABEL_111;
  }
  int v60 = 1;
LABEL_70:
  threadID = self->_threadID;
  v59 = threadID;
  if (!threadID)
  {
    uint64_t v35 = [v8 threadID];
    if (!v35)
    {
      v53 = 0;
      int v56 = 0;
      goto LABEL_77;
    }
    v53 = (void *)v35;
    threadID = self->_threadID;
  }
  v58 = [v8 threadID];
  if (!-[NSString isEqual:](threadID, "isEqual:"))
  {
    BOOL v13 = 0;
    int v12 = v66;
    v20 = v73;
    goto LABEL_108;
  }
  int v56 = 1;
LABEL_77:
  categoryID = self->_categoryID;
  id v55 = categoryID;
  if (!categoryID)
  {
    uint64_t v37 = [v8 categoryID];
    if (!v37)
    {
      v49 = 0;
      int v52 = 0;
      goto LABEL_84;
    }
    v49 = (void *)v37;
    categoryID = self->_categoryID;
  }
  id v54 = [v8 categoryID];
  if (!-[NSString isEqual:](categoryID, "isEqual:"))
  {
    BOOL v13 = 0;
    int v12 = v66;
    v20 = v73;
    goto LABEL_105;
  }
  int v52 = 1;
LABEL_84:
  sectionID = self->_sectionID;
  v51 = sectionID;
  if (!sectionID)
  {
    uint64_t v39 = [v8 sectionID];
    if (!v39)
    {
      v45 = 0;
      int v48 = 0;
      goto LABEL_91;
    }
    v45 = (void *)v39;
    sectionID = self->_sectionID;
  }
  v50 = [v8 sectionID];
  if (!-[NSString isEqual:](sectionID, "isEqual:"))
  {
    BOOL v13 = 0;
    int v12 = v66;
    v20 = v73;
    goto LABEL_102;
  }
  int v48 = 1;
LABEL_91:
  contactIDs = self->_contactIDs;
  v47 = contactIDs;
  if (!contactIDs)
  {
    uint64_t v41 = [v8 contactIDs];
    if (!v41)
    {
      uint64_t v44 = 0;
      int v42 = 0;
LABEL_98:
      int v12 = v66;
      int isGroupMessage = self->_isGroupMessage;
      BOOL v13 = isGroupMessage == [v8 isGroupMessage];
      if (!v42) {
        goto LABEL_100;
      }
      goto LABEL_99;
    }
    uint64_t v44 = (void *)v41;
    contactIDs = self->_contactIDs;
  }
  uint64_t v46 = [v8 contactIDs];
  if (-[NSArray isEqual:](contactIDs, "isEqual:"))
  {
    int v42 = 1;
    goto LABEL_98;
  }
  BOOL v13 = 0;
  int v12 = v66;
LABEL_99:

LABEL_100:
  v20 = v73;
  if (v47)
  {
    if (!v48) {
      goto LABEL_103;
    }
    goto LABEL_102;
  }

  if (v48) {
LABEL_102:
  }

LABEL_103:
  if (v51)
  {
    if (!v52) {
      goto LABEL_106;
    }
    goto LABEL_105;
  }

  if (v52) {
LABEL_105:
  }

LABEL_106:
  if (v55)
  {
    if (!v56) {
      goto LABEL_109;
    }
    goto LABEL_108;
  }

  if (v56) {
LABEL_108:
  }

LABEL_109:
  if (v59)
  {
    if (!v60) {
      goto LABEL_112;
    }
    goto LABEL_111;
  }

  if (v60) {
LABEL_111:
  }

LABEL_112:
  if (v63)
  {
    if (!v64) {
      goto LABEL_115;
    }
    goto LABEL_114;
  }

  if (v64) {
LABEL_114:
  }

LABEL_115:
  if (!title)
  {

LABEL_40:
    if ((v69 & 1) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  if (v69) {
LABEL_41:
  }

LABEL_42:
  if (!v71)
  {

    if ((v72 & 1) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  if (v72) {
LABEL_44:
  }

LABEL_45:
  if (!v75)
  {

    if ((v76 & 1) == 0) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
  if (v76) {
LABEL_47:
  }

LABEL_48:
  if (!bundleID)
  {

    if ((v12 & 1) == 0) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
  if (v12) {
LABEL_50:
  }

LABEL_51:
  if (!uniqueID) {

  }
LABEL_54:
  return v13;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (unint64_t)usageType
{
  return self->_usageType;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)notificationID
{
  return self->_notificationID;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (unint64_t)badge
{
  return self->_badge;
}

- (NSString)threadID
{
  return self->_threadID;
}

- (NSString)categoryID
{
  return self->_categoryID;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (NSArray)contactIDs
{
  return self->_contactIDs;
}

- (BOOL)isGroupMessage
{
  return self->_isGroupMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIDs, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_categoryID, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_notificationID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBNotificationEvent proto", (uint8_t *)&v5, 0xCu);
}

- (void)proto
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [NSNumber numberWithUnsignedInteger:a1];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMNotificationEvent: unable to convert BMNotificationEventUsageType enum value: %@", (uint8_t *)&v4, 0xCu);
}

@end
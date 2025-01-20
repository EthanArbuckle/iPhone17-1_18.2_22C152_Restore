@interface BMProactiveHarvestingNotifications
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMProactiveHarvestingNotifications)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMProactiveHarvestingNotifications)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 bundleID:(id)a5 notificationID:(id)a6 title:(id)a7 subtitle:(id)a8 body:(id)a9 threadID:(id)a10 category:(id)a11 isGroupMessage:(id)a12 isTimeSensitive:(id)a13 isCritical:(id)a14 isCommunicationNotification:(id)a15 contentProtection:(id)a16 personaId:(id)a17 attachments:(id)a18 fromHandles:(id)a19 toHandles:(id)a20;
- (BMProactiveHarvestingNotifications)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 bundleID:(id)a5 notificationID:(id)a6 title:(id)a7 subtitle:(id)a8 body:(id)a9 threadID:(id)a10 category:(id)a11 isGroupMessage:(id)a12 isTimeSensitive:(id)a13 isCritical:(id)a14 isCommunicationNotification:(id)a15 contentProtection:(id)a16 personaId:(id)a17 attachments:(id)a18 handles:(id)a19;
- (BOOL)hasIsCommunicationNotification;
- (BOOL)hasIsCritical;
- (BOOL)hasIsGroupMessage;
- (BOOL)hasIsTimeSensitive;
- (BOOL)isCommunicationNotification;
- (BOOL)isCritical;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupMessage;
- (BOOL)isTimeSensitive;
- (NSArray)attachments;
- (NSArray)fromHandles;
- (NSArray)handles;
- (NSArray)toHandles;
- (NSDate)absoluteTimestamp;
- (NSString)body;
- (NSString)bundleID;
- (NSString)category;
- (NSString)contentProtection;
- (NSString)description;
- (NSString)notificationID;
- (NSString)personaId;
- (NSString)subtitle;
- (NSString)threadID;
- (NSString)title;
- (NSString)uniqueID;
- (id)_attachmentsJSONArray;
- (id)_fromHandlesJSONArray;
- (id)_toHandlesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasIsCommunicationNotification:(BOOL)a3;
- (void)setHasIsCritical:(BOOL)a3;
- (void)setHasIsGroupMessage:(BOOL)a3;
- (void)setHasIsTimeSensitive:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMProactiveHarvestingNotifications

+ (id)columns
{
  v23[19] = *MEMORY[0x1E4F143B8];
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uniqueID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:1];
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"notificationID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"title" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"subtitle" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"body" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"threadID" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"category" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isGroupMessage" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:12 convertedType:0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isTimeSensitive" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:12 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isCritical" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:12 convertedType:0];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isCommunicationNotification" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:12 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentProtection" dataType:2 requestOnly:0 fieldNumber:14 protoDataType:13 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"personaId" dataType:2 requestOnly:0 fieldNumber:15 protoDataType:13 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"attachments_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_48288];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"handles_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_103_48289];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"fromHandles_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_105];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"toHandles_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_107];
  v23[0] = v22;
  v23[1] = v21;
  v23[2] = v20;
  v23[3] = v18;
  v23[4] = v17;
  v23[5] = v16;
  v23[6] = v15;
  v23[7] = v19;
  v23[8] = v14;
  v23[9] = v2;
  v23[10] = v13;
  v23[11] = v3;
  v23[12] = v12;
  v23[13] = v4;
  v23[14] = v5;
  v23[15] = v6;
  v23[16] = v11;
  v23[17] = v7;
  v23[18] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:19];

  return v10;
}

- (BMProactiveHarvestingNotifications)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 bundleID:(id)a5 notificationID:(id)a6 title:(id)a7 subtitle:(id)a8 body:(id)a9 threadID:(id)a10 category:(id)a11 isGroupMessage:(id)a12 isTimeSensitive:(id)a13 isCritical:(id)a14 isCommunicationNotification:(id)a15 contentProtection:(id)a16 personaId:(id)a17 attachments:(id)a18 handles:(id)a19
{
  return -[BMProactiveHarvestingNotifications initWithUniqueID:absoluteTimestamp:bundleID:notificationID:title:subtitle:body:threadID:category:isGroupMessage:isTimeSensitive:isCritical:isCommunicationNotification:contentProtection:personaId:attachments:fromHandles:toHandles:](self, "initWithUniqueID:absoluteTimestamp:bundleID:notificationID:title:subtitle:body:threadID:category:isGroupMessage:isTimeSensitive:isCritical:isCommunicationNotification:contentProtection:personaId:attachments:fromHandles:toHandles:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18,
           a19,
           MEMORY[0x1E4F1CBF0]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_toHandles, 0);
  objc_storeStrong((id *)&self->_fromHandles, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_notificationID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

- (NSArray)handles
{
  return self->_handles;
}

- (NSArray)toHandles
{
  return self->_toHandles;
}

- (NSArray)fromHandles
{
  return self->_fromHandles;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void)setHasIsCommunicationNotification:(BOOL)a3
{
  self->_hasIsCommunicationNotification = a3;
}

- (BOOL)hasIsCommunicationNotification
{
  return self->_hasIsCommunicationNotification;
}

- (BOOL)isCommunicationNotification
{
  return self->_isCommunicationNotification;
}

- (void)setHasIsCritical:(BOOL)a3
{
  self->_hasIsCritical = a3;
}

- (BOOL)hasIsCritical
{
  return self->_hasIsCritical;
}

- (BOOL)isCritical
{
  return self->_isCritical;
}

- (void)setHasIsTimeSensitive:(BOOL)a3
{
  self->_hasIsTimeSensitive = a3;
}

- (BOOL)hasIsTimeSensitive
{
  return self->_hasIsTimeSensitive;
}

- (BOOL)isTimeSensitive
{
  return self->_isTimeSensitive;
}

- (void)setHasIsGroupMessage:(BOOL)a3
{
  self->_hasIsGroupMessage = a3;
}

- (BOOL)hasIsGroupMessage
{
  return self->_hasIsGroupMessage;
}

- (BOOL)isGroupMessage
{
  return self->_isGroupMessage;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)threadID
{
  return self->_threadID;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)notificationID
{
  return self->_notificationID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMProactiveHarvestingNotifications *)self uniqueID];
    uint64_t v7 = [v5 uniqueID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMProactiveHarvestingNotifications *)self uniqueID];
      id v10 = [v5 uniqueID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_73;
      }
    }
    v13 = [(BMProactiveHarvestingNotifications *)self absoluteTimestamp];
    uint64_t v14 = [v5 absoluteTimestamp];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMProactiveHarvestingNotifications *)self absoluteTimestamp];
      v17 = [v5 absoluteTimestamp];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_73;
      }
    }
    v19 = [(BMProactiveHarvestingNotifications *)self bundleID];
    uint64_t v20 = [v5 bundleID];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMProactiveHarvestingNotifications *)self bundleID];
      v23 = [v5 bundleID];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_73;
      }
    }
    v25 = [(BMProactiveHarvestingNotifications *)self notificationID];
    uint64_t v26 = [v5 notificationID];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMProactiveHarvestingNotifications *)self notificationID];
      v29 = [v5 notificationID];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_73;
      }
    }
    v31 = [(BMProactiveHarvestingNotifications *)self title];
    uint64_t v32 = [v5 title];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMProactiveHarvestingNotifications *)self title];
      v35 = [v5 title];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_73;
      }
    }
    v37 = [(BMProactiveHarvestingNotifications *)self subtitle];
    uint64_t v38 = [v5 subtitle];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMProactiveHarvestingNotifications *)self subtitle];
      v41 = [v5 subtitle];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_73;
      }
    }
    v43 = [(BMProactiveHarvestingNotifications *)self body];
    uint64_t v44 = [v5 body];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMProactiveHarvestingNotifications *)self body];
      v47 = [v5 body];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_73;
      }
    }
    v49 = [(BMProactiveHarvestingNotifications *)self threadID];
    uint64_t v50 = [v5 threadID];
    if (v49 == (void *)v50)
    {
    }
    else
    {
      v51 = (void *)v50;
      v52 = [(BMProactiveHarvestingNotifications *)self threadID];
      v53 = [v5 threadID];
      int v54 = [v52 isEqual:v53];

      if (!v54) {
        goto LABEL_73;
      }
    }
    v55 = [(BMProactiveHarvestingNotifications *)self category];
    uint64_t v56 = [v5 category];
    if (v55 == (void *)v56)
    {
    }
    else
    {
      v57 = (void *)v56;
      v58 = [(BMProactiveHarvestingNotifications *)self category];
      v59 = [v5 category];
      int v60 = [v58 isEqual:v59];

      if (!v60) {
        goto LABEL_73;
      }
    }
    if ([(BMProactiveHarvestingNotifications *)self hasIsGroupMessage]
      || [v5 hasIsGroupMessage])
    {
      if (![(BMProactiveHarvestingNotifications *)self hasIsGroupMessage]) {
        goto LABEL_73;
      }
      if (![v5 hasIsGroupMessage]) {
        goto LABEL_73;
      }
      int v61 = [(BMProactiveHarvestingNotifications *)self isGroupMessage];
      if (v61 != [v5 isGroupMessage]) {
        goto LABEL_73;
      }
    }
    if ([(BMProactiveHarvestingNotifications *)self hasIsTimeSensitive]
      || [v5 hasIsTimeSensitive])
    {
      if (![(BMProactiveHarvestingNotifications *)self hasIsTimeSensitive]) {
        goto LABEL_73;
      }
      if (![v5 hasIsTimeSensitive]) {
        goto LABEL_73;
      }
      int v62 = [(BMProactiveHarvestingNotifications *)self isTimeSensitive];
      if (v62 != [v5 isTimeSensitive]) {
        goto LABEL_73;
      }
    }
    if ([(BMProactiveHarvestingNotifications *)self hasIsCritical]
      || [v5 hasIsCritical])
    {
      if (![(BMProactiveHarvestingNotifications *)self hasIsCritical]) {
        goto LABEL_73;
      }
      if (![v5 hasIsCritical]) {
        goto LABEL_73;
      }
      int v63 = [(BMProactiveHarvestingNotifications *)self isCritical];
      if (v63 != [v5 isCritical]) {
        goto LABEL_73;
      }
    }
    if ([(BMProactiveHarvestingNotifications *)self hasIsCommunicationNotification]
      || [v5 hasIsCommunicationNotification])
    {
      if (![(BMProactiveHarvestingNotifications *)self hasIsCommunicationNotification]) {
        goto LABEL_73;
      }
      if (![v5 hasIsCommunicationNotification]) {
        goto LABEL_73;
      }
      int v64 = [(BMProactiveHarvestingNotifications *)self isCommunicationNotification];
      if (v64 != [v5 isCommunicationNotification]) {
        goto LABEL_73;
      }
    }
    v65 = [(BMProactiveHarvestingNotifications *)self contentProtection];
    uint64_t v66 = [v5 contentProtection];
    if (v65 == (void *)v66)
    {
    }
    else
    {
      v67 = (void *)v66;
      v68 = [(BMProactiveHarvestingNotifications *)self contentProtection];
      v69 = [v5 contentProtection];
      int v70 = [v68 isEqual:v69];

      if (!v70) {
        goto LABEL_73;
      }
    }
    v71 = [(BMProactiveHarvestingNotifications *)self personaId];
    uint64_t v72 = [v5 personaId];
    if (v71 == (void *)v72)
    {
    }
    else
    {
      v73 = (void *)v72;
      v74 = [(BMProactiveHarvestingNotifications *)self personaId];
      v75 = [v5 personaId];
      int v76 = [v74 isEqual:v75];

      if (!v76) {
        goto LABEL_73;
      }
    }
    v77 = [(BMProactiveHarvestingNotifications *)self attachments];
    uint64_t v78 = [v5 attachments];
    if (v77 == (void *)v78)
    {
    }
    else
    {
      v79 = (void *)v78;
      v80 = [(BMProactiveHarvestingNotifications *)self attachments];
      v81 = [v5 attachments];
      int v82 = [v80 isEqual:v81];

      if (!v82) {
        goto LABEL_73;
      }
    }
    v83 = [(BMProactiveHarvestingNotifications *)self fromHandles];
    uint64_t v84 = [v5 fromHandles];
    if (v83 == (void *)v84)
    {
    }
    else
    {
      v85 = (void *)v84;
      v86 = [(BMProactiveHarvestingNotifications *)self fromHandles];
      v87 = [v5 fromHandles];
      int v88 = [v86 isEqual:v87];

      if (!v88)
      {
LABEL_73:
        char v12 = 0;
LABEL_74:

        goto LABEL_75;
      }
    }
    v90 = [(BMProactiveHarvestingNotifications *)self toHandles];
    v91 = [v5 toHandles];
    if (v90 == v91)
    {
      char v12 = 1;
    }
    else
    {
      v92 = [(BMProactiveHarvestingNotifications *)self toHandles];
      v93 = [v5 toHandles];
      char v12 = [v92 isEqual:v93];
    }
    goto LABEL_74;
  }
  char v12 = 0;
LABEL_75:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v64[18] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMProactiveHarvestingNotifications *)self uniqueID];
  id v4 = [(BMProactiveHarvestingNotifications *)self absoluteTimestamp];
  if (v4)
  {
    id v5 = NSNumber;
    v6 = [(BMProactiveHarvestingNotifications *)self absoluteTimestamp];
    [v6 timeIntervalSinceReferenceDate];
    objc_msgSend(v5, "numberWithDouble:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }

  uint64_t v8 = [(BMProactiveHarvestingNotifications *)self bundleID];
  uint64_t v9 = [(BMProactiveHarvestingNotifications *)self notificationID];
  uint64_t v10 = [(BMProactiveHarvestingNotifications *)self title];
  int v11 = [(BMProactiveHarvestingNotifications *)self subtitle];
  uint64_t v12 = [(BMProactiveHarvestingNotifications *)self body];
  int v62 = [(BMProactiveHarvestingNotifications *)self threadID];
  int v61 = [(BMProactiveHarvestingNotifications *)self category];
  if ([(BMProactiveHarvestingNotifications *)self hasIsGroupMessage])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingNotifications isGroupMessage](self, "isGroupMessage"));
    id v60 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v60 = 0;
  }
  if ([(BMProactiveHarvestingNotifications *)self hasIsTimeSensitive])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingNotifications isTimeSensitive](self, "isTimeSensitive"));
    id v59 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v59 = 0;
  }
  if ([(BMProactiveHarvestingNotifications *)self hasIsCritical])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingNotifications isCritical](self, "isCritical"));
    id v58 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v58 = 0;
  }
  if ([(BMProactiveHarvestingNotifications *)self hasIsCommunicationNotification])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingNotifications isCommunicationNotification](self, "isCommunicationNotification"));
    id v57 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v57 = 0;
  }
  uint64_t v56 = [(BMProactiveHarvestingNotifications *)self contentProtection];
  v55 = [(BMProactiveHarvestingNotifications *)self personaId];
  int v54 = [(BMProactiveHarvestingNotifications *)self _attachmentsJSONArray];
  v53 = [(BMProactiveHarvestingNotifications *)self _fromHandlesJSONArray];
  v13 = [(BMProactiveHarvestingNotifications *)self _toHandlesJSONArray];
  v63[0] = @"uniqueID";
  uint64_t v14 = v3;
  if (!v3)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v45 = (void *)v14;
  v64[0] = v14;
  v63[1] = @"absoluteTimestamp";
  uint64_t v15 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v44 = (void *)v15;
  v64[1] = v15;
  v63[2] = @"bundleID";
  uint64_t v16 = v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v43 = (void *)v16;
  v64[2] = v16;
  v63[3] = @"notificationID";
  uint64_t v17 = v9;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  int v42 = (void *)v17;
  v64[3] = v17;
  v63[4] = @"title";
  uint64_t v18 = v10;
  if (!v10)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v41 = (void *)v18;
  v64[4] = v18;
  v63[5] = @"subtitle";
  uint64_t v19 = (uint64_t)v11;
  if (!v11)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v40 = (void *)v19;
  v64[5] = v19;
  v63[6] = @"body";
  uint64_t v20 = v12;
  if (!v12)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v39 = (void *)v20;
  v64[6] = v20;
  v63[7] = @"threadID";
  v21 = v62;
  if (!v62)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v64[7] = v21;
  v63[8] = @"category";
  uint64_t v22 = (uint64_t)v61;
  if (!v61)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v64[8] = v22;
  v63[9] = @"isGroupMessage";
  uint64_t v23 = (uint64_t)v60;
  if (!v60)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v52 = v7;
  v64[9] = v23;
  v63[10] = @"isTimeSensitive";
  uint64_t v24 = (uint64_t)v59;
  v25 = (void *)v23;
  if (!v59)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v51 = (void *)v8;
  v47 = (void *)v24;
  v64[10] = v24;
  v63[11] = @"isCritical";
  uint64_t v26 = (uint64_t)v58;
  if (!v58)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v50 = (void *)v3;
  uint64_t v35 = v26;
  v64[11] = v26;
  v63[12] = @"isCommunicationNotification";
  v27 = v57;
  if (!v57)
  {
    v27 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v26);
  }
  v49 = (void *)v9;
  v64[12] = v27;
  v63[13] = @"contentProtection";
  v28 = v56;
  if (!v56)
  {
    v28 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v38 = (void *)v22;
  int v48 = (void *)v10;
  v64[13] = v28;
  v63[14] = @"personaId";
  v29 = v55;
  if (!v55)
  {
    v29 = [MEMORY[0x1E4F1CA98] null];
  }
  int v30 = (void *)v12;
  v64[14] = v29;
  v63[15] = @"attachments";
  v31 = v54;
  if (!v54)
  {
    v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = v25;
  v64[15] = v31;
  v63[16] = @"fromHandles";
  uint64_t v32 = v53;
  if (!v53)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v64[16] = v32;
  v63[17] = @"toHandles";
  v33 = v13;
  if (!v13)
  {
    v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v64[17] = v33;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v64, v63, 18, v35);
  id v46 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13) {

  }
  if (!v53) {
  if (!v54)
  }

  if (!v55) {
  if (!v56)
  }

  if (!v57) {
  if (!v58)
  }

  if (!v59) {
  if (!v60)
  }

  if (!v61) {
  if (v62)
  }
  {
    if (v30) {
      goto LABEL_74;
    }
  }
  else
  {

    if (v30)
    {
LABEL_74:
      if (v11) {
        goto LABEL_75;
      }
      goto LABEL_85;
    }
  }

  if (v11)
  {
LABEL_75:
    if (v48) {
      goto LABEL_76;
    }
    goto LABEL_86;
  }
LABEL_85:

  if (v48)
  {
LABEL_76:
    if (v49) {
      goto LABEL_77;
    }
    goto LABEL_87;
  }
LABEL_86:

  if (v49)
  {
LABEL_77:
    if (v51) {
      goto LABEL_78;
    }
    goto LABEL_88;
  }
LABEL_87:

  if (v51)
  {
LABEL_78:
    if (v52) {
      goto LABEL_79;
    }
LABEL_89:

    if (v50) {
      goto LABEL_80;
    }
    goto LABEL_90;
  }
LABEL_88:

  if (!v52) {
    goto LABEL_89;
  }
LABEL_79:
  if (v50) {
    goto LABEL_80;
  }
LABEL_90:

LABEL_80:

  return v46;
}

- (id)_toHandlesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMProactiveHarvestingNotifications *)self toHandles];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_fromHandlesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMProactiveHarvestingNotifications *)self fromHandles];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_attachmentsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMProactiveHarvestingNotifications *)self attachments];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMProactiveHarvestingNotifications)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v340[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"uniqueID"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v13 = *MEMORY[0x1E4F502C8];
        uint64_t v339 = *MEMORY[0x1E4F28568];
        long long v14 = self;
        id v15 = [NSString alloc];
        uint64_t v222 = objc_opt_class();
        uint64_t v16 = v15;
        self = v14;
        uint64_t v17 = (void *)[v16 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v222, @"uniqueID"];
        v340[0] = v17;
        v272 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v340 forKeys:&v339 count:1];
        id v18 = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, 2);
        id v7 = 0;
        uint64_t v19 = 0;
        *a4 = v18;
        goto LABEL_238;
      }
      id v7 = 0;
      uint64_t v19 = 0;
      goto LABEL_239;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = [v5 objectForKeyedSubscript:@"absoluteTimestamp"];
  v272 = (void *)v8;
  if (!v8 || (uint64_t v9 = (void *)v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v270 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    id v11 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v10 doubleValue];
    id v270 = (id)objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:");
LABEL_15:

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    id v20 = v9;
    id v270 = [v10 dateFromString:v20];

    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      id v130 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v131 = *MEMORY[0x1E4F502C8];
      uint64_t v337 = *MEMORY[0x1E4F28568];
      int v48 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
      v338 = v48;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v338 forKeys:&v337 count:1];
      id v132 = (id)[v130 initWithDomain:v131 code:2 userInfo:v21];
      uint64_t v17 = 0;
      uint64_t v19 = 0;
      *a4 = v132;
      goto LABEL_237;
    }
    uint64_t v17 = 0;
    uint64_t v19 = 0;
    goto LABEL_238;
  }
  id v270 = v9;
LABEL_16:
  v21 = [v5 objectForKeyedSubscript:@"bundleID"];
  v273 = v21;
  if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v48 = a4;
      if (a4)
      {
        id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v50 = *MEMORY[0x1E4F502C8];
        uint64_t v335 = *MEMORY[0x1E4F28568];
        id v51 = [NSString alloc];
        uint64_t v223 = objc_opt_class();
        v52 = v51;
        v21 = v273;
        v53 = (void *)[v52 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v223, @"bundleID"];
        v336 = v53;
        uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v336 forKeys:&v335 count:1];
        v55 = v49;
        uint64_t v22 = (void *)v54;
        id v56 = (id)[v55 initWithDomain:v50 code:2 userInfo:v54];
        uint64_t v19 = 0;
        int v48 = 0;
        *a4 = v56;
        uint64_t v17 = v270;
        goto LABEL_236;
      }
      uint64_t v19 = 0;
      uint64_t v17 = v270;
      goto LABEL_237;
    }
    v269 = v21;
  }
  else
  {
    v269 = 0;
  }
  uint64_t v22 = [v5 objectForKeyedSubscript:@"notificationID"];
  v271 = v22;
  v267 = self;
  if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v58 = *MEMORY[0x1E4F502C8];
        uint64_t v333 = *MEMORY[0x1E4F28568];
        id v59 = [NSString alloc];
        uint64_t v224 = objc_opt_class();
        id v60 = v59;
        v21 = v273;
        int v61 = (void *)[v60 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v224, @"notificationID"];
        v334 = v61;
        uint64_t v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v334 forKeys:&v333 count:1];
        int v63 = v57;
        uint64_t v22 = v271;
        v268 = (void *)v62;
        id v64 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v58, 2);
        uint64_t v19 = 0;
        v53 = 0;
        *a4 = v64;
        int v48 = v269;
        uint64_t v17 = v270;
        goto LABEL_235;
      }
      v53 = 0;
      uint64_t v19 = 0;
      int v48 = v269;
      uint64_t v17 = v270;
      goto LABEL_236;
    }
    id v265 = v22;
  }
  else
  {
    id v265 = 0;
  }
  uint64_t v23 = [v5 objectForKeyedSubscript:@"title"];
  v268 = (void *)v23;
  if (v23 && (uint64_t v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v66 = *MEMORY[0x1E4F502C8];
        uint64_t v331 = *MEMORY[0x1E4F28568];
        id v67 = [NSString alloc];
        uint64_t v225 = objc_opt_class();
        v68 = v67;
        v21 = v273;
        id v266 = (id)[v68 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v225, @"title"];
        id v332 = v266;
        uint64_t v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v332 forKeys:&v331 count:1];
        int v70 = v65;
        uint64_t v22 = v271;
        v264 = (void *)v69;
        id v71 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v66, 2);
        uint64_t v19 = 0;
        int v61 = 0;
        *a4 = v71;
        int v48 = v269;
        uint64_t v17 = v270;
        v53 = v265;
        goto LABEL_234;
      }
      int v61 = 0;
      uint64_t v19 = 0;
      int v48 = v269;
      uint64_t v17 = v270;
      v53 = v265;
      goto LABEL_235;
    }
    id v263 = v24;
  }
  else
  {
    id v263 = 0;
  }
  uint64_t v25 = [v5 objectForKeyedSubscript:@"subtitle"];
  v264 = (void *)v25;
  if (v25 && (uint64_t v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        id v266 = 0;
        uint64_t v19 = 0;
        int v48 = v269;
        uint64_t v17 = v270;
        v53 = v265;
        int v61 = v263;
        goto LABEL_234;
      }
      id v72 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v73 = *MEMORY[0x1E4F502C8];
      uint64_t v329 = *MEMORY[0x1E4F28568];
      id v74 = [NSString alloc];
      uint64_t v226 = objc_opt_class();
      v75 = v74;
      v21 = v273;
      id v262 = (id)[v75 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v226, @"subtitle"];
      id v330 = v262;
      uint64_t v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v330 forKeys:&v329 count:1];
      v77 = v72;
      uint64_t v22 = v271;
      v261 = (void *)v76;
      id v78 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v73, 2);
      uint64_t v19 = 0;
      id v266 = 0;
      *a4 = v78;
      goto LABEL_129;
    }
    id v266 = v26;
  }
  else
  {
    id v266 = 0;
  }
  uint64_t v27 = [v5 objectForKeyedSubscript:@"body"];
  v261 = (void *)v27;
  if (v27)
  {
    v28 = (void *)v27;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v262 = v28;
        goto LABEL_31;
      }
      if (a4)
      {
        id v79 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v80 = *MEMORY[0x1E4F502C8];
        uint64_t v327 = *MEMORY[0x1E4F28568];
        id v81 = [NSString alloc];
        uint64_t v227 = objc_opt_class();
        int v82 = v81;
        v21 = v273;
        id v260 = (id)[v82 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v227, @"body"];
        id v328 = v260;
        uint64_t v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v328 forKeys:&v327 count:1];
        uint64_t v84 = v79;
        uint64_t v22 = v271;
        v259 = (void *)v83;
        id v85 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v80, 2);
        uint64_t v19 = 0;
        id v262 = 0;
        *a4 = v85;
        goto LABEL_133;
      }
      id v262 = 0;
      uint64_t v19 = 0;
LABEL_129:
      int v48 = v269;
      uint64_t v17 = v270;
      v53 = v265;
      int v61 = v263;
      goto LABEL_233;
    }
  }
  id v262 = 0;
LABEL_31:
  uint64_t v29 = [v5 objectForKeyedSubscript:@"threadID"];
  v259 = (void *)v29;
  if (v29)
  {
    int v30 = (void *)v29;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v260 = v30;
        goto LABEL_34;
      }
      if (a4)
      {
        id v86 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v87 = *MEMORY[0x1E4F502C8];
        uint64_t v325 = *MEMORY[0x1E4F28568];
        id v88 = [NSString alloc];
        uint64_t v228 = objc_opt_class();
        v89 = v88;
        v21 = v273;
        v90 = (void *)[v89 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v228, @"threadID"];
        v326 = v90;
        uint64_t v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v326 forKeys:&v325 count:1];
        v92 = v86;
        uint64_t v22 = v271;
        v258 = (void *)v91;
        id v93 = (id)objc_msgSend(v92, "initWithDomain:code:userInfo:", v87, 2);
        uint64_t v19 = 0;
        id v260 = 0;
        *a4 = v93;
        goto LABEL_137;
      }
      id v260 = 0;
      uint64_t v19 = 0;
LABEL_133:
      int v48 = v269;
      uint64_t v17 = v270;
      v53 = v265;
      goto LABEL_232;
    }
  }
  id v260 = 0;
LABEL_34:
  uint64_t v31 = [v5 objectForKeyedSubscript:@"category"];
  v258 = (void *)v31;
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v255 = v32;
        goto LABEL_37;
      }
      if (a4)
      {
        id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v95 = *MEMORY[0x1E4F502C8];
        uint64_t v323 = *MEMORY[0x1E4F28568];
        id v96 = [NSString alloc];
        uint64_t v229 = objc_opt_class();
        v97 = v96;
        v21 = v273;
        id v257 = (id)[v97 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v229, @"category"];
        id v324 = v257;
        uint64_t v98 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v324 forKeys:&v323 count:1];
        v99 = v94;
        uint64_t v22 = v271;
        v253 = (void *)v98;
        id v100 = (id)objc_msgSend(v99, "initWithDomain:code:userInfo:", v95, 2);
        uint64_t v19 = 0;
        v90 = 0;
        *a4 = v100;
        int v48 = v269;
        uint64_t v17 = v270;
        v53 = v265;
        goto LABEL_230;
      }
      v90 = 0;
      uint64_t v19 = 0;
LABEL_137:
      int v48 = v269;
      uint64_t v17 = v270;
      v53 = v265;
      goto LABEL_231;
    }
  }
  id v255 = 0;
LABEL_37:
  uint64_t v33 = [v5 objectForKeyedSubscript:@"isGroupMessage"];
  v253 = (void *)v33;
  if (v33 && (v34 = (void *)v33, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        id v257 = 0;
        uint64_t v19 = 0;
        int v48 = v269;
        uint64_t v17 = v270;
        v53 = v265;
        v90 = v255;
        goto LABEL_230;
      }
      id v123 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v124 = *MEMORY[0x1E4F502C8];
      uint64_t v321 = *MEMORY[0x1E4F28568];
      id v125 = [NSString alloc];
      uint64_t v230 = objc_opt_class();
      v126 = v125;
      v21 = v273;
      id v254 = (id)[v126 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v230, @"isGroupMessage"];
      id v322 = v254;
      uint64_t v127 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v322 forKeys:&v321 count:1];
      v128 = v123;
      uint64_t v22 = v271;
      v250 = (void *)v127;
      id v129 = (id)objc_msgSend(v128, "initWithDomain:code:userInfo:", v124, 2);
      uint64_t v19 = 0;
      id v257 = 0;
      *a4 = v129;
      goto LABEL_168;
    }
    id v257 = v34;
  }
  else
  {
    id v257 = 0;
  }
  uint64_t v35 = [v5 objectForKeyedSubscript:@"isTimeSensitive"];
  v250 = (void *)v35;
  if (v35)
  {
    int v36 = (void *)v35;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v254 = v36;
        goto LABEL_43;
      }
      if (a4)
      {
        id v133 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v134 = *MEMORY[0x1E4F502C8];
        uint64_t v319 = *MEMORY[0x1E4F28568];
        id v135 = [NSString alloc];
        uint64_t v231 = objc_opt_class();
        v136 = v135;
        v21 = v273;
        id v251 = (id)[v136 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v231, @"isTimeSensitive"];
        id v320 = v251;
        uint64_t v137 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v320 forKeys:&v319 count:1];
        v138 = v133;
        uint64_t v22 = v271;
        v248 = (void *)v137;
        id v139 = (id)objc_msgSend(v138, "initWithDomain:code:userInfo:", v134, 2);
        uint64_t v19 = 0;
        id v254 = 0;
        *a4 = v139;
        goto LABEL_172;
      }
      id v254 = 0;
      uint64_t v19 = 0;
LABEL_168:
      int v48 = v269;
      uint64_t v17 = v270;
      v53 = v265;
      v90 = v255;
      goto LABEL_229;
    }
  }
  id v254 = 0;
LABEL_43:
  uint64_t v37 = [v5 objectForKeyedSubscript:@"isCritical"];
  v248 = (void *)v37;
  if (v37)
  {
    uint64_t v38 = (void *)v37;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v251 = v38;
        goto LABEL_46;
      }
      if (a4)
      {
        id v140 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v141 = *MEMORY[0x1E4F502C8];
        uint64_t v317 = *MEMORY[0x1E4F28568];
        id v142 = [NSString alloc];
        uint64_t v232 = objc_opt_class();
        v143 = v142;
        v21 = v273;
        id v249 = (id)[v143 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v232, @"isCritical"];
        id v318 = v249;
        uint64_t v144 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v318 forKeys:&v317 count:1];
        v145 = v140;
        uint64_t v22 = v271;
        v245 = (void *)v144;
        id v146 = (id)objc_msgSend(v145, "initWithDomain:code:userInfo:", v141, 2);
        uint64_t v19 = 0;
        id v251 = 0;
        *a4 = v146;
        goto LABEL_174;
      }
      id v251 = 0;
      uint64_t v19 = 0;
LABEL_172:
      int v48 = v269;
      uint64_t v17 = v270;
      v53 = v265;
      v90 = v255;
      goto LABEL_228;
    }
  }
  id v251 = 0;
LABEL_46:
  uint64_t v39 = [v5 objectForKeyedSubscript:@"isCommunicationNotification"];
  v245 = (void *)v39;
  if (v39)
  {
    v40 = (void *)v39;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v249 = v40;
        goto LABEL_49;
      }
      if (a4)
      {
        id v147 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v148 = *MEMORY[0x1E4F502C8];
        uint64_t v315 = *MEMORY[0x1E4F28568];
        id v149 = [NSString alloc];
        uint64_t v233 = objc_opt_class();
        v150 = v149;
        v21 = v273;
        v151 = (void *)[v150 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v233, @"isCommunicationNotification"];
        v316 = v151;
        uint64_t v152 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v316 forKeys:&v315 count:1];
        v153 = v147;
        uint64_t v22 = v271;
        v242 = (void *)v152;
        id v154 = (id)objc_msgSend(v153, "initWithDomain:code:userInfo:", v148, 2);
        uint64_t v19 = 0;
        id v249 = 0;
        *a4 = v154;
        goto LABEL_176;
      }
      id v249 = 0;
      uint64_t v19 = 0;
LABEL_174:
      int v48 = v269;
      uint64_t v17 = v270;
      v53 = v265;
      goto LABEL_227;
    }
  }
  id v249 = 0;
LABEL_49:
  uint64_t v41 = [v5 objectForKeyedSubscript:@"contentProtection"];
  v242 = (void *)v41;
  if (v41)
  {
    int v42 = (void *)v41;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v247 = v42;
        goto LABEL_52;
      }
      if (a4)
      {
        id v155 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v156 = *MEMORY[0x1E4F502C8];
        uint64_t v313 = *MEMORY[0x1E4F28568];
        id v157 = [NSString alloc];
        uint64_t v234 = objc_opt_class();
        v158 = v157;
        v21 = v273;
        id v246 = (id)[v158 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v234, @"contentProtection"];
        id v314 = v246;
        uint64_t v159 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v314 forKeys:&v313 count:1];
        v160 = v155;
        uint64_t v22 = v271;
        v241 = (void *)v159;
        id v161 = (id)objc_msgSend(v160, "initWithDomain:code:userInfo:", v156, 2);
        uint64_t v19 = 0;
        v151 = 0;
        *a4 = v161;
        int v48 = v269;
        uint64_t v17 = v270;
        v53 = v265;
        goto LABEL_225;
      }
      v151 = 0;
      uint64_t v19 = 0;
LABEL_176:
      int v48 = v269;
      uint64_t v17 = v270;
      v53 = v265;
      goto LABEL_226;
    }
  }
  id v247 = 0;
LABEL_52:
  uint64_t v43 = [v5 objectForKeyedSubscript:@"personaId"];
  v241 = (void *)v43;
  if (v43 && (uint64_t v44 = (void *)v43, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v162 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v163 = *MEMORY[0x1E4F502C8];
        uint64_t v311 = *MEMORY[0x1E4F28568];
        id v164 = [NSString alloc];
        uint64_t v235 = objc_opt_class();
        v165 = v164;
        v21 = v273;
        obuint64_t j = (id)[v165 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v235, @"personaId"];
        id v312 = obj;
        uint64_t v166 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v312 forKeys:&v311 count:1];
        v167 = v162;
        uint64_t v22 = v271;
        v256 = (void *)v166;
        id v168 = (id)objc_msgSend(v167, "initWithDomain:code:userInfo:", v163, 2);
        uint64_t v19 = 0;
        id v246 = 0;
        *a4 = v168;
        int v48 = v269;
        uint64_t v17 = v270;
        v53 = v265;
        goto LABEL_223;
      }
      id v246 = 0;
      uint64_t v19 = 0;
      int v48 = v269;
      uint64_t v17 = v270;
      v53 = v265;
      v151 = v247;
      goto LABEL_225;
    }
    id v246 = v44;
  }
  else
  {
    id v246 = 0;
  }
  v45 = [v5 objectForKeyedSubscript:@"attachments"];
  id v46 = [MEMORY[0x1E4F1CA98] null];
  int v47 = [v45 isEqual:v46];

  v243 = v6;
  id v244 = v7;
  if (v47)
  {
  }
  else if (v45)
  {
    objc_opt_class();
    obuint64_t j = v45;
    uint64_t v22 = v271;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        uint64_t v19 = 0;
        int v48 = v269;
        uint64_t v17 = v270;
        v53 = v265;
        v151 = v247;
        goto LABEL_224;
      }
      id v188 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v189 = *MEMORY[0x1E4F502C8];
      uint64_t v309 = *MEMORY[0x1E4F28568];
      v256 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"attachments"];
      v310 = v256;
      id v120 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v310 forKeys:&v309 count:1];
      uint64_t v190 = v189;
      uint64_t v22 = v271;
      uint64_t v19 = 0;
      *a4 = (id)[v188 initWithDomain:v190 code:2 userInfo:v120];
      goto LABEL_170;
    }
    v101 = v45;
    goto LABEL_101;
  }
  v101 = 0;
  uint64_t v22 = v271;
LABEL_101:
  v256 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v101, "count"));
  long long v286 = 0u;
  long long v287 = 0u;
  long long v288 = 0u;
  long long v289 = 0u;
  obuint64_t j = v101;
  uint64_t v102 = [obj countByEnumeratingWithState:&v286 objects:v308 count:16];
  id v104 = v262;
  id v103 = v263;
  id v105 = v266;
  id v106 = v260;
  id v108 = v254;
  id v107 = v255;
  id v109 = v257;
  id v110 = v251;
  id v111 = v249;
  id v112 = v246;
  if (!v102) {
    goto LABEL_111;
  }
  uint64_t v113 = *(void *)v287;
  do
  {
    for (uint64_t i = 0; i != v102; ++i)
    {
      if (*(void *)v287 != v113) {
        objc_enumerationMutation(obj);
      }
      v115 = *(void **)(*((void *)&v286 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v169 = a4;
        if (a4)
        {
          id v170 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v171 = *MEMORY[0x1E4F502C8];
          uint64_t v306 = *MEMORY[0x1E4F28568];
          id v116 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"attachments"];
          id v307 = v116;
          v172 = (void *)MEMORY[0x1E4F1C9E8];
          v173 = &v307;
          v174 = &v306;
          goto LABEL_144;
        }
LABEL_169:
        uint64_t v19 = 0;
        id v120 = obj;
        uint64_t v6 = v243;
        id v7 = v244;
LABEL_170:
        int v48 = v269;
        uint64_t v17 = v270;
        goto LABEL_221;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v169 = a4;
        if (!a4) {
          goto LABEL_169;
        }
        id v170 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v171 = *MEMORY[0x1E4F502C8];
        uint64_t v304 = *MEMORY[0x1E4F28568];
        id v116 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"attachments"];
        id v305 = v116;
        v172 = (void *)MEMORY[0x1E4F1C9E8];
        v173 = &v305;
        v174 = &v304;
LABEL_144:
        id v175 = [v172 dictionaryWithObjects:v173 forKeys:v174 count:1];
        v176 = v170;
        v21 = v273;
        uint64_t v19 = 0;
        id *v169 = (id)[v176 initWithDomain:v171 code:2 userInfo:v175];
        id v120 = obj;
        uint64_t v6 = v243;
        id v7 = v244;
LABEL_145:
        int v48 = v269;
        uint64_t v17 = v270;
        goto LABEL_220;
      }
      id v116 = v115;
      v117 = [BMProactiveHarvestingContentAttachment alloc];
      id v285 = 0;
      v118 = [(BMProactiveHarvestingContentAttachment *)v117 initWithJSONDictionary:v116 error:&v285];
      id v119 = v285;
      if (v119)
      {
        id v175 = v119;
        uint64_t v6 = v243;
        id v7 = v244;
        if (a4) {
          *a4 = v119;
        }

        uint64_t v19 = 0;
        id v120 = obj;
        goto LABEL_207;
      }
      [v256 addObject:v118];

      v21 = v273;
      uint64_t v22 = v271;
    }
    uint64_t v102 = [obj countByEnumeratingWithState:&v286 objects:v308 count:16];
    id v104 = v262;
    id v103 = v263;
    id v105 = v266;
    id v106 = v260;
    id v108 = v254;
    id v107 = v255;
    id v109 = v257;
    id v110 = v251;
    id v111 = v249;
    id v112 = v246;
  }
  while (v102);
LABEL_111:
  id v246 = v112;
  id v249 = v111;
  id v251 = v110;
  id v254 = v108;
  id v255 = v107;
  id v257 = v109;
  id v260 = v106;
  id v262 = v104;
  id v263 = v103;

  id v120 = [v5 objectForKeyedSubscript:@"fromHandles"];
  v121 = [MEMORY[0x1E4F1CA98] null];
  int v122 = [v120 isEqual:v121];

  if (!v122)
  {
    id v266 = v105;
    uint64_t v6 = v243;
    id v7 = v244;
    v53 = v265;
    if (!v120) {
      goto LABEL_152;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_152;
    }
    if (!a4)
    {
      uint64_t v19 = 0;
      int v48 = v269;
      uint64_t v17 = v270;
      uint64_t v22 = v271;
      goto LABEL_222;
    }
    id v212 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v213 = *MEMORY[0x1E4F502C8];
    uint64_t v302 = *MEMORY[0x1E4F28568];
    id v116 = (id)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"fromHandles"];
    id v303 = v116;
    id v175 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v303 forKeys:&v302 count:1];
    uint64_t v214 = v213;
    v21 = v273;
    id v215 = (id)[v212 initWithDomain:v214 code:2 userInfo:v175];
    uint64_t v19 = 0;
    *a4 = v215;
    goto LABEL_145;
  }

  id v120 = 0;
  uint64_t v6 = v243;
  id v7 = v244;
LABEL_152:
  id v116 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v120, "count"));
  long long v281 = 0u;
  long long v282 = 0u;
  long long v283 = 0u;
  long long v284 = 0u;
  id v120 = v120;
  uint64_t v177 = [v120 countByEnumeratingWithState:&v281 objects:v301 count:16];
  if (!v177) {
    goto LABEL_162;
  }
  uint64_t v178 = v177;
  uint64_t v179 = *(void *)v282;
  id v239 = v120;
  do
  {
    for (uint64_t j = 0; j != v178; ++j)
    {
      if (*(void *)v282 != v179) {
        objc_enumerationMutation(v239);
      }
      v181 = *(void **)(*((void *)&v281 + 1) + 8 * j);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v191 = a4;
        if (a4)
        {
          id v192 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v193 = *MEMORY[0x1E4F502C8];
          uint64_t v299 = *MEMORY[0x1E4F28568];
          id v182 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"fromHandles"];
          id v300 = v182;
          v194 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v300 forKeys:&v299 count:1];
          v195 = v192;
          uint64_t v196 = v193;
          goto LABEL_183;
        }
LABEL_206:
        uint64_t v19 = 0;
        id v120 = v239;
        id v175 = v239;
LABEL_207:
        int v48 = v269;
        uint64_t v17 = v270;
        v21 = v273;
        goto LABEL_220;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v191 = a4;
        if (!a4) {
          goto LABEL_206;
        }
        id v197 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v198 = *MEMORY[0x1E4F502C8];
        uint64_t v297 = *MEMORY[0x1E4F28568];
        id v182 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"fromHandles"];
        id v298 = v182;
        v194 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v298 forKeys:&v297 count:1];
        v195 = v197;
        uint64_t v196 = v198;
LABEL_183:
        id *v191 = (id)[v195 initWithDomain:v196 code:2 userInfo:v194];

LABEL_187:
        uint64_t v19 = 0;
        id v120 = v239;
        id v175 = v239;
        int v48 = v269;
        uint64_t v17 = v270;
        v21 = v273;
        goto LABEL_219;
      }
      id v182 = v181;
      v183 = [BMProactiveHarvestingNamedHandle alloc];
      id v280 = 0;
      v184 = [(BMProactiveHarvestingNamedHandle *)v183 initWithJSONDictionary:v182 error:&v280];
      id v185 = v280;
      if (v185)
      {
        v199 = v185;
        if (a4) {
          *a4 = v185;
        }

        goto LABEL_187;
      }
      [v116 addObject:v184];

      uint64_t v6 = v243;
      id v7 = v244;
    }
    id v120 = v239;
    uint64_t v178 = [v239 countByEnumeratingWithState:&v281 objects:v301 count:16];
  }
  while (v178);
LABEL_162:

  id v175 = [v5 objectForKeyedSubscript:@"toHandles"];
  v186 = [MEMORY[0x1E4F1CA98] null];
  int v187 = [v175 isEqual:v186];

  if (v187)
  {

    id v175 = 0;
    goto LABEL_192;
  }
  if (v175)
  {
    objc_opt_class();
    v21 = v273;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v200 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v201 = *MEMORY[0x1E4F502C8];
        uint64_t v295 = *MEMORY[0x1E4F28568];
        id v182 = (id)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"toHandles"];
        id v296 = v182;
        v202 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v296 forKeys:&v295 count:1];
        uint64_t v203 = v201;
        v21 = v273;
        *a4 = (id)[v200 initWithDomain:v203 code:2 userInfo:v202];

        uint64_t v19 = 0;
        int v48 = v269;
        uint64_t v17 = v270;
        goto LABEL_219;
      }
      uint64_t v19 = 0;
      goto LABEL_145;
    }
  }
  else
  {
LABEL_192:
    v21 = v273;
  }
  id v182 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v175, "count"));
  long long v276 = 0u;
  long long v277 = 0u;
  long long v278 = 0u;
  long long v279 = 0u;
  id v175 = v175;
  uint64_t v204 = [v175 countByEnumeratingWithState:&v276 objects:v294 count:16];
  if (!v204) {
    goto LABEL_203;
  }
  uint64_t v205 = v204;
  uint64_t v237 = *(void *)v277;
  id v240 = v120;
  while (2)
  {
    uint64_t v206 = 0;
    while (2)
    {
      if (*(void *)v277 != v237) {
        objc_enumerationMutation(v175);
      }
      v207 = *(void **)(*((void *)&v276 + 1) + 8 * v206);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v48 = v269;
        uint64_t v17 = v270;
        v216 = a4;
        id v120 = v240;
        if (a4)
        {
          id v238 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v236 = *MEMORY[0x1E4F502C8];
          uint64_t v292 = *MEMORY[0x1E4F28568];
          id v208 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"toHandles"];
          id v293 = v208;
          v217 = (void *)MEMORY[0x1E4F1C9E8];
          v218 = &v293;
          v219 = &v292;
LABEL_213:
          v220 = [v217 dictionaryWithObjects:v218 forKeys:v219 count:1];
          id *v216 = (id)[v238 initWithDomain:v236 code:2 userInfo:v220];
LABEL_217:

          v21 = v273;
        }
LABEL_218:

        uint64_t v19 = 0;
        goto LABEL_219;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v48 = v269;
        uint64_t v17 = v270;
        v216 = a4;
        id v120 = v240;
        if (a4)
        {
          id v238 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v236 = *MEMORY[0x1E4F502C8];
          uint64_t v290 = *MEMORY[0x1E4F28568];
          id v208 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"toHandles"];
          id v291 = v208;
          v217 = (void *)MEMORY[0x1E4F1C9E8];
          v218 = &v291;
          v219 = &v290;
          goto LABEL_213;
        }
        goto LABEL_218;
      }
      id v208 = v207;
      v209 = [BMProactiveHarvestingNamedHandle alloc];
      id v275 = 0;
      v210 = [(BMProactiveHarvestingNamedHandle *)v209 initWithJSONDictionary:v208 error:&v275];
      id v211 = v275;
      if (v211)
      {
        v220 = v211;
        if (a4) {
          *a4 = v211;
        }

        int v48 = v269;
        uint64_t v17 = v270;
        id v120 = v240;
        goto LABEL_217;
      }
      [v182 addObject:v210];

      ++v206;
      v21 = v273;
      if (v205 != v206) {
        continue;
      }
      break;
    }
    id v120 = v240;
    uint64_t v205 = [v175 countByEnumeratingWithState:&v276 objects:v294 count:16];
    if (v205) {
      continue;
    }
    break;
  }
LABEL_203:

  int v48 = v269;
  uint64_t v17 = v270;
  uint64_t v19 = objc_retain(-[BMProactiveHarvestingNotifications initWithUniqueID:absoluteTimestamp:bundleID:notificationID:title:subtitle:body:threadID:category:isGroupMessage:isTimeSensitive:isCritical:isCommunicationNotification:contentProtection:personaId:attachments:fromHandles:toHandles:](v267, "initWithUniqueID:absoluteTimestamp:bundleID:notificationID:title:subtitle:body:threadID:category:isGroupMessage:isTimeSensitive:isCritical:isCommunicationNotification:contentProtection:personaId:attachments:fromHandles:toHandles:", v244, v270, v269, v265, v263, v266, v262, v260, v255, v257, v254, v251, v249, v247, v246,
            v256,
            v116,
            v182));
  v267 = v19;
LABEL_219:

  uint64_t v6 = v243;
  id v7 = v244;
LABEL_220:

  uint64_t v22 = v271;
LABEL_221:
  v53 = v265;
LABEL_222:

LABEL_223:
  v151 = v247;

LABEL_224:
LABEL_225:

LABEL_226:
LABEL_227:
  v90 = v255;

LABEL_228:
LABEL_229:

LABEL_230:
LABEL_231:

LABEL_232:
  int v61 = v263;

LABEL_233:
LABEL_234:

LABEL_235:
  self = v267;
LABEL_236:

LABEL_237:
LABEL_238:

LABEL_239:
  return v19;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMProactiveHarvestingNotifications *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uniqueID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_notificationID) {
    PBDataWriterWriteStringField();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_subtitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_body) {
    PBDataWriterWriteStringField();
  }
  if (self->_threadID) {
    PBDataWriterWriteStringField();
  }
  if (self->_category) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasIsGroupMessage) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsTimeSensitive) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsCritical) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsCommunicationNotification) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_contentProtection) {
    PBDataWriterWriteStringField();
  }
  if (self->_personaId) {
    PBDataWriterWriteStringField();
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = self->_attachments;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v32 + 1) + 8 * v9);
        uint64_t v31 = 0;
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v7);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = self->_fromHandles;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * v15);
        uint64_t v31 = 0;
        PBDataWriterPlaceMark();
        [v16 writeTo:v4];
        PBDataWriterRecallMark();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v13);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v17 = self->_toHandles;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v23 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v23 + 1) + 8 * v21);
        uint64_t v31 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v22, "writeTo:", v4, (void)v23);
        PBDataWriterRecallMark();
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v23 objects:v36 count:16];
    }
    while (v19);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)BMProactiveHarvestingNotifications;
  id v5 = [(BMEventBase *)&v73 init];
  if (!v5) {
    goto LABEL_96;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (int *)MEMORY[0x1E4F940E8];
  id v10 = (int *)MEMORY[0x1E4F940E0];
  id v11 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v12 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v11]) {
        break;
      }
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v9;
        uint64_t v17 = *(void *)&v4[v16];
        unint64_t v18 = v17 + 1;
        if (v17 == -1 || v18 > *(void *)&v4[*v10]) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)&v4[*v12] + v17);
        *(void *)&v4[v16] = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0) {
          goto LABEL_13;
        }
        v13 += 7;
        BOOL v20 = v14++ >= 9;
        if (v20)
        {
          unint64_t v15 = 0;
          int v21 = v4[*v11];
          goto LABEL_15;
        }
      }
      v4[*v11] = 1;
LABEL_13:
      int v21 = v4[*v11];
      if (v4[*v11]) {
        unint64_t v15 = 0;
      }
LABEL_15:
      if (v21 || (v15 & 7) == 4) {
        break;
      }
      switch((v15 >> 3))
      {
        case 1u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 48;
          goto LABEL_61;
        case 2u:
          v5->_hasRaw_absoluteTimestamp = 1;
          uint64_t v25 = *v9;
          unint64_t v26 = *(void *)&v4[v25];
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)&v4[*v10])
          {
            double v27 = *(double *)(*(void *)&v4[*v12] + v26);
            *(void *)&v4[v25] = v26 + 8;
          }
          else
          {
            v4[*v11] = 1;
            double v27 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v27;
          continue;
        case 3u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 56;
          goto LABEL_61;
        case 4u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 64;
          goto LABEL_61;
        case 5u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 72;
          goto LABEL_61;
        case 6u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 80;
          goto LABEL_61;
        case 7u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 88;
          goto LABEL_61;
        case 8u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 96;
          goto LABEL_61;
        case 9u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 104;
          goto LABEL_61;
        case 0xAu:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          v5->_hasIsGroupMessage = 1;
          while (2)
          {
            uint64_t v31 = *v9;
            uint64_t v32 = *(void *)&v4[v31];
            unint64_t v33 = v32 + 1;
            if (v32 == -1 || v33 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)&v4[*v12] + v32);
              *(void *)&v4[v31] = v33;
              v30 |= (unint64_t)(v34 & 0x7F) << v28;
              if (v34 < 0)
              {
                v28 += 7;
                BOOL v20 = v29++ >= 9;
                if (v20)
                {
                  uint64_t v30 = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            uint64_t v30 = 0;
          }
LABEL_77:
          BOOL v62 = v30 != 0;
          uint64_t v63 = 32;
          goto LABEL_90;
        case 0xBu:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          v5->_hasIsTimeSensitive = 1;
          while (2)
          {
            uint64_t v38 = *v9;
            uint64_t v39 = *(void *)&v4[v38];
            unint64_t v40 = v39 + 1;
            if (v39 == -1 || v40 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)&v4[*v12] + v39);
              *(void *)&v4[v38] = v40;
              v37 |= (unint64_t)(v41 & 0x7F) << v35;
              if (v41 < 0)
              {
                v35 += 7;
                BOOL v20 = v36++ >= 9;
                if (v20)
                {
                  uint64_t v37 = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            uint64_t v37 = 0;
          }
LABEL_81:
          BOOL v62 = v37 != 0;
          uint64_t v63 = 34;
          goto LABEL_90;
        case 0xCu:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v44 = 0;
          v5->_hasIsCritical = 1;
          while (2)
          {
            uint64_t v45 = *v9;
            uint64_t v46 = *(void *)&v4[v45];
            unint64_t v47 = v46 + 1;
            if (v46 == -1 || v47 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v48 = *(unsigned char *)(*(void *)&v4[*v12] + v46);
              *(void *)&v4[v45] = v47;
              v44 |= (unint64_t)(v48 & 0x7F) << v42;
              if (v48 < 0)
              {
                v42 += 7;
                BOOL v20 = v43++ >= 9;
                if (v20)
                {
                  uint64_t v44 = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            uint64_t v44 = 0;
          }
LABEL_85:
          BOOL v62 = v44 != 0;
          uint64_t v63 = 36;
          goto LABEL_90;
        case 0xDu:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v51 = 0;
          v5->_hasIsCommunicationNotification = 1;
          break;
        case 0xEu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 112;
          goto LABEL_61;
        case 0xFu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 120;
LABEL_61:
          id v56 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        case 0x10u:
          uint64_t v74 = 0;
          uint64_t v75 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_98;
          }
          id v57 = [[BMProactiveHarvestingContentAttachment alloc] initByReadFrom:v4];
          if (!v57) {
            goto LABEL_98;
          }
          uint64_t v58 = v57;
          id v59 = v6;
          goto LABEL_73;
        case 0x12u:
          uint64_t v74 = 0;
          uint64_t v75 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_98;
          }
          id v60 = [[BMProactiveHarvestingNamedHandle alloc] initByReadFrom:v4];
          if (!v60) {
            goto LABEL_98;
          }
          uint64_t v58 = v60;
          id v59 = v7;
          goto LABEL_73;
        case 0x13u:
          uint64_t v74 = 0;
          uint64_t v75 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_98;
          }
          id v61 = [[BMProactiveHarvestingNamedHandle alloc] initByReadFrom:v4];
          if (!v61) {
            goto LABEL_98;
          }
          uint64_t v58 = v61;
          id v59 = v8;
LABEL_73:
          [v59 addObject:v58];
          PBReaderRecallMark();

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_98:

          goto LABEL_95;
      }
      while (1)
      {
        uint64_t v52 = *v9;
        uint64_t v53 = *(void *)&v4[v52];
        unint64_t v54 = v53 + 1;
        if (v53 == -1 || v54 > *(void *)&v4[*v10]) {
          break;
        }
        char v55 = *(unsigned char *)(*(void *)&v4[*v12] + v53);
        *(void *)&v4[v52] = v54;
        v51 |= (unint64_t)(v55 & 0x7F) << v49;
        if ((v55 & 0x80) == 0) {
          goto LABEL_87;
        }
        v49 += 7;
        BOOL v20 = v50++ >= 9;
        if (v20)
        {
          uint64_t v51 = 0;
          goto LABEL_89;
        }
      }
      v4[*v11] = 1;
LABEL_87:
      if (v4[*v11]) {
        uint64_t v51 = 0;
      }
LABEL_89:
      BOOL v62 = v51 != 0;
      uint64_t v63 = 38;
LABEL_90:
      *((unsigned char *)&v5->super.super.isa + v63) = v62;
    }
    while (*(void *)&v4[*v9] < *(void *)&v4[*v10]);
  }
  uint64_t v64 = [v6 copy];
  attachments = v5->_attachments;
  v5->_attachments = (NSArray *)v64;

  uint64_t v66 = [v7 copy];
  fromHandles = v5->_fromHandles;
  v5->_fromHandles = (NSArray *)v66;

  uint64_t v68 = [v8 copy];
  toHandles = v5->_toHandles;
  v5->_toHandles = (NSArray *)v68;

  int v70 = v4[*v11];
  if (v70) {
LABEL_95:
  }
    id v71 = 0;
  else {
LABEL_96:
  }
    id v71 = v5;

  return v71;
}

- (NSString)description
{
  id v18 = [NSString alloc];
  uint64_t v23 = [(BMProactiveHarvestingNotifications *)self uniqueID];
  int v21 = [(BMProactiveHarvestingNotifications *)self absoluteTimestamp];
  uint64_t v22 = [(BMProactiveHarvestingNotifications *)self bundleID];
  BOOL v20 = [(BMProactiveHarvestingNotifications *)self notificationID];
  uint64_t v17 = [(BMProactiveHarvestingNotifications *)self title];
  uint64_t v16 = [(BMProactiveHarvestingNotifications *)self subtitle];
  unint64_t v15 = [(BMProactiveHarvestingNotifications *)self body];
  unsigned int v14 = [(BMProactiveHarvestingNotifications *)self threadID];
  char v13 = [(BMProactiveHarvestingNotifications *)self category];
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingNotifications isGroupMessage](self, "isGroupMessage"));
  id v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingNotifications isTimeSensitive](self, "isTimeSensitive"));
  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingNotifications isCritical](self, "isCritical"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingNotifications isCommunicationNotification](self, "isCommunicationNotification"));
  uint64_t v3 = [(BMProactiveHarvestingNotifications *)self contentProtection];
  id v4 = [(BMProactiveHarvestingNotifications *)self personaId];
  id v5 = [(BMProactiveHarvestingNotifications *)self attachments];
  uint64_t v6 = [(BMProactiveHarvestingNotifications *)self fromHandles];
  uint64_t v7 = [(BMProactiveHarvestingNotifications *)self toHandles];
  char v19 = objc_msgSend(v18, "initWithFormat:", @"BMProactiveHarvestingNotifications with uniqueID: %@, absoluteTimestamp: %@, bundleID: %@, notificationID: %@, title: %@, subtitle: %@, body: %@, threadID: %@, category: %@, isGroupMessage: %@, isTimeSensitive: %@, isCritical: %@, isCommunicationNotification: %@, contentProtection: %@, personaId: %@, attachments: %@, fromHandles: %@, toHandles: %@", v23, v21, v22, v20, v17, v16, v15, v14, v13, v12, v11, v10, v9, v3, v4, v5,
                  v6,
                  v7);

  return (NSString *)v19;
}

- (BMProactiveHarvestingNotifications)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 bundleID:(id)a5 notificationID:(id)a6 title:(id)a7 subtitle:(id)a8 body:(id)a9 threadID:(id)a10 category:(id)a11 isGroupMessage:(id)a12 isTimeSensitive:(id)a13 isCritical:(id)a14 isCommunicationNotification:(id)a15 contentProtection:(id)a16 personaId:(id)a17 attachments:(id)a18 fromHandles:(id)a19 toHandles:(id)a20
{
  id v48 = a3;
  id v25 = a4;
  id v47 = a5;
  id v46 = a6;
  id v34 = a7;
  id v45 = a7;
  id v44 = a8;
  id v43 = a9;
  id v42 = a10;
  id v41 = a11;
  id v26 = a12;
  id v27 = a13;
  char v28 = v25;
  id v49 = a14;
  id v29 = a15;
  id v40 = a16;
  id v39 = a17;
  id v38 = a18;
  id v37 = a19;
  id v36 = a20;
  v50.receiver = self;
  v50.super_class = (Class)BMProactiveHarvestingNotifications;
  uint64_t v30 = [(BMEventBase *)&v50 init];
  if (v30)
  {
    v30->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v30->_uniqueID, a3);
    if (v28)
    {
      v30->_hasRaw_absoluteTimestamp = 1;
      [v28 timeIntervalSinceReferenceDate];
    }
    else
    {
      v30->_hasRaw_absoluteTimestamp = 0;
      double v31 = -1.0;
    }
    v30->_raw_absoluteTimestamp = v31;
    objc_storeStrong((id *)&v30->_bundleID, a5);
    objc_storeStrong((id *)&v30->_notificationID, a6);
    objc_storeStrong((id *)&v30->_title, v34);
    objc_storeStrong((id *)&v30->_subtitle, a8);
    objc_storeStrong((id *)&v30->_body, a9);
    objc_storeStrong((id *)&v30->_threadID, a10);
    objc_storeStrong((id *)&v30->_category, a11);
    if (v26)
    {
      v30->_hasIsGroupMessage = 1;
      v30->_isGroupMessage = [v26 BOOLValue];
    }
    else
    {
      v30->_hasIsGroupMessage = 0;
      v30->_isGroupMessage = 0;
    }
    if (v27)
    {
      v30->_hasIsTimeSensitive = 1;
      v30->_isTimeSensitive = [v27 BOOLValue];
    }
    else
    {
      v30->_hasIsTimeSensitive = 0;
      v30->_isTimeSensitive = 0;
    }
    if (v49)
    {
      v30->_hasIsCritical = 1;
      v30->_isCritical = [v49 BOOLValue];
    }
    else
    {
      v30->_hasIsCritical = 0;
      v30->_isCritical = 0;
    }
    if (v29)
    {
      v30->_hasIsCommunicationNotification = 1;
      v30->_isCommunicationNotification = [v29 BOOLValue];
    }
    else
    {
      v30->_hasIsCommunicationNotification = 0;
      v30->_isCommunicationNotification = 0;
    }
    objc_storeStrong((id *)&v30->_contentProtection, a16);
    objc_storeStrong((id *)&v30->_personaId, a17);
    objc_storeStrong((id *)&v30->_attachments, a18);
    objc_storeStrong((id *)&v30->_fromHandles, a19);
    objc_storeStrong((id *)&v30->_toHandles, a20);
  }

  return v30;
}

+ (id)protoFields
{
  v23[19] = *MEMORY[0x1E4F143B8];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uniqueID" number:1 type:13 subMessageClass:0];
  v23[0] = v22;
  int v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:2 type:0 subMessageClass:0];
  v23[1] = v21;
  BOOL v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:3 type:13 subMessageClass:0];
  v23[2] = v20;
  char v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"notificationID" number:4 type:13 subMessageClass:0];
  v23[3] = v19;
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"title" number:5 type:13 subMessageClass:0];
  v23[4] = v18;
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subtitle" number:6 type:13 subMessageClass:0];
  v23[5] = v17;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"body" number:7 type:13 subMessageClass:0];
  v23[6] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"threadID" number:8 type:13 subMessageClass:0];
  v23[7] = v15;
  unsigned int v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"category" number:9 type:13 subMessageClass:0];
  v23[8] = v14;
  char v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isGroupMessage" number:10 type:12 subMessageClass:0];
  v23[9] = v13;
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isTimeSensitive" number:11 type:12 subMessageClass:0];
  v23[10] = v12;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isCritical" number:12 type:12 subMessageClass:0];
  v23[11] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isCommunicationNotification" number:13 type:12 subMessageClass:0];
  v23[12] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentProtection" number:14 type:13 subMessageClass:0];
  v23[13] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"personaId" number:15 type:13 subMessageClass:0];
  v23[14] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"attachments" number:16 type:14 subMessageClass:objc_opt_class()];
  v23[15] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"handles" number:17 type:14 subMessageClass:objc_opt_class()];
  v23[16] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fromHandles" number:18 type:14 subMessageClass:objc_opt_class()];
  v23[17] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"toHandles" number:19 type:14 subMessageClass:objc_opt_class()];
  v23[18] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:19];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5778;
}

id __45__BMProactiveHarvestingNotifications_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _toHandlesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __45__BMProactiveHarvestingNotifications_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _fromHandlesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

uint64_t __45__BMProactiveHarvestingNotifications_columns__block_invoke_2()
{
  return 0;
}

id __45__BMProactiveHarvestingNotifications_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _attachmentsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMProactiveHarvestingNotifications alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[10] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end
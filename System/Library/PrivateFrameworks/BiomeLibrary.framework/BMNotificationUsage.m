@interface BMNotificationUsage
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMNotificationUsage)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMNotificationUsage)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 usageType:(int)a5 bundleID:(id)a6 notificationID:(id)a7 deviceID:(id)a8 title:(id)a9 subtitle:(id)a10 body:(id)a11 badge:(id)a12 threadID:(id)a13 categoryID:(id)a14 sectionID:(id)a15 contactIDs:(id)a16 isGroupMessage:(id)a17;
- (BMNotificationUsage)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 usageType:(int)a5 bundleID:(id)a6 notificationID:(id)a7 deviceID:(id)a8 title:(id)a9 subtitle:(id)a10 body:(id)a11 badge:(id)a12 threadID:(id)a13 categoryID:(id)a14 sectionID:(id)a15 contactIDs:(id)a16 isGroupMessage:(id)a17 parentBundleID:(id)a18 bodyLength:(id)a19;
- (BOOL)hasBadge;
- (BOOL)hasBodyLength;
- (BOOL)hasIsGroupMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupMessage;
- (NSArray)contactIDs;
- (NSDate)absoluteTimestamp;
- (NSString)body;
- (NSString)bundleID;
- (NSString)categoryID;
- (NSString)description;
- (NSString)deviceID;
- (NSString)notificationID;
- (NSString)parentBundleID;
- (NSString)sectionID;
- (NSString)subtitle;
- (NSString)threadID;
- (NSString)title;
- (NSString)uniqueID;
- (id)_contactIDsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)usageType;
- (unint64_t)badge;
- (unsigned)bodyLength;
- (unsigned)dataVersion;
- (void)setHasBadge:(BOOL)a3;
- (void)setHasBodyLength:(BOOL)a3;
- (void)setHasIsGroupMessage:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMNotificationUsage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentBundleID, 0);
  objc_storeStrong((id *)&self->_contactIDs, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_categoryID, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_notificationID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

- (void)setHasBodyLength:(BOOL)a3
{
  self->_hasBodyLength = a3;
}

- (BOOL)hasBodyLength
{
  return self->_hasBodyLength;
}

- (unsigned)bodyLength
{
  return self->_bodyLength;
}

- (NSString)parentBundleID
{
  return self->_parentBundleID;
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

- (NSArray)contactIDs
{
  return self->_contactIDs;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (NSString)categoryID
{
  return self->_categoryID;
}

- (NSString)threadID
{
  return self->_threadID;
}

- (void)setHasBadge:(BOOL)a3
{
  self->_hasBadge = a3;
}

- (BOOL)hasBadge
{
  return self->_hasBadge;
}

- (unint64_t)badge
{
  return self->_badge;
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

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSString)notificationID
{
  return self->_notificationID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (int)usageType
{
  return self->_usageType;
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
    v6 = [(BMNotificationUsage *)self uniqueID];
    uint64_t v7 = [v5 uniqueID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMNotificationUsage *)self uniqueID];
      v10 = [v5 uniqueID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_71;
      }
    }
    v13 = [(BMNotificationUsage *)self absoluteTimestamp];
    uint64_t v14 = [v5 absoluteTimestamp];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMNotificationUsage *)self absoluteTimestamp];
      v17 = [v5 absoluteTimestamp];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_71;
      }
    }
    int v19 = [(BMNotificationUsage *)self usageType];
    if (v19 == [v5 usageType])
    {
      v20 = [(BMNotificationUsage *)self bundleID];
      uint64_t v21 = [v5 bundleID];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMNotificationUsage *)self bundleID];
        v24 = [v5 bundleID];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_71;
        }
      }
      v26 = [(BMNotificationUsage *)self notificationID];
      uint64_t v27 = [v5 notificationID];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        v29 = [(BMNotificationUsage *)self notificationID];
        v30 = [v5 notificationID];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_71;
        }
      }
      v32 = [(BMNotificationUsage *)self deviceID];
      uint64_t v33 = [v5 deviceID];
      if (v32 == (void *)v33)
      {
      }
      else
      {
        v34 = (void *)v33;
        v35 = [(BMNotificationUsage *)self deviceID];
        v36 = [v5 deviceID];
        int v37 = [v35 isEqual:v36];

        if (!v37) {
          goto LABEL_71;
        }
      }
      v38 = [(BMNotificationUsage *)self title];
      uint64_t v39 = [v5 title];
      if (v38 == (void *)v39)
      {
      }
      else
      {
        v40 = (void *)v39;
        v41 = [(BMNotificationUsage *)self title];
        v42 = [v5 title];
        int v43 = [v41 isEqual:v42];

        if (!v43) {
          goto LABEL_71;
        }
      }
      v44 = [(BMNotificationUsage *)self subtitle];
      uint64_t v45 = [v5 subtitle];
      if (v44 == (void *)v45)
      {
      }
      else
      {
        v46 = (void *)v45;
        v47 = [(BMNotificationUsage *)self subtitle];
        v48 = [v5 subtitle];
        int v49 = [v47 isEqual:v48];

        if (!v49) {
          goto LABEL_71;
        }
      }
      v50 = [(BMNotificationUsage *)self body];
      uint64_t v51 = [v5 body];
      if (v50 == (void *)v51)
      {
      }
      else
      {
        v52 = (void *)v51;
        v53 = [(BMNotificationUsage *)self body];
        v54 = [v5 body];
        int v55 = [v53 isEqual:v54];

        if (!v55) {
          goto LABEL_71;
        }
      }
      if (-[BMNotificationUsage hasBadge](self, "hasBadge") || [v5 hasBadge])
      {
        if (![(BMNotificationUsage *)self hasBadge]) {
          goto LABEL_71;
        }
        if (![v5 hasBadge]) {
          goto LABEL_71;
        }
        unint64_t v56 = [(BMNotificationUsage *)self badge];
        if (v56 != [v5 badge]) {
          goto LABEL_71;
        }
      }
      v57 = [(BMNotificationUsage *)self threadID];
      uint64_t v58 = [v5 threadID];
      if (v57 == (void *)v58)
      {
      }
      else
      {
        v59 = (void *)v58;
        v60 = [(BMNotificationUsage *)self threadID];
        v61 = [v5 threadID];
        int v62 = [v60 isEqual:v61];

        if (!v62) {
          goto LABEL_71;
        }
      }
      v63 = [(BMNotificationUsage *)self categoryID];
      uint64_t v64 = [v5 categoryID];
      if (v63 == (void *)v64)
      {
      }
      else
      {
        v65 = (void *)v64;
        v66 = [(BMNotificationUsage *)self categoryID];
        v67 = [v5 categoryID];
        int v68 = [v66 isEqual:v67];

        if (!v68) {
          goto LABEL_71;
        }
      }
      v69 = [(BMNotificationUsage *)self sectionID];
      uint64_t v70 = [v5 sectionID];
      if (v69 == (void *)v70)
      {
      }
      else
      {
        v71 = (void *)v70;
        v72 = [(BMNotificationUsage *)self sectionID];
        v73 = [v5 sectionID];
        int v74 = [v72 isEqual:v73];

        if (!v74) {
          goto LABEL_71;
        }
      }
      v75 = [(BMNotificationUsage *)self contactIDs];
      uint64_t v76 = [v5 contactIDs];
      if (v75 == (void *)v76)
      {
      }
      else
      {
        v77 = (void *)v76;
        v78 = [(BMNotificationUsage *)self contactIDs];
        v79 = [v5 contactIDs];
        int v80 = [v78 isEqual:v79];

        if (!v80) {
          goto LABEL_71;
        }
      }
      if ([(BMNotificationUsage *)self hasIsGroupMessage]
        || [v5 hasIsGroupMessage])
      {
        if (![(BMNotificationUsage *)self hasIsGroupMessage]) {
          goto LABEL_71;
        }
        if (![v5 hasIsGroupMessage]) {
          goto LABEL_71;
        }
        int v81 = [(BMNotificationUsage *)self isGroupMessage];
        if (v81 != [v5 isGroupMessage]) {
          goto LABEL_71;
        }
      }
      v82 = [(BMNotificationUsage *)self parentBundleID];
      uint64_t v83 = [v5 parentBundleID];
      if (v82 == (void *)v83)
      {
      }
      else
      {
        v84 = (void *)v83;
        v85 = [(BMNotificationUsage *)self parentBundleID];
        v86 = [v5 parentBundleID];
        int v87 = [v85 isEqual:v86];

        if (!v87) {
          goto LABEL_71;
        }
      }
      if (![(BMNotificationUsage *)self hasBodyLength]
        && ![v5 hasBodyLength])
      {
        BOOL v12 = 1;
        goto LABEL_72;
      }
      if ([(BMNotificationUsage *)self hasBodyLength]
        && [v5 hasBodyLength])
      {
        unsigned int v88 = [(BMNotificationUsage *)self bodyLength];
        BOOL v12 = v88 == [v5 bodyLength];
LABEL_72:

        goto LABEL_73;
      }
    }
LABEL_71:
    BOOL v12 = 0;
    goto LABEL_72;
  }
  BOOL v12 = 0;
LABEL_73:

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
  v63[17] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMNotificationUsage *)self uniqueID];
  id v4 = [(BMNotificationUsage *)self absoluteTimestamp];
  if (v4)
  {
    id v5 = NSNumber;
    v6 = [(BMNotificationUsage *)self absoluteTimestamp];
    [v6 timeIntervalSinceReferenceDate];
    objc_msgSend(v5, "numberWithDouble:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMNotificationUsage usageType](self, "usageType"));
  uint64_t v9 = [(BMNotificationUsage *)self bundleID];
  uint64_t v10 = [(BMNotificationUsage *)self notificationID];
  uint64_t v11 = [(BMNotificationUsage *)self deviceID];
  uint64_t v12 = [(BMNotificationUsage *)self title];
  v61 = [(BMNotificationUsage *)self subtitle];
  v60 = [(BMNotificationUsage *)self body];
  if ([(BMNotificationUsage *)self hasBadge])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMNotificationUsage badge](self, "badge"));
    id v59 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v59 = 0;
  }
  uint64_t v58 = [(BMNotificationUsage *)self threadID];
  v57 = [(BMNotificationUsage *)self categoryID];
  unint64_t v56 = [(BMNotificationUsage *)self sectionID];
  int v55 = [(BMNotificationUsage *)self _contactIDsJSONArray];
  if ([(BMNotificationUsage *)self hasIsGroupMessage])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMNotificationUsage isGroupMessage](self, "isGroupMessage"));
    id v54 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v54 = 0;
  }
  v53 = [(BMNotificationUsage *)self parentBundleID];
  if ([(BMNotificationUsage *)self hasBodyLength])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMNotificationUsage bodyLength](self, "bodyLength"));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = 0;
  }
  v62[0] = @"uniqueID";
  uint64_t v14 = v3;
  if (!v3)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v44 = (void *)v14;
  v63[0] = v14;
  v62[1] = @"absoluteTimestamp";
  uint64_t v15 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  int v43 = (void *)v15;
  v63[1] = v15;
  v62[2] = @"usageType";
  uint64_t v16 = v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v42 = (void *)v16;
  v63[2] = v16;
  v62[3] = @"bundleID";
  uint64_t v17 = v9;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v41 = (void *)v17;
  v63[3] = v17;
  v62[4] = @"notificationID";
  uint64_t v18 = v10;
  if (!v10)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v40 = (void *)v18;
  v63[4] = v18;
  v62[5] = @"deviceID";
  uint64_t v19 = v11;
  if (!v11)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v39 = (void *)v19;
  v63[5] = v19;
  v62[6] = @"title";
  uint64_t v20 = v12;
  if (!v12)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v38 = (void *)v20;
  v63[6] = v20;
  v62[7] = @"subtitle";
  uint64_t v21 = (uint64_t)v61;
  if (!v61)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v63[7] = v21;
  v62[8] = @"body";
  uint64_t v22 = (uint64_t)v60;
  if (!v60)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v63[8] = v22;
  v62[9] = @"badge";
  uint64_t v23 = (uint64_t)v59;
  if (!v59)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v46 = (void *)v23;
  v47 = (void *)v22;
  v63[9] = v23;
  v62[10] = @"threadID";
  uint64_t v24 = (uint64_t)v58;
  if (!v58)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v51 = v7;
  uint64_t v35 = v24;
  v63[10] = v24;
  v62[11] = @"categoryID";
  int v25 = v57;
  if (!v57)
  {
    int v25 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v24);
  }
  v52 = v13;
  v63[11] = v25;
  v62[12] = @"sectionID";
  v26 = v56;
  if (!v56)
  {
    v26 = [MEMORY[0x1E4F1CA98] null];
  }
  int v37 = (void *)v21;
  int v49 = (void *)v12;
  v50 = (void *)v11;
  v48 = (void *)v3;
  v63[12] = v26;
  v62[13] = @"contactIDs";
  uint64_t v27 = v55;
  if (!v55)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v10;
  v29 = (void *)v9;
  v63[13] = v27;
  v62[14] = @"isGroupMessage";
  v30 = v54;
  if (!v54)
  {
    v30 = [MEMORY[0x1E4F1CA98] null];
  }
  int v31 = (void *)v8;
  v63[14] = v30;
  v62[15] = @"parentBundleID";
  v32 = v53;
  if (!v53)
  {
    v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v63[15] = v32;
  v62[16] = @"bodyLength";
  id v33 = v13;
  if (!v13)
  {
    id v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v63[16] = v13;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v63, v62, 17, v35);
  id v45 = (id)objc_claimAutoreleasedReturnValue();
  if (!v33) {

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

  if (v61)
  {
    if (v49) {
      goto LABEL_67;
    }
  }
  else
  {

    if (v49)
    {
LABEL_67:
      if (v50) {
        goto LABEL_68;
      }
      goto LABEL_78;
    }
  }

  if (v50)
  {
LABEL_68:
    if (v28) {
      goto LABEL_69;
    }
    goto LABEL_79;
  }
LABEL_78:

  if (v28)
  {
LABEL_69:
    if (v29) {
      goto LABEL_70;
    }
    goto LABEL_80;
  }
LABEL_79:

  if (v29)
  {
LABEL_70:
    if (v31) {
      goto LABEL_71;
    }
    goto LABEL_81;
  }
LABEL_80:

  if (v31)
  {
LABEL_71:
    if (v51) {
      goto LABEL_72;
    }
LABEL_82:

    if (v48) {
      goto LABEL_73;
    }
    goto LABEL_83;
  }
LABEL_81:

  if (!v51) {
    goto LABEL_82;
  }
LABEL_72:
  if (v48) {
    goto LABEL_73;
  }
LABEL_83:

LABEL_73:

  return v45;
}

- (id)_contactIDsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMNotificationUsage *)self contactIDs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMNotificationUsage)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v264[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [v6 objectForKeyedSubscript:@"uniqueID"];
  v221 = v220 = self;
  if (!v221 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v218 = 0;
LABEL_4:
    uint64_t v7 = [v6 objectForKeyedSubscript:@"absoluteTimestamp"];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v10 = v7;
        id v11 = [v9 alloc];
        [v10 doubleValue];
        double v13 = v12;

        id v14 = (id)[v11 initWithTimeIntervalSinceReferenceDate:v13];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          uint64_t v8 = [v21 dateFromString:v7];

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            uint64_t v8 = 0;
            uint64_t v20 = 0;
            uint64_t v19 = v218;
            goto LABEL_166;
          }
          id v138 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v139 = *MEMORY[0x1E4F502C8];
          uint64_t v261 = *MEMORY[0x1E4F28568];
          id v23 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
          id v262 = v23;
          uint64_t v140 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v262 forKeys:&v261 count:1];
          v141 = v138;
          uint64_t v22 = (void *)v140;
          id v142 = (id)[v141 initWithDomain:v139 code:2 userInfo:v140];
          uint64_t v8 = 0;
          uint64_t v20 = 0;
          *a4 = v142;
          uint64_t v19 = v218;
          goto LABEL_165;
        }
        id v14 = v7;
      }
      uint64_t v8 = v14;
    }
    else
    {
      uint64_t v8 = 0;
    }
LABEL_16:
    uint64_t v22 = [v6 objectForKeyedSubscript:@"usageType"];
    v217 = v7;
    if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = v22;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v89 = v22;
          if (a4)
          {
            id v90 = objc_alloc(MEMORY[0x1E4F28C58]);
            v91 = v8;
            uint64_t v92 = *MEMORY[0x1E4F502C8];
            uint64_t v259 = *MEMORY[0x1E4F28568];
            v93 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"usageType"];
            v260 = v93;
            uint64_t v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v260 forKeys:&v259 count:1];
            uint64_t v95 = v92;
            uint64_t v8 = v91;
            uint64_t v20 = 0;
            *a4 = (id)[v90 initWithDomain:v95 code:2 userInfo:v94];
            a4 = v93;
            id v23 = 0;
            uint64_t v19 = v218;
            uint64_t v22 = v89;
            uint64_t v24 = (void *)v94;
            goto LABEL_164;
          }
          id v23 = 0;
          uint64_t v20 = 0;
          uint64_t v19 = v218;
LABEL_165:

          goto LABEL_166;
        }
        id v23 = [NSNumber numberWithInt:BMNotificationUsageTypeFromString(v22)];
      }
    }
    else
    {
      id v23 = 0;
    }
    uint64_t v24 = [v6 objectForKeyedSubscript:@"bundleID"];
    v219 = v24;
    v216 = v23;
    if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v214 = 0;
LABEL_22:
      uint64_t v25 = [v6 objectForKeyedSubscript:@"notificationID"];
      v215 = (void *)v25;
      if (v25 && (v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v27 = 0;
            uint64_t v20 = 0;
            uint64_t v19 = v218;
            goto LABEL_162;
          }
          int v55 = a4;
          unint64_t v56 = v7;
          v57 = v22;
          id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
          v203 = v8;
          uint64_t v59 = *MEMORY[0x1E4F502C8];
          uint64_t v255 = *MEMORY[0x1E4F28568];
          v60 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"notificationID"];
          v256 = v60;
          uint64_t v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v256 forKeys:&v255 count:1];
          int v62 = v58;
          uint64_t v22 = v57;
          uint64_t v7 = v56;
          v28 = (void *)v61;
          uint64_t v63 = v59;
          uint64_t v8 = v203;
          id v27 = 0;
          uint64_t v20 = 0;
          *int v55 = (id)[v62 initWithDomain:v63 code:2 userInfo:v61];
          goto LABEL_121;
        }
        v211 = v22;
        id v27 = v26;
      }
      else
      {
        v211 = v22;
        id v27 = 0;
      }
      v28 = [v6 objectForKeyedSubscript:@"deviceID"];
      v29 = a4;
      if (!v28 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v212 = 0;
        goto LABEL_28;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v212 = v28;
LABEL_28:
        uint64_t v30 = [v6 objectForKeyedSubscript:@"title"];
        v210 = (void *)v30;
        if (!v30 || (int v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v209 = 0;
          goto LABEL_31;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v209 = v31;
LABEL_31:
          uint64_t v32 = [v6 objectForKeyedSubscript:@"subtitle"];
          v208 = (void *)v32;
          if (!v32 || (id v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v207 = 0;
            goto LABEL_34;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v207 = v33;
LABEL_34:
            uint64_t v34 = [v6 objectForKeyedSubscript:@"body"];
            v206 = (void *)v34;
            if (!v34 || (uint64_t v35 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v205 = 0;
LABEL_37:
              uint64_t v36 = [v6 objectForKeyedSubscript:@"badge"];
              v200 = (void *)v36;
              if (v36 && (int v37 = (void *)v36, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (a4)
                  {
                    v114 = v28;
                    id v115 = v27;
                    id v116 = objc_alloc(MEMORY[0x1E4F28C58]);
                    v117 = v8;
                    uint64_t v118 = *MEMORY[0x1E4F502C8];
                    uint64_t v245 = *MEMORY[0x1E4F28568];
                    id v199 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"badge"];
                    id v246 = v199;
                    uint64_t v119 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v246 forKeys:&v245 count:1];
                    v120 = v116;
                    id v27 = v115;
                    v28 = v114;
                    uint64_t v121 = v118;
                    uint64_t v8 = v117;
                    uint64_t v24 = v219;
                    v198 = (void *)v119;
                    id v204 = 0;
                    uint64_t v20 = 0;
                    *a4 = (id)objc_msgSend(v120, "initWithDomain:code:userInfo:", v121, 2);
                    v60 = v212;
                    uint64_t v22 = v211;
                    uint64_t v7 = v217;
                    uint64_t v19 = v218;
                    goto LABEL_156;
                  }
                  id v204 = 0;
                  uint64_t v20 = 0;
                  uint64_t v22 = v211;
                  v60 = v212;
                  uint64_t v7 = v217;
                  uint64_t v19 = v218;
                  goto LABEL_157;
                }
                id v204 = v37;
              }
              else
              {
                id v204 = 0;
              }
              uint64_t v38 = [v6 objectForKeyedSubscript:@"threadID"];
              v198 = (void *)v38;
              if (v38 && (uint64_t v39 = (void *)v38, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!a4)
                  {
                    id v199 = 0;
                    uint64_t v20 = 0;
                    uint64_t v22 = v211;
                    v60 = v212;
                    uint64_t v7 = v217;
                    uint64_t v19 = v218;
                    goto LABEL_156;
                  }
                  v127 = a4;
                  v128 = v28;
                  id v129 = v27;
                  id v130 = objc_alloc(MEMORY[0x1E4F28C58]);
                  v131 = v8;
                  uint64_t v132 = *MEMORY[0x1E4F502C8];
                  uint64_t v243 = *MEMORY[0x1E4F28568];
                  id v197 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"threadID"];
                  id v244 = v197;
                  uint64_t v133 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v244 forKeys:&v243 count:1];
                  v134 = v130;
                  id v27 = v129;
                  v28 = v128;
                  v60 = v212;
                  uint64_t v135 = v132;
                  uint64_t v8 = v131;
                  v196 = (void *)v133;
                  id v199 = 0;
                  uint64_t v20 = 0;
                  id *v127 = (id)objc_msgSend(v134, "initWithDomain:code:userInfo:", v135, 2);
                  uint64_t v22 = v211;
                  goto LABEL_173;
                }
                id v199 = v39;
              }
              else
              {
                id v199 = 0;
              }
              uint64_t v40 = [v6 objectForKeyedSubscript:@"categoryID"];
              v196 = (void *)v40;
              if (!v40 || (v41 = (void *)v40, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v197 = 0;
                goto LABEL_46;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v197 = v41;
LABEL_46:
                v42 = [v6 objectForKeyedSubscript:@"sectionID"];
                v201 = v8;
                if (!v42 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v192 = v27;
                  id v195 = 0;
LABEL_49:
                  id v43 = [v6 objectForKeyedSubscript:@"contactIDs"];
                  v44 = [MEMORY[0x1E4F1CA98] null];
                  int v45 = [v43 isEqual:v44];

                  v191 = v28;
                  if (v45)
                  {
                    v190 = v42;
                    v46 = a4;

                    id v43 = 0;
                  }
                  else
                  {
                    if (v43)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (a4)
                        {
                          id v158 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v159 = *MEMORY[0x1E4F502C8];
                          uint64_t v237 = *MEMORY[0x1E4F28568];
                          int v80 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"contactIDs"];
                          v238 = v80;
                          uint64_t v160 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v238 forKeys:&v237 count:1];
                          id v161 = (id)[v158 initWithDomain:v159 code:2 userInfo:v160];
                          uint64_t v20 = 0;
                          *a4 = v161;
                          v150 = (void *)v160;
                          uint64_t v19 = v218;
                          id v27 = v192;
                          goto LABEL_151;
                        }
                        uint64_t v20 = 0;
                        uint64_t v19 = v218;
                        id v27 = v192;
                        goto LABEL_153;
                      }
                    }
                    v190 = v42;
                    v46 = a4;
                  }
                  int v80 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v43, "count"));
                  long long v222 = 0u;
                  long long v223 = 0u;
                  long long v224 = 0u;
                  long long v225 = 0u;
                  id v43 = v43;
                  uint64_t v81 = [v43 countByEnumeratingWithState:&v222 objects:v236 count:16];
                  if (!v81) {
                    goto LABEL_91;
                  }
                  uint64_t v82 = v81;
                  uint64_t v83 = *(void *)v223;
LABEL_84:
                  uint64_t v84 = 0;
                  while (1)
                  {
                    if (*(void *)v223 != v83) {
                      objc_enumerationMutation(v43);
                    }
                    uint64_t v85 = *(void *)(*((void *)&v222 + 1) + 8 * v84);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      break;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (v46)
                      {
                        id v136 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v137 = *MEMORY[0x1E4F502C8];
                        uint64_t v232 = *MEMORY[0x1E4F28568];
                        v186 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contactIDs"];
                        v233 = v186;
                        uint64_t v124 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v233 forKeys:&v232 count:1];
                        v125 = v136;
                        uint64_t v126 = v137;
                        goto LABEL_117;
                      }
                      goto LABEL_124;
                    }
                    [v80 addObject:v85];
                    if (v82 == ++v84)
                    {
                      uint64_t v82 = [v43 countByEnumeratingWithState:&v222 objects:v236 count:16];
                      if (v82) {
                        goto LABEL_84;
                      }
LABEL_91:

                      uint64_t v86 = [v6 objectForKeyedSubscript:@"isGroupMessage"];
                      v186 = (void *)v86;
                      if (!v86)
                      {
                        id v188 = 0;
                        v28 = v191;
                        id v27 = v192;
                        id v88 = v212;
                        goto LABEL_140;
                      }
                      int v87 = (void *)v86;
                      objc_opt_class();
                      id v27 = v192;
                      id v88 = v212;
                      if (objc_opt_isKindOfClass())
                      {
                        id v188 = 0;
                        v28 = v191;
LABEL_140:
                        uint64_t v164 = [v6 objectForKeyedSubscript:@"parentBundleID"];
                        v184 = (void *)v164;
                        if (v164 && (v165 = (void *)v164, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v187 = v165;
                            v28 = v191;
                            goto LABEL_143;
                          }
                          if (v46)
                          {
                            id v174 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v175 = *MEMORY[0x1E4F502C8];
                            uint64_t v228 = *MEMORY[0x1E4F28568];
                            v182 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"parentBundleID"];
                            v229 = v182;
                            v194 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v229 forKeys:&v228 count:1];
                            uint64_t v20 = 0;
                            id v187 = 0;
                            id *v46 = (id)objc_msgSend(v174, "initWithDomain:code:userInfo:", v175, 2);
                            uint64_t v19 = v218;
                            uint64_t v24 = v219;
                            v28 = v191;
                            goto LABEL_147;
                          }
                          id v187 = 0;
                          uint64_t v20 = 0;
                          uint64_t v19 = v218;
                          uint64_t v24 = v219;
                          v42 = v190;
                          v28 = v191;
                        }
                        else
                        {
                          id v187 = 0;
LABEL_143:
                          uint64_t v166 = [v6 objectForKeyedSubscript:@"bodyLength"];
                          v194 = (void *)v166;
                          if (!v166 || (v167 = (void *)v166, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v168 = 0;
                            uint64_t v19 = v218;
                            goto LABEL_146;
                          }
                          objc_opt_class();
                          uint64_t v19 = v218;
                          if (objc_opt_isKindOfClass())
                          {
                            id v168 = v167;
LABEL_146:
                            uint64_t v24 = v219;
                            v182 = v168;
                            uint64_t v20 = objc_retain(-[BMNotificationUsage initWithUniqueID:absoluteTimestamp:usageType:bundleID:notificationID:deviceID:title:subtitle:body:badge:threadID:categoryID:sectionID:contactIDs:isGroupMessage:parentBundleID:bodyLength:](v220, "initWithUniqueID:absoluteTimestamp:usageType:bundleID:notificationID:deviceID:title:subtitle:body:badge:threadID:categoryID:sectionID:contactIDs:isGroupMessage:parentBundleID:bodyLength:", v19, v201, [v216 intValue], v214, v27, v88, v209, v207, v205, v204, v199, v197, v195, v80,
                                      v188,
                                      v187,
                                      v168));
                            v220 = v20;
                          }
                          else
                          {
                            uint64_t v24 = v219;
                            if (v46)
                            {
                              id v183 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v181 = *MEMORY[0x1E4F502C8];
                              uint64_t v226 = *MEMORY[0x1E4F28568];
                              id v213 = v88;
                              v176 = v28;
                              id v177 = v27;
                              v178 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"bodyLength"];
                              v227 = v178;
                              v179 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v227 forKeys:&v226 count:1];
                              id *v46 = (id)[v183 initWithDomain:v181 code:2 userInfo:v179];

                              id v27 = v177;
                              v28 = v176;
                              id v88 = v213;
                            }
                            v182 = 0;
                            uint64_t v20 = 0;
                          }
LABEL_147:
                          v42 = v190;
                        }
LABEL_149:
                        id v212 = v88;

                        v150 = v188;
                      }
                      else
                      {
                        objc_opt_class();
                        char isKindOfClass = objc_opt_isKindOfClass();
                        v163 = v87;
                        v28 = v191;
                        if (isKindOfClass)
                        {
                          id v188 = v163;
                          goto LABEL_140;
                        }
                        if (v46)
                        {
                          id v170 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v189 = *MEMORY[0x1E4F502C8];
                          uint64_t v230 = *MEMORY[0x1E4F28568];
                          id v171 = [NSString alloc];
                          uint64_t v180 = objc_opt_class();
                          v172 = v171;
                          id v27 = v192;
                          v28 = v191;
                          id v88 = v212;
                          id v187 = (id)[v172 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v180, @"isGroupMessage"];
                          id v231 = v187;
                          v185 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v231 forKeys:&v230 count:1];
                          id v173 = (id)objc_msgSend(v170, "initWithDomain:code:userInfo:", v189, 2);
                          uint64_t v20 = 0;
                          id v188 = 0;
                          id *v46 = v173;
                          uint64_t v19 = v218;
                          uint64_t v24 = v219;
                          v42 = v190;

                          goto LABEL_149;
                        }
                        v150 = 0;
                        uint64_t v20 = 0;
                        uint64_t v19 = v218;
                        uint64_t v24 = v219;
                        v42 = v190;
                      }

LABEL_151:
LABEL_152:

LABEL_153:
                      v60 = v212;

                      uint64_t v8 = v201;
                      uint64_t v22 = v211;
LABEL_154:

                      uint64_t v7 = v217;
LABEL_155:

LABEL_156:
LABEL_157:

LABEL_158:
LABEL_159:

LABEL_160:
LABEL_161:

LABEL_162:
                      id v54 = v215;
                      id v23 = v216;
                      a4 = v214;
LABEL_163:

                      goto LABEL_164;
                    }
                  }
                  if (v46)
                  {
                    id v122 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v123 = *MEMORY[0x1E4F502C8];
                    uint64_t v234 = *MEMORY[0x1E4F28568];
                    v186 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"contactIDs"];
                    v235 = v186;
                    uint64_t v124 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v235 forKeys:&v234 count:1];
                    v125 = v122;
                    uint64_t v126 = v123;
LABEL_117:
                    id v187 = (id)v124;
                    uint64_t v24 = v219;
                    v28 = v191;
                    uint64_t v20 = 0;
                    id *v46 = (id)objc_msgSend(v125, "initWithDomain:code:userInfo:", v126, 2);
                    id v188 = v43;
                    uint64_t v19 = v218;
                    id v27 = v192;
                    id v88 = v212;
                    v42 = v190;
                    goto LABEL_149;
                  }
LABEL_124:
                  uint64_t v20 = 0;
                  v150 = v43;
                  uint64_t v19 = v218;
                  uint64_t v24 = v219;
                  v28 = v191;
                  id v27 = v192;
                  v42 = v190;
                  goto LABEL_151;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v192 = v27;
                  id v195 = v42;
                  goto LABEL_49;
                }
                if (a4)
                {
                  v151 = v42;
                  v152 = v28;
                  id v153 = v27;
                  id v154 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v155 = *MEMORY[0x1E4F502C8];
                  uint64_t v239 = *MEMORY[0x1E4F28568];
                  id v43 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sectionID"];
                  id v240 = v43;
                  int v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v240 forKeys:&v239 count:1];
                  v156 = v154;
                  id v27 = v153;
                  v28 = v152;
                  v42 = v151;
                  id v157 = (id)[v156 initWithDomain:v155 code:2 userInfo:v80];
                  id v195 = 0;
                  uint64_t v20 = 0;
                  *a4 = v157;
                  uint64_t v19 = v218;
                  goto LABEL_152;
                }
                id v195 = 0;
                uint64_t v20 = 0;
                uint64_t v22 = v211;
                v60 = v212;
LABEL_177:
                uint64_t v19 = v218;
                goto LABEL_154;
              }
              if (a4)
              {
                v193 = a4;
                v143 = v28;
                id v144 = v27;
                id v145 = objc_alloc(MEMORY[0x1E4F28C58]);
                v146 = v8;
                uint64_t v147 = *MEMORY[0x1E4F502C8];
                uint64_t v241 = *MEMORY[0x1E4F28568];
                id v195 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"categoryID"];
                id v242 = v195;
                v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v242 forKeys:&v241 count:1];
                v148 = v145;
                id v27 = v144;
                v28 = v143;
                v60 = v212;
                uint64_t v149 = v147;
                uint64_t v8 = v146;
                id v197 = 0;
                uint64_t v20 = 0;
                id *v193 = (id)[v148 initWithDomain:v149 code:2 userInfo:v42];
                uint64_t v22 = v211;
                goto LABEL_177;
              }
              id v197 = 0;
              uint64_t v20 = 0;
              uint64_t v22 = v211;
              v60 = v212;
LABEL_173:
              uint64_t v7 = v217;
              uint64_t v19 = v218;
              goto LABEL_155;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v205 = v35;
              goto LABEL_37;
            }
            if (a4)
            {
              v105 = a4;
              v106 = v28;
              id v107 = v27;
              id v108 = objc_alloc(MEMORY[0x1E4F28C58]);
              v109 = v8;
              uint64_t v110 = *MEMORY[0x1E4F502C8];
              uint64_t v247 = *MEMORY[0x1E4F28568];
              id v204 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"body"];
              id v248 = v204;
              uint64_t v111 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v248 forKeys:&v247 count:1];
              v112 = v108;
              id v27 = v107;
              v28 = v106;
              v60 = v212;
              uint64_t v113 = v110;
              uint64_t v8 = v109;
              v200 = (void *)v111;
              id v205 = 0;
              uint64_t v20 = 0;
              id *v105 = (id)objc_msgSend(v112, "initWithDomain:code:userInfo:", v113, 2);
              uint64_t v22 = v211;
              uint64_t v7 = v217;
              uint64_t v19 = v218;
              goto LABEL_157;
            }
            id v205 = 0;
            uint64_t v20 = 0;
            uint64_t v22 = v211;
            v60 = v212;
LABEL_135:
            uint64_t v7 = v217;
            uint64_t v19 = v218;
            goto LABEL_158;
          }
          if (a4)
          {
            v96 = a4;
            v97 = v28;
            id v98 = v27;
            id v99 = objc_alloc(MEMORY[0x1E4F28C58]);
            v100 = v8;
            uint64_t v101 = *MEMORY[0x1E4F502C8];
            uint64_t v249 = *MEMORY[0x1E4F28568];
            id v205 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"subtitle"];
            id v250 = v205;
            uint64_t v102 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v250 forKeys:&v249 count:1];
            v103 = v99;
            id v27 = v98;
            v28 = v97;
            v60 = v212;
            uint64_t v104 = v101;
            uint64_t v8 = v100;
            v206 = (void *)v102;
            id v207 = 0;
            uint64_t v20 = 0;
            id *v96 = (id)objc_msgSend(v103, "initWithDomain:code:userInfo:", v104, 2);
            uint64_t v22 = v211;
            goto LABEL_135;
          }
          id v207 = 0;
          uint64_t v20 = 0;
          uint64_t v22 = v211;
          v60 = v212;
LABEL_131:
          uint64_t v7 = v217;
          uint64_t v19 = v218;
          goto LABEL_159;
        }
        if (a4)
        {
          v71 = a4;
          v72 = v28;
          id v73 = v27;
          id v74 = objc_alloc(MEMORY[0x1E4F28C58]);
          v75 = v8;
          uint64_t v76 = *MEMORY[0x1E4F502C8];
          uint64_t v251 = *MEMORY[0x1E4F28568];
          id v207 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"title"];
          id v252 = v207;
          uint64_t v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v252 forKeys:&v251 count:1];
          v78 = v74;
          id v27 = v73;
          v28 = v72;
          v60 = v212;
          uint64_t v79 = v76;
          uint64_t v8 = v75;
          v208 = (void *)v77;
          id v209 = 0;
          uint64_t v20 = 0;
          id *v71 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v79, 2);
          uint64_t v22 = v211;
          goto LABEL_131;
        }
        id v209 = 0;
        uint64_t v20 = 0;
        uint64_t v22 = v211;
        v60 = v212;
LABEL_126:
        uint64_t v7 = v217;
        uint64_t v19 = v218;
        goto LABEL_160;
      }
      if (a4)
      {
        id v64 = v27;
        id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
        v66 = v8;
        uint64_t v67 = *MEMORY[0x1E4F502C8];
        uint64_t v253 = *MEMORY[0x1E4F28568];
        id v209 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deviceID"];
        id v254 = v209;
        uint64_t v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v254 forKeys:&v253 count:1];
        v69 = v65;
        id v27 = v64;
        uint64_t v70 = v67;
        uint64_t v8 = v66;
        v210 = (void *)v68;
        v60 = 0;
        uint64_t v20 = 0;
        id *v29 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v70, 2);
        uint64_t v22 = v211;
        goto LABEL_126;
      }
      v60 = 0;
      uint64_t v20 = 0;
      uint64_t v22 = v211;
      uint64_t v7 = v217;
LABEL_121:
      uint64_t v19 = v218;
      goto LABEL_161;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v214 = v24;
      goto LABEL_22;
    }
    if (a4)
    {
      v47 = v22;
      id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
      v202 = v8;
      uint64_t v49 = *MEMORY[0x1E4F502C8];
      uint64_t v257 = *MEMORY[0x1E4F28568];
      uint64_t v50 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleID"];
      uint64_t v258 = v50;
      uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v258 forKeys:&v257 count:1];
      v52 = v48;
      uint64_t v22 = v47;
      uint64_t v7 = v217;
      uint64_t v53 = v49;
      uint64_t v8 = v202;
      uint64_t v20 = 0;
      *a4 = (id)[v52 initWithDomain:v53 code:2 userInfo:v51];
      a4 = 0;
      id v54 = (void *)v51;
      id v27 = (id)v50;
      uint64_t v19 = v218;
      goto LABEL_163;
    }
    uint64_t v20 = 0;
    uint64_t v19 = v218;
LABEL_164:

    goto LABEL_165;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v218 = v221;
    goto LABEL_4;
  }
  if (a4)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = *MEMORY[0x1E4F502C8];
    uint64_t v263 = *MEMORY[0x1E4F28568];
    uint64_t v17 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"uniqueID"];
    v264[0] = v17;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v264 forKeys:&v263 count:1];
    uint64_t v18 = v16;
    uint64_t v8 = (void *)v17;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    *a4 = (id)[v15 initWithDomain:v18 code:2 userInfo:v7];
LABEL_166:

    goto LABEL_167;
  }
  uint64_t v19 = 0;
  uint64_t v20 = 0;
LABEL_167:

  return v20;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMNotificationUsage *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uniqueID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_notificationID) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceID) {
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
  if (self->_hasBadge) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_threadID) {
    PBDataWriterWriteStringField();
  }
  if (self->_categoryID) {
    PBDataWriterWriteStringField();
  }
  if (self->_sectionID) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_contactIDs;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_hasIsGroupMessage) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_parentBundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasBodyLength) {
    PBDataWriterWriteUint32Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)BMNotificationUsage;
  uint64_t v5 = [(BMEventBase *)&v62 init];
  if (!v5) {
    goto LABEL_91;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    long long v10 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v7;
        uint64_t v15 = *(void *)&v4[v14];
        unint64_t v16 = v15 + 1;
        if (v15 == -1 || v16 > *(void *)&v4[*v8]) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        BOOL v18 = v12++ >= 9;
        if (v18)
        {
          unint64_t v13 = 0;
          int v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v19 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v19 || (v13 & 7) == 4) {
        break;
      }
      switch((v13 >> 3))
      {
        case 1u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 48;
          goto LABEL_59;
        case 2u:
          v5->_hasRaw_absoluteTimestamp = 1;
          uint64_t v23 = *v7;
          unint64_t v24 = *(void *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v8])
          {
            double v25 = *(double *)(*(void *)&v4[*v10] + v24);
            *(void *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v9] = 1;
            double v25 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v25;
          continue;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          while (2)
          {
            uint64_t v29 = *v7;
            uint64_t v30 = *(void *)&v4[v29];
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)&v4[*v10] + v30);
              *(void *)&v4[v29] = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                BOOL v18 = v27++ >= 9;
                if (v18)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_72;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v28) = 0;
          }
LABEL_72:
          if (v28 >= 0x1C) {
            LODWORD(v28) = 0;
          }
          v5->_usageType = v28;
          continue;
        case 4u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 56;
          goto LABEL_59;
        case 5u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 64;
          goto LABEL_59;
        case 7u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 72;
          goto LABEL_59;
        case 8u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 80;
          goto LABEL_59;
        case 9u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 88;
          goto LABEL_59;
        case 0xAu:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 96;
          goto LABEL_59;
        case 0xBu:
          char v33 = 0;
          unsigned int v34 = 0;
          unint64_t v35 = 0;
          v5->_hasBadge = 1;
          while (2)
          {
            uint64_t v36 = *v7;
            uint64_t v37 = *(void *)&v4[v36];
            unint64_t v38 = v37 + 1;
            if (v37 == -1 || v38 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)&v4[*v10] + v37);
              *(void *)&v4[v36] = v38;
              v35 |= (unint64_t)(v39 & 0x7F) << v33;
              if (v39 < 0)
              {
                v33 += 7;
                BOOL v18 = v34++ >= 9;
                if (v18)
                {
                  unint64_t v35 = 0;
                  goto LABEL_78;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            unint64_t v35 = 0;
          }
LABEL_78:
          v5->_badge = v35;
          continue;
        case 0xCu:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 112;
          goto LABEL_59;
        case 0xDu:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 120;
          goto LABEL_59;
        case 0xEu:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 128;
          goto LABEL_59;
        case 0xFu:
          uint64_t v40 = PBReaderReadString();
          if (!v40) {
            goto LABEL_93;
          }
          v41 = (void *)v40;
          [v6 addObject:v40];

          continue;
        case 0x10u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v44 = 0;
          v5->_hasIsGroupMessage = 1;
          while (2)
          {
            uint64_t v45 = *v7;
            uint64_t v46 = *(void *)&v4[v45];
            unint64_t v47 = v46 + 1;
            if (v46 == -1 || v47 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v48 = *(unsigned char *)(*(void *)&v4[*v10] + v46);
              *(void *)&v4[v45] = v47;
              v44 |= (unint64_t)(v48 & 0x7F) << v42;
              if (v48 < 0)
              {
                v42 += 7;
                BOOL v18 = v43++ >= 9;
                if (v18)
                {
                  uint64_t v44 = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v44 = 0;
          }
LABEL_82:
          v5->_isGroupMessage = v44 != 0;
          continue;
        case 0x11u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 144;
LABEL_59:
          uint64_t v49 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        case 0x12u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v52 = 0;
          v5->_hasBodyLength = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_93:

          goto LABEL_90;
      }
      while (1)
      {
        uint64_t v53 = *v7;
        uint64_t v54 = *(void *)&v4[v53];
        unint64_t v55 = v54 + 1;
        if (v54 == -1 || v55 > *(void *)&v4[*v8]) {
          break;
        }
        char v56 = *(unsigned char *)(*(void *)&v4[*v10] + v54);
        *(void *)&v4[v53] = v55;
        v52 |= (unint64_t)(v56 & 0x7F) << v50;
        if ((v56 & 0x80) == 0) {
          goto LABEL_84;
        }
        v50 += 7;
        BOOL v18 = v51++ >= 9;
        if (v18)
        {
          LODWORD(v52) = 0;
          goto LABEL_86;
        }
      }
      v4[*v9] = 1;
LABEL_84:
      if (v4[*v9]) {
        LODWORD(v52) = 0;
      }
LABEL_86:
      v5->_bodyLength = v52;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v57 = [v6 copy];
  contactIDs = v5->_contactIDs;
  v5->_contactIDs = (NSArray *)v57;

  int v59 = v4[*v9];
  if (v59) {
LABEL_90:
  }
    v60 = 0;
  else {
LABEL_91:
  }
    v60 = v5;

  return v60;
}

- (NSString)description
{
  id v17 = [NSString alloc];
  unint64_t v16 = [(BMNotificationUsage *)self uniqueID];
  uint64_t v22 = [(BMNotificationUsage *)self absoluteTimestamp];
  uint64_t v15 = BMNotificationUsageTypeAsString([(BMNotificationUsage *)self usageType]);
  uint64_t v14 = [(BMNotificationUsage *)self bundleID];
  unint64_t v13 = [(BMNotificationUsage *)self notificationID];
  uint64_t v21 = [(BMNotificationUsage *)self deviceID];
  unsigned int v12 = [(BMNotificationUsage *)self title];
  uint64_t v20 = [(BMNotificationUsage *)self subtitle];
  int v19 = [(BMNotificationUsage *)self body];
  char v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMNotificationUsage badge](self, "badge"));
  long long v10 = [(BMNotificationUsage *)self threadID];
  uint64_t v9 = [(BMNotificationUsage *)self categoryID];
  uint64_t v3 = [(BMNotificationUsage *)self sectionID];
  id v4 = [(BMNotificationUsage *)self contactIDs];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMNotificationUsage isGroupMessage](self, "isGroupMessage"));
  uint64_t v6 = [(BMNotificationUsage *)self parentBundleID];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMNotificationUsage bodyLength](self, "bodyLength"));
  BOOL v18 = objc_msgSend(v17, "initWithFormat:", @"BMNotificationUsage with uniqueID: %@, absoluteTimestamp: %@, usageType: %@, bundleID: %@, notificationID: %@, deviceID: %@, title: %@, subtitle: %@, body: %@, badge: %@, threadID: %@, categoryID: %@, sectionID: %@, contactIDs: %@, isGroupMessage: %@, parentBundleID: %@, bodyLength: %@", v16, v22, v15, v14, v13, v21, v12, v20, v19, v11, v10, v9, v3, v4, v5, v6,
                  v7);

  return (NSString *)v18;
}

- (BMNotificationUsage)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 usageType:(int)a5 bundleID:(id)a6 notificationID:(id)a7 deviceID:(id)a8 title:(id)a9 subtitle:(id)a10 body:(id)a11 badge:(id)a12 threadID:(id)a13 categoryID:(id)a14 sectionID:(id)a15 contactIDs:(id)a16 isGroupMessage:(id)a17 parentBundleID:(id)a18 bodyLength:(id)a19
{
  id v49 = a3;
  id v23 = a4;
  id v37 = a6;
  id v48 = a6;
  id v47 = a7;
  id v38 = a8;
  id v46 = a8;
  id v45 = a9;
  id v44 = a10;
  id v43 = a11;
  id v24 = a12;
  id v42 = a13;
  id v41 = a14;
  id v40 = a15;
  id v25 = a16;
  char v26 = v23;
  id v27 = a17;
  id v28 = a18;
  id v29 = a19;
  v50.receiver = self;
  v50.super_class = (Class)BMNotificationUsage;
  uint64_t v30 = [(BMEventBase *)&v50 init];
  if (v30)
  {
    v30->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v30->_uniqueID, a3);
    if (v26)
    {
      v30->_hasRaw_absoluteTimestamp = 1;
      [v26 timeIntervalSinceReferenceDate];
    }
    else
    {
      v30->_hasRaw_absoluteTimestamp = 0;
      double v31 = -1.0;
    }
    v30->_raw_absoluteTimestamp = v31;
    v30->_usageType = a5;
    objc_storeStrong((id *)&v30->_bundleID, v37);
    objc_storeStrong((id *)&v30->_notificationID, a7);
    objc_storeStrong((id *)&v30->_deviceID, v38);
    objc_storeStrong((id *)&v30->_title, a9);
    objc_storeStrong((id *)&v30->_subtitle, a10);
    objc_storeStrong((id *)&v30->_body, a11);
    if (v24)
    {
      v30->_hasBadge = 1;
      uint64_t v32 = [v24 unsignedLongLongValue];
    }
    else
    {
      uint64_t v32 = 0;
      v30->_hasBadge = 0;
    }
    v30->_badge = v32;
    objc_storeStrong((id *)&v30->_threadID, a13);
    objc_storeStrong((id *)&v30->_categoryID, a14);
    objc_storeStrong((id *)&v30->_sectionID, a15);
    objc_storeStrong((id *)&v30->_contactIDs, a16);
    if (v27)
    {
      v30->_hasIsGroupMessage = 1;
      v30->_isGroupMessage = [v27 BOOLValue];
    }
    else
    {
      v30->_hasIsGroupMessage = 0;
      v30->_isGroupMessage = 0;
    }
    objc_storeStrong((id *)&v30->_parentBundleID, a18);
    if (v29)
    {
      v30->_hasBodyLength = 1;
      unsigned int v33 = [v29 unsignedIntValue];
    }
    else
    {
      unsigned int v33 = 0;
      v30->_hasBodyLength = 0;
    }
    v30->_bodyLength = v33;
  }

  return v30;
}

+ (id)protoFields
{
  v21[17] = *MEMORY[0x1E4F143B8];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uniqueID" number:1 type:13 subMessageClass:0];
  v21[0] = v20;
  int v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:2 type:0 subMessageClass:0];
  v21[1] = v19;
  BOOL v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"usageType" number:3 type:4 subMessageClass:0];
  v21[2] = v18;
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:4 type:13 subMessageClass:0];
  v21[3] = v17;
  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"notificationID" number:5 type:13 subMessageClass:0];
  v21[4] = v16;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceID" number:7 type:13 subMessageClass:0];
  v21[5] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"title" number:8 type:13 subMessageClass:0];
  v21[6] = v14;
  unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subtitle" number:9 type:13 subMessageClass:0];
  v21[7] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"body" number:10 type:13 subMessageClass:0];
  v21[8] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"badge" number:11 type:5 subMessageClass:0];
  v21[9] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"threadID" number:12 type:13 subMessageClass:0];
  v21[10] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"categoryID" number:13 type:13 subMessageClass:0];
  v21[11] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sectionID" number:14 type:13 subMessageClass:0];
  v21[12] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contactIDs" number:15 type:13 subMessageClass:0];
  v21[13] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isGroupMessage" number:16 type:12 subMessageClass:0];
  v21[14] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"parentBundleID" number:17 type:13 subMessageClass:0];
  v21[15] = v9;
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bodyLength" number:18 type:4 subMessageClass:0];
  v21[16] = v10;
  char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:17];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF43F8;
}

+ (id)columns
{
  v21[17] = *MEMORY[0x1E4F143B8];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uniqueID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  int v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:1];
  BOOL v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"usageType" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"notificationID" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceID" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"title" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"subtitle" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"body" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"badge" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:5 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"threadID" dataType:2 requestOnly:0 fieldNumber:12 protoDataType:13 convertedType:0];
  unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"categoryID" dataType:2 requestOnly:0 fieldNumber:13 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sectionID" dataType:2 requestOnly:0 fieldNumber:14 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"contactIDs_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_177];
  unsigned int v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isGroupMessage" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:12 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"parentBundleID" dataType:2 requestOnly:0 fieldNumber:17 protoDataType:13 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bodyLength" dataType:0 requestOnly:0 fieldNumber:18 protoDataType:4 convertedType:0];
  v21[0] = v20;
  v21[1] = v19;
  v21[2] = v18;
  v21[3] = v17;
  v21[4] = v16;
  v21[5] = v15;
  v21[6] = v14;
  v21[7] = v2;
  v21[8] = v3;
  v21[9] = v4;
  v21[10] = v5;
  v21[11] = v13;
  v21[12] = v6;
  v21[13] = v7;
  v21[14] = v12;
  v21[15] = v8;
  v21[16] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:17];

  return v11;
}

id __30__BMNotificationUsage_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _contactIDsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    uint64_t v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMNotificationUsage alloc] initByReadFrom:v6];
    uint64_t v8 = v7;
    if (v7) {
      v7[9] = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

- (BMNotificationUsage)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 usageType:(int)a5 bundleID:(id)a6 notificationID:(id)a7 deviceID:(id)a8 title:(id)a9 subtitle:(id)a10 body:(id)a11 badge:(id)a12 threadID:(id)a13 categoryID:(id)a14 sectionID:(id)a15 contactIDs:(id)a16 isGroupMessage:(id)a17
{
  return -[BMNotificationUsage initWithUniqueID:absoluteTimestamp:usageType:bundleID:notificationID:deviceID:title:subtitle:body:badge:threadID:categoryID:sectionID:contactIDs:isGroupMessage:parentBundleID:bodyLength:](self, "initWithUniqueID:absoluteTimestamp:usageType:bundleID:notificationID:deviceID:title:subtitle:body:badge:threadID:categoryID:sectionID:contactIDs:isGroupMessage:parentBundleID:bodyLength:", a3, a4, *(void *)&a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, 0,
           0);
}

@end
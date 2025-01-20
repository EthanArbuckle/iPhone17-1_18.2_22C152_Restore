@interface BMMessagesCommunicationSafetyResult
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMessagesCommunicationSafetyResult)initWithAbsoluteTimestamp:(id)a3 childID:(id)a4 deviceID:(id)a5 eventDirection:(int)a6 eventType:(int)a7 contentType:(int)a8 contactHandles:(id)a9 contentID:(id)a10 conversationID:(id)a11 imageData:(id)a12 sourceBundleID:(id)a13 senderHandle:(id)a14 contentURL:(id)a15 conversationURL:(id)a16;
- (BMMessagesCommunicationSafetyResult)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)contactHandles;
- (NSData)imageData;
- (NSDate)absoluteTimestamp;
- (NSString)childID;
- (NSString)contentID;
- (NSString)contentURL;
- (NSString)conversationID;
- (NSString)conversationURL;
- (NSString)description;
- (NSString)deviceID;
- (NSString)senderHandle;
- (NSString)sourceBundleID;
- (id)_contactHandlesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)contentType;
- (int)eventDirection;
- (int)eventType;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMMessagesCommunicationSafetyResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationURL, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_contactHandles, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);

  objc_storeStrong((id *)&self->_childID, 0);
}

- (NSString)conversationURL
{
  return self->_conversationURL;
}

- (NSString)contentURL
{
  return self->_contentURL;
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (NSArray)contactHandles
{
  return self->_contactHandles;
}

- (int)contentType
{
  return self->_contentType;
}

- (int)eventType
{
  return self->_eventType;
}

- (int)eventDirection
{
  return self->_eventDirection;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSString)childID
{
  return self->_childID;
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
    v6 = [(BMMessagesCommunicationSafetyResult *)self absoluteTimestamp];
    uint64_t v7 = [v5 absoluteTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMessagesCommunicationSafetyResult *)self absoluteTimestamp];
      v10 = [v5 absoluteTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_44;
      }
    }
    v13 = [(BMMessagesCommunicationSafetyResult *)self childID];
    uint64_t v14 = [v5 childID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMMessagesCommunicationSafetyResult *)self childID];
      v17 = [v5 childID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_44;
      }
    }
    v19 = [(BMMessagesCommunicationSafetyResult *)self deviceID];
    uint64_t v20 = [v5 deviceID];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMMessagesCommunicationSafetyResult *)self deviceID];
      v23 = [v5 deviceID];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_44;
      }
    }
    int v25 = [(BMMessagesCommunicationSafetyResult *)self eventDirection];
    if (v25 != [v5 eventDirection]) {
      goto LABEL_44;
    }
    int v26 = [(BMMessagesCommunicationSafetyResult *)self eventType];
    if (v26 != [v5 eventType]) {
      goto LABEL_44;
    }
    int v27 = [(BMMessagesCommunicationSafetyResult *)self contentType];
    if (v27 != [v5 contentType]) {
      goto LABEL_44;
    }
    v28 = [(BMMessagesCommunicationSafetyResult *)self contactHandles];
    uint64_t v29 = [v5 contactHandles];
    if (v28 == (void *)v29)
    {
    }
    else
    {
      v30 = (void *)v29;
      v31 = [(BMMessagesCommunicationSafetyResult *)self contactHandles];
      v32 = [v5 contactHandles];
      int v33 = [v31 isEqual:v32];

      if (!v33) {
        goto LABEL_44;
      }
    }
    v34 = [(BMMessagesCommunicationSafetyResult *)self contentID];
    uint64_t v35 = [v5 contentID];
    if (v34 == (void *)v35)
    {
    }
    else
    {
      v36 = (void *)v35;
      v37 = [(BMMessagesCommunicationSafetyResult *)self contentID];
      v38 = [v5 contentID];
      int v39 = [v37 isEqual:v38];

      if (!v39) {
        goto LABEL_44;
      }
    }
    v40 = [(BMMessagesCommunicationSafetyResult *)self conversationID];
    uint64_t v41 = [v5 conversationID];
    if (v40 == (void *)v41)
    {
    }
    else
    {
      v42 = (void *)v41;
      v43 = [(BMMessagesCommunicationSafetyResult *)self conversationID];
      v44 = [v5 conversationID];
      int v45 = [v43 isEqual:v44];

      if (!v45) {
        goto LABEL_44;
      }
    }
    v46 = [(BMMessagesCommunicationSafetyResult *)self imageData];
    uint64_t v47 = [v5 imageData];
    if (v46 == (void *)v47)
    {
    }
    else
    {
      v48 = (void *)v47;
      v49 = [(BMMessagesCommunicationSafetyResult *)self imageData];
      v50 = [v5 imageData];
      int v51 = [v49 isEqual:v50];

      if (!v51) {
        goto LABEL_44;
      }
    }
    v52 = [(BMMessagesCommunicationSafetyResult *)self sourceBundleID];
    uint64_t v53 = [v5 sourceBundleID];
    if (v52 == (void *)v53)
    {
    }
    else
    {
      v54 = (void *)v53;
      v55 = [(BMMessagesCommunicationSafetyResult *)self sourceBundleID];
      v56 = [v5 sourceBundleID];
      int v57 = [v55 isEqual:v56];

      if (!v57) {
        goto LABEL_44;
      }
    }
    v58 = [(BMMessagesCommunicationSafetyResult *)self senderHandle];
    uint64_t v59 = [v5 senderHandle];
    if (v58 == (void *)v59)
    {
    }
    else
    {
      v60 = (void *)v59;
      v61 = [(BMMessagesCommunicationSafetyResult *)self senderHandle];
      v62 = [v5 senderHandle];
      int v63 = [v61 isEqual:v62];

      if (!v63) {
        goto LABEL_44;
      }
    }
    v64 = [(BMMessagesCommunicationSafetyResult *)self contentURL];
    uint64_t v65 = [v5 contentURL];
    if (v64 == (void *)v65)
    {
    }
    else
    {
      v66 = (void *)v65;
      v67 = [(BMMessagesCommunicationSafetyResult *)self contentURL];
      v68 = [v5 contentURL];
      int v69 = [v67 isEqual:v68];

      if (!v69)
      {
LABEL_44:
        char v12 = 0;
LABEL_45:

        goto LABEL_46;
      }
    }
    v71 = [(BMMessagesCommunicationSafetyResult *)self conversationURL];
    v72 = [v5 conversationURL];
    if (v71 == v72)
    {
      char v12 = 1;
    }
    else
    {
      v73 = [(BMMessagesCommunicationSafetyResult *)self conversationURL];
      v74 = [v5 conversationURL];
      char v12 = [v73 isEqual:v74];
    }
    goto LABEL_45;
  }
  char v12 = 0;
LABEL_46:

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
  v55[14] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMessagesCommunicationSafetyResult *)self absoluteTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMMessagesCommunicationSafetyResult *)self absoluteTimestamp];
    [v5 timeIntervalSinceReferenceDate];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v7 = [(BMMessagesCommunicationSafetyResult *)self childID];
  uint64_t v8 = [(BMMessagesCommunicationSafetyResult *)self deviceID];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMessagesCommunicationSafetyResult eventDirection](self, "eventDirection"));
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMessagesCommunicationSafetyResult eventType](self, "eventType"));
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMessagesCommunicationSafetyResult contentType](self, "contentType"));
  uint64_t v12 = [(BMMessagesCommunicationSafetyResult *)self _contactHandlesJSONArray];
  uint64_t v13 = [(BMMessagesCommunicationSafetyResult *)self contentID];
  uint64_t v53 = [(BMMessagesCommunicationSafetyResult *)self conversationID];
  uint64_t v14 = [(BMMessagesCommunicationSafetyResult *)self imageData];
  v52 = [v14 base64EncodedStringWithOptions:0];

  int v51 = [(BMMessagesCommunicationSafetyResult *)self sourceBundleID];
  v50 = [(BMMessagesCommunicationSafetyResult *)self senderHandle];
  v49 = [(BMMessagesCommunicationSafetyResult *)self contentURL];
  v15 = [(BMMessagesCommunicationSafetyResult *)self conversationURL];
  v54[0] = @"absoluteTimestamp";
  uint64_t v16 = v6;
  if (!v6)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v42 = (void *)v16;
  v55[0] = v16;
  v54[1] = @"childID";
  uint64_t v17 = v7;
  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v41 = (void *)v17;
  v55[1] = v17;
  v54[2] = @"deviceID";
  uint64_t v18 = v8;
  if (!v8)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v40 = (void *)v18;
  v55[2] = v18;
  v54[3] = @"eventDirection";
  uint64_t v19 = v9;
  if (!v9)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  int v39 = (void *)v19;
  v55[3] = v19;
  v54[4] = @"eventType";
  uint64_t v20 = v10;
  if (!v10)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v38 = (void *)v20;
  v55[4] = v20;
  v54[5] = @"contentType";
  uint64_t v21 = v11;
  if (!v11)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v47 = (void *)v10;
  v48 = (void *)v9;
  v37 = (void *)v21;
  v55[5] = v21;
  v54[6] = @"contactHandles";
  uint64_t v22 = v12;
  if (!v12)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  int v45 = (void *)v12;
  v46 = (void *)v11;
  v36 = (void *)v22;
  v55[6] = v22;
  v54[7] = @"contentID";
  uint64_t v23 = v13;
  if (!v13)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v44 = (void *)v13;
  uint64_t v34 = v23;
  v55[7] = v23;
  v54[8] = @"conversationID";
  int v24 = v53;
  if (!v53)
  {
    int v24 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v23, v36, v37, v38, v39, v40, v41, v42);
  }
  v55[8] = v24;
  v54[9] = @"imageData";
  int v25 = v52;
  if (!v52)
  {
    int v25 = [MEMORY[0x1E4F1CA98] null];
  }
  int v26 = (void *)v8;
  int v27 = (void *)v6;
  v55[9] = v25;
  v54[10] = @"sourceBundleID";
  v28 = v51;
  if (!v51)
  {
    v28 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v29 = (void *)v7;
  v55[10] = v28;
  v54[11] = @"senderHandle";
  v30 = v50;
  if (!v50)
  {
    v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v55[11] = v30;
  v54[12] = @"contentURL";
  v31 = v49;
  if (!v49)
  {
    v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v55[12] = v31;
  v54[13] = @"conversationURL";
  v32 = v15;
  if (!v15)
  {
    v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v55[13] = v32;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v55, v54, 14, v34);
  id v43 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15) {

  }
  if (!v49) {
  if (!v50)
  }

  if (!v51) {
  if (!v52)
  }

  if (!v53) {
  if (!v44)
  }

  if (!v45) {
  if (v46)
  }
  {
    if (v47) {
      goto LABEL_50;
    }
  }
  else
  {

    if (v47)
    {
LABEL_50:
      if (v48) {
        goto LABEL_51;
      }
      goto LABEL_59;
    }
  }

  if (v48)
  {
LABEL_51:
    if (v26) {
      goto LABEL_52;
    }
    goto LABEL_60;
  }
LABEL_59:

  if (v26)
  {
LABEL_52:
    if (v29) {
      goto LABEL_53;
    }
LABEL_61:

    if (v27) {
      goto LABEL_54;
    }
    goto LABEL_62;
  }
LABEL_60:

  if (!v29) {
    goto LABEL_61;
  }
LABEL_53:
  if (v27) {
    goto LABEL_54;
  }
LABEL_62:

LABEL_54:

  return v43;
}

- (id)_contactHandlesJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMMessagesCommunicationSafetyResult *)self contactHandles];
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

- (BMMessagesCommunicationSafetyResult)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v206[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"absoluteTimestamp"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v8 = v5;
      id v9 = [v7 alloc];
      [v8 doubleValue];
      double v11 = v10;

      id v12 = (id)[v9 initWithTimeIntervalSinceReferenceDate:v11];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        uint64_t v6 = [v13 dateFromString:v5];

        goto LABEL_9;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v107 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v108 = *MEMORY[0x1E4F502C8];
          uint64_t v205 = *MEMORY[0x1E4F28568];
          int v27 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
          v206[0] = v27;
          uint64_t v109 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v206 forKeys:&v205 count:1];
          uint64_t v110 = v108;
          uint64_t v14 = (void *)v109;
          uint64_t v6 = 0;
          v28 = 0;
          *a4 = (id)[v107 initWithDomain:v110 code:2 userInfo:v109];
          goto LABEL_106;
        }
        uint64_t v6 = 0;
        v28 = 0;
        goto LABEL_107;
      }
      id v12 = v5;
    }
    uint64_t v6 = v12;
  }
  else
  {
    uint64_t v6 = 0;
  }
LABEL_9:
  uint64_t v14 = [v4 objectForKeyedSubscript:@"childID"];
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v22 = v14;
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v203 = *MEMORY[0x1E4F28568];
        int v24 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"childID"];
        v204 = v24;
        uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v204 forKeys:&v203 count:1];
        uint64_t v26 = v23;
        uint64_t v14 = v22;
        v165 = (void *)v25;
        int v27 = 0;
        v28 = 0;
        *a4 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v26, 2);
        goto LABEL_105;
      }
      int v27 = 0;
      v28 = 0;
      goto LABEL_106;
    }
    id v164 = v14;
  }
  else
  {
    id v164 = 0;
  }
  uint64_t v15 = [v4 objectForKeyedSubscript:@"deviceID"];
  v165 = (void *)v15;
  if (v15 && (uint64_t v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        v30 = v14;
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v201 = *MEMORY[0x1E4F28568];
        v32 = v5;
        id v33 = [NSString alloc];
        uint64_t v139 = objc_opt_class();
        uint64_t v34 = v33;
        uint64_t v5 = v32;
        uint64_t v35 = [v34 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v139, @"deviceID"];
        uint64_t v202 = v35;
        uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v202 forKeys:&v201 count:1];
        v37 = v29;
        v38 = (void *)v36;
        uint64_t v39 = v31;
        uint64_t v14 = v30;
        v40 = (id *)v35;
        int v24 = 0;
        v28 = 0;
        *a4 = (id)[v37 initWithDomain:v39 code:2 userInfo:v36];
        int v27 = v164;
        goto LABEL_104;
      }
      int v24 = 0;
      v28 = 0;
      int v27 = v164;
      goto LABEL_105;
    }
    id v163 = v16;
  }
  else
  {
    id v163 = 0;
  }
  uint64_t v17 = [v4 objectForKeyedSubscript:@"eventDirection"];
  v166 = (void *)v17;
  v169 = v4;
  if (v17 && (uint64_t v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = v18;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v40 = a4;
        if (a4)
        {
          id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
          v89 = v14;
          uint64_t v90 = *MEMORY[0x1E4F502C8];
          uint64_t v199 = *MEMORY[0x1E4F28568];
          v91 = v5;
          id v92 = [NSString alloc];
          uint64_t v141 = objc_opt_class();
          v93 = v92;
          uint64_t v5 = v91;
          id v43 = (id)[v93 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", v141, @"eventDirection"];
          id v200 = v43;
          uint64_t v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v200 forKeys:&v199 count:1];
          uint64_t v95 = v90;
          uint64_t v14 = v89;
          v162 = (void *)v94;
          v28 = 0;
          *a4 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v95, 2);
          v38 = v166;
          v40 = 0;
          int v24 = v163;
          int v27 = v164;
          goto LABEL_103;
        }
        v28 = 0;
        int v24 = v163;
        int v27 = v164;
        v38 = v166;
        goto LABEL_104;
      }
      uint64_t v20 = [NSNumber numberWithInt:BMMessagesCommunicationSafetyResultEventDirectionFromString(v18)];
    }
    uint64_t v19 = v20;
  }
  else
  {
    uint64_t v19 = 0;
  }
  uint64_t v41 = [v4 objectForKeyedSubscript:@"eventType"];
  v161 = v19;
  v162 = (void *)v41;
  if (v41 && (v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v43 = v42;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v96 = objc_alloc(MEMORY[0x1E4F28C58]);
          v97 = v14;
          uint64_t v98 = *MEMORY[0x1E4F502C8];
          uint64_t v197 = *MEMORY[0x1E4F28568];
          v99 = v5;
          id v100 = [NSString alloc];
          uint64_t v142 = objc_opt_class();
          v101 = v100;
          uint64_t v5 = v99;
          id v160 = (id)[v101 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", v142, @"eventType"];
          id v198 = v160;
          uint64_t v102 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v198 forKeys:&v197 count:1];
          uint64_t v103 = v98;
          uint64_t v14 = v97;
          v159 = (void *)v102;
          id v43 = 0;
          v28 = 0;
          *a4 = (id)objc_msgSend(v96, "initWithDomain:code:userInfo:", v103, 2);
          int v24 = v163;
          int v27 = v164;
          v38 = v166;
          v40 = v19;
          goto LABEL_102;
        }
        id v43 = 0;
        v28 = 0;
        int v24 = v163;
        int v27 = v164;
        v38 = v166;
        v40 = v19;
        goto LABEL_103;
      }
      id v43 = [NSNumber numberWithInt:BMMessagesCommunicationSafetyResultEventTypeFromString(v42)];
    }
  }
  else
  {
    id v43 = 0;
  }
  uint64_t v44 = [v169 objectForKeyedSubscript:@"contentType"];
  v155 = v5;
  v156 = v14;
  v158 = v43;
  v159 = (void *)v44;
  if (v44 && (int v45 = (void *)v44, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v160 = v45;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v104 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v105 = *MEMORY[0x1E4F502C8];
          uint64_t v195 = *MEMORY[0x1E4F28568];
          id v46 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"contentType"];
          id v196 = v46;
          v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v196 forKeys:&v195 count:1];
          id v106 = (id)[v104 initWithDomain:v105 code:2 userInfo:v49];
          id v160 = 0;
          v28 = 0;
          *a4 = v106;
          int v24 = v163;
          int v27 = v164;
          v38 = v166;
          v40 = v19;
          goto LABEL_100;
        }
        id v160 = 0;
        v28 = 0;
        int v24 = v163;
        int v27 = v164;
        v38 = v166;
        v40 = v19;
        goto LABEL_102;
      }
      id v160 = [NSNumber numberWithInt:BMMessagesCommunicationSafetyResultContentTypeFromString(v45)];
    }
  }
  else
  {
    id v160 = 0;
  }
  id v46 = [v169 objectForKeyedSubscript:@"contactHandles"];
  uint64_t v47 = [MEMORY[0x1E4F1CA98] null];
  int v48 = [v46 isEqual:v47];

  if (v48)
  {
    v157 = v6;

    id v46 = 0;
  }
  else
  {
    if (v46)
    {
      objc_opt_class();
      v38 = v166;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v83 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v84 = *MEMORY[0x1E4F502C8];
          uint64_t v193 = *MEMORY[0x1E4F28568];
          v49 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"contactHandles"];
          v194 = v49;
          uint64_t v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v194 forKeys:&v193 count:1];
          uint64_t v86 = v84;
          v38 = v166;
          v28 = 0;
          *a4 = (id)[v83 initWithDomain:v86 code:2 userInfo:v85];
          v82 = (void *)v85;
          int v24 = v163;
          int v27 = v164;
          v40 = v19;
          goto LABEL_99;
        }
        v28 = 0;
        int v24 = v163;
        int v27 = v164;
        v40 = v19;
        goto LABEL_101;
      }
      v157 = v6;
      goto LABEL_48;
    }
    v157 = v6;
  }
  v38 = v166;
LABEL_48:
  v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v46, "count"));
  long long v170 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  id v46 = v46;
  uint64_t v50 = [v46 countByEnumeratingWithState:&v170 objects:v192 count:16];
  int v51 = v169;
  if (!v50) {
    goto LABEL_57;
  }
  uint64_t v52 = v50;
  uint64_t v53 = *(void *)v171;
  while (2)
  {
    for (uint64_t i = 0; i != v52; ++i)
    {
      if (*(void *)v171 != v53) {
        objc_enumerationMutation(v46);
      }
      uint64_t v55 = *(void *)(*((void *)&v170 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v72 = a4;
        if (a4)
        {
          id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v74 = *MEMORY[0x1E4F502C8];
          uint64_t v190 = *MEMORY[0x1E4F28568];
          v56 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"contactHandles"];
          v191 = v56;
          uint64_t v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v191 forKeys:&v190 count:1];
          v76 = v73;
          uint64_t v77 = v74;
LABEL_89:
          id v153 = (id)v75;
          int v24 = v163;
          int v27 = v164;
          v28 = 0;
          id *v72 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v77, 2);
          id v154 = v46;
          uint64_t v6 = v157;
          id v43 = v158;
          v38 = v166;
          v40 = v161;
          goto LABEL_90;
        }
LABEL_92:
        v28 = 0;
        v82 = v46;
        uint64_t v6 = v157;
        id v43 = v158;
        int v24 = v163;
        int v27 = v164;
        v38 = v166;
        v40 = v19;
        goto LABEL_99;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v79 = *MEMORY[0x1E4F502C8];
          uint64_t v188 = *MEMORY[0x1E4F28568];
          id v80 = [NSString alloc];
          uint64_t v140 = objc_opt_class();
          v81 = v80;
          v72 = a4;
          v56 = (void *)[v81 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v140, @"contactHandles"];
          v189 = v56;
          uint64_t v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v189 forKeys:&v188 count:1];
          v76 = v78;
          uint64_t v77 = v79;
          goto LABEL_89;
        }
        goto LABEL_92;
      }
      [v49 addObject:v55];
    }
    uint64_t v52 = [v46 countByEnumeratingWithState:&v170 objects:v192 count:16];
    v38 = v166;
    if (v52) {
      continue;
    }
    break;
  }
LABEL_57:

  v56 = [v169 objectForKeyedSubscript:@"contentID"];
  if (!v56 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v149 = v56;
    id v154 = 0;
LABEL_60:
    uint64_t v57 = [v51 objectForKeyedSubscript:@"conversationID"];
    v150 = (void *)v57;
    if (v57 && (v58 = (void *)v57, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v153 = v58;
        goto LABEL_63;
      }
      if (!a4)
      {
        id v153 = 0;
        v28 = 0;
        int v24 = v163;
        int v27 = v164;
        uint64_t v6 = v157;
        id v43 = v158;
        v40 = v161;
        v56 = v149;
        goto LABEL_84;
      }
      id v115 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v116 = *MEMORY[0x1E4F502C8];
      uint64_t v184 = *MEMORY[0x1E4F28568];
      id v151 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"conversationID"];
      id v185 = v151;
      uint64_t v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v185 forKeys:&v184 count:1];
      v118 = v115;
      v38 = v166;
      v148 = (void *)v117;
      v28 = 0;
      id v153 = 0;
      *a4 = (id)objc_msgSend(v118, "initWithDomain:code:userInfo:", v116, 2);
    }
    else
    {
      id v153 = 0;
LABEL_63:
      uint64_t v59 = [v51 objectForKeyedSubscript:@"imageData"];
      v148 = (void *)v59;
      if (!v59 || (v60 = (void *)v59, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v151 = 0;
LABEL_66:
        uint64_t v61 = [v51 objectForKeyedSubscript:@"sourceBundleID"];
        v146 = (void *)v61;
        if (!v61 || (v62 = (void *)v61, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v147 = 0;
LABEL_69:
          uint64_t v63 = [v51 objectForKeyedSubscript:@"senderHandle"];
          v145 = (void *)v63;
          if (!v63 || (v64 = (void *)v63, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v152 = 0;
LABEL_72:
            uint64_t v65 = [v51 objectForKeyedSubscript:@"contentURL"];
            v144 = (void *)v65;
            if (v65 && (v66 = (void *)v65, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v143 = v66;
                goto LABEL_75;
              }
              if (a4)
              {
                id v130 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v131 = *MEMORY[0x1E4F502C8];
                uint64_t v176 = *MEMORY[0x1E4F28568];
                id v68 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contentURL"];
                id v177 = v68;
                uint64_t v132 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v177 forKeys:&v176 count:1];
                v133 = v130;
                v38 = v166;
                v67 = (void *)v132;
                v28 = 0;
                int v69 = 0;
                *a4 = (id)objc_msgSend(v133, "initWithDomain:code:userInfo:", v131, 2);
                id v70 = v152;
                goto LABEL_79;
              }
              v28 = 0;
              int v24 = v163;
              int v27 = v164;
              uint64_t v6 = v157;
              v40 = v161;
              v71 = v66;
              int v69 = 0;
            }
            else
            {
              id v143 = 0;
LABEL_75:
              v67 = [v51 objectForKeyedSubscript:@"conversationURL"];
              if (!v67 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v68 = 0;
                goto LABEL_78;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v68 = v67;
LABEL_78:
                int v69 = v143;
                id v70 = v152;
                v28 = -[BMMessagesCommunicationSafetyResult initWithAbsoluteTimestamp:childID:deviceID:eventDirection:eventType:contentType:contactHandles:contentID:conversationID:imageData:sourceBundleID:senderHandle:contentURL:conversationURL:](self, "initWithAbsoluteTimestamp:childID:deviceID:eventDirection:eventType:contentType:contactHandles:contentID:conversationID:imageData:sourceBundleID:senderHandle:contentURL:conversationURL:", v157, v164, v163, [v161 intValue], objc_msgSend(v158, "intValue"), objc_msgSend(v160, "intValue"), v49, v154, v153, v151, v147, v152, v143, v68);
                self = v28;
                v38 = v166;
              }
              else
              {
                if (a4)
                {
                  id v134 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v135 = *MEMORY[0x1E4F502C8];
                  uint64_t v174 = *MEMORY[0x1E4F28568];
                  v136 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"conversationURL"];
                  v175 = v136;
                  v137 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v175 forKeys:&v174 count:1];
                  v138 = v134;
                  v38 = v166;
                  *a4 = (id)[v138 initWithDomain:v135 code:2 userInfo:v137];
                }
                id v68 = 0;
                v28 = 0;
                id v70 = v152;
                int v69 = v143;
              }
LABEL_79:
              id v152 = v70;

              int v24 = v163;
              int v27 = v164;
              uint64_t v6 = v157;
              v40 = v161;
              v71 = v144;
            }
LABEL_80:

LABEL_81:
            id v43 = v158;
            v56 = v149;

LABEL_82:
LABEL_83:

LABEL_84:
LABEL_90:

            goto LABEL_91;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v152 = v64;
            goto LABEL_72;
          }
          if (a4)
          {
            id v127 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v128 = *MEMORY[0x1E4F502C8];
            uint64_t v178 = *MEMORY[0x1E4F28568];
            int v69 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"senderHandle"];
            v179 = v69;
            v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v179 forKeys:&v178 count:1];
            v129 = v127;
            v38 = v166;
            v28 = 0;
            id v152 = 0;
            *a4 = (id)[v129 initWithDomain:v128 code:2 userInfo:v71];
            int v24 = v163;
            int v27 = v164;
            uint64_t v6 = v157;
            v40 = v161;
            goto LABEL_80;
          }
          id v152 = 0;
          v28 = 0;
LABEL_161:
          int v24 = v163;
          int v27 = v164;
          uint64_t v6 = v157;
          v40 = v161;
          goto LABEL_81;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v147 = v62;
          goto LABEL_69;
        }
        if (a4)
        {
          id v123 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v124 = *MEMORY[0x1E4F502C8];
          uint64_t v180 = *MEMORY[0x1E4F28568];
          id v152 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sourceBundleID"];
          id v181 = v152;
          uint64_t v125 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v181 forKeys:&v180 count:1];
          v126 = v123;
          v38 = v166;
          v145 = (void *)v125;
          v28 = 0;
          id v147 = 0;
          *a4 = (id)objc_msgSend(v126, "initWithDomain:code:userInfo:", v124, 2);
          goto LABEL_161;
        }
        id v147 = 0;
        v28 = 0;
LABEL_159:
        int v24 = v163;
        int v27 = v164;
        uint64_t v6 = v157;
        id v43 = v158;
        v40 = v161;
        v56 = v149;
        goto LABEL_82;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v151 = v60;
        goto LABEL_66;
      }
      if (a4)
      {
        id v119 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v120 = *MEMORY[0x1E4F502C8];
        uint64_t v182 = *MEMORY[0x1E4F28568];
        id v147 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"imageData"];
        id v183 = v147;
        uint64_t v121 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v183 forKeys:&v182 count:1];
        v122 = v119;
        v38 = v166;
        v146 = (void *)v121;
        v28 = 0;
        id v151 = 0;
        *a4 = (id)objc_msgSend(v122, "initWithDomain:code:userInfo:", v120, 2);
        goto LABEL_159;
      }
      id v151 = 0;
      v28 = 0;
    }
    int v24 = v163;
    int v27 = v164;
    uint64_t v6 = v157;
    id v43 = v158;
    v40 = v161;
    v56 = v149;
    goto LABEL_83;
  }
  objc_opt_class();
  id v43 = v158;
  if (objc_opt_isKindOfClass())
  {
    v149 = v56;
    id v154 = v56;
    int v51 = v169;
    goto LABEL_60;
  }
  if (a4)
  {
    id v111 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v112 = *MEMORY[0x1E4F502C8];
    uint64_t v186 = *MEMORY[0x1E4F28568];
    id v153 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contentID"];
    id v187 = v153;
    uint64_t v113 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v187 forKeys:&v186 count:1];
    v114 = v111;
    v38 = v166;
    v150 = (void *)v113;
    v28 = 0;
    id v154 = 0;
    *a4 = (id)objc_msgSend(v114, "initWithDomain:code:userInfo:", v112, 2);
    int v24 = v163;
    int v27 = v164;
    uint64_t v6 = v157;
    v40 = v161;
    goto LABEL_84;
  }
  id v154 = 0;
  v28 = 0;
  int v24 = v163;
  int v27 = v164;
  uint64_t v6 = v157;
  v40 = v161;
LABEL_91:

  v82 = v154;
LABEL_99:

LABEL_100:
  uint64_t v5 = v155;
LABEL_101:

  uint64_t v14 = v156;
LABEL_102:

LABEL_103:
  id v4 = v169;
LABEL_104:

LABEL_105:
LABEL_106:

LABEL_107:
  return v28;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMessagesCommunicationSafetyResult *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_childID) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceID) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_contactHandles;
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

  if (self->_contentID) {
    PBDataWriterWriteStringField();
  }
  if (self->_conversationID) {
    PBDataWriterWriteStringField();
  }
  if (self->_imageData) {
    PBDataWriterWriteDataField();
  }
  if (self->_sourceBundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_senderHandle) {
    PBDataWriterWriteStringField();
  }
  if (self->_contentURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_conversationURL) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)BMMessagesCommunicationSafetyResult;
  uint64_t v5 = [(BMEventBase *)&v54 init];
  if (!v5) {
    goto LABEL_82;
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
          v5->_hasRaw_absoluteTimestamp = 1;
          uint64_t v21 = *v7;
          unint64_t v22 = *(void *)&v4[v21];
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)&v4[*v8])
          {
            double v23 = *(double *)(*(void *)&v4[*v10] + v22);
            *(void *)&v4[v21] = v22 + 8;
          }
          else
          {
            v4[*v9] = 1;
            double v23 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v23;
          continue;
        case 2u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 48;
          goto LABEL_55;
        case 3u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 56;
          goto LABEL_55;
        case 4u:
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
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v28) = 0;
          }
LABEL_61:
          if (v28 >= 4) {
            LODWORD(v28) = 0;
          }
          uint64_t v48 = 36;
          goto LABEL_76;
        case 5u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v28 = 0;
          while (2)
          {
            uint64_t v35 = *v7;
            uint64_t v36 = *(void *)&v4[v35];
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)&v4[*v10] + v36);
              *(void *)&v4[v35] = v37;
              v28 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                BOOL v18 = v34++ >= 9;
                if (v18)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_67;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v28) = 0;
          }
LABEL_67:
          if (v28 >= 5) {
            LODWORD(v28) = 0;
          }
          uint64_t v48 = 40;
          goto LABEL_76;
        case 6u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v28 = 0;
          break;
        case 7u:
          uint64_t v45 = PBReaderReadString();
          if (!v45) {
            goto LABEL_84;
          }
          id v46 = (void *)v45;
          [v6 addObject:v45];

          continue;
        case 8u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 72;
          goto LABEL_55;
        case 9u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 80;
          goto LABEL_55;
        case 0xAu:
          uint64_t v24 = PBReaderReadData();
          uint64_t v25 = 88;
          goto LABEL_55;
        case 0xBu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 96;
          goto LABEL_55;
        case 0xCu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 104;
          goto LABEL_55;
        case 0xDu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 112;
          goto LABEL_55;
        case 0xEu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 120;
LABEL_55:
          uint64_t v47 = *(Class *)((char *)&v5->super.super.isa + v25);
          *(Class *)((char *)&v5->super.super.isa + v25) = (Class)v24;

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_84:

          goto LABEL_81;
      }
      while (1)
      {
        uint64_t v41 = *v7;
        uint64_t v42 = *(void *)&v4[v41];
        unint64_t v43 = v42 + 1;
        if (v42 == -1 || v43 > *(void *)&v4[*v8]) {
          break;
        }
        char v44 = *(unsigned char *)(*(void *)&v4[*v10] + v42);
        *(void *)&v4[v41] = v43;
        v28 |= (unint64_t)(v44 & 0x7F) << v39;
        if ((v44 & 0x80) == 0) {
          goto LABEL_71;
        }
        v39 += 7;
        BOOL v18 = v40++ >= 9;
        if (v18)
        {
          LODWORD(v28) = 0;
          goto LABEL_73;
        }
      }
      v4[*v9] = 1;
LABEL_71:
      if (v4[*v9]) {
        LODWORD(v28) = 0;
      }
LABEL_73:
      if (v28 >= 4) {
        LODWORD(v28) = 0;
      }
      uint64_t v48 = 44;
LABEL_76:
      *(_DWORD *)((char *)&v5->super.super.isa + v48) = v28;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v49 = [v6 copy];
  contactHandles = v5->_contactHandles;
  v5->_contactHandles = (NSArray *)v49;

  int v51 = v4[*v9];
  if (v51) {
LABEL_81:
  }
    uint64_t v52 = 0;
  else {
LABEL_82:
  }
    uint64_t v52 = v5;

  return v52;
}

- (NSString)description
{
  id v15 = [NSString alloc];
  int v19 = [(BMMessagesCommunicationSafetyResult *)self absoluteTimestamp];
  uint64_t v14 = [(BMMessagesCommunicationSafetyResult *)self childID];
  BOOL v18 = [(BMMessagesCommunicationSafetyResult *)self deviceID];
  char v17 = BMMessagesCommunicationSafetyResultEventDirectionAsString([(BMMessagesCommunicationSafetyResult *)self eventDirection]);
  v3 = BMMessagesCommunicationSafetyResultEventTypeAsString([(BMMessagesCommunicationSafetyResult *)self eventType]);
  unint64_t v13 = BMMessagesCommunicationSafetyResultContentTypeAsString([(BMMessagesCommunicationSafetyResult *)self contentType]);
  id v4 = [(BMMessagesCommunicationSafetyResult *)self contactHandles];
  uint64_t v5 = [(BMMessagesCommunicationSafetyResult *)self contentID];
  uint64_t v6 = [(BMMessagesCommunicationSafetyResult *)self conversationID];
  uint64_t v7 = [(BMMessagesCommunicationSafetyResult *)self imageData];
  uint64_t v8 = [(BMMessagesCommunicationSafetyResult *)self sourceBundleID];
  uint64_t v9 = [(BMMessagesCommunicationSafetyResult *)self senderHandle];
  long long v10 = [(BMMessagesCommunicationSafetyResult *)self contentURL];
  char v11 = [(BMMessagesCommunicationSafetyResult *)self conversationURL];
  unint64_t v16 = (void *)[v15 initWithFormat:@"BMMessagesCommunicationSafetyResult with absoluteTimestamp: %@, childID: %@, deviceID: %@, eventDirection: %@, eventType: %@, contentType: %@, contactHandles: %@, contentID: %@, conversationID: %@, imageData: %@, sourceBundleID: %@, senderHandle: %@, contentURL: %@, conversationURL: %@", v19, v14, v18, v17, v3, v13, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v16;
}

- (BMMessagesCommunicationSafetyResult)initWithAbsoluteTimestamp:(id)a3 childID:(id)a4 deviceID:(id)a5 eventDirection:(int)a6 eventType:(int)a7 contentType:(int)a8 contactHandles:(id)a9 contentID:(id)a10 conversationID:(id)a11 imageData:(id)a12 sourceBundleID:(id)a13 senderHandle:(id)a14 contentURL:(id)a15 conversationURL:(id)a16
{
  id v18 = a3;
  id obj = a4;
  id v39 = a4;
  id v28 = a5;
  id v38 = a5;
  id v29 = a9;
  id v37 = a9;
  id v36 = a10;
  id v35 = a11;
  id v34 = a12;
  id v19 = a13;
  id v20 = a14;
  id v21 = a15;
  id v22 = a16;
  v40.receiver = self;
  v40.super_class = (Class)BMMessagesCommunicationSafetyResult;
  double v23 = [(BMEventBase *)&v40 init];
  if (v23)
  {
    v23->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v18)
    {
      v23->_hasRaw_absoluteTimestamp = 1;
      id v24 = v18;
      objc_msgSend(v18, "timeIntervalSinceReferenceDate", obj, v28, a9);
    }
    else
    {
      id v24 = 0;
      v23->_hasRaw_absoluteTimestamp = 0;
      double v25 = -1.0;
    }
    v23->_raw_absoluteTimestamp = v25;
    objc_storeStrong((id *)&v23->_childID, obj);
    objc_storeStrong((id *)&v23->_deviceID, v28);
    v23->_eventDirection = a6;
    v23->_eventType = a7;
    v23->_contentType = a8;
    objc_storeStrong((id *)&v23->_contactHandles, v29);
    objc_storeStrong((id *)&v23->_contentID, a10);
    objc_storeStrong((id *)&v23->_conversationID, a11);
    objc_storeStrong((id *)&v23->_imageData, a12);
    objc_storeStrong((id *)&v23->_sourceBundleID, a13);
    objc_storeStrong((id *)&v23->_senderHandle, a14);
    objc_storeStrong((id *)&v23->_contentURL, a15);
    objc_storeStrong((id *)&v23->_conversationURL, a16);
    id v18 = v24;
  }

  return v23;
}

+ (id)protoFields
{
  v18[14] = *MEMORY[0x1E4F143B8];
  char v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:1 type:0 subMessageClass:0];
  v18[0] = v17;
  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"childID" number:2 type:13 subMessageClass:0];
  v18[1] = v16;
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceID" number:3 type:13 subMessageClass:0];
  v18[2] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventDirection" number:4 type:4 subMessageClass:0];
  v18[3] = v14;
  unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventType" number:5 type:4 subMessageClass:0];
  v18[4] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentType" number:6 type:4 subMessageClass:0];
  v18[5] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contactHandles" number:7 type:13 subMessageClass:0];
  v18[6] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentID" number:8 type:13 subMessageClass:0];
  v18[7] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"conversationID" number:9 type:13 subMessageClass:0];
  v18[8] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"imageData" number:10 type:14 subMessageClass:0];
  v18[9] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceBundleID" number:11 type:13 subMessageClass:0];
  v18[10] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"senderHandle" number:12 type:13 subMessageClass:0];
  v18[11] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentURL" number:13 type:13 subMessageClass:0];
  v18[12] = v9;
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"conversationURL" number:14 type:13 subMessageClass:0];
  v18[13] = v10;
  char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:14];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4BA8;
}

+ (id)columns
{
  v18[14] = *MEMORY[0x1E4F143B8];
  char v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:1];
  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"childID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceID" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventDirection" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventType" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentType" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"contactHandles_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_123];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentID" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"conversationID" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"imageData" dataType:4 requestOnly:0 fieldNumber:10 protoDataType:14 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceBundleID" dataType:2 requestOnly:0 fieldNumber:11 protoDataType:13 convertedType:0];
  unsigned int v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"senderHandle" dataType:2 requestOnly:0 fieldNumber:12 protoDataType:13 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentURL" dataType:2 requestOnly:0 fieldNumber:13 protoDataType:13 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"conversationURL" dataType:2 requestOnly:0 fieldNumber:14 protoDataType:13 convertedType:0];
  v18[0] = v17;
  v18[1] = v16;
  v18[2] = v15;
  v18[3] = v14;
  v18[4] = v2;
  v18[5] = v3;
  v18[6] = v4;
  v18[7] = v5;
  v18[8] = v6;
  v18[9] = v13;
  v18[10] = v7;
  v18[11] = v12;
  v18[12] = v8;
  v18[13] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:14];

  return v11;
}

id __46__BMMessagesCommunicationSafetyResult_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 _contactHandlesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  if (a4 == 1)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMMessagesCommunicationSafetyResult_v1;
  }
  else
  {
    if (a4 != 2)
    {
      uint64_t v9 = 0;
      goto LABEL_9;
    }
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMMessagesCommunicationSafetyResult;
  }
  uint64_t v8 = [[v7 alloc] initByReadFrom:v6];
  uint64_t v9 = (void *)v8;
  if (v8) {
    *(_DWORD *)(v8 + 32) = a4;
  }

LABEL_9:

  return v9;
}

+ (unsigned)latestDataVersion
{
  return 2;
}

@end
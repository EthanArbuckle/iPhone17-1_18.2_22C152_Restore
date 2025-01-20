@interface BMIntentEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithDKEvent:(id)a3;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (int64_t)stream;
- (BMIntentEvent)initWithAbsoluteTime:(double)a3 bundleId:(id)a4 sourceId:(id)a5 intentClass:(id)a6 intentVerb:(id)a7 intentType:(int64_t)a8 intentHandlingStatus:(int64_t)a9 interaction:(id)a10;
- (BMIntentEvent)initWithAbsoluteTime:(double)a3 bundleId:(id)a4 sourceId:(id)a5 intentClass:(id)a6 intentVerb:(id)a7 intentType:(int64_t)a8 intentHandlingStatus:(int64_t)a9 interaction:(id)a10 itemID:(id)a11;
- (BMIntentEvent)initWithAbsoluteTime:(double)a3 bundleId:(id)a4 sourceId:(id)a5 intentClass:(id)a6 intentVerb:(id)a7 intentType:(int64_t)a8 intentHandlingStatus:(int64_t)a9 interaction:(id)a10 itemID:(id)a11 donatedBySiri:(BOOL)a12 interactionDirection:(int64_t)a13;
- (BMIntentEvent)initWithAbsoluteTime:(double)a3 bundleId:(id)a4 sourceId:(id)a5 intentClass:(id)a6 intentVerb:(id)a7 intentType:(int64_t)a8 intentHandlingStatus:(int64_t)a9 interaction:(id)a10 itemID:(id)a11 donatedBySiri:(BOOL)a12 interactionDirection:(int64_t)a13 groupIdentifier:(id)a14;
- (BMIntentEvent)initWithCoder:(id)a3;
- (BMIntentEvent)initWithProto:(id)a3;
- (BMIntentEvent)initWithProtoData:(id)a3;
- (BOOL)checkAndReportDecodingFailureIfNeededForCFAbsoluteTime:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForuint32_t:(unsigned int)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)donatedBySiri;
- (BOOL)isEqual:(id)a3;
- (NSData)interaction;
- (NSString)bundleID;
- (NSString)groupIdentifier;
- (NSString)identifier;
- (NSString)intentClass;
- (NSString)intentVerb;
- (NSString)itemID;
- (NSString)sourceId;
- (double)absoluteTimestamp;
- (id)encodeAsProto;
- (id)proto;
- (int64_t)intentHandlingStatus;
- (int64_t)intentType;
- (int64_t)interactionDirection;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)proto;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setBundleID:(id)a3;
- (void)setDonatedBySiri:(BOOL)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setIntentClass:(id)a3;
- (void)setIntentHandlingStatus:(int64_t)a3;
- (void)setIntentType:(int64_t)a3;
- (void)setIntentVerb:(id)a3;
- (void)setInteraction:(id)a3;
- (void)setInteractionDirection:(int64_t)a3;
- (void)setItemID:(id)a3;
- (void)setSourceId:(id)a3;
@end

@implementation BMIntentEvent

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 12)
  {
    v11 = (objc_class *)BMIntentEvent_v12;
LABEL_10:
    id v10 = (id)[[v11 alloc] initWithProtoData:v6];
    goto LABEL_16;
  }
  if (a4 == 9)
  {
    uint64_t v14 = 0;
    v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v14];
    v8 = v7;
    if (v14)
    {
      v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[BMIntentEvent eventWithData:dataVersion:]();
      }

      id v10 = 0;
    }
    else
    {
      id v10 = v7;
    }

    goto LABEL_16;
  }
  if ((a4 & 0xFFFFFFFE) == 0xA)
  {
    v11 = (objc_class *)a1;
    goto LABEL_10;
  }
  v12 = __biome_log_for_category();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    +[BMIntentEvent eventWithData:dataVersion:]();
  }

  id v10 = 0;
LABEL_16:

  return v10;
}

- (BMIntentEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[BMPBIntentEvent alloc] initWithData:v4];

    self = [(BMIntentEvent *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BMIntentEvent)initWithAbsoluteTime:(double)a3 bundleId:(id)a4 sourceId:(id)a5 intentClass:(id)a6 intentVerb:(id)a7 intentType:(int64_t)a8 intentHandlingStatus:(int64_t)a9 interaction:(id)a10 itemID:(id)a11 donatedBySiri:(BOOL)a12 interactionDirection:(int64_t)a13 groupIdentifier:(id)a14
{
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a10;
  id v25 = a11;
  id v26 = a14;
  if (!v24)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"BMIntentStreams.m", 391, @"Invalid parameter not satisfying: %@", @"interaction != nil" object file lineNumber description];
  }
  v33.receiver = self;
  v33.super_class = (Class)BMIntentEvent;
  v27 = [(BMEventBase *)&v33 init];
  v28 = v27;
  if (v27)
  {
    [(BMIntentEvent *)v27 setAbsoluteTimestamp:a3];
    [(BMIntentEvent *)v28 setBundleID:v20];
    [(BMIntentEvent *)v28 setSourceId:v21];
    [(BMIntentEvent *)v28 setIntentClass:v22];
    [(BMIntentEvent *)v28 setIntentVerb:v23];
    [(BMIntentEvent *)v28 setIntentType:a8];
    [(BMIntentEvent *)v28 setIntentHandlingStatus:a9];
    [(BMIntentEvent *)v28 setInteraction:v24];
    [(BMIntentEvent *)v28 setItemID:v25];
    [(BMIntentEvent *)v28 setDonatedBySiri:a12];
    [(BMIntentEvent *)v28 setInteractionDirection:a13];
    [(BMIntentEvent *)v28 setGroupIdentifier:v26];
  }

  return v28;
}

- (void)setSourceId:(id)a3
{
}

- (void)setItemID:(id)a3
{
}

- (void)setInteractionDirection:(int64_t)a3
{
  self->_interactionDirection = a3;
}

- (void)setInteraction:(id)a3
{
}

- (void)setIntentVerb:(id)a3
{
}

- (void)setIntentType:(int64_t)a3
{
  self->_intentType = a3;
}

- (void)setIntentHandlingStatus:(int64_t)a3
{
  self->_intentHandlingStatus = a3;
}

- (void)setIntentClass:(id)a3
{
}

- (void)setGroupIdentifier:(id)a3
{
}

- (void)setDonatedBySiri:(BOOL)a3
{
  self->_donatedBySiri = a3;
}

- (void)setBundleID:(id)a3
{
}

- (void)setAbsoluteTimestamp:(double)a3
{
  self->_absoluteTimestamp = a3;
}

- (NSString)intentClass
{
  return self->_intentClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_intentVerb, 0);
  objc_storeStrong((id *)&self->_intentClass, 0);
  objc_storeStrong((id *)&self->_sourceId, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

+ (id)eventWithDKEvent:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 metadata];
  v5 = [get_DKIntentMetadataKeyClass() serializedInteraction];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    v7 = [v3 metadata];
    v30 = [BMIntentEvent alloc];
    v46 = [v3 startDate];
    [v46 timeIntervalSinceReferenceDate];
    double v9 = v8;
    v45 = [v3 source];
    v44 = [v45 bundleID];
    v43 = [v3 source];
    v42 = [v43 sourceID];
    v41 = [get_DKIntentMetadataKeyClass() intentClass];
    v40 = -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:");
    v39 = [get_DKIntentMetadataKeyClass() intentVerb];
    v38 = -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:");
    v37 = [get_DKIntentMetadataKeyClass() intentType];
    v36 = -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:");
    uint64_t v47 = [v36 integerValue];
    id v10 = [v3 metadata];
    v34 = [get_DKIntentMetadataKeyClass() intentHandlingStatus];
    v35 = v10;
    objc_super v33 = objc_msgSend(v10, "objectForKeyedSubscript:");
    uint64_t v29 = [v33 integerValue];
    v32 = [get_DKIntentMetadataKeyClass() serializedInteraction];
    v11 = -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:");
    v31 = [v3 source];
    v12 = [v31 itemID];
    v28 = [get_DKIntentMetadataKeyClass() donatedBySiri];
    v27 = -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:");
    char v13 = [v27 BOOLValue];
    uint64_t v14 = [get_DKIntentMetadataKeyClass() direction];
    v15 = [v7 objectForKeyedSubscript:v14];
    unint64_t v16 = [v15 integerValue];
    if (v16 >= 4)
    {
      id v22 = __biome_log_for_category();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        +[BMIntentEvent eventWithDKEvent:]();
      }

      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = qword_18EB369E8[v16];
    }
    id v23 = [v3 source];
    id v24 = [v23 groupID];
    LOBYTE(v26) = v13;
    v48 = [(BMIntentEvent *)v30 initWithAbsoluteTime:v44 bundleId:v42 sourceId:v40 intentClass:v38 intentVerb:v47 intentType:v29 intentHandlingStatus:v9 interaction:v11 itemID:v12 donatedBySiri:v26 interactionDirection:v17 groupIdentifier:v24];
  }
  else
  {
    v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v18 = [v3 source];
      v19 = [v18 bundleID];
      id v20 = [v3 source];
      id v21 = [v20 sourceID];
      *(_DWORD *)buf = 138543618;
      v50 = v19;
      __int16 v51 = 2112;
      v52 = v21;
      _os_log_impl(&dword_18E67D000, v7, OS_LOG_TYPE_INFO, "nil interaction found on event bundle:%{public}@ source:%{}@", buf, 0x16u);
    }
    v48 = 0;
  }

  return v48;
}

- (BMIntentEvent)initWithAbsoluteTime:(double)a3 bundleId:(id)a4 sourceId:(id)a5 intentClass:(id)a6 intentVerb:(id)a7 intentType:(int64_t)a8 intentHandlingStatus:(int64_t)a9 interaction:(id)a10 itemID:(id)a11
{
  LOBYTE(v12) = 0;
  return [(BMIntentEvent *)self initWithAbsoluteTime:a4 bundleId:a5 sourceId:a6 intentClass:a7 intentVerb:a8 intentType:a9 intentHandlingStatus:a3 interaction:a10 itemID:a11 donatedBySiri:v12 interactionDirection:0];
}

- (BMIntentEvent)initWithAbsoluteTime:(double)a3 bundleId:(id)a4 sourceId:(id)a5 intentClass:(id)a6 intentVerb:(id)a7 intentType:(int64_t)a8 intentHandlingStatus:(int64_t)a9 interaction:(id)a10 itemID:(id)a11 donatedBySiri:(BOOL)a12 interactionDirection:(int64_t)a13
{
  LOBYTE(v14) = a12;
  return [(BMIntentEvent *)self initWithAbsoluteTime:a4 bundleId:a5 sourceId:a6 intentClass:a7 intentVerb:a8 intentType:a9 intentHandlingStatus:a3 interaction:a10 itemID:a11 donatedBySiri:v14 interactionDirection:a13 groupIdentifier:0];
}

- (BMIntentEvent)initWithAbsoluteTime:(double)a3 bundleId:(id)a4 sourceId:(id)a5 intentClass:(id)a6 intentVerb:(id)a7 intentType:(int64_t)a8 intentHandlingStatus:(int64_t)a9 interaction:(id)a10
{
  return [(BMIntentEvent *)self initWithAbsoluteTime:a4 bundleId:a5 sourceId:a6 intentClass:a7 intentVerb:a8 intentType:a9 intentHandlingStatus:a3 interaction:a10 itemID:0];
}

- (unsigned)dataVersion
{
  return 11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForCFAbsoluteTime:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (a3 == 0.0)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      unint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = [NSString stringWithFormat:@"Failed to decode key %@", v11, *MEMORY[0x1E4F28568]];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = [v16 errorWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      unint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = [NSString stringWithFormat:@"Failed to decode key %@", v11, *MEMORY[0x1E4F28568]];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = [v16 errorWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForuint32_t:(unsigned int)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      unint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = [NSString stringWithFormat:@"Failed to decode key %@", v11, *MEMORY[0x1E4F28568]];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = [v16 errorWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMIntentEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protoData"];
}

- (BMIntentEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protoData"];
  if (v5)
  {
    self = [(BMIntentEvent *)self initWithProtoData:v5];
    id v6 = self;
  }
  else
  {
    v7 = (objc_class *)objc_opt_class();
    double v8 = NSStringFromClass(v7);
    [v4 decodeDoubleForKey:@"absoluteTime"];
    double v10 = v9;
    if (-[BMIntentEvent checkAndReportDecodingFailureIfNeededForCFAbsoluteTime:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForCFAbsoluteTime:key:coder:errorDomain:errorCode:", @"absoluteTime", v4, v8, -1))
    {
      id v6 = 0;
    }
    else
    {
      id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
      id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceId"];
      id v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentClass"];
      id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentVerb"];
      uint64_t v19 = [v4 decodeIntegerForKey:@"intentType"];
      uint64_t v18 = [v4 decodeIntegerForKey:@"intentHandlingStatus"];
      BOOL v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interaction"];
      v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemID"];
      LOBYTE(v17) = 0;
      self = [(BMIntentEvent *)self initWithAbsoluteTime:v11 bundleId:v12 sourceId:v20 intentClass:v13 intentVerb:v19 intentType:v18 intentHandlingStatus:v10 interaction:v14 itemID:v15 donatedBySiri:v17 interactionDirection:0 groupIdentifier:0];

      id v6 = self;
    }
  }
  return v6;
}

- (unint64_t)hash
{
  id v3 = NSNumber;
  [(BMIntentEvent *)self absoluteTimestamp];
  uint64_t v26 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v4 = [v26 hash];
  id v25 = [(BMIntentEvent *)self bundleID];
  uint64_t v5 = [v25 hash];
  id v24 = [(BMIntentEvent *)self sourceId];
  uint64_t v6 = v5 ^ [v24 hash];
  id v23 = [(BMIntentEvent *)self intentClass];
  uint64_t v7 = v6 ^ [v23 hash];
  double v8 = [(BMIntentEvent *)self intentVerb];
  uint64_t v9 = v7 ^ [v8 hash] ^ v4;
  double v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[BMIntentEvent intentType](self, "intentType"));
  uint64_t v11 = [v10 hash];
  id v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[BMIntentEvent intentHandlingStatus](self, "intentHandlingStatus"));
  uint64_t v13 = v9 ^ v11 ^ [v12 hash];
  BOOL v14 = [(BMIntentEvent *)self interaction];
  uint64_t v15 = [v14 hash];
  unint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[BMIntentEvent donatedBySiri](self, "donatedBySiri"));
  uint64_t v17 = v15 ^ [v16 hash];
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithInteger:", -[BMIntentEvent interactionDirection](self, "interactionDirection"));
  uint64_t v19 = v13 ^ v17 ^ [v18 hash];
  id v20 = [(BMIntentEvent *)self groupIdentifier];
  unint64_t v21 = v19 ^ [v20 hash];

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    [(BMIntentEvent *)self absoluteTimestamp];
    double v9 = v8;
    [v7 absoluteTimestamp];
    if (v9 != v10)
    {
      char v14 = 0;
LABEL_44:

      goto LABEL_45;
    }
    uint64_t v11 = [(BMIntentEvent *)self bundleID];
    if (v11 || ([v7 bundleID], (v60 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v12 = [(BMIntentEvent *)self bundleID];
      id v3 = [v7 bundleID];
      if (([v12 isEqual:v3] & 1) == 0)
      {

        char v14 = 0;
LABEL_41:
        if (!v11) {

        }
        goto LABEL_44;
      }
      v57 = v12;
      int v13 = 1;
    }
    else
    {
      v60 = 0;
      int v13 = 0;
    }
    uint64_t v15 = [(BMIntentEvent *)self intentClass];
    if (v15 || ([v7 intentClass], (v55 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      unint64_t v16 = [(BMIntentEvent *)self intentClass];
      uint64_t v4 = [v7 intentClass];
      v59 = v16;
      if (![v16 isEqual:v4])
      {
        char v14 = 0;
        goto LABEL_36;
      }
      int v56 = 1;
    }
    else
    {
      v55 = 0;
      int v56 = 0;
    }
    uint64_t v58 = [(BMIntentEvent *)self intentVerb];
    if (!v58)
    {
      v50 = [v7 intentVerb];
      if (!v50)
      {
        uint64_t v53 = v4;
        int v17 = v13;
        id v20 = v60;
        v50 = 0;
        int v52 = 0;
LABEL_26:
        int64_t v22 = [(BMIntentEvent *)self intentHandlingStatus];
        v60 = v20;
        if (v22 != [v7 intentHandlingStatus])
        {
          char v14 = 0;
          int v13 = v17;
          uint64_t v4 = v53;
          id v24 = v51;
          if ((v52 & 1) == 0) {
            goto LABEL_33;
          }
          goto LABEL_32;
        }
        uint64_t v48 = [(BMIntentEvent *)self interaction];
        if (v48 || ([v7 interaction], (v43 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v23 = [(BMIntentEvent *)self interaction];
          v46 = [v7 interaction];
          uint64_t v47 = v23;
          int v13 = v17;
          if (!objc_msgSend(v23, "isEqual:"))
          {
            char v14 = 0;
            uint64_t v4 = v53;
            id v24 = v51;
            int v27 = v52;
LABEL_69:

            goto LABEL_70;
          }
          int v44 = 1;
        }
        else
        {
          v43 = 0;
          int v44 = 0;
          int v13 = v17;
        }
        v28 = [(BMIntentEvent *)self itemID];
        v45 = v28;
        if (v28 || ([v7 itemID], (v41 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v29 = [(BMIntentEvent *)self itemID];
          v28 = [v7 itemID];
          uint64_t v4 = v53;
          if (([v29 isEqual:v28] & 1) == 0)
          {

            v30 = v45;
            if (!v45) {
              v30 = v41;
            }

            char v14 = 0;
            id v24 = v51;
            int v27 = v52;
            if (v44) {
              goto LABEL_69;
            }
            goto LABEL_70;
          }
          v40 = v29;
          int v42 = 1;
        }
        else
        {
          v41 = 0;
          int v42 = 0;
          uint64_t v4 = v53;
        }
        int v31 = [(BMIntentEvent *)self donatedBySiri];
        if (v31 != [v7 donatedBySiri]
          || (int64_t v32 = [(BMIntentEvent *)self interactionDirection],
              v32 != [v7 interactionDirection]))
        {
          char v14 = 0;
          if (!v42) {
            goto LABEL_66;
          }
          goto LABEL_65;
        }
        uint64_t v33 = [(BMIntentEvent *)self groupIdentifier];
        if (v33 || ([v7 groupIdentifier], (uint64_t v38 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v54 = v28;
          v39 = [(BMIntentEvent *)self groupIdentifier];
          [v7 groupIdentifier];
          v35 = v34 = (void *)v33;
          char v14 = [v39 isEqual:v35];

          if (v34)
          {

            v28 = v54;
            if ((v42 & 1) == 0) {
              goto LABEL_66;
            }
            goto LABEL_65;
          }
          v37 = (void *)v38;
          v28 = v54;
        }
        else
        {
          v37 = 0;
          char v14 = 1;
        }

        if ((v42 & 1) == 0)
        {
LABEL_66:
          if (!v45) {

          }
          id v24 = v51;
          int v27 = v52;
          if (v44) {
            goto LABEL_69;
          }
LABEL_70:
          v36 = (void *)v48;
          if (!v48)
          {

            v36 = 0;
          }

          if (!v27)
          {
LABEL_33:
            id v25 = (void *)v58;
            if (!v58)
            {

              id v25 = 0;
            }

            if (!v56) {
              goto LABEL_37;
            }
            goto LABEL_36;
          }
LABEL_32:

          goto LABEL_33;
        }
LABEL_65:

        goto LABEL_66;
      }
    }
    int v17 = v13;
    uint64_t v18 = [(BMIntentEvent *)self intentVerb];
    uint64_t v19 = [v7 intentVerb];
    if ([v18 isEqual:v19])
    {
      __int16 v51 = v19;
      v49 = v18;
      uint64_t v53 = v4;
      id v20 = v60;
      int v52 = 1;
      goto LABEL_26;
    }

    unint64_t v21 = (void *)v58;
    if (!v58) {
      unint64_t v21 = v50;
    }

    char v14 = 0;
    int v13 = v17;
    if ((v56 & 1) == 0) {
      goto LABEL_37;
    }
LABEL_36:

LABEL_37:
    if (!v15) {

    }
    if (v13)
    {
    }
    goto LABEL_41;
  }
  char v14 = 0;
LABEL_45:

  return v14;
}

- (NSString)identifier
{
  return (NSString *)[NSString stringWithFormat:@"%@:%@", self->_bundleID, self->_itemID];
}

+ (int64_t)stream
{
  return 2;
}

- (id)encodeAsProto
{
  v2 = [(BMIntentEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (BMIntentEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v23 = typeWithBMPBIntentType([v5 intentType]);
      unsigned int v6 = [v5 intentHandlingStatus];
      if (v6 >= 7)
      {
        double v8 = __biome_log_for_category();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[BMIntentEvent initWithProto:]();
        }

        uint64_t v22 = 0;
      }
      else
      {
        uint64_t v22 = v6;
      }
      uint64_t v21 = interactionDirectionWithPB([v5 interactionDirection]);
      [v5 absoluteTimestamp];
      double v10 = v9;
      id v20 = [v5 bundleID];
      uint64_t v11 = [v5 sourceId];
      id v12 = [v5 intentClass];
      int v13 = [v5 intentVerb];
      char v14 = [v5 interaction];
      uint64_t v15 = [v5 itemID];
      char v16 = [v5 donatedBySiri];
      int v17 = [v5 groupIdentifier];
      LOBYTE(v19) = v16;
      self = [(BMIntentEvent *)self initWithAbsoluteTime:v20 bundleId:v11 sourceId:v12 intentClass:v13 intentVerb:v23 intentType:v22 intentHandlingStatus:v10 interaction:v14 itemID:v15 donatedBySiri:v19 interactionDirection:v21 groupIdentifier:v17];

      id v7 = self;
    }
    else
    {
      uint64_t v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMIntentEvent initWithProto:]();
      }
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)proto
{
  id v3 = objc_opt_new();
  [(BMIntentEvent *)self absoluteTimestamp];
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  id v4 = [(BMIntentEvent *)self bundleID];
  [v3 setBundleID:v4];

  uint64_t v5 = [(BMIntentEvent *)self sourceId];
  [v3 setSourceId:v5];

  unsigned int v6 = [(BMIntentEvent *)self intentClass];
  [v3 setIntentClass:v6];

  id v7 = [(BMIntentEvent *)self intentVerb];
  [v3 setIntentVerb:v7];

  unint64_t v8 = [(BMIntentEvent *)self intentType];
  if (v8 >= 4)
  {
    double v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[BMIntentEvent proto]();
    }

    unint64_t v8 = 0;
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
  }
  uint64_t v11 = 0;
  switch([(BMIntentEvent *)self intentHandlingStatus])
  {
    case 0:
      break;
    case 1:
      uint64_t v11 = 1;
      break;
    case 2:
      uint64_t v11 = 2;
      break;
    case 3:
      uint64_t v11 = 3;
      break;
    case 4:
      uint64_t v11 = 4;
      break;
    case 5:
      uint64_t v11 = 5;
      break;
    case 6:
      uint64_t v11 = 6;
      break;
    default:
      id v12 = __biome_log_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[BMIntentEvent proto]();
      }

      uint64_t v11 = 0;
      int v9 = 1;
      break;
  }
  unint64_t v13 = [(BMIntentEvent *)self interactionDirection];
  if (v13 >= 4)
  {
    uint64_t v18 = __biome_log_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[BMIntentEvent proto]();
    }
  }
  else if (!v9)
  {
    [v3 setIntentType:v8];
    [v3 setIntentHandlingStatus:v11];
    char v14 = [(BMIntentEvent *)self interaction];
    [v3 setInteraction:v14];

    uint64_t v15 = [(BMIntentEvent *)self itemID];
    [v3 setItemID:v15];

    objc_msgSend(v3, "setDonatedBySiri:", -[BMIntentEvent donatedBySiri](self, "donatedBySiri"));
    [v3 setInteractionDirection:v13];
    char v16 = [(BMIntentEvent *)self groupIdentifier];
    [v3 setGroupIdentifier:v16];

    id v17 = v3;
    goto LABEL_23;
  }
  id v17 = 0;
LABEL_23:

  return v17;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)sourceId
{
  return self->_sourceId;
}

- (NSString)intentVerb
{
  return self->_intentVerb;
}

- (int64_t)intentType
{
  return self->_intentType;
}

- (int64_t)intentHandlingStatus
{
  return self->_intentHandlingStatus;
}

- (NSData)interaction
{
  return self->_interaction;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (BOOL)donatedBySiri
{
  return self->_donatedBySiri;
}

- (int64_t)interactionDirection
{
  return self->_interactionDirection;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

+ (void)eventWithDKEvent:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  v0 = objc_msgSend(NSNumber, "numberWithInteger:");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "BMIntentEvent: unable to convert _CDInteractionDirection enum value: %@", v3, v4, v5, v6, v7);
}

+ (void)eventWithData:dataVersion:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_18E67D000, v0, v1, "Mismatched BMIntentEvent data versions, cannot deserialize", v2, v3, v4, v5, v6);
}

+ (void)eventWithData:dataVersion:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_18E67D000, v0, v1, "Unable to unarchive BMIntentEvent", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  v0 = objc_msgSend(NSNumber, "numberWithInt:");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "BMIntentEvent: unable to convert BMPBIntentHandlingStatus enum value: %@", v3, v4, v5, v6, v7);
}

- (void)initWithProto:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_18E67D000, v2, v3, "%@: tried to initialize with a non-BMPBIntentEvent proto", v4, v5, v6, v7, v8);
}

- (void)proto
{
  OUTLINED_FUNCTION_2_1();
  v0 = objc_msgSend(NSNumber, "numberWithInteger:");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "BMIntentEvent: unable to convert BMIntentType enum value: %@", v3, v4, v5, v6, v7);
}

@end
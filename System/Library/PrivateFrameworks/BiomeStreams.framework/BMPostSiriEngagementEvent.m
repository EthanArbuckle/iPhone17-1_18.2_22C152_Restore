@interface BMPostSiriEngagementEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMPostSiriEngagementEvent)initWithUISessionID:(id)a3 taskID:(id)a4 taskType:(id)a5 conversationPath:(id)a6 taskSuccess:(int)a7 isUserAbandoned:(BOOL)a8 isUserCancelled:(BOOL)a9 pseEvents:(id)a10;
- (BMPostSiriEngagementEvent)initWithUISessionId:(id)a3 domain:(id)a4 action:(id)a5 isPostSiriEngagement:(BOOL)a6 pseDeltaDuration:(double)a7 pseDeltaSinceUIStart:(double)a8 pseDeltaSinceUIEnd:(double)a9 pseContents:(id)a10;
- (BOOL)hasIsUserAbandoned;
- (BOOL)hasIsUserCancelled;
- (BOOL)hasTaskSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserAbandoned;
- (BOOL)isUserCancelled;
- (NSArray)pseEvents;
- (NSString)UISessionID;
- (NSString)conversationPath;
- (NSString)description;
- (NSString)taskID;
- (NSString)taskType;
- (id)initByReadFrom:(id)a3;
- (id)serialize;
- (int)taskSuccess;
- (unsigned)dataVersion;
- (void)setHasIsUserAbandoned:(BOOL)a3;
- (void)setHasIsUserCancelled:(BOOL)a3;
- (void)setHasTaskSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPostSiriEngagementEvent

- (BMPostSiriEngagementEvent)initWithUISessionID:(id)a3 taskID:(id)a4 taskType:(id)a5 conversationPath:(id)a6 taskSuccess:(int)a7 isUserAbandoned:(BOOL)a8 isUserCancelled:(BOOL)a9 pseEvents:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v24 = a5;
  id v17 = a6;
  id v18 = a10;
  v25.receiver = self;
  v25.super_class = (Class)BMPostSiriEngagementEvent;
  v19 = [(BMEventBase *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_UISessionID, a3);
    objc_storeStrong((id *)&v20->_taskID, a4);
    objc_storeStrong((id *)&v20->_taskType, a5);
    objc_storeStrong((id *)&v20->_conversationPath, a6);
    v20->_hasTaskSuccess = 1;
    v20->_taskSuccess = a7;
    v20->_hasIsUserAbandoned = 1;
    v20->_isUserAbandoned = a8;
    v20->_hasIsUserCancelled = 1;
    v20->_isUserCancelled = a9;
    objc_storeStrong((id *)&v20->_pseEvents, a10);
  }

  return v20;
}

- (BMPostSiriEngagementEvent)initWithUISessionId:(id)a3 domain:(id)a4 action:(id)a5 isPostSiriEngagement:(BOOL)a6 pseDeltaDuration:(double)a7 pseDeltaSinceUIStart:(double)a8 pseDeltaSinceUIEnd:(double)a9 pseContents:(id)a10
{
  BOOL v14 = a6;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a10;
  v51.receiver = self;
  v51.super_class = (Class)BMPostSiriEngagementEvent;
  v23 = [(BMEventBase *)&v51 init];
  id v24 = v23;
  if (v23)
  {
    BOOL v43 = v14;
    id v44 = v21;
    id v45 = v20;
    id v46 = v19;
    objc_storeStrong((id *)&v23->_UISessionID, a3);
    taskID = v24->_taskID;
    v24->_taskID = 0;

    taskType = v24->_taskType;
    v24->_taskType = 0;

    conversationPath = v24->_conversationPath;
    v24->_conversationPath = 0;

    v24->_hasTaskSuccess = 0;
    v24->_hasIsUserAbandoned = 0;
    v24->_hasIsUserCancelled = 0;
    v42 = [[BMPostSiriEngagementEventSignalDeltaEvent alloc] initWithDuration:a7 sinceUIEnd:a9 sinceUIStart:a8];
    v28 = objc_opt_new();
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v29 = v22;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v48 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          v35 = [BMPostSiriEngagementEventSignalContent alloc];
          v36 = [v29 objectForKeyedSubscript:v34];
          v37 = [(BMPostSiriEngagementEventSignalContent *)v35 initWithKey:v34 value:v36];

          [v28 addObject:v37];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v31);
    }

    id v21 = v44;
    id v20 = v45;
    v38 = [[BMPostSiriEngagementEventSignal alloc] initWithDomain:v45 action:v44 isPostSiriEngagement:v43 pseDelta:v42 pseContents:v28];
    v52 = v38;
    uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
    pseEvents = v24->_pseEvents;
    v24->_pseEvents = (NSArray *)v39;

    id v19 = v46;
  }

  return v24;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [(BMPostSiriEngagementEvent *)self UISessionID];
  v5 = [(BMPostSiriEngagementEvent *)self taskID];
  v6 = [(BMPostSiriEngagementEvent *)self taskType];
  v7 = [(BMPostSiriEngagementEvent *)self conversationPath];
  uint64_t v8 = [(BMPostSiriEngagementEvent *)self taskSuccess];
  if (v8 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E55D76D0[(int)v8];
  }
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPostSiriEngagementEvent isUserAbandoned](self, "isUserAbandoned"));
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPostSiriEngagementEvent isUserCancelled](self, "isUserCancelled"));
  v12 = [(BMPostSiriEngagementEvent *)self pseEvents];
  v13 = (void *)[v3 initWithFormat:@"BMPostSiriEngagementEvent with UISessionID: %@, taskID: %@, taskType: %@, conversationPath: %@, taskSuccess: %@, isUserAbandoned: %@, isUserCancelled: %@, pseEvents: %@", v4, v5, v6, v7, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)BMPostSiriEngagementEvent;
  v5 = [(BMEventBase *)&v58 init];
  if (!v5) {
    goto LABEL_67;
  }
  v6 = objc_opt_new();
  v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v10 = &OBJC_IVAR___BMPBRankableSocialHighlight__groupPhotoPathDigest;
    v11 = &OBJC_IVAR___BMPBRankableSocialHighlight__groupPhotoPathDigest;
    v12 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v7;
        uint64_t v17 = *(void *)&v4[v16];
        unint64_t v18 = v17 + 1;
        if (v17 == -1 || v18 > *(void *)&v4[*v8]) {
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
          int v21 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v21 = v4[*v9];
      if (v4[*v9]) {
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
          uint64_t v24 = v10[690];
          goto LABEL_26;
        case 2u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = v11[691];
          goto LABEL_26;
        case 3u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 48;
          goto LABEL_26;
        case 4u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 56;
LABEL_26:
          objc_super v25 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        case 5u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          v5->_hasTaskSuccess = 1;
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
              char v32 = *(unsigned char *)(*(void *)&v4[*v12] + v30);
              *(void *)&v4[v29] = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                BOOL v20 = v27++ >= 9;
                if (v20)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_54;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v28) = 0;
          }
LABEL_54:
          v5->_taskSuccess = v28;
          continue;
        case 6u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          v5->_hasIsUserAbandoned = 1;
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
              char v39 = *(unsigned char *)(*(void *)&v4[*v12] + v37);
              *(void *)&v4[v36] = v38;
              v35 |= (unint64_t)(v39 & 0x7F) << v33;
              if (v39 < 0)
              {
                v33 += 7;
                BOOL v20 = v34++ >= 9;
                if (v20)
                {
                  uint64_t v35 = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v35 = 0;
          }
LABEL_58:
          BOOL v51 = v35 != 0;
          uint64_t v52 = 18;
          goto LABEL_63;
        case 7u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v42 = 0;
          v5->_hasIsUserCancelled = 1;
          break;
        case 8u:
          uint64_t v59 = 0;
          uint64_t v60 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_69;
          }
          long long v47 = v11;
          long long v48 = v10;
          id v49 = [[BMPostSiriEngagementEventSignal alloc] initByReadFrom:v4];
          if (!v49) {
            goto LABEL_69;
          }
          long long v50 = v49;
          [v6 addObject:v49];
          PBReaderRecallMark();

          v10 = v48;
          v11 = v47;
          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_69:

          goto LABEL_66;
      }
      while (1)
      {
        uint64_t v43 = *v7;
        uint64_t v44 = *(void *)&v4[v43];
        unint64_t v45 = v44 + 1;
        if (v44 == -1 || v45 > *(void *)&v4[*v8]) {
          break;
        }
        char v46 = *(unsigned char *)(*(void *)&v4[*v12] + v44);
        *(void *)&v4[v43] = v45;
        v42 |= (unint64_t)(v46 & 0x7F) << v40;
        if ((v46 & 0x80) == 0) {
          goto LABEL_60;
        }
        v40 += 7;
        BOOL v20 = v41++ >= 9;
        if (v20)
        {
          uint64_t v42 = 0;
          goto LABEL_62;
        }
      }
      v4[*v9] = 1;
LABEL_60:
      if (v4[*v9]) {
        uint64_t v42 = 0;
      }
LABEL_62:
      BOOL v51 = v42 != 0;
      uint64_t v52 = 20;
LABEL_63:
      *((unsigned char *)&v5->super.super.isa + v52) = v51;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v53 = [v6 copy];
  pseEvents = v5->_pseEvents;
  v5->_pseEvents = (NSArray *)v53;

  int v55 = v4[*v9];
  if (v55) {
LABEL_66:
  }
    v56 = 0;
  else {
LABEL_67:
  }
    v56 = v5;

  return v56;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_UISessionID) {
    PBDataWriterWriteStringField();
  }
  if (self->_taskID) {
    PBDataWriterWriteStringField();
  }
  if (self->_taskType) {
    PBDataWriterWriteStringField();
  }
  if (self->_conversationPath) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasTaskSuccess) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasIsUserAbandoned) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsUserCancelled) {
    PBDataWriterWriteBOOLField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_pseEvents;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    uint64_t v6 = (void *)[[v4 alloc] initWithData:v5];

    id v7 = [[BMPostSiriEngagementEvent alloc] initByReadFrom:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)serialize
{
  id v3 = objc_opt_new();
  [(BMPostSiriEngagementEvent *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(BMPostSiriEngagementEvent *)self UISessionID];
    id v7 = [v5 UISessionID];
    if (v6 == v7)
    {
      int v10 = 1;
    }
    else
    {
      uint64_t v8 = [(BMPostSiriEngagementEvent *)self UISessionID];
      v9 = [v5 UISessionID];
      int v10 = [v8 isEqual:v9];
    }
    long long v12 = [(BMPostSiriEngagementEvent *)self taskID];
    long long v13 = [v5 taskID];
    if (v12 == v13)
    {
      char v16 = 1;
    }
    else
    {
      long long v14 = [(BMPostSiriEngagementEvent *)self taskID];
      unint64_t v15 = [v5 taskID];
      char v16 = [v14 isEqual:v15];
    }
    uint64_t v17 = [(BMPostSiriEngagementEvent *)self taskType];
    unint64_t v18 = [v5 taskType];
    if (v17 == v18)
    {
      char v21 = 1;
    }
    else
    {
      char v19 = [(BMPostSiriEngagementEvent *)self taskType];
      BOOL v20 = [v5 taskType];
      char v21 = [v19 isEqual:v20];
    }
    id v22 = [(BMPostSiriEngagementEvent *)self conversationPath];
    uint64_t v23 = [v5 conversationPath];
    LODWORD(v42) = v10;
    if (v22 == v23)
    {
      char v26 = 1;
    }
    else
    {
      uint64_t v24 = [(BMPostSiriEngagementEvent *)self conversationPath];
      objc_super v25 = [v5 conversationPath];
      char v26 = [v24 isEqual:v25];
    }
    char v46 = v16;
    if ([(BMPostSiriEngagementEvent *)self hasTaskSuccess]
      || [v5 hasTaskSuccess])
    {
      if ([(BMPostSiriEngagementEvent *)self hasTaskSuccess]
        && [v5 hasTaskSuccess])
      {
        int v27 = [(BMPostSiriEngagementEvent *)self taskSuccess];
        BOOL v28 = v27 == [v5 taskSuccess];
      }
      else
      {
        BOOL v28 = 0;
      }
    }
    else
    {
      BOOL v28 = 1;
    }
    char v45 = v21;
    if ([(BMPostSiriEngagementEvent *)self hasIsUserAbandoned]
      || [v5 hasIsUserAbandoned])
    {
      if ([(BMPostSiriEngagementEvent *)self hasIsUserAbandoned]
        && [v5 hasIsUserAbandoned])
      {
        BOOL v29 = [(BMPostSiriEngagementEvent *)self isUserAbandoned];
        int v30 = v29 ^ [v5 isUserAbandoned] ^ 1;
      }
      else
      {
        LOBYTE(v30) = 0;
      }
    }
    else
    {
      LOBYTE(v30) = 1;
    }
    char v44 = v26;
    if ([(BMPostSiriEngagementEvent *)self hasIsUserCancelled]
      || [v5 hasIsUserCancelled])
    {
      if ([(BMPostSiriEngagementEvent *)self hasIsUserCancelled]
        && [v5 hasIsUserCancelled])
      {
        BOOL v31 = [(BMPostSiriEngagementEvent *)self isUserCancelled];
        int v32 = v31 ^ [v5 isUserCancelled] ^ 1;
      }
      else
      {
        LOBYTE(v32) = 0;
      }
    }
    else
    {
      LOBYTE(v32) = 1;
    }
    char v33 = [(BMPostSiriEngagementEvent *)self pseEvents];
    unsigned int v34 = [v5 pseEvents];
    if (v33 == v34)
    {
      char v40 = 1;
    }
    else
    {
      uint64_t v35 = [(BMPostSiriEngagementEvent *)self pseEvents];
      [v5 pseEvents];
      id v36 = v4;
      char v37 = v30;
      char v39 = v38 = v28;
      char v40 = [v35 isEqual:v39];

      BOOL v28 = v38;
      LOBYTE(v30) = v37;
      id v4 = v36;
    }
    BOOL v11 = v43 & v46 & v45 & v44 & v28 & v30 & v32 & v40;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (NSString)UISessionID
{
  return self->_UISessionID;
}

- (NSString)taskID
{
  return self->_taskID;
}

- (NSString)taskType
{
  return self->_taskType;
}

- (NSString)conversationPath
{
  return self->_conversationPath;
}

- (BOOL)hasTaskSuccess
{
  return self->_hasTaskSuccess;
}

- (void)setHasTaskSuccess:(BOOL)a3
{
  self->_hasTaskSuccess = a3;
}

- (int)taskSuccess
{
  return self->_taskSuccess;
}

- (BOOL)hasIsUserAbandoned
{
  return self->_hasIsUserAbandoned;
}

- (void)setHasIsUserAbandoned:(BOOL)a3
{
  self->_hasIsUserAbandoned = a3;
}

- (BOOL)isUserAbandoned
{
  return self->_isUserAbandoned;
}

- (BOOL)hasIsUserCancelled
{
  return self->_hasIsUserCancelled;
}

- (void)setHasIsUserCancelled:(BOOL)a3
{
  self->_hasIsUserCancelled = a3;
}

- (BOOL)isUserCancelled
{
  return self->_isUserCancelled;
}

- (NSArray)pseEvents
{
  return self->_pseEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pseEvents, 0);
  objc_storeStrong((id *)&self->_conversationPath, 0);
  objc_storeStrong((id *)&self->_taskType, 0);
  objc_storeStrong((id *)&self->_taskID, 0);

  objc_storeStrong((id *)&self->_UISessionID, 0);
}

@end
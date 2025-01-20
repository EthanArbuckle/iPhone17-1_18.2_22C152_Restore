@interface BMPostSiriEngagementEventSignal
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMPostSiriEngagementEventSignal)initWithDomain:(id)a3 action:(id)a4 isPostSiriEngagement:(BOOL)a5 pseDelta:(id)a6 pseContents:(id)a7;
- (BMPostSiriEngagementEventSignal)initWithDomain:(id)a3 action:(id)a4 isPostSiriEngagement:(BOOL)a5 pseDelta:(id)a6 pseContentsDictionary:(id)a7;
- (BMPostSiriEngagementEventSignalDeltaEvent)pseDelta;
- (BOOL)hasIsPostSiriEngagement;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPostSiriEngagement;
- (NSArray)pseContents;
- (NSString)action;
- (NSString)description;
- (NSString)domain;
- (id)initByReadFrom:(id)a3;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasIsPostSiriEngagement:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPostSiriEngagementEventSignal

- (BMPostSiriEngagementEventSignal)initWithDomain:(id)a3 action:(id)a4 isPostSiriEngagement:(BOOL)a5 pseDelta:(id)a6 pseContentsDictionary:(id)a7
{
  BOOL v25 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v26 = a4;
  id v10 = a6;
  id v11 = a7;
  v12 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 8 * v17);
        v19 = [BMPostSiriEngagementEventSignalContent alloc];
        v20 = [v13 objectForKeyedSubscript:v18];
        v21 = [(BMPostSiriEngagementEventSignalContent *)v19 initWithKey:v18 value:v20];

        [v12 addObject:v21];
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v15);
  }

  v22 = [(BMPostSiriEngagementEventSignal *)self initWithDomain:v27 action:v26 isPostSiriEngagement:v25 pseDelta:v10 pseContents:v12];
  return v22;
}

- (BMPostSiriEngagementEventSignal)initWithDomain:(id)a3 action:(id)a4 isPostSiriEngagement:(BOOL)a5 pseDelta:(id)a6 pseContents:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMPostSiriEngagementEventSignal;
  uint64_t v17 = [(BMEventBase *)&v20 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_domain, a3);
    objc_storeStrong((id *)&v18->_action, a4);
    v18->_hasIsPostSiriEngagement = 1;
    v18->_isPostSiriEngagement = a5;
    objc_storeStrong((id *)&v18->_pseDelta, a6);
    objc_storeStrong((id *)&v18->_pseContents, a7);
  }

  return v18;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [(BMPostSiriEngagementEventSignal *)self domain];
  v5 = [(BMPostSiriEngagementEventSignal *)self action];
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPostSiriEngagementEventSignal isPostSiriEngagement](self, "isPostSiriEngagement"));
  v7 = [(BMPostSiriEngagementEventSignal *)self pseDelta];
  v8 = [(BMPostSiriEngagementEventSignal *)self pseContents];
  v9 = (void *)[v3 initWithFormat:@"BMPostSiriEngagementEventSignal with domain: %@, action: %@, isPostSiriEngagement: %@, pseDelta: %@, pseContents: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BMPostSiriEngagementEventSignal;
  v5 = [(BMEventBase *)&v40 init];
  if (!v5) {
    goto LABEL_45;
  }
  v6 = objc_opt_new();
  v7 = (int *)MEMORY[0x1E4F940E8];
  v8 = (int *)MEMORY[0x1E4F940E0];
  v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v10 = (int *)MEMORY[0x1E4F940B8];
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
          uint64_t v22 = 24;
          goto LABEL_24;
        case 2u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 32;
LABEL_24:
          v23 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        case 3u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          v5->_hasIsPostSiriEngagement = 1;
          break;
        case 4u:
          uint64_t v41 = 0;
          uint64_t v42 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_47;
          }
          long long v31 = [[BMPostSiriEngagementEventSignalDeltaEvent alloc] initByReadFrom:v4];
          if (!v31) {
            goto LABEL_47;
          }
          pseDelta = v5->_pseDelta;
          v5->_pseDelta = v31;

          PBReaderRecallMark();
          continue;
        case 5u:
          uint64_t v41 = 0;
          uint64_t v42 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_47;
          }
          id v33 = [[BMPostSiriEngagementEventSignalContent alloc] initByReadFrom:v4];
          if (!v33) {
            goto LABEL_47;
          }
          v34 = v33;
          [v6 addObject:v33];
          PBReaderRecallMark();

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_47:

          goto LABEL_44;
      }
      while (1)
      {
        uint64_t v27 = *v7;
        uint64_t v28 = *(void *)&v4[v27];
        unint64_t v29 = v28 + 1;
        if (v28 == -1 || v29 > *(void *)&v4[*v8]) {
          break;
        }
        char v30 = *(unsigned char *)(*(void *)&v4[*v10] + v28);
        *(void *)&v4[v27] = v29;
        v26 |= (unint64_t)(v30 & 0x7F) << v24;
        if ((v30 & 0x80) == 0) {
          goto LABEL_39;
        }
        v24 += 7;
        BOOL v18 = v25++ >= 9;
        if (v18)
        {
          uint64_t v26 = 0;
          goto LABEL_41;
        }
      }
      v4[*v9] = 1;
LABEL_39:
      if (v4[*v9]) {
        uint64_t v26 = 0;
      }
LABEL_41:
      v5->_isPostSiriEngagement = v26 != 0;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v35 = [v6 copy];
  pseContents = v5->_pseContents;
  v5->_pseContents = (NSArray *)v35;

  int v37 = v4[*v9];
  if (v37) {
LABEL_44:
  }
    v38 = 0;
  else {
LABEL_45:
  }
    v38 = v5;

  return v38;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  if (self->_action) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasIsPostSiriEngagement) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_pseDelta)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMPostSiriEngagementEventSignalDeltaEvent *)self->_pseDelta writeTo:v4];
    PBDataWriterRecallMark();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_pseContents;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        uint64_t v15 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4, (void)v11);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v4 = [[BMPostSiriEngagementEventSignal alloc] initByReadFrom:v7];
  }

  return v4;
}

- (id)serialize
{
  id v3 = objc_opt_new();
  [(BMPostSiriEngagementEventSignal *)self writeTo:v3];
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
    id v6 = [(BMPostSiriEngagementEventSignal *)self domain];
    uint64_t v7 = [v5 domain];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      uint64_t v8 = [(BMPostSiriEngagementEventSignal *)self domain];
      uint64_t v9 = [v5 domain];
      char v10 = [v8 isEqual:v9];
    }
    long long v12 = [(BMPostSiriEngagementEventSignal *)self action];
    long long v13 = [v5 action];
    if (v12 == v13)
    {
      char v16 = 1;
    }
    else
    {
      long long v14 = [(BMPostSiriEngagementEventSignal *)self action];
      uint64_t v15 = [v5 action];
      char v16 = [v14 isEqual:v15];
    }
    char v31 = v16;
    if ([(BMPostSiriEngagementEventSignal *)self hasIsPostSiriEngagement]
      || [v5 hasIsPostSiriEngagement])
    {
      char v17 = v10;
      if ([(BMPostSiriEngagementEventSignal *)self hasIsPostSiriEngagement]
        && [v5 hasIsPostSiriEngagement])
      {
        BOOL v18 = [(BMPostSiriEngagementEventSignal *)self isPostSiriEngagement];
        int v19 = v18 ^ [v5 isPostSiriEngagement] ^ 1;
      }
      else
      {
        LOBYTE(v19) = 0;
      }
    }
    else
    {
      char v17 = v10;
      LOBYTE(v19) = 1;
    }
    objc_super v20 = [(BMPostSiriEngagementEventSignal *)self pseDelta];
    uint64_t v21 = [v5 pseDelta];
    if (v20 == v21)
    {
      char v24 = 1;
    }
    else
    {
      uint64_t v22 = [(BMPostSiriEngagementEventSignal *)self pseDelta];
      v23 = [v5 pseDelta];
      char v24 = [v22 isEqual:v23];
    }
    unsigned int v25 = [(BMPostSiriEngagementEventSignal *)self pseContents];
    uint64_t v26 = [v5 pseContents];
    if (v25 == v26)
    {
      char v29 = 1;
    }
    else
    {
      uint64_t v27 = [(BMPostSiriEngagementEventSignal *)self pseContents];
      uint64_t v28 = [v5 pseContents];
      char v29 = [v27 isEqual:v28];
    }
    char v11 = v17 & v31 & v19 & v24 & v29;
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)action
{
  return self->_action;
}

- (BOOL)hasIsPostSiriEngagement
{
  return self->_hasIsPostSiriEngagement;
}

- (void)setHasIsPostSiriEngagement:(BOOL)a3
{
  self->_hasIsPostSiriEngagement = a3;
}

- (BOOL)isPostSiriEngagement
{
  return self->_isPostSiriEngagement;
}

- (BMPostSiriEngagementEventSignalDeltaEvent)pseDelta
{
  return self->_pseDelta;
}

- (NSArray)pseContents
{
  return self->_pseContents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pseContents, 0);
  objc_storeStrong((id *)&self->_pseDelta, 0);
  objc_storeStrong((id *)&self->_action, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end
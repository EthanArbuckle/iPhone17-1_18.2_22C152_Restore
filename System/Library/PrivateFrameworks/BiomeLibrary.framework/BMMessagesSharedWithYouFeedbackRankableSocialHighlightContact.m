@interface BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact)initWithIsSignificant:(id)a3 handle:(id)a4 isMe:(id)a5;
- (BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasIsMe;
- (BOOL)hasIsSignificant;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMe;
- (BOOL)isSignificant;
- (NSString)description;
- (NSString)handle;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasIsMe:(BOOL)a3;
- (void)setHasIsSignificant:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact

- (void).cxx_destruct
{
}

- (void)setHasIsMe:(BOOL)a3
{
  self->_hasIsMe = a3;
}

- (BOOL)hasIsMe
{
  return self->_hasIsMe;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHasIsSignificant:(BOOL)a3
{
  self->_hasIsSignificant = a3;
}

- (BOOL)hasIsSignificant
{
  return self->_hasIsSignificant;
}

- (BOOL)isSignificant
{
  return self->_isSignificant;
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
    if ([(BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *)self hasIsSignificant]
      || [v5 hasIsSignificant])
    {
      if (![(BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *)self hasIsSignificant]) {
        goto LABEL_17;
      }
      if (![v5 hasIsSignificant]) {
        goto LABEL_17;
      }
      int v6 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *)self isSignificant];
      if (v6 != [v5 isSignificant]) {
        goto LABEL_17;
      }
    }
    v7 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *)self handle];
    uint64_t v8 = [v5 handle];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *)self handle];
      v11 = [v5 handle];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_17;
      }
    }
    if (![(BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *)self hasIsMe]
      && ![v5 hasIsMe])
    {
      LOBYTE(v13) = 1;
      goto LABEL_18;
    }
    if ([(BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *)self hasIsMe]
      && [v5 hasIsMe])
    {
      BOOL v14 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *)self isMe];
      int v13 = v14 ^ [v5 isMe] ^ 1;
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:
    LOBYTE(v13) = 0;
    goto LABEL_18;
  }
  LOBYTE(v13) = 0;
LABEL_19:

  return v13;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  if ([(BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *)self hasIsSignificant])
  {
    v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact isSignificant](self, "isSignificant"));
  }
  else
  {
    v3 = 0;
  }
  id v4 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *)self handle];
  if ([(BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *)self hasIsMe])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact isMe](self, "isMe"));
  }
  else
  {
    id v5 = 0;
  }
  v11[0] = @"isSignificant";
  int v6 = v3;
  if (!v3)
  {
    int v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"handle";
  v7 = v4;
  if (!v4)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"isMe";
  uint64_t v8 = v5;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (v5)
  {
    if (v4) {
      goto LABEL_15;
    }
LABEL_20:

    if (v3) {
      goto LABEL_16;
    }
    goto LABEL_21;
  }

  if (!v4) {
    goto LABEL_20;
  }
LABEL_15:
  if (v3) {
    goto LABEL_16;
  }
LABEL_21:

LABEL_16:

  return v9;
}

- (BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"isSignificant"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"handle"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          int v13 = 0;
          goto LABEL_12;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v18 = *MEMORY[0x1E4F502C8];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"handle"];
        id v28 = v12;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v19 = (id)[v23 initWithDomain:v18 code:2 userInfo:v11];
        int v13 = 0;
        id v10 = 0;
        *a4 = v19;
        goto LABEL_11;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    v11 = [v6 objectForKeyedSubscript:@"isMe"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v22 = *MEMORY[0x1E4F502C8];
          uint64_t v25 = *MEMORY[0x1E4F28568];
          v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isMe"];
          v26 = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          *a4 = (id)[v24 initWithDomain:v22 code:2 userInfo:v21];
        }
        id v12 = 0;
        int v13 = 0;
        goto LABEL_11;
      }
      id v12 = v11;
    }
    else
    {
      id v12 = 0;
    }
    self = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *)self initWithIsSignificant:v8 handle:v10 isMe:v12];
    int v13 = self;
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    int v13 = 0;
    id v8 = 0;
    goto LABEL_13;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isSignificant"];
  v30[0] = v10;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  id v17 = (id)[v15 initWithDomain:v16 code:2 userInfo:v9];
  int v13 = 0;
  id v8 = 0;
  *a4 = v17;
LABEL_12:

LABEL_13:
  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasIsSignificant)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_handle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasIsMe)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact;
  id v5 = [(BMEventBase *)&v41 init];
  if (!v5) {
    goto LABEL_51;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v9 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (v4[*v8]) {
        goto LABEL_49;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        goto LABEL_49;
      }
      unint64_t v20 = v12 >> 3;
      if ((v12 >> 3) == 3) {
        break;
      }
      if (v20 != 2)
      {
        if (v20 != 1)
        {
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_50;
          }
          goto LABEL_48;
        }
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        v5->_hasIsSignificant = 1;
        while (1)
        {
          uint64_t v24 = *v6;
          uint64_t v25 = *(void *)&v4[v24];
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)&v4[*v7]) {
            break;
          }
          char v27 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
          *(void *)&v4[v24] = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0) {
            goto LABEL_40;
          }
          v21 += 7;
          BOOL v17 = v22++ >= 9;
          if (v17)
          {
            uint64_t v23 = 0;
            goto LABEL_42;
          }
        }
        v4[*v8] = 1;
LABEL_40:
        if (v4[*v8]) {
          uint64_t v23 = 0;
        }
LABEL_42:
        BOOL v37 = v23 != 0;
        uint64_t v38 = 16;
        goto LABEL_47;
      }
      uint64_t v35 = PBReaderReadString();
      handle = v5->_handle;
      v5->_handle = (NSString *)v35;

LABEL_48:
      if (*(void *)&v4[*v6] >= *(void *)&v4[*v7]) {
        goto LABEL_49;
      }
    }
    char v28 = 0;
    unsigned int v29 = 0;
    uint64_t v30 = 0;
    v5->_hasIsMe = 1;
    while (1)
    {
      uint64_t v31 = *v6;
      uint64_t v32 = *(void *)&v4[v31];
      unint64_t v33 = v32 + 1;
      if (v32 == -1 || v33 > *(void *)&v4[*v7]) {
        break;
      }
      char v34 = *(unsigned char *)(*(void *)&v4[*v9] + v32);
      *(void *)&v4[v31] = v33;
      v30 |= (unint64_t)(v34 & 0x7F) << v28;
      if ((v34 & 0x80) == 0) {
        goto LABEL_44;
      }
      v28 += 7;
      BOOL v17 = v29++ >= 9;
      if (v17)
      {
        uint64_t v30 = 0;
        goto LABEL_46;
      }
    }
    v4[*v8] = 1;
LABEL_44:
    if (v4[*v8]) {
      uint64_t v30 = 0;
    }
LABEL_46:
    BOOL v37 = v30 != 0;
    uint64_t v38 = 18;
LABEL_47:
    *((unsigned char *)&v5->super.super.isa + v38) = v37;
    goto LABEL_48;
  }
LABEL_49:
  if (v4[*v8]) {
LABEL_50:
  }
    v39 = 0;
  else {
LABEL_51:
  }
    v39 = v5;

  return v39;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact isSignificant](self, "isSignificant"));
  id v5 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *)self handle];
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact isMe](self, "isMe"));
  v7 = (void *)[v3 initWithFormat:@"BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact with isSignificant: %@, handle: %@, isMe: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact)initWithIsSignificant:(id)a3 handle:(id)a4 isMe:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact;
  unsigned int v11 = [(BMEventBase *)&v13 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v8)
    {
      v11->_hasIsSignificant = 1;
      v11->_isSignificant = [v8 BOOLValue];
    }
    else
    {
      v11->_hasIsSignificant = 0;
      v11->_isSignificant = 0;
    }
    objc_storeStrong((id *)&v11->_handle, a4);
    if (v10)
    {
      v11->_hasIsMe = 1;
      v11->_isMe = [v10 BOOLValue];
    }
    else
    {
      v11->_hasIsMe = 0;
      v11->_isMe = 0;
    }
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isSignificant" number:1 type:12 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"handle", 2, 13, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isMe" number:3 type:12 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF70F8;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isSignificant" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"handle" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isMe" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 4)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    id v6 = (void *)[[v4 alloc] initWithData:v5];

    v7 = [[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact alloc] initByReadFrom:v6];
    id v8 = v7;
    if (v7) {
      v7[5] = 4;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 4;
}

@end
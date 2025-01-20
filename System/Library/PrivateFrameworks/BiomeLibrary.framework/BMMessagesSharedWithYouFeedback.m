@interface BMMessagesSharedWithYouFeedback
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMessagesSharedWithYouFeedback)initWithClientIdentifier:(id)a3 feedbackType:(int)a4 feedbackCreationSecondsSinceReferenceDate:(id)a5 highlight:(id)a6 clientVariant:(id)a7;
- (BMMessagesSharedWithYouFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMessagesSharedWithYouFeedbackRankableSocialHighlight)highlight;
- (BOOL)hasFeedbackCreationSecondsSinceReferenceDate;
- (BOOL)isEqual:(id)a3;
- (NSString)clientIdentifier;
- (NSString)clientVariant;
- (NSString)description;
- (double)feedbackCreationSecondsSinceReferenceDate;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)feedbackType;
- (unsigned)dataVersion;
- (void)setHasFeedbackCreationSecondsSinceReferenceDate:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMessagesSharedWithYouFeedback

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientIdentifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"feedbackType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"feedbackCreationSecondsSinceReferenceDate" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"highlight_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_476];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientVariant" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientVariant, 0);
  objc_storeStrong((id *)&self->_highlight, 0);

  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (NSString)clientVariant
{
  return self->_clientVariant;
}

- (BMMessagesSharedWithYouFeedbackRankableSocialHighlight)highlight
{
  return self->_highlight;
}

- (void)setHasFeedbackCreationSecondsSinceReferenceDate:(BOOL)a3
{
  self->_hasFeedbackCreationSecondsSinceReferenceDate = a3;
}

- (BOOL)hasFeedbackCreationSecondsSinceReferenceDate
{
  return self->_hasFeedbackCreationSecondsSinceReferenceDate;
}

- (double)feedbackCreationSecondsSinceReferenceDate
{
  return self->_feedbackCreationSecondsSinceReferenceDate;
}

- (int)feedbackType
{
  return self->_feedbackType;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
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
    v6 = [(BMMessagesSharedWithYouFeedback *)self clientIdentifier];
    uint64_t v7 = [v5 clientIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMessagesSharedWithYouFeedback *)self clientIdentifier];
      v10 = [v5 clientIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_15;
      }
    }
    int v13 = [(BMMessagesSharedWithYouFeedback *)self feedbackType];
    if (v13 != [v5 feedbackType]) {
      goto LABEL_15;
    }
    if (-[BMMessagesSharedWithYouFeedback hasFeedbackCreationSecondsSinceReferenceDate](self, "hasFeedbackCreationSecondsSinceReferenceDate")|| [v5 hasFeedbackCreationSecondsSinceReferenceDate])
    {
      if (![(BMMessagesSharedWithYouFeedback *)self hasFeedbackCreationSecondsSinceReferenceDate])goto LABEL_15; {
      if (![v5 hasFeedbackCreationSecondsSinceReferenceDate])
      }
        goto LABEL_15;
      [(BMMessagesSharedWithYouFeedback *)self feedbackCreationSecondsSinceReferenceDate];
      double v15 = v14;
      [v5 feedbackCreationSecondsSinceReferenceDate];
      if (v15 != v16) {
        goto LABEL_15;
      }
    }
    v17 = [(BMMessagesSharedWithYouFeedback *)self highlight];
    uint64_t v18 = [v5 highlight];
    if (v17 == (void *)v18)
    {
    }
    else
    {
      v19 = (void *)v18;
      v20 = [(BMMessagesSharedWithYouFeedback *)self highlight];
      v21 = [v5 highlight];
      int v22 = [v20 isEqual:v21];

      if (!v22)
      {
LABEL_15:
        char v12 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    v24 = [(BMMessagesSharedWithYouFeedback *)self clientVariant];
    v25 = [v5 clientVariant];
    if (v24 == v25)
    {
      char v12 = 1;
    }
    else
    {
      v26 = [(BMMessagesSharedWithYouFeedback *)self clientVariant];
      v27 = [v5 clientVariant];
      char v12 = [v26 isEqual:v27];
    }
    goto LABEL_16;
  }
  char v12 = 0;
LABEL_17:

  return v12;
}

- (id)jsonDictionary
{
  v25[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMessagesSharedWithYouFeedback *)self clientIdentifier];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMessagesSharedWithYouFeedback feedbackType](self, "feedbackType"));
  if (![(BMMessagesSharedWithYouFeedback *)self hasFeedbackCreationSecondsSinceReferenceDate]|| ([(BMMessagesSharedWithYouFeedback *)self feedbackCreationSecondsSinceReferenceDate], fabs(v5) == INFINITY))
  {
    uint64_t v7 = 0;
  }
  else
  {
    [(BMMessagesSharedWithYouFeedback *)self feedbackCreationSecondsSinceReferenceDate];
    v6 = NSNumber;
    [(BMMessagesSharedWithYouFeedback *)self feedbackCreationSecondsSinceReferenceDate];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  }
  v8 = [(BMMessagesSharedWithYouFeedback *)self highlight];
  v9 = [v8 jsonDictionary];

  v10 = [(BMMessagesSharedWithYouFeedback *)self clientVariant];
  v20 = @"clientIdentifier";
  uint64_t v11 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v18 = v11;
  v25[0] = v11;
  v21 = @"feedbackType";
  char v12 = v4;
  if (!v4)
  {
    char v12 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v11, v20, v21);
  }
  v25[1] = v12;
  int v22 = @"feedbackCreationSecondsSinceReferenceDate";
  int v13 = v7;
  if (!v7)
  {
    int v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[2] = v13;
  v23 = @"highlight";
  double v14 = v9;
  if (!v9)
  {
    double v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[3] = v14;
  v24 = @"clientVariant";
  double v15 = v10;
  if (!v10)
  {
    double v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v15;
  double v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, &v20, 5, v18);
  if (v10)
  {
    if (v9) {
      goto LABEL_17;
    }
  }
  else
  {

    if (v9)
    {
LABEL_17:
      if (v7) {
        goto LABEL_18;
      }
      goto LABEL_25;
    }
  }

  if (v7)
  {
LABEL_18:
    if (v4) {
      goto LABEL_19;
    }
LABEL_26:

    if (v3) {
      goto LABEL_20;
    }
    goto LABEL_27;
  }
LABEL_25:

  if (!v4) {
    goto LABEL_26;
  }
LABEL_19:
  if (v3) {
    goto LABEL_20;
  }
LABEL_27:

LABEL_20:

  return v16;
}

- (BMMessagesSharedWithYouFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"clientIdentifier"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"feedbackType"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            double v16 = 0;
            goto LABEL_44;
          }
          id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
          v40 = a4;
          uint64_t v35 = *MEMORY[0x1E4F502C8];
          uint64_t v52 = *MEMORY[0x1E4F28568];
          id v43 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"feedbackType"];
          id v53 = v43;
          v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
          id v36 = (id)[v34 initWithDomain:v35 code:2 userInfo:v17];
          a4 = 0;
          double v16 = 0;
          id *v40 = v36;
          goto LABEL_43;
        }
        v10 = [NSNumber numberWithInt:BMMessagesSharedWithYouFeedbackUnifiedFeedbackTypeFromString(v9)];
      }
      v41 = v10;
    }
    else
    {
      v41 = 0;
    }
    v17 = [v6 objectForKeyedSubscript:@"feedbackCreationSecondsSinceReferenceDate"];
    id v42 = v8;
    v44 = self;
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v43 = 0;
          double v16 = 0;
          a4 = v41;
          goto LABEL_43;
        }
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v50 = *MEMORY[0x1E4F28568];
        uint64_t v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"feedbackCreationSecondsSinceReferenceDate"];
        v51 = v18;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        id v27 = (id)[v25 initWithDomain:v26 code:2 userInfo:v19];
        double v16 = 0;
        id v43 = 0;
        v28 = a4;
        a4 = v41;
        id *v28 = v27;
        goto LABEL_41;
      }
      id v43 = v17;
    }
    else
    {
      id v43 = 0;
    }
    uint64_t v18 = [v6 objectForKeyedSubscript:@"highlight"];
    if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v19 = 0;
LABEL_22:
      v20 = [v6 objectForKeyedSubscript:@"clientVariant"];
      if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v38 = *MEMORY[0x1E4F502C8];
            uint64_t v46 = *MEMORY[0x1E4F28568];
            v32 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientVariant"];
            v47 = v32;
            v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
            *a4 = (id)[v39 initWithDomain:v38 code:2 userInfo:v33];
          }
          double v16 = 0;
          id v21 = 0;
          a4 = v41;
          goto LABEL_26;
        }
        id v21 = v20;
      }
      else
      {
        id v21 = 0;
      }
      a4 = v41;
      double v16 = -[BMMessagesSharedWithYouFeedback initWithClientIdentifier:feedbackType:feedbackCreationSecondsSinceReferenceDate:highlight:clientVariant:](v44, "initWithClientIdentifier:feedbackType:feedbackCreationSecondsSinceReferenceDate:highlight:clientVariant:", v42, [v41 intValue], v43, v19, v21);
      v44 = v16;
LABEL_26:

LABEL_41:
LABEL_42:

      self = v44;
      id v8 = v42;
LABEL_43:

      goto LABEL_44;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v22 = v18;
      id v45 = 0;
      v19 = [[BMMessagesSharedWithYouFeedbackRankableSocialHighlight alloc] initWithJSONDictionary:v22 error:&v45];
      id v23 = v45;
      if (!v23)
      {

        goto LABEL_22;
      }
      v24 = v23;
      if (a4) {
        *a4 = v23;
      }

      double v16 = 0;
      uint64_t v18 = v22;
    }
    else
    {
      if (!a4)
      {
        double v16 = 0;
        a4 = v41;
        goto LABEL_42;
      }
      id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v29 = *MEMORY[0x1E4F502C8];
      uint64_t v48 = *MEMORY[0x1E4F28568];
      v19 = (BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"highlight"];
      v49 = v19;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      *a4 = (id)[v37 initWithDomain:v29 code:2 userInfo:v30];

      double v16 = 0;
    }
    a4 = v41;
    goto LABEL_41;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v8 = 0;
    double v16 = 0;
    goto LABEL_45;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
  char v12 = a4;
  uint64_t v13 = *MEMORY[0x1E4F502C8];
  uint64_t v54 = *MEMORY[0x1E4F28568];
  double v14 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientIdentifier"];
  v55[0] = v14;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
  uint64_t v15 = v13;
  a4 = v14;
  id v8 = 0;
  double v16 = 0;
  *char v12 = (id)[v11 initWithDomain:v15 code:2 userInfo:v9];
LABEL_44:

LABEL_45:
  return v16;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMessagesSharedWithYouFeedback *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_clientIdentifier) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasFeedbackCreationSecondsSinceReferenceDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_highlight)
  {
    PBDataWriterPlaceMark();
    [(BMMessagesSharedWithYouFeedbackRankableSocialHighlight *)self->_highlight writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_clientVariant) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BMMessagesSharedWithYouFeedback;
  double v5 = [(BMEventBase *)&v37 init];
  if (!v5) {
    goto LABEL_49;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
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
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 32;
          goto LABEL_37;
        case 2u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          break;
        case 3u:
          v5->_hasFeedbackCreationSecondsSinceReferenceDate = 1;
          uint64_t v29 = *v6;
          unint64_t v30 = *(void *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(double *)(*(void *)&v4[*v9] + v30);
            *(void *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0.0;
          }
          v5->_feedbackCreationSecondsSinceReferenceDate = v31;
          continue;
        case 4u:
          uint64_t v38 = 0;
          uint64_t v39 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_48;
          }
          v32 = [[BMMessagesSharedWithYouFeedbackRankableSocialHighlight alloc] initByReadFrom:v4];
          if (!v32) {
            goto LABEL_48;
          }
          highlight = v5->_highlight;
          v5->_highlight = v32;

          PBReaderRecallMark();
          continue;
        case 5u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 56;
LABEL_37:
          id v34 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_48;
          }
          continue;
      }
      while (1)
      {
        uint64_t v25 = *v6;
        uint64_t v26 = *(void *)&v4[v25];
        unint64_t v27 = v26 + 1;
        if (v26 == -1 || v27 > *(void *)&v4[*v7]) {
          break;
        }
        char v28 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
        *(void *)&v4[v25] = v27;
        v24 |= (unint64_t)(v28 & 0x7F) << v22;
        if ((v28 & 0x80) == 0) {
          goto LABEL_39;
        }
        v22 += 7;
        BOOL v17 = v23++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_41;
        }
      }
      v4[*v8] = 1;
LABEL_39:
      if (v4[*v8]) {
        LODWORD(v24) = 0;
      }
LABEL_41:
      if (v24 >= 0xC) {
        LODWORD(v24) = 0;
      }
      v5->_feedbackType = v24;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_48:
  }
    uint64_t v35 = 0;
  else {
LABEL_49:
  }
    uint64_t v35 = v5;

  return v35;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMessagesSharedWithYouFeedback *)self clientIdentifier];
  double v5 = BMMessagesSharedWithYouFeedbackUnifiedFeedbackTypeAsString([(BMMessagesSharedWithYouFeedback *)self feedbackType]);
  id v6 = NSNumber;
  [(BMMessagesSharedWithYouFeedback *)self feedbackCreationSecondsSinceReferenceDate];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  id v8 = [(BMMessagesSharedWithYouFeedback *)self highlight];
  v9 = [(BMMessagesSharedWithYouFeedback *)self clientVariant];
  char v10 = (void *)[v3 initWithFormat:@"BMMessagesSharedWithYouFeedback with clientIdentifier: %@, feedbackType: %@, feedbackCreationSecondsSinceReferenceDate: %@, highlight: %@, clientVariant: %@", v4, v5, v7, v8, v9];

  return (NSString *)v10;
}

- (BMMessagesSharedWithYouFeedback)initWithClientIdentifier:(id)a3 feedbackType:(int)a4 feedbackCreationSecondsSinceReferenceDate:(id)a5 highlight:(id)a6 clientVariant:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMMessagesSharedWithYouFeedback;
  BOOL v17 = [(BMEventBase *)&v20 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v17->_clientIdentifier, a3);
    v17->_feedbackType = a4;
    if (v14)
    {
      v17->_hasFeedbackCreationSecondsSinceReferenceDate = 1;
      [v14 doubleValue];
    }
    else
    {
      v17->_hasFeedbackCreationSecondsSinceReferenceDate = 0;
      double v18 = -1.0;
    }
    v17->_feedbackCreationSecondsSinceReferenceDate = v18;
    objc_storeStrong((id *)&v17->_highlight, a6);
    objc_storeStrong((id *)&v17->_clientVariant, a7);
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientIdentifier" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"feedbackType", 2, 4, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"feedbackCreationSecondsSinceReferenceDate" number:3 type:0 subMessageClass:0];
  v9[2] = v4;
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"highlight" number:4 type:14 subMessageClass:objc_opt_class()];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientVariant" number:5 type:13 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7140;
}

id __42__BMMessagesSharedWithYouFeedback_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 highlight];
  id v4 = [v3 jsonDictionary];
  double v5 = BMConvertObjectToJSONString();

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  if (a4 == 3)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMMessagesSharedWithYouFeedback_v3;
  }
  else
  {
    if (a4 != 4)
    {
      v9 = 0;
      goto LABEL_9;
    }
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMMessagesSharedWithYouFeedback;
  }
  uint64_t v8 = [[v7 alloc] initByReadFrom:v6];
  v9 = (void *)v8;
  if (v8) {
    *(_DWORD *)(v8 + 20) = a4;
  }

LABEL_9:

  return v9;
}

+ (unsigned)latestDataVersion
{
  return 4;
}

@end
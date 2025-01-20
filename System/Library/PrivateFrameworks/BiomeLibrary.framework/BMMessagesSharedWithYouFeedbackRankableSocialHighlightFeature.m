@interface BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature)initWithName:(id)a3 value:(id)a4;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)name;
- (double)value;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasValue:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature

- (void).cxx_destruct
{
}

- (void)setHasValue:(BOOL)a3
{
  self->_hasValue = a3;
}

- (BOOL)hasValue
{
  return self->_hasValue;
}

- (double)value
{
  return self->_value;
}

- (NSString)name
{
  return self->_name;
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
    v6 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature *)self name];
    uint64_t v7 = [v5 name];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature *)self name];
      v10 = [v5 name];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_12;
      }
    }
    if (![(BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature *)self hasValue]
      && ![v5 hasValue])
    {
      BOOL v12 = 1;
      goto LABEL_13;
    }
    if ([(BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature *)self hasValue]
      && [v5 hasValue])
    {
      [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature *)self value];
      double v14 = v13;
      [v5 value];
      BOOL v12 = v14 == v15;
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    BOOL v12 = 0;
    goto LABEL_13;
  }
  BOOL v12 = 0;
LABEL_14:

  return v12;
}

- (id)jsonDictionary
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature *)self name];
  if (![(BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature *)self hasValue]
    || ([(BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature *)self value], fabs(v4) == INFINITY))
  {
    v6 = 0;
  }
  else
  {
    [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature *)self value];
    id v5 = NSNumber;
    [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature *)self value];
    v6 = objc_msgSend(v5, "numberWithDouble:");
  }
  v11[0] = @"name";
  uint64_t v7 = v3;
  if (!v3)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = @"value";
  v12[0] = v7;
  v8 = v6;
  if (!v6)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  if (v6)
  {
    if (v3) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v3) {
      goto LABEL_11;
    }
  }

LABEL_11:

  return v9;
}

- (BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"name"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        int v11 = 0;
        id v8 = 0;
        goto LABEL_9;
      }
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v14 = *MEMORY[0x1E4F502C8];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"name"];
      v23[0] = v10;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v15 = (id)[v13 initWithDomain:v14 code:2 userInfo:v9];
      int v11 = 0;
      id v8 = 0;
      *a4 = v15;
      goto LABEL_8;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"value"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v17 = *MEMORY[0x1E4F502C8];
        uint64_t v20 = *MEMORY[0x1E4F28568];
        v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"value"];
        v21 = v18;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        *a4 = (id)[v16 initWithDomain:v17 code:2 userInfo:v19];
      }
      id v10 = 0;
      int v11 = 0;
      goto LABEL_8;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }
  self = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature *)self initWithName:v8 value:v10];
  int v11 = self;
LABEL_8:

LABEL_9:
  return v11;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature *)self writeTo:v3];
  double v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasValue)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature;
  id v5 = [(BMEventBase *)&v27 init];
  if (!v5) {
    goto LABEL_32;
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
        if (v11++ >= 9)
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
      if ((v12 >> 3) == 2)
      {
        v5->_hasValue = 1;
        uint64_t v22 = *v6;
        unint64_t v23 = *(void *)&v4[v22];
        if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)&v4[*v7])
        {
          double v24 = *(double *)(*(void *)&v4[*v9] + v23);
          *(void *)&v4[v22] = v23 + 8;
        }
        else
        {
          v4[*v8] = 1;
          double v24 = 0.0;
        }
        v5->_value = v24;
      }
      else if ((v12 >> 3) == 1)
      {
        uint64_t v20 = PBReaderReadString();
        name = v5->_name;
        v5->_name = (NSString *)v20;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_31;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_31:
  }
    v25 = 0;
  else {
LABEL_32:
  }
    v25 = v5;

  return v25;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature *)self name];
  id v5 = NSNumber;
  [(BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature *)self value];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature with name: %@, value: %@", v4, v6];

  return (NSString *)v7;
}

- (BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature)initWithName:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature;
  v9 = [(BMEventBase *)&v12 init];
  if (v9)
  {
    v9->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v9->_name, a3);
    if (v8)
    {
      v9->_hasValue = 1;
      [v8 doubleValue];
    }
    else
    {
      v9->_hasValue = 0;
      double v10 = -1.0;
    }
    v9->_value = v10;
  }

  return v9;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"name" number:1 type:13 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"value" number:2 type:0 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7110;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"name" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"value" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 4)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    id v6 = (void *)[[v4 alloc] initWithData:v5];

    id v7 = [[BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature alloc] initByReadFrom:v6];
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
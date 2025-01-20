@interface BMFeedbackEvaluationResponse
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMFeedbackEvaluationResponse)initWithEvaluationUuid:(id)a3 userResponse:(int)a4;
- (BMFeedbackEvaluationResponse)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSUUID)evaluationUuid;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)userResponse;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMFeedbackEvaluationResponse

- (void).cxx_destruct
{
}

- (int)userResponse
{
  return self->_userResponse;
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
    v6 = [(BMFeedbackEvaluationResponse *)self evaluationUuid];
    uint64_t v7 = [v5 evaluationUuid];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMFeedbackEvaluationResponse *)self evaluationUuid];
      v10 = [v5 evaluationUuid];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        BOOL v12 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    int v13 = [(BMFeedbackEvaluationResponse *)self userResponse];
    BOOL v12 = v13 == [v5 userResponse];
    goto LABEL_8;
  }
  BOOL v12 = 0;
LABEL_9:

  return v12;
}

- (NSUUID)evaluationUuid
{
  raw_evaluationUuid = self->_raw_evaluationUuid;
  if (raw_evaluationUuid)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_evaluationUuid toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (id)jsonDictionary
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMFeedbackEvaluationResponse *)self evaluationUuid];
  id v4 = [v3 UUIDString];

  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMFeedbackEvaluationResponse userResponse](self, "userResponse"));
  v10[0] = @"evaluationUuid";
  v6 = v4;
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"userResponse";
  v11[0] = v6;
  uint64_t v7 = v5;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (v5)
  {
    if (v4) {
      goto LABEL_7;
    }
  }
  else
  {

    if (v4) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v8;
}

- (BMFeedbackEvaluationResponse)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"evaluationUuid"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"userResponse"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v20 = *MEMORY[0x1E4F502C8];
            uint64_t v26 = *MEMORY[0x1E4F28568];
            v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"userResponse"];
            v27 = v21;
            v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
            *a4 = (id)[v19 initWithDomain:v20 code:2 userInfo:v22];
          }
          v10 = 0;
          v17 = 0;
          goto LABEL_18;
        }
        id v13 = [NSNumber numberWithInt:BMFeedbackEvaluationResponseUserResponseFromString(v9)];
      }
      v10 = v13;
    }
    else
    {
      v10 = 0;
    }
    self = -[BMFeedbackEvaluationResponse initWithEvaluationUuid:userResponse:](self, "initWithEvaluationUuid:userResponse:", v8, [v10 intValue]);
    v17 = self;
LABEL_18:

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      v17 = 0;
      goto LABEL_21;
    }
    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F502C8];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    id v8 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"evaluationUuid"];
    id v29 = v8;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v16 = (id)[v14 initWithDomain:v15 code:2 userInfo:v10];
    v17 = 0;
    *a4 = v16;
    goto LABEL_19;
  }
  id v8 = v7;
  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
  if (v11)
  {
    BOOL v12 = (void *)v11;

    id v8 = v12;
    goto LABEL_4;
  }
  if (!a4)
  {
    v17 = 0;
    goto LABEL_20;
  }
  id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v24 = *MEMORY[0x1E4F502C8];
  uint64_t v30 = *MEMORY[0x1E4F28568];
  v10 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"evaluationUuid"];
  v31[0] = v10;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
  *a4 = (id)[v23 initWithDomain:v24 code:2 userInfo:v25];

  v17 = 0;
LABEL_19:

LABEL_20:
LABEL_21:

  return v17;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMFeedbackEvaluationResponse *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_raw_evaluationUuid) {
    PBDataWriterWriteDataField();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BMFeedbackEvaluationResponse;
  id v5 = [(BMEventBase *)&v29 init];
  if (!v5) {
    goto LABEL_41;
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
        unint64_t v14 = *(void *)&v4[v13];
        if (v14 == -1 || v14 >= *(void *)&v4[*v7]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v16 = v11++ >= 9;
        if (v16)
        {
          unint64_t v12 = 0;
          int v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v17 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v17 || (v12 & 7) == 4) {
        break;
      }
      if ((v12 >> 3) == 1)
      {
        PBReaderReadData();
        v25 = (NSData *)objc_claimAutoreleasedReturnValue();
        if ([(NSData *)v25 length] != 16)
        {

          goto LABEL_40;
        }
        raw_evaluationUuid = v5->_raw_evaluationUuid;
        v5->_raw_evaluationUuid = v25;
      }
      else if ((v12 >> 3) == 2)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        while (1)
        {
          uint64_t v22 = *v6;
          unint64_t v23 = *(void *)&v4[v22];
          if (v23 == -1 || v23 >= *(void *)&v4[*v7]) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)&v4[*v9] + v23);
          *(void *)&v4[v22] = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            goto LABEL_33;
          }
          v19 += 7;
          BOOL v16 = v20++ >= 9;
          if (v16)
          {
            LODWORD(v21) = 0;
            goto LABEL_35;
          }
        }
        v4[*v8] = 1;
LABEL_33:
        if (v4[*v8]) {
          LODWORD(v21) = 0;
        }
LABEL_35:
        if (v21 >= 8) {
          LODWORD(v21) = 0;
        }
        v5->_userResponse = v21;
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        goto LABEL_40;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_40:
  }
    v27 = 0;
  else {
LABEL_41:
  }
    v27 = v5;

  return v27;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMFeedbackEvaluationResponse *)self evaluationUuid];
  id v5 = BMFeedbackEvaluationResponseUserResponseAsString([(BMFeedbackEvaluationResponse *)self userResponse]);
  id v6 = (void *)[v3 initWithFormat:@"BMFeedbackEvaluationResponse with evaluationUuid: %@, userResponse: %@", v4, v5];

  return (NSString *)v6;
}

- (BMFeedbackEvaluationResponse)initWithEvaluationUuid:(id)a3 userResponse:(int)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BMFeedbackEvaluationResponse;
  uint64_t v7 = [(BMEventBase *)&v11 init];
  if (v7)
  {
    v7->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v6)
    {
      v12[0] = 0;
      v12[1] = 0;
      [v6 getUUIDBytes:v12];
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v12 length:16];
      raw_evaluationUuid = v7->_raw_evaluationUuid;
      v7->_raw_evaluationUuid = (NSData *)v8;
    }
    else
    {
      raw_evaluationUuid = v7->_raw_evaluationUuid;
      v7->_raw_evaluationUuid = 0;
    }

    v7->_userResponse = a4;
  }

  return v7;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"evaluationUuid" number:1 type:14 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userResponse" number:2 type:4 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF57A8;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"evaluationUuid" dataType:6 requestOnly:0 fieldNumber:1 protoDataType:14 convertedType:3];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userResponse" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

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

    uint64_t v8 = [[BMFeedbackEvaluationResponse alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[6] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end
@interface BMSpringBoardDominoWidgetTap
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSpringBoardDominoWidget)widget;
- (BMSpringBoardDominoWidgetTap)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSpringBoardDominoWidgetTap)initWithWidget:(id)a3 stackId:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)stackId;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSpringBoardDominoWidgetTap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackId, 0);

  objc_storeStrong((id *)&self->_widget, 0);
}

- (NSString)stackId
{
  return self->_stackId;
}

- (BMSpringBoardDominoWidget)widget
{
  return self->_widget;
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
    v6 = [(BMSpringBoardDominoWidgetTap *)self widget];
    uint64_t v7 = [v5 widget];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSpringBoardDominoWidgetTap *)self widget];
      v10 = [v5 widget];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        char v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v13 = [(BMSpringBoardDominoWidgetTap *)self stackId];
    v14 = [v5 stackId];
    if (v13 == v14)
    {
      char v12 = 1;
    }
    else
    {
      v15 = [(BMSpringBoardDominoWidgetTap *)self stackId];
      v16 = [v5 stackId];
      char v12 = [v15 isEqual:v16];
    }
    goto LABEL_11;
  }
  char v12 = 0;
LABEL_12:

  return v12;
}

- (id)jsonDictionary
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSpringBoardDominoWidgetTap *)self widget];
  id v4 = [v3 jsonDictionary];

  id v5 = [(BMSpringBoardDominoWidgetTap *)self stackId];
  v10[0] = @"widget";
  v6 = v4;
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"stackId";
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

- (BMSpringBoardDominoWidgetTap)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"widget"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    id v22 = 0;
    v8 = [[BMSpringBoardDominoWidget alloc] initWithJSONDictionary:v10 error:&v22];
    id v13 = v22;
    if (v13)
    {
      v14 = v13;
      if (a4) {
        *a4 = v13;
      }

      int v11 = 0;
      goto LABEL_9;
    }

LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"stackId"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v19 = *MEMORY[0x1E4F502C8];
          uint64_t v23 = *MEMORY[0x1E4F28568];
          v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"stackId"];
          v24 = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
          *a4 = (id)[v18 initWithDomain:v19 code:2 userInfo:v21];
        }
        int v11 = 0;
        id v10 = 0;
        goto LABEL_8;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    self = [(BMSpringBoardDominoWidgetTap *)self initWithWidget:v8 stackId:v10];
    int v11 = self;
LABEL_8:

    goto LABEL_9;
  }
  if (!a4)
  {
    int v11 = 0;
    goto LABEL_10;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v25 = *MEMORY[0x1E4F28568];
  v8 = (BMSpringBoardDominoWidget *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"widget"];
  v26[0] = v8;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  id v17 = (id)[v15 initWithDomain:v16 code:2 userInfo:v10];
  int v11 = 0;
  *a4 = v17;
LABEL_9:

LABEL_10:
  return v11;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSpringBoardDominoWidgetTap *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_widget)
  {
    PBDataWriterPlaceMark();
    [(BMSpringBoardDominoWidget *)self->_widget writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_stackId) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMSpringBoardDominoWidgetTap;
  id v5 = [(BMEventBase *)&v25 init];
  if (!v5) {
    goto LABEL_29;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
        if (v11++ >= 9)
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
      if ((v12 >> 3) == 2)
      {
        uint64_t v21 = PBReaderReadString();
        stackId = v5->_stackId;
        v5->_stackId = (NSString *)v21;
      }
      else if ((v12 >> 3) == 1)
      {
        uint64_t v26 = 0;
        uint64_t v27 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_28;
        }
        uint64_t v19 = [[BMSpringBoardDominoWidget alloc] initByReadFrom:v4];
        if (!v19) {
          goto LABEL_28;
        }
        widget = v5->_widget;
        v5->_widget = v19;

        PBReaderRecallMark();
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_28;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_28:
  }
    uint64_t v23 = 0;
  else {
LABEL_29:
  }
    uint64_t v23 = v5;

  return v23;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSpringBoardDominoWidgetTap *)self widget];
  id v5 = [(BMSpringBoardDominoWidgetTap *)self stackId];
  id v6 = (void *)[v3 initWithFormat:@"BMSpringBoardDominoWidgetTap with widget: %@, stackId: %@", v4, v5];

  return (NSString *)v6;
}

- (BMSpringBoardDominoWidgetTap)initWithWidget:(id)a3 stackId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMSpringBoardDominoWidgetTap;
  v9 = [(BMEventBase *)&v11 init];
  if (v9)
  {
    v9->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v9->_widget, a3);
    objc_storeStrong((id *)&v9->_stackId, a4);
  }

  return v9;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"widget" number:1 type:14 subMessageClass:objc_opt_class()];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stackId" number:2 type:13 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF53E8;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"widget_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_44544];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stackId" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

id __39__BMSpringBoardDominoWidgetTap_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 widget];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSpringBoardDominoWidgetTap alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[4] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end
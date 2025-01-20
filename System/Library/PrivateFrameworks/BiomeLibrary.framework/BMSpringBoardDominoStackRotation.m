@interface BMSpringBoardDominoStackRotation
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSpringBoardDominoStackRotation)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSpringBoardDominoStackRotation)initWithWidget:(id)a3 stackId:(id)a4 reason:(int)a5 newWidgetSuggestion:(id)a6;
- (BMSpringBoardDominoStackRotation)initWithWidget:(id)a3 stackId:(id)a4 reason:(int)a5 newWidgetSuggestion:(id)a6 source:(id)a7;
- (BMSpringBoardDominoWidget)widget;
- (BOOL)hasNewWidgetSuggestion;
- (BOOL)isEqual:(id)a3;
- (BOOL)newWidgetSuggestion;
- (NSString)description;
- (NSString)source;
- (NSString)stackId;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)reason;
- (unsigned)dataVersion;
- (void)setHasNewWidgetSuggestion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSpringBoardDominoStackRotation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_stackId, 0);

  objc_storeStrong((id *)&self->_widget, 0);
}

- (NSString)source
{
  return self->_source;
}

- (void)setHasNewWidgetSuggestion:(BOOL)a3
{
  self->_hasNewWidgetSuggestion = a3;
}

- (BOOL)hasNewWidgetSuggestion
{
  return self->_hasNewWidgetSuggestion;
}

- (BOOL)newWidgetSuggestion
{
  return self->_newWidgetSuggestion;
}

- (int)reason
{
  return self->_reason;
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
    v6 = [(BMSpringBoardDominoStackRotation *)self widget];
    uint64_t v7 = [v5 widget];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSpringBoardDominoStackRotation *)self widget];
      v10 = [v5 widget];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_17;
      }
    }
    v13 = [(BMSpringBoardDominoStackRotation *)self stackId];
    uint64_t v14 = [v5 stackId];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSpringBoardDominoStackRotation *)self stackId];
      v17 = [v5 stackId];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_17;
      }
    }
    int v19 = [(BMSpringBoardDominoStackRotation *)self reason];
    if (v19 == [v5 reason])
    {
      if (![(BMSpringBoardDominoStackRotation *)self hasNewWidgetSuggestion]
        && ![v5 hasNewWidgetSuggestion]
        || [(BMSpringBoardDominoStackRotation *)self hasNewWidgetSuggestion]
        && [v5 hasNewWidgetSuggestion]
        && (int v20 = [(BMSpringBoardDominoStackRotation *)self newWidgetSuggestion],
            v20 == [v5 newWidgetSuggestion]))
      {
        v22 = [(BMSpringBoardDominoStackRotation *)self source];
        v23 = [v5 source];
        if (v22 == v23)
        {
          char v12 = 1;
        }
        else
        {
          v24 = [(BMSpringBoardDominoStackRotation *)self source];
          v25 = [v5 source];
          char v12 = [v24 isEqual:v25];
        }
        goto LABEL_18;
      }
    }
LABEL_17:
    char v12 = 0;
LABEL_18:

    goto LABEL_19;
  }
  char v12 = 0;
LABEL_19:

  return v12;
}

- (id)jsonDictionary
{
  v23[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSpringBoardDominoStackRotation *)self widget];
  id v4 = [v3 jsonDictionary];

  id v5 = [(BMSpringBoardDominoStackRotation *)self stackId];
  v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSpringBoardDominoStackRotation reason](self, "reason"));
  if ([(BMSpringBoardDominoStackRotation *)self hasNewWidgetSuggestion])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSpringBoardDominoStackRotation newWidgetSuggestion](self, "newWidgetSuggestion"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = [(BMSpringBoardDominoStackRotation *)self source];
  int v18 = @"widget";
  uint64_t v9 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v16 = v9;
  v23[0] = v9;
  int v19 = @"stackId";
  v10 = v5;
  if (!v5)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v9, v18, v19);
  }
  v23[1] = v10;
  int v20 = @"reason";
  int v11 = v6;
  if (!v6)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[2] = v11;
  v21 = @"newWidgetSuggestion";
  char v12 = v7;
  if (!v7)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[3] = v12;
  v22 = @"source";
  v13 = v8;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[4] = v13;
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v23, &v18, 5, v16);
  if (v8)
  {
    if (v7) {
      goto LABEL_16;
    }
  }
  else
  {

    if (v7)
    {
LABEL_16:
      if (v6) {
        goto LABEL_17;
      }
      goto LABEL_24;
    }
  }

  if (v6)
  {
LABEL_17:
    if (v5) {
      goto LABEL_18;
    }
LABEL_25:

    if (v4) {
      goto LABEL_19;
    }
    goto LABEL_26;
  }
LABEL_24:

  if (!v5) {
    goto LABEL_25;
  }
LABEL_18:
  if (v4) {
    goto LABEL_19;
  }
LABEL_26:

LABEL_19:

  return v14;
}

- (BMSpringBoardDominoStackRotation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v55[1] = *MEMORY[0x1E4F143B8];
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
    int v11 = v7;
    id v45 = 0;
    v8 = [[BMSpringBoardDominoWidget alloc] initWithJSONDictionary:v11 error:&v45];
    id v12 = v45;
    if (v12)
    {
      v13 = v12;
      if (a4) {
        *a4 = v12;
      }

      uint64_t v14 = 0;
      a4 = v11;
      goto LABEL_37;
    }

LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"stackId"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v14 = 0;
          goto LABEL_36;
        }
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        v37 = a4;
        uint64_t v22 = *MEMORY[0x1E4F502C8];
        uint64_t v52 = *MEMORY[0x1E4F28568];
        v42 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"stackId"];
        v53 = v42;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        id v23 = (id)[v21 initWithDomain:v22 code:2 userInfo:v10];
        a4 = 0;
        uint64_t v14 = 0;
        id *v37 = v23;
LABEL_35:

LABEL_36:
        goto LABEL_37;
      }
      v40 = v9;
    }
    else
    {
      v40 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"reason"];
    v41 = v8;
    v44 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v42 = 0;
            uint64_t v14 = 0;
            a4 = v40;
            goto LABEL_35;
          }
          id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v34 = *MEMORY[0x1E4F502C8];
          uint64_t v50 = *MEMORY[0x1E4F28568];
          id v25 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"reason"];
          id v51 = v25;
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
          id v35 = (id)[v43 initWithDomain:v34 code:2 userInfo:v24];
          v42 = 0;
          uint64_t v14 = 0;
          *a4 = v35;
          goto LABEL_54;
        }
        id v15 = [NSNumber numberWithInt:BMSpringBoardDominoStackRotationReasonFromString(v10)];
      }
      v42 = v15;
    }
    else
    {
      v42 = 0;
    }
    v24 = [v6 objectForKeyedSubscript:@"newWidgetSuggestion"];
    if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v25 = 0;
      goto LABEL_29;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = v24;
LABEL_29:
      v26 = [v6 objectForKeyedSubscript:@"source"];
      if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v36 = *MEMORY[0x1E4F502C8];
            uint64_t v46 = *MEMORY[0x1E4F28568];
            v32 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"source"];
            v47 = v32;
            v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
            *a4 = (id)[v39 initWithDomain:v36 code:2 userInfo:v33];
          }
          id v27 = 0;
          uint64_t v14 = 0;
          a4 = v40;
          goto LABEL_33;
        }
        id v27 = v26;
      }
      else
      {
        id v27 = 0;
      }
      a4 = v40;
      uint64_t v14 = -[BMSpringBoardDominoStackRotation initWithWidget:stackId:reason:newWidgetSuggestion:source:](v44, "initWithWidget:stackId:reason:newWidgetSuggestion:source:", v41, v40, [v42 intValue], v25, v27);
      v44 = v14;
LABEL_33:

LABEL_34:
      self = v44;
      v8 = v41;
      goto LABEL_35;
    }
    if (a4)
    {
      id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
      v38 = a4;
      uint64_t v30 = *MEMORY[0x1E4F502C8];
      uint64_t v48 = *MEMORY[0x1E4F28568];
      id v27 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"newWidgetSuggestion"];
      id v49 = v27;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      id v31 = (id)[v29 initWithDomain:v30 code:2 userInfo:v26];
      uint64_t v14 = 0;
      id v25 = 0;
      a4 = v40;
      id *v38 = v31;
      goto LABEL_33;
    }
    id v25 = 0;
    uint64_t v14 = 0;
LABEL_54:
    a4 = v40;
    goto LABEL_34;
  }
  if (!a4)
  {
    uint64_t v14 = 0;
    goto LABEL_38;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  v17 = a4;
  uint64_t v18 = *MEMORY[0x1E4F502C8];
  uint64_t v54 = *MEMORY[0x1E4F28568];
  v8 = (BMSpringBoardDominoWidget *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"widget"];
  v55[0] = v8;
  int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
  uint64_t v20 = v18;
  a4 = v19;
  uint64_t v14 = 0;
  id *v17 = (id)[v16 initWithDomain:v20 code:2 userInfo:v19];
LABEL_37:

LABEL_38:
  return v14;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSpringBoardDominoStackRotation *)self writeTo:v3];
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
  PBDataWriterWriteUint32Field();
  if (self->_hasNewWidgetSuggestion) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_source) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMSpringBoardDominoStackRotation;
  id v5 = [(BMEventBase *)&v38 init];
  if (!v5) {
    goto LABEL_55;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v9 = (int *)MEMORY[0x1E4F940B8];
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
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v39 = 0;
          uint64_t v40 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_54;
          }
          int v19 = [[BMSpringBoardDominoWidget alloc] initByReadFrom:v4];
          if (!v19) {
            goto LABEL_54;
          }
          widget = v5->_widget;
          v5->_widget = v19;

          PBReaderRecallMark();
          continue;
        case 2u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 40;
          goto LABEL_41;
        case 3u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          while (2)
          {
            uint64_t v26 = *v6;
            unint64_t v27 = *(void *)&v4[v26];
            if (v27 == -1 || v27 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)&v4[*v9] + v27);
              *(void *)&v4[v26] = v27 + 1;
              v25 |= (unint64_t)(v28 & 0x7F) << v23;
              if (v28 < 0)
              {
                v23 += 7;
                BOOL v16 = v24++ >= 9;
                if (v16)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v25) = 0;
          }
LABEL_45:
          if (v25 >= 0xB) {
            LODWORD(v25) = 0;
          }
          v5->_reason = v25;
          continue;
        case 4u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          v5->_hasNewWidgetSuggestion = 1;
          break;
        case 5u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 48;
LABEL_41:
          id v35 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_54;
          }
          continue;
      }
      while (1)
      {
        uint64_t v32 = *v6;
        unint64_t v33 = *(void *)&v4[v32];
        if (v33 == -1 || v33 >= *(void *)&v4[*v7]) {
          break;
        }
        char v34 = *(unsigned char *)(*(void *)&v4[*v9] + v33);
        *(void *)&v4[v32] = v33 + 1;
        v31 |= (unint64_t)(v34 & 0x7F) << v29;
        if ((v34 & 0x80) == 0) {
          goto LABEL_49;
        }
        v29 += 7;
        BOOL v16 = v30++ >= 9;
        if (v16)
        {
          uint64_t v31 = 0;
          goto LABEL_51;
        }
      }
      v4[*v8] = 1;
LABEL_49:
      if (v4[*v8]) {
        uint64_t v31 = 0;
      }
LABEL_51:
      v5->_newWidgetSuggestion = v31 != 0;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_54:
  }
    uint64_t v36 = 0;
  else {
LABEL_55:
  }
    uint64_t v36 = v5;

  return v36;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSpringBoardDominoStackRotation *)self widget];
  id v5 = [(BMSpringBoardDominoStackRotation *)self stackId];
  id v6 = BMSpringBoardDominoStackRotationReasonAsString([(BMSpringBoardDominoStackRotation *)self reason]);
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSpringBoardDominoStackRotation newWidgetSuggestion](self, "newWidgetSuggestion"));
  v8 = [(BMSpringBoardDominoStackRotation *)self source];
  uint64_t v9 = (void *)[v3 initWithFormat:@"BMSpringBoardDominoStackRotation with widget: %@, stackId: %@, reason: %@, newWidgetSuggestion: %@, source: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMSpringBoardDominoStackRotation)initWithWidget:(id)a3 stackId:(id)a4 reason:(int)a5 newWidgetSuggestion:(id)a6 source:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v19.receiver = self;
  v19.super_class = (Class)BMSpringBoardDominoStackRotation;
  int v17 = [(BMEventBase *)&v19 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v17->_widget, a3);
    objc_storeStrong((id *)&v17->_stackId, a4);
    v17->_reason = a5;
    if (v15)
    {
      v17->_hasNewWidgetSuggestion = 1;
      v17->_newWidgetSuggestion = [v15 BOOLValue];
    }
    else
    {
      v17->_hasNewWidgetSuggestion = 0;
      v17->_newWidgetSuggestion = 0;
    }
    objc_storeStrong((id *)&v17->_source, a7);
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"widget" number:1 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"stackId", 2, 13, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"reason" number:3 type:4 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"newWidgetSuggestion" number:4 type:12 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"source" number:5 type:13 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4AE8;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"widget_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_79];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stackId" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"reason" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"newWidgetSuggestion" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"source" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

id __43__BMSpringBoardDominoStackRotation_columns__block_invoke(uint64_t a1, void *a2)
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMSpringBoardDominoStackRotation alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (BMSpringBoardDominoStackRotation)initWithWidget:(id)a3 stackId:(id)a4 reason:(int)a5 newWidgetSuggestion:(id)a6
{
  return [(BMSpringBoardDominoStackRotation *)self initWithWidget:a3 stackId:a4 reason:*(void *)&a5 newWidgetSuggestion:a6 source:0];
}

@end
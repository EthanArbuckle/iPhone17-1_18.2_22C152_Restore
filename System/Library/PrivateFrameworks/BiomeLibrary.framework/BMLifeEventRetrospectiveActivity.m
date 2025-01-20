@interface BMLifeEventRetrospectiveActivity
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLifeEventActivity)activity;
- (BMLifeEventRetrospectiveActivity)initWithActivity:(id)a3;
- (BMLifeEventRetrospectiveActivity)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMLifeEventRetrospectiveActivity

- (void).cxx_destruct
{
}

- (BMLifeEventActivity)activity
{
  return self->_activity;
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
    v6 = [(BMLifeEventRetrospectiveActivity *)self activity];
    v7 = [v5 activity];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [(BMLifeEventRetrospectiveActivity *)self activity];
      v9 = [v5 activity];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)jsonDictionary
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BMLifeEventRetrospectiveActivity *)self activity];
  v3 = [v2 jsonDictionary];

  v7 = @"activity";
  id v4 = v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  if (!v3) {

  }
  return v5;
}

- (BMLifeEventRetrospectiveActivity)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v6 = [a3 objectForKeyedSubscript:@"activity"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
LABEL_4:
    self = [(BMLifeEventRetrospectiveActivity *)self initWithActivity:v7];
    p_isa = (id *)&self->super.super.isa;
LABEL_13:

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    id v15 = 0;
    v7 = [[BMLifeEventActivity alloc] initWithJSONDictionary:v8 error:&v15];
    id v9 = v15;
    if (!v9)
    {

      goto LABEL_4;
    }
    char v10 = v9;
    if (p_isa) {
      *p_isa = v9;
    }

LABEL_12:
    p_isa = 0;
    goto LABEL_13;
  }
  if (p_isa)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v12 = *MEMORY[0x1E4F502C8];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v7 = (BMLifeEventActivity *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"activity"];
    v17[0] = v7;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    *p_isa = (id)[v11 initWithDomain:v12 code:2 userInfo:v13];

    goto LABEL_12;
  }
LABEL_14:

  return (BMLifeEventRetrospectiveActivity *)p_isa;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMLifeEventRetrospectiveActivity *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  if (self->_activity)
  {
    id v4 = a3;
    PBDataWriterPlaceMark();
    [(BMLifeEventActivity *)self->_activity writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BMLifeEventRetrospectiveActivity;
  id v5 = [(BMEventBase *)&v23 init];
  if (!v5) {
    goto LABEL_27;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v12 >> 3) == 1)
      {
        uint64_t v24 = 0;
        uint64_t v25 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_26;
        }
        v19 = [[BMLifeEventActivity alloc] initByReadFrom:v4];
        if (!v19) {
          goto LABEL_26;
        }
        activity = v5->_activity;
        v5->_activity = v19;

        PBReaderRecallMark();
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_26;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_26:
  }
    v21 = 0;
  else {
LABEL_27:
  }
    v21 = v5;

  return v21;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMLifeEventRetrospectiveActivity *)self activity];
  id v5 = (void *)[v3 initWithFormat:@"BMLifeEventRetrospectiveActivity with activity: %@", v4];

  return (NSString *)v5;
}

- (BMLifeEventRetrospectiveActivity)initWithActivity:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BMLifeEventRetrospectiveActivity;
  v6 = [(BMEventBase *)&v8 init];
  if (v6)
  {
    v6->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v6->_activity, a3);
  }

  return v6;
}

+ (id)protoFields
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activity" number:1 type:14 subMessageClass:objc_opt_class()];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3420;
}

+ (id)columns
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"activity_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_1551];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

id __43__BMLifeEventRetrospectiveActivity_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 activity];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    v6 = (void *)[[v4 alloc] initWithData:v5];

    v7 = [[BMLifeEventRetrospectiveActivity alloc] initByReadFrom:v6];
    objc_super v8 = v7;
    if (v7) {
      v7[4] = 1;
    }
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end
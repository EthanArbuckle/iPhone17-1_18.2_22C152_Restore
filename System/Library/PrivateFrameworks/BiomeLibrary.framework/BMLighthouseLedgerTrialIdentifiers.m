@interface BMLighthouseLedgerTrialIdentifiers
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLighthouseLedgerTrialIdentifiers)initWithExperimentIdentifiers:(id)a3 bmltIdentifiers:(id)a4;
- (BMLighthouseLedgerTrialIdentifiers)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMLighthouseLedgerTrialIdentifiersBMLTIdentifiers)bmltIdentifiers;
- (BMLighthouseLedgerTrialIdentifiersExperimentIdentifiers)experimentIdentifiers;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMLighthouseLedgerTrialIdentifiers

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bmltIdentifiers, 0);

  objc_storeStrong((id *)&self->_experimentIdentifiers, 0);
}

- (BMLighthouseLedgerTrialIdentifiersBMLTIdentifiers)bmltIdentifiers
{
  return self->_bmltIdentifiers;
}

- (BMLighthouseLedgerTrialIdentifiersExperimentIdentifiers)experimentIdentifiers
{
  return self->_experimentIdentifiers;
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
    v6 = [(BMLighthouseLedgerTrialIdentifiers *)self experimentIdentifiers];
    uint64_t v7 = [v5 experimentIdentifiers];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMLighthouseLedgerTrialIdentifiers *)self experimentIdentifiers];
      v10 = [v5 experimentIdentifiers];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        char v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v13 = [(BMLighthouseLedgerTrialIdentifiers *)self bmltIdentifiers];
    v14 = [v5 bmltIdentifiers];
    if (v13 == v14)
    {
      char v12 = 1;
    }
    else
    {
      v15 = [(BMLighthouseLedgerTrialIdentifiers *)self bmltIdentifiers];
      v16 = [v5 bmltIdentifiers];
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
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMLighthouseLedgerTrialIdentifiers *)self experimentIdentifiers];
  id v4 = [v3 jsonDictionary];

  id v5 = [(BMLighthouseLedgerTrialIdentifiers *)self bmltIdentifiers];
  v6 = [v5 jsonDictionary];

  v11[0] = @"experimentIdentifiers";
  uint64_t v7 = v4;
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = @"bmltIdentifiers";
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

  return v9;
}

- (BMLighthouseLedgerTrialIdentifiers)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"experimentIdentifiers"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    id v25 = 0;
    v8 = [[BMLighthouseLedgerTrialIdentifiersExperimentIdentifiers alloc] initWithJSONDictionary:v9 error:&v25];
    id v12 = v25;
    if (v12)
    {
      v13 = v12;
      if (a4) {
        *a4 = v12;
      }

      goto LABEL_26;
    }

LABEL_4:
    id v9 = [v6 objectForKeyedSubscript:@"bmltIdentifiers"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
LABEL_7:
      self = [(BMLighthouseLedgerTrialIdentifiers *)self initWithExperimentIdentifiers:v8 bmltIdentifiers:v10];
      int v11 = self;
LABEL_23:

      goto LABEL_24;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v9;
      id v24 = 0;
      v10 = [[BMLighthouseLedgerTrialIdentifiersBMLTIdentifiers alloc] initWithJSONDictionary:v14 error:&v24];
      id v15 = v24;
      if (!v15)
      {

        goto LABEL_7;
      }
      v16 = v15;
      if (a4) {
        *a4 = v15;
      }

LABEL_22:
      int v11 = 0;
      goto LABEL_23;
    }
    if (a4)
    {
      id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v20 = *MEMORY[0x1E4F502C8];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v10 = (BMLighthouseLedgerTrialIdentifiersBMLTIdentifiers *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"bmltIdentifiers"];
      v27 = v10;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      *a4 = (id)[v23 initWithDomain:v20 code:2 userInfo:v21];

      goto LABEL_22;
    }
LABEL_26:
    int v11 = 0;
    goto LABEL_24;
  }
  if (!a4)
  {
    int v11 = 0;
    goto LABEL_25;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v18 = *MEMORY[0x1E4F502C8];
  uint64_t v28 = *MEMORY[0x1E4F28568];
  v8 = (BMLighthouseLedgerTrialIdentifiersExperimentIdentifiers *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"experimentIdentifiers"];
  v29[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  id v19 = (id)[v17 initWithDomain:v18 code:2 userInfo:v9];
  int v11 = 0;
  *a4 = v19;
LABEL_24:

LABEL_25:
  return v11;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMLighthouseLedgerTrialIdentifiers *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_experimentIdentifiers)
  {
    PBDataWriterPlaceMark();
    [(BMLighthouseLedgerTrialIdentifiersExperimentIdentifiers *)self->_experimentIdentifiers writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_bmltIdentifiers)
  {
    PBDataWriterPlaceMark();
    [(BMLighthouseLedgerTrialIdentifiersBMLTIdentifiers *)self->_bmltIdentifiers writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BMLighthouseLedgerTrialIdentifiers;
  id v5 = [(BMEventBase *)&v24 init];
  if (!v5) {
    goto LABEL_32;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
      if ((v12 >> 3) == 2)
      {
        uint64_t v25 = 0;
        uint64_t v26 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_31;
        }
        id v19 = [[BMLighthouseLedgerTrialIdentifiersBMLTIdentifiers alloc] initByReadFrom:v4];
        if (!v19) {
          goto LABEL_31;
        }
        uint64_t v20 = 32;
      }
      else
      {
        if ((v12 >> 3) != 1)
        {
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_31;
          }
          continue;
        }
        uint64_t v25 = 0;
        uint64_t v26 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_31;
        }
        id v19 = [[BMLighthouseLedgerTrialIdentifiersExperimentIdentifiers alloc] initByReadFrom:v4];
        if (!v19) {
          goto LABEL_31;
        }
        uint64_t v20 = 24;
      }
      v21 = *(Class *)((char *)&v5->super.super.isa + v20);
      *(Class *)((char *)&v5->super.super.isa + v20) = v19;

      PBReaderRecallMark();
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_31:
  }
    v22 = 0;
  else {
LABEL_32:
  }
    v22 = v5;

  return v22;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMLighthouseLedgerTrialIdentifiers *)self experimentIdentifiers];
  id v5 = [(BMLighthouseLedgerTrialIdentifiers *)self bmltIdentifiers];
  id v6 = (void *)[v3 initWithFormat:@"BMLighthouseLedgerTrialIdentifiers with experimentIdentifiers: %@, bmltIdentifiers: %@", v4, v5];

  return (NSString *)v6;
}

- (BMLighthouseLedgerTrialIdentifiers)initWithExperimentIdentifiers:(id)a3 bmltIdentifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMLighthouseLedgerTrialIdentifiers;
  id v9 = [(BMEventBase *)&v11 init];
  if (v9)
  {
    v9->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v9->_experimentIdentifiers, a3);
    objc_storeStrong((id *)&v9->_bmltIdentifiers, a4);
  }

  return v9;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"experimentIdentifiers" number:1 type:14 subMessageClass:objc_opt_class()];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bmltIdentifiers" number:2 type:14 subMessageClass:objc_opt_class()];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4980;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"experimentIdentifiers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_32122];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"bmltIdentifiers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_155_32123];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

id __45__BMLighthouseLedgerTrialIdentifiers_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 bmltIdentifiers];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __45__BMLighthouseLedgerTrialIdentifiers_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 experimentIdentifiers];
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

    id v8 = [[BMLighthouseLedgerTrialIdentifiers alloc] initByReadFrom:v7];
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
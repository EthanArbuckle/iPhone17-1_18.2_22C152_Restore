@interface BMUserFocusStatusChange
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMUserFocusStatusChange)initWithIdsHandle:(id)a3 statusChangeType:(id)a4 idsHandles:(id)a5;
- (BMUserFocusStatusChange)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BOOL)isEqual:(id)a3;
- (NSArray)idsHandles;
- (NSString)description;
- (NSString)idsHandle;
- (NSString)statusChangeType;
- (id)_idsHandlesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMUserFocusStatusChange

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"idsHandle" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"statusChangeType" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"idsHandles_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_61545];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsHandles, 0);
  objc_storeStrong((id *)&self->_statusChangeType, 0);

  objc_storeStrong((id *)&self->_idsHandle, 0);
}

- (NSArray)idsHandles
{
  return self->_idsHandles;
}

- (NSString)statusChangeType
{
  return self->_statusChangeType;
}

- (NSString)idsHandle
{
  return self->_idsHandle;
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
    v6 = [(BMUserFocusStatusChange *)self idsHandle];
    uint64_t v7 = [v5 idsHandle];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMUserFocusStatusChange *)self idsHandle];
      v10 = [v5 idsHandle];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(BMUserFocusStatusChange *)self statusChangeType];
    uint64_t v14 = [v5 statusChangeType];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMUserFocusStatusChange *)self statusChangeType];
      v17 = [v5 statusChangeType];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v19 = [(BMUserFocusStatusChange *)self idsHandles];
    v20 = [v5 idsHandles];
    if (v19 == v20)
    {
      char v12 = 1;
    }
    else
    {
      v21 = [(BMUserFocusStatusChange *)self idsHandles];
      v22 = [v5 idsHandles];
      char v12 = [v21 isEqual:v22];
    }
    goto LABEL_15;
  }
  char v12 = 0;
LABEL_16:

  return v12;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMUserFocusStatusChange *)self idsHandle];
  id v4 = [(BMUserFocusStatusChange *)self statusChangeType];
  id v5 = [(BMUserFocusStatusChange *)self _idsHandlesJSONArray];
  v11[0] = @"idsHandle";
  v6 = v3;
  if (!v3)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"statusChangeType";
  uint64_t v7 = v4;
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"idsHandles";
  v8 = v5;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (v5)
  {
    if (v4) {
      goto LABEL_9;
    }
LABEL_14:

    if (v3) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!v4) {
    goto LABEL_14;
  }
LABEL_9:
  if (v3) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v9;
}

- (id)_idsHandlesJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMUserFocusStatusChange *)self idsHandles];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMUserFocusStatusChange)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"idsHandle"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!p_isa)
      {
        id v8 = 0;
        goto LABEL_36;
      }
      v30 = v7;
      id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v32 = *MEMORY[0x1E4F502C8];
      uint64_t v63 = *MEMORY[0x1E4F28568];
      id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"idsHandle"];
      v64[0] = v10;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:&v63 count:1];
      v33 = v31;
      uint64_t v7 = v30;
      id v34 = (id)[v33 initWithDomain:v32 code:2 userInfo:v9];
      id v8 = 0;
      v35 = p_isa;
      p_isa = 0;
      id *v35 = v34;
      goto LABEL_35;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"statusChangeType"];
  v48 = p_isa;
  v49 = v7;
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v47 = v8;
    id v10 = 0;
LABEL_7:
    id v11 = [v6 objectForKeyedSubscript:@"idsHandles"];
    long long v12 = [MEMORY[0x1E4F1CA98] null];
    int v13 = [v11 isEqual:v12];

    if (v13)
    {
      v44 = v9;
      v45 = self;

      id v11 = 0;
LABEL_12:
      uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v11 = v11;
      uint64_t v15 = [v11 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (!v15) {
        goto LABEL_21;
      }
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v51;
LABEL_14:
      id v18 = v6;
      id v19 = v10;
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v51 != v17) {
          objc_enumerationMutation(v11);
        }
        uint64_t v21 = *(void *)(*((void *)&v50 + 1) + 8 * v20);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v10 = v19;
          id v6 = v18;
          v9 = v44;
          if (v48)
          {
            id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v23 = *MEMORY[0x1E4F502C8];
            uint64_t v54 = *MEMORY[0x1E4F28568];
            v24 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"idsHandles"];
            v55 = v24;
            v25 = (void *)MEMORY[0x1E4F1C9E8];
            v26 = &v55;
            v27 = &v54;
LABEL_30:
            v28 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:1];
            id *v48 = (id)[v22 initWithDomain:v23 code:2 userInfo:v28];
          }
          goto LABEL_31;
        }
        [v14 addObject:v21];
        if (v16 == ++v20)
        {
          uint64_t v16 = [v11 countByEnumeratingWithState:&v50 objects:v58 count:16];
          id v10 = v19;
          id v6 = v18;
          if (v16) {
            goto LABEL_14;
          }
LABEL_21:

          id v8 = v47;
          self = [(BMUserFocusStatusChange *)v45 initWithIdsHandle:v47 statusChangeType:v10 idsHandles:v14];
          p_isa = (id *)&self->super.super.isa;
          v9 = v44;
LABEL_33:

          goto LABEL_34;
        }
      }
      id v10 = v19;
      id v6 = v18;
      v9 = v44;
      if (v48)
      {
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v56 = *MEMORY[0x1E4F28568];
        v24 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"idsHandles"];
        v57 = v24;
        v25 = (void *)MEMORY[0x1E4F1C9E8];
        v26 = &v57;
        v27 = &v56;
        goto LABEL_30;
      }
LABEL_31:

      p_isa = 0;
      self = v45;
      goto LABEL_32;
    }
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v44 = v9;
      v45 = self;
      goto LABEL_12;
    }
    if (p_isa)
    {
      id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
      v41 = p_isa;
      uint64_t v42 = *MEMORY[0x1E4F502C8];
      uint64_t v59 = *MEMORY[0x1E4F28568];
      uint64_t v14 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"idsHandles"];
      v60 = v14;
      v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      id *v41 = (id)[v46 initWithDomain:v42 code:2 userInfo:v43];

      p_isa = 0;
LABEL_32:
      id v8 = v47;
      goto LABEL_33;
    }
    id v8 = v47;
LABEL_34:

    uint64_t v7 = v49;
    goto LABEL_35;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v47 = v8;
    id v10 = v9;
    goto LABEL_7;
  }
  if (p_isa)
  {
    id v36 = v8;
    id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v38 = *MEMORY[0x1E4F502C8];
    uint64_t v61 = *MEMORY[0x1E4F28568];
    id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"statusChangeType"];
    id v62 = v11;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    v39 = v37;
    id v8 = v36;
    id v40 = (id)[v39 initWithDomain:v38 code:2 userInfo:v14];
    id v10 = 0;
    p_isa = 0;
    id *v48 = v40;
    goto LABEL_33;
  }
  id v10 = 0;
LABEL_35:

LABEL_36:
  return (BMUserFocusStatusChange *)p_isa;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMUserFocusStatusChange *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_idsHandle) {
    PBDataWriterWriteStringField();
  }
  if (self->_statusChangeType) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_idsHandles;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BMUserFocusStatusChange;
  uint64_t v5 = [(BMEventBase *)&v30 init];
  if (!v5) {
    goto LABEL_32;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    long long v10 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (v4[*v9]) {
        goto LABEL_30;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v7;
        unint64_t v15 = *(void *)&v4[v14];
        if (v15 == -1 || v15 >= *(void *)&v4[*v8]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v15 + 1;
        v13 |= (unint64_t)(v16 & 0x7F) << v11;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        if (v12++ >= 9)
        {
          unint64_t v13 = 0;
          int v18 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v18 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v18 || (v13 & 7) == 4) {
        goto LABEL_30;
      }
      unint64_t v20 = v13 >> 3;
      if ((v13 >> 3) == 3) {
        break;
      }
      if (v20 == 2)
      {
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 32;
LABEL_26:
        v24 = *(Class *)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;
LABEL_27:

        goto LABEL_29;
      }
      if (v20 == 1)
      {
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 24;
        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
LABEL_34:

        goto LABEL_31;
      }
LABEL_29:
      if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
        goto LABEL_30;
      }
    }
    uint64_t v23 = PBReaderReadString();
    if (!v23) {
      goto LABEL_34;
    }
    v24 = (void *)v23;
    [v6 addObject:v23];
    goto LABEL_27;
  }
LABEL_30:
  uint64_t v25 = [v6 copy];
  idsHandles = v5->_idsHandles;
  v5->_idsHandles = (NSArray *)v25;

  int v27 = v4[*v9];
  if (v27) {
LABEL_31:
  }
    v28 = 0;
  else {
LABEL_32:
  }
    v28 = v5;

  return v28;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMUserFocusStatusChange *)self idsHandle];
  uint64_t v5 = [(BMUserFocusStatusChange *)self statusChangeType];
  uint64_t v6 = [(BMUserFocusStatusChange *)self idsHandles];
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMUserFocusStatusChange with idsHandle: %@, statusChangeType: %@, idsHandles: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMUserFocusStatusChange)initWithIdsHandle:(id)a3 statusChangeType:(id)a4 idsHandles:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMUserFocusStatusChange;
  unsigned int v12 = [(BMEventBase *)&v14 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_idsHandle, a3);
    objc_storeStrong((id *)&v12->_statusChangeType, a4);
    objc_storeStrong((id *)&v12->_idsHandles, a5);
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"idsHandle" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"statusChangeType", 2, 13, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"idsHandles" number:3 type:13 subMessageClass:0];
  v7[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6150;
}

id __34__BMUserFocusStatusChange_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _idsHandlesJSONArray];
  id v4 = BMConvertObjectToJSONString();

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
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMUserFocusStatusChange alloc] initByReadFrom:v7];
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
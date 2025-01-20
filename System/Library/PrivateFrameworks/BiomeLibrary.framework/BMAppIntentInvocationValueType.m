@interface BMAppIntentInvocationValueType
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAppIntentInvocationValueType)initWithContainerType:(int)a3 array:(id)a4 entity:(id)a5 legacyIntent:(int)a6 linkEnumeration:(id)a7 measurement:(int)a8 primitive:(int)a9;
- (BMAppIntentInvocationValueType)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMAppIntentInvocationValueTypeArray)array;
- (BMAppIntentInvocationValueTypeEntity)entity;
- (BMAppIntentInvocationValueTypeLinkEnumeration)linkEnumeration;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)containerType;
- (int)legacyIntent;
- (int)measurement;
- (int)primitive;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMAppIntentInvocationValueType

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEnumeration, 0);
  objc_storeStrong((id *)&self->_entity, 0);

  objc_storeStrong((id *)&self->_array, 0);
}

- (int)primitive
{
  return self->_primitive;
}

- (int)measurement
{
  return self->_measurement;
}

- (BMAppIntentInvocationValueTypeLinkEnumeration)linkEnumeration
{
  return self->_linkEnumeration;
}

- (int)legacyIntent
{
  return self->_legacyIntent;
}

- (BMAppIntentInvocationValueTypeEntity)entity
{
  return self->_entity;
}

- (BMAppIntentInvocationValueTypeArray)array
{
  return self->_array;
}

- (int)containerType
{
  return self->_containerType;
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
    int v6 = [(BMAppIntentInvocationValueType *)self containerType];
    if (v6 == [v5 containerType])
    {
      v7 = [(BMAppIntentInvocationValueType *)self array];
      uint64_t v8 = [v5 array];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(BMAppIntentInvocationValueType *)self array];
        v11 = [v5 array];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_19;
        }
      }
      v14 = [(BMAppIntentInvocationValueType *)self entity];
      uint64_t v15 = [v5 entity];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(BMAppIntentInvocationValueType *)self entity];
        v18 = [v5 entity];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_19;
        }
      }
      int v20 = [(BMAppIntentInvocationValueType *)self legacyIntent];
      if (v20 == [v5 legacyIntent])
      {
        v21 = [(BMAppIntentInvocationValueType *)self linkEnumeration];
        uint64_t v22 = [v5 linkEnumeration];
        if (v21 == (void *)v22)
        {
        }
        else
        {
          v23 = (void *)v22;
          v24 = [(BMAppIntentInvocationValueType *)self linkEnumeration];
          v25 = [v5 linkEnumeration];
          int v26 = [v24 isEqual:v25];

          if (!v26) {
            goto LABEL_19;
          }
        }
        int v27 = [(BMAppIntentInvocationValueType *)self measurement];
        if (v27 == [v5 measurement])
        {
          int v28 = [(BMAppIntentInvocationValueType *)self primitive];
          BOOL v13 = v28 == [v5 primitive];
LABEL_20:

          goto LABEL_21;
        }
      }
    }
LABEL_19:
    BOOL v13 = 0;
    goto LABEL_20;
  }
  BOOL v13 = 0;
LABEL_21:

  return v13;
}

- (id)jsonDictionary
{
  v28[7] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAppIntentInvocationValueType containerType](self, "containerType"));
  id v4 = [(BMAppIntentInvocationValueType *)self array];
  uint64_t v5 = [v4 jsonDictionary];

  int v6 = [(BMAppIntentInvocationValueType *)self entity];
  v7 = [v6 jsonDictionary];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAppIntentInvocationValueType legacyIntent](self, "legacyIntent"));
  v9 = [(BMAppIntentInvocationValueType *)self linkEnumeration];
  v10 = [v9 jsonDictionary];

  v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAppIntentInvocationValueType measurement](self, "measurement"));
  int v12 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAppIntentInvocationValueType primitive](self, "primitive"));
  v27[0] = @"containerType";
  uint64_t v13 = v3;
  if (!v3)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v13;
  v28[0] = v13;
  v27[1] = @"array";
  uint64_t v14 = v5;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v14;
  v28[1] = v14;
  v27[2] = @"entity";
  uint64_t v15 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  int v26 = (void *)v3;
  uint64_t v22 = (void *)v15;
  v28[2] = v15;
  v27[3] = @"legacyIntent";
  v16 = v8;
  if (!v8)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v5;
  v28[3] = v16;
  v27[4] = @"linkEnumeration";
  v17 = v10;
  if (!v10)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[4] = v17;
  v27[5] = @"measurement";
  v18 = v11;
  if (!v11)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[5] = v18;
  v27[6] = @"primitive";
  int v19 = v12;
  if (!v12)
  {
    int v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[6] = v19;
  int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:7];
  if (v12)
  {
    if (v11) {
      goto LABEL_17;
    }
LABEL_27:

    if (v10) {
      goto LABEL_18;
    }
    goto LABEL_28;
  }

  if (!v11) {
    goto LABEL_27;
  }
LABEL_17:
  if (v10) {
    goto LABEL_18;
  }
LABEL_28:

LABEL_18:
  if (!v8) {

  }
  if (v7)
  {
    if (v25) {
      goto LABEL_22;
    }
LABEL_30:

    if (v26) {
      goto LABEL_23;
    }
    goto LABEL_31;
  }

  if (!v25) {
    goto LABEL_30;
  }
LABEL_22:
  if (v26) {
    goto LABEL_23;
  }
LABEL_31:

LABEL_23:

  return v20;
}

- (BMAppIntentInvocationValueType)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v104[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"containerType"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v8 = 0;
          v21 = 0;
          goto LABEL_78;
        }
        id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v43 = *MEMORY[0x1E4F502C8];
        uint64_t v103 = *MEMORY[0x1E4F28568];
        id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"containerType"];
        v104[0] = v18;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:&v103 count:1];
        id v44 = (id)[v42 initWithDomain:v43 code:2 userInfo:v11];
        uint64_t v8 = 0;
        v21 = 0;
        *a4 = v44;
        goto LABEL_76;
      }
      id v9 = [NSNumber numberWithInt:BMAppIntentInvocationValueTypeContainerTypeFromString(v7)];
    }
    uint64_t v8 = v9;
  }
  else
  {
    uint64_t v8 = 0;
  }
  v10 = [v6 objectForKeyedSubscript:@"array"];
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = v10;
    id v90 = 0;
    v11 = [[BMAppIntentInvocationValueTypeArray alloc] initWithJSONDictionary:v18 error:&v90];
    id v19 = v90;
    if (v19)
    {
      int v20 = v19;
      if (a4) {
        *a4 = v19;
      }

      v21 = 0;
      goto LABEL_76;
    }

LABEL_12:
    uint64_t v12 = [v6 objectForKeyedSubscript:@"entity"];
    v84 = (void *)v12;
    if (!v12 || (uint64_t v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v87 = 0;
LABEL_15:
      uint64_t v14 = [v6 objectForKeyedSubscript:@"legacyIntent"];
      v77 = v7;
      v78 = (void *)v14;
      if (v14 && (uint64_t v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v83 = v15;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v21 = 0;
              id v23 = 0;
              goto LABEL_73;
            }
            id v60 = objc_alloc(MEMORY[0x1E4F28C58]);
            v61 = v8;
            uint64_t v62 = *MEMORY[0x1E4F502C8];
            uint64_t v97 = *MEMORY[0x1E4F28568];
            id v26 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"legacyIntent"];
            id v98 = v26;
            uint64_t v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
            uint64_t v64 = v62;
            uint64_t v8 = v61;
            v82 = (BMAppIntentInvocationValueTypeLinkEnumeration *)v63;
            id v65 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v64, 2);
            v21 = 0;
            *a4 = v65;
            id v23 = 0;
            goto LABEL_71;
          }
          id v83 = [NSNumber numberWithInt:BMAppIntentInvocationValueTypeLegacyIntentFromString(v15)];
        }
      }
      else
      {
        id v83 = 0;
      }
      v16 = [v6 objectForKeyedSubscript:@"linkEnumeration"];
      if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v76 = v11;
        v82 = 0;
LABEL_21:
        v17 = [v6 objectForKeyedSubscript:@"measurement"];
        v79 = v8;
        if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v34 = v17;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                v85 = 0;
                v21 = 0;
                goto LABEL_70;
              }
              v58 = self;
              id v66 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v67 = *MEMORY[0x1E4F502C8];
              uint64_t v93 = *MEMORY[0x1E4F28568];
              v53 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"measurement"];
              v94 = v53;
              v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
              id v68 = (id)[v66 initWithDomain:v67 code:2 userInfo:v52];
              v85 = 0;
              v21 = 0;
              *a4 = v68;
              goto LABEL_69;
            }
            id v34 = [NSNumber numberWithInt:BMAppIntentInvocationValueTypeMeasurementUnitFromString(v17)];
          }
          v85 = v34;
        }
        else
        {
          v85 = 0;
        }
        v52 = [v6 objectForKeyedSubscript:@"primitive"];
        if (v52 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v54 = v52;
          }
          else
          {
            v53 = a4;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v58 = self;
              if (a4)
              {
                id v75 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v74 = *MEMORY[0x1E4F502C8];
                uint64_t v91 = *MEMORY[0x1E4F28568];
                v69 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"primitive"];
                v92 = v69;
                v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
                *a4 = (id)[v75 initWithDomain:v74 code:2 userInfo:v70];

                v53 = 0;
              }
              v21 = 0;
              goto LABEL_69;
            }
            v54 = [NSNumber numberWithInt:BMAppIntentInvocationValueTypePrimitiveFromString(v52)];
          }
          v53 = v54;
        }
        else
        {
          v53 = 0;
        }
        uint64_t v55 = [v79 intValue];
        uint64_t v56 = [v83 intValue];
        uint64_t v57 = [v85 intValue];
        LODWORD(v71) = [v53 intValue];
        v21 = [(BMAppIntentInvocationValueType *)self initWithContainerType:v55 array:v76 entity:v87 legacyIntent:v56 linkEnumeration:v82 measurement:v57 primitive:v71];
        v58 = v21;
LABEL_69:

        self = v58;
LABEL_70:
        id v23 = v83;

        id v26 = v16;
        uint64_t v8 = v79;
        v11 = v76;
        goto LABEL_71;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v26 = v16;
        id v88 = 0;
        v82 = [[BMAppIntentInvocationValueTypeLinkEnumeration alloc] initWithJSONDictionary:v26 error:&v88];
        id v27 = v88;
        if (!v27)
        {
          v76 = v11;

          goto LABEL_21;
        }
        int v28 = v27;
        if (a4) {
          *a4 = v27;
        }

        v21 = 0;
      }
      else
      {
        if (!a4)
        {
          v21 = 0;
          id v23 = v83;
          goto LABEL_72;
        }
        id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
        v81 = v8;
        uint64_t v46 = *MEMORY[0x1E4F502C8];
        uint64_t v95 = *MEMORY[0x1E4F28568];
        v47 = v11;
        id v48 = [NSString alloc];
        uint64_t v73 = objc_opt_class();
        v49 = v48;
        v11 = v47;
        v82 = (BMAppIntentInvocationValueTypeLinkEnumeration *)[v49 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v73, @"linkEnumeration"];
        v96 = v82;
        v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
        uint64_t v51 = v46;
        uint64_t v8 = v81;
        *a4 = (id)[v45 initWithDomain:v51 code:2 userInfo:v50];

        v21 = 0;
        id v26 = v16;
      }
      id v23 = v83;
LABEL_71:

      v16 = v26;
LABEL_72:

      v7 = v77;
LABEL_73:

      goto LABEL_74;
    }
    v86 = self;
    uint64_t v22 = a4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = v13;
      id v89 = 0;
      v87 = [[BMAppIntentInvocationValueTypeEntity alloc] initWithJSONDictionary:v23 error:&v89];
      id v24 = v89;
      if (!v24)
      {

        a4 = v22;
        self = v86;
        goto LABEL_15;
      }
      v25 = v24;
      if (v22) {
        *uint64_t v22 = v24;
      }

      v21 = 0;
    }
    else
    {
      if (!a4)
      {
        v21 = 0;
        self = v86;
        goto LABEL_75;
      }
      id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
      v80 = v8;
      uint64_t v36 = *MEMORY[0x1E4F502C8];
      uint64_t v99 = *MEMORY[0x1E4F28568];
      v37 = v11;
      id v38 = [NSString alloc];
      uint64_t v72 = objc_opt_class();
      v39 = v38;
      v11 = v37;
      v87 = (BMAppIntentInvocationValueTypeEntity *)[v39 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v72, @"entity"];
      v100 = v87;
      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
      uint64_t v40 = v36;
      uint64_t v8 = v80;
      id v41 = (id)[v35 initWithDomain:v40 code:2 userInfo:v23];
      v21 = 0;
      *uint64_t v22 = v41;
    }
    self = v86;
LABEL_74:

LABEL_75:
    id v18 = v10;
    goto LABEL_76;
  }
  if (a4)
  {
    id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
    v30 = v8;
    uint64_t v31 = *MEMORY[0x1E4F502C8];
    uint64_t v101 = *MEMORY[0x1E4F28568];
    v11 = (BMAppIntentInvocationValueTypeArray *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"array"];
    v102 = v11;
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
    uint64_t v33 = v31;
    uint64_t v8 = v30;
    *a4 = (id)[v29 initWithDomain:v33 code:2 userInfo:v32];

    v21 = 0;
    id v18 = v10;
LABEL_76:

    v10 = v18;
    goto LABEL_77;
  }
  v21 = 0;
LABEL_77:

LABEL_78:
  return v21;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMAppIntentInvocationValueType *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_array)
  {
    PBDataWriterPlaceMark();
    [(BMAppIntentInvocationValueTypeArray *)self->_array writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_entity)
  {
    PBDataWriterPlaceMark();
    [(BMAppIntentInvocationValueTypeEntity *)self->_entity writeTo:v4];
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
  if (self->_linkEnumeration)
  {
    PBDataWriterPlaceMark();
    [(BMAppIntentInvocationValueTypeLinkEnumeration *)self->_linkEnumeration writeTo:v4];
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)BMAppIntentInvocationValueType;
  uint64_t v5 = [(BMEventBase *)&v51 init];
  if (!v5) {
    goto LABEL_88;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
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
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          while (1)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7]) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0) {
              goto LABEL_61;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_63;
            }
          }
          v4[*v8] = 1;
LABEL_61:
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_63:
          if (v22 >= 9) {
            LODWORD(v22) = 0;
          }
          uint64_t v48 = 20;
          goto LABEL_84;
        case 2u:
          uint64_t v52 = 0;
          uint64_t v53 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_87;
          }
          id v27 = [[BMAppIntentInvocationValueTypeArray alloc] initByReadFrom:v4];
          if (!v27) {
            goto LABEL_87;
          }
          uint64_t v28 = 40;
          goto LABEL_45;
        case 3u:
          uint64_t v52 = 0;
          uint64_t v53 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_87;
          }
          id v27 = [[BMAppIntentInvocationValueTypeEntity alloc] initByReadFrom:v4];
          if (!v27) {
            goto LABEL_87;
          }
          uint64_t v28 = 48;
          goto LABEL_45;
        case 4u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v22 = 0;
          while (2)
          {
            uint64_t v31 = *v6;
            uint64_t v32 = *(void *)&v4[v31];
            unint64_t v33 = v32 + 1;
            if (v32 == -1 || v33 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)&v4[*v9] + v32);
              *(void *)&v4[v31] = v33;
              v22 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                BOOL v17 = v30++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_69:
          if (v22 >= 0x10) {
            LODWORD(v22) = 0;
          }
          uint64_t v48 = 24;
          goto LABEL_84;
        case 5u:
          uint64_t v52 = 0;
          uint64_t v53 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_87;
          }
          id v27 = [[BMAppIntentInvocationValueTypeLinkEnumeration alloc] initByReadFrom:v4];
          if (!v27) {
            goto LABEL_87;
          }
          uint64_t v28 = 56;
LABEL_45:
          id v35 = *(Class *)((char *)&v5->super.super.isa + v28);
          *(Class *)((char *)&v5->super.super.isa + v28) = v27;

          PBReaderRecallMark();
          continue;
        case 6u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v22 = 0;
          while (2)
          {
            uint64_t v38 = *v6;
            uint64_t v39 = *(void *)&v4[v38];
            unint64_t v40 = v39 + 1;
            if (v39 == -1 || v40 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)&v4[*v9] + v39);
              *(void *)&v4[v38] = v40;
              v22 |= (unint64_t)(v41 & 0x7F) << v36;
              if (v41 < 0)
              {
                v36 += 7;
                BOOL v17 = v37++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_75:
          if (v22 >= 0x18) {
            LODWORD(v22) = 0;
          }
          uint64_t v48 = 28;
          goto LABEL_84;
        case 7u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v22 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_87;
          }
          continue;
      }
      while (1)
      {
        uint64_t v44 = *v6;
        uint64_t v45 = *(void *)&v4[v44];
        unint64_t v46 = v45 + 1;
        if (v45 == -1 || v46 > *(void *)&v4[*v7]) {
          break;
        }
        char v47 = *(unsigned char *)(*(void *)&v4[*v9] + v45);
        *(void *)&v4[v44] = v46;
        v22 |= (unint64_t)(v47 & 0x7F) << v42;
        if ((v47 & 0x80) == 0) {
          goto LABEL_79;
        }
        v42 += 7;
        BOOL v17 = v43++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_81;
        }
      }
      v4[*v8] = 1;
LABEL_79:
      if (v4[*v8]) {
        LODWORD(v22) = 0;
      }
LABEL_81:
      if (v22 >= 0xE) {
        LODWORD(v22) = 0;
      }
      uint64_t v48 = 32;
LABEL_84:
      *(_DWORD *)((char *)&v5->super.super.isa + v48) = v22;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_87:
  }
    v49 = 0;
  else {
LABEL_88:
  }
    v49 = v5;

  return v49;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMAppIntentInvocationValueTypeContainerTypeAsString([(BMAppIntentInvocationValueType *)self containerType]);
  uint64_t v5 = [(BMAppIntentInvocationValueType *)self array];
  id v6 = [(BMAppIntentInvocationValueType *)self entity];
  v7 = BMAppIntentInvocationValueTypeLegacyIntentAsString([(BMAppIntentInvocationValueType *)self legacyIntent]);
  uint64_t v8 = [(BMAppIntentInvocationValueType *)self linkEnumeration];
  id v9 = BMAppIntentInvocationValueTypeMeasurementUnitAsString([(BMAppIntentInvocationValueType *)self measurement]);
  char v10 = BMAppIntentInvocationValueTypePrimitiveAsString([(BMAppIntentInvocationValueType *)self primitive]);
  unsigned int v11 = (void *)[v3 initWithFormat:@"BMAppIntentInvocationValueType with containerType: %@, array: %@, entity: %@, legacyIntent: %@, linkEnumeration: %@, measurement: %@, primitive: %@", v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BMAppIntentInvocationValueType)initWithContainerType:(int)a3 array:(id)a4 entity:(id)a5 legacyIntent:(int)a6 linkEnumeration:(id)a7 measurement:(int)a8 primitive:(int)a9
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMAppIntentInvocationValueType;
  id v19 = [(BMEventBase *)&v21 init];
  if (v19)
  {
    v19->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v19->_containerType = a3;
    objc_storeStrong((id *)&v19->_array, a4);
    objc_storeStrong((id *)&v19->_entity, a5);
    v19->_legacyIntent = a6;
    objc_storeStrong((id *)&v19->_linkEnumeration, a7);
    v19->_measurement = a8;
    v19->_primitive = a9;
  }

  return v19;
}

+ (id)protoFields
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"containerType" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"array", 2, 14, objc_opt_class(), v2);
  v11[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"entity" number:3 type:14 subMessageClass:objc_opt_class()];
  v11[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"legacyIntent" number:4 type:4 subMessageClass:0];
  v11[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"linkEnumeration" number:5 type:14 subMessageClass:objc_opt_class()];
  v11[4] = v6;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"measurement" number:6 type:4 subMessageClass:0];
  v11[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"primitive" number:7 type:4 subMessageClass:0];
  v11[6] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5028;
}

+ (id)columns
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"containerType" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"array_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_660];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"entity_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_662];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"legacyIntent" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"linkEnumeration_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_664];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"measurement" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"primitive" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

id __41__BMAppIntentInvocationValueType_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 linkEnumeration];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __41__BMAppIntentInvocationValueType_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 entity];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __41__BMAppIntentInvocationValueType_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 array];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

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
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMAppIntentInvocationValueType alloc] initByReadFrom:v7];
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
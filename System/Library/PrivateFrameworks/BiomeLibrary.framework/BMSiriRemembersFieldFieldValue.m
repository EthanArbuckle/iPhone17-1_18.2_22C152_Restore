@interface BMSiriRemembersFieldFieldValue
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriRemembersFieldFieldValue)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriRemembersFieldFieldValue)initWithValueSequence:(id)a3 valueDictionary:(id)a4 value:(id)a5;
- (BMSiriRemembersFieldFieldValueBasicValue)value;
- (BOOL)isEqual:(id)a3;
- (NSArray)valueDictionary;
- (NSArray)valueSequence;
- (NSString)description;
- (id)_valueDictionaryJSONArray;
- (id)_valueSequenceJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriRemembersFieldFieldValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_valueDictionary, 0);

  objc_storeStrong((id *)&self->_valueSequence, 0);
}

- (BMSiriRemembersFieldFieldValueBasicValue)value
{
  return self->_value;
}

- (NSArray)valueDictionary
{
  return self->_valueDictionary;
}

- (NSArray)valueSequence
{
  return self->_valueSequence;
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
    v6 = [(BMSiriRemembersFieldFieldValue *)self valueSequence];
    uint64_t v7 = [v5 valueSequence];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriRemembersFieldFieldValue *)self valueSequence];
      v10 = [v5 valueSequence];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(BMSiriRemembersFieldFieldValue *)self valueDictionary];
    uint64_t v14 = [v5 valueDictionary];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriRemembersFieldFieldValue *)self valueDictionary];
      v17 = [v5 valueDictionary];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v19 = [(BMSiriRemembersFieldFieldValue *)self value];
    v20 = [v5 value];
    if (v19 == v20)
    {
      char v12 = 1;
    }
    else
    {
      v21 = [(BMSiriRemembersFieldFieldValue *)self value];
      v22 = [v5 value];
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
  v13[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriRemembersFieldFieldValue *)self _valueSequenceJSONArray];
  id v4 = [(BMSiriRemembersFieldFieldValue *)self _valueDictionaryJSONArray];
  id v5 = [(BMSiriRemembersFieldFieldValue *)self value];
  v6 = [v5 jsonDictionary];

  v12[0] = @"valueSequence";
  uint64_t v7 = v3;
  if (!v3)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v7;
  v12[1] = @"valueDictionary";
  v8 = v4;
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v8;
  v12[2] = @"value";
  v9 = v6;
  if (!v6)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  if (v6)
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

  return v10;
}

- (id)_valueDictionaryJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMSiriRemembersFieldFieldValue *)self valueDictionary];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_valueSequenceJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMSiriRemembersFieldFieldValue *)self valueSequence];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMSiriRemembersFieldFieldValue)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v90[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"valueSequence"];
  uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  int v8 = [v6 isEqual:v7];

  v62 = v5;
  if (v8)
  {
    v60 = self;

    id v6 = 0;
  }
  else
  {
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v28 = 0;
          goto LABEL_60;
        }
        id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v40 = *MEMORY[0x1E4F502C8];
        uint64_t v89 = *MEMORY[0x1E4F28568];
        v63 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"valueSequence"];
        v90[0] = v63;
        uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:&v89 count:1];
        v28 = 0;
        *a4 = (id)[v39 initWithDomain:v40 code:2 userInfo:v41];
LABEL_45:
        v29 = (void *)v41;
        goto LABEL_59;
      }
    }
    v60 = self;
  }
  v63 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v6 = v6;
  uint64_t v9 = [v6 countByEnumeratingWithState:&v71 objects:v88 count:16];
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v72;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v72 != v11) {
        objc_enumerationMutation(v6);
      }
      long long v13 = *(void **)(*((void *)&v71 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = a4;
        if (a4)
        {
          id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v23 = *MEMORY[0x1E4F502C8];
          uint64_t v86 = *MEMORY[0x1E4F28568];
          id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"valueSequence"];
          id v87 = v14;
          v24 = (void *)MEMORY[0x1E4F1C9E8];
          v25 = &v87;
          v26 = &v86;
          goto LABEL_22;
        }
LABEL_46:
        v28 = 0;
        v29 = v6;
        self = v60;
        id v5 = v62;
        goto LABEL_59;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v21 = a4;
        if (!a4) {
          goto LABEL_46;
        }
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v84 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"valueSequence"];
        id v85 = v14;
        v24 = (void *)MEMORY[0x1E4F1C9E8];
        v25 = &v85;
        v26 = &v84;
LABEL_22:
        v27 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:1];
        v28 = 0;
        id *v21 = (id)[v22 initWithDomain:v23 code:2 userInfo:v27];
        v29 = v6;
LABEL_23:
        self = v60;
        id v5 = v62;
        goto LABEL_58;
      }
      id v14 = v13;
      v15 = [BMSiriRemembersFieldFieldValueBasicValue alloc];
      id v70 = 0;
      uint64_t v16 = [(BMSiriRemembersFieldFieldValueBasicValue *)v15 initWithJSONDictionary:v14 error:&v70];
      id v17 = v70;
      if (v17)
      {
        v27 = v17;
        id v5 = v62;
        if (a4) {
          *a4 = v17;
        }

        v28 = 0;
        v29 = v6;
        self = v60;
        goto LABEL_58;
      }
      [v63 addObject:v16];
    }
    uint64_t v10 = [v6 countByEnumeratingWithState:&v71 objects:v88 count:16];
  }
  while (v10);
LABEL_16:

  id v5 = v62;
  int v18 = [v62 objectForKeyedSubscript:@"valueDictionary"];
  v19 = [MEMORY[0x1E4F1CA98] null];
  int v20 = [v18 isEqual:v19];

  if (v20)
  {

    int v18 = 0;
    goto LABEL_29;
  }
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v41 = (uint64_t)v18;
      self = v60;
      if (a4)
      {
        id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v52 = *MEMORY[0x1E4F502C8];
        uint64_t v82 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"valueDictionary"];
        id v83 = v14;
        v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
        v28 = 0;
        *a4 = (id)[v51 initWithDomain:v52 code:2 userInfo:v27];
        v29 = (void *)v41;
        goto LABEL_58;
      }
      v28 = 0;
      goto LABEL_45;
    }
  }
LABEL_29:
  id v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v18, "count"));
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = v18;
  uint64_t v30 = [obj countByEnumeratingWithState:&v66 objects:v81 count:16];
  if (!v30) {
    goto LABEL_39;
  }
  uint64_t v31 = v30;
  uint64_t v32 = *(void *)v67;
  while (2)
  {
    uint64_t v33 = 0;
    while (2)
    {
      if (*(void *)v67 != v32) {
        objc_enumerationMutation(obj);
      }
      v34 = *(void **)(*((void *)&v66 + 1) + 8 * v33);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v42 = a4;
        if (a4)
        {
          id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v44 = *MEMORY[0x1E4F502C8];
          uint64_t v79 = *MEMORY[0x1E4F28568];
          v35 = (BMSiriRemembersFieldFieldValueBasicValue *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"valueDictionary"];
          v80 = v35;
          v45 = (void *)MEMORY[0x1E4F1C9E8];
          v46 = &v80;
          v47 = &v79;
LABEL_52:
          v48 = [v45 dictionaryWithObjects:v46 forKeys:v47 count:1];
          id *v42 = (id)[v43 initWithDomain:v44 code:2 userInfo:v48];

LABEL_56:
          v28 = 0;
          v29 = obj;
          self = v60;
          v27 = obj;
          id v5 = v62;
          goto LABEL_57;
        }
LABEL_63:
        v28 = 0;
        v29 = obj;
        v27 = obj;
        goto LABEL_23;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v42 = a4;
        if (a4)
        {
          id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v44 = *MEMORY[0x1E4F502C8];
          uint64_t v77 = *MEMORY[0x1E4F28568];
          v35 = (BMSiriRemembersFieldFieldValueBasicValue *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"valueDictionary"];
          v78 = v35;
          v45 = (void *)MEMORY[0x1E4F1C9E8];
          v46 = &v78;
          v47 = &v77;
          goto LABEL_52;
        }
        goto LABEL_63;
      }
      v35 = v34;
      v36 = [BMSiriRemembersFieldFieldValueNamedValue alloc];
      id v65 = 0;
      v37 = [(BMSiriRemembersFieldFieldValueNamedValue *)v36 initWithJSONDictionary:v35 error:&v65];
      id v38 = v65;
      if (v38)
      {
        v49 = v38;
        if (a4) {
          *a4 = v38;
        }

        goto LABEL_56;
      }
      [v14 addObject:v37];

      if (v31 != ++v33) {
        continue;
      }
      break;
    }
    uint64_t v31 = [obj countByEnumeratingWithState:&v66 objects:v81 count:16];
    id v5 = v62;
    if (v31) {
      continue;
    }
    break;
  }
LABEL_39:
  v29 = obj;

  v27 = [v5 objectForKeyedSubscript:@"value"];
  if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v35 = 0;
    self = v60;
    goto LABEL_42;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v53 = v27;
    id v64 = 0;
    v35 = [[BMSiriRemembersFieldFieldValueBasicValue alloc] initWithJSONDictionary:v53 error:&v64];
    id v54 = v64;
    self = v60;
    if (v54)
    {
      v55 = v54;
      if (a4) {
        *a4 = v54;
      }

      v28 = 0;
      v27 = v53;
      v29 = obj;
    }
    else
    {

      v29 = obj;
LABEL_42:
      self = [(BMSiriRemembersFieldFieldValue *)self initWithValueSequence:v63 valueDictionary:v14 value:v35];
      v28 = self;
    }
LABEL_57:
  }
  else
  {
    if (a4)
    {
      id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v57 = *MEMORY[0x1E4F502C8];
      uint64_t v75 = *MEMORY[0x1E4F28568];
      v35 = (BMSiriRemembersFieldFieldValueBasicValue *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"value"];
      v76 = v35;
      v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      *a4 = (id)[v56 initWithDomain:v57 code:2 userInfo:v58];

      v28 = 0;
      v29 = obj;
      self = v60;
      goto LABEL_57;
    }
    v28 = 0;
    v29 = obj;
    self = v60;
  }
LABEL_58:

LABEL_59:
LABEL_60:

  return v28;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriRemembersFieldFieldValue *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = self->_valueSequence;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
        uint64_t v21 = 0;
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = self->_valueDictionary;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        uint64_t v21 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v16, "writeTo:", v4, (void)v17);
        PBDataWriterRecallMark();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v26 count:16];
    }
    while (v13);
  }

  if (self->_value)
  {
    uint64_t v21 = 0;
    PBDataWriterPlaceMark();
    [(BMSiriRemembersFieldFieldValueBasicValue *)self->_value writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMSiriRemembersFieldFieldValue;
  id v5 = [(BMEventBase *)&v36 init];
  if (!v5) {
    goto LABEL_35;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v11 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v10]) {
        break;
      }
      char v12 = 0;
      unsigned int v13 = 0;
      unint64_t v14 = 0;
      while (1)
      {
        uint64_t v15 = *v8;
        uint64_t v16 = *(void *)&v4[v15];
        unint64_t v17 = v16 + 1;
        if (v16 == -1 || v17 > *(void *)&v4[*v9]) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)&v4[*v11] + v16);
        *(void *)&v4[v15] = v17;
        v14 |= (unint64_t)(v18 & 0x7F) << v12;
        if ((v18 & 0x80) == 0) {
          goto LABEL_13;
        }
        v12 += 7;
        if (v13++ >= 9)
        {
          unint64_t v14 = 0;
          int v20 = v4[*v10];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      int v20 = v4[*v10];
      if (v4[*v10]) {
        unint64_t v14 = 0;
      }
LABEL_15:
      if (v20 || (v14 & 7) == 4) {
        break;
      }
      unint64_t v22 = v14 >> 3;
      if ((v14 >> 3) == 3)
      {
        uint64_t v37 = 0;
        uint64_t v38 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (v26 = [[BMSiriRemembersFieldFieldValueBasicValue alloc] initByReadFrom:v4]) == 0)
        {
LABEL_36:

          goto LABEL_37;
        }
        value = v5->_value;
        v5->_value = v26;

        PBReaderRecallMark();
      }
      else
      {
        if (v22 == 2)
        {
          uint64_t v37 = 0;
          uint64_t v38 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_36;
          }
          id v28 = [[BMSiriRemembersFieldFieldValueNamedValue alloc] initByReadFrom:v4];
          if (!v28) {
            goto LABEL_36;
          }
          long long v24 = v28;
          long long v25 = v7;
          goto LABEL_31;
        }
        if (v22 == 1)
        {
          uint64_t v37 = 0;
          uint64_t v38 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_36;
          }
          id v23 = [[BMSiriRemembersFieldFieldValueBasicValue alloc] initByReadFrom:v4];
          if (!v23) {
            goto LABEL_36;
          }
          long long v24 = v23;
          long long v25 = v6;
LABEL_31:
          [v25 addObject:v24];
          PBReaderRecallMark();

          continue;
        }
        if (!PBReaderSkipValueWithTag()) {
          goto LABEL_36;
        }
      }
    }
    while (*(void *)&v4[*v8] < *(void *)&v4[*v9]);
  }
  uint64_t v29 = [v6 copy];
  valueSequence = v5->_valueSequence;
  v5->_valueSequence = (NSArray *)v29;

  uint64_t v31 = [v7 copy];
  valueDictionary = v5->_valueDictionary;
  v5->_valueDictionary = (NSArray *)v31;

  int v33 = v4[*v10];
  if (v33) {
LABEL_37:
  }
    v34 = 0;
  else {
LABEL_35:
  }
    v34 = v5;

  return v34;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriRemembersFieldFieldValue *)self valueSequence];
  id v5 = [(BMSiriRemembersFieldFieldValue *)self valueDictionary];
  uint64_t v6 = [(BMSiriRemembersFieldFieldValue *)self value];
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMSiriRemembersFieldFieldValue with valueSequence: %@, valueDictionary: %@, value: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMSiriRemembersFieldFieldValue)initWithValueSequence:(id)a3 valueDictionary:(id)a4 value:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMSiriRemembersFieldFieldValue;
  char v12 = [(BMEventBase *)&v14 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_valueSequence, a3);
    objc_storeStrong((id *)&v12->_valueDictionary, a4);
    objc_storeStrong((id *)&v12->_value, a5);
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"valueSequence" number:1 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"valueDictionary", 2, 14, objc_opt_class(), v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"value" number:3 type:14 subMessageClass:objc_opt_class()];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4008;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"valueSequence_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_205];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"valueDictionary_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_207];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"value_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_209];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

id __41__BMSiriRemembersFieldFieldValue_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 value];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __41__BMSiriRemembersFieldFieldValue_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _valueDictionaryJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __41__BMSiriRemembersFieldFieldValue_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _valueSequenceJSONArray];
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
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMSiriRemembersFieldFieldValue alloc] initByReadFrom:v7];
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
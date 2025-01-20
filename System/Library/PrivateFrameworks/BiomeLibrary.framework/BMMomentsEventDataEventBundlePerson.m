@interface BMMomentsEventDataEventBundlePerson
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMomentsEventDataEventBundlePerson)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMomentsEventDataEventBundlePerson)initWithPersonRelationships:(id)a3 isMEPerson:(id)a4 significanceScore:(id)a5;
- (BOOL)hasIsMEPerson;
- (BOOL)hasSignificanceScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMEPerson;
- (NSArray)personRelationships;
- (NSString)description;
- (double)significanceScore;
- (id)_personRelationshipsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasIsMEPerson:(BOOL)a3;
- (void)setHasSignificanceScore:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMomentsEventDataEventBundlePerson

- (void).cxx_destruct
{
}

- (void)setHasSignificanceScore:(BOOL)a3
{
  self->_hasSignificanceScore = a3;
}

- (BOOL)hasSignificanceScore
{
  return self->_hasSignificanceScore;
}

- (double)significanceScore
{
  return self->_significanceScore;
}

- (void)setHasIsMEPerson:(BOOL)a3
{
  self->_hasIsMEPerson = a3;
}

- (BOOL)hasIsMEPerson
{
  return self->_hasIsMEPerson;
}

- (BOOL)isMEPerson
{
  return self->_isMEPerson;
}

- (NSArray)personRelationships
{
  return self->_personRelationships;
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
    v6 = [(BMMomentsEventDataEventBundlePerson *)self personRelationships];
    uint64_t v7 = [v5 personRelationships];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMomentsEventDataEventBundlePerson *)self personRelationships];
      v10 = [v5 personRelationships];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_17;
      }
    }
    if (![(BMMomentsEventDataEventBundlePerson *)self hasIsMEPerson]
      && ![v5 hasIsMEPerson]
      || [(BMMomentsEventDataEventBundlePerson *)self hasIsMEPerson]
      && [v5 hasIsMEPerson]
      && (int v13 = [(BMMomentsEventDataEventBundlePerson *)self isMEPerson],
          v13 == [v5 isMEPerson]))
    {
      if (![(BMMomentsEventDataEventBundlePerson *)self hasSignificanceScore]
        && ![v5 hasSignificanceScore])
      {
        BOOL v12 = 1;
        goto LABEL_18;
      }
      if ([(BMMomentsEventDataEventBundlePerson *)self hasSignificanceScore]
        && [v5 hasSignificanceScore])
      {
        [(BMMomentsEventDataEventBundlePerson *)self significanceScore];
        double v15 = v14;
        [v5 significanceScore];
        BOOL v12 = v15 == v16;
LABEL_18:

        goto LABEL_19;
      }
    }
LABEL_17:
    BOOL v12 = 0;
    goto LABEL_18;
  }
  BOOL v12 = 0;
LABEL_19:

  return v12;
}

- (id)jsonDictionary
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMomentsEventDataEventBundlePerson *)self _personRelationshipsJSONArray];
  if ([(BMMomentsEventDataEventBundlePerson *)self hasIsMEPerson])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundlePerson isMEPerson](self, "isMEPerson"));
  }
  else
  {
    id v4 = 0;
  }
  if (![(BMMomentsEventDataEventBundlePerson *)self hasSignificanceScore]
    || ([(BMMomentsEventDataEventBundlePerson *)self significanceScore], fabs(v5) == INFINITY))
  {
    uint64_t v7 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundlePerson *)self significanceScore];
    v6 = NSNumber;
    [(BMMomentsEventDataEventBundlePerson *)self significanceScore];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  }
  v13[0] = @"personRelationships";
  v8 = v3;
  if (!v3)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v8;
  v13[1] = @"isMEPerson";
  v9 = v4;
  if (!v4)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v9;
  v13[2] = @"significanceScore";
  v10 = v7;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v10;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  if (v7)
  {
    if (v4) {
      goto LABEL_16;
    }
LABEL_21:

    if (v3) {
      goto LABEL_17;
    }
    goto LABEL_22;
  }

  if (!v4) {
    goto LABEL_21;
  }
LABEL_16:
  if (v3) {
    goto LABEL_17;
  }
LABEL_22:

LABEL_17:

  return v11;
}

- (id)_personRelationshipsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMomentsEventDataEventBundlePerson *)self personRelationships];
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

- (BMMomentsEventDataEventBundlePerson)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"personRelationships"];
  uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    v38 = self;
    v40 = v5;

    id v6 = 0;
  }
  else
  {
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v31 = *MEMORY[0x1E4F502C8];
          uint64_t v57 = *MEMORY[0x1E4F28568];
          v42 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"personRelationships"];
          v58[0] = v42;
          id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:&v57 count:1];
          v21 = 0;
          *a4 = (id)[v30 initWithDomain:v31 code:2 userInfo:v18];
          goto LABEL_35;
        }
        v21 = 0;
        goto LABEL_36;
      }
    }
    v38 = self;
    v40 = v5;
  }
  v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v6 = v6;
  uint64_t v9 = [v6 countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v45;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v45 != v11) {
        objc_enumerationMutation(v6);
      }
      long long v13 = *(void **)(*((void *)&v44 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = a4;
        if (a4)
        {
          id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v24 = *MEMORY[0x1E4F502C8];
          uint64_t v54 = *MEMORY[0x1E4F28568];
          id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"personRelationships"];
          id v55 = v14;
          v25 = (void *)MEMORY[0x1E4F1C9E8];
          v26 = &v55;
          v27 = &v54;
LABEL_28:
          id v20 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:1];
          id v28 = (id)[v23 initWithDomain:v24 code:2 userInfo:v20];
          v21 = 0;
          id *v22 = v28;
LABEL_32:
          id v18 = v6;
          self = v38;
          id v5 = v40;
          goto LABEL_33;
        }
LABEL_39:
        v21 = 0;
        id v18 = v6;
        self = v38;
        id v5 = v40;
        goto LABEL_35;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = a4;
        if (a4)
        {
          id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v24 = *MEMORY[0x1E4F502C8];
          uint64_t v52 = *MEMORY[0x1E4F28568];
          id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"personRelationships"];
          id v53 = v14;
          v25 = (void *)MEMORY[0x1E4F1C9E8];
          v26 = &v53;
          v27 = &v52;
          goto LABEL_28;
        }
        goto LABEL_39;
      }
      id v14 = v13;
      double v15 = [BMMomentsEventDataEventBundlePersonPersonRelationship alloc];
      id v43 = 0;
      uint64_t v16 = [(BMMomentsEventDataEventBundlePersonPersonRelationship *)v15 initWithJSONDictionary:v14 error:&v43];
      id v17 = v43;
      if (v17)
      {
        id v20 = v17;
        if (a4) {
          *a4 = v17;
        }

        v21 = 0;
        goto LABEL_32;
      }
      [v42 addObject:v16];
    }
    uint64_t v10 = [v6 countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_16:

  id v5 = v40;
  id v14 = [v40 objectForKeyedSubscript:@"isMEPerson"];
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    self = v38;
    if (objc_opt_isKindOfClass())
    {
      id v18 = v14;
      goto LABEL_19;
    }
    if (a4)
    {
      id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v33 = *MEMORY[0x1E4F502C8];
      uint64_t v50 = *MEMORY[0x1E4F28568];
      id v20 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isMEPerson"];
      id v51 = v20;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      id v34 = (id)[v32 initWithDomain:v33 code:2 userInfo:v19];
      v21 = 0;
      id v18 = 0;
      *a4 = v34;
      goto LABEL_23;
    }
    id v18 = 0;
    v21 = 0;
  }
  else
  {
    id v18 = 0;
    self = v38;
LABEL_19:
    v19 = [v40 objectForKeyedSubscript:@"significanceScore"];
    if (!v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v20 = 0;
      goto LABEL_22;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = v19;
LABEL_22:
      self = [(BMMomentsEventDataEventBundlePerson *)self initWithPersonRelationships:v42 isMEPerson:v18 significanceScore:v20];
      v21 = self;
    }
    else
    {
      if (a4)
      {
        id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v39 = *MEMORY[0x1E4F502C8];
        uint64_t v48 = *MEMORY[0x1E4F28568];
        v36 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"significanceScore"];
        v49 = v36;
        v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        *a4 = (id)[v35 initWithDomain:v39 code:2 userInfo:v37];
      }
      id v20 = 0;
      v21 = 0;
    }
LABEL_23:

LABEL_33:
  }

LABEL_35:
LABEL_36:

  return v21;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMomentsEventDataEventBundlePerson *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_personRelationships;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_hasIsMEPerson) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasSignificanceScore) {
    PBDataWriterWriteDoubleField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)BMMomentsEventDataEventBundlePerson;
  id v5 = [(BMEventBase *)&v39 init];
  if (!v5) {
    goto LABEL_46;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v10 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v7;
        uint64_t v15 = *(void *)&v4[v14];
        unint64_t v16 = v15 + 1;
        if (v15 == -1 || v16 > *(void *)&v4[*v8]) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        BOOL v18 = v12++ >= 9;
        if (v18)
        {
          unint64_t v13 = 0;
          int v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v19 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v19 || (v13 & 7) == 4) {
        break;
      }
      unint64_t v21 = v13 >> 3;
      if ((v13 >> 3) == 3)
      {
        v5->_hasSignificanceScore = 1;
        uint64_t v24 = *v7;
        unint64_t v25 = *(void *)&v4[v24];
        if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)&v4[*v8])
        {
          double v26 = *(double *)(*(void *)&v4[*v10] + v25);
          *(void *)&v4[v24] = v25 + 8;
        }
        else
        {
          v4[*v9] = 1;
          double v26 = 0.0;
        }
        v5->_significanceScore = v26;
      }
      else if (v21 == 2)
      {
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v29 = 0;
        v5->_hasIsMEPerson = 1;
        while (1)
        {
          uint64_t v30 = *v7;
          uint64_t v31 = *(void *)&v4[v30];
          unint64_t v32 = v31 + 1;
          if (v31 == -1 || v32 > *(void *)&v4[*v8]) {
            break;
          }
          char v33 = *(unsigned char *)(*(void *)&v4[*v10] + v31);
          *(void *)&v4[v30] = v32;
          v29 |= (unint64_t)(v33 & 0x7F) << v27;
          if ((v33 & 0x80) == 0) {
            goto LABEL_38;
          }
          v27 += 7;
          BOOL v18 = v28++ >= 9;
          if (v18)
          {
            uint64_t v29 = 0;
            goto LABEL_40;
          }
        }
        v4[*v9] = 1;
LABEL_38:
        if (v4[*v9]) {
          uint64_t v29 = 0;
        }
LABEL_40:
        v5->_isMEPerson = v29 != 0;
      }
      else if (v21 == 1)
      {
        uint64_t v40 = 0;
        uint64_t v41 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (id v22 = [[BMMomentsEventDataEventBundlePersonPersonRelationship alloc] initByReadFrom:v4]) == 0)
        {
LABEL_48:

          goto LABEL_45;
        }
        id v23 = v22;
        [v6 addObject:v22];
        PBReaderRecallMark();
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_48;
      }
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v34 = [v6 copy];
  personRelationships = v5->_personRelationships;
  v5->_personRelationships = (NSArray *)v34;

  int v36 = v4[*v9];
  if (v36) {
LABEL_45:
  }
    v37 = 0;
  else {
LABEL_46:
  }
    v37 = v5;

  return v37;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMomentsEventDataEventBundlePerson *)self personRelationships];
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundlePerson isMEPerson](self, "isMEPerson"));
  uint64_t v6 = NSNumber;
  [(BMMomentsEventDataEventBundlePerson *)self significanceScore];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v8 = (void *)[v3 initWithFormat:@"BMMomentsEventDataEventBundlePerson with personRelationships: %@, isMEPerson: %@, significanceScore: %@", v4, v5, v7];

  return (NSString *)v8;
}

- (BMMomentsEventDataEventBundlePerson)initWithPersonRelationships:(id)a3 isMEPerson:(id)a4 significanceScore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMMomentsEventDataEventBundlePerson;
  unsigned int v12 = [(BMEventBase *)&v15 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_personRelationships, a3);
    if (v10)
    {
      v12->_hasIsMEPerson = 1;
      v12->_isMEPerson = [v10 BOOLValue];
    }
    else
    {
      v12->_hasIsMEPerson = 0;
      v12->_isMEPerson = 0;
    }
    if (v11)
    {
      v12->_hasSignificanceScore = 1;
      [v11 doubleValue];
    }
    else
    {
      v12->_hasSignificanceScore = 0;
      double v13 = -1.0;
    }
    v12->_significanceScore = v13;
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"personRelationships" number:1 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"isMEPerson", 2, 12, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"significanceScore" number:3 type:0 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF32E8;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"personRelationships_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_2770];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isMEPerson" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"significanceScore" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

id __46__BMMomentsEventDataEventBundlePerson_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _personRelationshipsJSONArray];
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

    uint64_t v8 = [[BMMomentsEventDataEventBundlePerson alloc] initByReadFrom:v7];
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

@end
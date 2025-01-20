@interface BMContextualUnderstandingPhysicalSocial
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMContextualUnderstandingPhysicalSocial)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMContextualUnderstandingPhysicalSocial)initWithLocalIdentifier:(id)a3 discoveredPeople:(id)a4 startTimeInSecondsSinceReferenceDate:(id)a5 endTimeInSecondsSinceReferenceDate:(id)a6;
- (BOOL)hasEndTimeInSecondsSinceReferenceDate;
- (BOOL)hasStartTimeInSecondsSinceReferenceDate;
- (BOOL)isEqual:(id)a3;
- (NSArray)discoveredPeople;
- (NSString)description;
- (NSString)localIdentifier;
- (double)endTimeInSecondsSinceReferenceDate;
- (double)startTimeInSecondsSinceReferenceDate;
- (id)_discoveredPeopleJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasEndTimeInSecondsSinceReferenceDate:(BOOL)a3;
- (void)setHasStartTimeInSecondsSinceReferenceDate:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMContextualUnderstandingPhysicalSocial

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredPeople, 0);

  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

- (void)setHasEndTimeInSecondsSinceReferenceDate:(BOOL)a3
{
  self->_hasEndTimeInSecondsSinceReferenceDate = a3;
}

- (BOOL)hasEndTimeInSecondsSinceReferenceDate
{
  return self->_hasEndTimeInSecondsSinceReferenceDate;
}

- (double)endTimeInSecondsSinceReferenceDate
{
  return self->_endTimeInSecondsSinceReferenceDate;
}

- (void)setHasStartTimeInSecondsSinceReferenceDate:(BOOL)a3
{
  self->_hasStartTimeInSecondsSinceReferenceDate = a3;
}

- (BOOL)hasStartTimeInSecondsSinceReferenceDate
{
  return self->_hasStartTimeInSecondsSinceReferenceDate;
}

- (double)startTimeInSecondsSinceReferenceDate
{
  return self->_startTimeInSecondsSinceReferenceDate;
}

- (NSArray)discoveredPeople
{
  return self->_discoveredPeople;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
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
    v6 = [(BMContextualUnderstandingPhysicalSocial *)self localIdentifier];
    uint64_t v7 = [v5 localIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMContextualUnderstandingPhysicalSocial *)self localIdentifier];
      v10 = [v5 localIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_21;
      }
    }
    v13 = [(BMContextualUnderstandingPhysicalSocial *)self discoveredPeople];
    uint64_t v14 = [v5 discoveredPeople];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMContextualUnderstandingPhysicalSocial *)self discoveredPeople];
      v17 = [v5 discoveredPeople];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_21;
      }
    }
    if (!-[BMContextualUnderstandingPhysicalSocial hasStartTimeInSecondsSinceReferenceDate](self, "hasStartTimeInSecondsSinceReferenceDate")&& ![v5 hasStartTimeInSecondsSinceReferenceDate]|| -[BMContextualUnderstandingPhysicalSocial hasStartTimeInSecondsSinceReferenceDate](self, "hasStartTimeInSecondsSinceReferenceDate")&& objc_msgSend(v5, "hasStartTimeInSecondsSinceReferenceDate")&& (-[BMContextualUnderstandingPhysicalSocial startTimeInSecondsSinceReferenceDate](self, "startTimeInSecondsSinceReferenceDate"), double v20 = v19, objc_msgSend(v5, "startTimeInSecondsSinceReferenceDate"), v20 == v21))
    {
      if (!-[BMContextualUnderstandingPhysicalSocial hasEndTimeInSecondsSinceReferenceDate](self, "hasEndTimeInSecondsSinceReferenceDate")&& ![v5 hasEndTimeInSecondsSinceReferenceDate])
      {
        BOOL v12 = 1;
        goto LABEL_22;
      }
      if (-[BMContextualUnderstandingPhysicalSocial hasEndTimeInSecondsSinceReferenceDate](self, "hasEndTimeInSecondsSinceReferenceDate")&& [v5 hasEndTimeInSecondsSinceReferenceDate])
      {
        [(BMContextualUnderstandingPhysicalSocial *)self endTimeInSecondsSinceReferenceDate];
        double v23 = v22;
        [v5 endTimeInSecondsSinceReferenceDate];
        BOOL v12 = v23 == v24;
LABEL_22:

        goto LABEL_23;
      }
    }
LABEL_21:
    BOOL v12 = 0;
    goto LABEL_22;
  }
  BOOL v12 = 0;
LABEL_23:

  return v12;
}

- (id)jsonDictionary
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMContextualUnderstandingPhysicalSocial *)self localIdentifier];
  id v4 = [(BMContextualUnderstandingPhysicalSocial *)self _discoveredPeopleJSONArray];
  if (![(BMContextualUnderstandingPhysicalSocial *)self hasStartTimeInSecondsSinceReferenceDate]|| ([(BMContextualUnderstandingPhysicalSocial *)self startTimeInSecondsSinceReferenceDate], fabs(v5) == INFINITY))
  {
    uint64_t v7 = 0;
  }
  else
  {
    [(BMContextualUnderstandingPhysicalSocial *)self startTimeInSecondsSinceReferenceDate];
    v6 = NSNumber;
    [(BMContextualUnderstandingPhysicalSocial *)self startTimeInSecondsSinceReferenceDate];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  }
  if (![(BMContextualUnderstandingPhysicalSocial *)self hasEndTimeInSecondsSinceReferenceDate]|| ([(BMContextualUnderstandingPhysicalSocial *)self endTimeInSecondsSinceReferenceDate], fabs(v8) == INFINITY))
  {
    v10 = 0;
  }
  else
  {
    [(BMContextualUnderstandingPhysicalSocial *)self endTimeInSecondsSinceReferenceDate];
    v9 = NSNumber;
    [(BMContextualUnderstandingPhysicalSocial *)self endTimeInSecondsSinceReferenceDate];
    v10 = objc_msgSend(v9, "numberWithDouble:");
  }
  v17[0] = @"localIdentifier";
  int v11 = v3;
  if (!v3)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[0] = v11;
  v17[1] = @"discoveredPeople";
  BOOL v12 = v4;
  if (!v4)
  {
    BOOL v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[1] = v12;
  v17[2] = @"startTimeInSecondsSinceReferenceDate";
  v13 = v7;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[2] = v13;
  v17[3] = @"endTimeInSecondsSinceReferenceDate";
  uint64_t v14 = v10;
  if (!v10)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[3] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  if (v10)
  {
    if (v7) {
      goto LABEL_19;
    }
  }
  else
  {

    if (v7)
    {
LABEL_19:
      if (v4) {
        goto LABEL_20;
      }
LABEL_26:

      if (v3) {
        goto LABEL_21;
      }
      goto LABEL_27;
    }
  }

  if (!v4) {
    goto LABEL_26;
  }
LABEL_20:
  if (v3) {
    goto LABEL_21;
  }
LABEL_27:

LABEL_21:

  return v15;
}

- (id)_discoveredPeopleJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMContextualUnderstandingPhysicalSocial *)self discoveredPeople];
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

- (BMContextualUnderstandingPhysicalSocial)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"localIdentifier"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v22 = *MEMORY[0x1E4F502C8];
        uint64_t v67 = *MEMORY[0x1E4F28568];
        id v8 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"localIdentifier"];
        v68[0] = v8;
        v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
        double v23 = 0;
        id v7 = 0;
        *a4 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2);

        goto LABEL_50;
      }
      double v23 = 0;
      id v7 = 0;
      goto LABEL_51;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [v5 objectForKeyedSubscript:@"discoveredPeople"];
  v9 = [MEMORY[0x1E4F1CA98] null];
  int v10 = [v8 isEqual:v9];

  v47 = v6;
  if (v10)
  {
    id v43 = v7;
    v45 = self;

    id v8 = 0;
LABEL_9:
    v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v8 = v8;
    uint64_t v11 = [v8 countByEnumeratingWithState:&v52 objects:v64 count:16];
    if (!v11) {
      goto LABEL_19;
    }
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v53;
    id v42 = v5;
LABEL_11:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v53 != v13) {
        objc_enumerationMutation(v8);
      }
      v15 = *(void **)(*((void *)&v52 + 1) + 8 * v14);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v24 = a4;
        if (a4)
        {
          id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v26 = *MEMORY[0x1E4F502C8];
          uint64_t v60 = *MEMORY[0x1E4F28568];
          id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"discoveredPeople"];
          id v61 = v16;
          v27 = (void *)MEMORY[0x1E4F1C9E8];
          v28 = &v61;
          v29 = &v60;
          goto LABEL_30;
        }
        goto LABEL_37;
      }
      id v16 = v15;
      v17 = [BMContextualUnderstandingPhysicalSocialPerson alloc];
      id v51 = 0;
      int v18 = [(BMContextualUnderstandingPhysicalSocialPerson *)v17 initWithJSONDictionary:v16 error:&v51];
      id v19 = v51;
      if (v19)
      {
        id v30 = v19;
        if (a4) {
          *a4 = v19;
        }

        double v23 = 0;
        goto LABEL_34;
      }
      [v49 addObject:v18];

      if (v12 == ++v14)
      {
        uint64_t v12 = [v8 countByEnumeratingWithState:&v52 objects:v64 count:16];
        id v5 = v42;
        if (v12) {
          goto LABEL_11;
        }
LABEL_19:

        id v16 = [v5 objectForKeyedSubscript:@"startTimeInSecondsSinceReferenceDate"];
        if (!v16)
        {
          id v20 = 0;
          id v7 = v43;
          self = v45;
          goto LABEL_41;
        }
        objc_opt_class();
        id v7 = v43;
        self = v45;
        if (objc_opt_isKindOfClass())
        {
          id v20 = 0;
LABEL_41:
          v35 = [v5 objectForKeyedSubscript:@"endTimeInSecondsSinceReferenceDate"];
          if (!v35 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v30 = 0;
            goto LABEL_44;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v30 = v35;
LABEL_44:
            self = [(BMContextualUnderstandingPhysicalSocial *)self initWithLocalIdentifier:v7 discoveredPeople:v49 startTimeInSecondsSinceReferenceDate:v20 endTimeInSecondsSinceReferenceDate:v30];
            double v23 = self;
          }
          else
          {
            if (a4)
            {
              id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v44 = *MEMORY[0x1E4F502C8];
              uint64_t v56 = *MEMORY[0x1E4F28568];
              v39 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"endTimeInSecondsSinceReferenceDate"];
              v57 = v39;
              v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
              *a4 = (id)[v46 initWithDomain:v44 code:2 userInfo:v40];
            }
            id v30 = 0;
            double v23 = 0;
          }
LABEL_45:

LABEL_46:
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v20 = v16;
            goto LABEL_41;
          }
          if (a4)
          {
            id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v37 = *MEMORY[0x1E4F502C8];
            uint64_t v58 = *MEMORY[0x1E4F28568];
            id v30 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"startTimeInSecondsSinceReferenceDate"];
            id v59 = v30;
            v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
            id v38 = (id)[v41 initWithDomain:v37 code:2 userInfo:v35];
            double v23 = 0;
            id v20 = 0;
            *a4 = v38;
            goto LABEL_45;
          }
          id v20 = 0;
          double v23 = 0;
        }

LABEL_48:
        uint64_t v6 = v47;

        goto LABEL_50;
      }
    }
    double v24 = a4;
    if (a4)
    {
      id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v26 = *MEMORY[0x1E4F502C8];
      uint64_t v62 = *MEMORY[0x1E4F28568];
      id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"discoveredPeople"];
      id v63 = v16;
      v27 = (void *)MEMORY[0x1E4F1C9E8];
      v28 = &v63;
      v29 = &v62;
LABEL_30:
      id v30 = [v27 dictionaryWithObjects:v28 forKeys:v29 count:1];
      id v31 = (id)[v25 initWithDomain:v26 code:2 userInfo:v30];
      double v23 = 0;
      *double v24 = v31;
LABEL_34:
      id v20 = v8;
      id v5 = v42;
      id v7 = v43;
      self = v45;
      goto LABEL_46;
    }
LABEL_37:
    double v23 = 0;
    id v20 = v8;
    id v5 = v42;
    id v7 = v43;
    self = v45;
    goto LABEL_48;
  }
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v43 = v7;
    v45 = self;
    goto LABEL_9;
  }
  if (a4)
  {
    id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v33 = *MEMORY[0x1E4F502C8];
    uint64_t v65 = *MEMORY[0x1E4F28568];
    v49 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"discoveredPeople"];
    v66 = v49;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    id v34 = (id)[v32 initWithDomain:v33 code:2 userInfo:v20];
    double v23 = 0;
    *a4 = v34;
    goto LABEL_48;
  }
  double v23 = 0;
LABEL_50:

LABEL_51:
  return v23;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMContextualUnderstandingPhysicalSocial *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_localIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_discoveredPeople;
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
        int v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_hasStartTimeInSecondsSinceReferenceDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasEndTimeInSecondsSinceReferenceDate) {
    PBDataWriterWriteDoubleField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMContextualUnderstandingPhysicalSocial;
  id v5 = [(BMEventBase *)&v36 init];
  if (!v5)
  {
LABEL_40:
    id v34 = v5;
    goto LABEL_41;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_38:
    uint64_t v31 = [v6 copy];
    discoveredPeople = v5->_discoveredPeople;
    v5->_discoveredPeople = (NSArray *)v31;

    int v33 = v4[*v9];
    if (v33) {
      goto LABEL_39;
    }
    goto LABEL_40;
  }
  int v10 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v9]) {
      goto LABEL_38;
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
      if (v12++ >= 9)
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
      goto LABEL_38;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v21 = PBReaderReadString();
        localIdentifier = v5->_localIdentifier;
        v5->_localIdentifier = (NSString *)v21;

        goto LABEL_37;
      case 2u:
        uint64_t v37 = 0;
        uint64_t v38 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_42;
        }
        id v23 = [[BMContextualUnderstandingPhysicalSocialPerson alloc] initByReadFrom:v4];
        if (!v23) {
          goto LABEL_42;
        }
        double v24 = v23;
        [v6 addObject:v23];
        PBReaderRecallMark();

        goto LABEL_37;
      case 3u:
        v5->_hasStartTimeInSecondsSinceReferenceDate = 1;
        uint64_t v25 = *v7;
        unint64_t v26 = *(void *)&v4[v25];
        if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)&v4[*v8])
        {
          v27 = *(objc_class **)(*(void *)&v4[*v10] + v26);
          *(void *)&v4[v25] = v26 + 8;
        }
        else
        {
          v4[*v9] = 1;
          v27 = 0;
        }
        uint64_t v30 = 40;
        goto LABEL_36;
      case 4u:
        v5->_hasEndTimeInSecondsSinceReferenceDate = 1;
        uint64_t v28 = *v7;
        unint64_t v29 = *(void *)&v4[v28];
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)&v4[*v8])
        {
          v27 = *(objc_class **)(*(void *)&v4[*v10] + v29);
          *(void *)&v4[v28] = v29 + 8;
        }
        else
        {
          v4[*v9] = 1;
          v27 = 0;
        }
        uint64_t v30 = 48;
LABEL_36:
        *(Class *)((char *)&v5->super.super.isa + v30) = v27;
        goto LABEL_37;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_37:
          if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
            goto LABEL_38;
          }
          continue;
        }
LABEL_42:

LABEL_39:
        id v34 = 0;
LABEL_41:

        return v34;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMContextualUnderstandingPhysicalSocial *)self localIdentifier];
  id v5 = [(BMContextualUnderstandingPhysicalSocial *)self discoveredPeople];
  uint64_t v6 = NSNumber;
  [(BMContextualUnderstandingPhysicalSocial *)self startTimeInSecondsSinceReferenceDate];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v8 = NSNumber;
  [(BMContextualUnderstandingPhysicalSocial *)self endTimeInSecondsSinceReferenceDate];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  int v10 = (void *)[v3 initWithFormat:@"BMContextualUnderstandingPhysicalSocial with localIdentifier: %@, discoveredPeople: %@, startTimeInSecondsSinceReferenceDate: %@, endTimeInSecondsSinceReferenceDate: %@", v4, v5, v7, v9];

  return (NSString *)v10;
}

- (BMContextualUnderstandingPhysicalSocial)initWithLocalIdentifier:(id)a3 discoveredPeople:(id)a4 startTimeInSecondsSinceReferenceDate:(id)a5 endTimeInSecondsSinceReferenceDate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BMContextualUnderstandingPhysicalSocial;
  uint64_t v15 = [(BMEventBase *)&v19 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v15->_localIdentifier, a3);
    objc_storeStrong((id *)&v15->_discoveredPeople, a4);
    if (v13)
    {
      v15->_hasStartTimeInSecondsSinceReferenceDate = 1;
      [v13 doubleValue];
    }
    else
    {
      v15->_hasStartTimeInSecondsSinceReferenceDate = 0;
      double v16 = -1.0;
    }
    v15->_startTimeInSecondsSinceReferenceDate = v16;
    if (v14)
    {
      v15->_hasEndTimeInSecondsSinceReferenceDate = 1;
      [v14 doubleValue];
    }
    else
    {
      v15->_hasEndTimeInSecondsSinceReferenceDate = 0;
      double v17 = -1.0;
    }
    v15->_endTimeInSecondsSinceReferenceDate = v17;
  }

  return v15;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"localIdentifier" number:1 type:13 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"discoveredPeople" number:2 type:14 subMessageClass:objc_opt_class()];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"startTimeInSecondsSinceReferenceDate" number:3 type:0 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"endTimeInSecondsSinceReferenceDate" number:4 type:0 subMessageClass:0];
  v8[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6228;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"localIdentifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"discoveredPeople_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_62695];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"startTimeInSecondsSinceReferenceDate" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"endTimeInSecondsSinceReferenceDate" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

id __50__BMContextualUnderstandingPhysicalSocial_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _discoveredPeopleJSONArray];
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

    uint64_t v8 = [[BMContextualUnderstandingPhysicalSocial alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      void v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end
@interface BMSiriUserSamplingId
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriUserSamplingId)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriUserSamplingId)initWithSamplingId:(id)a3 effectiveFrom:(id)a4 validityDays:(id)a5 createdOn:(id)a6 adoptedOn:(id)a7 switchedCount:(id)a8;
- (BOOL)hasSwitchedCount;
- (BOOL)hasValidityDays;
- (BOOL)isEqual:(id)a3;
- (NSDate)adoptedOn;
- (NSDate)createdOn;
- (NSDate)effectiveFrom;
- (NSString)description;
- (NSUUID)samplingId;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (unsigned)switchedCount;
- (unsigned)validityDays;
- (void)setHasSwitchedCount:(BOOL)a3;
- (void)setHasValidityDays:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriUserSamplingId

- (void).cxx_destruct
{
}

- (void)setHasSwitchedCount:(BOOL)a3
{
  self->_hasSwitchedCount = a3;
}

- (BOOL)hasSwitchedCount
{
  return self->_hasSwitchedCount;
}

- (unsigned)switchedCount
{
  return self->_switchedCount;
}

- (void)setHasValidityDays:(BOOL)a3
{
  self->_hasValidityDays = a3;
}

- (BOOL)hasValidityDays
{
  return self->_hasValidityDays;
}

- (unsigned)validityDays
{
  return self->_validityDays;
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
    v6 = [(BMSiriUserSamplingId *)self samplingId];
    uint64_t v7 = [v5 samplingId];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriUserSamplingId *)self samplingId];
      v10 = [v5 samplingId];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_29;
      }
    }
    v13 = [(BMSiriUserSamplingId *)self effectiveFrom];
    uint64_t v14 = [v5 effectiveFrom];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriUserSamplingId *)self effectiveFrom];
      v17 = [v5 effectiveFrom];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_29;
      }
    }
    if ([(BMSiriUserSamplingId *)self hasValidityDays]
      || [v5 hasValidityDays])
    {
      if (![(BMSiriUserSamplingId *)self hasValidityDays]) {
        goto LABEL_29;
      }
      if (![v5 hasValidityDays]) {
        goto LABEL_29;
      }
      unsigned int v19 = [(BMSiriUserSamplingId *)self validityDays];
      if (v19 != [v5 validityDays]) {
        goto LABEL_29;
      }
    }
    v20 = [(BMSiriUserSamplingId *)self createdOn];
    uint64_t v21 = [v5 createdOn];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMSiriUserSamplingId *)self createdOn];
      v24 = [v5 createdOn];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_29;
      }
    }
    v26 = [(BMSiriUserSamplingId *)self adoptedOn];
    uint64_t v27 = [v5 adoptedOn];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      v29 = [(BMSiriUserSamplingId *)self adoptedOn];
      v30 = [v5 adoptedOn];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_29;
      }
    }
    if (![(BMSiriUserSamplingId *)self hasSwitchedCount]
      && ![v5 hasSwitchedCount])
    {
      BOOL v12 = 1;
      goto LABEL_30;
    }
    if ([(BMSiriUserSamplingId *)self hasSwitchedCount]
      && [v5 hasSwitchedCount])
    {
      unsigned int v32 = [(BMSiriUserSamplingId *)self switchedCount];
      BOOL v12 = v32 == [v5 switchedCount];
LABEL_30:

      goto LABEL_31;
    }
LABEL_29:
    BOOL v12 = 0;
    goto LABEL_30;
  }
  BOOL v12 = 0;
LABEL_31:

  return v12;
}

- (NSDate)adoptedOn
{
  if (self->_hasRaw_adoptedOn)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_adoptedOn];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)createdOn
{
  if (self->_hasRaw_createdOn)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_createdOn];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)effectiveFrom
{
  if (self->_hasRaw_effectiveFrom)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_effectiveFrom];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSUUID)samplingId
{
  raw_samplingId = self->_raw_samplingId;
  if (raw_samplingId)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_samplingId toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (id)jsonDictionary
{
  v32[6] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriUserSamplingId *)self samplingId];
  uint64_t v4 = [v3 UUIDString];

  id v5 = [(BMSiriUserSamplingId *)self effectiveFrom];
  if (v5)
  {
    v6 = NSNumber;
    uint64_t v7 = [(BMSiriUserSamplingId *)self effectiveFrom];
    [v7 timeIntervalSince1970];
    uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    uint64_t v8 = 0;
  }

  if ([(BMSiriUserSamplingId *)self hasValidityDays])
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriUserSamplingId validityDays](self, "validityDays"));
  }
  else
  {
    v9 = 0;
  }
  v10 = [(BMSiriUserSamplingId *)self createdOn];
  if (v10)
  {
    int v11 = NSNumber;
    BOOL v12 = [(BMSiriUserSamplingId *)self createdOn];
    [v12 timeIntervalSince1970];
    v13 = objc_msgSend(v11, "numberWithDouble:");
  }
  else
  {
    v13 = 0;
  }

  uint64_t v14 = [(BMSiriUserSamplingId *)self adoptedOn];
  if (v14)
  {
    v15 = NSNumber;
    v16 = [(BMSiriUserSamplingId *)self adoptedOn];
    [v16 timeIntervalSince1970];
    v17 = objc_msgSend(v15, "numberWithDouble:");
  }
  else
  {
    v17 = 0;
  }

  if ([(BMSiriUserSamplingId *)self hasSwitchedCount])
  {
    int v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriUserSamplingId switchedCount](self, "switchedCount"));
  }
  else
  {
    int v18 = 0;
  }
  v30 = (void *)v4;
  v31[0] = @"samplingId";
  uint64_t v19 = v4;
  if (!v4)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v27 = v19;
  v29 = (void *)v8;
  v32[0] = v19;
  v31[1] = @"effectiveFrom";
  v20 = (void *)v8;
  if (!v8)
  {
    v20 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v19);
  }
  v32[1] = v20;
  v31[2] = @"validityDays";
  uint64_t v21 = v9;
  if (!v9)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[2] = v21;
  v31[3] = @"createdOn";
  v22 = v13;
  if (!v13)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[3] = v22;
  v31[4] = @"adoptedOn";
  v23 = v17;
  if (!v17)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[4] = v23;
  v31[5] = @"switchedCount";
  v24 = v18;
  if (!v18)
  {
    v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[5] = v24;
  int v25 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v32, v31, 6, v27);
  if (v18)
  {
    if (v17) {
      goto LABEL_30;
    }
  }
  else
  {

    if (v17)
    {
LABEL_30:
      if (v13) {
        goto LABEL_31;
      }
LABEL_41:

      if (v9) {
        goto LABEL_32;
      }
      goto LABEL_42;
    }
  }

  if (!v13) {
    goto LABEL_41;
  }
LABEL_31:
  if (v9) {
    goto LABEL_32;
  }
LABEL_42:

LABEL_32:
  if (!v29) {

  }
  if (!v30) {

  }
  return v25;
}

- (BMSiriUserSamplingId)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v86[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"samplingId"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
    if (!v11)
    {
      if (a4)
      {
        id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
        v52 = a4;
        uint64_t v53 = *MEMORY[0x1E4F502C8];
        uint64_t v85 = *MEMORY[0x1E4F28568];
        v72 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"samplingId"];
        v86[0] = v72;
        v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:&v85 count:1];
        id *v52 = (id)[v51 initWithDomain:v53 code:2 userInfo:v54];

        v22 = 0;
      }
      else
      {
        v22 = 0;
      }
      goto LABEL_50;
    }
    BOOL v12 = (void *)v11;

    id v8 = v12;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"effectiveFrom"];
    v65 = a4;
    v67 = (void *)v9;
    if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v14 = v10;
        id v15 = [v13 alloc];
        [v14 doubleValue];
        double v17 = v16;

        id v18 = (id)[v15 initWithTimeIntervalSince1970:v17];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v70 = [v23 dateFromString:v10];

          goto LABEL_17;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v70 = 0;
            v22 = 0;
LABEL_48:

            goto LABEL_50;
          }
          id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v56 = *MEMORY[0x1E4F502C8];
          uint64_t v81 = *MEMORY[0x1E4F28568];
          id v69 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"effectiveFrom"];
          id v82 = v69;
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
          v70 = 0;
          v22 = 0;
          id *v65 = (id)[v55 initWithDomain:v56 code:2 userInfo:v24];
LABEL_47:

          v10 = v67;
          goto LABEL_48;
        }
        id v18 = v10;
      }
      v70 = v18;
    }
    else
    {
      v70 = 0;
    }
LABEL_17:
    v24 = [v6 objectForKeyedSubscript:@"validityDays"];
    id v68 = v8;
    if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v69 = 0;
          v22 = 0;
          goto LABEL_47;
        }
        id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v79 = *MEMORY[0x1E4F28568];
        v26 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"validityDays"];
        v80 = v26;
        int v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
        id v69 = 0;
        v22 = 0;
        id *v65 = (id)[v33 initWithDomain:v34 code:2 userInfo:v25];
        goto LABEL_46;
      }
      id v69 = v24;
    }
    else
    {
      id v69 = 0;
    }
    int v25 = [v6 objectForKeyedSubscript:@"createdOn"];
    v66 = v7;
    if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v27 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v28 = v25;
        id v29 = [v27 alloc];
        [v28 doubleValue];
        double v31 = v30;

        id v32 = (id)[v29 initWithTimeIntervalSince1970:v31];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v35 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v26 = [v35 dateFromString:v25];

          goto LABEL_32;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v26 = 0;
            v22 = 0;
            goto LABEL_46;
          }
          v37 = self;
          id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v58 = *MEMORY[0x1E4F502C8];
          uint64_t v77 = *MEMORY[0x1E4F28568];
          v38 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"createdOn"];
          v78 = v38;
          v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
          id v59 = (id)[v57 initWithDomain:v58 code:2 userInfo:v36];
          v26 = 0;
          v22 = 0;
          id *v65 = v59;
LABEL_45:

          self = v37;
          uint64_t v7 = v66;
LABEL_46:

          id v8 = v68;
          goto LABEL_47;
        }
        id v32 = v25;
      }
      v26 = v32;
    }
    else
    {
      v26 = 0;
    }
LABEL_32:
    v36 = [v6 objectForKeyedSubscript:@"adoptedOn"];
    if (v36 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v37 = self;
        v39 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v40 = v36;
        id v41 = [v39 alloc];
        [v40 doubleValue];
        double v43 = v42;

        id v44 = (id)[v41 initWithTimeIntervalSince1970:v43];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v37 = self;
          id v45 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v38 = [v45 dateFromString:v36];

          goto LABEL_40;
        }
        objc_opt_class();
        v37 = self;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v65)
          {
            v38 = 0;
            v22 = 0;
            goto LABEL_45;
          }
          id v60 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v61 = *MEMORY[0x1E4F502C8];
          uint64_t v75 = *MEMORY[0x1E4F28568];
          id v47 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"adoptedOn"];
          id v76 = v47;
          v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
          id v62 = (id)[v60 initWithDomain:v61 code:2 userInfo:v46];
          v38 = 0;
          v22 = 0;
          id *v65 = v62;
          goto LABEL_44;
        }
        id v44 = v36;
      }
      v38 = v44;
    }
    else
    {
      v37 = self;
      v38 = 0;
    }
LABEL_40:
    v46 = [v6 objectForKeyedSubscript:@"switchedCount"];
    if (v46 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v65)
        {
          id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v63 = *MEMORY[0x1E4F502C8];
          uint64_t v73 = *MEMORY[0x1E4F28568];
          v49 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"switchedCount"];
          v74 = v49;
          v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
          id *v65 = (id)[v64 initWithDomain:v63 code:2 userInfo:v50];
        }
        id v47 = 0;
        v22 = 0;
        goto LABEL_44;
      }
      id v47 = v46;
    }
    else
    {
      id v47 = 0;
    }
    v22 = [(BMSiriUserSamplingId *)v37 initWithSamplingId:v68 effectiveFrom:v70 validityDays:v69 createdOn:v26 adoptedOn:v38 switchedCount:v47];
    v37 = v22;
LABEL_44:

    goto LABEL_45;
  }
  if (!a4)
  {
    v22 = 0;
    goto LABEL_51;
  }
  id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
  v20 = a4;
  uint64_t v21 = *MEMORY[0x1E4F502C8];
  uint64_t v83 = *MEMORY[0x1E4F28568];
  id v8 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"samplingId"];
  id v84 = v8;
  v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
  v22 = 0;
  id *v20 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v21, 2);

LABEL_50:
LABEL_51:

  return v22;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriUserSamplingId *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_raw_samplingId)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_hasRaw_effectiveFrom)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasValidityDays)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasRaw_createdOn)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasRaw_adoptedOn)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasSwitchedCount)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)BMSiriUserSamplingId;
  id v5 = [(BMEventBase *)&v46 init];
  if (!v5) {
    goto LABEL_66;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
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
          PBReaderReadData();
          v20 = (NSData *)objc_claimAutoreleasedReturnValue();
          if ([(NSData *)v20 length] == 16)
          {
            raw_samplingId = v5->_raw_samplingId;
            v5->_raw_samplingId = v20;

            continue;
          }

          goto LABEL_65;
        case 2u:
          v5->_hasRaw_effectiveFrom = 1;
          uint64_t v34 = *v6;
          unint64_t v35 = *(void *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v35);
            *(void *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v43 = 32;
          goto LABEL_62;
        case 3u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          v5->_hasValidityDays = 1;
          while (2)
          {
            uint64_t v25 = *v6;
            uint64_t v26 = *(void *)&v4[v25];
            unint64_t v27 = v26 + 1;
            if (v26 == -1 || v27 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
              *(void *)&v4[v25] = v27;
              v24 |= (unint64_t)(v28 & 0x7F) << v22;
              if (v28 < 0)
              {
                v22 += 7;
                BOOL v17 = v23++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_50:
          uint64_t v42 = 80;
          goto LABEL_55;
        case 4u:
          v5->_hasRaw_createdOn = 1;
          uint64_t v29 = *v6;
          unint64_t v30 = *(void *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v30);
            *(void *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v43 = 48;
          goto LABEL_62;
        case 5u:
          v5->_hasRaw_adoptedOn = 1;
          uint64_t v32 = *v6;
          unint64_t v33 = *(void *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v33);
            *(void *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v43 = 64;
LABEL_62:
          *(Class *)((char *)&v5->super.super.isa + v43) = v31;
          continue;
        case 6u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v24 = 0;
          v5->_hasSwitchedCount = 1;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_65;
          }
          continue;
      }
      while (1)
      {
        uint64_t v38 = *v6;
        uint64_t v39 = *(void *)&v4[v38];
        unint64_t v40 = v39 + 1;
        if (v39 == -1 || v40 > *(void *)&v4[*v7]) {
          break;
        }
        char v41 = *(unsigned char *)(*(void *)&v4[*v9] + v39);
        *(void *)&v4[v38] = v40;
        v24 |= (unint64_t)(v41 & 0x7F) << v36;
        if ((v41 & 0x80) == 0) {
          goto LABEL_52;
        }
        v36 += 7;
        BOOL v17 = v37++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_54;
        }
      }
      v4[*v8] = 1;
LABEL_52:
      if (v4[*v8]) {
        LODWORD(v24) = 0;
      }
LABEL_54:
      uint64_t v42 = 84;
LABEL_55:
      *(_DWORD *)((char *)&v5->super.super.isa + v42) = v24;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_65:
  }
    id v44 = 0;
  else {
LABEL_66:
  }
    id v44 = v5;

  return v44;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriUserSamplingId *)self samplingId];
  id v5 = [(BMSiriUserSamplingId *)self effectiveFrom];
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriUserSamplingId validityDays](self, "validityDays"));
  uint64_t v7 = [(BMSiriUserSamplingId *)self createdOn];
  id v8 = [(BMSiriUserSamplingId *)self adoptedOn];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriUserSamplingId switchedCount](self, "switchedCount"));
  char v10 = (void *)[v3 initWithFormat:@"BMSiriUserSamplingId with samplingId: %@, effectiveFrom: %@, validityDays: %@, createdOn: %@, adoptedOn: %@, switchedCount: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMSiriUserSamplingId)initWithSamplingId:(id)a3 effectiveFrom:(id)a4 validityDays:(id)a5 createdOn:(id)a6 adoptedOn:(id)a7 switchedCount:(id)a8
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v29.receiver = self;
  v29.super_class = (Class)BMSiriUserSamplingId;
  v20 = [(BMEventBase *)&v29 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v14)
    {
      v30[0] = 0;
      v30[1] = 0;
      [v14 getUUIDBytes:v30];
      uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v30 length:16];
      raw_samplingId = v20->_raw_samplingId;
      v20->_raw_samplingId = (NSData *)v21;
    }
    else
    {
      raw_samplingId = v20->_raw_samplingId;
      v20->_raw_samplingId = 0;
    }

    if (v15)
    {
      v20->_hasRaw_effectiveFrom = 1;
      [v15 timeIntervalSince1970];
    }
    else
    {
      v20->_hasRaw_effectiveFrom = 0;
      double v23 = -1.0;
    }
    v20->_raw_effectiveFrom = v23;
    if (v16)
    {
      v20->_hasValidityDays = 1;
      unsigned int v24 = [v16 unsignedIntValue];
    }
    else
    {
      unsigned int v24 = 0;
      v20->_hasValidityDays = 0;
    }
    v20->_validityDays = v24;
    if (v17)
    {
      v20->_hasRaw_createdOn = 1;
      [v17 timeIntervalSince1970];
    }
    else
    {
      v20->_hasRaw_createdOn = 0;
      double v25 = -1.0;
    }
    v20->_raw_createdOn = v25;
    if (v18)
    {
      v20->_hasRaw_adoptedOn = 1;
      [v18 timeIntervalSince1970];
    }
    else
    {
      v20->_hasRaw_adoptedOn = 0;
      double v26 = -1.0;
    }
    v20->_raw_adoptedOn = v26;
    if (v19)
    {
      v20->_hasSwitchedCount = 1;
      unsigned int v27 = [v19 unsignedIntValue];
    }
    else
    {
      unsigned int v27 = 0;
      v20->_hasSwitchedCount = 0;
    }
    v20->_switchedCount = v27;
  }

  return v20;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"samplingId" number:1 type:14 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"effectiveFrom" number:2 type:0 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"validityDays" number:3 type:4 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"createdOn" number:4 type:0 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"adoptedOn" number:5 type:0 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"switchedCount" number:6 type:4 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6780;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"samplingId" dataType:6 requestOnly:0 fieldNumber:1 protoDataType:14 convertedType:3];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"effectiveFrom" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"validityDays" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"createdOn" dataType:3 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:2];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"adoptedOn" dataType:3 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:2];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"switchedCount" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
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

    id v8 = [[BMSiriUserSamplingId alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[19] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end
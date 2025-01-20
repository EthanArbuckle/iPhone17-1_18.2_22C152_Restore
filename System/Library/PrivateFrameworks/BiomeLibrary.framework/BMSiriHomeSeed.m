@interface BMSiriHomeSeed
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriHomeSeed)initWithHomeIdentifier:(id)a3 seed:(id)a4 effectiveFrom:(id)a5 validityDays:(id)a6 createdOn:(id)a7 adoptedOn:(id)a8 switchedCount:(id)a9;
- (BMSiriHomeSeed)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasSwitchedCount;
- (BOOL)hasValidityDays;
- (BOOL)isEqual:(id)a3;
- (NSDate)adoptedOn;
- (NSDate)createdOn;
- (NSDate)effectiveFrom;
- (NSString)description;
- (NSUUID)homeIdentifier;
- (NSUUID)seed;
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

@implementation BMSiriHomeSeed

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_raw_seed, 0);

  objc_storeStrong((id *)&self->_raw_homeIdentifier, 0);
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
    v6 = [(BMSiriHomeSeed *)self homeIdentifier];
    uint64_t v7 = [v5 homeIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriHomeSeed *)self homeIdentifier];
      v10 = [v5 homeIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_33;
      }
    }
    v13 = [(BMSiriHomeSeed *)self seed];
    uint64_t v14 = [v5 seed];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriHomeSeed *)self seed];
      v17 = [v5 seed];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_33;
      }
    }
    v19 = [(BMSiriHomeSeed *)self effectiveFrom];
    uint64_t v20 = [v5 effectiveFrom];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSiriHomeSeed *)self effectiveFrom];
      v23 = [v5 effectiveFrom];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_33;
      }
    }
    if (-[BMSiriHomeSeed hasValidityDays](self, "hasValidityDays") || [v5 hasValidityDays])
    {
      if (![(BMSiriHomeSeed *)self hasValidityDays]) {
        goto LABEL_33;
      }
      if (![v5 hasValidityDays]) {
        goto LABEL_33;
      }
      unsigned int v25 = [(BMSiriHomeSeed *)self validityDays];
      if (v25 != [v5 validityDays]) {
        goto LABEL_33;
      }
    }
    v26 = [(BMSiriHomeSeed *)self createdOn];
    uint64_t v27 = [v5 createdOn];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      v29 = [(BMSiriHomeSeed *)self createdOn];
      v30 = [v5 createdOn];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_33;
      }
    }
    v32 = [(BMSiriHomeSeed *)self adoptedOn];
    uint64_t v33 = [v5 adoptedOn];
    if (v32 == (void *)v33)
    {
    }
    else
    {
      v34 = (void *)v33;
      v35 = [(BMSiriHomeSeed *)self adoptedOn];
      v36 = [v5 adoptedOn];
      int v37 = [v35 isEqual:v36];

      if (!v37) {
        goto LABEL_33;
      }
    }
    if (![(BMSiriHomeSeed *)self hasSwitchedCount]
      && ![v5 hasSwitchedCount])
    {
      BOOL v12 = 1;
      goto LABEL_34;
    }
    if ([(BMSiriHomeSeed *)self hasSwitchedCount]
      && [v5 hasSwitchedCount])
    {
      unsigned int v38 = [(BMSiriHomeSeed *)self switchedCount];
      BOOL v12 = v38 == [v5 switchedCount];
LABEL_34:

      goto LABEL_35;
    }
LABEL_33:
    BOOL v12 = 0;
    goto LABEL_34;
  }
  BOOL v12 = 0;
LABEL_35:

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

- (NSUUID)seed
{
  raw_seed = self->_raw_seed;
  if (raw_seed)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_seed toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (NSUUID)homeIdentifier
{
  raw_homeIdentifier = self->_raw_homeIdentifier;
  if (raw_homeIdentifier)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_homeIdentifier toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (id)jsonDictionary
{
  v35[7] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriHomeSeed *)self homeIdentifier];
  uint64_t v4 = [v3 UUIDString];

  id v5 = [(BMSiriHomeSeed *)self seed];
  uint64_t v6 = [v5 UUIDString];

  uint64_t v7 = [(BMSiriHomeSeed *)self effectiveFrom];
  if (v7)
  {
    v8 = NSNumber;
    v9 = [(BMSiriHomeSeed *)self effectiveFrom];
    [v9 timeIntervalSince1970];
    uint64_t v33 = objc_msgSend(v8, "numberWithDouble:");
  }
  else
  {
    uint64_t v33 = 0;
  }

  if ([(BMSiriHomeSeed *)self hasValidityDays])
  {
    v32 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriHomeSeed validityDays](self, "validityDays"));
  }
  else
  {
    v32 = 0;
  }
  v10 = [(BMSiriHomeSeed *)self createdOn];
  if (v10)
  {
    int v11 = NSNumber;
    BOOL v12 = [(BMSiriHomeSeed *)self createdOn];
    [v12 timeIntervalSince1970];
    v13 = objc_msgSend(v11, "numberWithDouble:");
  }
  else
  {
    v13 = 0;
  }

  uint64_t v14 = [(BMSiriHomeSeed *)self adoptedOn];
  if (v14)
  {
    v15 = NSNumber;
    v16 = [(BMSiriHomeSeed *)self adoptedOn];
    [v16 timeIntervalSince1970];
    v17 = objc_msgSend(v15, "numberWithDouble:");
  }
  else
  {
    v17 = 0;
  }

  if ([(BMSiriHomeSeed *)self hasSwitchedCount])
  {
    int v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriHomeSeed switchedCount](self, "switchedCount"));
  }
  else
  {
    int v18 = 0;
  }
  v34[0] = @"homeIdentifier";
  uint64_t v19 = v4;
  if (!v4)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)v19;
  int v31 = (void *)v6;
  v35[0] = v19;
  v34[1] = @"seed";
  uint64_t v20 = v6;
  if (!v6)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v20;
  v35[1] = v20;
  v34[2] = @"effectiveFrom";
  v21 = v33;
  if (!v33)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v35[2] = v21;
  v34[3] = @"validityDays";
  v22 = v32;
  if (!v32)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v4;
  v35[3] = v22;
  v34[4] = @"createdOn";
  int v24 = v13;
  if (!v13)
  {
    int v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v35[4] = v24;
  v34[5] = @"adoptedOn";
  unsigned int v25 = v17;
  if (!v17)
  {
    unsigned int v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v35[5] = v25;
  v34[6] = @"switchedCount";
  v26 = v18;
  if (!v18)
  {
    v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v35[6] = v26;
  uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:7];
  if (v18)
  {
    if (v17) {
      goto LABEL_32;
    }
LABEL_43:

    if (v13) {
      goto LABEL_33;
    }
    goto LABEL_44;
  }

  if (!v17) {
    goto LABEL_43;
  }
LABEL_32:
  if (v13) {
    goto LABEL_33;
  }
LABEL_44:

LABEL_33:
  if (!v32) {

  }
  if (!v33) {
  if (v31)
  }
  {
    if (v23) {
      goto LABEL_39;
    }
  }
  else
  {

    if (v23) {
      goto LABEL_39;
    }
  }

LABEL_39:

  return v27;
}

- (BMSiriHomeSeed)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v106[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"homeIdentifier"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
    if (!v15)
    {
      if (!a4)
      {
        v26 = 0;
        goto LABEL_72;
      }
      id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v54 = *MEMORY[0x1E4F502C8];
      uint64_t v105 = *MEMORY[0x1E4F28568];
      v9 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"homeIdentifier"];
      v106[0] = v9;
      v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:&v105 count:1];
      *a4 = (id)[v53 initWithDomain:v54 code:2 userInfo:v55];

      v26 = 0;
      goto LABEL_71;
    }
    v16 = (void *)v15;

    id v8 = v16;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"seed"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      uint64_t v17 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
      if (!v17)
      {
        if (a4)
        {
          id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
          id v85 = v10;
          uint64_t v57 = *MEMORY[0x1E4F502C8];
          uint64_t v101 = *MEMORY[0x1E4F28568];
          v88 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"seed"];
          v102 = v88;
          v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
          uint64_t v59 = v57;
          id v10 = v85;
          *a4 = (id)[v56 initWithDomain:v59 code:2 userInfo:v58];

          v26 = 0;
        }
        else
        {
          v26 = 0;
        }
        goto LABEL_70;
      }
      int v18 = (void *)v17;

      id v10 = v18;
LABEL_7:
      v75 = a4;
      uint64_t v11 = [v6 objectForKeyedSubscript:@"effectiveFrom"];
      id v84 = v10;
      v79 = (void *)v11;
      if (v11 && (BOOL v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v19 = (objc_class *)MEMORY[0x1E4F1C9C8];
          id v20 = v12;
          id v21 = [v19 alloc];
          [v20 doubleValue];
          double v23 = v22;

          id v86 = (id)[v21 initWithTimeIntervalSince1970:v23];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v38 = objc_alloc_init(MEMORY[0x1E4F28D48]);
            id v86 = [v38 dateFromString:v12];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                id v86 = 0;
                v26 = 0;
LABEL_68:

                goto LABEL_70;
              }
              id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v66 = *MEMORY[0x1E4F502C8];
              uint64_t v97 = *MEMORY[0x1E4F28568];
              id v82 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"effectiveFrom"];
              id v98 = v82;
              v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
              uint64_t v67 = v66;
              id v10 = v84;
              id v86 = 0;
              v26 = 0;
              id *v75 = (id)[v65 initWithDomain:v67 code:2 userInfo:v13];
LABEL_67:

              goto LABEL_68;
            }
            id v86 = v12;
          }
        }
      }
      else
      {
        id v86 = 0;
      }
      v13 = [v6 objectForKeyedSubscript:@"validityDays"];
      v78 = v9;
      if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v75)
          {
            id v82 = 0;
            v26 = 0;
            goto LABEL_67;
          }
          id v83 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v39 = *MEMORY[0x1E4F502C8];
          uint64_t v95 = *MEMORY[0x1E4F28568];
          v80 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"validityDays"];
          v96 = v80;
          uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
          id v40 = (id)[v83 initWithDomain:v39 code:2 userInfo:v14];
          id v82 = 0;
          v26 = 0;
          id *v75 = v40;
          goto LABEL_65;
        }
        id v82 = v13;
      }
      else
      {
        id v82 = 0;
      }
      uint64_t v14 = [v6 objectForKeyedSubscript:@"createdOn"];
      v77 = v13;
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v27 = (objc_class *)MEMORY[0x1E4F1C9C8];
          id v28 = v14;
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
            id v41 = objc_alloc_init(MEMORY[0x1E4F28D48]);
            v80 = [v41 dateFromString:v14];

            goto LABEL_39;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v75)
            {
              v80 = 0;
              v26 = 0;
              goto LABEL_66;
            }
            id v43 = v8;
            id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v81 = *MEMORY[0x1E4F502C8];
            uint64_t v93 = *MEMORY[0x1E4F28568];
            v45 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"createdOn"];
            v94 = v45;
            v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
            id v69 = (id)[v68 initWithDomain:v81 code:2 userInfo:v42];
            v80 = 0;
            v26 = 0;
            id *v75 = v69;
            v13 = v77;
            goto LABEL_64;
          }
          id v32 = v14;
        }
        v80 = v32;
      }
      else
      {
        v80 = 0;
      }
LABEL_39:
      v42 = [v6 objectForKeyedSubscript:@"adoptedOn"];
      v76 = v7;
      if (!v42 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v43 = v8;
        v44 = self;
        v45 = 0;
        goto LABEL_59;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v43 = v8;
        v44 = self;
        v46 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v47 = v42;
        id v48 = [v46 alloc];
        [v47 doubleValue];
        double v50 = v49;

        id v51 = (id)[v48 initWithTimeIntervalSince1970:v50];
      }
      else
      {
        v44 = self;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v43 = v8;
          id v52 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v45 = [v52 dateFromString:v42];

          goto LABEL_59;
        }
        objc_opt_class();
        id v43 = v8;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v75)
          {
            v45 = 0;
            v26 = 0;
            uint64_t v7 = v76;
            goto LABEL_64;
          }
          id v74 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v70 = *MEMORY[0x1E4F502C8];
          uint64_t v91 = *MEMORY[0x1E4F28568];
          id v61 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"adoptedOn"];
          id v92 = v61;
          v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
          id v71 = (id)[v74 initWithDomain:v70 code:2 userInfo:v60];
          v45 = 0;
          v26 = 0;
          id *v75 = v71;
          goto LABEL_63;
        }
        id v51 = v42;
      }
      v45 = v51;
LABEL_59:
      v60 = [v6 objectForKeyedSubscript:@"switchedCount"];
      if (v60 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v75)
          {
            id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v72 = *MEMORY[0x1E4F502C8];
            uint64_t v89 = *MEMORY[0x1E4F28568];
            v63 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"switchedCount"];
            v90 = v63;
            v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
            id *v75 = (id)[v73 initWithDomain:v72 code:2 userInfo:v64];
          }
          id v61 = 0;
          v26 = 0;
          goto LABEL_63;
        }
        id v61 = v60;
      }
      else
      {
        id v61 = 0;
      }
      v26 = [(BMSiriHomeSeed *)v44 initWithHomeIdentifier:v43 seed:v84 effectiveFrom:v86 validityDays:v82 createdOn:v80 adoptedOn:v45 switchedCount:v61];
      v44 = v26;
LABEL_63:

      self = v44;
      uint64_t v7 = v76;
LABEL_64:

      id v8 = v43;
LABEL_65:
      id v10 = v84;
LABEL_66:

      v9 = v78;
      goto LABEL_67;
    }
    if (a4)
    {
      id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v34 = *MEMORY[0x1E4F502C8];
      uint64_t v99 = *MEMORY[0x1E4F28568];
      uint64_t v35 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"seed"];
      uint64_t v100 = v35;
      uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
      uint64_t v37 = v34;
      id v10 = (id)v35;
      v87 = (void *)v36;
      v26 = 0;
      *a4 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v37, 2);

LABEL_70:
      goto LABEL_71;
    }
    v26 = 0;
LABEL_71:

LABEL_72:
    goto LABEL_73;
  }
  if (a4)
  {
    id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v25 = *MEMORY[0x1E4F502C8];
    uint64_t v103 = *MEMORY[0x1E4F28568];
    id v8 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"homeIdentifier"];
    id v104 = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
    v26 = 0;
    *a4 = (id)[v24 initWithDomain:v25 code:2 userInfo:v9];
    goto LABEL_71;
  }
  v26 = 0;
LABEL_73:

  return v26;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriHomeSeed *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_raw_homeIdentifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_raw_seed)
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
  v47.receiver = self;
  v47.super_class = (Class)BMSiriHomeSeed;
  id v5 = [(BMEventBase *)&v47 init];
  if (!v5)
  {
LABEL_69:
    v45 = v5;
    goto LABEL_70;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_67:
    if (v4[*v8]) {
      goto LABEL_68;
    }
    goto LABEL_69;
  }
  v9 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v8]) {
      goto LABEL_67;
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
      goto LABEL_67;
    }
    switch((v12 >> 3))
    {
      case 1u:
        id v20 = PBReaderReadData();
        if ([v20 length] != 16) {
          goto LABEL_71;
        }
        uint64_t v21 = 16;
        goto LABEL_26;
      case 2u:
        id v20 = PBReaderReadData();
        if ([v20 length] == 16)
        {
          uint64_t v21 = 24;
LABEL_26:
          double v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

LABEL_66:
          if (*(void *)&v4[*v6] >= *(void *)&v4[*v7]) {
            goto LABEL_67;
          }
          continue;
        }
LABEL_71:

LABEL_68:
        v45 = 0;
LABEL_70:

        return v45;
      case 3u:
        v5->_hasRaw_effectiveFrom = 1;
        uint64_t v23 = *v6;
        unint64_t v24 = *(void *)&v4[v23];
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v7])
        {
          uint64_t v25 = *(objc_class **)(*(void *)&v4[*v9] + v24);
          *(void *)&v4[v23] = v24 + 8;
        }
        else
        {
          v4[*v8] = 1;
          uint64_t v25 = 0;
        }
        uint64_t v44 = 40;
        goto LABEL_65;
      case 4u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        v5->_hasValidityDays = 1;
        while (2)
        {
          uint64_t v29 = *v6;
          uint64_t v30 = *(void *)&v4[v29];
          unint64_t v31 = v30 + 1;
          if (v30 == -1 || v31 > *(void *)&v4[*v7])
          {
            v4[*v8] = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
            *(void *)&v4[v29] = v31;
            v28 |= (unint64_t)(v32 & 0x7F) << v26;
            if (v32 < 0)
            {
              v26 += 7;
              BOOL v17 = v27++ >= 9;
              if (v17)
              {
                LODWORD(v28) = 0;
                goto LABEL_53;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v8]) {
          LODWORD(v28) = 0;
        }
LABEL_53:
        uint64_t v43 = 88;
        goto LABEL_58;
      case 5u:
        v5->_hasRaw_createdOn = 1;
        uint64_t v33 = *v6;
        unint64_t v34 = *(void *)&v4[v33];
        if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(void *)&v4[*v7])
        {
          uint64_t v25 = *(objc_class **)(*(void *)&v4[*v9] + v34);
          *(void *)&v4[v33] = v34 + 8;
        }
        else
        {
          v4[*v8] = 1;
          uint64_t v25 = 0;
        }
        uint64_t v44 = 56;
        goto LABEL_65;
      case 6u:
        v5->_hasRaw_adoptedOn = 1;
        uint64_t v35 = *v6;
        unint64_t v36 = *(void *)&v4[v35];
        if (v36 <= 0xFFFFFFFFFFFFFFF7 && v36 + 8 <= *(void *)&v4[*v7])
        {
          uint64_t v25 = *(objc_class **)(*(void *)&v4[*v9] + v36);
          *(void *)&v4[v35] = v36 + 8;
        }
        else
        {
          v4[*v8] = 1;
          uint64_t v25 = 0;
        }
        uint64_t v44 = 72;
LABEL_65:
        *(Class *)((char *)&v5->super.super.isa + v44) = v25;
        goto LABEL_66;
      case 7u:
        char v37 = 0;
        unsigned int v38 = 0;
        uint64_t v28 = 0;
        v5->_hasSwitchedCount = 1;
        while (2)
        {
          uint64_t v39 = *v6;
          uint64_t v40 = *(void *)&v4[v39];
          unint64_t v41 = v40 + 1;
          if (v40 == -1 || v41 > *(void *)&v4[*v7])
          {
            v4[*v8] = 1;
          }
          else
          {
            char v42 = *(unsigned char *)(*(void *)&v4[*v9] + v40);
            *(void *)&v4[v39] = v41;
            v28 |= (unint64_t)(v42 & 0x7F) << v37;
            if (v42 < 0)
            {
              v37 += 7;
              BOOL v17 = v38++ >= 9;
              if (v17)
              {
                LODWORD(v28) = 0;
                goto LABEL_57;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v8]) {
          LODWORD(v28) = 0;
        }
LABEL_57:
        uint64_t v43 = 92;
LABEL_58:
        *(_DWORD *)((char *)&v5->super.super.isa + v43) = v28;
        goto LABEL_66;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          goto LABEL_68;
        }
        goto LABEL_66;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriHomeSeed *)self homeIdentifier];
  id v5 = [(BMSiriHomeSeed *)self seed];
  id v6 = [(BMSiriHomeSeed *)self effectiveFrom];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriHomeSeed validityDays](self, "validityDays"));
  id v8 = [(BMSiriHomeSeed *)self createdOn];
  v9 = [(BMSiriHomeSeed *)self adoptedOn];
  char v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriHomeSeed switchedCount](self, "switchedCount"));
  unsigned int v11 = (void *)[v3 initWithFormat:@"BMSiriHomeSeed with homeIdentifier: %@, seed: %@, effectiveFrom: %@, validityDays: %@, createdOn: %@, adoptedOn: %@, switchedCount: %@", v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BMSiriHomeSeed)initWithHomeIdentifier:(id)a3 seed:(id)a4 effectiveFrom:(id)a5 validityDays:(id)a6 createdOn:(id)a7 adoptedOn:(id)a8 switchedCount:(id)a9
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v33.receiver = self;
  v33.super_class = (Class)BMSiriHomeSeed;
  double v22 = [(BMEventBase *)&v33 init];
  if (v22)
  {
    v22->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v15)
    {
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      [v15 getUUIDBytes:&v34];
      uint64_t v23 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v34 length:16];
      raw_homeIdentifier = v22->_raw_homeIdentifier;
      v22->_raw_homeIdentifier = (NSData *)v23;
    }
    else
    {
      raw_homeIdentifier = v22->_raw_homeIdentifier;
      v22->_raw_homeIdentifier = 0;
    }

    if (v16)
    {
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      [v16 getUUIDBytes:&v34];
      uint64_t v25 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v34 length:16];
      raw_seed = v22->_raw_seed;
      v22->_raw_seed = (NSData *)v25;
    }
    else
    {
      raw_seed = v22->_raw_seed;
      v22->_raw_seed = 0;
    }

    if (v17)
    {
      v22->_hasRaw_effectiveFrom = 1;
      [v17 timeIntervalSince1970];
    }
    else
    {
      v22->_hasRaw_effectiveFrom = 0;
      double v27 = -1.0;
    }
    v22->_raw_effectiveFrom = v27;
    if (v18)
    {
      v22->_hasValidityDays = 1;
      unsigned int v28 = [v18 unsignedIntValue];
    }
    else
    {
      unsigned int v28 = 0;
      v22->_hasValidityDays = 0;
    }
    v22->_validityDays = v28;
    if (v19)
    {
      v22->_hasRaw_createdOn = 1;
      [v19 timeIntervalSince1970];
    }
    else
    {
      v22->_hasRaw_createdOn = 0;
      double v29 = -1.0;
    }
    v22->_raw_createdOn = v29;
    if (v20)
    {
      v22->_hasRaw_adoptedOn = 1;
      [v20 timeIntervalSince1970];
    }
    else
    {
      v22->_hasRaw_adoptedOn = 0;
      double v30 = -1.0;
    }
    v22->_raw_adoptedOn = v30;
    if (v21)
    {
      v22->_hasSwitchedCount = 1;
      unsigned int v31 = [v21 unsignedIntValue];
    }
    else
    {
      unsigned int v31 = 0;
      v22->_hasSwitchedCount = 0;
    }
    v22->_switchedCount = v31;
  }

  return v22;
}

+ (id)protoFields
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"homeIdentifier" number:1 type:14 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"seed", 2, 14, 0, v2);
  v11[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"effectiveFrom" number:3 type:0 subMessageClass:0];
  v11[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"validityDays" number:4 type:4 subMessageClass:0];
  v11[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"createdOn" number:5 type:0 subMessageClass:0];
  v11[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"adoptedOn" number:6 type:0 subMessageClass:0];
  v11[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"switchedCount" number:7 type:4 subMessageClass:0];
  v11[6] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF52E0;
}

+ (id)columns
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"homeIdentifier" dataType:6 requestOnly:0 fieldNumber:1 protoDataType:14 convertedType:3];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"seed" dataType:6 requestOnly:0 fieldNumber:2 protoDataType:14 convertedType:3];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"effectiveFrom" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"validityDays" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"createdOn" dataType:3 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:2];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"adoptedOn" dataType:3 requestOnly:0 fieldNumber:6 protoDataType:0 convertedType:2];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"switchedCount" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
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

    id v8 = [[BMSiriHomeSeed alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[21] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end
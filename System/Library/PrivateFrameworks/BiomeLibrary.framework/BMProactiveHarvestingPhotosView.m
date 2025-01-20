@interface BMProactiveHarvestingPhotosView
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMProactiveHarvestingPhotosView)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMProactiveHarvestingPhotosView)initWithLocations:(id)a3 absoluteTimestamp:(id)a4 uniqueID:(id)a5 contentProtection:(id)a6 personaId:(id)a7;
- (BOOL)isEqual:(id)a3;
- (NSArray)locations;
- (NSDate)absoluteTimestamp;
- (NSString)contentProtection;
- (NSString)description;
- (NSString)personaId;
- (NSString)uniqueID;
- (id)_locationsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMProactiveHarvestingPhotosView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);

  objc_storeStrong((id *)&self->_locations, 0);
}

- (NSString)personaId
{
  return self->_personaId;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSArray)locations
{
  return self->_locations;
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
    v6 = [(BMProactiveHarvestingPhotosView *)self locations];
    uint64_t v7 = [v5 locations];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMProactiveHarvestingPhotosView *)self locations];
      v10 = [v5 locations];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_17;
      }
    }
    v13 = [(BMProactiveHarvestingPhotosView *)self absoluteTimestamp];
    uint64_t v14 = [v5 absoluteTimestamp];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMProactiveHarvestingPhotosView *)self absoluteTimestamp];
      v17 = [v5 absoluteTimestamp];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_17;
      }
    }
    v19 = [(BMProactiveHarvestingPhotosView *)self uniqueID];
    uint64_t v20 = [v5 uniqueID];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMProactiveHarvestingPhotosView *)self uniqueID];
      v23 = [v5 uniqueID];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_17;
      }
    }
    v25 = [(BMProactiveHarvestingPhotosView *)self contentProtection];
    uint64_t v26 = [v5 contentProtection];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMProactiveHarvestingPhotosView *)self contentProtection];
      v29 = [v5 contentProtection];
      int v30 = [v28 isEqual:v29];

      if (!v30)
      {
LABEL_17:
        char v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    v31 = [(BMProactiveHarvestingPhotosView *)self personaId];
    v32 = [v5 personaId];
    if (v31 == v32)
    {
      char v12 = 1;
    }
    else
    {
      v33 = [(BMProactiveHarvestingPhotosView *)self personaId];
      v34 = [v5 personaId];
      char v12 = [v33 isEqual:v34];
    }
    goto LABEL_23;
  }
  char v12 = 0;
LABEL_24:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v25[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMProactiveHarvestingPhotosView *)self _locationsJSONArray];
  id v4 = [(BMProactiveHarvestingPhotosView *)self absoluteTimestamp];
  if (v4)
  {
    id v5 = NSNumber;
    v6 = [(BMProactiveHarvestingPhotosView *)self absoluteTimestamp];
    [v6 timeIntervalSinceReferenceDate];
    uint64_t v7 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    uint64_t v7 = 0;
  }

  v8 = [(BMProactiveHarvestingPhotosView *)self uniqueID];
  v9 = [(BMProactiveHarvestingPhotosView *)self contentProtection];
  v10 = [(BMProactiveHarvestingPhotosView *)self personaId];
  uint64_t v20 = @"locations";
  uint64_t v11 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v18 = v11;
  v25[0] = v11;
  v21 = @"absoluteTimestamp";
  char v12 = v7;
  if (!v7)
  {
    char v12 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v11, v20, v21);
  }
  v25[1] = v12;
  v22 = @"uniqueID";
  v13 = v8;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[2] = v13;
  v23 = @"contentProtection";
  uint64_t v14 = v9;
  if (!v9)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[3] = v14;
  int v24 = @"personaId";
  v15 = v10;
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v15;
  v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, &v20, 5, v18);
  if (v10)
  {
    if (v9) {
      goto LABEL_16;
    }
  }
  else
  {

    if (v9)
    {
LABEL_16:
      if (v8) {
        goto LABEL_17;
      }
      goto LABEL_24;
    }
  }

  if (v8)
  {
LABEL_17:
    if (v7) {
      goto LABEL_18;
    }
LABEL_25:

    if (v3) {
      goto LABEL_19;
    }
    goto LABEL_26;
  }
LABEL_24:

  if (!v7) {
    goto LABEL_25;
  }
LABEL_18:
  if (v3) {
    goto LABEL_19;
  }
LABEL_26:

LABEL_19:

  return v16;
}

- (id)_locationsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMProactiveHarvestingPhotosView *)self locations];
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

- (BMProactiveHarvestingPhotosView)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v79[1] = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  id v6 = [v60 objectForKeyedSubscript:@"locations"];
  uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    v59 = self;

    id v6 = 0;
LABEL_6:
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v6 = v6;
    uint64_t v10 = [v6 countByEnumeratingWithState:&v61 objects:v77 count:16];
    long long v11 = a4;
    if (!v10) {
      goto LABEL_15;
    }
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v62;
LABEL_8:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v62 != v13) {
        objc_enumerationMutation(v6);
      }
      uint64_t v15 = *(void *)(*((void *)&v61 + 1) + 8 * v14);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v11)
        {
          id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v20 = *MEMORY[0x1E4F502C8];
          uint64_t v73 = *MEMORY[0x1E4F28568];
          v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"locations"];
          v74 = v17;
          v21 = (void *)MEMORY[0x1E4F1C9E8];
          v22 = &v74;
          v23 = &v73;
          goto LABEL_22;
        }
        goto LABEL_23;
      }
      [v9 addObject:v15];
      if (v12 == ++v14)
      {
        uint64_t v12 = [v6 countByEnumeratingWithState:&v61 objects:v77 count:16];
        a4 = v11;
        if (v12) {
          goto LABEL_8;
        }
LABEL_15:

        v16 = v60;
        v17 = [v60 objectForKeyedSubscript:@"absoluteTimestamp"];
        if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          uint64_t v18 = 0;
          goto LABEL_32;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v28 = (objc_class *)MEMORY[0x1E4F1C9C8];
          id v29 = v17;
          id v30 = [v28 alloc];
          [v29 doubleValue];
          double v32 = v31;

          v16 = v60;
          id v33 = (id)[v30 initWithTimeIntervalSinceReferenceDate:v32];
          goto LABEL_28;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v34 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          uint64_t v18 = [v34 dateFromString:v17];

          goto LABEL_32;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v33 = v17;
LABEL_28:
          uint64_t v18 = v33;
LABEL_32:
          id v24 = [v16 objectForKeyedSubscript:@"uniqueID"];
          v57 = v24;
          if (v24)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v24 = 0;
              goto LABEL_37;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v24 = v24;
              goto LABEL_37;
            }
            if (a4)
            {
              id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v40 = *MEMORY[0x1E4F502C8];
              uint64_t v69 = *MEMORY[0x1E4F28568];
              uint64_t v41 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"uniqueID"];
              uint64_t v70 = v41;
              [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
              v35 = v42 = a4;
              id v43 = (id)[v39 initWithDomain:v40 code:2 userInfo:v35];
              v25 = 0;
              id v24 = 0;
              id *v42 = v43;
              long long v11 = (id *)v41;
              goto LABEL_45;
            }
            id v24 = 0;
            v25 = 0;
LABEL_46:

LABEL_47:
            goto LABEL_48;
          }
LABEL_37:
          v35 = [v16 objectForKeyedSubscript:@"contentProtection"];
          if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v55 = v35;
              v16 = v60;
              goto LABEL_40;
            }
            if (!v11)
            {
              v25 = 0;
LABEL_45:

              v16 = v60;
              goto LABEL_46;
            }
            id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v44 = *MEMORY[0x1E4F502C8];
            uint64_t v67 = *MEMORY[0x1E4F28568];
            id v37 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contentProtection"];
            id v68 = v37;
            v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
            id v45 = (id)[v56 initWithDomain:v44 code:2 userInfo:v36];
            v25 = 0;
            *long long v11 = v45;
            long long v11 = 0;
          }
          else
          {
            v55 = 0;
LABEL_40:
            v36 = [v16 objectForKeyedSubscript:@"personaId"];
            if (!v36 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v37 = 0;
              goto LABEL_43;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v37 = v36;
LABEL_43:
              long long v11 = v55;
              v25 = [(BMProactiveHarvestingPhotosView *)v59 initWithLocations:v9 absoluteTimestamp:v18 uniqueID:v24 contentProtection:v55 personaId:v37];
              v59 = v25;
            }
            else
            {
              if (v11)
              {
                id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v53 = *MEMORY[0x1E4F502C8];
                uint64_t v65 = *MEMORY[0x1E4F28568];
                v46 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"personaId"];
                v66 = v46;
                v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
                *long long v11 = (id)[v54 initWithDomain:v53 code:2 userInfo:v47];
              }
              id v37 = 0;
              v25 = 0;
              long long v11 = v55;
            }
          }

          goto LABEL_45;
        }
        if (a4)
        {
          id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v49 = *MEMORY[0x1E4F502C8];
          uint64_t v71 = *MEMORY[0x1E4F28568];
          id v24 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
          id v72 = v24;
          uint64_t v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
          v51 = v48;
          v16 = v60;
          v58 = (void *)v50;
          id v52 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v49, 2);
          uint64_t v18 = 0;
          v25 = 0;
          *a4 = v52;

          goto LABEL_47;
        }
        uint64_t v18 = 0;
        v25 = 0;
LABEL_48:

        self = v59;
LABEL_49:

        goto LABEL_50;
      }
    }
    if (v11)
    {
      id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v20 = *MEMORY[0x1E4F502C8];
      uint64_t v75 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"locations"];
      v76 = v17;
      v21 = (void *)MEMORY[0x1E4F1C9E8];
      v22 = &v76;
      v23 = &v75;
LABEL_22:
      id v24 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:1];
      v25 = 0;
      *long long v11 = (id)[v19 initWithDomain:v20 code:2 userInfo:v24];
      uint64_t v18 = v6;
      v16 = v60;
      goto LABEL_47;
    }
LABEL_23:
    v25 = 0;
    uint64_t v18 = v6;
    self = v59;
    v16 = v60;
    goto LABEL_49;
  }
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v59 = self;
    goto LABEL_6;
  }
  if (a4)
  {
    id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v27 = *MEMORY[0x1E4F502C8];
    uint64_t v78 = *MEMORY[0x1E4F28568];
    v9 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"locations"];
    v79[0] = v9;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:&v78 count:1];
    v25 = 0;
    *a4 = (id)[v26 initWithDomain:v27 code:2 userInfo:v18];
    v16 = v60;
    goto LABEL_49;
  }
  v25 = 0;
  v16 = v60;
LABEL_50:

  return v25;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMProactiveHarvestingPhotosView *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_locations;
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

  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_uniqueID) {
    PBDataWriterWriteStringField();
  }
  if (self->_contentProtection) {
    PBDataWriterWriteStringField();
  }
  if (self->_personaId) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BMProactiveHarvestingPhotosView;
  uint64_t v5 = [(BMEventBase *)&v34 init];
  if (!v5)
  {
LABEL_36:
    double v32 = v5;
    goto LABEL_37;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_34:
    uint64_t v29 = [v6 copy];
    locations = v5->_locations;
    v5->_locations = (NSArray *)v29;

    int v31 = v4[*v9];
    if (v31) {
      goto LABEL_35;
    }
    goto LABEL_36;
  }
  long long v10 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v9]) {
      goto LABEL_34;
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
      goto LABEL_34;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v21 = PBReaderReadString();
        if (!v21) {
          goto LABEL_38;
        }
        v22 = (void *)v21;
        [v6 addObject:v21];

        goto LABEL_33;
      case 2u:
        v5->_hasRaw_absoluteTimestamp = 1;
        uint64_t v23 = *v7;
        unint64_t v24 = *(void *)&v4[v23];
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v8])
        {
          double v25 = *(double *)(*(void *)&v4[*v10] + v24);
          *(void *)&v4[v23] = v24 + 8;
        }
        else
        {
          v4[*v9] = 1;
          double v25 = 0.0;
        }
        v5->_raw_absoluteTimestamp = v25;
        goto LABEL_33;
      case 3u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 48;
        goto LABEL_30;
      case 4u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 56;
        goto LABEL_30;
      case 5u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 64;
LABEL_30:
        v28 = *(Class *)((char *)&v5->super.super.isa + v27);
        *(Class *)((char *)&v5->super.super.isa + v27) = (Class)v26;

        goto LABEL_33;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_33:
          if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
            goto LABEL_34;
          }
          continue;
        }
LABEL_38:

LABEL_35:
        double v32 = 0;
LABEL_37:

        return v32;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMProactiveHarvestingPhotosView *)self locations];
  uint64_t v5 = [(BMProactiveHarvestingPhotosView *)self absoluteTimestamp];
  uint64_t v6 = [(BMProactiveHarvestingPhotosView *)self uniqueID];
  uint64_t v7 = [(BMProactiveHarvestingPhotosView *)self contentProtection];
  uint64_t v8 = [(BMProactiveHarvestingPhotosView *)self personaId];
  uint64_t v9 = (void *)[v3 initWithFormat:@"BMProactiveHarvestingPhotosView with locations: %@, absoluteTimestamp: %@, uniqueID: %@, contentProtection: %@, personaId: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMProactiveHarvestingPhotosView)initWithLocations:(id)a3 absoluteTimestamp:(id)a4 uniqueID:(id)a5 contentProtection:(id)a6 personaId:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMProactiveHarvestingPhotosView;
  uint64_t v18 = [(BMEventBase *)&v21 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v18->_locations, a3);
    if (v14)
    {
      v18->_hasRaw_absoluteTimestamp = 1;
      [v14 timeIntervalSinceReferenceDate];
    }
    else
    {
      v18->_hasRaw_absoluteTimestamp = 0;
      double v19 = -1.0;
    }
    v18->_raw_absoluteTimestamp = v19;
    objc_storeStrong((id *)&v18->_uniqueID, a5);
    objc_storeStrong((id *)&v18->_contentProtection, a6);
    objc_storeStrong((id *)&v18->_personaId, a7);
  }

  return v18;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"locations" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"absoluteTimestamp", 2, 0, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uniqueID" number:3 type:13 subMessageClass:0];
  v9[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentProtection" number:4 type:13 subMessageClass:0];
  v9[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"personaId" number:5 type:13 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3108;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"locations_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:1];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uniqueID" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentProtection" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"personaId" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

id __42__BMProactiveHarvestingPhotosView_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _locationsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 2)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    uint64_t v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMProactiveHarvestingPhotosView alloc] initByReadFrom:v6];
    uint64_t v8 = v7;
    if (v7) {
      v7[8] = 2;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 2;
}

@end
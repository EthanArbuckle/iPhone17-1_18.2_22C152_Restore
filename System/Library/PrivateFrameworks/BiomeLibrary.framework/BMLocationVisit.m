@interface BMLocationVisit
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLocationVisit)initWithDetectionDate:(id)a3 type:(int)a4 location:(id)a5 entryDate:(id)a6 exitDate:(id)a7 confidence:(id)a8 source:(int)a9 placeInference:(id)a10;
- (BMLocationVisit)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMLocationVisitLocation)location;
- (BMPlaceInference)placeInference;
- (BOOL)hasConfidence;
- (BOOL)isEqual:(id)a3;
- (NSDate)detectionDate;
- (NSDate)entryDate;
- (NSDate)exitDate;
- (NSString)description;
- (double)confidence;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)source;
- (int)type;
- (unsigned)dataVersion;
- (void)setHasConfidence:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMLocationVisit

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeInference, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

- (BMPlaceInference)placeInference
{
  return self->_placeInference;
}

- (int)source
{
  return self->_source;
}

- (void)setHasConfidence:(BOOL)a3
{
  self->_hasConfidence = a3;
}

- (BOOL)hasConfidence
{
  return self->_hasConfidence;
}

- (double)confidence
{
  return self->_confidence;
}

- (BMLocationVisitLocation)location
{
  return self->_location;
}

- (int)type
{
  return self->_type;
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
    v6 = [(BMLocationVisit *)self detectionDate];
    uint64_t v7 = [v5 detectionDate];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMLocationVisit *)self detectionDate];
      v10 = [v5 detectionDate];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_28;
      }
    }
    int v13 = [(BMLocationVisit *)self type];
    if (v13 == [v5 type])
    {
      v14 = [(BMLocationVisit *)self location];
      uint64_t v15 = [v5 location];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(BMLocationVisit *)self location];
        v18 = [v5 location];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_28;
        }
      }
      v20 = [(BMLocationVisit *)self entryDate];
      uint64_t v21 = [v5 entryDate];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMLocationVisit *)self entryDate];
        v24 = [v5 entryDate];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_28;
        }
      }
      v26 = [(BMLocationVisit *)self exitDate];
      uint64_t v27 = [v5 exitDate];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        v29 = [(BMLocationVisit *)self exitDate];
        v30 = [v5 exitDate];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_28;
        }
      }
      if (!-[BMLocationVisit hasConfidence](self, "hasConfidence") && ![v5 hasConfidence]
        || [(BMLocationVisit *)self hasConfidence]
        && [v5 hasConfidence]
        && (-[BMLocationVisit confidence](self, "confidence"), double v33 = v32, [v5 confidence], v33 == v34))
      {
        int v35 = [(BMLocationVisit *)self source];
        if (v35 == [v5 source])
        {
          v36 = [(BMLocationVisit *)self placeInference];
          v37 = [v5 placeInference];
          if (v36 == v37)
          {
            char v12 = 1;
          }
          else
          {
            v38 = [(BMLocationVisit *)self placeInference];
            v39 = [v5 placeInference];
            char v12 = [v38 isEqual:v39];
          }
          goto LABEL_29;
        }
      }
    }
LABEL_28:
    char v12 = 0;
LABEL_29:

    goto LABEL_30;
  }
  char v12 = 0;
LABEL_30:

  return v12;
}

- (NSDate)exitDate
{
  if (self->_hasRaw_exitDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_exitDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)entryDate
{
  if (self->_hasRaw_entryDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_entryDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)detectionDate
{
  if (self->_hasRaw_detectionDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_detectionDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v41[8] = *MEMORY[0x1E4F143B8];
  v3 = [(BMLocationVisit *)self detectionDate];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMLocationVisit *)self detectionDate];
    [v5 timeIntervalSince1970];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLocationVisit type](self, "type"));
  v8 = [(BMLocationVisit *)self location];
  uint64_t v9 = [v8 jsonDictionary];

  v10 = [(BMLocationVisit *)self entryDate];
  if (v10)
  {
    int v11 = NSNumber;
    char v12 = [(BMLocationVisit *)self entryDate];
    [v12 timeIntervalSince1970];
    v39 = objc_msgSend(v11, "numberWithDouble:");
  }
  else
  {
    v39 = 0;
  }

  int v13 = [(BMLocationVisit *)self exitDate];
  if (v13)
  {
    v14 = NSNumber;
    uint64_t v15 = [(BMLocationVisit *)self exitDate];
    [v15 timeIntervalSince1970];
    v38 = objc_msgSend(v14, "numberWithDouble:");
  }
  else
  {
    v38 = 0;
  }

  if (![(BMLocationVisit *)self hasConfidence]
    || ([(BMLocationVisit *)self confidence], fabs(v16) == INFINITY))
  {
    v18 = 0;
  }
  else
  {
    [(BMLocationVisit *)self confidence];
    v17 = NSNumber;
    [(BMLocationVisit *)self confidence];
    v18 = objc_msgSend(v17, "numberWithDouble:");
  }
  int v19 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLocationVisit source](self, "source"));
  v20 = [(BMLocationVisit *)self placeInference];
  uint64_t v21 = [v20 jsonDictionary];

  v40[0] = @"detectionDate";
  uint64_t v22 = v6;
  if (!v6)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  int v35 = (void *)v22;
  v41[0] = v22;
  v40[1] = @"type";
  uint64_t v23 = v7;
  if (!v7)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  double v34 = (void *)v23;
  v41[1] = v23;
  v40[2] = @"location";
  uint64_t v24 = v9;
  if (!v9)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v6;
  double v33 = (void *)v24;
  v41[2] = v24;
  v40[3] = @"entryDate";
  int v25 = v39;
  if (!v39)
  {
    int v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v36 = (void *)v7;
  v41[3] = v25;
  v40[4] = @"exitDate";
  v26 = v38;
  if (!v38)
  {
    v26 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v27 = (void *)v9;
  v41[4] = v26;
  v40[5] = @"confidence";
  v28 = v18;
  if (!v18)
  {
    v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v41[5] = v28;
  v40[6] = @"source";
  v29 = v19;
  if (!v19)
  {
    v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v41[6] = v29;
  v40[7] = @"placeInference";
  v30 = v21;
  if (!v21)
  {
    v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v41[7] = v30;
  int v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:8];
  if (v21)
  {
    if (v19) {
      goto LABEL_32;
    }
LABEL_44:

    if (v18) {
      goto LABEL_33;
    }
    goto LABEL_45;
  }

  if (!v19) {
    goto LABEL_44;
  }
LABEL_32:
  if (v18) {
    goto LABEL_33;
  }
LABEL_45:

LABEL_33:
  if (!v38) {

  }
  if (!v39) {
  if (v27)
  }
  {
    if (v36) {
      goto LABEL_39;
    }
LABEL_47:

    if (v37) {
      goto LABEL_40;
    }
    goto LABEL_48;
  }

  if (!v36) {
    goto LABEL_47;
  }
LABEL_39:
  if (v37) {
    goto LABEL_40;
  }
LABEL_48:

LABEL_40:

  return v31;
}

- (BMLocationVisit)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v123[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"detectionDate"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = 0;
LABEL_9:
    uint64_t v15 = [v5 objectForKeyedSubscript:@"type"];
    v105 = (void *)v7;
    v103 = (void *)v15;
    if (v15 && (double v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v16;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v17 = 0;
            v26 = 0;
            goto LABEL_90;
          }
          id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
          v52 = v6;
          uint64_t v53 = *MEMORY[0x1E4F502C8];
          uint64_t v120 = *MEMORY[0x1E4F28568];
          id v23 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"type"];
          id v121 = v23;
          uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v121 forKeys:&v120 count:1];
          uint64_t v55 = v53;
          uint64_t v6 = v52;
          v17 = 0;
          v26 = 0;
          *a4 = (id)[v51 initWithDomain:v55 code:2 userInfo:v54];
          uint64_t v27 = (void *)v54;
          goto LABEL_88;
        }
        id v18 = [NSNumber numberWithInt:BMLocationVisitTypeFromString(v16)];
      }
      v17 = v18;
    }
    else
    {
      v17 = 0;
    }
    int v19 = [v5 objectForKeyedSubscript:@"location"];
    if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v26 = 0;
LABEL_89:

          double v16 = v103;
          goto LABEL_90;
        }
        id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
        v41 = v6;
        uint64_t v42 = *MEMORY[0x1E4F502C8];
        uint64_t v118 = *MEMORY[0x1E4F28568];
        v43 = v17;
        id v44 = [NSString alloc];
        uint64_t v92 = objc_opt_class();
        v45 = v44;
        v17 = v43;
        uint64_t v46 = [v45 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v92, @"location"];
        uint64_t v119 = v46;
        v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v119 forKeys:&v118 count:1];
        uint64_t v48 = v42;
        uint64_t v6 = v41;
        uint64_t v27 = (void *)v46;
        *a4 = (id)[v40 initWithDomain:v48 code:2 userInfo:v47];

        v26 = 0;
        goto LABEL_87;
      }
      id v23 = v19;
      id v107 = 0;
      v99 = [[BMLocationVisitLocation alloc] initWithJSONDictionary:v23 error:&v107];
      id v24 = v107;
      if (v24)
      {
        int v25 = v24;
        if (a4) {
          *a4 = v24;
        }

        v26 = 0;
        uint64_t v27 = v99;
        goto LABEL_88;
      }
    }
    else
    {
      v99 = 0;
    }
    v20 = [v5 objectForKeyedSubscript:@"entryDate"];
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v28 = (objc_class *)MEMORY[0x1E4F1C9C8];
        v29 = v20;
        id v30 = v20;
        id v31 = [v28 alloc];
        [v30 doubleValue];
        double v33 = v32;

        v20 = v29;
        id v102 = (id)[v31 initWithTimeIntervalSince1970:v33];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v49 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          id v102 = [v49 dateFromString:v20];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v102 = 0;
              v26 = 0;
              uint64_t v27 = v99;
              goto LABEL_86;
            }
            v81 = v20;
            id v82 = objc_alloc(MEMORY[0x1E4F28C58]);
            v83 = v17;
            uint64_t v84 = *MEMORY[0x1E4F502C8];
            uint64_t v116 = *MEMORY[0x1E4F28568];
            v101 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"entryDate"];
            v117 = v101;
            v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
            v85 = v82;
            v20 = v81;
            uint64_t v86 = v84;
            v17 = v83;
            id v102 = 0;
            v26 = 0;
            *a4 = (id)[v85 initWithDomain:v86 code:2 userInfo:v75];
            uint64_t v27 = v99;
LABEL_85:

LABEL_86:
LABEL_87:
            id v23 = v19;
LABEL_88:

            int v19 = v23;
            goto LABEL_89;
          }
          id v102 = v20;
        }
      }
    }
    else
    {
      id v102 = 0;
    }
    uint64_t v21 = [v5 objectForKeyedSubscript:@"exitDate"];
    v96 = v20;
    v97 = (void *)v21;
    if (!v21 || (uint64_t v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v101 = 0;
      goto LABEL_52;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v34 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v35 = v22;
      id v36 = [v34 alloc];
      [v35 doubleValue];
      double v38 = v37;

      id v39 = (id)[v36 initWithTimeIntervalSince1970:v38];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v50 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        v101 = [v50 dateFromString:v22];

        goto LABEL_52;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v101 = 0;
          v26 = 0;
          uint64_t v27 = v99;
          goto LABEL_84;
        }
        id v87 = objc_alloc(MEMORY[0x1E4F28C58]);
        v88 = v17;
        uint64_t v89 = *MEMORY[0x1E4F502C8];
        uint64_t v114 = *MEMORY[0x1E4F28568];
        id v100 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"exitDate"];
        id v115 = v100;
        v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
        uint64_t v90 = v89;
        v17 = v88;
        v101 = 0;
        v26 = 0;
        *a4 = (id)[v87 initWithDomain:v90 code:2 userInfo:v56];
        goto LABEL_102;
      }
      id v39 = v22;
    }
    v101 = v39;
LABEL_52:
    v56 = [v5 objectForKeyedSubscript:@"confidence"];
    v95 = v6;
    if (!v56 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v57 = self;
      id v100 = 0;
LABEL_55:
      v58 = [v5 objectForKeyedSubscript:@"source"];
      v98 = v17;
      if (v58 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v59 = v58;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v59 = 0;
              v26 = 0;
              uint64_t v27 = v99;
              goto LABEL_82;
            }
            id v72 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v73 = *MEMORY[0x1E4F502C8];
            uint64_t v110 = *MEMORY[0x1E4F28568];
            v60 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"source"];
            v111 = v60;
            v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
            id v74 = (id)[v72 initWithDomain:v73 code:2 userInfo:v61];
            id v59 = 0;
            v26 = 0;
            *a4 = v74;
            goto LABEL_79;
          }
          id v59 = [NSNumber numberWithInt:BMLocationVisitSourceFromString(v58)];
        }
      }
      else
      {
        id v59 = 0;
      }
      v60 = [v5 objectForKeyedSubscript:@"placeInference"];
      if (!v60 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v61 = 0;
LABEL_61:
        uint64_t v62 = [v98 intValue];
        LODWORD(v91) = [v59 intValue];
        uint64_t v63 = v62;
        uint64_t v27 = v99;
        v26 = [(BMLocationVisit *)v57 initWithDetectionDate:v7 type:v63 location:v99 entryDate:v102 exitDate:v101 confidence:v100 source:v91 placeInference:v61];
        v57 = v26;
LABEL_80:

LABEL_81:
        v17 = v98;
        goto LABEL_82;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v64 = v60;
        id v106 = 0;
        v61 = [[BMPlaceInference alloc] initWithJSONDictionary:v64 error:&v106];
        id v65 = v106;
        if (!v65)
        {

          goto LABEL_61;
        }
        v66 = v65;
        if (a4) {
          *a4 = v65;
        }

        v26 = 0;
        v60 = v64;
      }
      else
      {
        if (!a4)
        {
          v26 = 0;
          uint64_t v27 = v99;
          goto LABEL_81;
        }
        id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v93 = *MEMORY[0x1E4F502C8];
        uint64_t v108 = *MEMORY[0x1E4F28568];
        v61 = (BMPlaceInference *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"placeInference"];
        v109 = v61;
        v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
        *a4 = (id)[v94 initWithDomain:v93 code:2 userInfo:v71];

        v26 = 0;
      }
LABEL_79:
      uint64_t v27 = v99;
      goto LABEL_80;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v57 = self;
      id v100 = v56;
      goto LABEL_55;
    }
    if (a4)
    {
      v57 = self;
      v67 = v17;
      id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v69 = *MEMORY[0x1E4F502C8];
      uint64_t v112 = *MEMORY[0x1E4F28568];
      id v59 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"confidence"];
      id v113 = v59;
      v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v113 forKeys:&v112 count:1];
      v70 = v68;
      v17 = v67;
      id v100 = 0;
      v26 = 0;
      *a4 = (id)[v70 initWithDomain:v69 code:2 userInfo:v58];
      uint64_t v27 = v99;
LABEL_82:

      self = v57;
      uint64_t v6 = v95;
LABEL_83:
      v20 = v96;

LABEL_84:
      v75 = v97;
      goto LABEL_85;
    }
    id v100 = 0;
    v26 = 0;
LABEL_102:
    uint64_t v27 = v99;
    goto LABEL_83;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v9 = v6;
    id v10 = [v8 alloc];
    [v9 doubleValue];
    double v12 = v11;

    id v13 = (id)[v10 initWithTimeIntervalSince1970:v12];
LABEL_6:
    uint64_t v7 = (uint64_t)v13;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    uint64_t v7 = [v14 dateFromString:v6];

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v6;
    goto LABEL_6;
  }
  if (!a4)
  {
    v105 = 0;
    v26 = 0;
    goto LABEL_91;
  }
  id v77 = objc_alloc(MEMORY[0x1E4F28C58]);
  v78 = v6;
  uint64_t v79 = *MEMORY[0x1E4F502C8];
  uint64_t v122 = *MEMORY[0x1E4F28568];
  v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"detectionDate"];
  v123[0] = v17;
  double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v123 forKeys:&v122 count:1];
  uint64_t v80 = v79;
  uint64_t v6 = v78;
  v105 = 0;
  v26 = 0;
  *a4 = (id)[v77 initWithDomain:v80 code:2 userInfo:v16];
LABEL_90:

LABEL_91:
  return v26;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMLocationVisit *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasRaw_detectionDate) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_location)
  {
    PBDataWriterPlaceMark();
    [(BMLocationVisitLocation *)self->_location writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasRaw_entryDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRaw_exitDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasConfidence) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_placeInference)
  {
    PBDataWriterPlaceMark();
    [(BMPlaceInference *)self->_placeInference writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)BMLocationVisit;
  id v5 = [(BMEventBase *)&v49 init];
  if (!v5) {
    goto LABEL_80;
  }
  uint64_t v6 = (int *)MEMORY[0x1E4F940E8];
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
          v5->_hasRaw_detectionDate = 1;
          uint64_t v20 = *v6;
          unint64_t v21 = *(void *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v22 = *(objc_class **)(*(void *)&v4[*v9] + v21);
            *(void *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v22 = 0;
          }
          uint64_t v46 = 24;
          goto LABEL_76;
        case 2u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          while (2)
          {
            uint64_t v26 = *v6;
            uint64_t v27 = *(void *)&v4[v26];
            unint64_t v28 = v27 + 1;
            if (v27 == -1 || v28 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)&v4[*v9] + v27);
              *(void *)&v4[v26] = v28;
              v25 |= (unint64_t)(v29 & 0x7F) << v23;
              if (v29 < 0)
              {
                v23 += 7;
                BOOL v17 = v24++ >= 9;
                if (v17)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v25) = 0;
          }
LABEL_58:
          if (v25 >= 4) {
            LODWORD(v25) = 0;
          }
          uint64_t v45 = 72;
          goto LABEL_67;
        case 3u:
          uint64_t v50 = 0;
          uint64_t v51 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_79;
          }
          id v30 = [[BMLocationVisitLocation alloc] initByReadFrom:v4];
          if (!v30) {
            goto LABEL_79;
          }
          uint64_t v31 = 80;
          goto LABEL_54;
        case 4u:
          v5->_hasRaw_entryDate = 1;
          uint64_t v32 = *v6;
          unint64_t v33 = *(void *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v22 = *(objc_class **)(*(void *)&v4[*v9] + v33);
            *(void *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v22 = 0;
          }
          uint64_t v46 = 40;
          goto LABEL_76;
        case 5u:
          v5->_hasRaw_exitDate = 1;
          uint64_t v34 = *v6;
          unint64_t v35 = *(void *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v22 = *(objc_class **)(*(void *)&v4[*v9] + v35);
            *(void *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v22 = 0;
          }
          uint64_t v46 = 56;
          goto LABEL_76;
        case 6u:
          v5->_hasConfidence = 1;
          uint64_t v36 = *v6;
          unint64_t v37 = *(void *)&v4[v36];
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v22 = *(objc_class **)(*(void *)&v4[*v9] + v37);
            *(void *)&v4[v36] = v37 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v22 = 0;
          }
          uint64_t v46 = 88;
LABEL_76:
          *(Class *)((char *)&v5->super.super.isa + v46) = v22;
          continue;
        case 7u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v25 = 0;
          break;
        case 8u:
          uint64_t v50 = 0;
          uint64_t v51 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_79;
          }
          id v30 = [[BMPlaceInference alloc] initByReadFrom:v4];
          if (!v30) {
            goto LABEL_79;
          }
          uint64_t v31 = 96;
LABEL_54:
          id v44 = *(Class *)((char *)&v5->super.super.isa + v31);
          *(Class *)((char *)&v5->super.super.isa + v31) = v30;

          PBReaderRecallMark();
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_79;
          }
          continue;
      }
      while (1)
      {
        uint64_t v40 = *v6;
        uint64_t v41 = *(void *)&v4[v40];
        unint64_t v42 = v41 + 1;
        if (v41 == -1 || v42 > *(void *)&v4[*v7]) {
          break;
        }
        char v43 = *(unsigned char *)(*(void *)&v4[*v9] + v41);
        *(void *)&v4[v40] = v42;
        v25 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0) {
          goto LABEL_62;
        }
        v38 += 7;
        BOOL v17 = v39++ >= 9;
        if (v17)
        {
          LODWORD(v25) = 0;
          goto LABEL_64;
        }
      }
      v4[*v8] = 1;
LABEL_62:
      if (v4[*v8]) {
        LODWORD(v25) = 0;
      }
LABEL_64:
      if (v25 >= 4) {
        LODWORD(v25) = 0;
      }
      uint64_t v45 = 76;
LABEL_67:
      *(_DWORD *)((char *)&v5->super.super.isa + v45) = v25;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_79:
  }
    v47 = 0;
  else {
LABEL_80:
  }
    v47 = v5;

  return v47;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMLocationVisit *)self detectionDate];
  id v5 = BMLocationVisitTypeAsString([(BMLocationVisit *)self type]);
  uint64_t v6 = [(BMLocationVisit *)self location];
  uint64_t v7 = [(BMLocationVisit *)self entryDate];
  v8 = [(BMLocationVisit *)self exitDate];
  id v9 = NSNumber;
  [(BMLocationVisit *)self confidence];
  char v10 = objc_msgSend(v9, "numberWithDouble:");
  unsigned int v11 = BMLocationVisitSourceAsString([(BMLocationVisit *)self source]);
  unint64_t v12 = [(BMLocationVisit *)self placeInference];
  uint64_t v13 = (void *)[v3 initWithFormat:@"BMLocationVisit with detectionDate: %@, type: %@, location: %@, entryDate: %@, exitDate: %@, confidence: %@, source: %@, placeInference: %@", v4, v5, v6, v7, v8, v10, v11, v12];

  return (NSString *)v13;
}

- (BMLocationVisit)initWithDetectionDate:(id)a3 type:(int)a4 location:(id)a5 entryDate:(id)a6 exitDate:(id)a7 confidence:(id)a8 source:(int)a9 placeInference:(id)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  v28.receiver = self;
  v28.super_class = (Class)BMLocationVisit;
  uint64_t v22 = [(BMEventBase *)&v28 init];
  if (v22)
  {
    v22->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v16)
    {
      v22->_hasRaw_detectionDate = 1;
      [v16 timeIntervalSince1970];
    }
    else
    {
      v22->_hasRaw_detectionDate = 0;
      double v23 = -1.0;
    }
    v22->_raw_detectionDate = v23;
    v22->_type = a4;
    objc_storeStrong((id *)&v22->_location, a5);
    if (v18)
    {
      v22->_hasRaw_entryDate = 1;
      [v18 timeIntervalSince1970];
    }
    else
    {
      v22->_hasRaw_entryDate = 0;
      double v24 = -1.0;
    }
    v22->_raw_entryDate = v24;
    if (v19)
    {
      v22->_hasRaw_exitDate = 1;
      [v19 timeIntervalSince1970];
    }
    else
    {
      v22->_hasRaw_exitDate = 0;
      double v25 = -1.0;
    }
    v22->_raw_exitDate = v25;
    if (v20)
    {
      v22->_hasConfidence = 1;
      [v20 doubleValue];
    }
    else
    {
      v22->_hasConfidence = 0;
      double v26 = -1.0;
    }
    v22->_confidence = v26;
    v22->_source = a9;
    objc_storeStrong((id *)&v22->_placeInference, a10);
  }

  return v22;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"detectionDate" number:1 type:0 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"type" number:2 type:4 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"location" number:3 type:14 subMessageClass:objc_opt_class()];
  v12[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"entryDate" number:4 type:0 subMessageClass:0];
  v12[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"exitDate" number:5 type:0 subMessageClass:0];
  v12[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"confidence" number:6 type:0 subMessageClass:0];
  v12[5] = v7;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"source" number:7 type:4 subMessageClass:0];
  v12[6] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"placeInference" number:8 type:14 subMessageClass:objc_opt_class()];
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6438;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"detectionDate" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:2];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"location_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_411];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"entryDate" dataType:3 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:2];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"exitDate" dataType:3 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:2];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"confidence" dataType:1 requestOnly:0 fieldNumber:6 protoDataType:0 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"source" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"placeInference_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_413];
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

id __26__BMLocationVisit_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 placeInference];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __26__BMLocationVisit_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 location];
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMLocationVisit alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[17] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end
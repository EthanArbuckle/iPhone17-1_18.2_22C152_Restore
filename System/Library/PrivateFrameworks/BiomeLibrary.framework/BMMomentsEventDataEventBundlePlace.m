@interface BMMomentsEventDataEventBundlePlace
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMomentsEventDataEventBundlePlace)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMomentsEventDataEventBundlePlace)initWithPlaceInferencePlaceType:(int)a3 placeInferenceUserSpecificPlaceType:(int)a4 geoPOICategoryType:(int)a5 placeNameConfidence:(id)a6 familiarityIndexLOI:(id)a7 distanceToHomeInMiles:(id)a8;
- (BOOL)hasDistanceToHomeInMiles;
- (BOOL)hasFamiliarityIndexLOI;
- (BOOL)hasPlaceNameConfidence;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)distanceToHomeInMiles;
- (double)familiarityIndexLOI;
- (double)placeNameConfidence;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)geoPOICategoryType;
- (int)placeInferencePlaceType;
- (int)placeInferenceUserSpecificPlaceType;
- (unsigned)dataVersion;
- (void)setHasDistanceToHomeInMiles:(BOOL)a3;
- (void)setHasFamiliarityIndexLOI:(BOOL)a3;
- (void)setHasPlaceNameConfidence:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMomentsEventDataEventBundlePlace

- (void)setHasDistanceToHomeInMiles:(BOOL)a3
{
  self->_hasDistanceToHomeInMiles = a3;
}

- (BOOL)hasDistanceToHomeInMiles
{
  return self->_hasDistanceToHomeInMiles;
}

- (double)distanceToHomeInMiles
{
  return self->_distanceToHomeInMiles;
}

- (void)setHasFamiliarityIndexLOI:(BOOL)a3
{
  self->_hasFamiliarityIndexLOI = a3;
}

- (BOOL)hasFamiliarityIndexLOI
{
  return self->_hasFamiliarityIndexLOI;
}

- (double)familiarityIndexLOI
{
  return self->_familiarityIndexLOI;
}

- (void)setHasPlaceNameConfidence:(BOOL)a3
{
  self->_hasPlaceNameConfidence = a3;
}

- (BOOL)hasPlaceNameConfidence
{
  return self->_hasPlaceNameConfidence;
}

- (double)placeNameConfidence
{
  return self->_placeNameConfidence;
}

- (int)geoPOICategoryType
{
  return self->_geoPOICategoryType;
}

- (int)placeInferenceUserSpecificPlaceType
{
  return self->_placeInferenceUserSpecificPlaceType;
}

- (int)placeInferencePlaceType
{
  return self->_placeInferencePlaceType;
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
    int v6 = [(BMMomentsEventDataEventBundlePlace *)self placeInferencePlaceType];
    if (v6 != [v5 placeInferencePlaceType]) {
      goto LABEL_21;
    }
    int v7 = [(BMMomentsEventDataEventBundlePlace *)self placeInferenceUserSpecificPlaceType];
    if (v7 != [v5 placeInferenceUserSpecificPlaceType]) {
      goto LABEL_21;
    }
    int v8 = [(BMMomentsEventDataEventBundlePlace *)self geoPOICategoryType];
    if (v8 != [v5 geoPOICategoryType]) {
      goto LABEL_21;
    }
    if ([(BMMomentsEventDataEventBundlePlace *)self hasPlaceNameConfidence]
      || [v5 hasPlaceNameConfidence])
    {
      if (![(BMMomentsEventDataEventBundlePlace *)self hasPlaceNameConfidence]) {
        goto LABEL_21;
      }
      if (![v5 hasPlaceNameConfidence]) {
        goto LABEL_21;
      }
      [(BMMomentsEventDataEventBundlePlace *)self placeNameConfidence];
      double v10 = v9;
      [v5 placeNameConfidence];
      if (v10 != v11) {
        goto LABEL_21;
      }
    }
    if ([(BMMomentsEventDataEventBundlePlace *)self hasFamiliarityIndexLOI]
      || [v5 hasFamiliarityIndexLOI])
    {
      if (![(BMMomentsEventDataEventBundlePlace *)self hasFamiliarityIndexLOI]) {
        goto LABEL_21;
      }
      if (![v5 hasFamiliarityIndexLOI]) {
        goto LABEL_21;
      }
      [(BMMomentsEventDataEventBundlePlace *)self familiarityIndexLOI];
      double v13 = v12;
      [v5 familiarityIndexLOI];
      if (v13 != v14) {
        goto LABEL_21;
      }
    }
    if (![(BMMomentsEventDataEventBundlePlace *)self hasDistanceToHomeInMiles]
      && ![v5 hasDistanceToHomeInMiles])
    {
      BOOL v18 = 1;
      goto LABEL_22;
    }
    if ([(BMMomentsEventDataEventBundlePlace *)self hasDistanceToHomeInMiles]
      && [v5 hasDistanceToHomeInMiles])
    {
      [(BMMomentsEventDataEventBundlePlace *)self distanceToHomeInMiles];
      double v16 = v15;
      [v5 distanceToHomeInMiles];
      BOOL v18 = v16 == v17;
    }
    else
    {
LABEL_21:
      BOOL v18 = 0;
    }
LABEL_22:

    goto LABEL_23;
  }
  BOOL v18 = 0;
LABEL_23:

  return v18;
}

- (id)jsonDictionary
{
  v29[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundlePlace placeInferencePlaceType](self, "placeInferencePlaceType"));
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundlePlace placeInferenceUserSpecificPlaceType](self, "placeInferenceUserSpecificPlaceType"));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundlePlace geoPOICategoryType](self, "geoPOICategoryType"));
  if (![(BMMomentsEventDataEventBundlePlace *)self hasPlaceNameConfidence]
    || ([(BMMomentsEventDataEventBundlePlace *)self placeNameConfidence], fabs(v6) == INFINITY))
  {
    int v8 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundlePlace *)self placeNameConfidence];
    int v7 = NSNumber;
    [(BMMomentsEventDataEventBundlePlace *)self placeNameConfidence];
    int v8 = objc_msgSend(v7, "numberWithDouble:");
  }
  if (![(BMMomentsEventDataEventBundlePlace *)self hasFamiliarityIndexLOI]
    || ([(BMMomentsEventDataEventBundlePlace *)self familiarityIndexLOI], fabs(v9) == INFINITY))
  {
    double v11 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundlePlace *)self familiarityIndexLOI];
    double v10 = NSNumber;
    [(BMMomentsEventDataEventBundlePlace *)self familiarityIndexLOI];
    double v11 = objc_msgSend(v10, "numberWithDouble:");
  }
  if (![(BMMomentsEventDataEventBundlePlace *)self hasDistanceToHomeInMiles]
    || ([(BMMomentsEventDataEventBundlePlace *)self distanceToHomeInMiles], fabs(v12) == INFINITY))
  {
    double v14 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundlePlace *)self distanceToHomeInMiles];
    double v13 = NSNumber;
    [(BMMomentsEventDataEventBundlePlace *)self distanceToHomeInMiles];
    double v14 = objc_msgSend(v13, "numberWithDouble:");
  }
  v28[0] = @"placeInferencePlaceType";
  uint64_t v15 = v3;
  if (!v3)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v24 = v15;
  v29[0] = v15;
  v28[1] = @"placeInferenceUserSpecificPlaceType";
  double v16 = (void *)v4;
  v27 = (void *)v4;
  if (!v4)
  {
    double v16 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v15);
  }
  v29[1] = v16;
  v28[2] = @"geoPOICategoryType";
  double v17 = (void *)v5;
  v26 = (void *)v5;
  if (!v5)
  {
    double v17 = [MEMORY[0x1E4F1CA98] null];
  }
  BOOL v18 = (void *)v3;
  v29[2] = v17;
  v28[3] = @"placeNameConfidence";
  v19 = v8;
  if (!v8)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[3] = v19;
  v28[4] = @"familiarityIndexLOI";
  v20 = v11;
  if (!v11)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[4] = v20;
  v28[5] = @"distanceToHomeInMiles";
  v21 = v14;
  if (!v14)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[5] = v21;
  v22 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v29, v28, 6, v24);
  if (v14)
  {
    if (v11) {
      goto LABEL_27;
    }
LABEL_36:

    if (v8) {
      goto LABEL_28;
    }
    goto LABEL_37;
  }

  if (!v11) {
    goto LABEL_36;
  }
LABEL_27:
  if (v8) {
    goto LABEL_28;
  }
LABEL_37:

LABEL_28:
  if (!v26) {

  }
  if (v27)
  {
    if (v18) {
      goto LABEL_32;
    }
  }
  else
  {

    if (v18) {
      goto LABEL_32;
    }
  }

LABEL_32:

  return v22;
}

- (BMMomentsEventDataEventBundlePlace)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [v5 objectForKeyedSubscript:@"placeInferencePlaceType"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v47 = 0;
          v20 = 0;
          v19 = self;
          goto LABEL_53;
        }
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        v33 = a4;
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v60 = *MEMORY[0x1E4F28568];
        double v10 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"placeInferencePlaceType"];
        v61[0] = v10;
        double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
        v47 = 0;
        v20 = 0;
        id *v33 = (id)[v32 initWithDomain:v34 code:2 userInfo:v9];
        goto LABEL_64;
      }
      id v8 = [NSNumber numberWithInt:BMMomentsEventDataPlaceInferencePlaceTypeFromString(v6)];
    }
    int v7 = v8;
  }
  else
  {
    int v7 = 0;
  }
  double v9 = [v5 objectForKeyedSubscript:@"placeInferenceUserSpecificPlaceType"];
  v47 = v7;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v9;
LABEL_16:
        double v10 = v11;
        goto LABEL_17;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = [NSNumber numberWithInt:BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeFromString(v9)];
        goto LABEL_16;
      }
      if (a4)
      {
        id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
        v36 = a4;
        uint64_t v37 = *MEMORY[0x1E4F502C8];
        uint64_t v58 = *MEMORY[0x1E4F28568];
        id v49 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"placeInferenceUserSpecificPlaceType"];
        id v59 = v49;
        double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        double v10 = 0;
        v20 = 0;
        id *v36 = (id)[v35 initWithDomain:v37 code:2 userInfo:v12];
        v19 = self;
        goto LABEL_51;
      }
      double v10 = 0;
      v20 = 0;
LABEL_64:
      v19 = self;
      goto LABEL_52;
    }
  }
  double v10 = 0;
LABEL_17:
  double v12 = [v5 objectForKeyedSubscript:@"geoPOICategoryType"];
  v44 = v10;
  v45 = v9;
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v49 = v12;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v49 = 0;
          v20 = 0;
          v19 = self;
          goto LABEL_51;
        }
        id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
        v39 = a4;
        uint64_t v40 = *MEMORY[0x1E4F502C8];
        uint64_t v56 = *MEMORY[0x1E4F28568];
        id v48 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"geoPOICategoryType"];
        id v57 = v48;
        double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        id v49 = 0;
        v20 = 0;
        id *v39 = (id)[v38 initWithDomain:v40 code:2 userInfo:v13];
        v19 = self;
        goto LABEL_50;
      }
      id v49 = [NSNumber numberWithInt:BMMomentsEventDataGeoPOICategoryTypeFromString(v12)];
    }
  }
  else
  {
    id v49 = 0;
  }
  double v13 = [v5 objectForKeyedSubscript:@"placeNameConfidence"];
  v43 = v6;
  if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v14 = a4;
    id v48 = 0;
LABEL_23:
    uint64_t v15 = [v5 objectForKeyedSubscript:@"familiarityIndexLOI"];
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v14)
        {
          id v16 = 0;
          v20 = 0;
          v19 = self;
          double v10 = v44;
          goto LABEL_49;
        }
        id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v52 = *MEMORY[0x1E4F28568];
        id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"familiarityIndexLOI"];
        id v53 = v18;
        double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        id v28 = (id)[v26 initWithDomain:v27 code:2 userInfo:v17];
        v20 = 0;
        id v16 = 0;
        *double v14 = v28;
        v19 = self;
        goto LABEL_47;
      }
      id v16 = v15;
    }
    else
    {
      id v16 = 0;
    }
    double v17 = [v5 objectForKeyedSubscript:@"distanceToHomeInMiles"];
    if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v18 = 0;
LABEL_29:
      double v10 = v44;
      v19 = -[BMMomentsEventDataEventBundlePlace initWithPlaceInferencePlaceType:placeInferenceUserSpecificPlaceType:geoPOICategoryType:placeNameConfidence:familiarityIndexLOI:distanceToHomeInMiles:](self, "initWithPlaceInferencePlaceType:placeInferenceUserSpecificPlaceType:geoPOICategoryType:placeNameConfidence:familiarityIndexLOI:distanceToHomeInMiles:", [v7 intValue], objc_msgSend(v44, "intValue"), objc_msgSend(v49, "intValue"), v48, v16, v18);
      v20 = v19;
LABEL_48:

      goto LABEL_49;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v17;
      goto LABEL_29;
    }
    v19 = self;
    if (v14)
    {
      id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v41 = *MEMORY[0x1E4F502C8];
      uint64_t v50 = *MEMORY[0x1E4F28568];
      v29 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"distanceToHomeInMiles"];
      v51 = v29;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      *double v14 = (id)[v42 initWithDomain:v41 code:2 userInfo:v30];
    }
    id v18 = 0;
    v20 = 0;
LABEL_47:
    double v10 = v44;
    goto LABEL_48;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v14 = a4;
    id v48 = v13;
    goto LABEL_23;
  }
  if (!a4)
  {
    id v48 = 0;
    v20 = 0;
    v19 = self;
    goto LABEL_50;
  }
  id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
  v22 = v10;
  uint64_t v23 = *MEMORY[0x1E4F502C8];
  uint64_t v54 = *MEMORY[0x1E4F28568];
  uint64_t v24 = a4;
  id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"placeNameConfidence"];
  id v55 = v16;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  uint64_t v25 = v23;
  double v10 = v22;
  v20 = 0;
  id v48 = 0;
  *uint64_t v24 = (id)[v21 initWithDomain:v25 code:2 userInfo:v15];
  v19 = self;
LABEL_49:

  double v6 = v43;
LABEL_50:

  double v9 = v45;
LABEL_51:

LABEL_52:
LABEL_53:

  return v20;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMomentsEventDataEventBundlePlace *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasPlaceNameConfidence) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasFamiliarityIndexLOI) {
    PBDataWriterWriteDoubleField();
  }
  uint64_t v4 = v5;
  if (self->_hasDistanceToHomeInMiles)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  uint64_t v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)BMMomentsEventDataEventBundlePlace;
  id v5 = [(BMEventBase *)&v55 init];
  if (!v5) {
    goto LABEL_79;
  }
  double v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    double v9 = (int *)MEMORY[0x1E4F940B8];
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
              goto LABEL_53;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              uint64_t v27 = 0;
              goto LABEL_56;
            }
          }
          v4[*v8] = 1;
LABEL_53:
          if (v4[*v8]) {
            uint64_t v27 = 0;
          }
          else {
            uint64_t v27 = v22;
          }
LABEL_56:
          int v50 = BMMomentsEventDataPlaceInferencePlaceTypeDecode(v27);
          uint64_t v51 = 24;
          goto LABEL_62;
        case 2u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
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
              v30 |= (unint64_t)(v34 & 0x7F) << v28;
              if (v34 < 0)
              {
                v28 += 7;
                BOOL v17 = v29++ >= 9;
                if (v17)
                {
                  uint64_t v35 = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v35 = 0;
          }
          else {
            uint64_t v35 = v30;
          }
LABEL_61:
          int v50 = BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeDecode(v35);
          uint64_t v51 = 28;
LABEL_62:
          *(_DWORD *)((char *)&v5->super.super.isa + v51) = v50;
          continue;
        case 3u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v38 = 0;
          break;
        case 4u:
          v5->_hasPlaceNameConfidence = 1;
          uint64_t v43 = *v6;
          unint64_t v44 = *(void *)&v4[v43];
          if (v44 <= 0xFFFFFFFFFFFFFFF7 && v44 + 8 <= *(void *)&v4[*v7])
          {
            v45 = *(objc_class **)(*(void *)&v4[*v9] + v44);
            *(void *)&v4[v43] = v44 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v45 = 0;
          }
          uint64_t v52 = 40;
          goto LABEL_75;
        case 5u:
          v5->_hasFamiliarityIndexLOI = 1;
          uint64_t v46 = *v6;
          unint64_t v47 = *(void *)&v4[v46];
          if (v47 <= 0xFFFFFFFFFFFFFFF7 && v47 + 8 <= *(void *)&v4[*v7])
          {
            v45 = *(objc_class **)(*(void *)&v4[*v9] + v47);
            *(void *)&v4[v46] = v47 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v45 = 0;
          }
          uint64_t v52 = 48;
          goto LABEL_75;
        case 6u:
          v5->_hasDistanceToHomeInMiles = 1;
          uint64_t v48 = *v6;
          unint64_t v49 = *(void *)&v4[v48];
          if (v49 <= 0xFFFFFFFFFFFFFFF7 && v49 + 8 <= *(void *)&v4[*v7])
          {
            v45 = *(objc_class **)(*(void *)&v4[*v9] + v49);
            *(void *)&v4[v48] = v49 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v45 = 0;
          }
          uint64_t v52 = 56;
LABEL_75:
          *(Class *)((char *)&v5->super.super.isa + v52) = v45;
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_78;
          }
          continue;
      }
      while (1)
      {
        uint64_t v39 = *v6;
        uint64_t v40 = *(void *)&v4[v39];
        unint64_t v41 = v40 + 1;
        if (v40 == -1 || v41 > *(void *)&v4[*v7]) {
          break;
        }
        char v42 = *(unsigned char *)(*(void *)&v4[*v9] + v40);
        *(void *)&v4[v39] = v41;
        v38 |= (unint64_t)(v42 & 0x7F) << v36;
        if ((v42 & 0x80) == 0) {
          goto LABEL_64;
        }
        v36 += 7;
        BOOL v17 = v37++ >= 9;
        if (v17)
        {
          LODWORD(v38) = 0;
          goto LABEL_66;
        }
      }
      v4[*v8] = 1;
LABEL_64:
      if (v4[*v8]) {
        LODWORD(v38) = 0;
      }
LABEL_66:
      if (v38 >= 0x4E) {
        LODWORD(v38) = 0;
      }
      v5->_geoPOICategoryType = v38;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_78:
  }
    id v53 = 0;
  else {
LABEL_79:
  }
    id v53 = v5;

  return v53;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = BMMomentsEventDataPlaceInferencePlaceTypeAsString([(BMMomentsEventDataEventBundlePlace *)self placeInferencePlaceType]);
  id v5 = BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeAsString([(BMMomentsEventDataEventBundlePlace *)self placeInferenceUserSpecificPlaceType]);
  double v6 = BMMomentsEventDataGeoPOICategoryTypeAsString([(BMMomentsEventDataEventBundlePlace *)self geoPOICategoryType]);
  int v7 = NSNumber;
  [(BMMomentsEventDataEventBundlePlace *)self placeNameConfidence];
  id v8 = objc_msgSend(v7, "numberWithDouble:");
  double v9 = NSNumber;
  [(BMMomentsEventDataEventBundlePlace *)self familiarityIndexLOI];
  char v10 = objc_msgSend(v9, "numberWithDouble:");
  unsigned int v11 = NSNumber;
  [(BMMomentsEventDataEventBundlePlace *)self distanceToHomeInMiles];
  unint64_t v12 = objc_msgSend(v11, "numberWithDouble:");
  uint64_t v13 = (void *)[v3 initWithFormat:@"BMMomentsEventDataEventBundlePlace with placeInferencePlaceType: %@, placeInferenceUserSpecificPlaceType: %@, geoPOICategoryType: %@, placeNameConfidence: %@, familiarityIndexLOI: %@, distanceToHomeInMiles: %@", v4, v5, v6, v8, v10, v12];

  return (NSString *)v13;
}

- (BMMomentsEventDataEventBundlePlace)initWithPlaceInferencePlaceType:(int)a3 placeInferenceUserSpecificPlaceType:(int)a4 geoPOICategoryType:(int)a5 placeNameConfidence:(id)a6 familiarityIndexLOI:(id)a7 distanceToHomeInMiles:(id)a8
{
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BMMomentsEventDataEventBundlePlace;
  BOOL v17 = [(BMEventBase *)&v22 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v17->_placeInferencePlaceType = a3;
    v17->_placeInferenceUserSpecificPlaceType = a4;
    v17->_geoPOICategoryType = a5;
    if (v14)
    {
      v17->_hasPlaceNameConfidence = 1;
      [v14 doubleValue];
    }
    else
    {
      v17->_hasPlaceNameConfidence = 0;
      double v18 = -1.0;
    }
    v17->_placeNameConfidence = v18;
    if (v15)
    {
      v17->_hasFamiliarityIndexLOI = 1;
      [v15 doubleValue];
    }
    else
    {
      v17->_hasFamiliarityIndexLOI = 0;
      double v19 = -1.0;
    }
    v17->_familiarityIndexLOI = v19;
    if (v16)
    {
      v17->_hasDistanceToHomeInMiles = 1;
      [v16 doubleValue];
    }
    else
    {
      v17->_hasDistanceToHomeInMiles = 0;
      double v20 = -1.0;
    }
    v17->_distanceToHomeInMiles = v20;
  }

  return v17;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"placeInferencePlaceType" number:1 type:4 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"placeInferenceUserSpecificPlaceType" number:2 type:4 subMessageClass:0];
  v10[1] = v3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"geoPOICategoryType" number:3 type:4 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"placeNameConfidence" number:4 type:0 subMessageClass:0];
  v10[3] = v5;
  double v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"familiarityIndexLOI" number:5 type:0 subMessageClass:0];
  v10[4] = v6;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"distanceToHomeInMiles" number:6 type:0 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3300;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"placeInferencePlaceType" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"placeInferenceUserSpecificPlaceType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"geoPOICategoryType" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"placeNameConfidence" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:0];
  double v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"familiarityIndexLOI" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:0];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"distanceToHomeInMiles" dataType:1 requestOnly:0 fieldNumber:6 protoDataType:0 convertedType:0];
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
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMMomentsEventDataEventBundlePlace alloc] initByReadFrom:v7];
    uint64_t v4 = v8;
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
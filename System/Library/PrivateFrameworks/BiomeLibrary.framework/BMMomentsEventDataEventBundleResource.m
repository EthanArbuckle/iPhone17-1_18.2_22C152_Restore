@interface BMMomentsEventDataEventBundleResource
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMomentsEventDataEventBundleResource)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMomentsEventDataEventBundleResource)initWithType:(int)a3 photoAssetMediaType:(int)a4 photoFaceCount:(id)a5 photoCurationScore:(id)a6 photoOverallAestheticScore:(id)a7;
- (BOOL)hasPhotoCurationScore;
- (BOOL)hasPhotoFaceCount;
- (BOOL)hasPhotoOverallAestheticScore;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)photoCurationScore;
- (double)photoOverallAestheticScore;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)photoAssetMediaType;
- (int)photoFaceCount;
- (int)type;
- (unsigned)dataVersion;
- (void)setHasPhotoCurationScore:(BOOL)a3;
- (void)setHasPhotoFaceCount:(BOOL)a3;
- (void)setHasPhotoOverallAestheticScore:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMomentsEventDataEventBundleResource

- (void)setHasPhotoOverallAestheticScore:(BOOL)a3
{
  self->_hasPhotoOverallAestheticScore = a3;
}

- (BOOL)hasPhotoOverallAestheticScore
{
  return self->_hasPhotoOverallAestheticScore;
}

- (double)photoOverallAestheticScore
{
  return self->_photoOverallAestheticScore;
}

- (void)setHasPhotoCurationScore:(BOOL)a3
{
  self->_hasPhotoCurationScore = a3;
}

- (BOOL)hasPhotoCurationScore
{
  return self->_hasPhotoCurationScore;
}

- (double)photoCurationScore
{
  return self->_photoCurationScore;
}

- (void)setHasPhotoFaceCount:(BOOL)a3
{
  self->_hasPhotoFaceCount = a3;
}

- (BOOL)hasPhotoFaceCount
{
  return self->_hasPhotoFaceCount;
}

- (int)photoFaceCount
{
  return self->_photoFaceCount;
}

- (int)photoAssetMediaType
{
  return self->_photoAssetMediaType;
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
    int v6 = [(BMMomentsEventDataEventBundleResource *)self type];
    if (v6 != [v5 type]) {
      goto LABEL_20;
    }
    int v7 = [(BMMomentsEventDataEventBundleResource *)self photoAssetMediaType];
    if (v7 != [v5 photoAssetMediaType]) {
      goto LABEL_20;
    }
    if ([(BMMomentsEventDataEventBundleResource *)self hasPhotoFaceCount]
      || [v5 hasPhotoFaceCount])
    {
      if (![(BMMomentsEventDataEventBundleResource *)self hasPhotoFaceCount]) {
        goto LABEL_20;
      }
      if (![v5 hasPhotoFaceCount]) {
        goto LABEL_20;
      }
      int v8 = [(BMMomentsEventDataEventBundleResource *)self photoFaceCount];
      if (v8 != [v5 photoFaceCount]) {
        goto LABEL_20;
      }
    }
    if ([(BMMomentsEventDataEventBundleResource *)self hasPhotoCurationScore]
      || [v5 hasPhotoCurationScore])
    {
      if (![(BMMomentsEventDataEventBundleResource *)self hasPhotoCurationScore]) {
        goto LABEL_20;
      }
      if (![v5 hasPhotoCurationScore]) {
        goto LABEL_20;
      }
      [(BMMomentsEventDataEventBundleResource *)self photoCurationScore];
      double v10 = v9;
      [v5 photoCurationScore];
      if (v10 != v11) {
        goto LABEL_20;
      }
    }
    if (![(BMMomentsEventDataEventBundleResource *)self hasPhotoOverallAestheticScore]
      && ![v5 hasPhotoOverallAestheticScore])
    {
      BOOL v15 = 1;
      goto LABEL_21;
    }
    if ([(BMMomentsEventDataEventBundleResource *)self hasPhotoOverallAestheticScore]
      && [v5 hasPhotoOverallAestheticScore])
    {
      [(BMMomentsEventDataEventBundleResource *)self photoOverallAestheticScore];
      double v13 = v12;
      [v5 photoOverallAestheticScore];
      BOOL v15 = v13 == v14;
    }
    else
    {
LABEL_20:
      BOOL v15 = 0;
    }
LABEL_21:

    goto LABEL_22;
  }
  BOOL v15 = 0;
LABEL_22:

  return v15;
}

- (id)jsonDictionary
{
  v22[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundleResource type](self, "type"));
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundleResource photoAssetMediaType](self, "photoAssetMediaType"));
  if ([(BMMomentsEventDataEventBundleResource *)self hasPhotoFaceCount])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundleResource photoFaceCount](self, "photoFaceCount"));
  }
  else
  {
    id v5 = 0;
  }
  if (![(BMMomentsEventDataEventBundleResource *)self hasPhotoCurationScore]
    || ([(BMMomentsEventDataEventBundleResource *)self photoCurationScore], fabs(v6) == INFINITY))
  {
    int v8 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleResource *)self photoCurationScore];
    int v7 = NSNumber;
    [(BMMomentsEventDataEventBundleResource *)self photoCurationScore];
    int v8 = objc_msgSend(v7, "numberWithDouble:");
  }
  if (![(BMMomentsEventDataEventBundleResource *)self hasPhotoOverallAestheticScore]
    || ([(BMMomentsEventDataEventBundleResource *)self photoOverallAestheticScore],
        fabs(v9) == INFINITY))
  {
    double v11 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleResource *)self photoOverallAestheticScore];
    double v10 = NSNumber;
    [(BMMomentsEventDataEventBundleResource *)self photoOverallAestheticScore];
    double v11 = objc_msgSend(v10, "numberWithDouble:");
  }
  uint64_t v19 = v3;
  v21[0] = @"type";
  double v12 = (void *)v3;
  if (!v3)
  {
    double v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[0] = v12;
  v21[1] = @"photoAssetMediaType";
  double v13 = v4;
  if (!v4)
  {
    double v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[1] = v13;
  v21[2] = @"photoFaceCount";
  double v14 = v5;
  if (!v5)
  {
    double v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v14;
  v21[3] = @"photoCurationScore";
  BOOL v15 = v8;
  if (!v8)
  {
    BOOL v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v15;
  v21[4] = @"photoOverallAestheticScore";
  v16 = v11;
  if (!v11)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v16;
  v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, v21, 5, v19);
  if (v11)
  {
    if (v8) {
      goto LABEL_24;
    }
  }
  else
  {

    if (v8)
    {
LABEL_24:
      if (v5) {
        goto LABEL_25;
      }
LABEL_33:

      if (v4) {
        goto LABEL_26;
      }
      goto LABEL_34;
    }
  }

  if (!v5) {
    goto LABEL_33;
  }
LABEL_25:
  if (v4) {
    goto LABEL_26;
  }
LABEL_34:

LABEL_26:
  if (!v20) {

  }
  return v17;
}

- (BMMomentsEventDataEventBundleResource)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"type"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v41 = 0;
LABEL_9:
    double v9 = [v6 objectForKeyedSubscript:@"photoAssetMediaType"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v10 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v17 = 0;
            goto LABEL_44;
          }
          id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
          v32 = a4;
          uint64_t v33 = *MEMORY[0x1E4F502C8];
          uint64_t v48 = *MEMORY[0x1E4F28568];
          id v40 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"photoAssetMediaType"];
          id v49 = v40;
          double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          id v34 = (id)[v31 initWithDomain:v33 code:2 userInfo:v11];
          a4 = 0;
          v17 = 0;
          id *v32 = v34;
          goto LABEL_43;
        }
        double v10 = [NSNumber numberWithInt:BMMomentsEventDataEventBundleResourcePhotoAssetMediaTypeFromString(v9)];
      }
      v39 = v10;
    }
    else
    {
      v39 = 0;
    }
    double v11 = [v6 objectForKeyedSubscript:@"photoFaceCount"];
    v38 = v7;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v40 = 0;
          v17 = 0;
          a4 = v39;
          goto LABEL_43;
        }
        double v12 = self;
        id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v19 = *MEMORY[0x1E4F502C8];
        uint64_t v46 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"photoFaceCount"];
        id v47 = v14;
        double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        v17 = 0;
        id v40 = 0;
        *a4 = (id)[v18 initWithDomain:v19 code:2 userInfo:v13];
        goto LABEL_52;
      }
      double v12 = self;
      id v40 = v11;
    }
    else
    {
      double v12 = self;
      id v40 = 0;
    }
    double v13 = [v6 objectForKeyedSubscript:@"photoCurationScore"];
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v14 = 0;
      goto LABEL_23;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v13;
LABEL_23:
      BOOL v15 = [v6 objectForKeyedSubscript:@"photoOverallAestheticScore"];
      if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v16 = 0;
LABEL_26:
        a4 = v39;
        v17 = -[BMMomentsEventDataEventBundleResource initWithType:photoAssetMediaType:photoFaceCount:photoCurationScore:photoOverallAestheticScore:](v12, "initWithType:photoAssetMediaType:photoFaceCount:photoCurationScore:photoOverallAestheticScore:", [v41 intValue], objc_msgSend(v39, "intValue"), v40, v14, v16);
        double v12 = v17;
LABEL_41:

LABEL_42:
        self = v12;
        int v7 = v38;
LABEL_43:

        goto LABEL_44;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        goto LABEL_26;
      }
      if (a4)
      {
        id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v35 = *MEMORY[0x1E4F502C8];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        v23 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"photoOverallAestheticScore"];
        v43 = v23;
        v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        *a4 = (id)[v37 initWithDomain:v35 code:2 userInfo:v24];
      }
      id v16 = 0;
      v17 = 0;
LABEL_40:
      a4 = v39;
      goto LABEL_41;
    }
    if (a4)
    {
      id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
      v36 = a4;
      uint64_t v21 = *MEMORY[0x1E4F502C8];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"photoCurationScore"];
      id v45 = v16;
      BOOL v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      id v22 = (id)[v20 initWithDomain:v21 code:2 userInfo:v15];
      v17 = 0;
      id v14 = 0;
      id *v36 = v22;
      goto LABEL_40;
    }
    id v14 = 0;
    v17 = 0;
LABEL_52:
    a4 = v39;
    goto LABEL_42;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_8:
    v41 = v8;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [NSNumber numberWithInt:BMMomentsEventDataEventBundleResourceTypeFromString(v7)];
    goto LABEL_8;
  }
  if (!a4)
  {
    v41 = 0;
    v17 = 0;
    goto LABEL_45;
  }
  id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
  v27 = a4;
  uint64_t v28 = *MEMORY[0x1E4F502C8];
  uint64_t v50 = *MEMORY[0x1E4F28568];
  v29 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"type"];
  v51[0] = v29;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
  uint64_t v30 = v28;
  a4 = v29;
  v41 = 0;
  v17 = 0;
  id *v27 = (id)[v26 initWithDomain:v30 code:2 userInfo:v9];
LABEL_44:

LABEL_45:
  return v17;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMomentsEventDataEventBundleResource *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasPhotoFaceCount) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasPhotoCurationScore) {
    PBDataWriterWriteDoubleField();
  }
  id v4 = v5;
  if (self->_hasPhotoOverallAestheticScore)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)BMMomentsEventDataEventBundleResource;
  id v5 = [(BMEventBase *)&v49 init];
  if (!v5) {
    goto LABEL_74;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
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
              goto LABEL_50;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_52;
            }
          }
          v4[*v8] = 1;
LABEL_50:
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_52:
          if (v22 >= 0x11) {
            LODWORD(v22) = 0;
          }
          uint64_t v45 = 24;
          goto LABEL_61;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v22 = 0;
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
              v22 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                BOOL v17 = v28++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_58:
          if (v22 >= 4) {
            LODWORD(v22) = 0;
          }
          uint64_t v45 = 28;
LABEL_61:
          *(_DWORD *)((char *)&v5->super.super.isa + v45) = v22;
          continue;
        case 3u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          v5->_hasPhotoFaceCount = 1;
          break;
        case 4u:
          v5->_hasPhotoCurationScore = 1;
          uint64_t v40 = *v6;
          unint64_t v41 = *(void *)&v4[v40];
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v42 = *(objc_class **)(*(void *)&v4[*v9] + v41);
            *(void *)&v4[v40] = v41 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v42 = 0;
          }
          uint64_t v46 = 40;
          goto LABEL_70;
        case 5u:
          v5->_hasPhotoOverallAestheticScore = 1;
          uint64_t v43 = *v6;
          unint64_t v44 = *(void *)&v4[v43];
          if (v44 <= 0xFFFFFFFFFFFFFFF7 && v44 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v42 = *(objc_class **)(*(void *)&v4[*v9] + v44);
            *(void *)&v4[v43] = v44 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v42 = 0;
          }
          uint64_t v46 = 48;
LABEL_70:
          *(Class *)((char *)&v5->super.super.isa + v46) = v42;
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_73;
          }
          continue;
      }
      while (1)
      {
        uint64_t v36 = *v6;
        uint64_t v37 = *(void *)&v4[v36];
        unint64_t v38 = v37 + 1;
        if (v37 == -1 || v38 > *(void *)&v4[*v7]) {
          break;
        }
        char v39 = *(unsigned char *)(*(void *)&v4[*v9] + v37);
        *(void *)&v4[v36] = v38;
        v35 |= (unint64_t)(v39 & 0x7F) << v33;
        if ((v39 & 0x80) == 0) {
          goto LABEL_63;
        }
        v33 += 7;
        BOOL v17 = v34++ >= 9;
        if (v17)
        {
          LODWORD(v35) = 0;
          goto LABEL_65;
        }
      }
      v4[*v8] = 1;
LABEL_63:
      if (v4[*v8]) {
        LODWORD(v35) = 0;
      }
LABEL_65:
      v5->_photoFaceCount = v35;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_73:
  }
    id v47 = 0;
  else {
LABEL_74:
  }
    id v47 = v5;

  return v47;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMMomentsEventDataEventBundleResourceTypeAsString([(BMMomentsEventDataEventBundleResource *)self type]);
  id v5 = BMMomentsEventDataEventBundleResourcePhotoAssetMediaTypeAsString([(BMMomentsEventDataEventBundleResource *)self photoAssetMediaType]);
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundleResource photoFaceCount](self, "photoFaceCount"));
  int v7 = NSNumber;
  [(BMMomentsEventDataEventBundleResource *)self photoCurationScore];
  id v8 = objc_msgSend(v7, "numberWithDouble:");
  double v9 = NSNumber;
  [(BMMomentsEventDataEventBundleResource *)self photoOverallAestheticScore];
  char v10 = objc_msgSend(v9, "numberWithDouble:");
  unsigned int v11 = (void *)[v3 initWithFormat:@"BMMomentsEventDataEventBundleResource with type: %@, photoAssetMediaType: %@, photoFaceCount: %@, photoCurationScore: %@, photoOverallAestheticScore: %@", v4, v5, v6, v8, v10];

  return (NSString *)v11;
}

- (BMMomentsEventDataEventBundleResource)initWithType:(int)a3 photoAssetMediaType:(int)a4 photoFaceCount:(id)a5 photoCurationScore:(id)a6 photoOverallAestheticScore:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMMomentsEventDataEventBundleResource;
  unint64_t v15 = [(BMEventBase *)&v20 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v15->_type = a3;
    v15->_photoAssetMediaType = a4;
    if (v12)
    {
      v15->_hasPhotoFaceCount = 1;
      int v16 = [v12 intValue];
    }
    else
    {
      v15->_hasPhotoFaceCount = 0;
      int v16 = -1;
    }
    v15->_photoFaceCount = v16;
    if (v13)
    {
      v15->_hasPhotoCurationScore = 1;
      [v13 doubleValue];
    }
    else
    {
      v15->_hasPhotoCurationScore = 0;
      double v17 = -1.0;
    }
    v15->_photoCurationScore = v17;
    if (v14)
    {
      v15->_hasPhotoOverallAestheticScore = 1;
      [v14 doubleValue];
    }
    else
    {
      v15->_hasPhotoOverallAestheticScore = 0;
      double v18 = -1.0;
    }
    v15->_photoOverallAestheticScore = v18;
  }

  return v15;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"type" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"photoAssetMediaType", 2, 4, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"photoFaceCount" number:3 type:2 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"photoCurationScore" number:4 type:0 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"photoOverallAestheticScore" number:5 type:0 subMessageClass:0];
  v9[4] = v6;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF32B8;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"photoAssetMediaType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"photoFaceCount" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"photoCurationScore" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"photoOverallAestheticScore" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
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
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMMomentsEventDataEventBundleResource alloc] initByReadFrom:v7];
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
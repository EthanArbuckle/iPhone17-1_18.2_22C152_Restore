@interface BMAeroMLPhotosSearchSessionAsset
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAeroMLPhotosSearchSessionAsset)initWithAssetUUID:(id)a3 rankingIndex:(id)a4 cosDistance:(id)a5;
- (BMAeroMLPhotosSearchSessionAsset)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasCosDistance;
- (BOOL)hasRankingIndex;
- (BOOL)isEqual:(id)a3;
- (NSString)assetUUID;
- (NSString)description;
- (double)cosDistance;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (unsigned)rankingIndex;
- (void)setHasCosDistance:(BOOL)a3;
- (void)setHasRankingIndex:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMAeroMLPhotosSearchSessionAsset

- (void).cxx_destruct
{
}

- (void)setHasCosDistance:(BOOL)a3
{
  self->_hasCosDistance = a3;
}

- (BOOL)hasCosDistance
{
  return self->_hasCosDistance;
}

- (double)cosDistance
{
  return self->_cosDistance;
}

- (void)setHasRankingIndex:(BOOL)a3
{
  self->_hasRankingIndex = a3;
}

- (BOOL)hasRankingIndex
{
  return self->_hasRankingIndex;
}

- (unsigned)rankingIndex
{
  return self->_rankingIndex;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
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
    v6 = [(BMAeroMLPhotosSearchSessionAsset *)self assetUUID];
    uint64_t v7 = [v5 assetUUID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMAeroMLPhotosSearchSessionAsset *)self assetUUID];
      v10 = [v5 assetUUID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_17;
      }
    }
    if (![(BMAeroMLPhotosSearchSessionAsset *)self hasRankingIndex]
      && ![v5 hasRankingIndex]
      || [(BMAeroMLPhotosSearchSessionAsset *)self hasRankingIndex]
      && [v5 hasRankingIndex]
      && (unsigned int v13 = [(BMAeroMLPhotosSearchSessionAsset *)self rankingIndex],
          v13 == [v5 rankingIndex]))
    {
      if (![(BMAeroMLPhotosSearchSessionAsset *)self hasCosDistance]
        && ![v5 hasCosDistance])
      {
        BOOL v12 = 1;
        goto LABEL_18;
      }
      if ([(BMAeroMLPhotosSearchSessionAsset *)self hasCosDistance]
        && [v5 hasCosDistance])
      {
        [(BMAeroMLPhotosSearchSessionAsset *)self cosDistance];
        double v15 = v14;
        [v5 cosDistance];
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
  v3 = [(BMAeroMLPhotosSearchSessionAsset *)self assetUUID];
  if ([(BMAeroMLPhotosSearchSessionAsset *)self hasRankingIndex])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchSessionAsset rankingIndex](self, "rankingIndex"));
  }
  else
  {
    id v4 = 0;
  }
  if (![(BMAeroMLPhotosSearchSessionAsset *)self hasCosDistance]
    || ([(BMAeroMLPhotosSearchSessionAsset *)self cosDistance], fabs(v5) == INFINITY))
  {
    uint64_t v7 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchSessionAsset *)self cosDistance];
    v6 = NSNumber;
    [(BMAeroMLPhotosSearchSessionAsset *)self cosDistance];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  }
  v13[0] = @"assetUUID";
  v8 = v3;
  if (!v3)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v8;
  v13[1] = @"rankingIndex";
  v9 = v4;
  if (!v4)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v9;
  v13[2] = @"cosDistance";
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

- (BMAeroMLPhotosSearchSessionAsset)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"assetUUID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"rankingIndex"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          unsigned int v13 = 0;
          goto LABEL_12;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v18 = *MEMORY[0x1E4F502C8];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"rankingIndex"];
        id v28 = v12;
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v19 = (id)[v23 initWithDomain:v18 code:2 userInfo:v11];
        unsigned int v13 = 0;
        id v10 = 0;
        *a4 = v19;
        goto LABEL_11;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"cosDistance"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v22 = *MEMORY[0x1E4F502C8];
          uint64_t v25 = *MEMORY[0x1E4F28568];
          v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cosDistance"];
          v26 = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          *a4 = (id)[v24 initWithDomain:v22 code:2 userInfo:v21];
        }
        id v12 = 0;
        unsigned int v13 = 0;
        goto LABEL_11;
      }
      id v12 = v11;
    }
    else
    {
      id v12 = 0;
    }
    self = [(BMAeroMLPhotosSearchSessionAsset *)self initWithAssetUUID:v8 rankingIndex:v10 cosDistance:v12];
    unsigned int v13 = self;
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    unsigned int v13 = 0;
    id v8 = 0;
    goto LABEL_13;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"assetUUID"];
  v30[0] = v10;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  id v17 = (id)[v15 initWithDomain:v16 code:2 userInfo:v9];
  unsigned int v13 = 0;
  id v8 = 0;
  *a4 = v17;
LABEL_12:

LABEL_13:
  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMAeroMLPhotosSearchSessionAsset *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_assetUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasRankingIndex)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasCosDistance)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMAeroMLPhotosSearchSessionAsset;
  id v5 = [(BMEventBase *)&v35 init];
  if (!v5) {
    goto LABEL_44;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v9 = (int *)MEMORY[0x1E4F940B8];
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
      unint64_t v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v5->_hasCosDistance = 1;
        uint64_t v23 = *v6;
        unint64_t v24 = *(void *)&v4[v23];
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v7])
        {
          double v25 = *(double *)(*(void *)&v4[*v9] + v24);
          *(void *)&v4[v23] = v24 + 8;
        }
        else
        {
          v4[*v8] = 1;
          double v25 = 0.0;
        }
        v5->_cosDistance = v25;
      }
      else if (v20 == 2)
      {
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        v5->_hasRankingIndex = 1;
        while (1)
        {
          uint64_t v29 = *v6;
          uint64_t v30 = *(void *)&v4[v29];
          unint64_t v31 = v30 + 1;
          if (v30 == -1 || v31 > *(void *)&v4[*v7]) {
            break;
          }
          char v32 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
          *(void *)&v4[v29] = v31;
          v28 |= (unint64_t)(v32 & 0x7F) << v26;
          if ((v32 & 0x80) == 0) {
            goto LABEL_36;
          }
          v26 += 7;
          BOOL v17 = v27++ >= 9;
          if (v17)
          {
            LODWORD(v28) = 0;
            goto LABEL_38;
          }
        }
        v4[*v8] = 1;
LABEL_36:
        if (v4[*v8]) {
          LODWORD(v28) = 0;
        }
LABEL_38:
        v5->_rankingIndex = v28;
      }
      else if (v20 == 1)
      {
        uint64_t v21 = PBReaderReadString();
        assetUUID = v5->_assetUUID;
        v5->_assetUUID = (NSString *)v21;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_43;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_43:
  }
    v33 = 0;
  else {
LABEL_44:
  }
    v33 = v5;

  return v33;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMAeroMLPhotosSearchSessionAsset *)self assetUUID];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchSessionAsset rankingIndex](self, "rankingIndex"));
  id v6 = NSNumber;
  [(BMAeroMLPhotosSearchSessionAsset *)self cosDistance];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  id v8 = (void *)[v3 initWithFormat:@"BMAeroMLPhotosSearchSessionAsset with assetUUID: %@, rankingIndex: %@, cosDistance: %@", v4, v5, v7];

  return (NSString *)v8;
}

- (BMAeroMLPhotosSearchSessionAsset)initWithAssetUUID:(id)a3 rankingIndex:(id)a4 cosDistance:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BMAeroMLPhotosSearchSessionAsset;
  unint64_t v12 = [(BMEventBase *)&v16 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_assetUUID, a3);
    if (v10)
    {
      v12->_hasRankingIndex = 1;
      unsigned int v13 = [v10 unsignedIntValue];
    }
    else
    {
      unsigned int v13 = 0;
      v12->_hasRankingIndex = 0;
    }
    v12->_rankingIndex = v13;
    if (v11)
    {
      v12->_hasCosDistance = 1;
      [v11 doubleValue];
    }
    else
    {
      v12->_hasCosDistance = 0;
      double v14 = -1.0;
    }
    v12->_cosDistance = v14;
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"assetUUID" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"rankingIndex", 2, 4, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cosDistance" number:3 type:0 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3540;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"assetUUID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rankingIndex" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cosDistance" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

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

    id v8 = [[BMAeroMLPhotosSearchSessionAsset alloc] initByReadFrom:v7];
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
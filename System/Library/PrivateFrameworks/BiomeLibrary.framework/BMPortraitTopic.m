@interface BMPortraitTopic
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPortraitTopic)initWithIdentifier:(id)a3 algorithm:(int)a4 decayRate:(id)a5 score:(id)a6 osBuild:(id)a7 assetVersion:(id)a8;
- (BMPortraitTopic)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasAssetVersion;
- (BOOL)hasDecayRate;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (NSString)osBuild;
- (double)decayRate;
- (double)score;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)algorithm;
- (int)assetVersion;
- (unsigned)dataVersion;
- (void)setHasAssetVersion:(BOOL)a3;
- (void)setHasDecayRate:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPortraitTopic

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osBuild, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setHasAssetVersion:(BOOL)a3
{
  self->_hasAssetVersion = a3;
}

- (BOOL)hasAssetVersion
{
  return self->_hasAssetVersion;
}

- (int)assetVersion
{
  return self->_assetVersion;
}

- (NSString)osBuild
{
  return self->_osBuild;
}

- (void)setHasScore:(BOOL)a3
{
  self->_hasScore = a3;
}

- (BOOL)hasScore
{
  return self->_hasScore;
}

- (double)score
{
  return self->_score;
}

- (void)setHasDecayRate:(BOOL)a3
{
  self->_hasDecayRate = a3;
}

- (BOOL)hasDecayRate
{
  return self->_hasDecayRate;
}

- (double)decayRate
{
  return self->_decayRate;
}

- (int)algorithm
{
  return self->_algorithm;
}

- (NSString)identifier
{
  return self->_identifier;
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
    v6 = [(BMPortraitTopic *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMPortraitTopic *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_27;
      }
    }
    int v13 = [(BMPortraitTopic *)self algorithm];
    if (v13 != [v5 algorithm]) {
      goto LABEL_27;
    }
    if (-[BMPortraitTopic hasDecayRate](self, "hasDecayRate") || [v5 hasDecayRate])
    {
      if (![(BMPortraitTopic *)self hasDecayRate]) {
        goto LABEL_27;
      }
      if (![v5 hasDecayRate]) {
        goto LABEL_27;
      }
      [(BMPortraitTopic *)self decayRate];
      double v15 = v14;
      [v5 decayRate];
      if (v15 != v16) {
        goto LABEL_27;
      }
    }
    if (-[BMPortraitTopic hasScore](self, "hasScore") || [v5 hasScore])
    {
      if (![(BMPortraitTopic *)self hasScore]) {
        goto LABEL_27;
      }
      if (![v5 hasScore]) {
        goto LABEL_27;
      }
      [(BMPortraitTopic *)self score];
      double v18 = v17;
      [v5 score];
      if (v18 != v19) {
        goto LABEL_27;
      }
    }
    v20 = [(BMPortraitTopic *)self osBuild];
    uint64_t v21 = [v5 osBuild];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMPortraitTopic *)self osBuild];
      v24 = [v5 osBuild];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_27;
      }
    }
    if (![(BMPortraitTopic *)self hasAssetVersion]
      && ![v5 hasAssetVersion])
    {
      BOOL v12 = 1;
      goto LABEL_28;
    }
    if ([(BMPortraitTopic *)self hasAssetVersion]
      && [v5 hasAssetVersion])
    {
      int v26 = [(BMPortraitTopic *)self assetVersion];
      BOOL v12 = v26 == [v5 assetVersion];
LABEL_28:

      goto LABEL_29;
    }
LABEL_27:
    BOOL v12 = 0;
    goto LABEL_28;
  }
  BOOL v12 = 0;
LABEL_29:

  return v12;
}

- (id)jsonDictionary
{
  v26[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMPortraitTopic *)self identifier];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPortraitTopic algorithm](self, "algorithm"));
  if (![(BMPortraitTopic *)self hasDecayRate]
    || ([(BMPortraitTopic *)self decayRate], fabs(v5) == INFINITY))
  {
    uint64_t v7 = 0;
  }
  else
  {
    [(BMPortraitTopic *)self decayRate];
    v6 = NSNumber;
    [(BMPortraitTopic *)self decayRate];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  }
  if (![(BMPortraitTopic *)self hasScore] || ([(BMPortraitTopic *)self score], fabs(v8) == INFINITY))
  {
    v10 = 0;
  }
  else
  {
    [(BMPortraitTopic *)self score];
    v9 = NSNumber;
    [(BMPortraitTopic *)self score];
    v10 = objc_msgSend(v9, "numberWithDouble:");
  }
  int v11 = [(BMPortraitTopic *)self osBuild];
  if ([(BMPortraitTopic *)self hasAssetVersion])
  {
    BOOL v12 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPortraitTopic assetVersion](self, "assetVersion"));
  }
  else
  {
    BOOL v12 = 0;
  }
  v24 = (void *)v3;
  v25[0] = @"identifier";
  uint64_t v13 = v3;
  if (!v3)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v21 = v13;
  v23 = (void *)v4;
  v26[0] = v13;
  v25[1] = @"algorithm";
  double v14 = (void *)v4;
  if (!v4)
  {
    double v14 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v13);
  }
  v26[1] = v14;
  v25[2] = @"decayRate";
  double v15 = v7;
  if (!v7)
  {
    double v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[2] = v15;
  v25[3] = @"score";
  double v16 = v10;
  if (!v10)
  {
    double v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[3] = v16;
  v25[4] = @"osBuild";
  double v17 = v11;
  if (!v11)
  {
    double v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[4] = v17;
  v25[5] = @"assetVersion";
  double v18 = v12;
  if (!v12)
  {
    double v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[5] = v18;
  double v19 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v26, v25, 6, v21);
  if (v12)
  {
    if (v11) {
      goto LABEL_26;
    }
  }
  else
  {

    if (v11)
    {
LABEL_26:
      if (v10) {
        goto LABEL_27;
      }
LABEL_37:

      if (v7) {
        goto LABEL_28;
      }
      goto LABEL_38;
    }
  }

  if (!v10) {
    goto LABEL_37;
  }
LABEL_27:
  if (v7) {
    goto LABEL_28;
  }
LABEL_38:

LABEL_28:
  if (!v23) {

  }
  if (!v24) {

  }
  return v19;
}

- (BMPortraitTopic)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"identifier"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"algorithm"];
    v46 = (void *)v9;
    if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v45 = v10;
      }
      else
      {
        v24 = a4;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            double v18 = 0;
            double v19 = 0;
            goto LABEL_50;
          }
          id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
          id v39 = v8;
          uint64_t v40 = *MEMORY[0x1E4F502C8];
          uint64_t v58 = *MEMORY[0x1E4F28568];
          id v49 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"algorithm"];
          id v59 = v49;
          int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
          uint64_t v41 = v40;
          id v8 = v39;
          double v18 = 0;
          double v19 = 0;
          id *v24 = (id)[v38 initWithDomain:v41 code:2 userInfo:v11];
          goto LABEL_49;
        }
        id v45 = [NSNumber numberWithInt:BMPortraitTopicAlgorithmFromString(v10)];
      }
    }
    else
    {
      id v45 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"decayRate"];
    v44 = v7;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v49 = 0;
          double v19 = 0;
          double v18 = v45;
          goto LABEL_49;
        }
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v26 = v8;
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v56 = *MEMORY[0x1E4F28568];
        id v48 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"decayRate"];
        id v57 = v48;
        BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        uint64_t v28 = v27;
        id v8 = v26;
        double v19 = 0;
        id v49 = 0;
        *a4 = (id)[v25 initWithDomain:v28 code:2 userInfo:v12];
        goto LABEL_57;
      }
      id v49 = v11;
    }
    else
    {
      id v49 = 0;
    }
    BOOL v12 = [v6 objectForKeyedSubscript:@"score"];
    id v47 = v8;
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v48 = 0;
      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v48 = v12;
LABEL_13:
      uint64_t v13 = [v6 objectForKeyedSubscript:@"osBuild"];
      if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        double v14 = self;
        id v15 = 0;
        goto LABEL_16;
      }
      objc_opt_class();
      double v14 = self;
      if (objc_opt_isKindOfClass())
      {
        id v15 = v13;
LABEL_16:
        double v16 = [v6 objectForKeyedSubscript:@"assetVersion"];
        if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v17 = 0;
LABEL_19:
          double v18 = v45;
          double v19 = -[BMPortraitTopic initWithIdentifier:algorithm:decayRate:score:osBuild:assetVersion:](v14, "initWithIdentifier:algorithm:decayRate:score:osBuild:assetVersion:", v47, [v45 intValue], v49, v48, v15, v17);
          double v14 = v19;
LABEL_46:

LABEL_47:
          self = v14;
          id v8 = v47;
LABEL_48:

          uint64_t v7 = v44;
LABEL_49:

          v10 = v46;
          goto LABEL_50;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v16;
          goto LABEL_19;
        }
        if (a4)
        {
          id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v42 = *MEMORY[0x1E4F502C8];
          uint64_t v50 = *MEMORY[0x1E4F28568];
          v35 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"assetVersion"];
          v51 = v35;
          v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
          *a4 = (id)[v43 initWithDomain:v42 code:2 userInfo:v36];
        }
        id v17 = 0;
        double v19 = 0;
LABEL_45:
        double v18 = v45;
        goto LABEL_46;
      }
      if (a4)
      {
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v33 = *MEMORY[0x1E4F502C8];
        uint64_t v52 = *MEMORY[0x1E4F28568];
        id v17 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"osBuild"];
        id v53 = v17;
        double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        id v34 = (id)[v32 initWithDomain:v33 code:2 userInfo:v16];
        double v19 = 0;
        id v15 = 0;
        *a4 = v34;
        goto LABEL_45;
      }
      id v15 = 0;
      double v19 = 0;
LABEL_59:
      double v18 = v45;
      goto LABEL_47;
    }
    if (a4)
    {
      double v14 = self;
      id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v30 = *MEMORY[0x1E4F502C8];
      uint64_t v54 = *MEMORY[0x1E4F28568];
      id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"score"];
      id v55 = v15;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      id v31 = (id)[v29 initWithDomain:v30 code:2 userInfo:v13];
      double v19 = 0;
      id v48 = 0;
      *a4 = v31;
      goto LABEL_59;
    }
    id v48 = 0;
    double v19 = 0;
LABEL_57:
    double v18 = v45;
    goto LABEL_48;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v8 = 0;
    double v19 = 0;
    goto LABEL_51;
  }
  id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v21 = *MEMORY[0x1E4F502C8];
  uint64_t v60 = *MEMORY[0x1E4F28568];
  uint64_t v22 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
  v61[0] = v22;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
  id v23 = (id)[v20 initWithDomain:v21 code:2 userInfo:v10];
  id v8 = 0;
  double v19 = 0;
  *a4 = v23;
  double v18 = (void *)v22;
LABEL_50:

LABEL_51:
  return v19;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMPortraitTopic *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasDecayRate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasScore) {
    PBDataWriterWriteDoubleField();
  }
  uint64_t v4 = v5;
  if (self->_osBuild)
  {
    PBDataWriterWriteStringField();
    uint64_t v4 = v5;
  }
  if (self->_hasAssetVersion)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  uint64_t v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)BMPortraitTopic;
  id v5 = [(BMEventBase *)&v45 init];
  if (!v5) {
    goto LABEL_63;
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
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 32;
          goto LABEL_37;
        case 2u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
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
                  goto LABEL_48;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_48:
          if (v24 >= 0xC) {
            LODWORD(v24) = 0;
          }
          v5->_algorithm = v24;
          continue;
        case 3u:
          v5->_hasDecayRate = 1;
          uint64_t v29 = *v6;
          unint64_t v30 = *(void *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)&v4[*v7])
          {
            id v31 = *(objc_class **)(*(void *)&v4[*v9] + v30);
            *(void *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v31 = 0;
          }
          uint64_t v42 = 40;
          goto LABEL_59;
        case 4u:
          v5->_hasScore = 1;
          uint64_t v32 = *v6;
          unint64_t v33 = *(void *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)&v4[*v7])
          {
            id v31 = *(objc_class **)(*(void *)&v4[*v9] + v33);
            *(void *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v31 = 0;
          }
          uint64_t v42 = 48;
LABEL_59:
          *(Class *)((char *)&v5->super.super.isa + v42) = v31;
          continue;
        case 5u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 56;
LABEL_37:
          id v34 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 6u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          v5->_hasAssetVersion = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_62;
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
        v37 |= (unint64_t)(v41 & 0x7F) << v35;
        if ((v41 & 0x80) == 0) {
          goto LABEL_52;
        }
        v35 += 7;
        BOOL v17 = v36++ >= 9;
        if (v17)
        {
          LODWORD(v37) = 0;
          goto LABEL_54;
        }
      }
      v4[*v8] = 1;
LABEL_52:
      if (v4[*v8]) {
        LODWORD(v37) = 0;
      }
LABEL_54:
      v5->_assetVersion = v37;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_62:
  }
    id v43 = 0;
  else {
LABEL_63:
  }
    id v43 = v5;

  return v43;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(BMPortraitTopic *)self identifier];
  id v5 = BMPortraitTopicAlgorithmAsString([(BMPortraitTopic *)self algorithm]);
  id v6 = NSNumber;
  [(BMPortraitTopic *)self decayRate];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  id v8 = NSNumber;
  [(BMPortraitTopic *)self score];
  uint64_t v9 = objc_msgSend(v8, "numberWithDouble:");
  char v10 = [(BMPortraitTopic *)self osBuild];
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPortraitTopic assetVersion](self, "assetVersion"));
  unint64_t v12 = (void *)[v3 initWithFormat:@"BMPortraitTopic with identifier: %@, algorithm: %@, decayRate: %@, score: %@, osBuild: %@, assetVersion: %@", v4, v5, v7, v9, v10, v11];

  return (NSString *)v12;
}

- (BMPortraitTopic)initWithIdentifier:(id)a3 algorithm:(int)a4 decayRate:(id)a5 score:(id)a6 osBuild:(id)a7 assetVersion:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)BMPortraitTopic;
  uint64_t v20 = [(BMEventBase *)&v25 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v20->_identifier, a3);
    v20->_algorithm = a4;
    if (v16)
    {
      v20->_hasDecayRate = 1;
      [v16 doubleValue];
    }
    else
    {
      v20->_hasDecayRate = 0;
      double v21 = -1.0;
    }
    v20->_decayRate = v21;
    if (v17)
    {
      v20->_hasScore = 1;
      [v17 doubleValue];
    }
    else
    {
      v20->_hasScore = 0;
      double v22 = -1.0;
    }
    v20->_score = v22;
    objc_storeStrong((id *)&v20->_osBuild, a7);
    if (v19)
    {
      v20->_hasAssetVersion = 1;
      int v23 = [v19 intValue];
    }
    else
    {
      v20->_hasAssetVersion = 0;
      int v23 = -1;
    }
    v20->_assetVersion = v23;
  }

  return v20;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:13 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"algorithm" number:2 type:4 subMessageClass:0];
  v10[1] = v3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"decayRate" number:3 type:0 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"score" number:4 type:0 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"osBuild" number:5 type:13 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"assetVersion" number:6 type:2 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3138;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"algorithm" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"decayRate" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"score" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"osBuild" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"assetVersion" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:2 convertedType:0];
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMPortraitTopic alloc] initByReadFrom:v7];
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
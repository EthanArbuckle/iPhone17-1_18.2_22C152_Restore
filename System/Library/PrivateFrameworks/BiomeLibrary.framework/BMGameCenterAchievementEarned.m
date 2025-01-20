@interface BMGameCenterAchievementEarned
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMGameCenterAchievementEarned)initWithAchievementID:(id)a3 achievementRarityPercent:(id)a4;
- (BMGameCenterAchievementEarned)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasAchievementRarityPercent;
- (BOOL)isEqual:(id)a3;
- (NSString)achievementID;
- (NSString)description;
- (double)achievementRarityPercent;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasAchievementRarityPercent:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMGameCenterAchievementEarned

- (void).cxx_destruct
{
}

- (void)setHasAchievementRarityPercent:(BOOL)a3
{
  self->_hasAchievementRarityPercent = a3;
}

- (BOOL)hasAchievementRarityPercent
{
  return self->_hasAchievementRarityPercent;
}

- (double)achievementRarityPercent
{
  return self->_achievementRarityPercent;
}

- (NSString)achievementID
{
  return self->_achievementID;
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
    v6 = [(BMGameCenterAchievementEarned *)self achievementID];
    uint64_t v7 = [v5 achievementID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMGameCenterAchievementEarned *)self achievementID];
      v10 = [v5 achievementID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_12;
      }
    }
    if (![(BMGameCenterAchievementEarned *)self hasAchievementRarityPercent]
      && ![v5 hasAchievementRarityPercent])
    {
      BOOL v12 = 1;
      goto LABEL_13;
    }
    if ([(BMGameCenterAchievementEarned *)self hasAchievementRarityPercent]
      && [v5 hasAchievementRarityPercent])
    {
      [(BMGameCenterAchievementEarned *)self achievementRarityPercent];
      double v14 = v13;
      [v5 achievementRarityPercent];
      BOOL v12 = v14 == v15;
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    BOOL v12 = 0;
    goto LABEL_13;
  }
  BOOL v12 = 0;
LABEL_14:

  return v12;
}

- (id)jsonDictionary
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMGameCenterAchievementEarned *)self achievementID];
  if (![(BMGameCenterAchievementEarned *)self hasAchievementRarityPercent]
    || ([(BMGameCenterAchievementEarned *)self achievementRarityPercent], fabs(v4) == INFINITY))
  {
    v6 = 0;
  }
  else
  {
    [(BMGameCenterAchievementEarned *)self achievementRarityPercent];
    id v5 = NSNumber;
    [(BMGameCenterAchievementEarned *)self achievementRarityPercent];
    v6 = objc_msgSend(v5, "numberWithDouble:");
  }
  v11[0] = @"achievementID";
  uint64_t v7 = v3;
  if (!v3)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = @"achievementRarityPercent";
  v12[0] = v7;
  v8 = v6;
  if (!v6)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  if (v6)
  {
    if (v3) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v3) {
      goto LABEL_11;
    }
  }

LABEL_11:

  return v9;
}

- (BMGameCenterAchievementEarned)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"achievementID"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        int v11 = 0;
        id v8 = 0;
        goto LABEL_9;
      }
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v14 = *MEMORY[0x1E4F502C8];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"achievementID"];
      v23[0] = v10;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v15 = (id)[v13 initWithDomain:v14 code:2 userInfo:v9];
      int v11 = 0;
      id v8 = 0;
      *a4 = v15;
      goto LABEL_8;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"achievementRarityPercent"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v17 = *MEMORY[0x1E4F502C8];
        uint64_t v20 = *MEMORY[0x1E4F28568];
        v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"achievementRarityPercent"];
        v21 = v18;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        *a4 = (id)[v16 initWithDomain:v17 code:2 userInfo:v19];
      }
      id v10 = 0;
      int v11 = 0;
      goto LABEL_8;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }
  self = [(BMGameCenterAchievementEarned *)self initWithAchievementID:v8 achievementRarityPercent:v10];
  int v11 = self;
LABEL_8:

LABEL_9:
  return v11;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMGameCenterAchievementEarned *)self writeTo:v3];
  double v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_achievementID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasAchievementRarityPercent)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BMGameCenterAchievementEarned;
  id v5 = [(BMEventBase *)&v27 init];
  if (!v5) {
    goto LABEL_32;
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
        if (v11++ >= 9)
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
      if ((v12 >> 3) == 2)
      {
        v5->_hasAchievementRarityPercent = 1;
        uint64_t v22 = *v6;
        unint64_t v23 = *(void *)&v4[v22];
        if (v23 <= 0xFFFFFFFFFFFFFFFBLL && v23 + 4 <= *(void *)&v4[*v7])
        {
          float v24 = *(float *)(*(void *)&v4[*v9] + v23);
          *(void *)&v4[v22] = v23 + 4;
        }
        else
        {
          v4[*v8] = 1;
          float v24 = 0.0;
        }
        v5->_achievementRarityPercent = v24;
      }
      else if ((v12 >> 3) == 1)
      {
        uint64_t v20 = PBReaderReadString();
        achievementID = v5->_achievementID;
        v5->_achievementID = (NSString *)v20;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_31;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_31:
  }
    v25 = 0;
  else {
LABEL_32:
  }
    v25 = v5;

  return v25;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMGameCenterAchievementEarned *)self achievementID];
  id v5 = NSNumber;
  [(BMGameCenterAchievementEarned *)self achievementRarityPercent];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMGameCenterAchievementEarned with achievementID: %@, achievementRarityPercent: %@", v4, v6];

  return (NSString *)v7;
}

- (BMGameCenterAchievementEarned)initWithAchievementID:(id)a3 achievementRarityPercent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BMGameCenterAchievementEarned;
  v9 = [(BMEventBase *)&v13 init];
  if (v9)
  {
    v9->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v9->_achievementID, a3);
    if (v8)
    {
      v9->_hasAchievementRarityPercent = 1;
      [v8 floatValue];
      double v11 = v10;
    }
    else
    {
      v9->_hasAchievementRarityPercent = 0;
      double v11 = -1.0;
    }
    v9->_achievementRarityPercent = v11;
  }

  return v9;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"achievementID" number:1 type:13 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"achievementRarityPercent" number:2 type:1 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6B70;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"achievementID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"achievementRarityPercent" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:1 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMGameCenterAchievementEarned alloc] initByReadFrom:v7];
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
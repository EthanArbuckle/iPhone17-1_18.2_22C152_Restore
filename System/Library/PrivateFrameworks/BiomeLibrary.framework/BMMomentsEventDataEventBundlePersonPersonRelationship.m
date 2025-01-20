@interface BMMomentsEventDataEventBundlePersonPersonRelationship
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMomentsEventDataEventBundlePersonPersonRelationship)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMomentsEventDataEventBundlePersonPersonRelationship)initWithPersonRelationshipTag:(int)a3 score:(id)a4;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)score;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)personRelationshipTag;
- (unsigned)dataVersion;
- (void)setHasScore:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMomentsEventDataEventBundlePersonPersonRelationship

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

- (int)personRelationshipTag
{
  return self->_personRelationshipTag;
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
    int v6 = [(BMMomentsEventDataEventBundlePersonPersonRelationship *)self personRelationshipTag];
    if (v6 != [v5 personRelationshipTag]) {
      goto LABEL_9;
    }
    if (![(BMMomentsEventDataEventBundlePersonPersonRelationship *)self hasScore]
      && ![v5 hasScore])
    {
      BOOL v10 = 1;
      goto LABEL_10;
    }
    if ([(BMMomentsEventDataEventBundlePersonPersonRelationship *)self hasScore]
      && [v5 hasScore])
    {
      [(BMMomentsEventDataEventBundlePersonPersonRelationship *)self score];
      double v8 = v7;
      [v5 score];
      BOOL v10 = v8 == v9;
    }
    else
    {
LABEL_9:
      BOOL v10 = 0;
    }
LABEL_10:

    goto LABEL_11;
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (id)jsonDictionary
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundlePersonPersonRelationship personRelationshipTag](self, "personRelationshipTag"));
  if (![(BMMomentsEventDataEventBundlePersonPersonRelationship *)self hasScore]
    || ([(BMMomentsEventDataEventBundlePersonPersonRelationship *)self score], fabs(v4) == INFINITY))
  {
    int v6 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundlePersonPersonRelationship *)self score];
    id v5 = NSNumber;
    [(BMMomentsEventDataEventBundlePersonPersonRelationship *)self score];
    int v6 = objc_msgSend(v5, "numberWithDouble:");
  }
  v11[0] = @"personRelationshipTag";
  double v7 = v3;
  if (!v3)
  {
    double v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = @"score";
  v12[0] = v7;
  double v8 = v6;
  if (!v6)
  {
    double v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
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

- (BMMomentsEventDataEventBundlePersonPersonRelationship)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"personRelationshipTag"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          double v8 = 0;
          v12 = 0;
          goto LABEL_14;
        }
        id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v19 = *MEMORY[0x1E4F502C8];
        uint64_t v23 = *MEMORY[0x1E4F28568];
        id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"personRelationshipTag"];
        v24[0] = v11;
        BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
        id v20 = (id)[v18 initWithDomain:v19 code:2 userInfo:v10];
        double v8 = 0;
        v12 = 0;
        *a4 = v20;
        goto LABEL_13;
      }
      id v9 = [NSNumber numberWithInt:BMMomentsEventDataPersonRelationshipTagFromString(v7)];
    }
    double v8 = v9;
  }
  else
  {
    double v8 = 0;
  }
  BOOL v10 = [v6 objectForKeyedSubscript:@"score"];
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v15 = *MEMORY[0x1E4F502C8];
        uint64_t v21 = *MEMORY[0x1E4F28568];
        v16 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"score"];
        v22 = v16;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        *a4 = (id)[v14 initWithDomain:v15 code:2 userInfo:v17];
      }
      id v11 = 0;
      v12 = 0;
      goto LABEL_13;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }
  self = -[BMMomentsEventDataEventBundlePersonPersonRelationship initWithPersonRelationshipTag:score:](self, "initWithPersonRelationshipTag:score:", [v8 intValue], v11);
  v12 = self;
LABEL_13:

LABEL_14:
  return v12;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMomentsEventDataEventBundlePersonPersonRelationship *)self writeTo:v3];
  double v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasScore) {
    PBDataWriterWriteDoubleField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMMomentsEventDataEventBundlePersonPersonRelationship;
  id v5 = [(BMEventBase *)&v32 init];
  if (!v5) {
    goto LABEL_44;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  double v7 = (int *)MEMORY[0x1E4F940E0];
  double v8 = (int *)MEMORY[0x1E4F940C8];
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
      if ((v12 >> 3) == 2)
      {
        v5->_hasScore = 1;
        uint64_t v27 = *v6;
        unint64_t v28 = *(void *)&v4[v27];
        if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(void *)&v4[*v7])
        {
          double v29 = *(double *)(*(void *)&v4[*v9] + v28);
          *(void *)&v4[v27] = v28 + 8;
        }
        else
        {
          v4[*v8] = 1;
          double v29 = 0.0;
        }
        v5->_score = v29;
      }
      else if ((v12 >> 3) == 1)
      {
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
            goto LABEL_34;
          }
          v20 += 7;
          BOOL v17 = v21++ >= 9;
          if (v17)
          {
            LODWORD(v22) = 0;
            goto LABEL_36;
          }
        }
        v4[*v8] = 1;
LABEL_34:
        if (v4[*v8]) {
          LODWORD(v22) = 0;
        }
LABEL_36:
        if (v22 >= 0x1E) {
          LODWORD(v22) = 0;
        }
        v5->_personRelationshipTag = v22;
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
    v30 = 0;
  else {
LABEL_44:
  }
    v30 = v5;

  return v30;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMMomentsEventDataPersonRelationshipTagAsString([(BMMomentsEventDataEventBundlePersonPersonRelationship *)self personRelationshipTag]);
  id v5 = NSNumber;
  [(BMMomentsEventDataEventBundlePersonPersonRelationship *)self score];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  double v7 = (void *)[v3 initWithFormat:@"BMMomentsEventDataEventBundlePersonPersonRelationship with personRelationshipTag: %@, score: %@", v4, v6];

  return (NSString *)v7;
}

- (BMMomentsEventDataEventBundlePersonPersonRelationship)initWithPersonRelationshipTag:(int)a3 score:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BMMomentsEventDataEventBundlePersonPersonRelationship;
  double v7 = [(BMEventBase *)&v10 init];
  if (v7)
  {
    v7->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v7->_personRelationshipTag = a3;
    if (v6)
    {
      v7->_hasScore = 1;
      [v6 doubleValue];
    }
    else
    {
      v7->_hasScore = 0;
      double v8 = -1.0;
    }
    v7->_score = v8;
  }

  return v7;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"personRelationshipTag" number:1 type:4 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"score" number:2 type:0 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF32D0;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"personRelationshipTag" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"score" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:0];
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
    double v7 = (void *)[[v5 alloc] initWithData:v6];

    double v8 = [[BMMomentsEventDataEventBundlePersonPersonRelationship alloc] initByReadFrom:v7];
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
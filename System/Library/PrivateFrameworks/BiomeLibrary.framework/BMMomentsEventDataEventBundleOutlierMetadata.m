@interface BMMomentsEventDataEventBundleOutlierMetadata
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMomentsEventDataEventBundleOutlierMetadata)initWithIsSignificant:(id)a3 outlierScore:(id)a4 updatedDate:(id)a5;
- (BMMomentsEventDataEventBundleOutlierMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasIsSignificant;
- (BOOL)hasOutlierScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSignificant;
- (NSDate)updatedDate;
- (NSString)description;
- (double)outlierScore;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasIsSignificant:(BOOL)a3;
- (void)setHasOutlierScore:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMomentsEventDataEventBundleOutlierMetadata

- (void)setHasOutlierScore:(BOOL)a3
{
  self->_hasOutlierScore = a3;
}

- (BOOL)hasOutlierScore
{
  return self->_hasOutlierScore;
}

- (double)outlierScore
{
  return self->_outlierScore;
}

- (void)setHasIsSignificant:(BOOL)a3
{
  self->_hasIsSignificant = a3;
}

- (BOOL)hasIsSignificant
{
  return self->_hasIsSignificant;
}

- (BOOL)isSignificant
{
  return self->_isSignificant;
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
    if ((![(BMMomentsEventDataEventBundleOutlierMetadata *)self hasIsSignificant]
       && ![v5 hasIsSignificant]
       || [(BMMomentsEventDataEventBundleOutlierMetadata *)self hasIsSignificant]
       && [v5 hasIsSignificant]
       && (int v6 = [(BMMomentsEventDataEventBundleOutlierMetadata *)self isSignificant],
           v6 == [v5 isSignificant]))
      && (![(BMMomentsEventDataEventBundleOutlierMetadata *)self hasOutlierScore]
       && ![v5 hasOutlierScore]
       || [(BMMomentsEventDataEventBundleOutlierMetadata *)self hasOutlierScore]
       && [v5 hasOutlierScore]
       && ([(BMMomentsEventDataEventBundleOutlierMetadata *)self outlierScore],
           double v8 = v7,
           [v5 outlierScore],
           v8 == v9)))
    {
      v10 = [(BMMomentsEventDataEventBundleOutlierMetadata *)self updatedDate];
      v11 = [v5 updatedDate];
      if (v10 == v11)
      {
        char v14 = 1;
      }
      else
      {
        v12 = [(BMMomentsEventDataEventBundleOutlierMetadata *)self updatedDate];
        v13 = [v5 updatedDate];
        char v14 = [v12 isEqual:v13];
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (NSDate)updatedDate
{
  if (self->_hasRaw_updatedDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_updatedDate];
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
  v17[3] = *MEMORY[0x1E4F143B8];
  if ([(BMMomentsEventDataEventBundleOutlierMetadata *)self hasIsSignificant])
  {
    v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleOutlierMetadata isSignificant](self, "isSignificant"));
  }
  else
  {
    v3 = 0;
  }
  if (![(BMMomentsEventDataEventBundleOutlierMetadata *)self hasOutlierScore]
    || ([(BMMomentsEventDataEventBundleOutlierMetadata *)self outlierScore], fabs(v4) == INFINITY))
  {
    int v6 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleOutlierMetadata *)self outlierScore];
    id v5 = NSNumber;
    [(BMMomentsEventDataEventBundleOutlierMetadata *)self outlierScore];
    int v6 = objc_msgSend(v5, "numberWithDouble:");
  }
  double v7 = [(BMMomentsEventDataEventBundleOutlierMetadata *)self updatedDate];
  if (v7)
  {
    double v8 = NSNumber;
    double v9 = [(BMMomentsEventDataEventBundleOutlierMetadata *)self updatedDate];
    [v9 timeIntervalSince1970];
    v10 = objc_msgSend(v8, "numberWithDouble:");
  }
  else
  {
    v10 = 0;
  }

  v16[0] = @"isSignificant";
  v11 = v3;
  if (!v3)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v11;
  v16[1] = @"outlierScore";
  v12 = v6;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v12;
  v16[2] = @"updatedDate";
  v13 = v10;
  if (!v10)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[2] = v13;
  char v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  if (v10)
  {
    if (v6) {
      goto LABEL_19;
    }
LABEL_24:

    if (v3) {
      goto LABEL_20;
    }
    goto LABEL_25;
  }

  if (!v6) {
    goto LABEL_24;
  }
LABEL_19:
  if (v3) {
    goto LABEL_20;
  }
LABEL_25:

LABEL_20:

  return v14;
}

- (BMMomentsEventDataEventBundleOutlierMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"isSignificant"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    double v9 = [v6 objectForKeyedSubscript:@"outlierScore"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          v21 = 0;
          goto LABEL_25;
        }
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v22 = *MEMORY[0x1E4F502C8];
        uint64_t v33 = *MEMORY[0x1E4F28568];
        v12 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"outlierScore"];
        v34 = v12;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        id v23 = (id)[v29 initWithDomain:v22 code:2 userInfo:v11];
        id v10 = 0;
        v21 = 0;
        *a4 = v23;
        goto LABEL_24;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    v11 = [v6 objectForKeyedSubscript:@"updatedDate"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v14 = v11;
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
          id v24 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v12 = [v24 dateFromString:v11];

          goto LABEL_23;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v28 = *MEMORY[0x1E4F502C8];
            uint64_t v31 = *MEMORY[0x1E4F28568];
            v26 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"updatedDate"];
            v32 = v26;
            v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
            *a4 = (id)[v30 initWithDomain:v28 code:2 userInfo:v27];
          }
          v12 = 0;
          v21 = 0;
          goto LABEL_24;
        }
        id v18 = v11;
      }
      v12 = v18;
    }
    else
    {
      v12 = 0;
    }
LABEL_23:
    self = [(BMMomentsEventDataEventBundleOutlierMetadata *)self initWithIsSignificant:v8 outlierScore:v10 updatedDate:v12];
    v21 = self;
LABEL_24:

    goto LABEL_25;
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
    v21 = 0;
    goto LABEL_26;
  }
  id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v20 = *MEMORY[0x1E4F502C8];
  uint64_t v35 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isSignificant"];
  v36[0] = v10;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
  id v8 = 0;
  v21 = 0;
  *a4 = (id)[v19 initWithDomain:v20 code:2 userInfo:v9];
LABEL_25:

LABEL_26:
  return v21;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMomentsEventDataEventBundleOutlierMetadata *)self writeTo:v3];
  double v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasIsSignificant)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasOutlierScore)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasRaw_updatedDate)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMMomentsEventDataEventBundleOutlierMetadata;
  id v5 = [(BMEventBase *)&v36 init];
  if (!v5) {
    goto LABEL_49;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  double v7 = (int *)MEMORY[0x1E4F940E0];
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
      unint64_t v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v5->_hasRaw_updatedDate = 1;
        uint64_t v28 = *v6;
        unint64_t v29 = *(void *)&v4[v28];
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)&v4[*v7])
        {
          id v30 = *(objc_class **)(*(void *)&v4[*v9] + v29);
          *(void *)&v4[v28] = v29 + 8;
        }
        else
        {
          v4[*v8] = 1;
          id v30 = 0;
        }
        uint64_t v33 = 24;
      }
      else
      {
        if (v20 != 2)
        {
          if (v20 == 1)
          {
            char v21 = 0;
            unsigned int v22 = 0;
            uint64_t v23 = 0;
            v5->_hasIsSignificant = 1;
            while (1)
            {
              uint64_t v24 = *v6;
              uint64_t v25 = *(void *)&v4[v24];
              unint64_t v26 = v25 + 1;
              if (v25 == -1 || v26 > *(void *)&v4[*v7]) {
                break;
              }
              char v27 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
              *(void *)&v4[v24] = v26;
              v23 |= (unint64_t)(v27 & 0x7F) << v21;
              if ((v27 & 0x80) == 0) {
                goto LABEL_38;
              }
              v21 += 7;
              BOOL v17 = v22++ >= 9;
              if (v17)
              {
                uint64_t v23 = 0;
                goto LABEL_40;
              }
            }
            v4[*v8] = 1;
LABEL_38:
            if (v4[*v8]) {
              uint64_t v23 = 0;
            }
LABEL_40:
            v5->_isSignificant = v23 != 0;
          }
          else if (!PBReaderSkipValueWithTag())
          {
            goto LABEL_48;
          }
          continue;
        }
        v5->_hasOutlierScore = 1;
        uint64_t v31 = *v6;
        unint64_t v32 = *(void *)&v4[v31];
        if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(void *)&v4[*v7])
        {
          id v30 = *(objc_class **)(*(void *)&v4[*v9] + v32);
          *(void *)&v4[v31] = v32 + 8;
        }
        else
        {
          v4[*v8] = 1;
          id v30 = 0;
        }
        uint64_t v33 = 40;
      }
      *(Class *)((char *)&v5->super.super.isa + v33) = v30;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_48:
  }
    v34 = 0;
  else {
LABEL_49:
  }
    v34 = v5;

  return v34;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleOutlierMetadata isSignificant](self, "isSignificant"));
  id v5 = NSNumber;
  [(BMMomentsEventDataEventBundleOutlierMetadata *)self outlierScore];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  double v7 = [(BMMomentsEventDataEventBundleOutlierMetadata *)self updatedDate];
  id v8 = (void *)[v3 initWithFormat:@"BMMomentsEventDataEventBundleOutlierMetadata with isSignificant: %@, outlierScore: %@, updatedDate: %@", v4, v6, v7];

  return (NSString *)v8;
}

- (BMMomentsEventDataEventBundleOutlierMetadata)initWithIsSignificant:(id)a3 outlierScore:(id)a4 updatedDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMMomentsEventDataEventBundleOutlierMetadata;
  unsigned int v11 = [(BMEventBase *)&v15 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v8)
    {
      v11->_hasIsSignificant = 1;
      v11->_isSignificant = [v8 BOOLValue];
    }
    else
    {
      v11->_hasIsSignificant = 0;
      v11->_isSignificant = 0;
    }
    if (v9)
    {
      v11->_hasOutlierScore = 1;
      [v9 doubleValue];
    }
    else
    {
      v11->_hasOutlierScore = 0;
      double v12 = -1.0;
    }
    v11->_outlierScore = v12;
    if (v10)
    {
      v11->_hasRaw_updatedDate = 1;
      [v10 timeIntervalSince1970];
    }
    else
    {
      v11->_hasRaw_updatedDate = 0;
      double v13 = -1.0;
    }
    v11->_raw_updatedDate = v13;
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isSignificant" number:1 type:12 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"outlierScore", 2, 0, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"updatedDate" number:3 type:0 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3330;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isSignificant" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"outlierScore" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"updatedDate" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
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
    double v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMMomentsEventDataEventBundleOutlierMetadata alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[9] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end
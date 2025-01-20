@interface BMLocationPointOfInterestCategory
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLocationPointOfInterestCategory)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMLocationPointOfInterestCategory)initWithPoiCategory:(id)a3 rank:(id)a4 timestamp:(id)a5;
- (BOOL)hasRank;
- (BOOL)isEqual:(id)a3;
- (NSDate)timestamp;
- (NSString)description;
- (NSString)poiCategory;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (unsigned)rank;
- (void)setHasRank:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMLocationPointOfInterestCategory

- (void).cxx_destruct
{
}

- (void)setHasRank:(BOOL)a3
{
  self->_hasRank = a3;
}

- (BOOL)hasRank
{
  return self->_hasRank;
}

- (unsigned)rank
{
  return self->_rank;
}

- (NSString)poiCategory
{
  return self->_poiCategory;
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
    v6 = [(BMLocationPointOfInterestCategory *)self poiCategory];
    uint64_t v7 = [v5 poiCategory];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMLocationPointOfInterestCategory *)self poiCategory];
      v10 = [v5 poiCategory];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_14;
      }
    }
    if (!-[BMLocationPointOfInterestCategory hasRank](self, "hasRank") && ![v5 hasRank]
      || [(BMLocationPointOfInterestCategory *)self hasRank]
      && [v5 hasRank]
      && (unsigned int v13 = -[BMLocationPointOfInterestCategory rank](self, "rank"), v13 == [v5 rank]))
    {
      v14 = [(BMLocationPointOfInterestCategory *)self timestamp];
      v15 = [v5 timestamp];
      if (v14 == v15)
      {
        char v12 = 1;
      }
      else
      {
        v16 = [(BMLocationPointOfInterestCategory *)self timestamp];
        v17 = [v5 timestamp];
        char v12 = [v16 isEqual:v17];
      }
      goto LABEL_17;
    }
LABEL_14:
    char v12 = 0;
LABEL_17:

    goto LABEL_18;
  }
  char v12 = 0;
LABEL_18:

  return v12;
}

- (NSDate)timestamp
{
  if (self->_hasRaw_timestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_timestamp];
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
  v15[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMLocationPointOfInterestCategory *)self poiCategory];
  if ([(BMLocationPointOfInterestCategory *)self hasRank])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMLocationPointOfInterestCategory rank](self, "rank"));
  }
  else
  {
    id v4 = 0;
  }
  id v5 = [(BMLocationPointOfInterestCategory *)self timestamp];
  if (v5)
  {
    v6 = NSNumber;
    uint64_t v7 = [(BMLocationPointOfInterestCategory *)self timestamp];
    [v7 timeIntervalSince1970];
    v8 = objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    v8 = 0;
  }

  v14[0] = @"poiCategory";
  v9 = v3;
  if (!v3)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v9;
  v14[1] = @"rank";
  v10 = v4;
  if (!v4)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v10;
  v14[2] = @"timestamp";
  int v11 = v8;
  if (!v8)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v11;
  char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  if (v8)
  {
    if (v4) {
      goto LABEL_15;
    }
LABEL_20:

    if (v3) {
      goto LABEL_16;
    }
    goto LABEL_21;
  }

  if (!v4) {
    goto LABEL_20;
  }
LABEL_15:
  if (v3) {
    goto LABEL_16;
  }
LABEL_21:

LABEL_16:

  return v12;
}

- (BMLocationPointOfInterestCategory)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"poiCategory"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"rank"];
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
        char v12 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"rank"];
        v34 = v12;
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
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
    int v11 = [v6 objectForKeyedSubscript:@"timestamp"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v13 = (objc_class *)MEMORY[0x1E4F1C9C8];
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
          char v12 = [v24 dateFromString:v11];

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
            v26 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"timestamp"];
            v32 = v26;
            v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
            *a4 = (id)[v30 initWithDomain:v28 code:2 userInfo:v27];
          }
          char v12 = 0;
          v21 = 0;
          goto LABEL_24;
        }
        id v18 = v11;
      }
      char v12 = v18;
    }
    else
    {
      char v12 = 0;
    }
LABEL_23:
    self = [(BMLocationPointOfInterestCategory *)self initWithPoiCategory:v8 rank:v10 timestamp:v12];
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
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"poiCategory"];
  v36[0] = v10;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
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
  [(BMLocationPointOfInterestCategory *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_poiCategory)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasRank)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasRaw_timestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMLocationPointOfInterestCategory;
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
        v5->_hasRaw_timestamp = 1;
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
        v5->_raw_timestamp = v25;
      }
      else if (v20 == 2)
      {
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        v5->_hasRank = 1;
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
        v5->_rank = v28;
      }
      else if (v20 == 1)
      {
        uint64_t v21 = PBReaderReadString();
        poiCategory = v5->_poiCategory;
        v5->_poiCategory = (NSString *)v21;
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
    uint64_t v33 = 0;
  else {
LABEL_44:
  }
    uint64_t v33 = v5;

  return v33;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMLocationPointOfInterestCategory *)self poiCategory];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMLocationPointOfInterestCategory rank](self, "rank"));
  id v6 = [(BMLocationPointOfInterestCategory *)self timestamp];
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMLocationPointOfInterestCategory with poiCategory: %@, rank: %@, timestamp: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMLocationPointOfInterestCategory)initWithPoiCategory:(id)a3 rank:(id)a4 timestamp:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BMLocationPointOfInterestCategory;
  unint64_t v12 = [(BMEventBase *)&v16 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_poiCategory, a3);
    if (v10)
    {
      v12->_hasRank = 1;
      unsigned int v13 = [v10 unsignedIntValue];
    }
    else
    {
      unsigned int v13 = 0;
      v12->_hasRank = 0;
    }
    v12->_rank = v13;
    if (v11)
    {
      v12->_hasRaw_timestamp = 1;
      [v11 timeIntervalSince1970];
    }
    else
    {
      v12->_hasRaw_timestamp = 0;
      double v14 = -1.0;
    }
    v12->_raw_timestamp = v14;
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"poiCategory" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"rank", 2, 4, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timestamp" number:3 type:0 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF43C8;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"poiCategory" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rank" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timestamp" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    id v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMLocationPointOfInterestCategory alloc] initByReadFrom:v6];
    id v8 = v7;
    if (v7) {
      v7[9] = 1;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end
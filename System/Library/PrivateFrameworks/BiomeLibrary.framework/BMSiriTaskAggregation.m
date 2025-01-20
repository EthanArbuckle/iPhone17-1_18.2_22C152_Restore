@interface BMSiriTaskAggregation
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriTaskAggregation)initWithAbsoluteTimestamp:(id)a3 metadata:(id)a4 statistics:(id)a5 dimensions:(id)a6;
- (BMSiriTaskAggregation)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriTaskAggregationDimensions)dimensions;
- (BMSiriTaskAggregationMetadata)metadata;
- (BMSiriTaskAggregationStatistics)statistics;
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)absoluteTimestamp;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriTaskAggregation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensions, 0);
  objc_storeStrong((id *)&self->_statistics, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

- (BMSiriTaskAggregationDimensions)dimensions
{
  return self->_dimensions;
}

- (BMSiriTaskAggregationStatistics)statistics
{
  return self->_statistics;
}

- (BMSiriTaskAggregationMetadata)metadata
{
  return self->_metadata;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  self->_hasAbsoluteTimestamp = a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return self->_hasAbsoluteTimestamp;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
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
    if ([(BMSiriTaskAggregation *)self hasAbsoluteTimestamp]
      || [v5 hasAbsoluteTimestamp])
    {
      if (![(BMSiriTaskAggregation *)self hasAbsoluteTimestamp]) {
        goto LABEL_14;
      }
      if (![v5 hasAbsoluteTimestamp]) {
        goto LABEL_14;
      }
      [(BMSiriTaskAggregation *)self absoluteTimestamp];
      double v7 = v6;
      [v5 absoluteTimestamp];
      if (v7 != v8) {
        goto LABEL_14;
      }
    }
    v9 = [(BMSiriTaskAggregation *)self metadata];
    uint64_t v10 = [v5 metadata];
    if (v9 == (void *)v10)
    {
    }
    else
    {
      v11 = (void *)v10;
      v12 = [(BMSiriTaskAggregation *)self metadata];
      v13 = [v5 metadata];
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        goto LABEL_14;
      }
    }
    v16 = [(BMSiriTaskAggregation *)self statistics];
    uint64_t v17 = [v5 statistics];
    if (v16 == (void *)v17)
    {
    }
    else
    {
      v18 = (void *)v17;
      v19 = [(BMSiriTaskAggregation *)self statistics];
      v20 = [v5 statistics];
      int v21 = [v19 isEqual:v20];

      if (!v21)
      {
LABEL_14:
        char v15 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v23 = [(BMSiriTaskAggregation *)self dimensions];
    v24 = [v5 dimensions];
    if (v23 == v24)
    {
      char v15 = 1;
    }
    else
    {
      v25 = [(BMSiriTaskAggregation *)self dimensions];
      v26 = [v5 dimensions];
      char v15 = [v25 isEqual:v26];
    }
    goto LABEL_15;
  }
  char v15 = 0;
LABEL_16:

  return v15;
}

- (id)jsonDictionary
{
  v19[4] = *MEMORY[0x1E4F143B8];
  if (![(BMSiriTaskAggregation *)self hasAbsoluteTimestamp]
    || ([(BMSiriTaskAggregation *)self absoluteTimestamp], fabs(v3) == INFINITY))
  {
    id v5 = 0;
  }
  else
  {
    [(BMSiriTaskAggregation *)self absoluteTimestamp];
    id v4 = NSNumber;
    [(BMSiriTaskAggregation *)self absoluteTimestamp];
    id v5 = objc_msgSend(v4, "numberWithDouble:");
  }
  double v6 = [(BMSiriTaskAggregation *)self metadata];
  double v7 = [v6 jsonDictionary];

  double v8 = [(BMSiriTaskAggregation *)self statistics];
  v9 = [v8 jsonDictionary];

  uint64_t v10 = [(BMSiriTaskAggregation *)self dimensions];
  v11 = [v10 jsonDictionary];

  v18[0] = @"absoluteTimestamp";
  v12 = v5;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[0] = v12;
  v18[1] = @"metadata";
  v13 = v7;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[1] = v13;
  v18[2] = @"statistics";
  int v14 = v9;
  if (!v9)
  {
    int v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[2] = v14;
  v18[3] = @"dimensions";
  char v15 = v11;
  if (!v11)
  {
    char v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[3] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
  if (v11)
  {
    if (v9) {
      goto LABEL_15;
    }
  }
  else
  {

    if (v9)
    {
LABEL_15:
      if (v7) {
        goto LABEL_16;
      }
LABEL_22:

      if (v5) {
        goto LABEL_17;
      }
      goto LABEL_23;
    }
  }

  if (!v7) {
    goto LABEL_22;
  }
LABEL_16:
  if (v5) {
    goto LABEL_17;
  }
LABEL_23:

LABEL_17:

  return v16;
}

- (BMSiriTaskAggregation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [v5 objectForKeyedSubscript:@"absoluteTimestamp"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        char v15 = 0;
        id v7 = 0;
        int v14 = self;
        goto LABEL_47;
      }
      id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v22 = *MEMORY[0x1E4F502C8];
      uint64_t v47 = *MEMORY[0x1E4F28568];
      id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"absoluteTimestamp"];
      v48[0] = v16;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
      char v15 = 0;
      id v7 = 0;
      *a4 = (id)[v21 initWithDomain:v22 code:2 userInfo:v9];
      goto LABEL_36;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  double v8 = [v5 objectForKeyedSubscript:@"metadata"];
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = 0;
LABEL_7:
    uint64_t v10 = [v5 objectForKeyedSubscript:@"statistics"];
    id v36 = v7;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          char v15 = 0;
          int v14 = self;
          goto LABEL_44;
        }
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v29 = *MEMORY[0x1E4F502C8];
        uint64_t v43 = *MEMORY[0x1E4F28568];
        v11 = (BMSiriTaskAggregationStatistics *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"statistics"];
        v44 = v11;
        id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        char v15 = 0;
        *a4 = (id)[v32 initWithDomain:v29 code:2 userInfo:v12];
        goto LABEL_42;
      }
      id v12 = v10;
      id v39 = 0;
      v11 = [[BMSiriTaskAggregationStatistics alloc] initWithJSONDictionary:v12 error:&v39];
      id v19 = v39;
      if (v19)
      {
        v20 = v19;
        if (a4) {
          *a4 = v19;
        }

LABEL_41:
        char v15 = 0;
LABEL_42:
        int v14 = self;
        goto LABEL_43;
      }
    }
    else
    {
      v11 = 0;
    }
    id v12 = [v5 objectForKeyedSubscript:@"dimensions"];
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = 0;
LABEL_13:
      int v14 = [(BMSiriTaskAggregation *)self initWithAbsoluteTimestamp:v36 metadata:v9 statistics:v11 dimensions:v13];
      char v15 = v14;
LABEL_14:

LABEL_43:
LABEL_44:

      id v16 = v8;
      id v7 = v36;
      goto LABEL_45;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = v9;
      id v23 = v12;
      id v38 = 0;
      v13 = [[BMSiriTaskAggregationDimensions alloc] initWithJSONDictionary:v23 error:&v38];
      id v24 = v38;
      if (v24)
      {
        v25 = v24;
        if (a4) {
          *a4 = v24;
        }

        char v15 = 0;
        int v14 = self;
        v9 = v34;
        goto LABEL_14;
      }

      v9 = v34;
      goto LABEL_13;
    }
    if (a4)
    {
      id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v33 = *MEMORY[0x1E4F502C8];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      v13 = (BMSiriTaskAggregationDimensions *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"dimensions"];
      v42 = v13;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      *a4 = (id)[v35 initWithDomain:v33 code:2 userInfo:v30];

      char v15 = 0;
      int v14 = self;
      goto LABEL_14;
    }
    goto LABEL_41;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v8;
    id v40 = 0;
    v9 = [[BMSiriTaskAggregationMetadata alloc] initWithJSONDictionary:v16 error:&v40];
    id v17 = v40;
    if (!v17)
    {

      goto LABEL_7;
    }
    v18 = v17;
    if (a4) {
      *a4 = v17;
    }

    char v15 = 0;
  }
  else
  {
    if (!a4)
    {
      char v15 = 0;
      int v14 = self;
      goto LABEL_46;
    }
    id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v27 = *MEMORY[0x1E4F502C8];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    v9 = (BMSiriTaskAggregationMetadata *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"metadata"];
    v46 = v9;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    *a4 = (id)[v26 initWithDomain:v27 code:2 userInfo:v28];

    char v15 = 0;
    id v16 = v8;
  }
LABEL_36:
  int v14 = self;
LABEL_45:

  double v8 = v16;
LABEL_46:

LABEL_47:
  return v15;
}

- (id)serialize
{
  double v3 = objc_opt_new();
  [(BMSiriTaskAggregation *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasAbsoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_metadata)
  {
    PBDataWriterPlaceMark();
    [(BMSiriTaskAggregationMetadata *)self->_metadata writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_statistics)
  {
    PBDataWriterPlaceMark();
    [(BMSiriTaskAggregationStatistics *)self->_statistics writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_dimensions)
  {
    PBDataWriterPlaceMark();
    [(BMSiriTaskAggregationDimensions *)self->_dimensions writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BMSiriTaskAggregation;
  id v5 = [(BMEventBase *)&v28 init];
  if (!v5) {
    goto LABEL_40;
  }
  double v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  double v8 = (int *)MEMORY[0x1E4F940C8];
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
      switch((v12 >> 3))
      {
        case 1u:
          v5->_hasAbsoluteTimestamp = 1;
          uint64_t v20 = *v6;
          unint64_t v21 = *(void *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)&v4[*v7])
          {
            double v22 = *(double *)(*(void *)&v4[*v9] + v21);
            *(void *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v22 = 0.0;
          }
          v5->_absoluteTimestamp = v22;
          break;
        case 2u:
          uint64_t v29 = 0;
          uint64_t v30 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_39;
          }
          id v23 = [[BMSiriTaskAggregationMetadata alloc] initByReadFrom:v4];
          if (!v23) {
            goto LABEL_39;
          }
          uint64_t v24 = 32;
          goto LABEL_34;
        case 3u:
          uint64_t v29 = 0;
          uint64_t v30 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_39;
          }
          id v23 = [[BMSiriTaskAggregationStatistics alloc] initByReadFrom:v4];
          if (!v23) {
            goto LABEL_39;
          }
          uint64_t v24 = 40;
          goto LABEL_34;
        case 4u:
          uint64_t v29 = 0;
          uint64_t v30 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_39;
          }
          id v23 = [[BMSiriTaskAggregationDimensions alloc] initByReadFrom:v4];
          if (!v23) {
            goto LABEL_39;
          }
          uint64_t v24 = 48;
LABEL_34:
          v25 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = v23;

          PBReaderRecallMark();
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_39;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_39:
  }
    id v26 = 0;
  else {
LABEL_40:
  }
    id v26 = v5;

  return v26;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = NSNumber;
  [(BMSiriTaskAggregation *)self absoluteTimestamp];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  double v6 = [(BMSiriTaskAggregation *)self metadata];
  id v7 = [(BMSiriTaskAggregation *)self statistics];
  double v8 = [(BMSiriTaskAggregation *)self dimensions];
  v9 = (void *)[v3 initWithFormat:@"BMSiriTaskAggregation with absoluteTimestamp: %@, metadata: %@, statistics: %@, dimensions: %@", v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMSiriTaskAggregation)initWithAbsoluteTimestamp:(id)a3 metadata:(id)a4 statistics:(id)a5 dimensions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMSiriTaskAggregation;
  uint64_t v14 = [(BMEventBase *)&v17 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v10)
    {
      v14->_hasAbsoluteTimestamp = 1;
      [v10 doubleValue];
    }
    else
    {
      v14->_hasAbsoluteTimestamp = 0;
      double v15 = -1.0;
    }
    v14->_absoluteTimestamp = v15;
    objc_storeStrong((id *)&v14->_metadata, a4);
    objc_storeStrong((id *)&v14->_statistics, a5);
    objc_storeStrong((id *)&v14->_dimensions, a6);
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:1 type:0 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"metadata" number:2 type:14 subMessageClass:objc_opt_class()];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"statistics" number:3 type:14 subMessageClass:objc_opt_class()];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dimensions" number:4 type:14 subMessageClass:objc_opt_class()];
  v8[3] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6AC8;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:1 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"metadata_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_318];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"statistics_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_320];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"dimensions_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_322];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

id __32__BMSiriTaskAggregation_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 dimensions];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __32__BMSiriTaskAggregation_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 statistics];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __32__BMSiriTaskAggregation_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 metadata];
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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    double v8 = [[BMSiriTaskAggregation alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      void v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end
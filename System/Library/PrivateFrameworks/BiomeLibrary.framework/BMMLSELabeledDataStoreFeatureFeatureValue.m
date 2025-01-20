@interface BMMLSELabeledDataStoreFeatureFeatureValue
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMLSELabeledDataStoreFeatureFeatureValue)initWithIntValue:(id)a3 doubleValue:(id)a4 stringValue:(id)a5 BOOLValue:(id)a6 timeBucketValue:(int)a7 doubleValuedVectorValue:(id)a8;
- (BMMLSELabeledDataStoreFeatureFeatureValue)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector)doubleValuedVectorValue;
- (BOOL)BOOLValue;
- (BOOL)hasBoolValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasIntValue;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)stringValue;
- (double)doubleValue;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)timeBucketValue;
- (unsigned)dataVersion;
- (unsigned)intValue;
- (void)setHasBoolValue:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasIntValue:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMLSELabeledDataStoreFeatureFeatureValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleValuedVectorValue, 0);

  objc_storeStrong((id *)&self->_stringValue, 0);
}

- (BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector)doubleValuedVectorValue
{
  return self->_doubleValuedVectorValue;
}

- (int)timeBucketValue
{
  return self->_timeBucketValue;
}

- (void)setHasBoolValue:(BOOL)a3
{
  self->_hasBoolValue = a3;
}

- (BOOL)hasBoolValue
{
  return self->_hasBoolValue;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  self->_hasDoubleValue = a3;
}

- (BOOL)hasDoubleValue
{
  return self->_hasDoubleValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void)setHasIntValue:(BOOL)a3
{
  self->_hasIntValue = a3;
}

- (BOOL)hasIntValue
{
  return self->_hasIntValue;
}

- (unsigned)intValue
{
  return self->_intValue;
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
    if ([(BMMLSELabeledDataStoreFeatureFeatureValue *)self hasIntValue]
      || [v5 hasIntValue])
    {
      if (![(BMMLSELabeledDataStoreFeatureFeatureValue *)self hasIntValue]) {
        goto LABEL_25;
      }
      if (![v5 hasIntValue]) {
        goto LABEL_25;
      }
      unsigned int v6 = [(BMMLSELabeledDataStoreFeatureFeatureValue *)self intValue];
      if (v6 != [v5 intValue]) {
        goto LABEL_25;
      }
    }
    if ([(BMMLSELabeledDataStoreFeatureFeatureValue *)self hasDoubleValue]
      || [v5 hasDoubleValue])
    {
      if (![(BMMLSELabeledDataStoreFeatureFeatureValue *)self hasDoubleValue]) {
        goto LABEL_25;
      }
      if (![v5 hasDoubleValue]) {
        goto LABEL_25;
      }
      [(BMMLSELabeledDataStoreFeatureFeatureValue *)self doubleValue];
      double v8 = v7;
      [v5 doubleValue];
      if (v8 != v9) {
        goto LABEL_25;
      }
    }
    v10 = [(BMMLSELabeledDataStoreFeatureFeatureValue *)self stringValue];
    uint64_t v11 = [v5 stringValue];
    if (v10 == (void *)v11)
    {
    }
    else
    {
      v12 = (void *)v11;
      v13 = [(BMMLSELabeledDataStoreFeatureFeatureValue *)self stringValue];
      v14 = [v5 stringValue];
      int v15 = [v13 isEqual:v14];

      if (!v15) {
        goto LABEL_25;
      }
    }
    if (![(BMMLSELabeledDataStoreFeatureFeatureValue *)self hasBoolValue]
      && ![v5 hasBoolValue]
      || [(BMMLSELabeledDataStoreFeatureFeatureValue *)self hasBoolValue]
      && [v5 hasBoolValue]
      && (int v17 = [(BMMLSELabeledDataStoreFeatureFeatureValue *)self BOOLValue],
          v17 == [v5 BOOLValue]))
    {
      int v18 = [(BMMLSELabeledDataStoreFeatureFeatureValue *)self timeBucketValue];
      if (v18 == [v5 timeBucketValue])
      {
        v19 = [(BMMLSELabeledDataStoreFeatureFeatureValue *)self doubleValuedVectorValue];
        v20 = [v5 doubleValuedVectorValue];
        if (v19 == v20)
        {
          char v16 = 1;
        }
        else
        {
          v21 = [(BMMLSELabeledDataStoreFeatureFeatureValue *)self doubleValuedVectorValue];
          v22 = [v5 doubleValuedVectorValue];
          char v16 = [v21 isEqual:v22];
        }
        goto LABEL_26;
      }
    }
LABEL_25:
    char v16 = 0;
LABEL_26:

    goto LABEL_27;
  }
  char v16 = 0;
LABEL_27:

  return v16;
}

- (id)jsonDictionary
{
  v25[6] = *MEMORY[0x1E4F143B8];
  if ([(BMMLSELabeledDataStoreFeatureFeatureValue *)self hasIntValue])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSELabeledDataStoreFeatureFeatureValue intValue](self, "intValue"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  if (![(BMMLSELabeledDataStoreFeatureFeatureValue *)self hasDoubleValue]
    || ([(BMMLSELabeledDataStoreFeatureFeatureValue *)self doubleValue], fabs(v4) == INFINITY))
  {
    unsigned int v6 = 0;
  }
  else
  {
    [(BMMLSELabeledDataStoreFeatureFeatureValue *)self doubleValue];
    id v5 = NSNumber;
    [(BMMLSELabeledDataStoreFeatureFeatureValue *)self doubleValue];
    unsigned int v6 = objc_msgSend(v5, "numberWithDouble:");
  }
  double v7 = [(BMMLSELabeledDataStoreFeatureFeatureValue *)self stringValue];
  if ([(BMMLSELabeledDataStoreFeatureFeatureValue *)self hasBoolValue])
  {
    double v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMLSELabeledDataStoreFeatureFeatureValue BOOLValue](self, "BOOLValue"));
  }
  else
  {
    double v8 = 0;
  }
  double v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMLSELabeledDataStoreFeatureFeatureValue timeBucketValue](self, "timeBucketValue"));
  v10 = [(BMMLSELabeledDataStoreFeatureFeatureValue *)self doubleValuedVectorValue];
  uint64_t v11 = [v10 jsonDictionary];

  v24[0] = @"intValue";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v12;
  v23 = (void *)v3;
  v25[0] = v12;
  v24[1] = @"doubleValue";
  uint64_t v13 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v20 = v13;
  v25[1] = v13;
  v24[2] = @"stringValue";
  v14 = v7;
  if (!v7)
  {
    v14 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v13, v22);
  }
  v25[2] = v14;
  v24[3] = @"BOOLValue";
  int v15 = v8;
  if (!v8)
  {
    int v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[3] = v15;
  v24[4] = @"timeBucketValue";
  char v16 = v9;
  if (!v9)
  {
    char v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v16;
  v24[5] = @"doubleValuedVectorValue";
  int v17 = v11;
  if (!v11)
  {
    int v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[5] = v17;
  int v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, v24, 6, v20);
  if (v11)
  {
    if (v9) {
      goto LABEL_25;
    }
  }
  else
  {

    if (v9)
    {
LABEL_25:
      if (v8) {
        goto LABEL_26;
      }
      goto LABEL_35;
    }
  }

  if (v8)
  {
LABEL_26:
    if (v7) {
      goto LABEL_27;
    }
LABEL_36:

    if (v6) {
      goto LABEL_28;
    }
    goto LABEL_37;
  }
LABEL_35:

  if (!v7) {
    goto LABEL_36;
  }
LABEL_27:
  if (v6) {
    goto LABEL_28;
  }
LABEL_37:

LABEL_28:
  if (!v23) {

  }
  return v18;
}

- (BMMLSELabeledDataStoreFeatureFeatureValue)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"intValue"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_4:
    double v9 = [v6 objectForKeyedSubscript:@"doubleValue"];
    v53 = v7;
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v55 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v55 = v9;
LABEL_7:
      v10 = [v6 objectForKeyedSubscript:@"stringValue"];
      v56 = self;
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v11 = 0;
LABEL_10:
        uint64_t v12 = [v6 objectForKeyedSubscript:@"BOOLValue"];
        id v51 = v11;
        id v52 = v8;
        if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v54 = 0;
              v22 = 0;
              goto LABEL_58;
            }
            id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v35 = *MEMORY[0x1E4F502C8];
            uint64_t v62 = *MEMORY[0x1E4F28568];
            v36 = a4;
            int v15 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"BOOLValue"];
            v63 = v15;
            uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
            v37 = v34;
            id v8 = v52;
            id v38 = (id)[v37 initWithDomain:v35 code:2 userInfo:v13];
            id v54 = 0;
            v22 = 0;
            id *v36 = v38;
            id v11 = v51;
            goto LABEL_57;
          }
          id v54 = v12;
        }
        else
        {
          id v54 = 0;
        }
        uint64_t v13 = [v6 objectForKeyedSubscript:@"timeBucketValue"];
        if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v14 = a4;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v16 = v13;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                int v15 = 0;
                v22 = 0;
                id v11 = v51;
                goto LABEL_57;
              }
              id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v44 = *MEMORY[0x1E4F502C8];
              uint64_t v60 = *MEMORY[0x1E4F28568];
              v39 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"timeBucketValue"];
              v61 = v39;
              v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
              id v45 = (id)[v50 initWithDomain:v44 code:2 userInfo:v40];
              int v15 = 0;
              v22 = 0;
              id *v14 = v45;
              goto LABEL_54;
            }
            id v16 = [NSNumber numberWithInt:BMMLSEVirtualFeatureStoreFeatureFeatureValuetimeBucketFromString(v13)];
          }
          int v15 = v16;
        }
        else
        {
          v14 = a4;
          int v15 = 0;
        }
        v39 = [v6 objectForKeyedSubscript:@"doubleValuedVectorValue"];
        if (!v39 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v40 = 0;
LABEL_40:
          id v11 = v51;
          v22 = -[BMMLSELabeledDataStoreFeatureFeatureValue initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:doubleValuedVectorValue:](v56, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:doubleValuedVectorValue:", v52, v55, v51, v54, [v15 intValue], v40);
          v56 = v22;
LABEL_55:

LABEL_56:
          id v8 = v52;
LABEL_57:

          goto LABEL_58;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v57 = 0;
          id v48 = v39;
          v40 = [[BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector alloc] initWithJSONDictionary:v48 error:&v57];
          id v41 = v57;
          if (!v41)
          {

            goto LABEL_40;
          }
          v42 = v41;
          v39 = v48;
          if (v14) {
            id *v14 = v41;
          }
        }
        else
        {
          if (!v14)
          {
            v22 = 0;
            id v11 = v51;
            goto LABEL_56;
          }
          id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v47 = *MEMORY[0x1E4F502C8];
          uint64_t v58 = *MEMORY[0x1E4F28568];
          v40 = (BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"doubleValuedVectorValue"];
          v59 = v40;
          v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
          id *v14 = (id)[v49 initWithDomain:v47 code:2 userInfo:v43];
        }
        v22 = 0;
LABEL_54:
        id v11 = v51;
        goto LABEL_55;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        goto LABEL_10;
      }
      if (a4)
      {
        id v29 = v8;
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        v31 = a4;
        uint64_t v32 = *MEMORY[0x1E4F502C8];
        uint64_t v64 = *MEMORY[0x1E4F28568];
        id v54 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"stringValue"];
        id v65 = v54;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
        v33 = v30;
        id v8 = v29;
        v22 = 0;
        id *v31 = (id)[v33 initWithDomain:v32 code:2 userInfo:v12];
        id v11 = 0;
LABEL_58:
        uint64_t v20 = v55;

        self = v56;
        goto LABEL_59;
      }
      id v11 = 0;
      v22 = 0;
      uint64_t v20 = v55;
LABEL_59:

      double v7 = v53;
      goto LABEL_60;
    }
    if (a4)
    {
      id v23 = v8;
      id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
      v25 = a4;
      uint64_t v26 = *MEMORY[0x1E4F502C8];
      uint64_t v66 = *MEMORY[0x1E4F28568];
      uint64_t v27 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"doubleValue"];
      uint64_t v67 = v27;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      v28 = v24;
      id v8 = v23;
      uint64_t v20 = 0;
      v22 = 0;
      id *v25 = (id)[v28 initWithDomain:v26 code:2 userInfo:v10];
      id v11 = (id)v27;
      goto LABEL_59;
    }
    uint64_t v20 = 0;
    v22 = 0;
LABEL_60:

    goto LABEL_61;
  }
  if (a4)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    int v18 = a4;
    uint64_t v19 = *MEMORY[0x1E4F502C8];
    uint64_t v68 = *MEMORY[0x1E4F28568];
    uint64_t v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"intValue"];
    v69[0] = v20;
    double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:&v68 count:1];
    id v21 = (id)[v17 initWithDomain:v19 code:2 userInfo:v9];
    id v8 = 0;
    v22 = 0;
    *int v18 = v21;
    goto LABEL_60;
  }
  id v8 = 0;
  v22 = 0;
LABEL_61:

  return v22;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMLSELabeledDataStoreFeatureFeatureValue *)self writeTo:v3];
  double v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasIntValue) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasDoubleValue) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_stringValue) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasBoolValue) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_doubleValuedVectorValue)
  {
    PBDataWriterPlaceMark();
    [(BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector *)self->_doubleValuedVectorValue writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)BMMLSELabeledDataStoreFeatureFeatureValue;
  id v5 = [(BMEventBase *)&v50 init];
  if (!v5) {
    goto LABEL_69;
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
      switch((v12 >> 3))
      {
        case 1u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          v5->_hasIntValue = 1;
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
              goto LABEL_51;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_53;
            }
          }
          v4[*v8] = 1;
LABEL_51:
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_53:
          v5->_intValue = v22;
          break;
        case 2u:
          v5->_hasDoubleValue = 1;
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
          v5->_doubleValue = v29;
          break;
        case 3u:
          uint64_t v30 = PBReaderReadString();
          stringValue = v5->_stringValue;
          v5->_stringValue = (NSString *)v30;

          break;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          v5->_hasBoolValue = 1;
          while (1)
          {
            uint64_t v35 = *v6;
            uint64_t v36 = *(void *)&v4[v35];
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)&v4[*v7]) {
              break;
            }
            char v38 = *(unsigned char *)(*(void *)&v4[*v9] + v36);
            *(void *)&v4[v35] = v37;
            v34 |= (unint64_t)(v38 & 0x7F) << v32;
            if ((v38 & 0x80) == 0) {
              goto LABEL_55;
            }
            v32 += 7;
            BOOL v17 = v33++ >= 9;
            if (v17)
            {
              uint64_t v34 = 0;
              goto LABEL_57;
            }
          }
          v4[*v8] = 1;
LABEL_55:
          if (v4[*v8]) {
            uint64_t v34 = 0;
          }
LABEL_57:
          v5->_BOOLValue = v34 != 0;
          break;
        case 5u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v41 = 0;
          while (1)
          {
            uint64_t v42 = *v6;
            uint64_t v43 = *(void *)&v4[v42];
            unint64_t v44 = v43 + 1;
            if (v43 == -1 || v44 > *(void *)&v4[*v7]) {
              break;
            }
            char v45 = *(unsigned char *)(*(void *)&v4[*v9] + v43);
            *(void *)&v4[v42] = v44;
            v41 |= (unint64_t)(v45 & 0x7F) << v39;
            if ((v45 & 0x80) == 0) {
              goto LABEL_59;
            }
            v39 += 7;
            BOOL v17 = v40++ >= 9;
            if (v17)
            {
              LODWORD(v41) = 0;
              goto LABEL_61;
            }
          }
          v4[*v8] = 1;
LABEL_59:
          if (v4[*v8]) {
            LODWORD(v41) = 0;
          }
LABEL_61:
          if (v41 >= 0x17) {
            LODWORD(v41) = 0;
          }
          v5->_timeBucketValue = v41;
          break;
        case 6u:
          uint64_t v51 = 0;
          uint64_t v52 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_68;
          }
          v46 = [[BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector alloc] initByReadFrom:v4];
          if (!v46) {
            goto LABEL_68;
          }
          doubleValuedVectorValue = v5->_doubleValuedVectorValue;
          v5->_doubleValuedVectorValue = v46;

          PBReaderRecallMark();
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_68;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_68:
  }
    id v48 = 0;
  else {
LABEL_69:
  }
    id v48 = v5;

  return v48;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSELabeledDataStoreFeatureFeatureValue intValue](self, "intValue"));
  id v5 = NSNumber;
  [(BMMLSELabeledDataStoreFeatureFeatureValue *)self doubleValue];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  double v7 = [(BMMLSELabeledDataStoreFeatureFeatureValue *)self stringValue];
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMLSELabeledDataStoreFeatureFeatureValue BOOLValue](self, "BOOLValue"));
  double v9 = BMMLSEVirtualFeatureStoreFeatureFeatureValuetimeBucketAsString([(BMMLSELabeledDataStoreFeatureFeatureValue *)self timeBucketValue]);
  char v10 = [(BMMLSELabeledDataStoreFeatureFeatureValue *)self doubleValuedVectorValue];
  unsigned int v11 = (void *)[v3 initWithFormat:@"BMMLSELabeledDataStoreFeatureFeatureValue with intValue: %@, doubleValue: %@, stringValue: %@, BOOLValue: %@, timeBucketValue: %@, doubleValuedVectorValue: %@", v4, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BMMLSELabeledDataStoreFeatureFeatureValue)initWithIntValue:(id)a3 doubleValue:(id)a4 stringValue:(id)a5 BOOLValue:(id)a6 timeBucketValue:(int)a7 doubleValuedVectorValue:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BMMLSELabeledDataStoreFeatureFeatureValue;
  uint64_t v19 = [(BMEventBase *)&v23 init];
  if (v19)
  {
    v19->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v14)
    {
      v19->_hasIntValue = 1;
      unsigned int v20 = [v14 unsignedIntValue];
    }
    else
    {
      unsigned int v20 = 0;
      v19->_hasIntValue = 0;
    }
    v19->_intValue = v20;
    if (v15)
    {
      v19->_hasDoubleValue = 1;
      [v15 doubleValue];
    }
    else
    {
      v19->_hasDoubleValue = 0;
      double v21 = -1.0;
    }
    v19->_doubleValue = v21;
    objc_storeStrong((id *)&v19->_stringValue, a5);
    if (v17)
    {
      v19->_hasBoolValue = 1;
      v19->_BOOLValue = [v17 BOOLValue];
    }
    else
    {
      v19->_hasBoolValue = 0;
      v19->_BOOLValue = 0;
    }
    v19->_timeBucketValue = a7;
    objc_storeStrong((id *)&v19->_doubleValuedVectorValue, a8);
  }

  return v19;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"intValue" number:1 type:4 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"doubleValue" number:2 type:0 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stringValue" number:3 type:13 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"BOOLValue" number:4 type:12 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timeBucketValue" number:5 type:4 subMessageClass:0];
  v10[4] = v6;
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"doubleValuedVectorValue" number:6 type:14 subMessageClass:objc_opt_class()];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF37F8;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"intValue" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"doubleValue" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stringValue" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"BOOLValue" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timeBucketValue" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"doubleValuedVectorValue_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_163];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

id __52__BMMLSELabeledDataStoreFeatureFeatureValue_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 doubleValuedVectorValue];
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
    double v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMMLSELabeledDataStoreFeatureFeatureValue alloc] initByReadFrom:v7];
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
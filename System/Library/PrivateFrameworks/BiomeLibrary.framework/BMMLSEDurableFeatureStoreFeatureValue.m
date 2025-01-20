@interface BMMLSEDurableFeatureStoreFeatureValue
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMLSEDurableFeatureStoreFeatureValue)initWithIntValue:(id)a3 doubleValue:(id)a4 stringValue:(id)a5 BOOLValue:(id)a6 histogramValue:(id)a7;
- (BMMLSEDurableFeatureStoreFeatureValue)initWithIntValue:(id)a3 doubleValue:(id)a4 stringValue:(id)a5 BOOLValue:(id)a6 histogramValue:(id)a7 missingReason:(int)a8;
- (BMMLSEDurableFeatureStoreFeatureValue)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMLSEDurableFeatureStoreFeatureValueHistogram)histogramValue;
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
- (int)missingReason;
- (unsigned)dataVersion;
- (unsigned)intValue;
- (void)setHasBoolValue:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasIntValue:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMLSEDurableFeatureStoreFeatureValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogramValue, 0);

  objc_storeStrong((id *)&self->_stringValue, 0);
}

- (int)missingReason
{
  return self->_missingReason;
}

- (BMMLSEDurableFeatureStoreFeatureValueHistogram)histogramValue
{
  return self->_histogramValue;
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
    if ([(BMMLSEDurableFeatureStoreFeatureValue *)self hasIntValue]
      || [v5 hasIntValue])
    {
      if (![(BMMLSEDurableFeatureStoreFeatureValue *)self hasIntValue]) {
        goto LABEL_24;
      }
      if (![v5 hasIntValue]) {
        goto LABEL_24;
      }
      unsigned int v6 = [(BMMLSEDurableFeatureStoreFeatureValue *)self intValue];
      if (v6 != [v5 intValue]) {
        goto LABEL_24;
      }
    }
    if ([(BMMLSEDurableFeatureStoreFeatureValue *)self hasDoubleValue]
      || [v5 hasDoubleValue])
    {
      if (![(BMMLSEDurableFeatureStoreFeatureValue *)self hasDoubleValue]) {
        goto LABEL_24;
      }
      if (![v5 hasDoubleValue]) {
        goto LABEL_24;
      }
      [(BMMLSEDurableFeatureStoreFeatureValue *)self doubleValue];
      double v8 = v7;
      [v5 doubleValue];
      if (v8 != v9) {
        goto LABEL_24;
      }
    }
    v10 = [(BMMLSEDurableFeatureStoreFeatureValue *)self stringValue];
    uint64_t v11 = [v5 stringValue];
    if (v10 == (void *)v11)
    {
    }
    else
    {
      v12 = (void *)v11;
      v13 = [(BMMLSEDurableFeatureStoreFeatureValue *)self stringValue];
      v14 = [v5 stringValue];
      int v15 = [v13 isEqual:v14];

      if (!v15) {
        goto LABEL_24;
      }
    }
    if ([(BMMLSEDurableFeatureStoreFeatureValue *)self hasBoolValue]
      || [v5 hasBoolValue])
    {
      if (![(BMMLSEDurableFeatureStoreFeatureValue *)self hasBoolValue]) {
        goto LABEL_24;
      }
      if (![v5 hasBoolValue]) {
        goto LABEL_24;
      }
      int v17 = [(BMMLSEDurableFeatureStoreFeatureValue *)self BOOLValue];
      if (v17 != [v5 BOOLValue]) {
        goto LABEL_24;
      }
    }
    v18 = [(BMMLSEDurableFeatureStoreFeatureValue *)self histogramValue];
    uint64_t v19 = [v5 histogramValue];
    if (v18 == (void *)v19)
    {
    }
    else
    {
      v20 = (void *)v19;
      v21 = [(BMMLSEDurableFeatureStoreFeatureValue *)self histogramValue];
      v22 = [v5 histogramValue];
      int v23 = [v21 isEqual:v22];

      if (!v23)
      {
LABEL_24:
        BOOL v16 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    int v25 = [(BMMLSEDurableFeatureStoreFeatureValue *)self missingReason];
    BOOL v16 = v25 == [v5 missingReason];
    goto LABEL_25;
  }
  BOOL v16 = 0;
LABEL_26:

  return v16;
}

- (id)jsonDictionary
{
  v25[6] = *MEMORY[0x1E4F143B8];
  if ([(BMMLSEDurableFeatureStoreFeatureValue *)self hasIntValue])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSEDurableFeatureStoreFeatureValue intValue](self, "intValue"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  if (![(BMMLSEDurableFeatureStoreFeatureValue *)self hasDoubleValue]
    || ([(BMMLSEDurableFeatureStoreFeatureValue *)self doubleValue], fabs(v4) == INFINITY))
  {
    unsigned int v6 = 0;
  }
  else
  {
    [(BMMLSEDurableFeatureStoreFeatureValue *)self doubleValue];
    id v5 = NSNumber;
    [(BMMLSEDurableFeatureStoreFeatureValue *)self doubleValue];
    unsigned int v6 = objc_msgSend(v5, "numberWithDouble:");
  }
  double v7 = [(BMMLSEDurableFeatureStoreFeatureValue *)self stringValue];
  if ([(BMMLSEDurableFeatureStoreFeatureValue *)self hasBoolValue])
  {
    double v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMLSEDurableFeatureStoreFeatureValue BOOLValue](self, "BOOLValue"));
  }
  else
  {
    double v8 = 0;
  }
  double v9 = [(BMMLSEDurableFeatureStoreFeatureValue *)self histogramValue];
  v10 = [v9 jsonDictionary];

  uint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMLSEDurableFeatureStoreFeatureValue missingReason](self, "missingReason"));
  v24[0] = @"intValue";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v12;
  int v23 = (void *)v3;
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
  v24[4] = @"histogramValue";
  BOOL v16 = v10;
  if (!v10)
  {
    BOOL v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v16;
  v24[5] = @"missingReason";
  int v17 = v11;
  if (!v11)
  {
    int v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[5] = v17;
  v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, v24, 6, v20);
  if (v11)
  {
    if (v10) {
      goto LABEL_25;
    }
  }
  else
  {

    if (v10)
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

- (BMMLSEDurableFeatureStoreFeatureValue)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"intValue"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    double v9 = [v6 objectForKeyedSubscript:@"doubleValue"];
    v53 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          int v25 = 0;
          v21 = 0;
          goto LABEL_54;
        }
        v27 = a4;
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v29 = v8;
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v66 = *MEMORY[0x1E4F28568];
        uint64_t v31 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"doubleValue"];
        uint64_t v67 = v31;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        uint64_t v32 = v30;
        id v8 = v29;
        int v25 = 0;
        v21 = 0;
        id *v27 = (id)[v28 initWithDomain:v32 code:2 userInfo:v10];
        id v11 = (id)v31;
        goto LABEL_53;
      }
      id v55 = v9;
    }
    else
    {
      id v55 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"stringValue"];
    v56 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v11 = 0;
          v21 = 0;
          int v25 = v55;
          goto LABEL_53;
        }
        v34 = a4;
        id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v36 = v8;
        uint64_t v37 = *MEMORY[0x1E4F502C8];
        uint64_t v64 = *MEMORY[0x1E4F28568];
        id v54 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"stringValue"];
        id v65 = v54;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
        uint64_t v38 = v37;
        id v8 = v36;
        v21 = 0;
        id *v34 = (id)[v35 initWithDomain:v38 code:2 userInfo:v12];
        id v11 = 0;
        goto LABEL_60;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
    uint64_t v12 = [v6 objectForKeyedSubscript:@"BOOLValue"];
    id v51 = v11;
    id v52 = v8;
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v54 = 0;
      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v54 = v12;
LABEL_13:
      uint64_t v13 = [v6 objectForKeyedSubscript:@"histogramValue"];
      v14 = a4;
      if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        int v15 = 0;
LABEL_16:
        BOOL v16 = [v6 objectForKeyedSubscript:@"missingReason"];
        if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v33 = v16;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a4)
              {
                id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v48 = *MEMORY[0x1E4F502C8];
                uint64_t v58 = *MEMORY[0x1E4F28568];
                v46 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"missingReason"];
                v59 = v46;
                v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
                id *v14 = (id)[v50 initWithDomain:v48 code:2 userInfo:v47];
              }
              int v17 = 0;
              v21 = 0;
              id v11 = v51;
              goto LABEL_49;
            }
            objc_msgSend(NSNumber, "numberWithInt:", bsearch_b(v16, BMMLSEDurableFeatureStoreFeatureValueMissingReasonFromString_sortedStrings, 1uLL, 8uLL, &__block_literal_global_24_36624) != 0);
            id v33 = (id)objc_claimAutoreleasedReturnValue();
          }
          int v17 = v33;
        }
        else
        {
          int v17 = 0;
        }
        id v11 = v51;
        v21 = -[BMMLSEDurableFeatureStoreFeatureValue initWithIntValue:doubleValue:stringValue:BOOLValue:histogramValue:missingReason:](v56, "initWithIntValue:doubleValue:stringValue:BOOLValue:histogramValue:missingReason:", v52, v55, v51, v54, v15, [v17 intValue]);
        v56 = v21;
LABEL_49:

        goto LABEL_50;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v13;
        id v57 = 0;
        int v15 = [[BMMLSEDurableFeatureStoreFeatureValueHistogram alloc] initWithJSONDictionary:v18 error:&v57];
        id v19 = v57;
        if (!v19)
        {

          goto LABEL_16;
        }
        uint64_t v20 = v19;
        if (v14) {
          id *v14 = v19;
        }

        v21 = 0;
        uint64_t v13 = v18;
      }
      else
      {
        if (!a4)
        {
          v21 = 0;
          int v25 = v55;
          id v11 = v51;
          goto LABEL_51;
        }
        id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v43 = *MEMORY[0x1E4F502C8];
        uint64_t v60 = *MEMORY[0x1E4F28568];
        int v15 = (BMMLSEDurableFeatureStoreFeatureValueHistogram *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"histogramValue"];
        v61 = v15;
        v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
        *a4 = (id)[v49 initWithDomain:v43 code:2 userInfo:v44];

        v21 = 0;
      }
LABEL_44:
      id v11 = v51;
LABEL_50:

      id v8 = v52;
      int v25 = v55;
LABEL_51:

LABEL_52:
      self = v56;
LABEL_53:

      double v7 = v53;
      goto LABEL_54;
    }
    if (a4)
    {
      v39 = a4;
      id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v41 = *MEMORY[0x1E4F502C8];
      uint64_t v62 = *MEMORY[0x1E4F28568];
      uint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"BOOLValue"];
      v63 = v13;
      int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      id v42 = (id)[v40 initWithDomain:v41 code:2 userInfo:v15];
      id v54 = 0;
      v21 = 0;
      id *v39 = v42;
      goto LABEL_44;
    }
    id v54 = 0;
    v21 = 0;
LABEL_60:
    int v25 = v55;
    goto LABEL_52;
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
    goto LABEL_55;
  }
  v22 = a4;
  id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v24 = *MEMORY[0x1E4F502C8];
  uint64_t v68 = *MEMORY[0x1E4F28568];
  int v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"intValue"];
  v69[0] = v25;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:&v68 count:1];
  id v26 = (id)[v23 initWithDomain:v24 code:2 userInfo:v9];
  id v8 = 0;
  v21 = 0;
  id *v22 = v26;
LABEL_54:

LABEL_55:
  return v21;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMLSEDurableFeatureStoreFeatureValue *)self writeTo:v3];
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
  if (self->_histogramValue)
  {
    PBDataWriterPlaceMark();
    [(BMMLSEDurableFeatureStoreFeatureValueHistogram *)self->_histogramValue writeTo:v4];
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)BMMLSEDurableFeatureStoreFeatureValue;
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
          uint64_t v51 = 0;
          uint64_t v52 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_68;
          }
          v39 = [[BMMLSEDurableFeatureStoreFeatureValueHistogram alloc] initByReadFrom:v4];
          if (!v39) {
            goto LABEL_68;
          }
          histogramValue = v5->_histogramValue;
          v5->_histogramValue = v39;

          PBReaderRecallMark();
          break;
        case 6u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v43 = 0;
          while (1)
          {
            uint64_t v44 = *v6;
            uint64_t v45 = *(void *)&v4[v44];
            unint64_t v46 = v45 + 1;
            if (v45 == -1 || v46 > *(void *)&v4[*v7]) {
              break;
            }
            char v47 = *(unsigned char *)(*(void *)&v4[*v9] + v45);
            *(void *)&v4[v44] = v46;
            v43 |= (unint64_t)(v47 & 0x7F) << v41;
            if ((v47 & 0x80) == 0) {
              goto LABEL_59;
            }
            v41 += 7;
            BOOL v17 = v42++ >= 9;
            if (v17)
            {
              LODWORD(v43) = 0;
              goto LABEL_61;
            }
          }
          v4[*v8] = 1;
LABEL_59:
          if (v4[*v8]) {
            LODWORD(v43) = 0;
          }
LABEL_61:
          if (v43 >= 2) {
            LODWORD(v43) = 0;
          }
          v5->_missingReason = v43;
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
    uint64_t v48 = 0;
  else {
LABEL_69:
  }
    uint64_t v48 = v5;

  return v48;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSEDurableFeatureStoreFeatureValue intValue](self, "intValue"));
  id v5 = NSNumber;
  [(BMMLSEDurableFeatureStoreFeatureValue *)self doubleValue];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  double v7 = [(BMMLSEDurableFeatureStoreFeatureValue *)self stringValue];
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMLSEDurableFeatureStoreFeatureValue BOOLValue](self, "BOOLValue"));
  double v9 = [(BMMLSEDurableFeatureStoreFeatureValue *)self histogramValue];
  char v10 = BMMLSEDurableFeatureStoreFeatureValueMissingReasonAsString([(BMMLSEDurableFeatureStoreFeatureValue *)self missingReason]);
  unsigned int v11 = (void *)[v3 initWithFormat:@"BMMLSEDurableFeatureStoreFeatureValue with intValue: %@, doubleValue: %@, stringValue: %@, BOOLValue: %@, histogramValue: %@, missingReason: %@", v4, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BMMLSEDurableFeatureStoreFeatureValue)initWithIntValue:(id)a3 doubleValue:(id)a4 stringValue:(id)a5 BOOLValue:(id)a6 histogramValue:(id)a7 missingReason:(int)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v23.receiver = self;
  v23.super_class = (Class)BMMLSEDurableFeatureStoreFeatureValue;
  id v19 = [(BMEventBase *)&v23 init];
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
    objc_storeStrong((id *)&v19->_histogramValue, a7);
    v19->_missingReason = a8;
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
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"histogramValue" number:5 type:14 subMessageClass:objc_opt_class()];
  v10[4] = v6;
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"missingReason" number:6 type:4 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4CE0;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"intValue" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"doubleValue" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stringValue" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"BOOLValue" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"histogramValue_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_1799];
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"missingReason" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

id __48__BMMLSEDurableFeatureStoreFeatureValue_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 histogramValue];
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

    id v8 = [[BMMLSEDurableFeatureStoreFeatureValue alloc] initByReadFrom:v7];
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

- (BMMLSEDurableFeatureStoreFeatureValue)initWithIntValue:(id)a3 doubleValue:(id)a4 stringValue:(id)a5 BOOLValue:(id)a6 histogramValue:(id)a7
{
  return [(BMMLSEDurableFeatureStoreFeatureValue *)self initWithIntValue:a3 doubleValue:a4 stringValue:a5 BOOLValue:a6 histogramValue:a7 missingReason:0];
}

@end
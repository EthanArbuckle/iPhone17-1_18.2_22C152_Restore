@interface BMWalletPaymentsCommerceRecurringSendSuggestions
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMWalletPaymentsCommerceRecurringSendSuggestions)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMWalletPaymentsCommerceRecurringSendSuggestions)initWithUserSelection:(int)a3 passType:(int)a4 tagClickDate:(id)a5 frequency:(int)a6 suggestionsRange:(int)a7 dayRange:(int)a8;
- (BOOL)hasTagClickDate;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)tagClickDate;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)dayRange;
- (int)frequency;
- (int)passType;
- (int)suggestionsRange;
- (int)userSelection;
- (unsigned)dataVersion;
- (void)setHasTagClickDate:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMWalletPaymentsCommerceRecurringSendSuggestions

- (int)dayRange
{
  return self->_dayRange;
}

- (int)suggestionsRange
{
  return self->_suggestionsRange;
}

- (int)frequency
{
  return self->_frequency;
}

- (void)setHasTagClickDate:(BOOL)a3
{
  self->_hasTagClickDate = a3;
}

- (BOOL)hasTagClickDate
{
  return self->_hasTagClickDate;
}

- (double)tagClickDate
{
  return self->_tagClickDate;
}

- (int)passType
{
  return self->_passType;
}

- (int)userSelection
{
  return self->_userSelection;
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
    int v6 = [(BMWalletPaymentsCommerceRecurringSendSuggestions *)self userSelection];
    if (v6 == [v5 userSelection]
      && (int v7 = [(BMWalletPaymentsCommerceRecurringSendSuggestions *)self passType],
          v7 == [v5 passType])
      && (![(BMWalletPaymentsCommerceRecurringSendSuggestions *)self hasTagClickDate]
       && ![v5 hasTagClickDate]
       || [(BMWalletPaymentsCommerceRecurringSendSuggestions *)self hasTagClickDate]
       && [v5 hasTagClickDate]
       && ([(BMWalletPaymentsCommerceRecurringSendSuggestions *)self tagClickDate],
           double v9 = v8,
           [v5 tagClickDate],
           v9 == v10))
      && (int v11 = [(BMWalletPaymentsCommerceRecurringSendSuggestions *)self frequency],
          v11 == [v5 frequency])
      && (int v12 = [(BMWalletPaymentsCommerceRecurringSendSuggestions *)self suggestionsRange],
          v12 == [v5 suggestionsRange]))
    {
      int v13 = [(BMWalletPaymentsCommerceRecurringSendSuggestions *)self dayRange];
      BOOL v14 = v13 == [v5 dayRange];
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)jsonDictionary
{
  v24[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMWalletPaymentsCommerceRecurringSendSuggestions userSelection](self, "userSelection"));
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMWalletPaymentsCommerceRecurringSendSuggestions passType](self, "passType"));
  if (![(BMWalletPaymentsCommerceRecurringSendSuggestions *)self hasTagClickDate]
    || ([(BMWalletPaymentsCommerceRecurringSendSuggestions *)self tagClickDate], fabs(v5) == INFINITY))
  {
    int v7 = 0;
  }
  else
  {
    [(BMWalletPaymentsCommerceRecurringSendSuggestions *)self tagClickDate];
    int v6 = NSNumber;
    [(BMWalletPaymentsCommerceRecurringSendSuggestions *)self tagClickDate];
    int v7 = objc_msgSend(v6, "numberWithDouble:");
  }
  double v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMWalletPaymentsCommerceRecurringSendSuggestions frequency](self, "frequency"));
  double v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMWalletPaymentsCommerceRecurringSendSuggestions suggestionsRange](self, "suggestionsRange"));
  double v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMWalletPaymentsCommerceRecurringSendSuggestions dayRange](self, "dayRange"));
  v23[0] = @"userSelection";
  uint64_t v11 = v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v19 = v11;
  v21 = (void *)v4;
  v24[0] = v11;
  v23[1] = @"passType";
  int v12 = (void *)v4;
  if (!v4)
  {
    int v12 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v11);
  }
  v24[1] = v12;
  v23[2] = @"tagClickDate";
  int v13 = v7;
  if (!v7)
  {
    int v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v3;
  v24[2] = v13;
  v23[3] = @"frequency";
  BOOL v14 = v8;
  if (!v8)
  {
    BOOL v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[3] = v14;
  v23[4] = @"suggestionsRange";
  v15 = v9;
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[4] = v15;
  v23[5] = @"dayRange";
  v16 = v10;
  if (!v10)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[5] = v16;
  v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v24, v23, 6, v19);
  if (v10)
  {
    if (v9) {
      goto LABEL_19;
    }
LABEL_28:

    if (v8) {
      goto LABEL_20;
    }
    goto LABEL_29;
  }

  if (!v9) {
    goto LABEL_28;
  }
LABEL_19:
  if (v8) {
    goto LABEL_20;
  }
LABEL_29:

LABEL_20:
  if (!v7) {

  }
  if (v21)
  {
    if (v22) {
      goto LABEL_24;
    }
  }
  else
  {

    if (v22) {
      goto LABEL_24;
    }
  }

LABEL_24:

  return v17;
}

- (BMWalletPaymentsCommerceRecurringSendSuggestions)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v79[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [v5 objectForKeyedSubscript:@"userSelection"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v7 = 0;
LABEL_9:
    double v9 = [v5 objectForKeyedSubscript:@"passType"];
    v65 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            double v10 = 0;
            v30 = 0;
            goto LABEL_36;
          }
          id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v43 = *MEMORY[0x1E4F502C8];
          uint64_t v76 = *MEMORY[0x1E4F28568];
          uint64_t v44 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"passType"];
          uint64_t v77 = v44;
          uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
          v46 = v42;
          int v13 = (void *)v45;
          double v10 = 0;
          v30 = 0;
          *a4 = (id)[v46 initWithDomain:v43 code:2 userInfo:v45];
          v29 = (void *)v44;
          goto LABEL_35;
        }
        id v11 = [NSNumber numberWithInt:BMWalletPaymentsCommerceRecurringSendSuggestionsPassTypeFromString(v9)];
      }
      double v10 = v11;
    }
    else
    {
      double v10 = 0;
    }
    uint64_t v12 = [v5 objectForKeyedSubscript:@"tagClickDate"];
    v63 = (void *)v12;
    if (v12 && (int v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v29 = 0;
          v30 = 0;
          goto LABEL_35;
        }
        id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v74 = *MEMORY[0x1E4F28568];
        v35 = v10;
        id v36 = [NSString alloc];
        uint64_t v58 = objc_opt_class();
        v37 = v36;
        double v10 = v35;
        id v66 = (id)[v37 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v58, @"tagClickDate"];
        id v75 = v66;
        uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
        v39 = v33;
        int v13 = v63;
        v62 = (void *)v38;
        v30 = 0;
        *a4 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v34, 2);
        v29 = 0;
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }
      id v60 = v13;
    }
    else
    {
      id v60 = 0;
    }
    uint64_t v14 = [v5 objectForKeyedSubscript:@"frequency"];
    v61 = v10;
    v62 = (void *)v14;
    if (v14 && (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v66 = v15;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v66 = 0;
            v30 = 0;
            v29 = v60;
            goto LABEL_33;
          }
          id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v48 = *MEMORY[0x1E4F502C8];
          uint64_t v72 = *MEMORY[0x1E4F28568];
          id v64 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"frequency"];
          id v73 = v64;
          v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
          id v66 = 0;
          v30 = 0;
          *a4 = (id)[v47 initWithDomain:v48 code:2 userInfo:v31];
          v29 = v60;
          double v10 = v61;
LABEL_32:

LABEL_33:
          int v13 = v63;
          goto LABEL_34;
        }
        id v66 = [NSNumber numberWithInt:BMWalletPaymentsCommerceRecurringSendSuggestionsFrequencyFromString(v15)];
      }
    }
    else
    {
      id v66 = 0;
    }
    uint64_t v16 = [v5 objectForKeyedSubscript:@"suggestionsRange"];
    v59 = (void *)v16;
    if (v16 && (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v64 = v17;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v64 = 0;
            v30 = 0;
            v29 = v60;
            goto LABEL_31;
          }
          v49 = v9;
          id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v51 = *MEMORY[0x1E4F502C8];
          uint64_t v70 = *MEMORY[0x1E4F28568];
          id v22 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"suggestionsRange"];
          id v71 = v22;
          v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
          v52 = v50;
          double v9 = v49;
          id v53 = (id)[v52 initWithDomain:v51 code:2 userInfo:v18];
          id v64 = 0;
          v30 = 0;
          *a4 = v53;
          goto LABEL_66;
        }
        id v64 = [NSNumber numberWithInt:BMWalletPaymentsCommerceRecurringSendSuggestionsSuggestionsRangeFromString(v17)];
      }
    }
    else
    {
      id v64 = 0;
    }
    v18 = [v5 objectForKeyedSubscript:@"dayRange"];
    if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v19 = v9;
      v20 = v6;
      v21 = self;
      id v22 = 0;
LABEL_29:
      uint64_t v23 = [v7 intValue];
      uint64_t v24 = [v10 intValue];
      uint64_t v25 = [v66 intValue];
      uint64_t v26 = [v64 intValue];
      uint64_t v27 = [v22 intValue];
      uint64_t v28 = v24;
      v29 = v60;
      v30 = [(BMWalletPaymentsCommerceRecurringSendSuggestions *)v21 initWithUserSelection:v23 passType:v28 tagClickDate:v60 frequency:v25 suggestionsRange:v26 dayRange:v27];
      self = v30;
      int v6 = v20;
      double v9 = v19;
LABEL_30:

      double v10 = v61;
LABEL_31:
      v31 = v59;
      goto LABEL_32;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = v9;
      v20 = v6;
      v21 = self;
      id v22 = v18;
      goto LABEL_29;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = v9;
      v20 = v6;
      v21 = self;
      id v22 = [NSNumber numberWithInt:BMWalletPaymentsCommerceRecurringSendSuggestionsDayRangeFromString(v18)];
      goto LABEL_29;
    }
    if (a4)
    {
      id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v55 = *MEMORY[0x1E4F502C8];
      uint64_t v68 = *MEMORY[0x1E4F28568];
      v56 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"dayRange"];
      v69 = v56;
      v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      *a4 = (id)[v54 initWithDomain:v55 code:2 userInfo:v57];
    }
    id v22 = 0;
    v30 = 0;
LABEL_66:
    v29 = v60;
    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
LABEL_8:
    int v7 = v8;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [NSNumber numberWithInt:BMWalletPaymentsCommerceRecurringSendSuggestionsUserSelectionFromString(v6)];
    goto LABEL_8;
  }
  if (!a4)
  {
    v65 = 0;
    v30 = 0;
    goto LABEL_37;
  }
  id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v41 = *MEMORY[0x1E4F502C8];
  uint64_t v78 = *MEMORY[0x1E4F28568];
  double v10 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"userSelection"];
  v79[0] = v10;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:&v78 count:1];
  v65 = 0;
  v30 = 0;
  *a4 = (id)[v40 initWithDomain:v41 code:2 userInfo:v9];
LABEL_36:

LABEL_37:
  return v30;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMWalletPaymentsCommerceRecurringSendSuggestions *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasTagClickDate) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)BMWalletPaymentsCommerceRecurringSendSuggestions;
  id v5 = [(BMEventBase *)&v57 init];
  if (!v5) {
    goto LABEL_97;
  }
  int v6 = (int *)MEMORY[0x1E4F940E8];
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
              goto LABEL_61;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_63;
            }
          }
          v4[*v8] = 1;
LABEL_61:
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_63:
          if (v22 >= 4) {
            LODWORD(v22) = 0;
          }
          uint64_t v54 = 24;
          goto LABEL_90;
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
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_69:
          if (v22 >= 3) {
            LODWORD(v22) = 0;
          }
          uint64_t v54 = 28;
          goto LABEL_90;
        case 3u:
          v5->_hasTagClickDate = 1;
          uint64_t v33 = *v6;
          unint64_t v34 = *(void *)&v4[v33];
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(void *)&v4[*v7])
          {
            double v35 = *(double *)(*(void *)&v4[*v9] + v34);
            *(void *)&v4[v33] = v34 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v35 = 0.0;
          }
          v5->_tagClickDate = v35;
          continue;
        case 4u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v22 = 0;
          while (2)
          {
            uint64_t v38 = *v6;
            uint64_t v39 = *(void *)&v4[v38];
            unint64_t v40 = v39 + 1;
            if (v39 == -1 || v40 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)&v4[*v9] + v39);
              *(void *)&v4[v38] = v40;
              v22 |= (unint64_t)(v41 & 0x7F) << v36;
              if (v41 < 0)
              {
                v36 += 7;
                BOOL v17 = v37++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_75:
          if (v22 >= 6) {
            LODWORD(v22) = 0;
          }
          uint64_t v54 = 32;
          goto LABEL_90;
        case 5u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v22 = 0;
          while (2)
          {
            uint64_t v44 = *v6;
            uint64_t v45 = *(void *)&v4[v44];
            unint64_t v46 = v45 + 1;
            if (v45 == -1 || v46 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v47 = *(unsigned char *)(*(void *)&v4[*v9] + v45);
              *(void *)&v4[v44] = v46;
              v22 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                BOOL v17 = v43++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_81:
          if (v22 >= 3) {
            LODWORD(v22) = 0;
          }
          uint64_t v54 = 36;
          goto LABEL_90;
        case 6u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v22 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_96;
          }
          continue;
      }
      while (1)
      {
        uint64_t v50 = *v6;
        uint64_t v51 = *(void *)&v4[v50];
        unint64_t v52 = v51 + 1;
        if (v51 == -1 || v52 > *(void *)&v4[*v7]) {
          break;
        }
        char v53 = *(unsigned char *)(*(void *)&v4[*v9] + v51);
        *(void *)&v4[v50] = v52;
        v22 |= (unint64_t)(v53 & 0x7F) << v48;
        if ((v53 & 0x80) == 0) {
          goto LABEL_85;
        }
        v48 += 7;
        BOOL v17 = v49++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_87;
        }
      }
      v4[*v8] = 1;
LABEL_85:
      if (v4[*v8]) {
        LODWORD(v22) = 0;
      }
LABEL_87:
      if (v22 >= 4) {
        LODWORD(v22) = 0;
      }
      uint64_t v54 = 40;
LABEL_90:
      *(_DWORD *)((char *)&v5->super.super.isa + v54) = v22;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_96:
  }
    uint64_t v55 = 0;
  else {
LABEL_97:
  }
    uint64_t v55 = v5;

  return v55;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMWalletPaymentsCommerceRecurringSendSuggestionsUserSelectionAsString([(BMWalletPaymentsCommerceRecurringSendSuggestions *)self userSelection]);
  id v5 = BMWalletPaymentsCommerceRecurringSendSuggestionsPassTypeAsString([(BMWalletPaymentsCommerceRecurringSendSuggestions *)self passType]);
  int v6 = NSNumber;
  [(BMWalletPaymentsCommerceRecurringSendSuggestions *)self tagClickDate];
  int v7 = objc_msgSend(v6, "numberWithDouble:");
  id v8 = BMWalletPaymentsCommerceRecurringSendSuggestionsFrequencyAsString([(BMWalletPaymentsCommerceRecurringSendSuggestions *)self frequency]);
  double v9 = BMWalletPaymentsCommerceRecurringSendSuggestionsSuggestionsRangeAsString([(BMWalletPaymentsCommerceRecurringSendSuggestions *)self suggestionsRange]);
  char v10 = BMWalletPaymentsCommerceRecurringSendSuggestionsDayRangeAsString([(BMWalletPaymentsCommerceRecurringSendSuggestions *)self dayRange]);
  unsigned int v11 = (void *)[v3 initWithFormat:@"BMWalletPaymentsCommerceRecurringSendSuggestions with userSelection: %@, passType: %@, tagClickDate: %@, frequency: %@, suggestionsRange: %@, dayRange: %@", v4, v5, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BMWalletPaymentsCommerceRecurringSendSuggestions)initWithUserSelection:(int)a3 passType:(int)a4 tagClickDate:(id)a5 frequency:(int)a6 suggestionsRange:(int)a7 dayRange:(int)a8
{
  id v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BMWalletPaymentsCommerceRecurringSendSuggestions;
  unint64_t v15 = [(BMEventBase *)&v18 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v15->_userSelection = a3;
    v15->_passType = a4;
    if (v14)
    {
      v15->_hasTagClickDate = 1;
      [v14 doubleValue];
    }
    else
    {
      v15->_hasTagClickDate = 0;
      double v16 = -1.0;
    }
    v15->_tagClickDate = v16;
    v15->_frequency = a6;
    v15->_suggestionsRange = a7;
    v15->_dayRange = a8;
  }

  return v15;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userSelection" number:1 type:4 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"passType" number:2 type:4 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tagClickDate" number:3 type:0 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"frequency" number:4 type:4 subMessageClass:0];
  v10[3] = v5;
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"suggestionsRange" number:5 type:4 subMessageClass:0];
  v10[4] = v6;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dayRange" number:6 type:4 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5F40;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userSelection" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"passType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tagClickDate" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"frequency" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"suggestionsRange" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"dayRange" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
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
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMWalletPaymentsCommerceRecurringSendSuggestions alloc] initByReadFrom:v7];
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
@interface BMHomeKitBase
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMHomeKitBase)initWithAbsoluteTimestamp:(id)a3 duration:(id)a4 homeUniqueIdentifier:(id)a5 homeOccupancy:(id)a6 source:(id)a7 clientName:(id)a8 eventCorrelationIdentifier:(id)a9;
- (BMHomeKitBase)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasDuration;
- (BOOL)hasHomeOccupancy;
- (BOOL)isEqual:(id)a3;
- (NSDate)absoluteTimestamp;
- (NSString)clientName;
- (NSString)description;
- (NSString)eventCorrelationIdentifier;
- (NSString)homeUniqueIdentifier;
- (NSString)source;
- (double)duration;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)homeOccupancy;
- (unsigned)dataVersion;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasHomeOccupancy:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMHomeKitBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_homeUniqueIdentifier, 0);
}

- (NSString)eventCorrelationIdentifier
{
  return self->_eventCorrelationIdentifier;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (NSString)source
{
  return self->_source;
}

- (void)setHasHomeOccupancy:(BOOL)a3
{
  self->_hasHomeOccupancy = a3;
}

- (BOOL)hasHomeOccupancy
{
  return self->_hasHomeOccupancy;
}

- (int)homeOccupancy
{
  return self->_homeOccupancy;
}

- (NSString)homeUniqueIdentifier
{
  return self->_homeUniqueIdentifier;
}

- (void)setHasDuration:(BOOL)a3
{
  self->_hasDuration = a3;
}

- (BOOL)hasDuration
{
  return self->_hasDuration;
}

- (double)duration
{
  return self->_duration;
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
    v6 = [(BMHomeKitBase *)self absoluteTimestamp];
    uint64_t v7 = [v5 absoluteTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMHomeKitBase *)self absoluteTimestamp];
      v10 = [v5 absoluteTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_27;
      }
    }
    if (-[BMHomeKitBase hasDuration](self, "hasDuration") || [v5 hasDuration])
    {
      if (![(BMHomeKitBase *)self hasDuration]) {
        goto LABEL_27;
      }
      if (![v5 hasDuration]) {
        goto LABEL_27;
      }
      [(BMHomeKitBase *)self duration];
      double v14 = v13;
      [v5 duration];
      if (v14 != v15) {
        goto LABEL_27;
      }
    }
    v16 = [(BMHomeKitBase *)self homeUniqueIdentifier];
    uint64_t v17 = [v5 homeUniqueIdentifier];
    if (v16 == (void *)v17)
    {
    }
    else
    {
      v18 = (void *)v17;
      v19 = [(BMHomeKitBase *)self homeUniqueIdentifier];
      v20 = [v5 homeUniqueIdentifier];
      int v21 = [v19 isEqual:v20];

      if (!v21) {
        goto LABEL_27;
      }
    }
    if ([(BMHomeKitBase *)self hasHomeOccupancy]
      || [v5 hasHomeOccupancy])
    {
      if (![(BMHomeKitBase *)self hasHomeOccupancy]) {
        goto LABEL_27;
      }
      if (![v5 hasHomeOccupancy]) {
        goto LABEL_27;
      }
      int v22 = [(BMHomeKitBase *)self homeOccupancy];
      if (v22 != [v5 homeOccupancy]) {
        goto LABEL_27;
      }
    }
    v23 = [(BMHomeKitBase *)self source];
    uint64_t v24 = [v5 source];
    if (v23 == (void *)v24)
    {
    }
    else
    {
      v25 = (void *)v24;
      v26 = [(BMHomeKitBase *)self source];
      v27 = [v5 source];
      int v28 = [v26 isEqual:v27];

      if (!v28) {
        goto LABEL_27;
      }
    }
    v29 = [(BMHomeKitBase *)self clientName];
    uint64_t v30 = [v5 clientName];
    if (v29 == (void *)v30)
    {
    }
    else
    {
      v31 = (void *)v30;
      v32 = [(BMHomeKitBase *)self clientName];
      v33 = [v5 clientName];
      int v34 = [v32 isEqual:v33];

      if (!v34)
      {
LABEL_27:
        char v12 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    v36 = [(BMHomeKitBase *)self eventCorrelationIdentifier];
    v37 = [v5 eventCorrelationIdentifier];
    if (v36 == v37)
    {
      char v12 = 1;
    }
    else
    {
      v38 = [(BMHomeKitBase *)self eventCorrelationIdentifier];
      v39 = [v5 eventCorrelationIdentifier];
      char v12 = [v38 isEqual:v39];
    }
    goto LABEL_28;
  }
  char v12 = 0;
LABEL_29:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
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
  v30[7] = *MEMORY[0x1E4F143B8];
  v3 = [(BMHomeKitBase *)self absoluteTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMHomeKitBase *)self absoluteTimestamp];
    [v5 timeIntervalSince1970];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  if (![(BMHomeKitBase *)self hasDuration]
    || ([(BMHomeKitBase *)self duration], fabs(v7) == INFINITY))
  {
    uint64_t v9 = 0;
  }
  else
  {
    [(BMHomeKitBase *)self duration];
    v8 = NSNumber;
    [(BMHomeKitBase *)self duration];
    uint64_t v9 = objc_msgSend(v8, "numberWithDouble:");
  }
  v10 = [(BMHomeKitBase *)self homeUniqueIdentifier];
  if ([(BMHomeKitBase *)self hasHomeOccupancy])
  {
    int v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMHomeKitBase homeOccupancy](self, "homeOccupancy"));
  }
  else
  {
    int v11 = 0;
  }
  char v12 = [(BMHomeKitBase *)self source];
  double v13 = [(BMHomeKitBase *)self clientName];
  double v14 = [(BMHomeKitBase *)self eventCorrelationIdentifier];
  v29[0] = @"absoluteTimestamp";
  uint64_t v15 = v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v15;
  v30[0] = v15;
  v29[1] = @"duration";
  uint64_t v16 = v9;
  if (!v9)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v16;
  v30[1] = v16;
  v29[2] = @"homeUniqueIdentifier";
  uint64_t v17 = (uint64_t)v10;
  if (!v10)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  int v28 = (void *)v6;
  uint64_t v24 = (void *)v17;
  v30[2] = v17;
  v29[3] = @"homeOccupancy";
  v18 = v11;
  if (!v11)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v9;
  v30[3] = v18;
  v29[4] = @"source";
  v19 = v12;
  if (!v12)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[4] = v19;
  v29[5] = @"clientName";
  v20 = v13;
  if (!v13)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[5] = v20;
  v29[6] = @"eventCorrelationIdentifier";
  int v21 = v14;
  if (!v14)
  {
    int v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[6] = v21;
  int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:7];
  if (v14)
  {
    if (v13) {
      goto LABEL_27;
    }
LABEL_37:

    if (v12) {
      goto LABEL_28;
    }
    goto LABEL_38;
  }

  if (!v13) {
    goto LABEL_37;
  }
LABEL_27:
  if (v12) {
    goto LABEL_28;
  }
LABEL_38:

LABEL_28:
  if (!v11) {

  }
  if (v10)
  {
    if (v27) {
      goto LABEL_32;
    }
LABEL_40:

    if (v28) {
      goto LABEL_33;
    }
    goto LABEL_41;
  }

  if (!v27) {
    goto LABEL_40;
  }
LABEL_32:
  if (v28) {
    goto LABEL_33;
  }
LABEL_41:

LABEL_33:

  return v22;
}

- (BMHomeKitBase)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"absoluteTimestamp"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_9:
    uint64_t v16 = [v6 objectForKeyedSubscript:@"duration"];
    v49 = a4;
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v26 = 0;
          v25 = 0;
          goto LABEL_34;
        }
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v29 = *MEMORY[0x1E4F502C8];
        uint64_t v67 = *MEMORY[0x1E4F28568];
        id v55 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"duration"];
        id v68 = v55;
        uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
        v25 = 0;
        v26 = 0;
        id *v49 = (id)[v28 initWithDomain:v29 code:2 userInfo:v17];
        goto LABEL_33;
      }
      id v54 = v16;
    }
    else
    {
      id v54 = 0;
    }
    uint64_t v17 = [v6 objectForKeyedSubscript:@"homeUniqueIdentifier"];
    v50 = v7;
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v55 = 0;
          v25 = 0;
          v26 = v54;
          goto LABEL_33;
        }
        id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v65 = *MEMORY[0x1E4F28568];
        id v53 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"homeUniqueIdentifier"];
        id v66 = v53;
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        id v31 = (id)[v56 initWithDomain:v30 code:2 userInfo:v18];
        v25 = 0;
        id v55 = 0;
        id *v49 = v31;
        goto LABEL_66;
      }
      id v55 = v17;
    }
    else
    {
      id v55 = 0;
    }
    v18 = [v6 objectForKeyedSubscript:@"homeOccupancy"];
    if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v53 = 0;
LABEL_18:
      v19 = [v6 objectForKeyedSubscript:@"source"];
      v47 = v16;
      v48 = v8;
      if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v49)
          {
            id v51 = 0;
            v25 = 0;
            goto LABEL_30;
          }
          int v21 = self;
          id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v35 = *MEMORY[0x1E4F502C8];
          uint64_t v61 = *MEMORY[0x1E4F28568];
          id v22 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"source"];
          id v62 = v22;
          v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
          id v36 = (id)[v52 initWithDomain:v35 code:2 userInfo:v20];
          v25 = 0;
          id v51 = 0;
          id *v49 = v36;
LABEL_29:

          self = v21;
          v8 = v48;
LABEL_30:
          uint64_t v16 = v47;
LABEL_31:
          v26 = v54;

LABEL_32:
          double v7 = v50;
LABEL_33:

          goto LABEL_34;
        }
        id v51 = v19;
      }
      else
      {
        id v51 = 0;
      }
      v20 = [v6 objectForKeyedSubscript:@"clientName"];
      if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        int v21 = self;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v49)
          {
            id v22 = 0;
            v25 = 0;
            goto LABEL_29;
          }
          id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v38 = *MEMORY[0x1E4F502C8];
          uint64_t v59 = *MEMORY[0x1E4F28568];
          id v24 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientName"];
          id v60 = v24;
          v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
          id v39 = (id)[v37 initWithDomain:v38 code:2 userInfo:v23];
          v25 = 0;
          id v22 = 0;
          id *v49 = v39;
          goto LABEL_28;
        }
        id v22 = v20;
      }
      else
      {
        int v21 = self;
        id v22 = 0;
      }
      v23 = [v6 objectForKeyedSubscript:@"eventCorrelationIdentifier"];
      if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v49)
          {
            id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v45 = *MEMORY[0x1E4F502C8];
            uint64_t v57 = *MEMORY[0x1E4F28568];
            v40 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"eventCorrelationIdentifier"];
            v58 = v40;
            v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
            id *v49 = (id)[v46 initWithDomain:v45 code:2 userInfo:v41];
          }
          id v24 = 0;
          v25 = 0;
          goto LABEL_28;
        }
        id v24 = v23;
      }
      else
      {
        id v24 = 0;
      }
      v25 = [(BMHomeKitBase *)v21 initWithAbsoluteTimestamp:v48 duration:v54 homeUniqueIdentifier:v55 homeOccupancy:v53 source:v51 clientName:v22 eventCorrelationIdentifier:v24];
      int v21 = v25;
LABEL_28:

      goto LABEL_29;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v53 = v18;
      goto LABEL_18;
    }
    if (a4)
    {
      id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v33 = *MEMORY[0x1E4F502C8];
      uint64_t v63 = *MEMORY[0x1E4F28568];
      id v51 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"homeOccupancy"];
      id v64 = v51;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
      id v34 = (id)[v32 initWithDomain:v33 code:2 userInfo:v19];
      v25 = 0;
      id v53 = 0;
      id *v49 = v34;
      goto LABEL_31;
    }
    id v53 = 0;
    v25 = 0;
LABEL_66:
    v26 = v54;
    goto LABEL_32;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v10 = v7;
    id v11 = [v9 alloc];
    [v10 doubleValue];
    double v13 = v12;

    id v14 = (id)[v11 initWithTimeIntervalSince1970:v13];
LABEL_6:
    v8 = v14;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    v8 = [v15 dateFromString:v7];

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v7;
    goto LABEL_6;
  }
  if (!a4)
  {
    v8 = 0;
    v25 = 0;
    goto LABEL_35;
  }
  id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
  v43 = a4;
  uint64_t v44 = *MEMORY[0x1E4F502C8];
  uint64_t v69 = *MEMORY[0x1E4F28568];
  v26 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
  v70[0] = v26;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:&v69 count:1];
  v8 = 0;
  v25 = 0;
  id *v43 = (id)[v42 initWithDomain:v44 code:2 userInfo:v16];
LABEL_34:

LABEL_35:
  return v25;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMHomeKitBase *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasDuration)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_homeUniqueIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasHomeOccupancy)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_source)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_eventCorrelationIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMHomeKitBase;
  id v5 = [(BMEventBase *)&v38 init];
  if (!v5) {
    goto LABEL_52;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  double v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
          v5->_hasRaw_absoluteTimestamp = 1;
          uint64_t v20 = *v6;
          unint64_t v21 = *(void *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)&v4[*v7])
          {
            id v22 = *(objc_class **)(*(void *)&v4[*v9] + v21);
            *(void *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v22 = 0;
          }
          uint64_t v35 = 24;
          goto LABEL_48;
        case 2u:
          v5->_hasDuration = 1;
          uint64_t v23 = *v6;
          unint64_t v24 = *(void *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v7])
          {
            id v22 = *(objc_class **)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v22 = 0;
          }
          uint64_t v35 = 48;
LABEL_48:
          *(Class *)((char *)&v5->super.super.isa + v35) = v22;
          continue;
        case 3u:
          uint64_t v25 = PBReaderReadString();
          uint64_t v26 = 56;
          goto LABEL_39;
        case 4u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          v5->_hasHomeOccupancy = 1;
          break;
        case 5u:
          uint64_t v25 = PBReaderReadString();
          uint64_t v26 = 64;
          goto LABEL_39;
        case 6u:
          uint64_t v25 = PBReaderReadString();
          uint64_t v26 = 72;
          goto LABEL_39;
        case 7u:
          uint64_t v25 = PBReaderReadString();
          uint64_t v26 = 80;
LABEL_39:
          id v34 = *(Class *)((char *)&v5->super.super.isa + v26);
          *(Class *)((char *)&v5->super.super.isa + v26) = (Class)v25;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_51;
          }
          continue;
      }
      while (1)
      {
        uint64_t v30 = *v6;
        uint64_t v31 = *(void *)&v4[v30];
        unint64_t v32 = v31 + 1;
        if (v31 == -1 || v32 > *(void *)&v4[*v7]) {
          break;
        }
        char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
        *(void *)&v4[v30] = v32;
        v29 |= (unint64_t)(v33 & 0x7F) << v27;
        if ((v33 & 0x80) == 0) {
          goto LABEL_41;
        }
        v27 += 7;
        BOOL v17 = v28++ >= 9;
        if (v17)
        {
          LODWORD(v29) = 0;
          goto LABEL_43;
        }
      }
      v4[*v8] = 1;
LABEL_41:
      if (v4[*v8]) {
        LODWORD(v29) = 0;
      }
LABEL_43:
      v5->_homeOccupancy = v29;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_51:
  }
    id v36 = 0;
  else {
LABEL_52:
  }
    id v36 = v5;

  return v36;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMHomeKitBase *)self absoluteTimestamp];
  id v5 = NSNumber;
  [(BMHomeKitBase *)self duration];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  double v7 = [(BMHomeKitBase *)self homeUniqueIdentifier];
  v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMHomeKitBase homeOccupancy](self, "homeOccupancy"));
  uint64_t v9 = [(BMHomeKitBase *)self source];
  char v10 = [(BMHomeKitBase *)self clientName];
  unsigned int v11 = [(BMHomeKitBase *)self eventCorrelationIdentifier];
  unint64_t v12 = (void *)[v3 initWithFormat:@"BMHomeKitBase with absoluteTimestamp: %@, duration: %@, homeUniqueIdentifier: %@, homeOccupancy: %@, source: %@, clientName: %@, eventCorrelationIdentifier: %@", v4, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMHomeKitBase)initWithAbsoluteTimestamp:(id)a3 duration:(id)a4 homeUniqueIdentifier:(id)a5 homeOccupancy:(id)a6 source:(id)a7 clientName:(id)a8 eventCorrelationIdentifier:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v26 = a5;
  id v17 = a6;
  id v25 = a7;
  id v18 = a8;
  id v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)BMHomeKitBase;
  uint64_t v20 = [(BMEventBase *)&v27 init];
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v25, v26);
    if (v15)
    {
      v20->_hasRaw_absoluteTimestamp = 1;
      [v15 timeIntervalSince1970];
    }
    else
    {
      v20->_hasRaw_absoluteTimestamp = 0;
      double v21 = -1.0;
    }
    v20->_raw_absoluteTimestamp = v21;
    if (v16)
    {
      v20->_hasDuration = 1;
      [v16 doubleValue];
    }
    else
    {
      v20->_hasDuration = 0;
      double v22 = -1.0;
    }
    v20->_duration = v22;
    objc_storeStrong((id *)&v20->_homeUniqueIdentifier, a5);
    if (v17)
    {
      v20->_hasHomeOccupancy = 1;
      int v23 = [v17 intValue];
    }
    else
    {
      v20->_hasHomeOccupancy = 0;
      int v23 = -1;
    }
    v20->_homeOccupancy = v23;
    objc_storeStrong((id *)&v20->_source, a7);
    objc_storeStrong((id *)&v20->_clientName, a8);
    objc_storeStrong((id *)&v20->_eventCorrelationIdentifier, a9);
  }

  return v20;
}

+ (id)protoFields
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:1 type:0 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"duration", 2, 0, 0, v2);
  v11[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"homeUniqueIdentifier" number:3 type:13 subMessageClass:0];
  v11[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"homeOccupancy" number:4 type:2 subMessageClass:0];
  v11[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"source" number:5 type:13 subMessageClass:0];
  v11[4] = v6;
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientName" number:6 type:13 subMessageClass:0];
  v11[5] = v7;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventCorrelationIdentifier" number:7 type:13 subMessageClass:0];
  v11[6] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5BE0;
}

+ (id)columns
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:2];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"duration" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"homeUniqueIdentifier" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"homeOccupancy" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:2 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"source" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientName" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventCorrelationIdentifier" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
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

    v8 = [[BMHomeKitBase alloc] initByReadFrom:v7];
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
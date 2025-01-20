@interface BMDeviceCellularAvailabilityStatus
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDeviceCellularAvailabilityStatus)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BMDeviceCellularAvailabilityStatus)initWithTimeStamp:(id)a3 deviceType:(int)a4 deviceRegistrationStatus:(int)a5;
- (BMDeviceCellularAvailabilityStatus)initWithTimeStamp:(id)a3 deviceType:(int)a4 deviceRegistrationStatus:(int)a5 previousDeviceRegistrationStatus:(int)a6;
- (BMDeviceCellularAvailabilityStatus)initWithTimeStamp:(id)a3 deviceType:(int)a4 deviceRegistrationStatus:(int)a5 previousDeviceRegistrationStatus:(int)a6 aboveThreshold:(id)a7 latestStrongTimeStamp:(id)a8;
- (BOOL)aboveThreshold;
- (BOOL)hasAboveThreshold;
- (BOOL)isEqual:(id)a3;
- (NSDate)latestStrongTimeStamp;
- (NSDate)timeStamp;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)deviceRegistrationStatus;
- (int)deviceType;
- (int)previousDeviceRegistrationStatus;
- (unsigned)dataVersion;
- (void)setHasAboveThreshold:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDeviceCellularAvailabilityStatus

- (BMDeviceCellularAvailabilityStatus)initWithTimeStamp:(id)a3 deviceType:(int)a4 deviceRegistrationStatus:(int)a5 previousDeviceRegistrationStatus:(int)a6
{
  return [(BMDeviceCellularAvailabilityStatus *)self initWithTimeStamp:a3 deviceType:*(void *)&a4 deviceRegistrationStatus:*(void *)&a5 previousDeviceRegistrationStatus:*(void *)&a6 aboveThreshold:0 latestStrongTimeStamp:0];
}

- (BMDeviceCellularAvailabilityStatus)initWithTimeStamp:(id)a3 deviceType:(int)a4 deviceRegistrationStatus:(int)a5
{
  return [(BMDeviceCellularAvailabilityStatus *)self initWithTimeStamp:a3 deviceType:*(void *)&a4 deviceRegistrationStatus:*(void *)&a5 previousDeviceRegistrationStatus:0 aboveThreshold:0 latestStrongTimeStamp:0];
}

- (void)setHasAboveThreshold:(BOOL)a3
{
  self->_hasAboveThreshold = a3;
}

- (BOOL)hasAboveThreshold
{
  return self->_hasAboveThreshold;
}

- (BOOL)aboveThreshold
{
  return self->_aboveThreshold;
}

- (int)previousDeviceRegistrationStatus
{
  return self->_previousDeviceRegistrationStatus;
}

- (int)deviceRegistrationStatus
{
  return self->_deviceRegistrationStatus;
}

- (int)deviceType
{
  return self->_deviceType;
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
    v6 = [(BMDeviceCellularAvailabilityStatus *)self timeStamp];
    uint64_t v7 = [v5 timeStamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMDeviceCellularAvailabilityStatus *)self timeStamp];
      v10 = [v5 timeStamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_15;
      }
    }
    int v13 = [(BMDeviceCellularAvailabilityStatus *)self deviceType];
    if (v13 == [v5 deviceType])
    {
      int v14 = [(BMDeviceCellularAvailabilityStatus *)self deviceRegistrationStatus];
      if (v14 == [v5 deviceRegistrationStatus])
      {
        int v15 = [(BMDeviceCellularAvailabilityStatus *)self previousDeviceRegistrationStatus];
        if (v15 == [v5 previousDeviceRegistrationStatus])
        {
          if (![(BMDeviceCellularAvailabilityStatus *)self hasAboveThreshold]
            && ![v5 hasAboveThreshold]
            || [(BMDeviceCellularAvailabilityStatus *)self hasAboveThreshold]
            && [v5 hasAboveThreshold]
            && (int v16 = [(BMDeviceCellularAvailabilityStatus *)self aboveThreshold],
                v16 == [v5 aboveThreshold]))
          {
            v18 = [(BMDeviceCellularAvailabilityStatus *)self latestStrongTimeStamp];
            v19 = [v5 latestStrongTimeStamp];
            if (v18 == v19)
            {
              char v12 = 1;
            }
            else
            {
              v20 = [(BMDeviceCellularAvailabilityStatus *)self latestStrongTimeStamp];
              v21 = [v5 latestStrongTimeStamp];
              char v12 = [v20 isEqual:v21];
            }
            goto LABEL_16;
          }
        }
      }
    }
LABEL_15:
    char v12 = 0;
LABEL_16:

    goto LABEL_17;
  }
  char v12 = 0;
LABEL_17:

  return v12;
}

- (NSDate)latestStrongTimeStamp
{
  if (self->_hasRaw_latestStrongTimeStamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_latestStrongTimeStamp];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)timeStamp
{
  if (self->_hasRaw_timeStamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_timeStamp];
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
  v28[6] = *MEMORY[0x1E4F143B8];
  v3 = [(BMDeviceCellularAvailabilityStatus *)self timeStamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMDeviceCellularAvailabilityStatus *)self timeStamp];
    [v5 timeIntervalSince1970];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceCellularAvailabilityStatus deviceType](self, "deviceType"));
  v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceCellularAvailabilityStatus deviceRegistrationStatus](self, "deviceRegistrationStatus"));
  v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceCellularAvailabilityStatus previousDeviceRegistrationStatus](self, "previousDeviceRegistrationStatus"));
  if ([(BMDeviceCellularAvailabilityStatus *)self hasAboveThreshold])
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceCellularAvailabilityStatus aboveThreshold](self, "aboveThreshold"));
  }
  else
  {
    v10 = 0;
  }
  int v11 = [(BMDeviceCellularAvailabilityStatus *)self latestStrongTimeStamp];
  if (v11)
  {
    char v12 = NSNumber;
    int v13 = [(BMDeviceCellularAvailabilityStatus *)self latestStrongTimeStamp];
    [v13 timeIntervalSince1970];
    int v14 = objc_msgSend(v12, "numberWithDouble:");
  }
  else
  {
    int v14 = 0;
  }

  v26 = (void *)v6;
  v27[0] = @"timeStamp";
  uint64_t v15 = v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v23 = v15;
  v25 = (void *)v7;
  v28[0] = v15;
  v27[1] = @"deviceType";
  int v16 = (void *)v7;
  if (!v7)
  {
    int v16 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v15);
  }
  v28[1] = v16;
  v27[2] = @"deviceRegistrationStatus";
  v17 = v8;
  if (!v8)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[2] = v17;
  v27[3] = @"previousDeviceRegistrationStatus";
  v18 = v9;
  if (!v9)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[3] = v18;
  v27[4] = @"aboveThreshold";
  v19 = v10;
  if (!v10)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[4] = v19;
  v27[5] = @"latestStrongTimeStamp";
  v20 = v14;
  if (!v14)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[5] = v20;
  v21 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v28, v27, 6, v23);
  if (v14)
  {
    if (v10) {
      goto LABEL_24;
    }
  }
  else
  {

    if (v10)
    {
LABEL_24:
      if (v9) {
        goto LABEL_25;
      }
LABEL_35:

      if (v8) {
        goto LABEL_26;
      }
      goto LABEL_36;
    }
  }

  if (!v9) {
    goto LABEL_35;
  }
LABEL_25:
  if (v8) {
    goto LABEL_26;
  }
LABEL_36:

LABEL_26:
  if (!v25) {

  }
  if (!v26) {

  }
  return v21;
}

- (BMDeviceCellularAvailabilityStatus)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v76[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"timeStamp"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v8 = v6;
      id v9 = [v7 alloc];
      [v8 doubleValue];
      double v11 = v10;

      id v12 = (id)[v9 initWithTimeIntervalSince1970:v11];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        v64 = [v13 dateFromString:v6];

        goto LABEL_9;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!p_isa)
        {
          v64 = 0;
          v35 = self;
          goto LABEL_65;
        }
        id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v51 = *MEMORY[0x1E4F502C8];
        uint64_t v75 = *MEMORY[0x1E4F28568];
        v63 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"timeStamp"];
        v76[0] = v63;
        int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:&v75 count:1];
        id v52 = (id)[v50 initWithDomain:v51 code:2 userInfo:v14];
        v64 = 0;
        v53 = p_isa;
        p_isa = 0;
        id *v53 = v52;
        goto LABEL_71;
      }
      id v12 = v6;
    }
    v64 = v12;
  }
  else
  {
    v64 = 0;
  }
LABEL_9:
  int v14 = [v5 objectForKeyedSubscript:@"deviceType"];
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;
LABEL_16:
        v63 = v15;
        goto LABEL_17;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = [NSNumber numberWithInt:BMDeviceCellularAvailabilityStatusDeviceTypeFromString(v14)];
        goto LABEL_16;
      }
      if (p_isa)
      {
        id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v38 = *MEMORY[0x1E4F502C8];
        uint64_t v73 = *MEMORY[0x1E4F28568];
        v62 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"deviceType"];
        v74 = v62;
        int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
        id v39 = (id)[v37 initWithDomain:v38 code:2 userInfo:v16];
        v63 = 0;
        v40 = p_isa;
        p_isa = 0;
        id *v40 = v39;
        goto LABEL_73;
      }
      v63 = 0;
LABEL_71:
      v35 = self;
      goto LABEL_64;
    }
  }
  v63 = 0;
LABEL_17:
  int v16 = [v5 objectForKeyedSubscript:@"deviceRegistrationStatus"];
  v60 = v14;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v16;
LABEL_24:
        v62 = v17;
        goto LABEL_25;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = [NSNumber numberWithInt:BMDeviceCellularAvailabilityStatusStateFromString(v16)];
        goto LABEL_24;
      }
      if (p_isa)
      {
        id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v42 = *MEMORY[0x1E4F502C8];
        uint64_t v71 = *MEMORY[0x1E4F28568];
        v19 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"deviceRegistrationStatus"];
        v72 = v19;
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
        id v43 = (id)[v41 initWithDomain:v42 code:2 userInfo:v18];
        v62 = 0;
        v44 = p_isa;
        p_isa = 0;
        id *v44 = v43;
        goto LABEL_77;
      }
      v62 = 0;
LABEL_73:
      v35 = self;
      goto LABEL_63;
    }
  }
  v62 = 0;
LABEL_25:
  v18 = [v5 objectForKeyedSubscript:@"previousDeviceRegistrationStatus"];
  v59 = v6;
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = v18;
LABEL_32:
        v19 = v20;
        goto LABEL_33;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = [NSNumber numberWithInt:BMDeviceCellularAvailabilityStatusStateFromString(v18)];
        goto LABEL_32;
      }
      if (p_isa)
      {
        id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v46 = *MEMORY[0x1E4F502C8];
        uint64_t v69 = *MEMORY[0x1E4F28568];
        id v22 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"previousDeviceRegistrationStatus"];
        id v70 = v22;
        v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
        id v47 = (id)[v45 initWithDomain:v46 code:2 userInfo:v21];
        v19 = 0;
        v48 = p_isa;
        p_isa = 0;
        id *v48 = v47;
        goto LABEL_67;
      }
      v19 = 0;
LABEL_77:
      v35 = self;
      goto LABEL_62;
    }
  }
  v19 = 0;
LABEL_33:
  v21 = [v5 objectForKeyedSubscript:@"aboveThreshold"];
  if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v22 = 0;
    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (p_isa)
    {
      id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
      v32 = p_isa;
      uint64_t v33 = *MEMORY[0x1E4F502C8];
      uint64_t v67 = *MEMORY[0x1E4F28568];
      v24 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"aboveThreshold"];
      v68 = v24;
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      id v34 = (id)[v31 initWithDomain:v33 code:2 userInfo:v23];
      id v22 = 0;
      p_isa = 0;
      id *v32 = v34;
      goto LABEL_45;
    }
    id v22 = 0;
LABEL_67:
    v35 = self;
    goto LABEL_61;
  }
  id v22 = v21;
LABEL_36:
  uint64_t v23 = [v5 objectForKeyedSubscript:@"latestStrongTimeStamp"];
  if (!v23 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v24 = 0;
LABEL_59:
    v35 = -[BMDeviceCellularAvailabilityStatus initWithTimeStamp:deviceType:deviceRegistrationStatus:previousDeviceRegistrationStatus:aboveThreshold:latestStrongTimeStamp:](self, "initWithTimeStamp:deviceType:deviceRegistrationStatus:previousDeviceRegistrationStatus:aboveThreshold:latestStrongTimeStamp:", v64, [v63 intValue], objc_msgSend(v62, "intValue"), objc_msgSend(v19, "intValue"), v22, v24);
    p_isa = (id *)&v35->super.super.isa;
    goto LABEL_60;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v26 = v23;
    id v27 = [v25 alloc];
    [v26 doubleValue];
    double v29 = v28;

    id v30 = (id)[v27 initWithTimeIntervalSince1970:v29];
LABEL_58:
    v24 = v30;
    goto LABEL_59;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v36 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    v24 = [v36 dateFromString:v23];

    goto LABEL_59;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = v23;
    goto LABEL_58;
  }
  if (p_isa)
  {
    id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v57 = *MEMORY[0x1E4F502C8];
    uint64_t v65 = *MEMORY[0x1E4F28568];
    v54 = p_isa;
    v55 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"latestStrongTimeStamp"];
    v66 = v55;
    v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    id *v54 = (id)[v58 initWithDomain:v57 code:2 userInfo:v56];

    v24 = 0;
    p_isa = 0;
  }
  else
  {
    v24 = 0;
  }
LABEL_45:
  v35 = self;
LABEL_60:

LABEL_61:
  uint64_t v6 = v59;
LABEL_62:

  int v14 = v60;
LABEL_63:

LABEL_64:
LABEL_65:

  return (BMDeviceCellularAvailabilityStatus *)p_isa;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMDeviceCellularAvailabilityStatus *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasRaw_timeStamp) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasAboveThreshold) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasRaw_latestStrongTimeStamp) {
    PBDataWriterWriteDoubleField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)BMDeviceCellularAvailabilityStatus;
  id v5 = [(BMEventBase *)&v55 init];
  if (!v5) {
    goto LABEL_87;
  }
  uint64_t v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
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
      switch((v12 >> 3))
      {
        case 1u:
          v5->_hasRaw_timeStamp = 1;
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
          uint64_t v52 = 24;
          goto LABEL_83;
        case 2u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          while (2)
          {
            uint64_t v26 = *v6;
            uint64_t v27 = *(void *)&v4[v26];
            unint64_t v28 = v27 + 1;
            if (v27 == -1 || v28 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)&v4[*v9] + v27);
              *(void *)&v4[v26] = v28;
              v25 |= (unint64_t)(v29 & 0x7F) << v23;
              if (v29 < 0)
              {
                v23 += 7;
                BOOL v17 = v24++ >= 9;
                if (v17)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v25) = 0;
          }
LABEL_59:
          if (v25 >= 3) {
            LODWORD(v25) = 0;
          }
          uint64_t v51 = 56;
          goto LABEL_74;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v25 = 0;
          while (2)
          {
            uint64_t v32 = *v6;
            uint64_t v33 = *(void *)&v4[v32];
            unint64_t v34 = v33 + 1;
            if (v33 == -1 || v34 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)&v4[*v9] + v33);
              *(void *)&v4[v32] = v34;
              v25 |= (unint64_t)(v35 & 0x7F) << v30;
              if (v35 < 0)
              {
                v30 += 7;
                BOOL v17 = v31++ >= 9;
                if (v17)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v25) = 0;
          }
LABEL_65:
          if (v25 >= 5) {
            LODWORD(v25) = 0;
          }
          uint64_t v51 = 60;
          goto LABEL_74;
        case 4u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v25 = 0;
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
              v25 |= (unint64_t)(v41 & 0x7F) << v36;
              if (v41 < 0)
              {
                v36 += 7;
                BOOL v17 = v37++ >= 9;
                if (v17)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_71;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v25) = 0;
          }
LABEL_71:
          if (v25 >= 5) {
            LODWORD(v25) = 0;
          }
          uint64_t v51 = 64;
LABEL_74:
          *(_DWORD *)((char *)&v5->super.super.isa + v51) = v25;
          continue;
        case 5u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v44 = 0;
          v5->_hasAboveThreshold = 1;
          break;
        case 6u:
          v5->_hasRaw_latestStrongTimeStamp = 1;
          uint64_t v49 = *v6;
          unint64_t v50 = *(void *)&v4[v49];
          if (v50 <= 0xFFFFFFFFFFFFFFF7 && v50 + 8 <= *(void *)&v4[*v7])
          {
            id v22 = *(objc_class **)(*(void *)&v4[*v9] + v50);
            *(void *)&v4[v49] = v50 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v22 = 0;
          }
          uint64_t v52 = 40;
LABEL_83:
          *(Class *)((char *)&v5->super.super.isa + v52) = v22;
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_86;
          }
          continue;
      }
      while (1)
      {
        uint64_t v45 = *v6;
        uint64_t v46 = *(void *)&v4[v45];
        unint64_t v47 = v46 + 1;
        if (v46 == -1 || v47 > *(void *)&v4[*v7]) {
          break;
        }
        char v48 = *(unsigned char *)(*(void *)&v4[*v9] + v46);
        *(void *)&v4[v45] = v47;
        v44 |= (unint64_t)(v48 & 0x7F) << v42;
        if ((v48 & 0x80) == 0) {
          goto LABEL_76;
        }
        v42 += 7;
        BOOL v17 = v43++ >= 9;
        if (v17)
        {
          uint64_t v44 = 0;
          goto LABEL_78;
        }
      }
      v4[*v8] = 1;
LABEL_76:
      if (v4[*v8]) {
        uint64_t v44 = 0;
      }
LABEL_78:
      v5->_aboveThreshold = v44 != 0;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_86:
  }
    v53 = 0;
  else {
LABEL_87:
  }
    v53 = v5;

  return v53;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMDeviceCellularAvailabilityStatus *)self timeStamp];
  id v5 = BMDeviceCellularAvailabilityStatusDeviceTypeAsString([(BMDeviceCellularAvailabilityStatus *)self deviceType]);
  uint64_t v6 = BMDeviceCellularAvailabilityStatusStateAsString([(BMDeviceCellularAvailabilityStatus *)self deviceRegistrationStatus]);
  uint64_t v7 = BMDeviceCellularAvailabilityStatusStateAsString([(BMDeviceCellularAvailabilityStatus *)self previousDeviceRegistrationStatus]);
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceCellularAvailabilityStatus aboveThreshold](self, "aboveThreshold"));
  id v9 = [(BMDeviceCellularAvailabilityStatus *)self latestStrongTimeStamp];
  char v10 = (void *)[v3 initWithFormat:@"BMDeviceCellularAvailabilityStatus with timeStamp: %@, deviceType: %@, deviceRegistrationStatus: %@, previousDeviceRegistrationStatus: %@, aboveThreshold: %@, latestStrongTimeStamp: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMDeviceCellularAvailabilityStatus)initWithTimeStamp:(id)a3 deviceType:(int)a4 deviceRegistrationStatus:(int)a5 previousDeviceRegistrationStatus:(int)a6 aboveThreshold:(id)a7 latestStrongTimeStamp:(id)a8
{
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)BMDeviceCellularAvailabilityStatus;
  BOOL v17 = [(BMEventBase *)&v21 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v14)
    {
      v17->_hasRaw_timeStamp = 1;
      [v14 timeIntervalSince1970];
    }
    else
    {
      v17->_hasRaw_timeStamp = 0;
      double v18 = -1.0;
    }
    v17->_raw_timeStamp = v18;
    v17->_deviceType = a4;
    v17->_deviceRegistrationStatus = a5;
    v17->_previousDeviceRegistrationStatus = a6;
    if (v15)
    {
      v17->_hasAboveThreshold = 1;
      v17->_aboveThreshold = [v15 BOOLValue];
    }
    else
    {
      v17->_hasAboveThreshold = 0;
      v17->_aboveThreshold = 0;
    }
    if (v16)
    {
      v17->_hasRaw_latestStrongTimeStamp = 1;
      [v16 timeIntervalSince1970];
    }
    else
    {
      v17->_hasRaw_latestStrongTimeStamp = 0;
      double v19 = -1.0;
    }
    v17->_raw_latestStrongTimeStamp = v19;
  }

  return v17;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timeStamp" number:1 type:0 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceType" number:2 type:4 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceRegistrationStatus" number:3 type:4 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"previousDeviceRegistrationStatus" number:4 type:4 subMessageClass:0];
  v10[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"aboveThreshold" number:5 type:12 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"latestStrongTimeStamp" number:6 type:0 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6EA0;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timeStamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:2];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceRegistrationStatus" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"previousDeviceRegistrationStatus" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"aboveThreshold" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"latestStrongTimeStamp" dataType:3 requestOnly:0 fieldNumber:6 protoDataType:0 convertedType:2];
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMDeviceCellularAvailabilityStatus alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[13] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end
@interface BMContextSyncCellularAvailabilityStatus
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMContextSyncCellularAvailabilityStatus)initWithID:(id)a3 deviceUUID:(id)a4 timeStamp:(id)a5 deviceType:(int)a6 deviceRegistrationStatus:(int)a7 previousDeviceRegistrationStatus:(int)a8;
- (BMContextSyncCellularAvailabilityStatus)initWithID:(id)a3 deviceUUID:(id)a4 timeStamp:(id)a5 deviceType:(int)a6 deviceRegistrationStatus:(int)a7 previousDeviceRegistrationStatus:(int)a8 aboveThreshold:(id)a9 latestStrongTimeStamp:(id)a10;
- (BMContextSyncCellularAvailabilityStatus)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)aboveThreshold;
- (BOOL)hasAboveThreshold;
- (BOOL)isEqual:(id)a3;
- (NSDate)latestStrongTimeStamp;
- (NSDate)timeStamp;
- (NSString)ID;
- (NSString)description;
- (NSString)deviceUUID;
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

@implementation BMContextSyncCellularAvailabilityStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUUID, 0);

  objc_storeStrong((id *)&self->_ID, 0);
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

- (NSString)deviceUUID
{
  return self->_deviceUUID;
}

- (NSString)ID
{
  return self->_ID;
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
    v6 = [(BMContextSyncCellularAvailabilityStatus *)self ID];
    uint64_t v7 = [v5 ID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMContextSyncCellularAvailabilityStatus *)self ID];
      v10 = [v5 ID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_23;
      }
    }
    v13 = [(BMContextSyncCellularAvailabilityStatus *)self deviceUUID];
    uint64_t v14 = [v5 deviceUUID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMContextSyncCellularAvailabilityStatus *)self deviceUUID];
      v17 = [v5 deviceUUID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_23;
      }
    }
    v19 = [(BMContextSyncCellularAvailabilityStatus *)self timeStamp];
    uint64_t v20 = [v5 timeStamp];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMContextSyncCellularAvailabilityStatus *)self timeStamp];
      v23 = [v5 timeStamp];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_23;
      }
    }
    int v25 = [(BMContextSyncCellularAvailabilityStatus *)self deviceType];
    if (v25 == [v5 deviceType])
    {
      int v26 = [(BMContextSyncCellularAvailabilityStatus *)self deviceRegistrationStatus];
      if (v26 == [v5 deviceRegistrationStatus])
      {
        int v27 = [(BMContextSyncCellularAvailabilityStatus *)self previousDeviceRegistrationStatus];
        if (v27 == [v5 previousDeviceRegistrationStatus])
        {
          if (![(BMContextSyncCellularAvailabilityStatus *)self hasAboveThreshold]
            && ![v5 hasAboveThreshold]
            || [(BMContextSyncCellularAvailabilityStatus *)self hasAboveThreshold]
            && [v5 hasAboveThreshold]
            && (int v28 = [(BMContextSyncCellularAvailabilityStatus *)self aboveThreshold],
                v28 == [v5 aboveThreshold]))
          {
            v30 = [(BMContextSyncCellularAvailabilityStatus *)self latestStrongTimeStamp];
            v31 = [v5 latestStrongTimeStamp];
            if (v30 == v31)
            {
              char v12 = 1;
            }
            else
            {
              v32 = [(BMContextSyncCellularAvailabilityStatus *)self latestStrongTimeStamp];
              v33 = [v5 latestStrongTimeStamp];
              char v12 = [v32 isEqual:v33];
            }
            goto LABEL_24;
          }
        }
      }
    }
LABEL_23:
    char v12 = 0;
LABEL_24:

    goto LABEL_25;
  }
  char v12 = 0;
LABEL_25:

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
  v33[8] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMContextSyncCellularAvailabilityStatus *)self ID];
  uint64_t v4 = [(BMContextSyncCellularAvailabilityStatus *)self deviceUUID];
  id v5 = [(BMContextSyncCellularAvailabilityStatus *)self timeStamp];
  if (v5)
  {
    v6 = NSNumber;
    uint64_t v7 = [(BMContextSyncCellularAvailabilityStatus *)self timeStamp];
    [v7 timeIntervalSince1970];
    v8 = objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    v8 = 0;
  }

  v31 = objc_msgSend(NSNumber, "numberWithInt:", -[BMContextSyncCellularAvailabilityStatus deviceType](self, "deviceType"));
  v30 = objc_msgSend(NSNumber, "numberWithInt:", -[BMContextSyncCellularAvailabilityStatus deviceRegistrationStatus](self, "deviceRegistrationStatus"));
  v29 = objc_msgSend(NSNumber, "numberWithInt:", -[BMContextSyncCellularAvailabilityStatus previousDeviceRegistrationStatus](self, "previousDeviceRegistrationStatus"));
  if ([(BMContextSyncCellularAvailabilityStatus *)self hasAboveThreshold])
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMContextSyncCellularAvailabilityStatus aboveThreshold](self, "aboveThreshold"));
  }
  else
  {
    v9 = 0;
  }
  v10 = [(BMContextSyncCellularAvailabilityStatus *)self latestStrongTimeStamp];
  if (v10)
  {
    int v11 = NSNumber;
    char v12 = [(BMContextSyncCellularAvailabilityStatus *)self latestStrongTimeStamp];
    [v12 timeIntervalSince1970];
    v13 = objc_msgSend(v11, "numberWithDouble:");
  }
  else
  {
    v13 = 0;
  }

  v32[0] = @"ID";
  uint64_t v14 = v3;
  if (!v3)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  int v27 = (void *)v14;
  v33[0] = v14;
  v32[1] = @"deviceUUID";
  uint64_t v15 = v4;
  if (!v4)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  int v26 = (void *)v15;
  v33[1] = v15;
  v32[2] = @"timeStamp";
  uint64_t v16 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  int v25 = (void *)v16;
  v33[2] = v16;
  v32[3] = @"deviceType";
  v17 = v31;
  if (!v31)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  int v28 = (void *)v3;
  v33[3] = v17;
  v32[4] = @"deviceRegistrationStatus";
  int v18 = v30;
  if (!v30)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v4;
  v33[4] = v18;
  v32[5] = @"previousDeviceRegistrationStatus";
  uint64_t v20 = v29;
  if (!v29)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v33[5] = v20;
  v32[6] = @"aboveThreshold";
  v21 = v9;
  if (!v9)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v33[6] = v21;
  v32[7] = @"latestStrongTimeStamp";
  v22 = v13;
  if (!v13)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v33[7] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:8];
  if (v13)
  {
    if (v9) {
      goto LABEL_28;
    }
  }
  else
  {

    if (v9) {
      goto LABEL_28;
    }
  }

LABEL_28:
  if (!v29) {

  }
  if (!v30) {
  if (v31)
  }
  {
    if (v8) {
      goto LABEL_34;
    }
  }
  else
  {

    if (v8)
    {
LABEL_34:
      if (v19) {
        goto LABEL_35;
      }
LABEL_43:

      if (v28) {
        goto LABEL_36;
      }
      goto LABEL_44;
    }
  }

  if (!v19) {
    goto LABEL_43;
  }
LABEL_35:
  if (v28) {
    goto LABEL_36;
  }
LABEL_44:

LABEL_36:

  return v23;
}

- (BMContextSyncCellularAvailabilityStatus)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v106[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v90 = [v5 objectForKeyedSubscript:@"ID"];
  if (!v90 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v90;
LABEL_4:
    uint64_t v7 = [v5 objectForKeyedSubscript:@"deviceUUID"];
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v77 = a4;
      a4 = 0;
LABEL_7:
      v8 = [v5 objectForKeyedSubscript:@"timeStamp"];
      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v15 = (objc_class *)MEMORY[0x1E4F1C9C8];
          id v16 = v8;
          id v17 = [v15 alloc];
          [v16 doubleValue];
          double v19 = v18;

          id v87 = (id)[v17 initWithTimeIntervalSince1970:v19];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v32 = objc_alloc_init(MEMORY[0x1E4F28D48]);
            id v87 = [v32 dateFromString:v8];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v77)
              {
                id v87 = 0;
                int v27 = 0;
                goto LABEL_78;
              }
              id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
              v85 = a4;
              uint64_t v70 = *MEMORY[0x1E4F502C8];
              uint64_t v101 = *MEMORY[0x1E4F28568];
              id v88 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"timeStamp"];
              id v102 = v88;
              uint64_t v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
              uint64_t v72 = v70;
              a4 = v85;
              v83 = (void *)v71;
              id v87 = 0;
              int v27 = 0;
              id *v77 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v72, 2);
              goto LABEL_77;
            }
            id v87 = v8;
          }
        }
      }
      else
      {
        id v87 = 0;
      }
      uint64_t v9 = [v5 objectForKeyedSubscript:@"deviceType"];
      v82 = v8;
      v83 = (void *)v9;
      if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v11 = a4;
          id v88 = v10;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v77)
            {
              id v88 = 0;
              int v27 = 0;
              goto LABEL_77;
            }
            id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v51 = *MEMORY[0x1E4F502C8];
            uint64_t v99 = *MEMORY[0x1E4F28568];
            uint64_t v14 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"deviceType"];
            v100 = v14;
            v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
            id v53 = (id)[v50 initWithDomain:v51 code:2 userInfo:v52];
            id v88 = 0;
            int v27 = 0;
            id *v77 = v53;
LABEL_76:

LABEL_77:
            goto LABEL_78;
          }
          id v88 = [NSNumber numberWithInt:BMContextSyncCellularAvailabilityStatusDeviceTypeFromString(v10)];
          int v11 = a4;
        }
      }
      else
      {
        int v11 = a4;
        id v88 = 0;
      }
      uint64_t v12 = [v5 objectForKeyedSubscript:@"deviceRegistrationStatus"];
      id v86 = v6;
      v80 = v7;
      v81 = (void *)v12;
      if (v12 && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v20 = v13;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v77)
            {
              uint64_t v14 = 0;
              int v27 = 0;
              v52 = v81;
              a4 = v11;
              goto LABEL_76;
            }
            id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
            v55 = v8;
            uint64_t v56 = *MEMORY[0x1E4F502C8];
            uint64_t v97 = *MEMORY[0x1E4F28568];
            uint64_t v57 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"deviceRegistrationStatus"];
            uint64_t v98 = v57;
            v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
            uint64_t v59 = v56;
            v8 = v55;
            v60 = (void *)v57;
            id v61 = (id)[v54 initWithDomain:v59 code:2 userInfo:v58];
            uint64_t v14 = 0;
            int v27 = 0;
            id *v77 = v61;
            a4 = v11;
            goto LABEL_75;
          }
          id v20 = [NSNumber numberWithInt:BMContextSyncCellularAvailabilityStatusStateFromString(v13)];
        }
        uint64_t v14 = v20;
      }
      else
      {
        uint64_t v14 = 0;
      }
      v33 = [v5 objectForKeyedSubscript:@"previousDeviceRegistrationStatus"];
      a4 = v11;
      if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v34 = v33;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v62 = v33;
            v60 = v77;
            if (!v77)
            {
              int v27 = 0;
              v58 = v62;
              goto LABEL_75;
            }
            id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
            v64 = v8;
            uint64_t v65 = *MEMORY[0x1E4F502C8];
            uint64_t v95 = *MEMORY[0x1E4F28568];
            id v84 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"previousDeviceRegistrationStatus"];
            id v96 = v84;
            v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
            uint64_t v66 = v65;
            v8 = v64;
            id v67 = (id)[v63 initWithDomain:v66 code:2 userInfo:v35];
            int v27 = 0;
            id *v77 = v67;
            v60 = 0;
            v58 = v62;
LABEL_74:

LABEL_75:
            id v6 = v86;
            uint64_t v7 = v80;
            v52 = v81;
            goto LABEL_76;
          }
          id v34 = [NSNumber numberWithInt:BMContextSyncCellularAvailabilityStatusStateFromString(v33)];
        }
        v78 = v34;
      }
      else
      {
        v78 = 0;
      }
      v35 = [v5 objectForKeyedSubscript:@"aboveThreshold"];
      v79 = v33;
      if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v77)
          {
            id v84 = 0;
            int v27 = 0;
            v60 = v78;
            v58 = v79;
            goto LABEL_74;
          }
          id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
          v46 = v14;
          uint64_t v47 = *MEMORY[0x1E4F502C8];
          uint64_t v93 = *MEMORY[0x1E4F28568];
          v38 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"aboveThreshold"];
          v94 = v38;
          v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
          uint64_t v48 = v47;
          uint64_t v14 = v46;
          id v84 = 0;
          int v27 = 0;
          id *v77 = (id)[v45 initWithDomain:v48 code:2 userInfo:v36];
          goto LABEL_89;
        }
        id v84 = v35;
      }
      else
      {
        id v84 = 0;
      }
      v36 = [v5 objectForKeyedSubscript:@"latestStrongTimeStamp"];
      if (!v36 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v37 = self;
        v38 = 0;
LABEL_72:
        v60 = v78;
        int v27 = -[BMContextSyncCellularAvailabilityStatus initWithID:deviceUUID:timeStamp:deviceType:deviceRegistrationStatus:previousDeviceRegistrationStatus:aboveThreshold:latestStrongTimeStamp:](v37, "initWithID:deviceUUID:timeStamp:deviceType:deviceRegistrationStatus:previousDeviceRegistrationStatus:aboveThreshold:latestStrongTimeStamp:", v86, v11, v87, [v88 intValue], objc_msgSend(v14, "intValue"), objc_msgSend(v78, "intValue"), v84, v38);
        self = v27;
LABEL_73:

        v8 = v82;
        v58 = v79;
        goto LABEL_74;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v37 = self;
        v39 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v40 = v36;
        id v41 = [v39 alloc];
        [v40 doubleValue];
        double v43 = v42;

        id v44 = (id)[v41 initWithTimeIntervalSince1970:v43];
LABEL_71:
        v38 = v44;
        goto LABEL_72;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v37 = self;
        id v49 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        v38 = [v49 dateFromString:v36];

        goto LABEL_72;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v37 = self;
        id v44 = v36;
        goto LABEL_71;
      }
      if (v77)
      {
        id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v74 = *MEMORY[0x1E4F502C8];
        uint64_t v91 = *MEMORY[0x1E4F28568];
        v75 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"latestStrongTimeStamp"];
        v92 = v75;
        v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
        id *v77 = (id)[v73 initWithDomain:v74 code:2 userInfo:v76];
      }
      v38 = 0;
      int v27 = 0;
LABEL_89:
      v60 = v78;
      goto LABEL_73;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v77 = a4;
      a4 = v7;
      goto LABEL_7;
    }
    if (a4)
    {
      id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
      v29 = a4;
      uint64_t v30 = *MEMORY[0x1E4F502C8];
      uint64_t v103 = *MEMORY[0x1E4F28568];
      id v87 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deviceUUID"];
      id v104 = v87;
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
      id v31 = (id)[v28 initWithDomain:v30 code:2 userInfo:v8];
      a4 = 0;
      int v27 = 0;
      id *v29 = v31;
LABEL_78:

      goto LABEL_79;
    }
    int v27 = 0;
LABEL_79:

    goto LABEL_80;
  }
  if (a4)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
    v22 = a4;
    uint64_t v23 = *MEMORY[0x1E4F502C8];
    uint64_t v105 = *MEMORY[0x1E4F28568];
    int v24 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"ID"];
    v106[0] = v24;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:&v105 count:1];
    uint64_t v25 = v23;
    a4 = v24;
    id v26 = (id)[v21 initWithDomain:v25 code:2 userInfo:v7];
    id v6 = 0;
    int v27 = 0;
    id *v22 = v26;
    goto LABEL_79;
  }
  id v6 = 0;
  int v27 = 0;
LABEL_80:

  return v27;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMContextSyncCellularAvailabilityStatus *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_ID) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceUUID) {
    PBDataWriterWriteStringField();
  }
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
  v58.receiver = self;
  v58.super_class = (Class)BMContextSyncCellularAvailabilityStatus;
  id v5 = [(BMEventBase *)&v58 init];
  if (!v5) {
    goto LABEL_90;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
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
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 72;
          goto LABEL_24;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 80;
LABEL_24:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 3u:
          v5->_hasRaw_timeStamp = 1;
          uint64_t v23 = *v6;
          unint64_t v24 = *(void *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v25 = *(objc_class **)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v25 = 0;
          }
          uint64_t v55 = 24;
          goto LABEL_86;
        case 4u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
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
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                BOOL v17 = v27++ >= 9;
                if (v17)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_62;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v28) = 0;
          }
LABEL_62:
          if (v28 >= 3) {
            LODWORD(v28) = 0;
          }
          uint64_t v54 = 56;
          goto LABEL_77;
        case 5u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v28 = 0;
          while (2)
          {
            uint64_t v35 = *v6;
            uint64_t v36 = *(void *)&v4[v35];
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)&v4[*v9] + v36);
              *(void *)&v4[v35] = v37;
              v28 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                BOOL v17 = v34++ >= 9;
                if (v17)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v28) = 0;
          }
LABEL_68:
          if (v28 >= 5) {
            LODWORD(v28) = 0;
          }
          uint64_t v54 = 60;
          goto LABEL_77;
        case 6u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v28 = 0;
          while (2)
          {
            uint64_t v41 = *v6;
            uint64_t v42 = *(void *)&v4[v41];
            unint64_t v43 = v42 + 1;
            if (v42 == -1 || v43 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v44 = *(unsigned char *)(*(void *)&v4[*v9] + v42);
              *(void *)&v4[v41] = v43;
              v28 |= (unint64_t)(v44 & 0x7F) << v39;
              if (v44 < 0)
              {
                v39 += 7;
                BOOL v17 = v40++ >= 9;
                if (v17)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v28) = 0;
          }
LABEL_74:
          if (v28 >= 5) {
            LODWORD(v28) = 0;
          }
          uint64_t v54 = 64;
LABEL_77:
          *(_DWORD *)((char *)&v5->super.super.isa + v54) = v28;
          continue;
        case 7u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v47 = 0;
          v5->_hasAboveThreshold = 1;
          break;
        case 8u:
          v5->_hasRaw_latestStrongTimeStamp = 1;
          uint64_t v52 = *v6;
          unint64_t v53 = *(void *)&v4[v52];
          if (v53 <= 0xFFFFFFFFFFFFFFF7 && v53 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v25 = *(objc_class **)(*(void *)&v4[*v9] + v53);
            *(void *)&v4[v52] = v53 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v25 = 0;
          }
          uint64_t v55 = 40;
LABEL_86:
          *(Class *)((char *)&v5->super.super.isa + v55) = v25;
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_89;
          }
          continue;
      }
      while (1)
      {
        uint64_t v48 = *v6;
        uint64_t v49 = *(void *)&v4[v48];
        unint64_t v50 = v49 + 1;
        if (v49 == -1 || v50 > *(void *)&v4[*v7]) {
          break;
        }
        char v51 = *(unsigned char *)(*(void *)&v4[*v9] + v49);
        *(void *)&v4[v48] = v50;
        v47 |= (unint64_t)(v51 & 0x7F) << v45;
        if ((v51 & 0x80) == 0) {
          goto LABEL_79;
        }
        v45 += 7;
        BOOL v17 = v46++ >= 9;
        if (v17)
        {
          uint64_t v47 = 0;
          goto LABEL_81;
        }
      }
      v4[*v8] = 1;
LABEL_79:
      if (v4[*v8]) {
        uint64_t v47 = 0;
      }
LABEL_81:
      v5->_aboveThreshold = v47 != 0;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_89:
  }
    uint64_t v56 = 0;
  else {
LABEL_90:
  }
    uint64_t v56 = v5;

  return v56;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMContextSyncCellularAvailabilityStatus *)self ID];
  id v5 = [(BMContextSyncCellularAvailabilityStatus *)self deviceUUID];
  id v6 = [(BMContextSyncCellularAvailabilityStatus *)self timeStamp];
  uint64_t v7 = BMContextSyncCellularAvailabilityStatusDeviceTypeAsString([(BMContextSyncCellularAvailabilityStatus *)self deviceType]);
  v8 = BMContextSyncCellularAvailabilityStatusStateAsString([(BMContextSyncCellularAvailabilityStatus *)self deviceRegistrationStatus]);
  uint64_t v9 = BMContextSyncCellularAvailabilityStatusStateAsString([(BMContextSyncCellularAvailabilityStatus *)self previousDeviceRegistrationStatus]);
  char v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMContextSyncCellularAvailabilityStatus aboveThreshold](self, "aboveThreshold"));
  unsigned int v11 = [(BMContextSyncCellularAvailabilityStatus *)self latestStrongTimeStamp];
  unint64_t v12 = (void *)[v3 initWithFormat:@"BMContextSyncCellularAvailabilityStatus with ID: %@, deviceUUID: %@, timeStamp: %@, deviceType: %@, deviceRegistrationStatus: %@, previousDeviceRegistrationStatus: %@, aboveThreshold: %@, latestStrongTimeStamp: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMContextSyncCellularAvailabilityStatus)initWithID:(id)a3 deviceUUID:(id)a4 timeStamp:(id)a5 deviceType:(int)a6 deviceRegistrationStatus:(int)a7 previousDeviceRegistrationStatus:(int)a8 aboveThreshold:(id)a9 latestStrongTimeStamp:(id)a10
{
  id v25 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a9;
  id v20 = a10;
  v26.receiver = self;
  v26.super_class = (Class)BMContextSyncCellularAvailabilityStatus;
  uint64_t v21 = [(BMEventBase *)&v26 init];
  if (v21)
  {
    v21->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v21->_ID, a3);
    objc_storeStrong((id *)&v21->_deviceUUID, a4);
    if (v18)
    {
      v21->_hasRaw_timeStamp = 1;
      [v18 timeIntervalSince1970];
    }
    else
    {
      v21->_hasRaw_timeStamp = 0;
      double v22 = -1.0;
    }
    v21->_raw_timeStamp = v22;
    v21->_deviceType = a6;
    v21->_deviceRegistrationStatus = a7;
    v21->_previousDeviceRegistrationStatus = a8;
    if (v19)
    {
      v21->_hasAboveThreshold = 1;
      v21->_aboveThreshold = [v19 BOOLValue];
    }
    else
    {
      v21->_hasAboveThreshold = 0;
      v21->_aboveThreshold = 0;
    }
    if (v20)
    {
      v21->_hasRaw_latestStrongTimeStamp = 1;
      [v20 timeIntervalSince1970];
    }
    else
    {
      v21->_hasRaw_latestStrongTimeStamp = 0;
      double v23 = -1.0;
    }
    v21->_raw_latestStrongTimeStamp = v23;
  }

  return v21;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ID" number:1 type:13 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceUUID" number:2 type:13 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timeStamp" number:3 type:0 subMessageClass:0];
  v12[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceType" number:4 type:4 subMessageClass:0];
  v12[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceRegistrationStatus" number:5 type:4 subMessageClass:0];
  v12[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"previousDeviceRegistrationStatus" number:6 type:4 subMessageClass:0];
  v12[5] = v7;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"aboveThreshold" number:7 type:12 subMessageClass:0];
  v12[6] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"latestStrongTimeStamp" number:8 type:0 subMessageClass:0];
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3588;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"ID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceUUID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timeStamp" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceType" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceRegistrationStatus" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"previousDeviceRegistrationStatus" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"aboveThreshold" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"latestStrongTimeStamp" dataType:3 requestOnly:0 fieldNumber:8 protoDataType:0 convertedType:2];
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
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

    v8 = [[BMContextSyncCellularAvailabilityStatus alloc] initByReadFrom:v7];
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

- (BMContextSyncCellularAvailabilityStatus)initWithID:(id)a3 deviceUUID:(id)a4 timeStamp:(id)a5 deviceType:(int)a6 deviceRegistrationStatus:(int)a7 previousDeviceRegistrationStatus:(int)a8
{
  return [(BMContextSyncCellularAvailabilityStatus *)self initWithID:a3 deviceUUID:a4 timeStamp:a5 deviceType:*(void *)&a6 deviceRegistrationStatus:*(void *)&a7 previousDeviceRegistrationStatus:*(void *)&a8 aboveThreshold:0 latestStrongTimeStamp:0];
}

@end
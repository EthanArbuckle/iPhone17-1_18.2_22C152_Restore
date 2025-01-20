@interface BMSiriOnDeviceDigestSegmentsCohortsEventMetadata
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriOnDeviceDigestSegmentsCohortsEventMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriOnDeviceDigestSegmentsCohortsEventMetadata)initWithOddIdUUID:(id)a3 deviceAggregationId:(id)a4 userAggregationId:(id)a5 eventTimestampInMSSince1970:(id)a6 timeInterval:(id)a7;
- (BMSiriOnDeviceDigestSegmentsCohortsEventMetadata)initWithOddIdUUID:(id)a3 deviceAggregationId:(id)a4 userAggregationId:(id)a5 eventTimestampInMSSince1970:(id)a6 timeInterval:(id)a7 userAggregationIdRotationTimestampInMs:(id)a8 userAggregationIdExpirationTimestampInMs:(id)a9;
- (BMSiriOnDeviceDigestSegmentsCohortsTimeInterval)timeInterval;
- (BOOL)hasEventTimestampInMSSince1970;
- (BOOL)hasUserAggregationIdExpirationTimestampInMs;
- (BOOL)hasUserAggregationIdRotationTimestampInMs;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)deviceAggregationId;
- (NSString)oddIdUUID;
- (NSString)userAggregationId;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unint64_t)eventTimestampInMSSince1970;
- (unint64_t)userAggregationIdExpirationTimestampInMs;
- (unint64_t)userAggregationIdRotationTimestampInMs;
- (unsigned)dataVersion;
- (void)setHasEventTimestampInMSSince1970:(BOOL)a3;
- (void)setHasUserAggregationIdExpirationTimestampInMs:(BOOL)a3;
- (void)setHasUserAggregationIdRotationTimestampInMs:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriOnDeviceDigestSegmentsCohortsEventMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeInterval, 0);
  objc_storeStrong((id *)&self->_userAggregationId, 0);
  objc_storeStrong((id *)&self->_deviceAggregationId, 0);

  objc_storeStrong((id *)&self->_oddIdUUID, 0);
}

- (void)setHasUserAggregationIdExpirationTimestampInMs:(BOOL)a3
{
  self->_hasUserAggregationIdExpirationTimestampInMs = a3;
}

- (BOOL)hasUserAggregationIdExpirationTimestampInMs
{
  return self->_hasUserAggregationIdExpirationTimestampInMs;
}

- (unint64_t)userAggregationIdExpirationTimestampInMs
{
  return self->_userAggregationIdExpirationTimestampInMs;
}

- (void)setHasUserAggregationIdRotationTimestampInMs:(BOOL)a3
{
  self->_hasUserAggregationIdRotationTimestampInMs = a3;
}

- (BOOL)hasUserAggregationIdRotationTimestampInMs
{
  return self->_hasUserAggregationIdRotationTimestampInMs;
}

- (unint64_t)userAggregationIdRotationTimestampInMs
{
  return self->_userAggregationIdRotationTimestampInMs;
}

- (BMSiriOnDeviceDigestSegmentsCohortsTimeInterval)timeInterval
{
  return self->_timeInterval;
}

- (void)setHasEventTimestampInMSSince1970:(BOOL)a3
{
  self->_hasEventTimestampInMSSince1970 = a3;
}

- (BOOL)hasEventTimestampInMSSince1970
{
  return self->_hasEventTimestampInMSSince1970;
}

- (unint64_t)eventTimestampInMSSince1970
{
  return self->_eventTimestampInMSSince1970;
}

- (NSString)userAggregationId
{
  return self->_userAggregationId;
}

- (NSString)deviceAggregationId
{
  return self->_deviceAggregationId;
}

- (NSString)oddIdUUID
{
  return self->_oddIdUUID;
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
    v6 = [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self oddIdUUID];
    uint64_t v7 = [v5 oddIdUUID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self oddIdUUID];
      v10 = [v5 oddIdUUID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_34;
      }
    }
    v13 = [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self deviceAggregationId];
    uint64_t v14 = [v5 deviceAggregationId];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self deviceAggregationId];
      v17 = [v5 deviceAggregationId];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_34;
      }
    }
    v19 = [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self userAggregationId];
    uint64_t v20 = [v5 userAggregationId];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self userAggregationId];
      v23 = [v5 userAggregationId];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_34;
      }
    }
    if (-[BMSiriOnDeviceDigestSegmentsCohortsEventMetadata hasEventTimestampInMSSince1970](self, "hasEventTimestampInMSSince1970")|| [v5 hasEventTimestampInMSSince1970])
    {
      if (![(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self hasEventTimestampInMSSince1970])goto LABEL_34; {
      if (![v5 hasEventTimestampInMSSince1970])
      }
        goto LABEL_34;
      unint64_t v25 = [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self eventTimestampInMSSince1970];
      if (v25 != [v5 eventTimestampInMSSince1970]) {
        goto LABEL_34;
      }
    }
    v26 = [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self timeInterval];
    uint64_t v27 = [v5 timeInterval];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      v29 = [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self timeInterval];
      v30 = [v5 timeInterval];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_34;
      }
    }
    if (!-[BMSiriOnDeviceDigestSegmentsCohortsEventMetadata hasUserAggregationIdRotationTimestampInMs](self, "hasUserAggregationIdRotationTimestampInMs")&& ![v5 hasUserAggregationIdRotationTimestampInMs]|| -[BMSiriOnDeviceDigestSegmentsCohortsEventMetadata hasUserAggregationIdRotationTimestampInMs](self, "hasUserAggregationIdRotationTimestampInMs")&& objc_msgSend(v5, "hasUserAggregationIdRotationTimestampInMs")&& (unint64_t v32 = -[BMSiriOnDeviceDigestSegmentsCohortsEventMetadata userAggregationIdRotationTimestampInMs](self, "userAggregationIdRotationTimestampInMs"), v32 == objc_msgSend(v5, "userAggregationIdRotationTimestampInMs")))
    {
      if (!-[BMSiriOnDeviceDigestSegmentsCohortsEventMetadata hasUserAggregationIdExpirationTimestampInMs](self, "hasUserAggregationIdExpirationTimestampInMs")&& ![v5 hasUserAggregationIdExpirationTimestampInMs])
      {
        BOOL v12 = 1;
        goto LABEL_35;
      }
      if (-[BMSiriOnDeviceDigestSegmentsCohortsEventMetadata hasUserAggregationIdExpirationTimestampInMs](self, "hasUserAggregationIdExpirationTimestampInMs")&& [v5 hasUserAggregationIdExpirationTimestampInMs])
      {
        unint64_t v33 = [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self userAggregationIdExpirationTimestampInMs];
        BOOL v12 = v33 == [v5 userAggregationIdExpirationTimestampInMs];
LABEL_35:

        goto LABEL_36;
      }
    }
LABEL_34:
    BOOL v12 = 0;
    goto LABEL_35;
  }
  BOOL v12 = 0;
LABEL_36:

  return v12;
}

- (id)jsonDictionary
{
  v25[7] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self oddIdUUID];
  uint64_t v4 = [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self deviceAggregationId];
  id v5 = [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self userAggregationId];
  if ([(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self hasEventTimestampInMSSince1970])
  {
    v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMSiriOnDeviceDigestSegmentsCohortsEventMetadata eventTimestampInMSSince1970](self, "eventTimestampInMSSince1970"));
  }
  else
  {
    v23 = 0;
  }
  v6 = [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self timeInterval];
  uint64_t v7 = [v6 jsonDictionary];

  if ([(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self hasUserAggregationIdRotationTimestampInMs])
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMSiriOnDeviceDigestSegmentsCohortsEventMetadata userAggregationIdRotationTimestampInMs](self, "userAggregationIdRotationTimestampInMs"));
  }
  else
  {
    v8 = 0;
  }
  if ([(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self hasUserAggregationIdExpirationTimestampInMs])
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMSiriOnDeviceDigestSegmentsCohortsEventMetadata userAggregationIdExpirationTimestampInMs](self, "userAggregationIdExpirationTimestampInMs"));
  }
  else
  {
    v9 = 0;
  }
  v24[0] = @"oddIdUUID";
  uint64_t v10 = v3;
  if (!v3)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v20 = (void *)v10;
  v25[0] = v10;
  v24[1] = @"deviceAggregationId";
  uint64_t v11 = v4;
  if (!v4)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v11;
  v25[1] = v11;
  v24[2] = @"userAggregationId";
  BOOL v12 = v5;
  if (!v5)
  {
    BOOL v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v3;
  v25[2] = v12;
  v24[3] = @"eventTimestampInMSSince1970";
  v13 = v23;
  if (!v23)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v4;
  v25[3] = v13;
  v24[4] = @"timeInterval";
  uint64_t v14 = v7;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v14;
  v24[5] = @"userAggregationIdRotationTimestampInMs";
  v15 = v8;
  if (!v8)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[5] = v15;
  v24[6] = @"userAggregationIdExpirationTimestampInMs";
  v16 = v9;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[6] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:7];
  if (v9)
  {
    if (v8) {
      goto LABEL_26;
    }
  }
  else
  {

    if (v8) {
      goto LABEL_26;
    }
  }

LABEL_26:
  if (!v7) {

  }
  if (!v23) {
  if (v5)
  }
  {
    if (v21) {
      goto LABEL_32;
    }
LABEL_39:

    if (v22) {
      goto LABEL_33;
    }
    goto LABEL_40;
  }

  if (!v21) {
    goto LABEL_39;
  }
LABEL_32:
  if (v22) {
    goto LABEL_33;
  }
LABEL_40:

LABEL_33:

  return v17;
}

- (BMSiriOnDeviceDigestSegmentsCohortsEventMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v81[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"oddIdUUID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"deviceAggregationId"];
    v63 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          v19 = 0;
          goto LABEL_29;
        }
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v30 = v8;
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v78 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deviceAggregationId"];
        id v79 = v12;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
        uint64_t v11 = v32 = a4;
        uint64_t v33 = v31;
        id v8 = v30;
        id v34 = (id)[v29 initWithDomain:v33 code:2 userInfo:v11];
        v19 = 0;
        id v10 = 0;
        *unint64_t v32 = v34;
        goto LABEL_28;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v11 = [v6 objectForKeyedSubscript:@"userAggregationId"];
    v61 = v7;
    id v65 = v10;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v63)
        {
          id v12 = 0;
          v19 = 0;
          goto LABEL_28;
        }
        id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v36 = v8;
        uint64_t v37 = *MEMORY[0x1E4F502C8];
        uint64_t v76 = *MEMORY[0x1E4F28568];
        id v66 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"userAggregationId"];
        id v77 = v66;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
        v38 = v35;
        id v10 = v65;
        uint64_t v39 = v37;
        id v8 = v36;
        v19 = 0;
        id v12 = 0;
        id *v63 = (id)[v38 initWithDomain:v39 code:2 userInfo:v13];
LABEL_27:

        uint64_t v7 = v61;
LABEL_28:

        goto LABEL_29;
      }
      id v12 = v11;
    }
    else
    {
      id v12 = 0;
    }
    v13 = [v6 objectForKeyedSubscript:@"eventTimestampInMSSince1970"];
    id v62 = v12;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v63)
        {
          id v66 = 0;
          v19 = 0;
          goto LABEL_27;
        }
        id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v41 = v8;
        uint64_t v42 = *MEMORY[0x1E4F502C8];
        uint64_t v74 = *MEMORY[0x1E4F28568];
        id v20 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"eventTimestampInMSSince1970"];
        id v75 = v20;
        uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
        v44 = v40;
        id v10 = v65;
        uint64_t v45 = v42;
        id v8 = v41;
        v60 = (BMSiriOnDeviceDigestSegmentsCohortsTimeInterval *)v43;
        v19 = 0;
        id v66 = 0;
        id *v63 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v45, 2);
        goto LABEL_25;
      }
      id v66 = v13;
    }
    else
    {
      id v66 = 0;
    }
    uint64_t v14 = [v6 objectForKeyedSubscript:@"timeInterval"];
    v64 = self;
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v63)
        {
          v19 = 0;
          goto LABEL_26;
        }
        id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v59 = v8;
        uint64_t v47 = *MEMORY[0x1E4F502C8];
        uint64_t v72 = *MEMORY[0x1E4F28568];
        v60 = (BMSiriOnDeviceDigestSegmentsCohortsTimeInterval *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"timeInterval"];
        v73 = v60;
        v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
        v49 = v46;
        id v10 = v65;
        uint64_t v50 = v47;
        id v8 = v59;
        id *v63 = (id)[v49 initWithDomain:v50 code:2 userInfo:v48];

        v19 = 0;
        id v20 = v14;
LABEL_25:

        uint64_t v14 = v20;
LABEL_26:

        id v12 = v62;
        goto LABEL_27;
      }
      id v20 = v14;
      id v67 = 0;
      v60 = [[BMSiriOnDeviceDigestSegmentsCohortsTimeInterval alloc] initWithJSONDictionary:v20 error:&v67];
      id v22 = v67;
      if (v22)
      {
        v23 = v22;
        if (v63) {
          id *v63 = v22;
        }

        v19 = 0;
        id v10 = v65;
        goto LABEL_25;
      }
    }
    else
    {
      v60 = 0;
    }
    v15 = [v6 objectForKeyedSubscript:@"userAggregationIdRotationTimestampInMs"];
    id v58 = v8;
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v63)
        {
          v19 = 0;
          id v16 = 0;
          goto LABEL_24;
        }
        id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v52 = *MEMORY[0x1E4F502C8];
        uint64_t v70 = *MEMORY[0x1E4F28568];
        id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"userAggregationIdRotationTimestampInMs"];
        id v71 = v18;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
        id v53 = (id)[v51 initWithDomain:v52 code:2 userInfo:v17];
        v19 = 0;
        id v16 = 0;
        id *v63 = v53;
        goto LABEL_23;
      }
      id v16 = v15;
    }
    else
    {
      id v16 = 0;
    }
    v17 = [v6 objectForKeyedSubscript:@"userAggregationIdExpirationTimestampInMs"];
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v63)
        {
          id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v56 = *MEMORY[0x1E4F502C8];
          uint64_t v68 = *MEMORY[0x1E4F28568];
          v54 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"userAggregationIdExpirationTimestampInMs"];
          v69 = v54;
          v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
          id *v63 = (id)[v57 initWithDomain:v56 code:2 userInfo:v55];
        }
        id v18 = 0;
        v19 = 0;
        goto LABEL_23;
      }
      id v18 = v17;
    }
    else
    {
      id v18 = 0;
    }
    v19 = [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)v64 initWithOddIdUUID:v58 deviceAggregationId:v65 userAggregationId:v62 eventTimestampInMSSince1970:v66 timeInterval:v60 userAggregationIdRotationTimestampInMs:v16 userAggregationIdExpirationTimestampInMs:v18];
    v64 = v19;
LABEL_23:

    id v10 = v65;
LABEL_24:

    id v20 = v14;
    self = v64;
    id v8 = v58;
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
    v19 = 0;
    id v8 = 0;
    goto LABEL_30;
  }
  id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v25 = *MEMORY[0x1E4F502C8];
  uint64_t v80 = *MEMORY[0x1E4F28568];
  uint64_t v26 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"oddIdUUID"];
  v81[0] = v26;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:&v80 count:1];
  uint64_t v27 = v24;
  id v10 = (id)v26;
  id v28 = (id)[v27 initWithDomain:v25 code:2 userInfo:v9];
  v19 = 0;
  id v8 = 0;
  *a4 = v28;
LABEL_29:

LABEL_30:
  return v19;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_oddIdUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceAggregationId) {
    PBDataWriterWriteStringField();
  }
  if (self->_userAggregationId) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasEventTimestampInMSSince1970) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_timeInterval)
  {
    PBDataWriterPlaceMark();
    [(BMSiriOnDeviceDigestSegmentsCohortsTimeInterval *)self->_timeInterval writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasUserAggregationIdRotationTimestampInMs) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_hasUserAggregationIdExpirationTimestampInMs) {
    PBDataWriterWriteUint64Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BMSiriOnDeviceDigestSegmentsCohortsEventMetadata;
  id v5 = [(BMEventBase *)&v43 init];
  if (!v5) {
    goto LABEL_66;
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
        unint64_t v14 = *(void *)&v4[v13];
        if (v14 == -1 || v14 >= *(void *)&v4[*v7]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v16 = v11++ >= 9;
        if (v16)
        {
          unint64_t v12 = 0;
          int v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v17 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v17 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 24;
          goto LABEL_25;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 32;
          goto LABEL_25;
        case 3u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
LABEL_25:
          v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 4u:
          char v22 = 0;
          unsigned int v23 = 0;
          unint64_t v24 = 0;
          v5->_hasEventTimestampInMSSince1970 = 1;
          while (2)
          {
            uint64_t v25 = *v6;
            unint64_t v26 = *(void *)&v4[v25];
            if (v26 == -1 || v26 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
              *(void *)&v4[v25] = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                BOOL v16 = v23++ >= 9;
                if (v16)
                {
                  unint64_t v24 = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            unint64_t v24 = 0;
          }
LABEL_53:
          uint64_t v40 = 48;
          goto LABEL_62;
        case 5u:
          uint64_t v44 = 0;
          uint64_t v45 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_65;
          }
          id v28 = [[BMSiriOnDeviceDigestSegmentsCohortsTimeInterval alloc] initByReadFrom:v4];
          if (!v28) {
            goto LABEL_65;
          }
          timeInterval = v5->_timeInterval;
          v5->_timeInterval = v28;

          PBReaderRecallMark();
          continue;
        case 6u:
          char v30 = 0;
          unsigned int v31 = 0;
          unint64_t v24 = 0;
          v5->_hasUserAggregationIdRotationTimestampInMs = 1;
          while (2)
          {
            uint64_t v32 = *v6;
            unint64_t v33 = *(void *)&v4[v32];
            if (v33 == -1 || v33 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)&v4[*v9] + v33);
              *(void *)&v4[v32] = v33 + 1;
              v24 |= (unint64_t)(v34 & 0x7F) << v30;
              if (v34 < 0)
              {
                v30 += 7;
                BOOL v16 = v31++ >= 9;
                if (v16)
                {
                  unint64_t v24 = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            unint64_t v24 = 0;
          }
LABEL_57:
          uint64_t v40 = 64;
          goto LABEL_62;
        case 7u:
          char v35 = 0;
          unsigned int v36 = 0;
          unint64_t v24 = 0;
          v5->_hasUserAggregationIdExpirationTimestampInMs = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_65;
          }
          continue;
      }
      while (1)
      {
        uint64_t v37 = *v6;
        unint64_t v38 = *(void *)&v4[v37];
        if (v38 == -1 || v38 >= *(void *)&v4[*v7]) {
          break;
        }
        char v39 = *(unsigned char *)(*(void *)&v4[*v9] + v38);
        *(void *)&v4[v37] = v38 + 1;
        v24 |= (unint64_t)(v39 & 0x7F) << v35;
        if ((v39 & 0x80) == 0) {
          goto LABEL_59;
        }
        v35 += 7;
        BOOL v16 = v36++ >= 9;
        if (v16)
        {
          unint64_t v24 = 0;
          goto LABEL_61;
        }
      }
      v4[*v8] = 1;
LABEL_59:
      if (v4[*v8]) {
        unint64_t v24 = 0;
      }
LABEL_61:
      uint64_t v40 = 72;
LABEL_62:
      *(Class *)((char *)&v5->super.super.isa + v40) = (Class)v24;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_65:
  }
    id v41 = 0;
  else {
LABEL_66:
  }
    id v41 = v5;

  return v41;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self oddIdUUID];
  id v5 = [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self deviceAggregationId];
  id v6 = [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self userAggregationId];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMSiriOnDeviceDigestSegmentsCohortsEventMetadata eventTimestampInMSSince1970](self, "eventTimestampInMSSince1970"));
  id v8 = [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self timeInterval];
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMSiriOnDeviceDigestSegmentsCohortsEventMetadata userAggregationIdRotationTimestampInMs](self, "userAggregationIdRotationTimestampInMs"));
  char v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMSiriOnDeviceDigestSegmentsCohortsEventMetadata userAggregationIdExpirationTimestampInMs](self, "userAggregationIdExpirationTimestampInMs"));
  unsigned int v11 = (void *)[v3 initWithFormat:@"BMSiriOnDeviceDigestSegmentsCohortsEventMetadata with oddIdUUID: %@, deviceAggregationId: %@, userAggregationId: %@, eventTimestampInMSSince1970: %@, timeInterval: %@, userAggregationIdRotationTimestampInMs: %@, userAggregationIdExpirationTimestampInMs: %@", v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BMSiriOnDeviceDigestSegmentsCohortsEventMetadata)initWithOddIdUUID:(id)a3 deviceAggregationId:(id)a4 userAggregationId:(id)a5 eventTimestampInMSSince1970:(id)a6 timeInterval:(id)a7 userAggregationIdRotationTimestampInMs:(id)a8 userAggregationIdExpirationTimestampInMs:(id)a9
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v28.receiver = self;
  v28.super_class = (Class)BMSiriOnDeviceDigestSegmentsCohortsEventMetadata;
  uint64_t v20 = [(BMEventBase *)&v28 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v20->_oddIdUUID, a3);
    objc_storeStrong((id *)&v20->_deviceAggregationId, a4);
    objc_storeStrong((id *)&v20->_userAggregationId, a5);
    if (v16)
    {
      v20->_hasEventTimestampInMSSince1970 = 1;
      uint64_t v21 = [v16 unsignedLongLongValue];
    }
    else
    {
      uint64_t v21 = 0;
      v20->_hasEventTimestampInMSSince1970 = 0;
    }
    v20->_eventTimestampInMSSince1970 = v21;
    objc_storeStrong((id *)&v20->_timeInterval, a7);
    if (v18)
    {
      v20->_hasUserAggregationIdRotationTimestampInMs = 1;
      uint64_t v22 = [v18 unsignedLongLongValue];
    }
    else
    {
      uint64_t v22 = 0;
      v20->_hasUserAggregationIdRotationTimestampInMs = 0;
    }
    v20->_userAggregationIdRotationTimestampInMs = v22;
    if (v19)
    {
      v20->_hasUserAggregationIdExpirationTimestampInMs = 1;
      uint64_t v23 = [v19 unsignedLongLongValue];
    }
    else
    {
      uint64_t v23 = 0;
      v20->_hasUserAggregationIdExpirationTimestampInMs = 0;
    }
    v20->_userAggregationIdExpirationTimestampInMs = v23;
  }

  return v20;
}

+ (id)protoFields
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"oddIdUUID" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"deviceAggregationId", 2, 13, 0, v2);
  v11[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userAggregationId" number:3 type:13 subMessageClass:0];
  v11[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventTimestampInMSSince1970" number:4 type:5 subMessageClass:0];
  v11[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timeInterval" number:5 type:14 subMessageClass:objc_opt_class()];
  v11[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userAggregationIdRotationTimestampInMs" number:6 type:5 subMessageClass:0];
  v11[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userAggregationIdExpirationTimestampInMs" number:7 type:5 subMessageClass:0];
  v11[6] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4C08;
}

+ (id)columns
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"oddIdUUID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceAggregationId" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userAggregationId" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventTimestampInMSSince1970" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:5 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"timeInterval_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_36105];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userAggregationIdRotationTimestampInMs" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:5 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userAggregationIdExpirationTimestampInMs" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:5 convertedType:0];
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

id __59__BMSiriOnDeviceDigestSegmentsCohortsEventMetadata_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 timeInterval];
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSiriOnDeviceDigestSegmentsCohortsEventMetadata alloc] initByReadFrom:v7];
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

- (BMSiriOnDeviceDigestSegmentsCohortsEventMetadata)initWithOddIdUUID:(id)a3 deviceAggregationId:(id)a4 userAggregationId:(id)a5 eventTimestampInMSSince1970:(id)a6 timeInterval:(id)a7
{
  return [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self initWithOddIdUUID:a3 deviceAggregationId:a4 userAggregationId:a5 eventTimestampInMSSince1970:a6 timeInterval:a7 userAggregationIdRotationTimestampInMs:0 userAggregationIdExpirationTimestampInMs:0];
}

@end
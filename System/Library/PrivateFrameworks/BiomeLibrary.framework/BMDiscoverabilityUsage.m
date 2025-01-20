@interface BMDiscoverabilityUsage
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDiscoverabilityUsage)initWithContentIdentifier:(id)a3 bundleID:(id)a4 contentType:(int)a5 context:(id)a6 eligibleContext:(id)a7 ineligibleReason:(int)a8 osBuild:(id)a9 state:(int)a10 analyticsEvent:(id)a11;
- (BMDiscoverabilityUsage)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSData)analyticsEvent;
- (NSData)eligibleContext;
- (NSString)bundleID;
- (NSString)contentIdentifier;
- (NSString)context;
- (NSString)description;
- (NSString)osBuild;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)contentType;
- (int)ineligibleReason;
- (int)state;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMDiscoverabilityUsage

+ (id)columns
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentIdentifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentType" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"context" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eligibleContext" dataType:4 requestOnly:0 fieldNumber:5 protoDataType:14 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"ineligibleReason" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"osBuild" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"state" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:4 convertedType:0];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"analyticsEvent" dataType:4 requestOnly:0 fieldNumber:9 protoDataType:14 convertedType:0];
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEvent, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_eligibleContext, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_contentIdentifier, 0);
}

- (NSData)analyticsEvent
{
  return self->_analyticsEvent;
}

- (int)state
{
  return self->_state;
}

- (NSString)osBuild
{
  return self->_osBuild;
}

- (int)ineligibleReason
{
  return self->_ineligibleReason;
}

- (NSData)eligibleContext
{
  return self->_eligibleContext;
}

- (NSString)context
{
  return self->_context;
}

- (int)contentType
{
  return self->_contentType;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
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
    v6 = [(BMDiscoverabilityUsage *)self contentIdentifier];
    uint64_t v7 = [v5 contentIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMDiscoverabilityUsage *)self contentIdentifier];
      v10 = [v5 contentIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_28;
      }
    }
    v13 = [(BMDiscoverabilityUsage *)self bundleID];
    uint64_t v14 = [v5 bundleID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMDiscoverabilityUsage *)self bundleID];
      v17 = [v5 bundleID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_28;
      }
    }
    int v19 = [(BMDiscoverabilityUsage *)self contentType];
    if (v19 == [v5 contentType])
    {
      v20 = [(BMDiscoverabilityUsage *)self context];
      uint64_t v21 = [v5 context];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMDiscoverabilityUsage *)self context];
        v24 = [v5 context];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_28;
        }
      }
      v26 = [(BMDiscoverabilityUsage *)self eligibleContext];
      uint64_t v27 = [v5 eligibleContext];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        v29 = [(BMDiscoverabilityUsage *)self eligibleContext];
        v30 = [v5 eligibleContext];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_28;
        }
      }
      int v32 = [(BMDiscoverabilityUsage *)self ineligibleReason];
      if (v32 == [v5 ineligibleReason])
      {
        v33 = [(BMDiscoverabilityUsage *)self osBuild];
        uint64_t v34 = [v5 osBuild];
        if (v33 == (void *)v34)
        {
        }
        else
        {
          v35 = (void *)v34;
          v36 = [(BMDiscoverabilityUsage *)self osBuild];
          v37 = [v5 osBuild];
          int v38 = [v36 isEqual:v37];

          if (!v38) {
            goto LABEL_28;
          }
        }
        int v39 = [(BMDiscoverabilityUsage *)self state];
        if (v39 == [v5 state])
        {
          v40 = [(BMDiscoverabilityUsage *)self analyticsEvent];
          v41 = [v5 analyticsEvent];
          if (v40 == v41)
          {
            char v12 = 1;
          }
          else
          {
            v42 = [(BMDiscoverabilityUsage *)self analyticsEvent];
            v43 = [v5 analyticsEvent];
            char v12 = [v42 isEqual:v43];
          }
          goto LABEL_29;
        }
      }
    }
LABEL_28:
    char v12 = 0;
LABEL_29:

    goto LABEL_30;
  }
  char v12 = 0;
LABEL_30:

  return v12;
}

- (id)jsonDictionary
{
  v34[9] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMDiscoverabilityUsage *)self contentIdentifier];
  uint64_t v4 = [(BMDiscoverabilityUsage *)self bundleID];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDiscoverabilityUsage contentType](self, "contentType"));
  v6 = [(BMDiscoverabilityUsage *)self context];
  uint64_t v7 = [(BMDiscoverabilityUsage *)self eligibleContext];
  uint64_t v8 = [v7 base64EncodedStringWithOptions:0];

  int v32 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDiscoverabilityUsage ineligibleReason](self, "ineligibleReason"));
  v9 = [(BMDiscoverabilityUsage *)self osBuild];
  v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDiscoverabilityUsage state](self, "state"));
  int v11 = [(BMDiscoverabilityUsage *)self analyticsEvent];
  char v12 = [v11 base64EncodedStringWithOptions:0];

  v33[0] = @"contentIdentifier";
  uint64_t v13 = v3;
  if (!v3)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v27 = (void *)v13;
  v34[0] = v13;
  v33[1] = @"bundleID";
  uint64_t v14 = v4;
  if (!v4)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v14;
  v34[1] = v14;
  v33[2] = @"contentType";
  uint64_t v15 = v5;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  int v31 = (void *)v3;
  int v25 = (void *)v15;
  v34[2] = v15;
  v33[3] = @"context";
  uint64_t v16 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)v4;
  v24 = (void *)v16;
  v34[3] = v16;
  v33[4] = @"eligibleContext";
  v17 = (void *)v8;
  if (!v8)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v5;
  v34[4] = v17;
  v33[5] = @"ineligibleReason";
  int v18 = v32;
  if (!v32)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[5] = v18;
  v33[6] = @"osBuild";
  int v19 = v9;
  if (!v9)
  {
    int v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v8;
  v34[6] = v19;
  v33[7] = @"state";
  uint64_t v21 = v10;
  if (!v10)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[7] = v21;
  v33[8] = @"analyticsEvent";
  v22 = v12;
  if (!v12)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[8] = v22;
  id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:9];
  if (v12)
  {
    if (v10) {
      goto LABEL_21;
    }
LABEL_35:

    if (v9) {
      goto LABEL_22;
    }
    goto LABEL_36;
  }

  if (!v10) {
    goto LABEL_35;
  }
LABEL_21:
  if (v9) {
    goto LABEL_22;
  }
LABEL_36:

LABEL_22:
  if (!v32) {

  }
  if (!v20) {
  if (!v6)
  }

  if (v29)
  {
    if (v30) {
      goto LABEL_30;
    }
LABEL_38:

    if (v31) {
      goto LABEL_31;
    }
    goto LABEL_39;
  }

  if (!v30) {
    goto LABEL_38;
  }
LABEL_30:
  if (v31) {
    goto LABEL_31;
  }
LABEL_39:

LABEL_31:

  return v28;
}

- (BMDiscoverabilityUsage)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v102[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"contentIdentifier"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"bundleID"];
    v77 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v15 = 0;
          goto LABEL_72;
        }
        id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v21 = v9;
        uint64_t v22 = *MEMORY[0x1E4F502C8];
        uint64_t v99 = *MEMORY[0x1E4F28568];
        v84 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleID"];
        v100 = v84;
        uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
        uint64_t v24 = v22;
        v9 = v21;
        v83 = (void *)v23;
        id v25 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v24, 2);
        uint64_t v15 = 0;
        v26 = a4;
        a4 = 0;
        id *v26 = v25;
        goto LABEL_71;
      }
      id v81 = v9;
    }
    else
    {
      id v81 = 0;
    }
    uint64_t v10 = [v6 objectForKeyedSubscript:@"contentType"];
    v83 = (void *)v10;
    if (v10 && (int v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v77)
          {
            v84 = 0;
            a4 = 0;
            uint64_t v15 = v81;
            goto LABEL_71;
          }
          id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
          v71 = v9;
          uint64_t v56 = *MEMORY[0x1E4F502C8];
          uint64_t v97 = *MEMORY[0x1E4F28568];
          id v31 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"contentType"];
          id v98 = v31;
          uint64_t v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
          v58 = v55;
          uint64_t v27 = (void *)v57;
          uint64_t v59 = v56;
          v9 = v71;
          v84 = 0;
          a4 = 0;
          id *v77 = (id)[v58 initWithDomain:v59 code:2 userInfo:v57];
          goto LABEL_82;
        }
        id v12 = [NSNumber numberWithInt:BMDiscoverabilityUsageContentTypeFromString(v11)];
      }
      v84 = v12;
    }
    else
    {
      v84 = 0;
    }
    uint64_t v27 = [v6 objectForKeyedSubscript:@"context"];
    v76 = v7;
    if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v28 = v6;
      id v29 = v8;
      v30 = self;
      id v31 = 0;
LABEL_26:
      uint64_t v32 = [v28 objectForKeyedSubscript:@"eligibleContext"];
      v72 = v27;
      v73 = (void *)v32;
      id v79 = v31;
      if (v32 && (v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          a4 = v77;
          if (!v77)
          {
            id v82 = 0;
            uint64_t v15 = v81;
            int v38 = v73;
            self = v30;
            id v8 = v29;
            id v6 = v28;
            uint64_t v7 = v76;
            goto LABEL_69;
          }
          v40 = v9;
          id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v42 = *MEMORY[0x1E4F502C8];
          uint64_t v93 = *MEMORY[0x1E4F28568];
          v78 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"eligibleContext"];
          v94 = v78;
          uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
          v43 = v41;
          v9 = v40;
          id v31 = v79;
          id v82 = 0;
          a4 = 0;
          id *v77 = (id)[v43 initWithDomain:v42 code:2 userInfo:v34];
          uint64_t v15 = v81;
          self = v30;
          id v8 = v29;
          id v6 = v28;
          uint64_t v7 = v76;
          goto LABEL_68;
        }
        id v82 = v33;
      }
      else
      {
        id v82 = 0;
      }
      uint64_t v34 = [v28 objectForKeyedSubscript:@"ineligibleReason"];
      self = v30;
      v75 = v29;
      v70 = v9;
      if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v35 = v34;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v77)
            {
              v78 = 0;
              a4 = 0;
              uint64_t v15 = v81;
              id v6 = v28;
              id v8 = v75;
              uint64_t v7 = v76;
              goto LABEL_68;
            }
            id v62 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v63 = *MEMORY[0x1E4F502C8];
            uint64_t v91 = *MEMORY[0x1E4F28568];
            id v74 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"ineligibleReason"];
            id v92 = v74;
            v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
            v78 = 0;
            a4 = 0;
            id *v77 = (id)[v62 initWithDomain:v63 code:2 userInfo:v44];
            v9 = v70;
            uint64_t v15 = v81;
            id v6 = v28;
            uint64_t v7 = v76;
LABEL_67:

            id v8 = v75;
LABEL_68:

            uint64_t v27 = v72;
            int v38 = v73;
            goto LABEL_69;
          }
          id v35 = [NSNumber numberWithInt:BMDiscoverabilityUsageIneligibleReasonFromString(v34)];
        }
        v78 = v35;
      }
      else
      {
        v78 = 0;
      }
      v44 = [v28 objectForKeyedSubscript:@"osBuild"];
      if (v44 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        id v6 = v28;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v7 = v76;
          if (!v77)
          {
            id v74 = 0;
            a4 = 0;
            uint64_t v15 = v81;
            goto LABEL_67;
          }
          v46 = v30;
          id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v50 = *MEMORY[0x1E4F502C8];
          uint64_t v89 = *MEMORY[0x1E4F28568];
          v47 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"osBuild"];
          v90 = v47;
          v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
          id v51 = (id)[v49 initWithDomain:v50 code:2 userInfo:v45];
          id v74 = 0;
          a4 = 0;
          id *v77 = v51;
          goto LABEL_93;
        }
        id v74 = v44;
      }
      else
      {
        id v74 = 0;
        id v6 = v28;
      }
      v45 = [v6 objectForKeyedSubscript:@"state"];
      if (!v45 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v46 = self;
        v47 = 0;
        goto LABEL_61;
      }
      v46 = self;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v48 = v45;
LABEL_60:
        v47 = v48;
LABEL_61:
        v52 = [v6 objectForKeyedSubscript:@"analyticsEvent"];
        if (v52 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v15 = v81;
            a4 = v77;
            if (v77)
            {
              id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v68 = *MEMORY[0x1E4F502C8];
              uint64_t v85 = *MEMORY[0x1E4F28568];
              v60 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"analyticsEvent"];
              v86 = v60;
              v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
              id *v77 = (id)[v69 initWithDomain:v68 code:2 userInfo:v61];

              id v53 = 0;
              a4 = 0;
            }
            else
            {
              id v53 = 0;
            }
            goto LABEL_65;
          }
          id v53 = v52;
        }
        else
        {
          id v53 = 0;
        }
        [v84 intValue];
        [v78 intValue];
        LODWORD(v67) = [v47 intValue];
        uint64_t v15 = v81;
        a4 = -[BMDiscoverabilityUsage initWithContentIdentifier:bundleID:contentType:context:eligibleContext:ineligibleReason:osBuild:state:analyticsEvent:](v46, "initWithContentIdentifier:bundleID:contentType:context:eligibleContext:ineligibleReason:osBuild:state:analyticsEvent:", v75, v74, v67, v53);
        v46 = (BMDiscoverabilityUsage *)a4;
LABEL_65:

LABEL_66:
        self = v46;
        uint64_t v7 = v76;
        v9 = v70;
        id v31 = v79;
        goto LABEL_67;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v48 = [NSNumber numberWithInt:BMDiscoverabilityUsageStateFromString(v45)];
        goto LABEL_60;
      }
      if (v77)
      {
        id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v65 = *MEMORY[0x1E4F502C8];
        uint64_t v87 = *MEMORY[0x1E4F28568];
        id v53 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"state"];
        id v88 = v53;
        v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
        id v66 = (id)[v64 initWithDomain:v65 code:2 userInfo:v52];
        v47 = 0;
        a4 = 0;
        id *v77 = v66;
        uint64_t v15 = v81;
        goto LABEL_65;
      }
      v47 = 0;
      a4 = 0;
LABEL_93:
      uint64_t v15 = v81;
      goto LABEL_66;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v28 = v6;
      id v29 = v8;
      v30 = self;
      id v31 = v27;
      goto LABEL_26;
    }
    a4 = v77;
    if (v77)
    {
      id v80 = objc_alloc(MEMORY[0x1E4F28C58]);
      v36 = v9;
      uint64_t v37 = *MEMORY[0x1E4F502C8];
      uint64_t v95 = *MEMORY[0x1E4F28568];
      id v82 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"context"];
      id v96 = v82;
      int v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
      uint64_t v39 = v37;
      v9 = v36;
      id v31 = 0;
      a4 = 0;
      id *v77 = (id)[v80 initWithDomain:v39 code:2 userInfo:v38];
      uint64_t v15 = v81;
LABEL_69:

LABEL_70:
LABEL_71:

      goto LABEL_72;
    }
    id v31 = 0;
LABEL_82:
    uint64_t v15 = v81;
    goto LABEL_70;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (a4)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v14 = *MEMORY[0x1E4F502C8];
    uint64_t v101 = *MEMORY[0x1E4F28568];
    uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contentIdentifier"];
    v102[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:&v101 count:1];
    uint64_t v17 = v14;
    v9 = (void *)v16;
    id v18 = (id)[v13 initWithDomain:v17 code:2 userInfo:v16];
    id v8 = 0;
    int v19 = a4;
    a4 = 0;
    *int v19 = v18;
LABEL_72:

    goto LABEL_73;
  }
  id v8 = 0;
LABEL_73:

  return (BMDiscoverabilityUsage *)a4;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMDiscoverabilityUsage *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_contentIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_context) {
    PBDataWriterWriteStringField();
  }
  if (self->_eligibleContext) {
    PBDataWriterWriteDataField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_osBuild) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_analyticsEvent) {
    PBDataWriterWriteDataField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMDiscoverabilityUsage;
  uint64_t v5 = [(BMEventBase *)&v41 init];
  if (!v5) {
    goto LABEL_72;
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
          uint64_t v20 = 32;
          goto LABEL_49;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
          goto LABEL_49;
        case 3u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          while (2)
          {
            uint64_t v24 = *v6;
            unint64_t v25 = *(void *)&v4[v24];
            if (v25 == -1 || v25 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
              *(void *)&v4[v24] = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                BOOL v16 = v22++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_53:
          if (v23 >= 5) {
            LODWORD(v23) = 0;
          }
          uint64_t v38 = 20;
          goto LABEL_68;
        case 4u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 48;
          goto LABEL_49;
        case 5u:
          uint64_t v19 = PBReaderReadData();
          uint64_t v20 = 56;
          goto LABEL_49;
        case 6u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v23 = 0;
          while (2)
          {
            uint64_t v29 = *v6;
            unint64_t v30 = *(void *)&v4[v29];
            if (v30 == -1 || v30 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
              *(void *)&v4[v29] = v30 + 1;
              v23 |= (unint64_t)(v31 & 0x7F) << v27;
              if (v31 < 0)
              {
                v27 += 7;
                BOOL v16 = v28++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_59:
          if (v23 >= 0x19) {
            LODWORD(v23) = 0;
          }
          uint64_t v38 = 24;
          goto LABEL_68;
        case 7u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 64;
          goto LABEL_49;
        case 8u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v23 = 0;
          break;
        case 9u:
          uint64_t v19 = PBReaderReadData();
          uint64_t v20 = 72;
LABEL_49:
          uint64_t v37 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_71;
          }
          continue;
      }
      while (1)
      {
        uint64_t v34 = *v6;
        unint64_t v35 = *(void *)&v4[v34];
        if (v35 == -1 || v35 >= *(void *)&v4[*v7]) {
          break;
        }
        char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v35);
        *(void *)&v4[v34] = v35 + 1;
        v23 |= (unint64_t)(v36 & 0x7F) << v32;
        if ((v36 & 0x80) == 0) {
          goto LABEL_63;
        }
        v32 += 7;
        BOOL v16 = v33++ >= 9;
        if (v16)
        {
          LODWORD(v23) = 0;
          goto LABEL_65;
        }
      }
      v4[*v8] = 1;
LABEL_63:
      if (v4[*v8]) {
        LODWORD(v23) = 0;
      }
LABEL_65:
      if (v23 >= 0xA) {
        LODWORD(v23) = 0;
      }
      uint64_t v38 = 28;
LABEL_68:
      *(_DWORD *)((char *)&v5->super.super.isa + v38) = v23;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_71:
  }
    uint64_t v39 = 0;
  else {
LABEL_72:
  }
    uint64_t v39 = v5;

  return v39;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMDiscoverabilityUsage *)self contentIdentifier];
  uint64_t v5 = [(BMDiscoverabilityUsage *)self bundleID];
  id v6 = BMDiscoverabilityUsageContentTypeAsString([(BMDiscoverabilityUsage *)self contentType]);
  uint64_t v7 = [(BMDiscoverabilityUsage *)self context];
  id v8 = [(BMDiscoverabilityUsage *)self eligibleContext];
  v9 = BMDiscoverabilityUsageIneligibleReasonAsString([(BMDiscoverabilityUsage *)self ineligibleReason]);
  char v10 = [(BMDiscoverabilityUsage *)self osBuild];
  unsigned int v11 = BMDiscoverabilityUsageStateAsString([(BMDiscoverabilityUsage *)self state]);
  unint64_t v12 = [(BMDiscoverabilityUsage *)self analyticsEvent];
  uint64_t v13 = (void *)[v3 initWithFormat:@"BMDiscoverabilityUsage with contentIdentifier: %@, bundleID: %@, contentType: %@, context: %@, eligibleContext: %@, ineligibleReason: %@, osBuild: %@, state: %@, analyticsEvent: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (BMDiscoverabilityUsage)initWithContentIdentifier:(id)a3 bundleID:(id)a4 contentType:(int)a5 context:(id)a6 eligibleContext:(id)a7 ineligibleReason:(int)a8 osBuild:(id)a9 state:(int)a10 analyticsEvent:(id)a11
{
  id v16 = a3;
  id v25 = a4;
  id v24 = a6;
  id v23 = a7;
  id v17 = a9;
  id v18 = a11;
  v26.receiver = self;
  v26.super_class = (Class)BMDiscoverabilityUsage;
  uint64_t v19 = [(BMEventBase *)&v26 init];
  if (v19)
  {
    v19->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v19->_contentIdentifier, a3);
    objc_storeStrong((id *)&v19->_bundleID, a4);
    v19->_contentType = a5;
    objc_storeStrong((id *)&v19->_context, a6);
    objc_storeStrong((id *)&v19->_eligibleContext, a7);
    v19->_ineligibleReason = a8;
    objc_storeStrong((id *)&v19->_osBuild, a9);
    v19->_state = a10;
    objc_storeStrong((id *)&v19->_analyticsEvent, a11);
  }

  return v19;
}

+ (id)protoFields
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentIdentifier" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"bundleID", 2, 13, 0, v2);
  v13[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentType" number:3 type:4 subMessageClass:0];
  v13[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"context" number:4 type:13 subMessageClass:0];
  v13[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eligibleContext" number:5 type:14 subMessageClass:0];
  v13[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ineligibleReason" number:6 type:4 subMessageClass:0];
  v13[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"osBuild" number:7 type:13 subMessageClass:0];
  v13[6] = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"state" number:8 type:4 subMessageClass:0];
  v13[7] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"analyticsEvent" number:9 type:14 subMessageClass:0];
  v13[8] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6078;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMDiscoverabilityUsage alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[4] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end
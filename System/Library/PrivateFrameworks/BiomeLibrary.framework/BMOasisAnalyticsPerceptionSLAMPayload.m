@interface BMOasisAnalyticsPerceptionSLAMPayload
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMOasisAnalyticsContextSnapshotEvent)contextSnapshot;
- (BMOasisAnalyticsPerceptionSLAMPayload)initWithContextSnapshot:(id)a3 trackingInitialized:(id)a4 trackingRecovered:(id)a5 trackingState:(id)a6 trackingLost:(id)a7 submapLoaded:(id)a8 submapCreated:(id)a9 submapUpdated:(id)a10 relocalizationSucceeded:(id)a11;
- (BMOasisAnalyticsPerceptionSLAMPayload)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMOasisAnalyticsRelocalizationSucceededEvent)relocalizationSucceeded;
- (BMOasisAnalyticsSubmapCreatedEvent)submapCreated;
- (BMOasisAnalyticsSubmapLoadedEvent)submapLoaded;
- (BMOasisAnalyticsSubmapUpdatedEvent)submapUpdated;
- (BMOasisAnalyticsTrackingInitializedEvent)trackingInitialized;
- (BMOasisAnalyticsTrackingLostEvent)trackingLost;
- (BMOasisAnalyticsTrackingRecoveredEvent)trackingRecovered;
- (BMOasisAnalyticsTrackingStateEvent)trackingState;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMOasisAnalyticsPerceptionSLAMPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relocalizationSucceeded, 0);
  objc_storeStrong((id *)&self->_submapUpdated, 0);
  objc_storeStrong((id *)&self->_submapCreated, 0);
  objc_storeStrong((id *)&self->_submapLoaded, 0);
  objc_storeStrong((id *)&self->_trackingLost, 0);
  objc_storeStrong((id *)&self->_trackingState, 0);
  objc_storeStrong((id *)&self->_trackingRecovered, 0);
  objc_storeStrong((id *)&self->_trackingInitialized, 0);

  objc_storeStrong((id *)&self->_contextSnapshot, 0);
}

- (BMOasisAnalyticsRelocalizationSucceededEvent)relocalizationSucceeded
{
  return self->_relocalizationSucceeded;
}

- (BMOasisAnalyticsSubmapUpdatedEvent)submapUpdated
{
  return self->_submapUpdated;
}

- (BMOasisAnalyticsSubmapCreatedEvent)submapCreated
{
  return self->_submapCreated;
}

- (BMOasisAnalyticsSubmapLoadedEvent)submapLoaded
{
  return self->_submapLoaded;
}

- (BMOasisAnalyticsTrackingLostEvent)trackingLost
{
  return self->_trackingLost;
}

- (BMOasisAnalyticsTrackingStateEvent)trackingState
{
  return self->_trackingState;
}

- (BMOasisAnalyticsTrackingRecoveredEvent)trackingRecovered
{
  return self->_trackingRecovered;
}

- (BMOasisAnalyticsTrackingInitializedEvent)trackingInitialized
{
  return self->_trackingInitialized;
}

- (BMOasisAnalyticsContextSnapshotEvent)contextSnapshot
{
  return self->_contextSnapshot;
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
    v6 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self contextSnapshot];
    uint64_t v7 = [v5 contextSnapshot];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self contextSnapshot];
      v10 = [v5 contextSnapshot];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_33;
      }
    }
    v13 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self trackingInitialized];
    uint64_t v14 = [v5 trackingInitialized];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self trackingInitialized];
      v17 = [v5 trackingInitialized];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_33;
      }
    }
    v19 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self trackingRecovered];
    uint64_t v20 = [v5 trackingRecovered];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self trackingRecovered];
      v23 = [v5 trackingRecovered];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_33;
      }
    }
    v25 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self trackingState];
    uint64_t v26 = [v5 trackingState];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self trackingState];
      v29 = [v5 trackingState];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_33;
      }
    }
    v31 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self trackingLost];
    uint64_t v32 = [v5 trackingLost];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self trackingLost];
      v35 = [v5 trackingLost];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_33;
      }
    }
    v37 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self submapLoaded];
    uint64_t v38 = [v5 submapLoaded];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self submapLoaded];
      v41 = [v5 submapLoaded];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_33;
      }
    }
    v43 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self submapCreated];
    uint64_t v44 = [v5 submapCreated];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self submapCreated];
      v47 = [v5 submapCreated];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_33;
      }
    }
    v49 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self submapUpdated];
    uint64_t v50 = [v5 submapUpdated];
    if (v49 == (void *)v50)
    {
    }
    else
    {
      v51 = (void *)v50;
      v52 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self submapUpdated];
      v53 = [v5 submapUpdated];
      int v54 = [v52 isEqual:v53];

      if (!v54)
      {
LABEL_33:
        char v12 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    v56 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self relocalizationSucceeded];
    v57 = [v5 relocalizationSucceeded];
    if (v56 == v57)
    {
      char v12 = 1;
    }
    else
    {
      v58 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self relocalizationSucceeded];
      v59 = [v5 relocalizationSucceeded];
      char v12 = [v58 isEqual:v59];
    }
    goto LABEL_34;
  }
  char v12 = 0;
LABEL_35:

  return v12;
}

- (id)jsonDictionary
{
  v41[9] = *MEMORY[0x1E4F143B8];
  v3 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self contextSnapshot];
  uint64_t v4 = [v3 jsonDictionary];

  id v5 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self trackingInitialized];
  uint64_t v6 = [v5 jsonDictionary];

  uint64_t v7 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self trackingRecovered];
  uint64_t v8 = [v7 jsonDictionary];

  v9 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self trackingState];
  v10 = [v9 jsonDictionary];

  int v11 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self trackingLost];
  uint64_t v12 = [v11 jsonDictionary];

  v13 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self submapLoaded];
  v39 = [v13 jsonDictionary];

  uint64_t v14 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self submapCreated];
  v15 = [v14 jsonDictionary];

  v16 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self submapUpdated];
  v17 = [v16 jsonDictionary];

  int v18 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self relocalizationSucceeded];
  v19 = [v18 jsonDictionary];

  v40[0] = @"contextSnapshot";
  uint64_t v20 = v4;
  if (!v4)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v20;
  v41[0] = v20;
  v40[1] = @"trackingInitialized";
  uint64_t v21 = v6;
  if (!v6)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v21;
  v41[1] = v21;
  v40[2] = @"trackingRecovered";
  uint64_t v22 = v8;
  if (!v8)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v38 = (void *)v4;
  uint64_t v32 = (void *)v22;
  v41[2] = v22;
  v40[3] = @"trackingState";
  uint64_t v23 = (uint64_t)v10;
  if (!v10)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v6;
  v31 = (void *)v23;
  v41[3] = v23;
  v40[4] = @"trackingLost";
  int v24 = (void *)v12;
  if (!v12)
  {
    int v24 = [MEMORY[0x1E4F1CA98] null];
  }
  int v36 = (void *)v8;
  v41[4] = v24;
  v40[5] = @"submapLoaded";
  v25 = v39;
  if (!v39)
  {
    v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v41[5] = v25;
  v40[6] = @"submapCreated";
  uint64_t v26 = v15;
  if (!v15)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v12;
  v41[6] = v26;
  v40[7] = @"submapUpdated";
  v28 = v17;
  if (!v17)
  {
    v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v41[7] = v28;
  v40[8] = @"relocalizationSucceeded";
  v29 = v19;
  if (!v19)
  {
    v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v41[8] = v29;
  id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:9];
  if (v19)
  {
    if (v17) {
      goto LABEL_21;
    }
LABEL_35:

    if (v15) {
      goto LABEL_22;
    }
    goto LABEL_36;
  }

  if (!v17) {
    goto LABEL_35;
  }
LABEL_21:
  if (v15) {
    goto LABEL_22;
  }
LABEL_36:

LABEL_22:
  if (!v39) {

  }
  if (!v27) {
  if (!v10)
  }

  if (v36)
  {
    if (v37) {
      goto LABEL_30;
    }
LABEL_38:

    if (v38) {
      goto LABEL_31;
    }
    goto LABEL_39;
  }

  if (!v37) {
    goto LABEL_38;
  }
LABEL_30:
  if (v38) {
    goto LABEL_31;
  }
LABEL_39:

LABEL_31:

  return v35;
}

- (BMOasisAnalyticsPerceptionSLAMPayload)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v137[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"contextSnapshot"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    id v119 = 0;
    uint64_t v8 = [[BMOasisAnalyticsContextSnapshotEvent alloc] initWithJSONDictionary:v9 error:&v119];
    id v24 = v119;
    if (v24)
    {
      v25 = v24;
      if (a4) {
        *a4 = v24;
      }

LABEL_53:
      uint64_t v23 = 0;
      goto LABEL_118;
    }

LABEL_4:
    id v9 = [v6 objectForKeyedSubscript:@"trackingInitialized"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v110 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      id v118 = 0;
      v110 = [[BMOasisAnalyticsTrackingInitializedEvent alloc] initWithJSONDictionary:v10 error:&v118];
      id v26 = v118;
      if (v26)
      {
        v27 = v26;
        if (a4) {
          *a4 = v26;
        }

        uint64_t v23 = 0;
        goto LABEL_117;
      }

LABEL_7:
      id v10 = [v6 objectForKeyedSubscript:@"trackingRecovered"];
      v108 = v8;
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            uint64_t v23 = 0;
LABEL_116:
            uint64_t v8 = v108;
            goto LABEL_117;
          }
          v105 = self;
          id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v46 = *MEMORY[0x1E4F502C8];
          uint64_t v132 = *MEMORY[0x1E4F28568];
          v47 = a4;
          uint64_t v22 = (BMOasisAnalyticsTrackingRecoveredEvent *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"trackingRecovered"];
          v133 = v22;
          id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v133 forKeys:&v132 count:1];
          int v48 = v45;
          self = v105;
          uint64_t v23 = 0;
          id *v47 = (id)[v48 initWithDomain:v46 code:2 userInfo:v11];
LABEL_115:

          goto LABEL_116;
        }
        id v11 = v10;
        id v117 = 0;
        v107 = [[BMOasisAnalyticsTrackingRecoveredEvent alloc] initWithJSONDictionary:v11 error:&v117];
        id v28 = v117;
        if (v28)
        {
          v29 = v28;
          if (a4) {
            *a4 = v28;
          }

          uint64_t v23 = 0;
LABEL_99:
          uint64_t v22 = v107;
          goto LABEL_115;
        }
      }
      else
      {
        v107 = 0;
      }
      id v11 = [v6 objectForKeyedSubscript:@"trackingState"];
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v106 = 0;
        goto LABEL_13;
      }
      v104 = self;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        id v116 = 0;
        v106 = [[BMOasisAnalyticsTrackingStateEvent alloc] initWithJSONDictionary:v12 error:&v116];
        id v35 = v116;
        if (!v35)
        {

LABEL_13:
          id v12 = [v6 objectForKeyedSubscript:@"trackingLost"];
          id v101 = v12;
          if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v97 = v10;
            id v13 = v11;
            v103 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v41 = v12;
            id v115 = 0;
            v103 = [[BMOasisAnalyticsTrackingLostEvent alloc] initWithJSONDictionary:v41 error:&v115];
            id v42 = v115;
            if (v42)
            {
              v43 = v42;
              uint64_t v44 = v41;
              if (a4) {
                *a4 = v42;
              }

              uint64_t v23 = 0;
              uint64_t v22 = v107;
              id v12 = v101;
              goto LABEL_113;
            }
            id v97 = v10;
            id v13 = v11;

            id v12 = v101;
LABEL_16:
            uint64_t v14 = [v6 objectForKeyedSubscript:@"submapLoaded"];
            if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v92 = v14;
              v99 = 0;
LABEL_19:
              id v11 = v13;
              uint64_t v15 = [v6 objectForKeyedSubscript:@"submapCreated"];
              id v10 = v97;
              v95 = (void *)v15;
              if (v15 && (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                v89 = a4;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!a4)
                  {
                    uint64_t v23 = 0;
                    uint64_t v22 = v107;
                    id v12 = v101;
                    uint64_t v44 = v92;
                    goto LABEL_112;
                  }
                  id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v91 = *MEMORY[0x1E4F502C8];
                  uint64_t v124 = *MEMORY[0x1E4F28568];
                  v71 = self;
                  id v72 = [NSString alloc];
                  uint64_t v84 = objc_opt_class();
                  v73 = v72;
                  self = v71;
                  v93 = (BMOasisAnalyticsSubmapCreatedEvent *)[v73 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v84, @"submapCreated"];
                  v125 = v93;
                  uint64_t v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v125 forKeys:&v124 count:1];
                  uint64_t v75 = v91;
                  v90 = (void *)v74;
                  id v76 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v75, 2);
                  uint64_t v23 = 0;
                  *a4 = v76;
                  uint64_t v22 = v107;
                  id v12 = v101;
                  goto LABEL_126;
                }
                id v55 = v16;
                id v113 = 0;
                v93 = [[BMOasisAnalyticsSubmapCreatedEvent alloc] initWithJSONDictionary:v55 error:&v113];
                id v56 = v113;
                if (v56)
                {
                  v57 = v56;
                  v90 = v55;
                  uint64_t v44 = v92;
                  if (v89) {
                    id *v89 = v56;
                  }

                  uint64_t v23 = 0;
                  uint64_t v22 = v107;
                  goto LABEL_110;
                }

                id v12 = v101;
              }
              else
              {
                v93 = 0;
              }
              uint64_t v17 = [v6 objectForKeyedSubscript:@"submapUpdated"];
              v90 = (void *)v17;
              if (!v17 || (int v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v19 = self;
                v88 = 0;
LABEL_25:
                id v20 = [v6 objectForKeyedSubscript:@"relocalizationSucceeded"];
                if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  uint64_t v21 = 0;
LABEL_28:
                  uint64_t v22 = v107;
                  uint64_t v23 = [(BMOasisAnalyticsPerceptionSLAMPayload *)v19 initWithContextSnapshot:v108 trackingInitialized:v110 trackingRecovered:v107 trackingState:v106 trackingLost:v103 submapLoaded:v99 submapCreated:v93 submapUpdated:v88 relocalizationSucceeded:v21];
                  v19 = v23;
LABEL_107:

LABEL_108:
                  uint64_t v44 = v92;
LABEL_109:

                  self = v19;
LABEL_110:
                  id v12 = v101;
LABEL_111:

                  goto LABEL_112;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v111 = 0;
                  id v86 = v20;
                  uint64_t v21 = [[BMOasisAnalyticsRelocalizationSucceededEvent alloc] initWithJSONDictionary:v86 error:&v111];
                  id v68 = v111;
                  if (!v68)
                  {

                    goto LABEL_28;
                  }
                  v69 = v68;
                  if (a4) {
                    *a4 = v68;
                  }

LABEL_106:
                  uint64_t v23 = 0;
                  uint64_t v22 = v107;
                  goto LABEL_107;
                }
                if (a4)
                {
                  id v87 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v85 = *MEMORY[0x1E4F502C8];
                  uint64_t v120 = *MEMORY[0x1E4F28568];
                  uint64_t v21 = (BMOasisAnalyticsRelocalizationSucceededEvent *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"relocalizationSucceeded"];
                  v121 = v21;
                  v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v121 forKeys:&v120 count:1];
                  *a4 = (id)[v87 initWithDomain:v85 code:2 userInfo:v80];

                  goto LABEL_106;
                }
                uint64_t v23 = 0;
LABEL_129:
                uint64_t v22 = v107;
                goto LABEL_108;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v19 = self;
                id v20 = v18;
                id v112 = 0;
                v88 = [[BMOasisAnalyticsSubmapUpdatedEvent alloc] initWithJSONDictionary:v20 error:&v112];
                id v61 = v112;
                if (v61)
                {
                  v62 = v61;
                  uint64_t v44 = v92;
                  if (a4) {
                    *a4 = v61;
                  }

                  uint64_t v23 = 0;
                  uint64_t v22 = v107;
                  goto LABEL_109;
                }

                goto LABEL_25;
              }
              if (a4)
              {
                v19 = self;
                id v77 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v78 = *MEMORY[0x1E4F502C8];
                uint64_t v122 = *MEMORY[0x1E4F28568];
                v88 = (BMOasisAnalyticsSubmapUpdatedEvent *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"submapUpdated"];
                v123 = v88;
                id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v123 forKeys:&v122 count:1];
                id v79 = (id)[v77 initWithDomain:v78 code:2 userInfo:v20];
                uint64_t v23 = 0;
                *a4 = v79;
                goto LABEL_129;
              }
              uint64_t v23 = 0;
              uint64_t v22 = v107;
LABEL_126:
              uint64_t v44 = v92;
              goto LABEL_111;
            }
            v49 = a4;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v92 = v14;
              id v50 = v14;
              id v114 = 0;
              v99 = [[BMOasisAnalyticsSubmapLoadedEvent alloc] initWithJSONDictionary:v50 error:&v114];
              id v51 = v114;
              if (!v51)
              {

                a4 = v49;
                id v12 = v101;
                goto LABEL_19;
              }
              v52 = v51;
              v95 = v50;
              id v11 = v13;
              if (v49) {
                id *v49 = v51;
              }

              uint64_t v23 = 0;
              uint64_t v22 = v107;
              id v12 = v101;
              uint64_t v44 = v92;
            }
            else
            {
              if (!a4)
              {
                uint64_t v23 = 0;
                uint64_t v22 = v107;
                id v12 = v101;
                uint64_t v44 = v14;
                id v11 = v13;
                id v10 = v97;
                goto LABEL_113;
              }
              id v96 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v94 = *MEMORY[0x1E4F502C8];
              uint64_t v126 = *MEMORY[0x1E4F28568];
              v63 = self;
              id v64 = [NSString alloc];
              uint64_t v83 = objc_opt_class();
              v65 = v64;
              self = v63;
              uint64_t v44 = v14;
              v99 = (BMOasisAnalyticsSubmapLoadedEvent *)[v65 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v83, @"submapLoaded"];
              v127 = v99;
              uint64_t v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v127 forKeys:&v126 count:1];
              v67 = v96;
              v95 = (void *)v66;
              uint64_t v23 = 0;
              *a4 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v94, 2);
              uint64_t v22 = v107;
              id v12 = v101;
              id v11 = v13;
            }
            id v10 = v97;
LABEL_112:

            goto LABEL_113;
          }
          if (a4)
          {
            id v100 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v98 = *MEMORY[0x1E4F502C8];
            uint64_t v128 = *MEMORY[0x1E4F28568];
            v58 = self;
            id v59 = [NSString alloc];
            uint64_t v82 = objc_opt_class();
            v60 = v59;
            self = v58;
            v103 = (BMOasisAnalyticsTrackingLostEvent *)[v60 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v82, @"trackingLost"];
            v129 = v103;
            uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v129 forKeys:&v128 count:1];
            uint64_t v23 = 0;
            *a4 = (id)[v100 initWithDomain:v98 code:2 userInfo:v44];
            uint64_t v22 = v107;
LABEL_113:

            goto LABEL_114;
          }
          uint64_t v23 = 0;
LABEL_69:
          uint64_t v22 = v107;
LABEL_114:

          goto LABEL_115;
        }
        int v36 = v35;
        if (a4) {
          *a4 = v35;
        }

        uint64_t v23 = 0;
LABEL_68:
        self = v104;
        goto LABEL_69;
      }
      if (a4)
      {
        id v102 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v53 = *MEMORY[0x1E4F502C8];
        uint64_t v130 = *MEMORY[0x1E4F28568];
        v106 = (BMOasisAnalyticsTrackingStateEvent *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"trackingState"];
        v131 = v106;
        uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v131 forKeys:&v130 count:1];
        uint64_t v23 = 0;
        *a4 = (id)[v102 initWithDomain:v53 code:2 userInfo:v54];
        id v12 = (id)v54;
        goto LABEL_68;
      }
      uint64_t v23 = 0;
      goto LABEL_99;
    }
    if (a4)
    {
      v109 = v8;
      v37 = self;
      id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v39 = *MEMORY[0x1E4F502C8];
      uint64_t v134 = *MEMORY[0x1E4F28568];
      v110 = (BMOasisAnalyticsTrackingInitializedEvent *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"trackingInitialized"];
      v135 = v110;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v135 forKeys:&v134 count:1];
      v40 = v38;
      self = v37;
      uint64_t v8 = v109;
      uint64_t v23 = 0;
      *a4 = (id)[v40 initWithDomain:v39 code:2 userInfo:v10];
LABEL_117:

      goto LABEL_118;
    }
    goto LABEL_53;
  }
  if (a4)
  {
    int v30 = a4;
    v31 = self;
    id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v33 = *MEMORY[0x1E4F502C8];
    uint64_t v136 = *MEMORY[0x1E4F28568];
    uint64_t v8 = (BMOasisAnalyticsContextSnapshotEvent *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"contextSnapshot"];
    v137[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v137 forKeys:&v136 count:1];
    v34 = v32;
    self = v31;
    uint64_t v23 = 0;
    *int v30 = (id)[v34 initWithDomain:v33 code:2 userInfo:v9];
LABEL_118:

    goto LABEL_119;
  }
  uint64_t v23 = 0;
LABEL_119:

  return v23;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMOasisAnalyticsPerceptionSLAMPayload *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_contextSnapshot)
  {
    PBDataWriterPlaceMark();
    [(BMOasisAnalyticsContextSnapshotEvent *)self->_contextSnapshot writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_trackingInitialized)
  {
    PBDataWriterPlaceMark();
    [(BMOasisAnalyticsTrackingInitializedEvent *)self->_trackingInitialized writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_trackingRecovered)
  {
    PBDataWriterPlaceMark();
    [(BMOasisAnalyticsTrackingRecoveredEvent *)self->_trackingRecovered writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_trackingState)
  {
    PBDataWriterPlaceMark();
    [(BMOasisAnalyticsTrackingStateEvent *)self->_trackingState writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_trackingLost)
  {
    PBDataWriterPlaceMark();
    [(BMOasisAnalyticsTrackingLostEvent *)self->_trackingLost writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_submapLoaded)
  {
    PBDataWriterPlaceMark();
    [(BMOasisAnalyticsSubmapLoadedEvent *)self->_submapLoaded writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_submapCreated)
  {
    PBDataWriterPlaceMark();
    [(BMOasisAnalyticsSubmapCreatedEvent *)self->_submapCreated writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_submapUpdated)
  {
    PBDataWriterPlaceMark();
    [(BMOasisAnalyticsSubmapUpdatedEvent *)self->_submapUpdated writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_relocalizationSucceeded)
  {
    PBDataWriterPlaceMark();
    [(BMOasisAnalyticsRelocalizationSucceededEvent *)self->_relocalizationSucceeded writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMOasisAnalyticsPerceptionSLAMPayload;
  id v5 = [(BMEventBase *)&v25 init];
  if (!v5) {
    goto LABEL_53;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
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
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_52;
          }
          id v20 = [[BMOasisAnalyticsContextSnapshotEvent alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_52;
          }
          uint64_t v21 = 24;
          goto LABEL_49;
        case 2u:
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_52;
          }
          id v20 = [[BMOasisAnalyticsTrackingInitializedEvent alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_52;
          }
          uint64_t v21 = 32;
          goto LABEL_49;
        case 3u:
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_52;
          }
          id v20 = [[BMOasisAnalyticsTrackingRecoveredEvent alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_52;
          }
          uint64_t v21 = 40;
          goto LABEL_49;
        case 4u:
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_52;
          }
          id v20 = [[BMOasisAnalyticsTrackingStateEvent alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_52;
          }
          uint64_t v21 = 48;
          goto LABEL_49;
        case 5u:
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_52;
          }
          id v20 = [[BMOasisAnalyticsTrackingLostEvent alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_52;
          }
          uint64_t v21 = 56;
          goto LABEL_49;
        case 6u:
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_52;
          }
          id v20 = [[BMOasisAnalyticsSubmapLoadedEvent alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_52;
          }
          uint64_t v21 = 64;
          goto LABEL_49;
        case 7u:
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_52;
          }
          id v20 = [[BMOasisAnalyticsSubmapCreatedEvent alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_52;
          }
          uint64_t v21 = 72;
          goto LABEL_49;
        case 8u:
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_52;
          }
          id v20 = [[BMOasisAnalyticsSubmapUpdatedEvent alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_52;
          }
          uint64_t v21 = 80;
          goto LABEL_49;
        case 9u:
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_52;
          }
          id v20 = [[BMOasisAnalyticsRelocalizationSucceededEvent alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_52;
          }
          uint64_t v21 = 88;
LABEL_49:
          uint64_t v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = v20;

          PBReaderRecallMark();
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_52;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_52:
  }
    uint64_t v23 = 0;
  else {
LABEL_53:
  }
    uint64_t v23 = v5;

  return v23;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self contextSnapshot];
  id v5 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self trackingInitialized];
  id v6 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self trackingRecovered];
  uint64_t v7 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self trackingState];
  uint64_t v8 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self trackingLost];
  id v9 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self submapLoaded];
  char v10 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self submapCreated];
  unsigned int v11 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self submapUpdated];
  unint64_t v12 = [(BMOasisAnalyticsPerceptionSLAMPayload *)self relocalizationSucceeded];
  uint64_t v13 = (void *)[v3 initWithFormat:@"BMOasisAnalyticsPerceptionSLAMPayload with contextSnapshot: %@, trackingInitialized: %@, trackingRecovered: %@, trackingState: %@, trackingLost: %@, submapLoaded: %@, submapCreated: %@, submapUpdated: %@, relocalizationSucceeded: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (BMOasisAnalyticsPerceptionSLAMPayload)initWithContextSnapshot:(id)a3 trackingInitialized:(id)a4 trackingRecovered:(id)a5 trackingState:(id)a6 trackingLost:(id)a7 submapLoaded:(id)a8 submapCreated:(id)a9 submapUpdated:(id)a10 relocalizationSucceeded:(id)a11
{
  id v28 = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v24 = a7;
  id v23 = a8;
  id v22 = a9;
  id v21 = a10;
  id v18 = a11;
  v29.receiver = self;
  v29.super_class = (Class)BMOasisAnalyticsPerceptionSLAMPayload;
  v19 = [(BMEventBase *)&v29 init];
  if (v19)
  {
    v19->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v19->_contextSnapshot, a3);
    objc_storeStrong((id *)&v19->_trackingInitialized, a4);
    objc_storeStrong((id *)&v19->_trackingRecovered, a5);
    objc_storeStrong((id *)&v19->_trackingState, a6);
    objc_storeStrong((id *)&v19->_trackingLost, a7);
    objc_storeStrong((id *)&v19->_submapLoaded, a8);
    objc_storeStrong((id *)&v19->_submapCreated, a9);
    objc_storeStrong((id *)&v19->_submapUpdated, a10);
    objc_storeStrong((id *)&v19->_relocalizationSucceeded, a11);
  }

  return v19;
}

+ (id)protoFields
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contextSnapshot" number:1 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"trackingInitialized", 2, 14, objc_opt_class(), v2);
  v13[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"trackingRecovered" number:3 type:14 subMessageClass:objc_opt_class()];
  v13[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"trackingState" number:4 type:14 subMessageClass:objc_opt_class()];
  v13[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"trackingLost" number:5 type:14 subMessageClass:objc_opt_class()];
  v13[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"submapLoaded" number:6 type:14 subMessageClass:objc_opt_class()];
  v13[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"submapCreated" number:7 type:14 subMessageClass:objc_opt_class()];
  v13[6] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"submapUpdated" number:8 type:14 subMessageClass:objc_opt_class()];
  v13[7] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"relocalizationSucceeded" number:9 type:14 subMessageClass:objc_opt_class()];
  v13[8] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF79B0;
}

+ (id)columns
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"contextSnapshot_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_900];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"trackingInitialized_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_902];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"trackingRecovered_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_904];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"trackingState_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_906];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"trackingLost_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_908];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"submapLoaded_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_910];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"submapCreated_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_912];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"submapUpdated_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_914];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"relocalizationSucceeded_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_916];
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

id __48__BMOasisAnalyticsPerceptionSLAMPayload_columns__block_invoke_9(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 relocalizationSucceeded];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __48__BMOasisAnalyticsPerceptionSLAMPayload_columns__block_invoke_8(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 submapUpdated];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __48__BMOasisAnalyticsPerceptionSLAMPayload_columns__block_invoke_7(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 submapCreated];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __48__BMOasisAnalyticsPerceptionSLAMPayload_columns__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 submapLoaded];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __48__BMOasisAnalyticsPerceptionSLAMPayload_columns__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 trackingLost];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __48__BMOasisAnalyticsPerceptionSLAMPayload_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 trackingState];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __48__BMOasisAnalyticsPerceptionSLAMPayload_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 trackingRecovered];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __48__BMOasisAnalyticsPerceptionSLAMPayload_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 trackingInitialized];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __48__BMOasisAnalyticsPerceptionSLAMPayload_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 contextSnapshot];
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

    uint64_t v8 = [[BMOasisAnalyticsPerceptionSLAMPayload alloc] initByReadFrom:v7];
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